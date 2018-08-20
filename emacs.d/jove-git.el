;;;================
;;;   GIT配置
;;;================

(require-package 'magit)
(require-package 'git-gutter-fringe)
(require-package 'git-blame)
(require-package 'git-commit-mode)
(require-package 'git-rebase-mode)
(require-package 'gitignore-mode)
(require-package 'gitconfig-mode)

(setq-default
 magit-save-some-buffers nil
 magit-process-popup-time 10
 magit-diff-refine-hunk t
 magit-completing-read-function 'magit-ido-completing-read)

(global-git-gutter-mode +1)

;;; When we start working on git-backed files, use git-wip if available
(after-load 'vc-git
  (global-magit-wip-save-mode))
;  (diminish 'magit-wip-save-mode))

;;; Use the fringe version of git-gutter
(after-load 'git-gutter
  (require 'git-gutter-fringe))

(provide 'jove-git)
