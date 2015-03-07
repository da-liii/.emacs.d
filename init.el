(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'load-path "~/.emacs.d/elpa/moe-theme-20141126.1713/")
(add-to-list 'load-path "~/.emacs.d/elpa/powerline-20141125.726/")
(add-to-list 'load-path "~/.emacs.d/elpa/highlight-tail-20140416.141/")
(add-to-list 'load-path "~/.emacs.d/elpa/tabbar-20141109.143/")
(add-to-list 'load-path "~/.emacs.d/elpa/tabbar-ruler-20140905.1543/")
(add-to-list 'load-path "~/.emacs.d/elpa/rainbow-delimiters-20141205.213/")
(add-to-list 'load-path "~/.emacs.d/elpa/paredit-20141206.954/")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20141208.809/")
(add-to-list 'load-path "~/.emacs.d/elpa/popup-20141213.541/")
(add-to-list 'load-path "~/.emacs.d/elpa/helm-20150307.549/")
	
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-edit)
(require 'init-utils)
(require 'init-markdown)
(require 'init-shell)
(require 'init-org)
(require 'init-appearance)
(require 'init-cpp) ;; c & cpp
(require 'init-scheme)
(require 'init-elisp)
(require 'init-python)
(require 'init-ruby)
(require 'init-java)
(require 'init-keymap)

;; Default Settings
(prefer-coding-system 'utf-8)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-tab-always-indent nil)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(minimap-window-location (quote right))
 '(org-agenda-files (quote ("~/todo.org")))
 '(org-agenda-include-diary t)
 '(org-support-shift-select t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#f1c40f"))))
 '(rainbow-delimiters-depth-10-face ((t (:foreground "#2ecc71"))))
 '(rainbow-delimiters-depth-11-face ((t (:foreground "#c0392b"))))
 '(rainbow-delimiters-depth-12-face ((t (:foreground "#1abc9c"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#2e8ece"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#e67e22"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#27ae60"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#e74c3c"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#16a085"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#f39c12"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#3498db"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#d35400")))))

(setq visible-bell t)
(server-start)
