;; Here I put some Mac-specific Emacs initialization code

(set-face-font (quote default) "-apple-Inconsolata-medium-normal-normal-*-22-*-*-*-m-0-fontset-auto1")

(blink-cursor-mode t)
(setq ns-command-modifier 'meta)

;; Maximizing the frame to fit the full screen
(set-frame-position (selected-frame) 0 0)
(set-frame-size (selected-frame) 1000 1000)

