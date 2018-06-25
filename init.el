(require 'package)

(setq jpk-package-list
      '(
        ;; apperance
        moe-theme
        powerline
        rainbow-delimiters
        tabbar-ruler
        fill-column-indicator
        indent-guide
        hl-line
        ;; edit
        paredit
        paredit-everywhere
        hl-sexp
        yasnippet
        company
        company-c-headers
        ;; util
        keyfreq
	smex
        evil
        youdao-dictionary
        magit
        neotree
        projectile
        ;; cpp
        function-args
        ;; scala
        ensime
        ;; python
        elpy
        pydoc
        qml-mode
        markdown-mode
        yaml-mode
	go-mode))

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
             '("melpa-cn" . "http://elpa.emacs-china.org/melpa/") t)
(add-to-list 'package-archives
             '("org-cn"   . "http://elpa.emacs-china.org/org/") t)
(add-to-list 'package-archives
             '("gnu-cn"   . "http://elpa.emacs-china.org/gnu/") t)

(let ((default-directory "~/.emacs.d/elpa/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-edit)
(require 'init-appearance)
(require 'init-utils)

;(require 'init-golang)
(require 'init-markdown)
(require 'init-shell)
(require 'init-org)
(require 'init-cpp) ;; c & cpp
(require 'init-scala)
(require 'init-scheme)
(require 'init-elisp)
(require 'init-python)
(require 'init-ruby)
(require 'init-haskell)
(require 'init-qml)

(require 'init-keymap)

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
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/4.9/" "/usr/include/x86_64-linux-gnu/c++/4.9/" "/usr/include/c++/4.9/backward/" "/usr/include/x86_64-linux-gnu/" "/usr/include/boost" "/usr/include/qt4" "/usr/include/KDE")))
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(global-company-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(minimap-window-location (quote right))
 '(org-agenda-files (quote ("~/todo.org")))
 '(org-agenda-include-diary t)
 '(org-support-shift-select t)
 '(package-selected-packages
   (quote
    (evil-leader evil youdao-dictionary yaml-mode ws-butler winum which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tabbar-ruler spaceline smex smeargle restart-emacs rainbow-delimiters qml-mode pydoc popwin persp-mode pcre2el paredit-everywhere paradox orgit org-bullets open-junk-file noflet neotree move-text moe-theme mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint keyfreq json-mode js2-refactor js-doc indent-guide hungry-delete hl-todo hl-sexp highlight-parentheses highlight-numbers helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-ag google-translate golden-ratio go-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md function-args flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu ensime elpy elisp-slime-nav eclim dumb-jump diminish define-word company-c-headers column-enforce-mode coffee-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
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

;; customize
(setq visible-bell t)
(server-start)

