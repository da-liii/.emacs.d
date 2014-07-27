(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/lisps/")

;; Default Settings
(prefer-coding-system 'utf-8)
;;(setq explicit-shell-file-name "/bin/bash")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-tab-always-indent nil)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(global-rainbow-delimiters-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/todo.org")))
 '(org-agenda-include-diary t)
 '(org-support-shift-select t)
 '(tool-bar-mode nil))

	

;; inits
(require 'init-markdown)
(require 'init-cpp) ;; c & cpp
(require 'init-appearance)
(require 'init-scheme)
(require 'init-utils)
(require 'init-edit)
(require 'init-keymap)
(require 'init-shell)
(require 'init-org)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark violet"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "yellow1"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "goldenrod1"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "SeaGreen4"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "purple4"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "VioletRed2")))))

