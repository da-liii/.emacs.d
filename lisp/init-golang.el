(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook 'rainbow-delimiters-mode)
(global-set-key (kbd "M-,") 'godef-jump)

(require 'company-go)

(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))))

(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

;; go flymake
(load "$GOPATH/src/github.com/dougm/goflymake/go-flymake.el")

;; go oracle
(load "$GOPATH/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")
(add-hook 'go-mode-hook 'go-oracle-mode)

;;(add-to-list 'load-path "~/src/github.com/dougm/goflymake")
;;(require 'go-flycheck)

(provide 'init-golang)
