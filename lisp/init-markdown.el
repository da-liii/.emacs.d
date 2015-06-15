(autoload 'markdown-mode "markdown-mode" "Mode for editing Markdown documents" t)
(setq auto-mode-alist
      (cons '("\\.\\(md\\|markdown\\)\\'" . markdown-mode) auto-mode-alist))

(require 'proofreadr-mode)

(add-hook 'markdown-mode-hook 'proofreadr-mode)

(provide 'init-markdown)
