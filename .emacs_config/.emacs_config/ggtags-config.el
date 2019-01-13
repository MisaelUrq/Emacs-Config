(require 'ggtags)

(ggtags-mode t)

(define-key global-map (kbd "C-c t d") 'ggtags-find-definition)
(define-key global-map (kbd "C-c t s") 'helm-gtags-find-symbol)
(define-key global-map (kbd "C-c t f") 'helm-gtags-find-tag)
