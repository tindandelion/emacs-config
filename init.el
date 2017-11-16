
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


