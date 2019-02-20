(prefer-coding-system 'utf-8)
(ido-mode t)
(column-number-mode 1)
(global-auto-revert-mode 1)
(global-hl-line-mode 0)
(scroll-bar-mode -1)
(setq ido-auto-merge-work-directories-length -1)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq fixme-modes '(global-mode ;; This really does not work...
                    c++-mode c-mode emacs-lisp-mode
		    java-mode csharp-mode rust-mode
                    org-mode haskell-mode lisp-mode
                    python-mode))
(setq user-name "Misael")
(setq user-mail "misaelurquietayt@gmail.com")
(display-time)

(if (not (require 'smooth-scroll nil t))
    (message "smooth-scroll not install")
  (smooth-scroll-mode 1)
  (setq smooth-scroll/vscroll-step-size 10)
  (setq smooth-scroll/hscroll-step-size 10))

;; (if (not (require 'golden-ratio nil t))
;;     (message "golden-ratio not install")
;;   (golden-ratio-adjust 0.8)
;;   (golden-ratio-mode 1))

(move-text-default-bindings)

(add-to-list 'default-frame-alist '(font . "Liberation Mono-9"))
(set-face-attribute 'default t :font "Liberation Mono-9")

(make-face 'font-lock-fixme-face)
(make-face 'font-lock-to_do-face)
(make-face 'font-lock-note-face)
(make-face 'font-lock-important-face)
(make-face 'font-lock-study-face)
(mapc (lambda (mode)
	(font-lock-add-keywords
	 mode
	 '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
	   ("\\<\\(NOTE\\)" 1 'font-lock-note-face t)
	   ("\\<\\(IMPORTANT\\)" 1 'font-lock-important-face t)
	   ("\\<\\(STUDY\\)" 1 'font-lock-study-face t)
	   ("\\<\\(TO_DO\\)" 1 'font-lock-to_do-face t))
	 nil))
      fixme-modes)

(modify-face 'font-lock-fixme-face "red" nil nil t nil t nil nil)
(modify-face 'font-lock-to_do-face "red" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "green" nil nil t nil t nil nil)
(modify-face 'font-lock-important-face "yellow" nil nil t nil t nil nil)
(modify-face 'font-lock-study-face "deepskyblue" nil nil t nil t nil nil)

(setq casey-aquamacs (featurep 'aquamacs))
(setq casey-linux (featurep 'x))
(setq casey-win32 (not (or casey-aquamacs casey-linux)))
(setq compilation-directory-locked nil)
(when casey-aquamacs
  (setq mac-command-modifier 'meta)
  (setq x-select-enable-clipboard t)
  (setq aquamacs-save-options-on-quit 0)
  (setq special-display-regexps nil)
  (setq special-display-buffer-names nil)
  (define-key function-key-map [return] [13])
  (setq mac-command-key-is-meta t)
  (scroll-bar-mode nil)
  (setq mac-pass-command-to-system nil)
  (setq casey-makescript "./build.macosx"))
(when casey-linux
  (setq casey-makescript "./build.linux")
  (display-battery-mode 1))
(require 'compile)
(when casey-win32
  (setq casey-makescript "build.bat"))
(setq compilation-context-lines 0)
(setq compilation-error-regexp-alist
      (cons '("^\\([0-9]+>\\)?\\(\\(?:[a-zA-Z]:\\)?[^:(\t\n]+\\)(\\([0-9]+\\)) : \\(?:fatal error\\|warnin\\(g\\)\\) C[0-9]+:" 2 3 nil (4))
	    compilation-error-regexp-alist))

(setq tab-width 4)
(setq c-default-style "bsd"
      c-basic-offset 4)
(setq c-basic-offset 4)
(setq c++-basic-offset 4)
