;; Here I put some Mac-specific Emacs initialization code

(set-face-font 'default "-apple-monaco-medium-r-normal--15-140-72-72-m-140-mac-roman")

(blink-cursor-mode t)
(setq ns-command-modifier 'meta)

;; Maximizing the frame to fit the full screen
(set-frame-position (selected-frame) 0 0)
(set-frame-size (selected-frame) 1000 1000)

