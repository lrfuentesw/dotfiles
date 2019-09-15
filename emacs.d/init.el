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
(use-package evil
  :ensure t)
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
;;
;;
(global-set-key (kbd "C-x C-b") 'ibuffer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(custom-enabled-themes (quote (spacemacs-light)))
 '(custom-safe-themes
   (quote
    ("1a1cdd9b407ceb299b73e4afd1b63d01bbf2e056ec47a9d95901f4198a0d2428" "30289fa8d502f71a392f40a0941a83842152a68c54ad69e0638ef52f04777a4c" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "59e82a683db7129c0142b4b5a35dbbeaf8e01a4b81588f8c163bd255b76f4d21" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX" . "#dc752f")
     ("XXXX" . "#dc752f")
     ("???" . "#dc752f"))))
 '(package-selected-packages
   (quote
    (plan9-theme dracula-theme moe-theme material-theme cyberpunk-theme use-package evil spacemacs-theme)))
 '(pdf-view-midnight-colors (quote ("#655370" . "#fbf8ef"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Setting theme
(load-theme 'spacemacs-light)
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
(require 'evil)
(evil-mode 1)

(use-package heaven-and-hell
  :ensure t
  :init
  (setq heaven-and-hell-themes
        '((light . spacemacs-light)
          (dark . cyberpunk))) ;; Themes can be the list: (dark . (tsdh-dark wombat))
  :hook (after-init . heaven-and-hell-init-hook)
  :bind (("C-c <f6>" . heaven-and-hell-load-default-theme)
         ("<f6>" . heaven-and-hell-toggle-theme)))
