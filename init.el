(load-theme 'wombat)

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)


(require 'package)

; List the packages you want
(setq package-list '(evil
		     window-numbering
		     org
		     org-plus-contrib
                     evil-leader
		     auto-complete
		     ranger
		     magit
		     evil-magit
		     projectile
		     ido-vertical-mode
		     smex
		     org-bullets
		     deft
		     ))

; Add Melpa as the default Emacs Package repository
; only contains a very limited number of packages
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t) 
(add-to-list 'package-archives 
             '("org" . "http://orgmode.org/elpa/") t)
; Activate all the packages (in particular autoloads)
(package-initialize)

; Update your local package index
(unless package-archive-contents
  (package-refresh-contents))

; Install all missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'evil)
(evil-mode t)

(defun peter/switch-buffer ()
  (interactive)
  (if (evil-alternate-buffer)
      (switch-to-buffer (car (evil-alternate-buffer)))
    (switch-to-buffer (other-buffer (current-buffer) t))))

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "bb" 'switch-to-buffer
  "bd" 'kill-buffer
  "fs" 'save-buffer
  "ff" 'find-file
  "qq" 'save-buffers-kill-emacs
  "o" 'other-window
  "1" 'delete-other-windows
  "ws" 'split-window-below
  "wv" 'split-window-right
  "wd" 'delete-window
  "TAB" 'peter/switch-buffer)

(require 'auto-complete)
(ac-config-default)

(require 'ranger)
(evil-leader/set-key
  "ar" 'ranger)

(require 'magit)
(require 'evil-magit)

(evil-leader/set-key
  "gs" 'magit-status)

(require 'projectile)
(projectile-global-mode)
(evil-leader/set-key
  "pp" 'projectile-switch-project
  "pf" 'projectile-find-file)

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-everywhere 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)



(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-src-fontify-natively t)

;(require 'deft)
;(setq deft-extensions '("txt" "tex" "org"))
;(setq deft-directory "~/btsync/notes")

(require 'smex)
(global-set-key (kbd "s-x") 'smex)
(global-set-key (kbd "s-X") 'smex-major-mode-commands)

(require 'window-numbering)
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
  "0" 'select-window-0
  )
 
      

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :foreground "dark cyan" :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1)))))
