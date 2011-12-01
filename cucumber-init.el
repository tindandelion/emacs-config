(add-github-library-dir "cucumber")

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(yas/load-directory (make-third-party-dir "github/cucumber/snippets"))

