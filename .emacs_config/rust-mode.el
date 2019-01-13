(add-hook 'rust-mode-hook
          (lambda ()
            (define-key rust-mode-map (kbd "M-M") #'cargo-process-build)))
