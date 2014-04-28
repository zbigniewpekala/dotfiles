;; config files
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")

;; color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-deep-blue)

;; line numbers
(global-linum-mode t)

;; 11pt text
(set-face-attribute 'default nil :height 110)

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
(global-whitespace-mode 1)

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

;; jedi - installed by marmalade
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;; erlang
(add-to-list 'load-path "/usr/local/opt/erlang/lib/erlang/lib/tools-2.6.13/emacs")
(setq erlang-root-dir "/usr/local/opt/erlang/lib/erlang")
(add-to-list 'exec-path "/usr/local/opt/erlang/lib/erlang/bin")
(require 'erlang-start)
(add-to-list 'ac-modes 'erlang-mode)

