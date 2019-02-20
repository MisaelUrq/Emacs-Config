(if (not (require 'emmet-mode nil t)
         (require 'web-mode nil t))
    (message "Emmet-mode pr web-mode not found")
  (add-hook 'html-mode-hook (lambda ()
                              (web-mode)
                              (emmet-mode)
                              (define-key web-mode-map (kbd "C-c j") 'emmet-preview)
                              (define-key web-mode-map (kbd "C-c w") 'emmet-wrap-with-markup))))
