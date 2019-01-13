(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(define-key global-map (kbd "M-p p") 'helm-projectile)
(define-key global-map (kbd "M-p c") 'helm-projectile-switch-project)
(define-key global-map (kbd "M-p r") 'helm-projectile-recentf)
(define-key global-map (kbd "M-p f") 'helm-projectile-find-file)
(define-key global-map (kbd "M-p s") 'helm-grep-do-git-grep)
(define-key global-map (kbd "M-p b") 'helm-projectile-switch-to-buffer)