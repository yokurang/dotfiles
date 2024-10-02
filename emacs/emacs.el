
;;; init.el --- Complete Emacs configuration for development

;;; Commentary:
;; Efficient development environment with LSP, Company, Flycheck,
;; Treemacs, Vim keybindings, and language-specific setups for OCaml, Coq, Rust, C++, and Python.

;;; Code:

;; Basic Emacs Configurations
(setq inhibit-startup-message t)
(setq visible-bell t)
(show-paren-mode t)
(global-display-line-numbers-mode)

;; Suppress warnings below the error level
(setq warning-minimum-level :error)

;; Package Management
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Theme
(use-package dracula-theme
  :ensure t)

(use-package gruvbox-theme
  :ensure t)

(use-package solarized-theme
  :ensure t)

(use-package zenburn-theme
  :ensure t)

(use-package monokai-theme
  :ensure t)

(use-package nord-theme
  :ensure t)

(use-package material-theme
  :ensure t)

(use-package atom-one-dark-theme
  :ensure t)

;; Define the list of themes to cycle through
(defvar my-theme-list
  '(misterioso dracula gruvbox-dark-medium solarized-dark zenburn
    monokai nord material atom-one-dark)
  "List of themes to cycle through.")

;; Function to cycle through themes
(defun my/cycle-themes ()
  "Cycle through a list of themes specified in `my-theme-list`."
  (interactive)
  (when my-theme-list
    ;; Disable all active themes
    (mapc #'disable-theme custom-enabled-themes)
    ;; Rotate the list and load the first theme
    (let ((next-theme (pop my-theme-list)))
      (setq my-theme-list (append my-theme-list (list next-theme)))
      (load-theme next-theme t)
      (message "Switched to theme: %s" (symbol-name next-theme)))))

;; Bind the theme cycling function to a key
(global-set-key (kbd "C-c t h") 'my/cycle-themes)

;; Evil (Vim keybindings)
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; LSP Mode
(use-package lsp-mode
  :hook ((c-mode . lsp)
         (c++-mode . lsp)
         (rust-mode . lsp)
         (python-mode . lsp)
         (tuareg-mode . lsp)
         (coq-mode . lsp)) 
  :commands lsp
  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-file-watch-threshold 2000)
  :config
  (setq lsp-idle-delay 0.500)
  ;; Ensure coq-lsp is used for Coq files
  (with-eval-after-load 'lsp-mode
    (add-to-list 'lsp-language-id-configuration '(coq-mode . "coq"))

    (lsp-register-client
     (make-lsp-client :new-connection (lsp-stdio-connection "coq-lsp")
                      :major-modes '(coq-mode)
                      :server-id 'coq-lsp))))

;; LSP UI for better diagnostics
(use-package lsp-ui
  :commands lsp-ui-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-delay 0.2)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-code-actions t)
  :hook (lsp-mode . lsp-ui-mode))

;; Company for Autocompletion
(use-package company
  :hook (after-init . global-company-mode)
  :custom
  (company-idle-delay 0.1)
  (company-minimum-prefix-length 1))

;; Adjust company backends for Coq
(defun my-coq-mode-setup ()
  (set (make-local-variable 'company-backends)
       '((company-lsp company-coq-backend company-dabbrev-code))))
(add-hook 'coq-mode-hook #'my-coq-mode-setup)

;; Flycheck for Syntax Checking
(use-package flycheck
  :init (global-flycheck-mode))

;; Flycheck Posframe for error popups
(use-package flycheck-posframe
  :hook (flycheck-mode . flycheck-posframe-mode)
  :custom
  (flycheck-posframe-border-width 1))

;; C++ Development
(use-package ccls
  :hook ((c-mode c++-mode) . (lambda () (require 'ccls) (lsp)))
  :custom
  (ccls-initialization-options
   '(:index (:trackDependency 1)
     :completion (:detailedLabel t)))
  (lsp-prefer-flymake nil))

;; Python Development
(use-package python-mode
  :hook (python-mode . lsp))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))

;; Auto-format Python code on save
(use-package blacken
  :hook (python-mode . blacken-mode)
  :custom
  (blacken-line-length 88))

;; Rust Development
(use-package rust-mode
  :hook (rust-mode . lsp)
  :custom
  (rust-format-on-save t))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

;; OCaml Development Setup
(use-package tuareg
  :ensure t
  :mode ("\\.ml[iylp]?\\'" . tuareg-mode)
  :config
  (define-key tuareg-mode-map (kbd "C-c C-b") 'tuareg-eval-buffer)
  (define-key tuareg-mode-map (kbd "C-c C-r") 'tuareg-eval-region)
  (define-key tuareg-mode-map (kbd "C-c C-e") 'tuareg-eval-phrase))

(use-package merlin
  :ensure t
  :hook (tuareg-mode . merlin-mode)
  :config
  (setq merlin-command 'opam))

(use-package dune
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("/dune\\'" . dune-mode))
  (add-to-list 'auto-mode-alist '("/dune-project\\'" . dune-mode)))

;; OPAM setup for OCaml
(when (executable-find "opam")
  (let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
    (when (and opam-share (file-directory-p opam-share))
      (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
      (autoload 'merlin-mode "merlin" nil t nil)
      (add-hook 'tuareg-mode-hook 'merlin-mode t)
      (add-hook 'caml-mode-hook 'merlin-mode t))))

;; Set up ocp-indent for better indentation
(require 'ocp-indent)

;; Ensure Flycheck uses Merlin for OCaml
(with-eval-after-load 'flycheck
  (setq merlin-error-after-save nil)
  (flycheck-ocaml-setup))

(use-package flycheck-ocaml
  :ensure t
  :after flycheck
  :config
  (flycheck-ocaml-setup))

;; Coq Development
(use-package proof-general
  :ensure t)

(use-package company-coq
  :hook (coq-mode . company-coq-mode))

;; Project Management
(use-package projectile
  :init
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map))

;; Git Integration
(use-package magit
  :bind ("C-x g" . magit-status))

;; Ivy, Counsel, and Swiper
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-count-format "(%d/%d) "
        ivy-use-virtual-buffers t
        ivy-initial-inputs-alist nil))

(use-package counsel
  :after ivy
  :bind (("C-x C-f" . counsel-find-file)
         ("M-x" . counsel-M-x)
         ("C-x b" . counsel-switch-buffer))
  :config (counsel-mode 1))

(use-package swiper
  :bind (("C-s" . swiper)
         ("C-r" . swiper-backward))
  :config
  (setq swiper-action-recenter t
        swiper-include-line-number-in-search t))

;; Which Key for keybinding help
(use-package which-key
  :init (which-key-mode)
  :custom (which-key-idle-delay 0.5))

;; Snippets
(use-package yasnippet
  :init (yas-global-mode 1))

;; Rainbow mode
(use-package rainbow-mode
  :ensure t
  :hook (prog-mode . rainbow-mode))

;; Treemacs
(use-package treemacs
  :ensure t
  :bind (("C-x t t" . treemacs)
         ("C-x t b" . treemacs-bookmark)
         ("C-x t f" . treemacs-find-file))
  :custom
  (treemacs-width 30)
  :config
  (use-package treemacs-all-the-icons
    :ensure t
    :config (treemacs-load-theme "all-the-icons"))
  (use-package treemacs-projectile
    :after projectile
    :ensure t)
  (use-package treemacs-magit
    :after magit
    :ensure t))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; Dashboard settings
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-projects-backend 'project-el
        dashboard-banner-logo-title "Welcome to Emacs Dashboard"
        dashboard-startup-banner 'official  ;; Display the Emacs logo
        dashboard-center-content t
        dashboard-set-footer nil
        dashboard-page-separator "\n\n\n"
        dashboard-items '((projects . 15)
                          (recents  . 15)
                          (bookmarks . 5)))
  (dashboard-setup-startup-hook))

(use-package reveal-in-osx-finder
  :if (memq window-system '(mac ns)))


;; Highlight uncommitted changes using VC
(use-package diff-hl
  :config
  (global-diff-hl-mode 1))


;; EditorConfig Emacs Plugin
(use-package editorconfig
  :config
  (editorconfig-mode 1))


;; Save minibuffer history
(use-package savehist
  :ensure nil
  :init
  (savehist-mode 1))

;; Enrich existing commands with completion annotations
(use-package marginalia
  :init 
  (marginalia-mode 1))

;; display the definition of word at point
(use-package define-word
  :defer t
  :bind (:map custom-bindings-map ("C-c D" . define-word-at-point)))

;; Insert template words
(use-package lorem-ipsum)

;; Emacs support library for PDF files
(use-package pdf-tools
  :defer t
  :mode "\\.pdf\\'"
  :bind (:map pdf-view-mode-map
              ("c" . (lambda ()
                       (interactive)
                       (if header-line-format
                           (setq header-line-format nil)
                         (nano-modeline-pdf-mode))))
              ("j" . pdf-view-next-line-or-next-page)
              ("k" . pdf-view-previous-line-or-previous-page))
  :hook (pdf-view-mode
         . (lambda ()
             (nano-modeline-pdf-mode)))
  :init (pdf-loader-install)
  :config (add-to-list 'revert-without-query ".pdf"))

;; Outline-based notes management and organizer
(use-package org
  :defer t
  :config
  (setq org-adapt-indentation t
        org-hide-leading-stars t
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-src-fontify-natively t
        org-startup-folded t
        org-edit-src-content-indentation 0))

;; Working with Code Blocks in Org
(use-package ob
  :ensure nil
  :after org
  :config
  (setq org-export-use-babel nil
        ;; Prompt before executing code blocks for security
        org-confirm-babel-evaluate t)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python     . t)
     (C          . t)
     (ocaml      . t)
     (rust       . t))))

;; Babel Functions for Python
(use-package ob-python
  :ensure nil
  :after (ob python)
  :config
  (setq org-babel-python-command python-shell-interpreter))

(setq org-babel-C-compiler "gcc")   ;; For C
(setq org-babel-C++-compiler "g++") ;; For C++

(use-package ob-rust
  :ensure t
  :after org)

(setq org-confirm-babel-evaluate
      (lambda (lang body)
        (not (member lang '("python" "C" "C++" "ocaml" "rust" "emacs-lisp")))))

;; Modern looks for Org
(use-package org-modern
  :after org
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-block-fringe nil))

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;; Export Github Flavored Markdown from Org
(use-package ox-gfm
  :after (org))

(use-package org-present
  :after center-content-mode
  :hook ((org-present-mode
          . (lambda ()
              (jinx-mode -1)
              (org-modern-mode -1)
              (set (make-local-variable 'org-modern-hide-stars) t)
              (setq cursor-type nil)
              (org-modern-mode 1)
              (org-present-big)
              (org-display-inline-images)
              (focus-mode 1)
              (center-content-mode 1)))
         (org-present-mode-quit
          . (lambda ()
              (jinx-mode 1)
              (org-modern-mode -1)
              (setq org-modern-hide-stars (default-value 'org-modern-hide-stars))
              (setq cursor-type (default-value 'cursor-type))
              (org-modern-mode 1)
              (focus-mode -1)
              (center-content-mode -1))))
  :config
  (defun org-present-next-item ()
    (interactive)
    (unless (re-search-forward "^+" nil t)
      (org-present-next)))

  (defun org-present-prev-item ()
    (interactive)
    (unless (re-search-backward "^+" nil t)
      (org-present-prev)))

  :bind (:map org-present-mode-keymap
              ("<next>" . org-present-next-item)
              ("C-<right>" . org-present-next-item)
              ("<prior>" . org-present-prev-item)
              ("C-<left>" . org-present-prev-item)))

;; Emacs Major mode for Markdown-formatted files
(use-package markdown-mode
  :defer t
  :hook (markdown-mode . (lambda () (setq fill-column 72))))

(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-hide-results t))

(use-package package-utils
  :ensure t)

;; Provide init
(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ocp-indent 0blayout exec-path-from-shell zzz-to-char zygospore zuul yasnippet-snippets xclip which-key web-mode vertico tuareg treesit-auto treemacs-projectile treemacs-magit treemacs-all-the-icons tree-sitter-langs tree-sitter-ispell tree-sitter-indent track-changes tabspaces srefactor sqlite3 skewer-mode shrface rustic rust-playground rtags reason-mode realgud rainbow-mode racer python-mode pytest proof-general pretty-hydra pandoc-mode package-lint-flymake org-appear orderless oauth2 nov nord-theme neotree modern-cpp-font-lock marginalia lsp-ui lsp-pyright lsp-ivy leetcode irony-eldoc ibuffer-project helpful helm-xref helm-lsp helm-gtags git-gutter ghub+ ggtags general function-args forge flycheck-rust flycheck-posframe flycheck-pos-tip flycheck-ocaml flycheck-irony evil-nerd-commenter evil-collection emmet-mode embark-consult elpy elisp-demos ein editorconfig ecb dune dumb-jump dracula-theme disaster denote dap-mode counsel corfu-terminal company-jedi company-irony-c-headers company-irony company-coq company-box cmake-mode cmake-ide clang-format ccls cargo cape calibredb breadcrumb blacken auto-complete all-the-icons-nerd-fonts alert aggressive-indent)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
