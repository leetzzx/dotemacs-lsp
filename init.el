;; default
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-14"))
(setq inhibit-splash-screen t)
(setq gc-cons-threshold most-positive-fixnum)

(require 'recentf)
(recentf-mode 1)
;; Lower threshold back to 8 MiB (default is 800kB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))

;; use packages
(eval-when-compile (require 'use-package))
(eval-and-compile
  (setq use-package-always-defer t)
  (setq use-package-always-ensure t)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally t)
  )

(require 'package)
;;(require 'cl-lib)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-selected-packages '(
				  ;; ui
				  all-the-icons
				  posframe
				  which-key
				  doom-modeline
				  dashboard
				  monokai-theme
				  ;; tools
				  use-package
				  ace-window
				  terminal-here
				  iedit
				  swiper				  
				  expand-region
				  bbyac
				  projectile
				  ivy
				  ;; minor mode
				  smartparens
				  yasnippet
				  yasnippet-snippets
				  company
				  ;; major mode
				  markdown-mode
				  )) 

;; package install keybindings
(global-set-key (kbd "<f6>") 'package-install-selected-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ui configuration
;; all the icons
;;(when (display-graphic-p)
(use-package all-the-icons)

;; posframe
(use-package posframe)
;; which key
(use-package which-key
  :hook (after-init . which-key-mode))

;; doom modeline
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

;; dashboard
(use-package dashboard
  :hook (after-init  . dashboard-setup-startup-hook))

;; monokai theme
(load-theme 'monokai 1)


;; tools configuration
;; ace window
(use-package ace-window
  :bind ("M-o" . 'ace-window))

;; terminal here
(use-package terminal-here
  :bind ("M-=" . #'terminal-here-launch))

;; iedit-mode
(global-set-key (kbd "M-s e") 'iedit-mode)

;; swiper
(use-package swiper
  :bind ("C-s" . 'swiper)
  )

;; expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; bbyac
(use-package bbyac
  :hook (after-init . bbyac-global-mode))

;; projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/Projects/"))
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))
;; ivy mode
(use-package ivy
  :hook (after-init . ivy-mode)
  )

;; minor mode
;; smartparens mode
(require 'smartparens)
(smartparens-global-mode t)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)


;; yasnippet
(use-package yasnippet
  :hook (after-init . yas-global-mode)
  :bind ("C-c y" . 'company-yasnippet)
  )

;; company
(use-package company
  ;; :hook (after-init . global-company-mode)
  )
;; major mode
;; markdown mode

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

;; lsp bridge
(use-package lsp-bridge
  :commands lsp-bridge-mode
  :load-path "~/.emacs.d/iso-pa/lsp-bridge"
  :ensure nil
  :init
  (use-package posframe)
  :hook (after-init . global-lsp-bridge-mode)
  :config
  (setq lsp-bridge-python-lsp-server "jedi")
  )

