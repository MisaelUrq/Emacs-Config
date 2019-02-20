

(add-hook 'haskell-mode-hook
          (lambda ()
            (define-key haskell-mode-map (kbd "<C-tab>") 'indent-region)
            (define-key haskell-mode-map (kbd "<C-S-tab>") 'indent-for-tab-command)
            (define-key haskell-mode-map (kbd "<S-tab>") 'indent-for-tab-command)
            (define-key haskell-mode-map (kbd "C-c c") 'haskell-interactive-bring)))
