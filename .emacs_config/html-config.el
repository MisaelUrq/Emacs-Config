(if (not (require 'emmet-mode nil t))
    (message "Emmet-mode not found")
  (add-hook 'html-mode-hook (lambda ()
                              (emmet-mode)
                              (define-key html-mode-map (kbd "C-c j") 'emmet-preview)
                              (define-key html-mode-map (kbd "C-c w") 'emmet-wrap-with-markup))))