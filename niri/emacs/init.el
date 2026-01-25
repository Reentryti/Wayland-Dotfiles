;; =================== General configuration ==================
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(setq visible-bell 1)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; ==================== Package manager =======================
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa"  . "https://elpa.gnu.org/packages/")
        ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-always-defer t)

;; ==================== UI general =============================
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(auto-save-visited-mode 1)
(electric-pair-mode 1)

(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
               term-mode-hook
               shell-mode-hook
               eshell-mode-hook
               treemacs-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
(column-number-mode t)
(display-time-mode t)

(setq-default indent-tabs-mode nil
              tab-width 2)

(set-face-attribute 'default nil :family "JetBrains Mono")

(set-frame-parameter (selected-frame) 'alpha-background 85)
(add-to-list 'default-frame-alist '(alpha-background . 85))

;; ================== Keybindings ===============================
(defun my/config ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f4>") #'my/config)
(global-set-key (kbd "C-<tab>") #'other-window)

;; ================== Ivy / Counset / Which Key =================
(use-package ivy
  :diminish
  :init (ivy-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-M-j" . counsel-switch-buffer))
  :init (setq ivy-initial-inputs-alist nil))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package which-key
  :diminish
  :init
  (which-key-mode)
  :config
  (setq which-key-idle-delay 0.3))

;; ================== Corfu =====================================
(use-package corfu
  :init
  (global-corfu-mode)
  :config
  (setq corfu-auto t
        corfu-auto-delay 0.1))

;; ================= LSP ========================================
(use-package eglot
  :hook ((c-mode c++-mode python-mode go-mode
                 js-mode typescript-mode html-mode
                 css-mode sh-mode) . eglot-ensure)
  :config
  (setq eglot-autoshutdown t))

;; ================ Exec path shell/conda =======================
(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(add-to-list 'exec-path "~/.local/bin")
(setenv "PATH" (concat "~/.local/bin:" (getenv "PATH")))

;; ================ Doom Modeline/Themes ========================
(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package doom-themes)

(use-package base16-theme
  :init (load-theme 'base16-dracula t))

;; =============== Dashboard =====================================
(use-package dashboard
  :init
  (setq dashboard-startup-banner "~/.emacs.d/ascii.txt"
        dashboard-banner-logo-title "Creation is a touch, mine is a process"
        dashboard-center-content t
        dashboard-navigation-cycle t
        dashboard-items '((recents . 5)
                          (projects . 5)
                          (agenda . 5)))
  :hook
  (after-init . dashboard-setup-startup-hook)
 :config
  (set-face-attribute 'dashboard-text-banner nil
                      :foreground "#60519b"))

;; ============= Evil ============================================
(use-package evil
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-set-initial-state 'dashboard-mode 'normal))

;; ============= Projectile / Magit ==============================
(use-package projectile
  :init (projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map)
  :custom
  (projectile-completion-system 'ivy))

(use-package magit
  :commands magit-status
  :bind ("<f6>" . magit-status))

;; ============ Org-Mode =========================================
(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode)
  :custom
  (org-modern-star              '("◉" "○" "●" "◆" "✸" "✿"))
  (org-modern-list              '((?- . "•") (?+ . "➤") (?* . "✸")))
  (org-modern-todo              t)
  (org-modern-priority          t)
  (org-modern-tag               t)
 ;;(org-modern-table             t) ; lourd → nil si ralentit
  (org-modern-block             t)
  (org-modern-keyword           t)
  (org-modern-timestamp         t)
  (org-modern-horizontal-rule   t)
  (org-modern-checkbox          '((?  . "☐")
                                  ([ ] . "☐")
                                  ([X] . "☑")
                                  ([-] . "◯")))
  (org-modern-block-fringe nil)
  :config
  (global-org-modern-mode 1))

(use-package org-appear
  :ensure t
  :hook (org-mode . org-appear-mode)
  :custom
  (org-appear-autoemphasis   t)
  (org-appear-autolinks      t)
  (org-appear-autosubmarkers t)
  (org-appear-delay          0.15)) 

(defun my/org-mode-visual-setup ()
  (variable-pitch-mode 1)
  (visual-line-mode 1)
  (auto-fill-mode -1) 
  ;;(org-indent-mode -1)

  (when (bound-and-true-p evil-mode)
    (setq evil-auto-indent nil)))


(defun my/org-faces-setup ()
  ;; Headlines en variable-pitch + tailles progressives
  (dolist (face '(org-level-1 org-level-2 org-level-3 org-level-4
                  org-level-5 org-level-6 org-level-7 org-level-8))
    (set-face-attribute face nil
                        :font "Fira Sans"
                        :weight 'semibold           ; ou 'regular si tu préfères léger
                        :inherit 'variable-pitch))

  (set-face-attribute 'org-level-1 nil :height 1.60)
  (set-face-attribute 'org-level-2 nil :height 1.25)
  (set-face-attribute 'org-level-3 nil :height 1.2)
  (set-face-attribute 'org-level-4 nil :height 1.2)
  (set-face-attribute 'org-level-5 nil :height 1.2)
  (set-face-attribute 'org-level-6 nil :height 1.2)

  ;; Titre document très beau
  (set-face-attribute 'org-document-title nil
                      :height 2.0
                      :weight 'extra-bold
                      :inherit 'variable-pitch
                      :foreground "#60519b")

  ;; Code / blocks / table → fixed-pitch
  (set-face-attribute 'org-document-title nil
                      :height 2.0
                      :weight 'extra-bold
                      :inherit 'variable-pitch)

  ;; Les parties "code-like" → on hérite d'une liste pour plus de robustesse
  (set-face-attribute 'org-block nil
                      :inherit '(fixed-pitch default))   ; ← liste au lieu de symbole seul

  (set-face-attribute 'org-table nil
                      :inherit '(fixed-pitch default))

  (set-face-attribute 'org-formula nil
                      :inherit '(fixed-pitch default))

  (set-face-attribute 'org-code nil
                      :inherit '(shadow fixed-pitch default))

  (set-face-attribute 'org-verbatim nil
                      :inherit '(shadow fixed-pitch default))

  (set-face-attribute 'org-meta-line nil
                      :inherit '(font-lock-comment-face fixed-pitch default))

  (set-face-attribute 'org-special-keyword nil
                      :inherit '(font-lock-comment-face fixed-pitch default))

  (set-face-attribute 'org-checkbox nil
                      :inherit 'fixed-pitch))


(use-package org
  :hook ((org-mode . org-indent-mode)
         (org-mode . my/org-mode-visual-setup))
  :custom
  (org-agenda-files '("~/org/tasks.org"))
  (org-agenda-start-weekday 1)
  (org-agenda-span-week)
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-skip-scheduled-if-done t)
  (org-agenda-skip-timestamp-if-done t)
  (org-agenda-window-setup 'current-window)
  (org-agenda-repeating-timestamp-show-all nil)
  (org-agenda-block-separator ?-)
  (org-agenda-format-date " %A  %-d %B %Y ───────────────────────────────────────")
  (org-agenda-prefix-format '((agenda . " %i %-12:c%?-12t% s ")
                              (todo   . " %i %-12:c  ")
                              (tags   . " %i %-12:c  ")))
  (org-agenda-todo-ignore-scheduled 'future)
  (org-agenda-todo-ignore-deadlines 'far)
  (org-agenda-custom-commands
   '(("d" "Daily agenda + next actions"
      ((agenda "" ((org-agenda-span 'day)
                    (org-agenda-overriding-header "Aujourd'hui")))
       (tags-todo "+TODO=\"NEXT\"|TODO=\"TODO\"-SCHEDULED=\"<today>\"-DEADLINE=\"<today>\""
                  ((org-agenda-overriding-header "Prochaines actions")
                   (org-agenda-sorting-strategy '(priority-down todo-state-down)))))
x      nil nil)

     ("w" "Weekly overview"
      ((agenda "" ((org-agenda-span 'week)
                    (org-agenda-overriding-header "Semaine"))))
      nil nil)

     ("p" "Projects"
      ((tags-todo "+PROJECT"
                  ((org-agenda-overriding-header "Projets actifs")
                   (org-agenda-sorting-strategy '(priority-down)))))
      nil nil)))
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (shell . t)
    ;; (html . t)
     (js . t)
     ;;(go . t)
     ))
  ;;Settings
  (setq org-ellipsis               " ▾" ; ou " ↴" ou " ▼"
        org-log-done               'time
        org-log-into-drawer        t
        ;;org-agenda-files           '("~/org/tasks.org")
        org-startup-folded         'content
        org-startup-with-inline-images t
        org-image-actual-width     '(400)          ; ou '(0.6) pour pourcentage
        org-hide-leading-stars     t
        org-cycle-separator-lines  3
        org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0
        ;;org-babel-python-command "python3"
        )

  (add-hook 'org-mode-hook #'my/org-faces-setup))

(use-package org-roam
  :ensure t
  :custom 
  (org-roam-directory "~/org-roam")
  :config
  (org-roam-db-autosync-mode))
(use-package org-roam-ui
  :ensure t
  :after org-roam
  :config
  (setq ;;org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t))

(use-package org-modern-indent
  :load-path "~/emacs-packages/org-modern-indent/"
  :config
  (add-hook 'org-mode-hook #'org-modern-indent-mode 90))

;; (use-package org-bullets
;;   :hook (org-mode . org-bullets-mode)
;;   :custom (org-bullets-bullet-list '("◉" "○" "●" "○" "●")))

;; ============ Hydra ===========================================
(use-package hydra
  :demand t)
(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

;; ============ Treemacs ========================================
(use-package treemacs
  :defer t
  :bind
  ("<f8>" . treemacs)
  :config
  (setq treemacs-project-follow-mode t
        treemacs-follow-after-init t
        treemacs-lock-width t))

;; ============ Rainbow Delimiters ==============================
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; =========== Visual ===========================================
(defun org-mode-visual ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column :hook (org-mode . org-mode-visual))

;; =========== Vterm ============================================
(use-package vterm
  :commands vterm
  :bind
  ("<f5>" . vterm)
  :config
  (setq vterm-shell "zsh"))

;; ========== Dired =============================================
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons base16-theme corfu counsel dashboard
                   docker-compose-mode dockerfile-mode doom-modeline
                   doom-themes ein evil exec-path-from-shell go-mode
                   ivy-rich jupyter magit org-appear org-bullets
                   org-modern org-modern-indent org-roam-ui pdf-tools
                   popup projectile rainbow-delimiters terraform-mode
                   treemacs visual-fill visual-fill-column vterm
                   zig-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ========== Pdf Tools =======================================
(use-package pdf-tools
  :defer t
  :init (pdf-loader-install)
  :hook ((pdf-view-mode . (lambda () (auto-revert-mode -1)))
         ;;(pdf-view-mode . (lambda () (company-mode -1)))
         ))
