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



