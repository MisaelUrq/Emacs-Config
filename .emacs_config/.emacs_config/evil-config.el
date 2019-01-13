(require 'evil)

(setf evil-normal-state-cursor '(box "green4"))
(setf evil-insert-state-cursor '(box "red2"))
(setf evil-visual-state-cursor '(box "yellow"))
(setf evil-replace-state-cursor '(box "purple"))
(setf evil-motion-state-cursor '(box "blue"))
(setf evil-operator-state-cursor '(box "orange"))

(evil-mode 1)
