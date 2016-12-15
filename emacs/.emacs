;; look & feel

;; 16pt text
(set-face-attribute 'default nil :height 160)

;; show line numbers
(global-linum-mode t)

;; disable line wrapping
(setq-default truncate-lines t)

;; tab size
(setq-default tab-width 4)

;; use spaces
(setq-default indent-tabs-mode nil)

;; always display whitespaces
(global-whitespace-mode 1)

;; color theme
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")

(require 'color-theme-solarized)
(load-theme 'solarized-dark t)

;; scratch buffer cleanup
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; match pairs of characters
(show-paren-mode 1)

; Polish characters (change right Meta key into Alt)
(setq ns-right-alternate-modifier nil)

;; ido mode
(require 'ido)
(ido-mode t)


;; packages

;; Add MELPA archive
(require 'package)
(add-to-list 'package-archives 
    '("melpa" .
      "http://melpa.org/packages/"))
(package-initialize)

;; autocomplete
(unless (package-installed-p 'auto-complete)
  (package-refresh-contents)
  (package-install 'auto-complete))

(require 'auto-complete)
(ac-config-default)
(add-to-list 'ac-modes 'erlang-mode)

;; clojure
(unless (package-installed-p 'clojure-mode)
  (package-refresh-contents)
  (package-install 'clojure-mode))

;; erlang
(add-to-list 'load-path "/opt/erlang/17.5/lib/tools-2.7.2/emacs")
(setq erlang-root-dir "/opt/erlang/17.5")
(add-to-list 'exec-path "/opt/erlang/17.5/bin")
(require 'erlang-start)

;; elixir
(unless (package-installed-p 'alchemist)
  (package-refresh-contents)
  (package-install 'alchemist))
