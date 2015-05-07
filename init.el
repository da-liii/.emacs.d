(require 'package)

(setq jpk-package-list
      '(magit
	moe-theme
	powerline
	rainbow-delimiters
	tabbar-ruler
	fill-column-indicator
	markdown-mode
	paredit
	paredit-everywhere
	indent-guide
	hl-line
	hl-sexp
	company
	company-c-headers
	keyfreq
	auto-complete-clang
	evil
	helm
	function-args))

;; package-install-auto
(defun jpk-package-list-install ()
  (interactive)
  (package-initialize)
  (when (not package-archive-contents)
    (package-refresh-contents))
  (dolist (pkg jpk-package-list)
    (when (and (not (package-installed-p pkg))
	       (assoc pkg package-archive-contents))
      (package-install pkg))))


;; list the unaccounted packages
(defun package-list-unaccounted-packages ()
  (interactive)
  (package-show-package-list
   (remove-if-not (lambda (x) (and (not (memq x jpk-package-list))
				   (not (package-built-in-p x))
				   (package-installed-p x)))
		  (mapcar 'car package-archive-contents))))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(let ((default-directory "~/.emacs.d/elpa/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))


(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

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
; (require 'init-python)
(require 'init-ruby)
(require 'init-keymap)
(require 'init-haskell)

;; Default Settings
(prefer-coding-system 'utf-8)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-tab-always-indent nil)
 '(company-c-headers-path-system
   (quote
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/4.9/" "/usr/include/x86_64-linux-gnu/c++/4.9/" "/usr/include/c++/4.9/backward/" "/usr/include/x86)64-linux-gnu/" "/usr/include/boost")))
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
