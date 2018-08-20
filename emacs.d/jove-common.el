;;;=========
;;; 通用配置
;;;=========
(global-font-lock-mode t)     ;语法高亮
(blink-cursor-mode -1)        ;指针不闪动
(transient-mark-mode 1)       ;标记高亮
(column-number-mode t)        ;显示列号
(global-linum-mode t)         ;显示行号
(setq linum-format "%3d")     ;行号格式\u2502
(show-paren-mode t)           ;显示括号匹配
;(which-function-mode t)       ;在状态条上显示当前光标在哪个函数体内部
(fset 'yes-or-no-p 'y-or-n-p) ;简化yes or no

(setq ring-bell-function 'ignore)       ;关闭烦人的出错时的提示声
(setq inhibit-startup-message t)        ;关闭起动时闪屏
(setq initial-scratch-message nil)      ;禁止在草稿缓存里面显示处始化信息
(setq show-paren-style 'parentheses)    ;括号匹配显示但不是烦人的跳到另一个括号。
(setq default-major-mode 'text-mode)    ;设置默认地主模式为TEXT模式
(setq mouse-yank-at-point t)            ;粘贴于光标处,而不是鼠标指针处
(setq x-select-enable-clipboard t)      ;支持emacs和外部程序的粘贴
(setq x-stretch-cursor t)               ;光标在 TAB 字符上会显示为一个大方块
(setq auto-revert-mode 1)               ;自动更新buffer
(setq max-lisp-eval-depth 40000)        ;lisp最大执行深度
(setq max-specpdl-size 10000)           ;最大容量
(setq undo-outer-limit 5000000)         ;撤销限制
(setq mark-ring-max 1024)               ;设置的mark ring容量
(setq message-log-max t)                ;设置message记录全部消息, 而不用截去
(setq read-quoted-char-radix 16)        ;设置 引用字符 的基数
(setq void-text-area-pointer nil)       ;禁止显示鼠标指针
(setq enable-recursive-minibuffers t)   ;minibuffer 递归调用命令
(setq eval-expression-print-length nil) ;设置执行表达式的长度没有限制
(setq eval-expression-print-level nil)  ;设置执行表达式的深度没有限制
(setq global-mark-ring-max 1024)        ;设置最大的全局标记容量
(setq history-delete-duplicates t)      ;删除minibuffer的重复历史
(put 'narrow-to-region 'disabled nil)   ;开启变窄区域
(setq print-escape-newlines t)          ;显示字符窗中的换行符为 \n

(setq-default
 blink-cursor-delay 0
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 delete-selection-mode t
 grep-highlight-matches t
 grep-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 visible-bell t)
 
(global-set-key (kbd "RET") 'newline-and-indent) ; 换行并缩进

;;; 清理行尾空格
(require-package 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode t)

;;; 撤销记录
(require-package 'undo-tree)
(global-undo-tree-mode)

;;; M-x增强
(require-package 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ; 原有的按键

;;; 括号匹配
(require-package 'smartparens)
(smartparens-global-mode t)

;;; 终端模拟器
(setq term-eol-on-send t)               ;输入前跳转到最后一行

;;; 备份路径设置
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old
      
;;; 一些函数
(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))


(provide 'jove-common)
