;; Set up a cool color theme
(add-third-party-dir "bundled/color-theme-6.6.0") 

(defun init-zenburn-theme ()
  (add-third-party-dir "github/zenburn")
  (require 'color-theme-zenburn)
  (color-theme-zenburn))

(defun init-standard-color-theme (theme)
  (require 'color-theme)
  (color-theme-initialize)
  (apply theme '()))

(defun init-solarized-theme ()
  (add-github-library-dir "color-theme-solarized")
  (require 'color-theme)
  (require 'color-theme-solarized)
  (color-theme-solarized-dark)) 

(defun init-tomorrow-theme ()
  (add-github-library-dir "color-theme-tomorrow/GNU Emacs")
  (require 'color-theme)
  (require 'color-theme-tomorrow)
  (color-theme-tomorrow))

;(init-standard-color-theme 'color-theme-charcoal-black)
(init-zenburn-theme)
