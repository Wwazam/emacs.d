
(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode)
  (evil-leader/set-key
    "1" 'select-window-1
    "2" 'select-window-2
    "3" 'select-window-3
    "4" 'select-window-4
    "5" 'select-window-5
    "6" 'select-window-6
    "7" 'select-window-7
    "8" 'select-window-8
    "9" 'select-window-9
    "0" 'select-window-0))

(use-package popwin
  :ensure t
  :config
  (setq popwin:popup-window-height 25)
  (push '("*Backtrace*" :regexp nil) popwin:special-display-config)
  (push '("*Warnings*" :regexp nil) popwin:special-display-config)
  (popwin-mode 1))

;; helm alway at bottom
(add-to-list 'display-buffer-alist
                    `(,(rx bos "*helm" (* not-newline) "*" eos)
                         (display-buffer-in-side-window)
                         (inhibit-same-window . t)
                         (window-height . 0.4)))