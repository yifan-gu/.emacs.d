;;;;Yifan's .emacs file
;; Yifan Gu
;; 17 January 2013

;; set username and mail address
(setq user-full-name "Yifan Gu")
(setq user-mail-address "guyifan1121@gmail.com")

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Set transparency of emacs
;;(set-frame-parameter (selected-frame) 'alpha '(85 85))
;;
;;(add-to-list 'default-frame-alist '(alpha 85 85))
;;
;;(set-face-attribute 'default nil :background "black"
;;  :foreground "white" :font "Courier" :height 180)



(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(set-frame-parameter (selected-frame) 'alpha 80)

;; metakey for macos
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;; (load-theme 'solarized-dark)
;; not to show GNU startup
;; (setq inhibit-startup-message t)
;; show key seq fast
(setq echo-keystrokes 0.1)
;; show line number
;;(add-hook 'find-file-hook (lambda () (linum-mode 1)))

;; not asking yes or no, use y/n
(fset 'yes-or-no-p 'y-or-n-p)
;; prevent rolling page jump too much, scroll-margin 3
(setq scroll-margin 3
      scroll-conservatively 10000)
(setq scroll-step 1)

;; move 4 line
(global-set-key "\M-n"  (lambda () (interactive) (next-line   4)) )
(global-set-key "\M-p"  (lambda () (interactive) (previous-line 4)) )

;; no menu bar
;;(menu-bar-mode nil)
;; no tool bar
;;(tool-bar-mode nil)
;; no scroll bar
;;(set-scroll-bar-mode nil)
;;no blink cursor

(set-scroll-bar-mode nil)
(tool-bar-mode -1)
(blink-cursor-mode 0)

;;(auto-image-file-mode t);;image mode
(show-paren-mode t);;
(setq mouse-yank-at-point t);; yank with middle key
(setq x-selet-enable-clipboard t);;emacs paste clip with other program
;; full screen
;;(set-frame-parameter nil 'fullscreen 'fullboth)

;;; automatically set the height
(set-frame-size (selected-frame) 166 90)

;;color theme
(add-to-list 'load-path "~/.emacs.d/lisp/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn (color-theme-initialize) ;;(color-theme-billw)
          (color-theme-tangotango)
          ))
;;font
;;(set-default-font "Monospace-16")
(set-default-font "Monaco-16")
;;(set-face-attribute 'default nil :family "Monaco" :height 160 :weight 'normal)


;; indent
(setq-default indent-tabs-mode nil)
(setq c-default-style "linux")
;;      c-basic-offset 4)

(require 'cc-mode)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "RET") 'newline-and-indent)

(require 'google-c-style)
(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-make-newline-indent)


;;set tramp default method
(setq tramp-default-method "ssh")

;;bash-complete
(require 'bash-completion)
(bash-completion-setup)

;;buffer-move: swap windows
(require 'buffer-move)
(global-set-key (kbd "<M-S-up>")     'buf-move-up)
(global-set-key (kbd "<M-S-down>")   'buf-move-down)
(global-set-key (kbd "<M-S-left>")   'buf-move-left)
(global-set-key (kbd "<M-S-right>")  'buf-move-right)
;;bind window move key
(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-down>") 'windmove-down)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-left>") 'windmove-left)


(setq ansi-color-names-vector
      ["black" "#EF2929" "green" "#FCE94F" "#728FCF" "#AD7FA8" "#34E2E2" "white"])
;;default vector:["black" "red" "green" "yellow" "blue" "magenta" "cyan" "white"]
;;
;;ibus for chinese input
;;(require 'ibus)
;;(add-hook 'after-init-hook 'ibus-mode-on)

;; Behave like vi's o command
(defun open-next-line (arg)
  "Move to the next line and then opens a line.
  See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))

(global-set-key (kbd "C-o") 'open-next-line)

;; Behave like vi's O command
(defun open-previous-line (arg)
  "Open a new line before the current one.
  See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))

(global-set-key (kbd "M-o") 'open-previous-line)

;; Autoindent open-*-lines
(defvar newline-and-indent t
  "Modify the behavior of the open-*-line functions to cause them to autoindent.")

;;compile keybinding
(global-set-key (kbd "C-c l") 'compile)
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20181015.1212")
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-snippets-20181020.1423")
(add-to-list 'load-path "~/.emacs.d/elpa/popup-20160709.1429")
(require 'popup)
(require 'yasnippet)
(require 'yasnippet-snippets)
(yas-global-mode 1)

;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

(setq yas-prompt-functions '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))

;;(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20170125.245")
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)

(setq explicit-shell-file-name "bash")
(setq comint-process-echoes t)

(require 'readline-complete)

(add-to-list 'ac-modes 'shell-mode)
(add-hook 'shell-mode-hook 'ac-rlc-setup-sources)
(add-hook 'c-mode-common-hook '(lambda ()
                                 ;; ac-omni-completion-sources is made buffer local so
                                 ;; you need to add it to a mode hook to activate on
                                 ;; whatever buffer you want to use it with.  This
                                 ;; example uses C mode (as you probably surmised).

                                 ;; auto-complete.el expects ac-omni-completion-sources to be
                                 ;; a list of cons cells where each cell's car is a regex
                                 ;; that describes the syntactical bits you want AutoComplete
                                 ;; to be aware of. The cdr of each cell is the source that will
                                 ;; supply the completion data.  The following tells autocomplete
                                 ;; to begin completion when you type in a . or a ->

                                 (add-to-list 'ac-omni-completion-sources
                                              (cons "\\." '(ac-source-semantic)))
                                 (add-to-list 'ac-omni-completion-sources
                                              (cons "->" '(ac-source-semantic)))

                                 ;; ac-sources was also made buffer local in new versions of
                                 ;; autocomplete.  In my case, I want AutoComplete to use
                                 ;; semantic and yasnippet (order matters, if reversed snippets
                                 ;; will appear before semantic tag completions).
                                 (setq ac-sources (append ac-sources '(ac-source-semantic ac-source-yasnippet)))
                                 ;;(setq ac-sources '(ac-source-semantic ac-source-yasnippet))
                                 ))
;;enable hi-lock-mode
(global-hi-lock-mode 1)
;;------------------------------------------------------------------------------------


;;open recent file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;(setq recentf-keep '(file-remote-p file-readable-p))

;; all backups goto ~/.backups instead in the current director
;;(setq backup-directory-alist (quote (("." . "~/.backups"))))
;;disable backups
(setq make-backup-files nil)


;;highlight symbol
;;(add-to-list 'load-path "~/.emacs.d/lisp/highlight-symbol")
(require 'highlight-symbol)
(global-set-key [f9] 'highlight-symbol-at-point)
(global-set-key [(control f9)] 'highlight-symbol-next)
(global-set-key [(meta f9)] 'highlight-symbol-prev)

;; ace jump mode major function
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; enable a more powerful jump back function from ace jump mode
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;If you use viper mode :
;;(define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;;If you use evil
;;(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

;;markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;indent for js
(setq js-indent-level 2)

;;ack-grep
(add-to-list 'load-path "~/.emacs.d/elpa/ack-and-a-half-1.2.0")
(require 'ack-and-a-half)
(defalias 'ag 'ack-and-a-half)
(defalias 'ag-same 'ack-and-a-half-same)
(defalias 'ag-find-file 'ack-and-a-half-find-file)
(defalias 'ag-find-file-same 'ack-and-a-half-find-file-same)

;; git-modes
(add-to-list 'load-path "~/.emacs.d/lisp/git-modes/")
;; magit
(add-to-list 'load-path "~/.emacs.d/lisp/magit/")
(eval-after-load 'info
  '(progn (info-initialize)
          (add-to-list 'Info-directory-list "~/.emacs.d/lisp/magit/")))
(require 'magit)

;; go mode
(add-to-list 'load-path "~/.emacs.d/elpa/go-mode-20181012.329")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; goimports
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;; format whole
(load "yformat")
(require 'yformat)

;; wrapper for open recentf
(load "recentf-wrapper")
(require 'recentf-wrapper)
(global-set-key (kbd "C-x 4 C-r") 'open-recentf-in-new-window)

;; add package PPAs
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; for c++11 standard
(require 'font-lock)

(defun --copy-face (new-face face)
  "Define NEW-FACE from existing FACE."
  (copy-face face new-face)
  (eval `(defvar ,new-face nil))
  (set new-face new-face))

(--copy-face 'font-lock-label-face  ; labels, case, public, private, proteced, namespace-tags
             'font-lock-keyword-face)
(--copy-face 'font-lock-doc-markup-face ; comment markups such as Javadoc-tags
             'font-lock-doc-face)
(--copy-face 'font-lock-doc-string-face ; comment markups
             'font-lock-comment-face)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(add-hook 'c++-mode-hook
          '(lambda()
             (font-lock-add-keywords
              nil '(;; complete some fundamental keywords
                    ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-type-face)
                    ;; add the new C++11 keywords
                    ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
                    ("\\<\\(char[0-9]+_t\\)\\>" . font-lock-keyword-face)
                    ;; PREPROCESSOR_CONSTANT
                    ("\\<[A-Z]+[A-Z_]+\\>" . font-lock-constant-face)
                    ;; hexadecimal numbers
                    ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
                    ;; integer/float/scientific numbers
                    ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
                    ;; user-types (customize!)
                    ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(t\\|type\\|ptr\\)\\>" . font-lock-type-face)
                    ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
                    ))
             ) t)

;; yaml mode
(add-to-list 'load-path "~/.emacs.d/lisp/yaml-mode/")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (groovy-mode jenkins php-mode terraform-mode lua-mode company omnisharp editorconfig csharp-mode ack-and-a-half jsonnet-mode go-mode yasnippet-snippets yasnippet shell-command rust-mode protobuf-mode popup julia-mode jedi golint go-autocomplete flx-ido exec-path-from-shell dash auto-complete-rst))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "GOROOT")


;; Rust mode
(add-to-list 'load-path "~/.emacs.d/elpa/rust-mode-20181008.1628")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;;(defalias 'yas/get-snippet-tables 'yas--get-snippet-tables)
;;(defalias 'yas/table-hash 'yas--table-hash)

(add-to-list 'load-path "~/.emacs.d/elpajsonnet-mode-20180822.1619")
(autoload 'jsonnet-mode "jsonnet-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.sonnet\\'" . jsonnet-mode))

;; csharp-mode.

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(eval-after-load
  'company
  '(add-to-list 'company-backends 'company-omnisharp))

;; Only auto-complete if the predecessor char is a dot or alphanumeric.
(defun my-omnisharp-auto-complete ()
  (interactive)
  (if (string-match "[\.\\|[:alnum:]]" (string (preceding-char)))
      (omnisharp-auto-complete)
    (indent-for-tab-command)))

(defun my-csharp-mode-setup ()
  (turn-on-font-lock)
  (turn-on-auto-revert-mode)(insert )
  (setq c-basic-offset 4)

  (omnisharp-mode)
  (company-mode)

  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)

  (local-set-key (kbd "<tab>") 'my-omnisharp-auto-complete)
  (local-set-key (kbd "C-c C-j") 'omnisharp-go-to-definition)
  (local-set-key (kbd "C-x 4 C-c C-j") 'omnisharp-go-to-definition-other-window)
  ;;(local-set-key (kbd "C-x-s") 'omnisharp-code-format-entire-file)
  (defalias 'fmt 'omnisharp-code-format-entire-file)
  )

  ;csharp-mode README.md recommends this too
  ;(electric-pair-mode 1)       ;; Emacs 24
  ;(electric-pair-local-mode 1) ;; Emacs 25

  ;;(local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  ;;(local-set-key (kbd "C-c C-c") 'recompile))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)

; Turn off the bell.
(setq ring-bell-function 'ignore)

