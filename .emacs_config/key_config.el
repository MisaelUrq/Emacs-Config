(require 'utils)

(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key helm-map (kbd "<C-right>") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "<C-left>")  'helm-select-action) ; list actions using C-z

(define-key global-map  (kbd "C-c d s") 'neotree-show)
(define-key global-map  (kbd "C-c d h") 'neotree-hide)
(define-key global-map (kbd "<tab>") 'dabbrev-expand)
(define-key minibuffer-local-map (kbd "<tab>") 'minibuffer-complete)
(define-key minibuffer-local-map (kbd "<S-tab>") 'dabbrev-expand)
(define-key global-map (kbd "<C-tab>") 'indent-region)
(define-key global-map (kbd "<C-S-tab>") 'indent-for-tab-command)
(define-key global-map (kbd "<S-tab>") 'indent-for-tab-command)
(define-key global-map (kbd "M-m") 'make-without-asking)

(define-key global-map (kbd "C-x C-s") (lambda ()
                                       (interactive)
                                       (delete-trailing-whitespace)
                                       (save-buffer)))

(define-key global-map (kbd "M-0")
  '(lambda () (interactive)
     (global-text-scale-adjust (- text-scale-mode-amount))
     (global-text-scale-mode -1)))

(define-key global-map (kbd "M-+")
  '(lambda () (interactive) (global-text-scale-adjust 1)))

(define-key global-map (kbd "M--")
  '(lambda () (interactive) (global-text-scale-adjust -1)))

(define-key global-map (kbd "C-'") 'insert-todo)
(define-key global-map (kbd "C-?") 'insert-comment-with-tag-and-name)
(define-key global-map "\e[" 'start-kbd-macro)
(define-key global-map "\e]" 'end-kbd-macro)
(define-key global-map "\e'" 'call-last-kbd-macro)

(global-set-key (kbd "C-m") nil)
(global-set-key (kbd "C-m n") 'mc/mark-next-word-like-this)
(global-set-key (kbd "C-m p") 'mc/mark-previous-word-like-this)
(global-set-key (kbd "C-m P") 'mc/mark-pop)
(global-set-key (kbd "C-m a") 'mc/mark-all-words-like-this)
(global-set-key (kbd "C-m A") 'mc/mark-all-words-like-this-in-defun)
(global-set-key (kbd "C-m r") 'mc/mark-all-in-region)
(global-set-key (kbd "C-m R") 'mc/mark-all-in-region-regexp)

(global-set-key (kbd "<return>") 'newline)

(load-library "view")
(define-key global-map "\eN" 'previous-error)
(define-key global-map "\en" 'next-error)
(define-key global-map "\e:" 'View-back-to-mark)
(define-key global-map "\e;" 'exchange-point-and-mark)

(define-key global-map [f12] 'toggle-frame-border)
(define-key global-map [f8] 'first-error)
(define-key global-map [f9] 'previous-error)
(define-key global-map [f10] 'next-error)
(define-key global-map [f11] 'toggle-frame-fullscreen)
