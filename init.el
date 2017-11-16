
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq exec-path (cons "/usr/local/bin" exec-path))

(load (expand-file-name "packages.el" user-emacs-directory))
(load (expand-file-name "editor.el" user-emacs-directory))
(load (expand-file-name "platforms.el" user-emacs-directory))
(load (expand-file-name "modes.el" user-emacs-directory))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (volatile-highlights solarized-theme sml-mode smex rvm rspec-mode rainbow-delimiters racket-mode markdown-mode magit groovy-mode expand-region dockerfile-mode clojure-mode cl-lib auto-indent-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
