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

;; cua mode for better copy-paste
(cua-mode t)

(eval-after-load 'rainbow-delimeters
  '(global-rainbow-delimiters-mode))

(global-set-key (kbd "C-x b") 'ibuffer)


;; key bindings

(setq mac-command-modifier 'control)

(defun prev-window ()
  (interactive)
  (other-window -1))

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "M-TAB") 'other-window)
    (define-key map (kbd "C-M-y") 'prev-window)
    (define-key map (kbd "C-x f") 'fiplr-find-file)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "My own key overrides!"
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)


;; packages

;; Add MELPA archive
(require 'package)
(add-to-list 'package-archives 
  '("melpa" .
    "http://melpa.org/packages/"))
(package-initialize)

;; fuzzy project navigation
(unless (package-installed-p 'fiplr)
  (package-refresh-contents)
  (package-install 'fiplr))


;; neotree file tree
(unless (package-installed-p 'neotree)
  (package-refresh-contents)
  (package-install 'neotree))
(setq neo-smart-open t)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'arrow))
(global-set-key (kbd "C-x C-l") 'neotree-find)

;; auto-complete autocomplete
;(unless (package-installed-p 'auto-complete)
;  (package-refresh-contents)
;  (package-install 'auto-complete))

;  (require 'auto-complete)
;  (ac-config-default)
;  (add-to-list 'ac-modes 'erlang-mode)

;; company autocomplete
(unless (package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company))
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-SPC") 'company-complete)

;; erlang
(add-to-list 'load-path "/opt/erlang/17.5/lib/tools-2.7.2/emacs")
(setq erlang-root-dir "/opt/erlang/17.5")
(add-to-list 'exec-path "/opt/erlang/17.5/bin")
(require 'erlang-start)

;; distel required by company-distel
(add-to-list 'load-path "~/.emacs.d/distel/elisp")
(require 'distel)
(distel-setup)

;; add erlang distel autocomplete to company
(unless (package-installed-p 'company-distel)
  (package-refresh-contents)
  (package-install 'company-distel))
(require 'company-distel)
(add-to-list 'company-backends 'company-distel)

;; elixir
(unless (package-installed-p 'alchemist)
  (package-refresh-contents)
  (package-install 'alchemist))
(alchemist-mode t)
