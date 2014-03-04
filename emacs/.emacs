;; config files
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")

;; color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-deep-blue)

;; line numbers
(global-linum-mode t)

;; 10pt text
(set-face-attribute 'default nil :height 100)

;; disable line wrapping
(setq-default truncate-lines t)

;; whitespaces removal
(setq-default indicate-empty-lines t)
(setq-default indicate-unused-lines t)

;; tab size
(setq-default tab-width 4)

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

