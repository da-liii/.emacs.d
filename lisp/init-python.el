;; python mode 设置
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
;(setq py-python-command "/opt/local/bin/python")
;(setq python-python-command "/opt/local/bin/python")
;(autoload 'python-mode "python-mode" "python editing mode." t)
;; 加载,rope,pymacs,ropmacs

(eval-after-load "python-mode"
  '(progn
     (autoload 'pymacs-apply "pymacs")
     (autoload 'pymacs-call "pymacs")
     (autoload 'pymacs-eval "pymacs" nil t)
     (autoload 'pymacs-exec "pymacs" nil t)
     (autoload 'pymacs-load "pymacs" nil t)
     (require 'pycomplete)
     (message "loading repomacs")
     (pymacs-load "ropemacs" "rope-")
     (setq ropemacs-enable-autoimport t)))

(provide 'init-python)
