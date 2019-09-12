(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t)
            (define-key org-mode-map (kbd "C-<tab>") 'dabbrev-expand)))
