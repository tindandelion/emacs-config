(setq platform-init-file-name (concat "platforms/" (symbol-name system-type) ".el"))
(load (expand-file-name platform-init-file-name user-emacs-directory))

