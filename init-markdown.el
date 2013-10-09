(autoload 'markdown-mode "markdown-mode" "Mode for editing Markdown documents" t)
(setq auto-mode-alist
      (cons '("\\.\\(m\\|markdown\\)\\'" . octave-mode) auto-mode-alist))

(provide 'init-markdown)
