(deftheme zonokai-blue
  "Created 2019-02-11.")

(custom-theme-set-faces
 'zonokai-blue
 '(default ((t (:family "Liberation Mono" :foundry "outline" :width normal :height 90 :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#eee" :background "#011827" :stipple nil :inherit nil))))
 '(cursor ((t (:invserse-video t :background "#A6E22E" :foreground "#011827"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif" :foundry "outline" :width normal :height 98 :weight normal :slant normal))))
 '(escape-glyph ((t (:background "#111d3c" :foreground "#FFF"))))
 '(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:weight bold :foreground "#A6E22E"))))
 '(highlight ((t (:foreground "#8aae9b" :background "#005d08bb0e31"))))
 '(region ((t (:foreground "#d931d931d931" :background "#000000000000"))))
 '(shadow ((t (:background "#011827" :foreground "#200c3d795063"))))
 '(secondary-selection ((t (:foreground "#CC1514" :background "#144083"))))
 '(trailing-whitespace ((t (:background "#bb2a15"))))
 '(font-lock-builtin-face ((t (:weight bold :foreground "#FF5C40"))))
 '(font-lock-comment-delimiter-face ((t (:slant italic :foreground "#74c0a7b7c87b"))))
 '(font-lock-comment-face ((t (:weight bold :slant italic :foreground "#74c0a7b7c87b"))))
 '(font-lock-constant-face ((t (:weight bold :foreground "#E2D511"))))
 '(font-lock-doc-face ((t (:foreground "#606060" :inherit (font-lock-string-face)))))
 '(font-lock-function-name-face ((t (:weight bold :foreground "#00FFDA"))))
 '(font-lock-keyword-face ((t (:weight bold :foreground "#3D7599"))))
 '(font-lock-negation-char-face ((t (:weight bold :foreground "#E2D511" :inherit (font-lock-warning-face)))))
 '(font-lock-preprocessor-face ((t (:foreground "#200c3d795063" :inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:weight bold :foreground "#A6E22E" :inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:weight bold :foreground "#E2D511" :inherit (bold)))))
 '(font-lock-string-face ((t (:slant italic :foreground "#E318FF"))))
 '(font-lock-type-face ((t (:weight bold :foreground "#00FFDA"))))
 '(font-lock-variable-name-face ((t (:foreground "#A6E22E"))))
 '(font-lock-warning-face ((t (:weight bold :underline (:color foreground-color :style line) :background "#011827" :foreground "#E2D511"))))
 '(button ((t (:weight bold :underline (:color foreground-color :style line) :foreground "#A6E22E" :background "#011827" :inherit (link)))))
 '(link ((t (:underline (:color foreground-color :style line) :foreground "#00FFDA"))))
 '(link-visited ((t (:foreground "#A6E22E" :inherit (link)))))
 '(fringe ((t (:background "#009e0ee0182d" :foreground "#eee"))))
 '(header-line ((t (:box nil :foreground "#eee" :background "#023658" :inherit (mode-line)))))
 '(tooltip ((t (:foreground "#000000000000" :background "#00009999834f" :inherit (variable-pitch)))))
 '(mode-line ((t (:height 85 :weight bold :box nil :foreground "#eee" :background "#000000000000"))))
 '(mode-line-buffer-id ((t (:weight bold :box nil :foreground "#A6E22E"))))
 '(mode-line-emphasis ((t (:weight bold :foreground "#a7d3bc"))))
 '(mode-line-highlight ((t (:weight bold :box nil :foreground "#00FFDA" :background "#011827"))))
 '(mode-line-inactive ((t (:weight normal :box nil :foreground "#9edd3b" :background "#009e0ee0182d" :inherit (mode-line)))))
 '(isearch ((t (:weight bold :background "#A6E22E" :foreground "#011827"))))
 '(isearch-fail ((t (:weight bold :background "#CC1514" :foreground "#011827"))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:background "#3e4146" :foreground "#98c0ab"))))
 '(match ((t (:background "#023658"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch))))))

(provide-theme 'zonokai-blue)
