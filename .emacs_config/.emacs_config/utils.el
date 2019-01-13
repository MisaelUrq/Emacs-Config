(defun split-if-only-one-window ()
  (interactive)
  (if (< (length (window-list)) 2)
      (split-window-horizontally)))

(defun search-token-at-point ()
  (interactive)
  (multi-occur-in-matching-buffers "." (current-word 'word)))

(defun search-token-at-point-in-project ()
  (interactive)
  (projectile-grep (current-word 'word)))

(defun find-project-directory-recursive ()
  "Recursively search for a makefile."
  (interactive)
  (if (file-exists-p casey-makescript) t
    (cd "../")
    (find-project-directory-recursive)))

(defun lock-compilation-directory ()
  "The compilation process should NOT hunt for a makefile"
  (interactive)
  (setq compilation-directory-locked t)
  (message "Compilation directory is locked."))

(defun unlock-compilation-directory ()
  "The compilation process SHOULD hunt for a makefile"
  (interactive)
  (setq compilation-directory-locked nil)
  (message "Compilation directory is roaming."))

(defun find-project-directory ()
  "Find the project directory."
  (interactive)
  (setq find-project-from-directory default-directory)
  (if compilation-directory-locked (cd last-compilation-directory)
    (cd find-project-from-directory)
    (find-project-directory-recursive)
    (setq last-compilation-directory default-directory)))

(defun toggle-frame-border ()
  ; Toggles between a window with border. Asumes you only have one frame.
  (interactive)
  (setq this-frame (car (frame-list)))
  (if (eq (frame-parameter this-frame 'undecorated) t)
      (set-frame-parameter this-frame 'undecorated nil)
    (set-frame-parameter this-frame 'undecorated t)))

(defun open-emacs-init-file ()
  (interactive)
  (find-file "~/.emacs"))

(defun make-without-asking ()
  "Make the current build."
  (interactive)
  (split-if-only-one-window)
  (if (find-project-directory) (compile casey-makescript))
  (visual-line-mode 1))

(define-globalized-minor-mode
  global-text-scale-mode
  text-scale-mode
  (lambda () (text-scale-mode 1)))

(defun global-text-scale-adjust (inc) (interactive)
       (text-scale-set 1)
       (kill-local-variable 'text-scale-mode-amount)
       (setq-default text-scale-mode-amount (+ text-scale-mode-amount inc))
       (global-text-scale-mode 1))

(defun replace-string-in-region (old-word new-word)
  "Perform a replace-string in the current region."
  (interactive "sReplace: \nsReplace: %s  With: ")
  (save-excursion (save-restriction
		    (narrow-to-region (mark) (point))
		    (beginning-of-buffer)
		    (replace-string old-word new-word))))

(defun insert-comment-with-tag-and-name (type)
  (interactive "sComment type: ")
  (if (y-or-n-p "upperline? ")
      (save-excursion
        (beginning-of-line-text)
        (newline-and-indent)
        (previous-line)))
  (comment-indent)
  (insert (format "%s(%s): " type user-name))
  (indent-for-tab-command))

(defun insert-todo ()
  (interactive)
  (comment-indent)
  (insert (format "TODO(Misael)"))
  (indent-for-tab-command))

(defun open-build-file ()
  (interactive)
  (if (find-project-directory) (find-file casey-makescript)))

(provide 'utils)
