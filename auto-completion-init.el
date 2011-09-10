(require 'auto-complete)
(global-auto-complete-mode t)

(setq ac-auto-start nil)
(global-set-key "\t" 'ac-start)

(setq ac-dwim t)

(define-key ac-complete-mode-map "\C-m" 'ac-complete)

(defface ac-yasnippet-candidate-face
  '((t (:background "sandybrown" :foreground "black")))
  "Face for yasnippet candidate.")

(defface ac-yasnippet-selection-face
  '((t (:background "coral3" :foreground "white"))) 
  "Face for the yasnippet selected candidate.")

(defvar ac-source-yasnippet
  '((candidates . ac-yasnippet-candidate)
    (action . yas/expand)
    (limit . 3)
    (candidate-face . ac-yasnippet-candidate-face)
    (selection-face . ac-yasnippet-selection-face)) 
  "Source for Yasnippet.")

(setq-default ac-sources '(ac-source-words-in-all-buffer))
