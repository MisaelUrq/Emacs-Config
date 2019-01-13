(if (not (require 'magit nil t))
    (message "magit not found")
  ;; This are globals shortcuts.
  (define-key global-map (kbd "M-p g s") (lambda ()
                                           (interactive)
                                           (split-if-only-one-window)
                                           (magit-status)))
  (define-key global-map (kbd "M-p g i")   'magit-init)
  (define-key global-map (kbd "M-p g c")   'magit-checkout)
  (define-key global-map (kbd "M-p g b")   'magit-branch-popup)
  (define-key magit-status-mode-map  (kbd "<tab>")     'magit-section-toggle))


