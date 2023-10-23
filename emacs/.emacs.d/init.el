(use-package emacs
  :init
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  (scroll-bar-mode 0)
  (column-number-mode 1)
  (global-display-line-numbers-mode)
  (setq-default inhibit-startup-message t
		use-short-answers t)

  (setq-default custom-file
		(expand-file-name "custom.el" user-emacs-directory))
  (when (file-exists-p custom-file)
    (load custom-file))

  (load-theme 'wombat)
  (setq make-backup-files nil)
  (setq auto-save-default nil))

(use-package package
  :config
  (add-to-list 'package-archives 
    '("MELPA" . "http://melpa.org/packages/"))
  (package-initialize))

(use-package use-package
  :custom
  (use-package-always-ensure t)
  (package-native-compile t)
  (warning-minimum-level :error))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-escape
  :after evil
  :config
  (setq-default evil-escape-key-sequence "kj")
  (evil-escape-mode))

(use-package vertico
  :init
  (vertico-mode))

(use-package savehist
  :after vertico
  :init
  (savehist-mode))

(use-package marginalia
  :after vertico
  :init
  (marginalia-mode))


(use-package magit)


(use-package elfeed
  :init
  (setq elfeed-feeds
	'("https://mrshabanali.com/feed" )))



(use-package treesit
  :ensure nil
  :config
  (setq treesit-language-source-alist
	'((bash "https://github.com/tree-sitter/tree-sitter-bash")
	(c "https://github.com/tree-sitter/tree-sitter-c")
	(go "https://github.com/tree-sitter/tree-sitter-go")
	(json "https://github.com/tree-sitter/tree-sitter-json")
	(python "https://github.com/tree-sitter/tree-sitter-python")
	(markdown "https://github.com/MDeiml/tree-sitter-markdown")))

  (setq major-mode-remap-alist
	'((bash-mode . bash-ts-mode)
	(c-mode . c-ts-mode)
	(go-mode . go-ts-mode)
	(json-mode . json-ts-mode)
	(python-mode . python-ts-mode))))



(use-package which-key
  :config
  (which-key-mode))

(use-package markdown-mode)

(use-package company
  :config
  (global-company-mode))

(use-package eldoc-box
  :after eglot
  :config
  (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode t))


(use-package vundo)
