(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
					 'fullboth)))

(global-set-key (kbd "<f11>") 'toggle-fullscreen)

(set-face-font (quote default) "-unknown-Ubuntu Mono-normal-normal-normal-*-21-*-*-*-m-0-iso10646-1")
(toggle-fullscreen)
