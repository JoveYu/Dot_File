;;;================
;;;   包管理配置
;;;================
(require 'package)

;;; GNU源
;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;;; 基本源
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;; 第三方源
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;;; 不使用melpa的特定的包
(setq package-filter-function
      (lambda (package version archive)
        (or (not (string-equal archive "melpa"))
            (not (memq package '())))))

;;; 按需加载包
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


;;; 初始化包管理
(package-initialize)

(provide 'jove-elpa)
