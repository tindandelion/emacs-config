;; Initialization for yasnippet 
(add-bundled-library-dir "yasnippet-0.6.1c")
(require 'yasnippet)

(setq yas/trigger-key "M-/")
(yas/initialize)
(yas/load-directory (concat root-config-dir "snippets"))
