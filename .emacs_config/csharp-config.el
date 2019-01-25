(add-hook 'csharp-mode-hook
          (lambda ()
            (define-key csharp-mode-map (kbd "C-c c") 'c-insert-case)
            (define-key csharp-mode-map (kbd "C-c n") 'c-down-conditional-with-else)
            (define-key csharp-mode-map (kbd "C-c a") 'c-beginning-of-defun)
            (define-key csharp-mode-map (kbd "C-c e") 'c-end-of-defun)))
