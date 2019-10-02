;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(setq package-enable-at-startup nil)
(package-initialize)
;; use-package config for automated installing
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
;; Ensure packages are installed
;; Evil mode
;(use-package evil
;  :ensure t)
;; Spacemacs theme
(use-package spacemacs-theme
  :no-require t
  :ensure t)
;; Cyberpunk theme
(use-package cyberpunk-theme
  :no-require t
  :ensure t)
;; Material theme
(use-package material-theme
  :no-require t
  :ensure t)
;; Moe theme
(use-package moe-theme
  :no-require t
  :ensure t)
;; Dracula theme
(use-package dracula-theme
  :no-require t
  :ensure t)

;; Helm
(use-package helm
  :ensure t
  :bind ("M-x" . helm-M-x)
  :bind ("C-x C-f" . helm-find-files)
  :bind ("M-y" . helm-show-kill-ring)
  :config
  (helm-mode 1)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t
    helm-recentf-fuzzy-match    t)
  (setq helm-semantic-fuzzy-match t
    helm-imenu-fuzzy-match    t)
)
;; Magit
(use-package magit
  :ensure t)
;; Magit
(use-package org-kanban
  :ensure t)
;; Elpy
(use-package elpy
  :ensure t
  :init
  (elpy-enable))
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))
;; js2-mode: enhanced JavaScript editing mode
;; https://github.com/mooz/js2-mode
(use-package js2-mode
  :mode (("\\.js$" . js2-mode))
  :config
  ;; have 2 space indentation by default
  (setq js-indent-level 2
        js2-basic-offset 2
        js-chain-indent t))
;; rjsx-mode: A JSX major mode for Emacs
;; https://github.com/felipeochoa/rjsx-mode
(use-package rjsx-mode
  :after js2-mode
  :mode (("\\.jsx$" . rjsx-mode)
         ("components/.+\\.js$" . rjsx-mode)))

;;
;;
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; Setting theme
;; (load-theme 'spacemacs-light t)
;; Org config
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
(setq org-log-done t)
;; Agenda files
(setq org-agenda-files (list "~/org/actividades.org"
			     "~/org/OrgTutorial.org"))
;; Set evil mode
;(setq evil-want-C-i-jump nil)
;(require 'evil)
;(evil-mode 1)

;; Use Flycheck elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
;; YASnippet
(require 'yasnippet)
(yas-global-mode 1)

(use-package heaven-and-hell
  :ensure t
  :init
  (setq heaven-and-hell-themes
        '((light . spacemacs-light)
          (dark . cyberpunk))) ;; Themes can be the list: (dark . (tsdh-dark wombat))
  (setq heaven-and-hell-load-theme-no-confirm t)
  :hook (after-init . heaven-and-hell-init-hook)
  :bind (("C-c <f6>" . heaven-and-hell-load-default-theme)
         ("<f6>" . heaven-and-hell-toggle-theme)))

;; Set space as indentation
(progn
  (setq-default indent-tabs-mode nil)
 )
;; Indentation for js
(setq javascript-indent-level 2)

;; MySQL
(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

(setq custom-file (make-temp-file "emacs-custom"))
;;; init.el ends here
