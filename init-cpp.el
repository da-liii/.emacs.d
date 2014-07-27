;;C/C++  mode
(add-hook 'c-mode-hook
	  '(lambda ()
             (gtags-mode 1)
	     (c-set-style "K&R")
	     (c-toggle-auto-state)
	     (c-toggle-auto-hungry-state)
	     (setq tab-width 4)
	     (setq c-basic-offset 4)))

(add-hook 'c++-mode-hook
          '(lambda ()
             (gtags-mode 1)
             (c-set-style "stroustrup")
	     (c-toggle-auto-state)
	     (setq tab-width 4)
	     (c-toggle-auto-hungry-state)))

(require 'cedet)
;;(semantic-load-enable-minimum-features)
;;(semantic-load-enable-code-helpers)
;;(semantic-load-enable-gaudy-code-helpers)
;;(global-semantic-stickyfunc-mode nil)
;;(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-semantic-debugging-helpers)
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

(require 'semantic-tag-folding nil 'noerror)

(provide 'init-cpp)
