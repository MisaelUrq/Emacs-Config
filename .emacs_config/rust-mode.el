(add-hook 'rust-mode-hook
          (lambda ()
            (define-key rust-mode-map (kbd "M-M") #'cargo-process-build)
            (define-key rust-mode-map (kbd "C-c C-c") 'comment-line)))
