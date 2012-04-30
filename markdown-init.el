(add-github-library-dir "markdown")

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files")
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

