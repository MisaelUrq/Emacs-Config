(defun insert-common-data (file-name)
  (insert "/* ========================================================================\n")
  (insert "   $File: $\n")
  (insert "   $Date: ")
  (insert " $\n")
  (insert "   $Revision: $\n")
  (insert (format "   $Creator: %s $\n" user-name))
  (insert "   $Notice: $\n")
  (insert "   ======================================================================== */\n")
  (insert "\n"))

(defun cpp-header-format ()
  "Format the given file as a header file."
  (interactive)
  (setq name (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
  (insert-common-data name)
  (insert "#if !defined(")
  (push-mark)
  (insert name)
  (upcase-region (mark) (point))
  (pop-mark)
  (insert "_H)\n")
  (insert "#define ")
  (push-mark)
  (insert name)
  (upcase-region (mark) (point))
  (pop-mark)
  (insert "_H\n\n\n")
  (insert "#endif"))

(defun cpp-source-format ()
  "Format the given file as a source file."
  (interactive)
  (setq name (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
  (insert-common-data name))

(defun c-insert-case (case)
  "Inserts a case with brakets so that you it can hace it's own scope to work with variables."
  (interactive "sCase: ")
  (setq inital-point (point))
  (insert (format "case %s:\n{\n\n} break;" case))
  (setq final-point (point))
  (indent-region inital-point final-point)
  (backward-paragraph)
  (indent-for-tab-command))

(defun casey-find-corresponding-file ()
  "Find the file that corresponds to this one."
  (interactive)
  (setq CorrespondingFileName nil)
  (setq BaseFileName (file-name-sans-extension buffer-file-name))
  (if (string-match "\\.c" buffer-file-name)
      (setq CorrespondingFileName (concat BaseFileName ".h")))
  (if (string-match "\\.h" buffer-file-name)
      (if (file-exists-p (concat BaseFileName ".c")) (setq CorrespondingFileName (concat BaseFileName ".c"))
        (setq CorrespondingFileName (concat BaseFileName ".cpp"))))
  (if (string-match "\\.hin" buffer-file-name)
      (setq CorrespondingFileName (concat BaseFileName ".cin")))
  (if (string-match "\\.cin" buffer-file-name)
      (setq CorrespondingFileName (concat BaseFileName ".hin")))
  (if (string-match "\\.cpp" buffer-file-name)
      (setq CorrespondingFileName (concat BaseFileName ".h")))
  (if CorrespondingFileName (find-file CorrespondingFileName)
    (error "Unable to find a corresponding file")))

(defun casey-find-corresponding-file-other-window ()
  "Find the file that corresponds to this one."
  (interactive)
  (find-file-other-window buffer-file-name)
  (casey-find-corresponding-file)
  (other-window -1))

(defun remedy-break-point (line-number)
  (interactive "sLine:")
  (shell-command-on-region
   (point-min)
   (point-max)
   (format "remedybg.exe add-breakpoint-at-file %s %s" (buffer-file-name) line-number)))

(defun remedy-break-point-at-current-line ()
  (interactive)
  (shell-command-on-region
   (point-min)
   (point-max)
   (format "remedybg.exe add-breakpoint-at-file %s %s" (buffer-file-name) (nth 1 (split-string (what-line) " ")))))

(defun remedy-open-file ()
  (interactive)
  (shell-command-on-region
   (point-min)
   (point-max)
   (format "remedybg.exe open-file %s %s" (buffer-file-name) (nth 1 (split-string (what-line) " ")))))

(defun remedy-break-at-funtion-name (function-name)
  (interactive "sFunction: ")
  (shell-command-on-region
   (point-min)
   (point-max)
   (format "remedybg.exe add-breakpoint-at-function %s" function-name)))

(add-hook 'c++-mode-hook
          (lambda ()
            (define-key c++-mode-map (kbd "C-c c") 'c-insert-case)
            (define-key c++-mode-map (kbd "C-c f") 'casey-find-corresponding-file)
            (define-key c++-mode-map (kbd "C-c F") 'casey-find-corresponding-file-other-window)
            (define-key c++-mode-map (kbd "C-c n") 'c-down-conditional-with-else)
            (define-key c++-mode-map (kbd "C-c a") 'c-beginning-of-defun)
            (define-key c++-mode-map (kbd "C-x c i") 'helm-semantic-or-imenu)
            (define-key c++-mode-map (kbd "C-x c I") 'helm-imenu-in-all-buffers)
            (define-key c++-mode-map (kbd "C-c e") 'c-end-of-defun)
            (define-key c++-mode-map (kbd "<f8>") 'remedy-break-at-funtion-name)
            (define-key c++-mode-map (kbd "<f7>") 'remedy-open-file)
            (define-key c++-mode-map (kbd "<f9>") 'remedy-break-point-at-current-line)))

(add-hook 'c-mode-hook
          (lambda ()
            (define-key c-mode-map (kbd "C-c f") 'casey-find-corresponding-file)
            (define-key c-mode-map (kbd "C-c F") 'casey-find-corresponding-file-other-window)
            (define-key c-mode-map (kbd "C-c c") 'c-insert-case)
            (define-key c-mode-map (kbd "C-c n") 'c-down-conditional-with-else)
            (define-key c-mode-map (kbd "C-c a") 'c-beginning-of-defun)
            (define-key c-mode-map (kbd "C-x c i") 'helm-semantic-or-imenu)
            (define-key c-mode-map (kbd "C-x c I") 'helm-imenu-in-all-buffers)
            (define-key c-mode-map (kbd "C-c e") 'c-end-of-defun)
            (define-key c-mode-map (kbd "<f8>") 'remedy-break-at-funtion-name)
            (define-key c-mode-map (kbd "<f7>") 'remedy-open-file)
            (define-key c-mode-map (kbd "<f9>") 'remedy-break-point-at-current-line)))
