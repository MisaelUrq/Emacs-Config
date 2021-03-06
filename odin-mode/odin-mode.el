(defvar odin-mode-hook nil)
(defvar odin-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for Odin major mode")

(add-to-list 'auto-mode-alist '("\\.odin\\'" . odin-mode))

(defconst odin-font-lock-keywords-1
  (list
   '("\\<\\(import\\|export\\|foreign\\|if\\|else\\|when\\|for\\|in\\|defer\\|switch\\|return\\|const\\|fallthrough\\|break\\|continue\\|case\\|static\\|dynamic\\|using\\|do\\|inline\\|no_inline\\|asm\\|yield\\|await\\|distinct\\|proc\\)\\>" . font-lock-keyword-face)
   '("\\<\\(context\\|cast\\|transmute\\|vector\\)\\>" . font-lock-builtin-face))
  "Minimal highlightning for Odin major mode")

(defconst odin-font-lock-keywords-2
  (append odin-font-lock-keywords-1
	  (list
	   '("\\<\\(type\\|macro\\|struct\\|enum\\|union\\|map\\|bit_field\\)\\>" . font-lock-keyword-face)
	   '("\\<\\(size_of\\|align_of\\|offset_of\\|type_of\\|type_info_of\\)\\>" . font-lock-builtin-face)
	   '("\\<\\(true\\|false\\|nil\\)\\>" . font-lock-constant-face)))
  "Additional keywords to highlight for Odin major mode")

(defconst odin-font-lock-keywords-3
  (append odin-font-lock-keywords-2
	  (list
	   '("\\<\\(i8\\|i16\\|i32\\|i64\\|int\\|u8\\|u16\\|u32\\|u64\\|uint\\|uintptr\\|f16\\|f32\\|f64\\|complex32\\|complex64\\|complex128\\|bool\\|b8\\|b16\\|b32\\|b64\\|byte\\|string\\|rune\\|rawptr\\|any\\)\\>" . font-lock-type-face)))
  "Highlightning for basic types in Odin major mode")

(defvar odin-font-lock-keywords odin-font-lock-keywords-3
  "Default highlightning level for Odin major mode")

(defun odin-indent-line ()
  "Indent current line as Odin code"
  (interactive)
  (beginning-of-line)
  (if (bobp)
      (indent-line-to 0))
    (let ((not-indented t) cur-indent)
       (if (looking-at ".*}")
         (progn
           (save-excursion
             (forward-line -1)
             (setq cur-indent (- (current-indentation) default-tab-width)))
             (if (< cur-indent 0)
               (setq cur-indent 0)))
        (save-excursion 
          (while not-indented
            (forward-line -1)
            (if (looking-at ".*}")
                (progn
                  (setq cur-indent (current-indentation))
                  (setq not-indented nil))
              (if (looking-at ".*{")
                  (progn
                    (setq cur-indent (+ (current-indentation) default-tab-width))
                    (setq not-indented nil))
                (if (bobp)
                    (setq not-indented nil)))))))
      (if cur-indent
          (indent-line-to cur-indent)
        (indent-line-to 0))))

(defvar odin-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?_ "w" st)
    (modify-syntax-entry ?/ ". 124b" st)
    (modify-syntax-entry ?* ". 23" st)
    (modify-syntax-entry ?\n "> b" st)
    st)
  "Syntax table for the Odin major mode")

(defun odin-mode ()
  "Major mode for the Odin programming language"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table odin-mode-syntax-table)
  (use-local-map odin-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(odin-font-lock-keywords))
  (set (make-local-variable 'indent-line-function) 'odin-indent-line)
  
  (setq major-mode 'odin-mode)
  (setq mode-name "Odin")
  (run-hooks 'odin-mode-hook))

(provide 'odin-mode)




