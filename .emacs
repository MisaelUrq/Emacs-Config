;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(load "~/.emacs_config/global.el")
(load "~/.emacs_config/utils.el")
(load "~/.emacs_config/helm-config.el")
(load "~/.emacs_config/ggtags-config.el")
(load "~/.emacs_config/key_config.el")
(load "~/.emacs_config/projectile-config.el")
(load "~/.emacs_config/magit-config.el")
(load "~/.emacs_config/rust-mode.el")
(load "~/.emacs_config/html-config.el")
(load "~/.emacs_config/elisp-config.el")
(load "~/.emacs_config/cppmode-config.el")
(load "~/.emacs_config/csharp-config.el")

(setq custom-file "~/.emacs-custom.el")
(load "~/odin-mode/odin-mode")
(load custom-file)
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
(put 'downcase-region 'disabled nil)
