
;; Package configuration
(require 'package)
(add-to-list 'package-archives '("melpa"  . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))


;; Use package
(require 'use-package)
(setq use-package-always-ensure t)

;; Themes (base16 choose)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(base16-theme corfu dashboard doom-modeline ein exec-path-from-shell
                  jupyter polymode vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'base16-default-dark t)

;; Modeline
(require 'doom-modeline)
(doom-modeline-mode 1)

;; Dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)
;;logo
(setq dashboard-startup-banner "~/.emacs.d/emacs.png")
;;title
(setq dashboard-banner-logo-title "Let's him cook on Emacs")
;;placement
(setq dashboard-center-content t)
;;items
(setq dashboard-items'((recents . 5)
                       (bookmarks . 5)

                       (projects . 5)
                       (agenda . 5)
                       (registers . 5)))
(setq dashboard-item-shortcuts '((recents . "r")
				 (bookmarks . "b")
				 (projects . "p")
				 (agenda . "a")
				 (registers . "a")))
;;shortcuts
(setq dashboard-item-names '(("Recents Files:"   . "Recently opened files:")))
;;navigation
(setq dashboard-navigation-cycle t)


(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(auto-save-visited-mode 1)
(display-time-mode 1)
(setq-default indent-tabs-mode nil
	      tab-width 2)
(electric-pair-mode 1)
(set-face-attribute 'default nil
                    :family "JetBrains Mono")

;; Auto completion config
(require 'corfu)
(global-corfu-mode)
(setq corfu-auto t)
(setq corfu-auto-delay 0.1)

;;Exec from shell for emacs to see my conda env
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;;Another Path lecture
(add-to-list 'exec-path (expand-file-name "~/.local/bin"))
(setenv "PATH" (concat (expand-file-name "~/.local/bin") ":"(getenv "PATH")))
