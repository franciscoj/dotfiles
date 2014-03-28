(prelude-require-package 'ag)
(prelude-require-package 'bundler)
(prelude-require-package 'rubocop)
(prelude-require-package 'ruby-tools)

(prelude-require-package 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(prelude-require-package 'rbenv)
(global-rbenv-mode)

(prelude-require-package 'yard-mode)
(add-hook 'ruby-mode-hook 'yard-mode)

(prelude-require-package 'rspec-mode)
(setq rspec-use-rake-when-possible nil)

(prelude-require-package 'jabber)

;; simpler format for prompts
(setq jabber-chat-buffer-show-avatar nil
      jabber-chat-foreign-prompt-format "> "
      jabber-chat-local-prompt-format "> "
      jabber-chat-system-prompt-format "*** "
      jabber-chat-time-format "%H:%M"
      jabber-default-show ""
      jabber-groupchat-prompt-format "%n> "
      jabber-muc-private-foreign-prompt-format "%g/%n> ")

;; improve the default settings
(setq jabber-roster-line-format "%c %-25n %u %-8s"
      jabber-roster-show-title nil
      jabber-show-resources nil
      jabber-show-offline-contacts nil
      jabber-avatar-cache-directory "/tmp/jabber-avatars"
      jabber-events-request-these (quote (delivered displayed composing)))

;; don't show any presence notifications
(setq jabber-alert-presence-hooks '())

;; history
(setq jabber-history-enabled t
      jabber-use-global-history nil
      jabber-backlog-number 40
      jabber-backlog-days 30
      jabber-history-dir "~/.cache/jabber-history")

(setq jabber-account-list
      `((,(read-from-minibuffer "Gtalk username: ")
         (:password . ,(read-passwd "Gtalk password: "))
         (:network-server . "talk.google.com")
         (:port . 443)
         (:connection-type . ssl))))

(setq projectile-switch-project-action 'projectile-dired)

(prelude-require-package 'yasnippet)
(setq yas-snippets-dir
      '("~/.emacs.d/yasnippet-snippets"
        "~/.emacs.d/personal-snippets"))
(yas-global-mode)

(key-chord-define-global "kk" 'next-multiframe-window)
(key-chord-define-global "KK" 'previous-multiframe-window)
(key-chord-define-global "xx" 'smex)

(display-time-mode 1)
(setq display-time-format "%R %d/%m/%Y")

(prelude-require-package 'indent-guide)
(indent-guide-global-mode)
