;; --- Building the load path 
;; Adding the root emacs config directory to the load path
(setq root-config-dir (file-name-directory 
		       (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path root-config-dir)

(setq third-party-dir
      (file-name-as-directory (concat root-config-dir "third-party")))
(add-to-list 'load-path third-party-dir)

(defun make-third-party-dir (dirname)
  (concat third-party-dir dirname))

(defun add-third-party-dir (dirname)
  (let ((dir (make-third-party-dir dirname)))
    (add-to-list 'load-path dir)
    dir))

(add-third-party-dir "bundled")

;; Customizations for different modules
(load-library "look-and-feel")
(load-library "color-theme-init")
(load-library "magit-init")
(load-library "auto-completion-init")
(load-library "ruby-mode-init")
(load-library "python-mode-init")
(load-library "text-mode-init")
(load-library "org-mode-init")
(load-library "winmove-init")
;; Platform-dependent 
(setq os-init-file 
      (cond ((eq window-system 'mac) "carbon-mac-init")
	    ((eq window-system 'ns)  "cocoa-mac-init")
	    ((eq window-system 'w32) "win-init")
	    ((eq window-system 'x) "linux-init")))

(if os-init-file
  (load-library os-init-file))

(put 'erase-buffer 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(fill-column 80)
 '(truncate-lines t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
