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

;; Platform-dependent 
(setq os-init-file 
      (cond ((eq window-system 'mac) "carbon-mac-init.el")
	    ((eq window-system 'ns)  "cocoa-mac-init.el")
	    ((eq window-system 'w32) "win-init.el")
	    ((eq window-system 'x) "linux-init.el")))

(if os-init-file
  (load-file (concat dotfiles-dir os-init-file)))



(put 'erase-buffer 'disabled nil)
