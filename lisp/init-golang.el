;; set some environment variables
(setenv "GOROOT" "/usr/lib/go")
(setenv "GOPATH" "/data/gocode")
;;; we do not need the following lines, because emacs cannot change
;;; it's PATH internally
;; (setenv "PATH" (concat (getenv "PATH")                         
;;                        ":" (concat (getenv "GOPATH") "/bin")   
;;                        ":" (concat (getenv "GOROOT") "/bin"))) 
(load (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake/go-flymake.el"))
(load (concat (getenv "GOPATH") "/src/golang.org/x/tools/cmd/oracle/oracle.el"))
(load (concat (getenv "GOPATH") "/src/github.com/nsf/gocode/emacs-company/company-go.el"))

;;; Keyboards
;;; TODO should be moved into init-keyboard
(global-set-key (kbd "M-,") 'godef-jump)

;;; Utils
(require 'company-go)
(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))))

(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(add-hook 'go-mode-hook 'go-oracle-mode)
(add-hook 'before-save-hook 'gofmt-before-save)

;;(add-to-list 'load-path "~/src/github.com/dougm/goflymake")
;;(require 'go-flycheck)

(provide 'init-golang)
