;;C/C++  mode
;; CEDET
(require 'cc-mode)
(require 'semantic)

(setq semantic-default-submodes '(global-semanticdb-minor-mode
				  global-semantic-idle-scheduler-mode
				  global-semantic-idle-summary-mode
				  global-semantic-mru-bookmark-mode))
(semantic-mode 1)
(semantic-add-system-include "/usr/include/boost" 'c++-mode)
(semantic-add-system-include "/usr/include/KDE" 'c++-mode)
(semantic-add-system-include "/usr/include/qt4" 'c++-mode)

(defadvice push-mark (around semantic-mru-bookmark activate)
  "Push a mark at LOCATION with NOMSG and ACTIVATE passed to `push-mark'.
If `semantic-mru-bookmark-mode' is active, also push a tag onto
the mru bookmark stack."
  (semantic-mrub-push semantic-mru-bookmark-ring
                      (point)
                      'mark)
  ad-do-it)

(defun semantic-ia-fast-jump-back ()
  (interactive)
  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
  (let* ((ring (oref semantic-mru-bookmark-ring ring))
         (alist (semantic-mrub-ring-to-assoc-list ring))
         (first (cdr (car alist))))
    (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
        (setq first (cdr (car (cdr alist)))))
    (semantic-mrub-switch-tags first)))

(define-key semantic-mode-map (kbd "<M-.>") 'semantic-ia-fast-jump)
(define-key semantic-mode-map (kbd "<M-,>") 'semantic-ia-fast-jump-back)

;; Functions Args
(require 'function-args)
(fa-config-default)

;; Company Mode
(add-to-list 'company-backends 'company-c-headers)
  
(add-hook 'c++-mode-hook 'paredit-everywhere-mode)
(add-hook 'c-mode-hook 'paredit-everywhere-mode)

(add-hook 'c-mode-hook
	  '(lambda ()
             (gtags-mode 1)
	     (c-set-style "K&R")
	     (c-toggle-auto-state)
	     (c-toggle-auto-hungry-state)
             (semantic-mode t)
             (indent-tabs-mode nil)
	     (setq tab-width 4)
	     (setq c-basic-offset 4)))

(add-hook 'c++-mode-hook
          '(lambda ()
             (semantic-mode t)
             (c-set-style "stroustrup")
	     (c-toggle-auto-state)
	     (setq tab-width 4)
	     (c-toggle-auto-hungry-state)))

(provide 'init-cpp)
