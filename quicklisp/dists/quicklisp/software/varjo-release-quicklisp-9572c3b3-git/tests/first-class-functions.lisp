(in-package :varjo.tests)
(5am:in-suite first-class-func-tests)

;;------------------------------------------------------------
;; Helper data

(varjo:add-external-function
 'ext-int-fncaller '((fn (function (:int) :int)) (ham :int)) nil
 `((funcall fn ham)))

(varjo:add-external-function
 'ext-return-int '() nil
 `(10))

(varjo:v-def-glsl-template-fun foop (&rest a) "foop(~{~a~^,~})"
                               (&rest :float) :int)

(varjo:v-def-glsl-template-fun foop (&rest a) "ifoop(~{~a~^,~})"
                               (&rest :int) :int)

(varjo:v-def-glsl-template-fun boop (a &rest b) "boop(~a~{,~a~})"
                               (:float &rest :float) :int)

(varjo:v-def-glsl-template-fun boop (a &rest b) "boop(~a~{,~a~})"
                               (:int &rest :int) :int)

;;------------------------------------------------------------
;; Tests

(5am:def-test f-c-func-0 (:suite first-class-func-tests)
  (finishes-p
   (compile-vert () :410 nil
     (let ((fn (labels ((test ((x :int)) x))
                 #'test)))
       (v! 0 0 0 0)))))

(5am:def-test f-c-func-1 (:suite first-class-func-tests)
  (finishes-p
   (compile-vert () :410 nil
     (let ((fn (labels ((test ((x :int)) x))
                 #'test)))
       (funcall fn 10)
       (v! 0 0 0 0)))))

(5am:def-test f-c-func-2 (:suite first-class-func-tests)
  (glsl-doesnt-contain-p "FN;"
    (compile-vert () :410 nil
      (let ((fn (labels ((test ((x :int)) x))
                  #'test)))
        fn
        (v! 0 0 0 0)))))

(5am:def-test f-c-func-3 (:suite first-class-func-tests)
  (glsl-doesnt-contain-p "FN;"
    (compile-vert () :410 nil
      (let ((fn (labels ((test ((x :int)) x))
                  #'test)))
        (labels ((foo ((ffn (function (:int) :int)))
                   (funcall ffn 10)))
          (foo fn))
        (v! 0 0 0 0)))))

(5am:def-test f-c-func-4 (:suite first-class-func-tests)
  (signals varjo-conditions:closures-not-supported
    (compile-vert () :410 nil
      (let* ((y 10)
             (fn (labels ((test ((x :int)) (* y x)))
                   #'test)))
        (v! 0 0 0 0)))))

(5am:def-test f-c-func-5 (:suite first-class-func-tests)
  (signals varjo-conditions:cross-scope-mutate
    (compile-vert () :410 nil
      (let* ((y 10)
             (fn (labels ((test ((x :int))
                            (setf y 2)
                            x))
                   #'test)))
        (funcall fn 10)
        (v! 0 0 0 0)))))

(5am:def-test f-c-func-6 (:suite first-class-func-tests)
  (signals varjo-conditions:cross-scope-mutate
    (compile-vert () :410 nil
      (let* ((y 10)
             (fn (labels ((test ((x :int)) x))
                   #'test)))
        (labels ((foo ((ffn (function (:int) :int)))
                   (setf y 2)
                   (funcall ffn 10)))
          (foo fn))
        (v! 0 0 0 0)))))

(5am:def-test f-c-func-7 (:suite first-class-func-tests)
  (signals varjo-conditions:symbol-unidentified
    (compile-vert () :410 nil
      (labels ((foo ((ffn (function (:int) :int)))
                 (funcall ffn y)))
        (let ((y 10))
          (foo (lambda ((a :int)) a))))
      (v! 0 0 0 0))))

(5am:def-test f-c-func-8 (:suite first-class-func-tests)
  (finishes-p
   (compile-vert () :410 nil
     (let ((fn (labels ((test ((x :int)) x))
                 #'test)))
       (labels ((foo ((ffn (function (:int) :int)))
                  (funcall ffn 10)))
         (foo fn))
       (v! 0 0 0 0)))))

(5am:def-test f-c-func-9 (:suite first-class-func-tests)
  (finishes-p
   (compile-vert ((a :int)) :410 nil
     (let ((x 1)
           (fn (lambda () (lambda ((x :float)) (* x 2)))))
       (v! 0 0 0 (funcall (funcall fn) x))))))

(5am:def-test f-c-func-10 (:suite first-class-func-tests)
  (finishes-p
   (compile-vert ((a :int)) :410 nil
     (let ((x 1))
       (labels ((fn ((thr (function (:float) :float)) (x :int))
                  (+ 1 x 3)
                  thr))
         (v! 0 0 0 (funcall (fn (lambda ((x :float)) (* x 2)) 10)
                            x)))))))

(5am:def-test f-c-func-11 (:suite first-class-func-tests)
  (finishes-p
   (compile-vert ((a :int)) :410 nil
     (labels ((fn ((x :int)) (* 2 x)))
       (ext-int-fncaller #'fn 10)
       (v! 0 0 0 0)))))

(5am:def-test f-c-func-12 (:suite first-class-func-tests)
  (finishes-p
   (compile-vert () :410 nil
     (let ((x 10)
           (fn #'sin))
       (funcall fn 10)
       (v! 1 2 3 4)))))

(5am:def-test f-c-func-13 (:suite first-class-func-tests)
  (finishes-p
   (compile-vert () :410 nil
     (flet ((some-func ((fn (function (:float) :float)))
              (funcall fn 10s0)))
       (let ((fn #'sin))
         (some-func fn)
         (v! 1 2 3 4))))))

(5am:def-test f-c-func-14 (:suite first-class-func-tests)
  (finishes-p
   (compile-vert () :410 nil
     (let ((fn #'ext-return-int))
       (v! 0 0 0 0)))))

(5am:def-test f-c-func-15 (:suite first-class-func-tests)
  (finishes-p
   (compile-vert () :410 nil
     (if (< 1 10)
         #'sin
         #'(cos :float))
     (v! 0 0 0 0))))

(5am:def-test f-c-func-16 (:suite first-class-func-tests)
  (glsl-contains-1-of-all-p  ("void FN\\(int X1\\);"
                              "float LMBDA\\(float X0\\);")
   (compile-vert ((a :int)) :410 nil
     (let ((x 1))
       (labels ((fn ((thr (function (:float) :float)) (x :int))
                  (+ 1 x 3)
                  thr))
         (v! 0 0 0 (funcall (fn (lambda ((x :float)) (* x 2)) 10)
                            x)))))))

(5am:def-test f-c-func-17 (:suite first-class-func-tests)
  ;; this needs a new home. doesnt belong in this suite
  (finishes-p-no-test-compile
   (compile-vert () :410 nil
     (foop 1)
     (foop .1)
     (foop 1 2 3)
     (foop .1 .2 .3)
     (v! 1 2 3 4))))

(5am:def-test f-c-func-18 (:suite first-class-func-tests)
  ;; this needs a new home. doesnt belong in this suite
  (finishes-p-no-test-compile
   (compile-vert () :410 nil
     (boop 1)
     (boop .1)
     (boop 1 2 3)
     (boop .1 .2 .3)
     (v! 1 2 3 4))))

(5am:def-test f-c-func-19 (:suite first-class-func-tests)
  (finishes-p-no-test-compile
   (compile-vert () :410 nil
     (let ((fn0 #'(foop :int))
           (fn1 #'(boop :int :int)))
       (funcall fn0 1)
       (funcall fn1 1 2))
     (v! 1 2 3 4))))

(5am:def-test f-c-func-20 (:suite first-class-func-tests)
  (finishes-p-no-test-compile
   (compile-vert () :410 nil
     (let ((fn0 #'(foop :int))
           (fn1 #'(boop :int :int)))
       (funcall fn0 1)
       (funcall fn1 1 2))
     (v! 1 2 3 4))))

(5am:def-test f-c-func-21 (:suite first-class-func-tests)
  (finishes-p-no-test-compile
   (compile-vert () :410 nil
     (let ((fn0 #'foop))
       (funcall fn0 1)
       (funcall fn0 1.0 2.0 3.0 4.0 5.0 6.0 7.0)
       (funcall fn0 1.0 10))
     (v! 1 2 3 4))))

(5am:def-test f-c-func-22 (:suite first-class-func-tests)
  (signals varjo-conditions:cannot-take-reference-to-&rest-func
    (compile-vert () :410 nil
      (let ((fn0 #'(foop &rest :int)))
        (funcall fn0 1))
      (v! 1 2 3 4))))

(5am:def-test f-c-func-23 (:suite first-class-func-tests)
  (signals varjo-conditions:no-valid-function
    (compile-vert () :410 nil
      (let ((fn0 #'(foop :int))
            (fn1 #'(boop :int :int)))
        (funcall fn0 1 2)
        (funcall fn1 1))
      (v! 1 2 3 4))))
