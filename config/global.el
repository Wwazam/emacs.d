(setq inhibit-startup-screen t)

(fset 'yes-or-no-p 'y-or-n-p)

(line-number-mode -1)

(menu-bar-mode -1)

(tool-bar-mode -1)
;; help window auto-focus
(setq help-window-select t) 

(scroll-bar-mode -1)

(add-to-list 'default-frame-alist
	     '(font . "Bitstream Vera Sans Mono-11"))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(if (eq system-type 'gnu/linux)
    (setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "google-chrome-stable"))

(use-package ample-theme
  :ensure t
  :config
  (load-theme 'ample t))
