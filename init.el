;; Load Path
(setq dotfiles-dir (file-name-directory 
		    (or (buffer-file-name) load-file-name)))

(setq third-party (concat dotfiles-dir "third-party/"))
(add-to-list 'load-path third-party)

(defun third-party-dir (dirname)
  (concat third-party dirname))

(defun add-third-party-dir (dirname)
  (let ((dir (third-party-dir dirname)))
    (add-to-list 'load-path dir)
    dir))

(defun load-customization-file (filename)
  (load-file (concat dotfiles-dir filename)))

;; Customizations for different modules
(load-customization-file "look-and-feel.el")
(load-customization-file "color-theme-init.el")
(load-customization-file "magit-init.el")
(load-customization-file "tab-completion.el")
(load-customization-file "ruby-mode-init.el")
(load-customization-file "python-mode-init.el")
(load-customization-file "text-mode-init.el")
(load-customization-file "org-mode-init.el")
;; Platform-dependent 
(setq os-init-file 
      (cond ((eq window-system 'mac) "carbon-mac-init.el")
	    ((eq window-system 'ns)  "cocoa-mac-init.el")
	    ((eq window-system 'w32) "win-init.el")
	    ((eq window-system 'x) "linux-init.el")))

(if os-init-file
  (load-file (concat dotfiles-dir os-init-file)))

(put 'erase-buffer 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(fill-column 80))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
