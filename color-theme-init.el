;; Set up a cool color theme
(add-third-party-dir "bundled/color-theme-6.6.0") 

(defun init-zenburn-theme ()
  (add-third-party-dir "github/zenburn")
  (require 'color-theme-zenburn)
  (color-theme-zenburn))

(defun init-deepblue-theme ()
  (require 'color-theme)
  (color-theme-initialize)
  (color-theme-deep-blue))

(defun init-solarized-theme ()
  (add-github-library-dir "color-theme-solarized")
  (require 'color-theme)
  (require 'color-theme-solarized)
  (color-theme-initialize)
  (color-theme-solarized-light)) 

(init-solarized-theme)


