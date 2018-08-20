;;;================
;;;   YAS模板配置
;;;================
(require-package 'yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"            ;个人配置
        "~/.emacs.d/elpa/yasnippet-20131031.628/snippets"    ;通用配置
        ))
(yas-global-mode 1)

; term mode tab冲突
(add-hook 'term-mode-hook (lambda()    
                (yas-minor-mode -1)))

(provide 'jove-yasnippet)
