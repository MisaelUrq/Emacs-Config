
(add-hook 'kotlin-mode-hook
          (lambda ()
            (define-key kotlin-mode-map (kbd "<tab>") 'dabbrev-expand)))
