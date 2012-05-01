(add-github-library-dir "coffee-mode")

(autoload 'coffee-mode "coffee-mode" "Major mode for editing Markdown files")
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
