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
