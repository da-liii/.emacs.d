;;C/C++  mode
;; CEDET
(require 'cc-mode)
(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)
(semantic-add-system-include "/usr/include/boost" 'c++-mode)

;; Functions Args
(require 'function-args)
(fa-config-default)
;(define-key c-mode-map  [(contrl tab)] 'moo-complete)
;(define-key c++-mode-map  [(control tab)] 'moo-complete)
;(define-key c-mode-map (kbd "M-o")  'fa-show)
;(define-key c++-mode-map (kbd "M-o")  'fa-show)

;; auto complete clang
(require 'auto-complete-clang)  
(setq ac-clang-auto-save t)  
(setq ac-auto-start t)  
(setq ac-quick-help-delay 0.5)  
(defun my-ac-config ()  
  (setq ac-clang-flags  
        (mapcar (lambda (item)(concat "-I" item))  
                (split-string  
                 "
 /usr/include/c++/4.9
 /usr/include/x86_64-linux-gnu/c++/4.9
 /usr/include/c++/4.9/backward
 /usr/lib/gcc/x86_64-linux-gnu/4.9/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/4.9/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include
")))
  (setq-default ac-sources '(ac-source-abbrev
                             ac-source-dictionary
                             ac-source-words-in-same-mode-buffers))  
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)  
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)  
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)  
  (add-hook 'css-mode-hook 'ac-css-mode-setup)  
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)  
  (global-auto-complete-mode t))  
(defun my-ac-cc-mode-setup ()  
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet)
                           ac-sources)))  
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)  
;; ac-source-gtags

(add-hook 'c++-mode-hook 'paredit-everywhere-mode)
(add-hook 'c-mode-hook 'paredit-everywhere-mode)

(add-hook 'c-mode-hook
	  '(lambda ()
             (gtags-mode 1)
	     (c-set-style "K&R")
	     (c-toggle-auto-state)
	     (c-toggle-auto-hungry-state)
             (my-ac-config)  
             (setq ac-sources (append '(ac-source-semantic) ac-sources))
;             (semantic-mode t)
	     (setq tab-width 4)
	     (setq c-basic-offset 4)))

(add-hook 'c++-mode-hook
          '(lambda ()
             (gtags-mode 1)
             (setq ac-sources (append '(ac-source-semantic) ac-sources))
;            (semantic-mode t)
             (my-ac-config)  
             (c-set-style "stroustrup")
	     (c-toggle-auto-state)
	     (setq tab-width 4)
	     (c-toggle-auto-hungry-state)))

(provide 'init-cpp)
