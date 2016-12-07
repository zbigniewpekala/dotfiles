;; config files
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(add-to-list 'load-path "~/.emacs.d/markdown-mode")

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; color theme
;(require 'color-theme)
(require 'color-theme-solarized)
(load-theme 'solarized-dark t)
;(color-theme-initialize)
;(color-theme-solarized-dark)

;; line numbers
(global-linum-mode t)

;; 16pt text
(set-face-attribute 'default nil :height 160)

;; disable line wrapping
(setq-default truncate-lines t)

;; whitespaces removal
(setq-default indicate-empty-lines t)
(setq-default indicate-unused-lines t)

;; tab size
(setq-default tab-width 4)

;; hate tabs!
(setq-default indent-tabs-mode nil)

;; always display whitespaces
;(global-whitespace-mode 1)

;; scratch buffer cleanup
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; match pairs of characters
(show-paren-mode 1)

;; ido mode
(require 'ido)
(ido-mode t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(column-number-mode t)
  '(inhibit-startup-screen t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; autocomplete
(add-to-list 'load-path "~/.emacs.d/autocomplete")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/autocomplete/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

;; python with ipython for python3
(add-to-list 'load-path "~/.emacs.d/python-mode-6.1.3")
(require 'python-mode)

(setq-default py-shell-name "ipython3")
(setq-default py-which-bufname "IPython")
(setq py-python-command-args '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
(setq py-split-windows-on-execute-p t)
(setq py-smart-indentation t)

;; marmalade
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; clojure
(unless (package-installed-p 'clojure-mode)
  (package-refresh-contents)
  (package-install 'clojure-mode))

;; elixir
(unless (package-installed-p 'elixir-mode)
  (package-refresh-contents)
  (package-install 'elixir-mode))

;; jedi - installed by marmalade
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;; erlang
(add-to-list 'load-path "/usr/local/lib/erlang/lib/tools-2.7.2/emacs")
(setq erlang-root-dir "/usr/local/lib/erlang")
(add-to-list 'exec-path "/usr/local/opt/erlang-r16/lib/erlang/bin")
(require 'erlang-start)
(add-to-list 'ac-modes 'erlang-mode)

; Polish characters (change right Meta key into Alt)
(setq ns-right-alternate-modifier nil)

; yaml-mode
(add-to-list 'load-path "~/.emacs.d/yaml-mode")

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-hook 'yaml-mode-hook
  '(lambda ()
    (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(add-to-list 'load-path "/Users/zbigniewpekala/src/priv/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

