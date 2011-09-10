;; Initialization for yasnippet 
(add-bundled-library-dir "yasnippet-0.6.1c")
(require 'yasnippet)

(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
(yas/initialize)
(yas/load-directory (concat root-config-dir "snippets"))

