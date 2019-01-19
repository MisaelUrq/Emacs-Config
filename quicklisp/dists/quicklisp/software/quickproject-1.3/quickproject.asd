;;;; quickproject.asd

(asdf:defsystem #:quickproject
  :description "Creates the skeleton of a new Common Lisp project"
           :version "1.3"
  :depends-on (#:cl-fad
               #:html-template)
  :serial t
  :components ((:file "package")
               (:file "quickproject")))
