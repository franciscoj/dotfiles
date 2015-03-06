;;; package --- My personal emacs config

;;; Commentary:

;;; Code:

(setq user-full-name "Fran Casas"
      user-mail-address "nflamel@gmail.com")

; Require modes
(prelude-require-package 'ag)
(prelude-require-package 'bundler)
(prelude-require-package 'rubocop)
(prelude-require-package 'ruby-tools)
(prelude-require-package 'markdown-mode)
(prelude-require-package 'rbenv)
(prelude-require-package 'yard-mode)
(prelude-require-package 'rspec-mode)
(prelude-require-package 'indent-guide)
(prelude-require-package 'smart-mode-line)
(prelude-require-package 'handlebars-mode)

;;; Ruby:

(global-rbenv-mode)
;; Don't use rake on rspec-mode
(setq rspec-use-rake-when-possible nil)
;; C-x C-q will allow to debug on rspec-mode
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
;; Add representative templates as ruby files
(setq auto-mode-alist
      (append '((".*\\.rep\\'" . ruby-mode)) auto-mode-alist))
;; Activate yard-mode on ruby files
(add-hook 'ruby-mode-hook 'yard-mode)

;;; Others:

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(setq js-indent-level 2)

;;; org-mode:

;; Which files to add to the orgmode agenda
(setq org-agenda-files (list "~/Documents/src/todo.org"))

;;; Look & Feel

;; Go to project dir when switching project on projectile
(setq projectile-switch-project-action 'projectile-dired)

(key-chord-define-global "kk" 'next-multiframe-window)     ; C-x o
(key-chord-define-global "KK" 'previous-multiframe-window) ; C-x O
(key-chord-define-global "xx" 'smex)                       ; M-x

;; Show time and date
(display-time-mode 1)
(setq display-time-format "%R %d/%m/%Y")

;; Load indent guides
(require 'indent-guide)
(indent-guide-global-mode)

;; Disable scrollbar
(scroll-bar-mode -1)

;; Use start-mode-line
(require 'smart-mode-line)
(sml/setup)
(setq-default
 mode-line-format
 '("%e"
   mode-line-front-space
   mode-line-mule-info
   mode-line-client
   mode-line-modified
   mode-line-remote
   mode-line-frame-identification
   mode-line-buffer-identification
   "   "
   mode-line-position
   (vc-mode vc-mode)
   "  "
   mode-line-modes
   mode-line-misc-info
   mode-line-end-spaces))

;;; personal.el ends here
