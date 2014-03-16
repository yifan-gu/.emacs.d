;;;;Yifan's .emacs file
;; Yifan Gu
;; 17 January 2013

;; set username and mail address
(setq user-full-name "Yifan Gu")
(setq user-mail-address "guyifan1121@gmail.com")

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(set-frame-parameter (selected-frame) 'alpha 80)

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
(defun toggle-fullscreen()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  )
(toggle-fullscreen)

;;color theme
(add-to-list 'load-path "~/.emacs.d/lisp/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn (color-theme-initialize) ;;(color-theme-billw)
          (color-theme-tangotango)
          ))
;;font
(set-default-font "Monospace-10")
;;(set-frame-font "Monaco-10")

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

;;python autoindent
;;(add-hook 'python-mode-hook '(lambda ()
;;							   (local-set-key (kbd "RET") 'newline-and-indent)))
;;shell-scriptmode autoindent
;;(add-hook 'sh-mode-hook '(lambda()

;;							  (local-set-key (kbd "RET") 'newline-and-indent)))
;;elisp mode autoindent
;;(add-hook 'emacs-lisp-mode-hook '(lambda()
;;							  (local-set-key (kbd "RET") 'newline-and-indent)))
;;(add-hook 'javascript-mode-hook '(lambda()
;;								   (local-set-key (kbd "RET") 'newline-and-indent)))
;;(add-hook 'html-mode-hook '(lambda()
;;		  (local-set-key (kbd "RET") 'newline-and-indent)))
;;

;;autopair
;;(require 'autopair)
;;(autopair-global-mode) ;; enable autopair in all buffers

;;kill whole line biding
;;(global-set-key (kbd "M-g") 'kill-whole-line)
;;
;;CEDET
(load-file "~/.emacs.d/lisp/cedet-1.1/common/cedet.el")
(global-ede-mode 1)                      ;; Enable the Project management system
(semantic-load-enable-code-helpers)      ;; Enable prototype help and smart completion
(global-srecode-minor-mode 1)            ;; Enable template insertion menu
;;semantic config
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;;(semantic-load-enable-guady-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-semantic-debugging-helpers)
;;[f12] to jump
(global-set-key [f12] 'semantic-ia-fast-jump)
;;[S-f12] to jump back
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;; (setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list "." ".." "./include" "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(defconst cedet-win32-include-dirs
  (list "/usr/lib/gcc/i586-mingw32msvc/4.2.1-sjlj/include"
        "/usr/lib/gcc/i586-mingw32msvc/4.2.1-sjlj/include/c++/"
        "/usr/lib/gcc/i586-mingw32msvc/4.2.1-sjlj/include/backward"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;;(global-semantic-idle-completions-mode)
;;
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
(global-set-key (kbd "<S-up>") 'windmove-up)
(global-set-key (kbd "<S-down>") 'windmove-down)
(global-set-key (kbd "<S-right>") 'windmove-right)
(global-set-key (kbd "<S-left>") 'windmove-left)

;;fringe background color black,
;;(custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; )
;;(custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; '(fringe ((((class color) (background dark)) (:background "black")))))

;;color for shell
(setq ansi-color-names-vector
      ["black" "#EF2929" "green" "#FCE94F" "#728FCF" "#AD7FA8" "#34E2E2" "white"])
;;default vector:["black" "red" "green" "yellow" "blue" "magenta" "cyan" "white"]
;;
;;ibus for chinese input
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)

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
(add-to-list 'load-path "~/.emacs.d/lisp/yasnippet-0.6.1c")
(require 'popup)
(require 'yasnippet)
;;(yas-global-mode 1)
(yas/initialize)
(yas/load-directory "~/.emacs.d/lisp/yasnippet-0.6.1c/snippets")
(setq yas/trigger-key (kbd "M-["))
;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas/popup-isearch-prompt (prompt choices &optional display-fn)
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

(setq yas/prompt-functions '(yas/popup-isearch-prompt yas/no-prompt))
;;auto complete
;;-----------------------------------------------------------------------------------

;;(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete-1.3.1/ac-dict")
(ac-config-default)

;;python autocompletion using jedi.el
(add-to-list 'load-path "~/.emacs.d/lisp/emacs-ctable")
(add-to-list 'load-path "~/.emacs.d/lisp/emacs-deferred")
(add-to-list 'load-path "~/.emacs.d/lisp/emacs-epc")
(add-to-list 'load-path "~/.emacs.d/lisp/emacs-jedi")
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;;(require 'ac-python)
;;add ac-source-semantic to all buffer
;;(defun ac-common-setup ()
;;  (setq ac-sources (append ac-sources '(ac-source-semantic-raw)))
;;  )
(defun ac-common-setup ()
  (setq ac-sources (append ac-sources '(ac-source-yasnippet)))
  )

(with-no-warnings
  ;; >0.6.0
  (apply 'append (mapcar 'ac-yasnippet-candidate-1
                         (yas/get-snippet-tables)))
  )
;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                           (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)
;;shell autocomplete

(setq explicit-shell-file-name "bash")
(setq explicit-bash-args '("-ct" "export EMACS=;; stty echo;; bash"))
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
;;------------web mode--------------
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;;(set-face-attribute 'web-mode-doctype-face nil :foreground "green")
;;(set-face-attribute 'web-mode-html-tag-face nil :bold t :foreground "#edd440")
(set-face-attribute 'web-mode-html-tag-face nil :foreground "#edd440")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "tomato")
;;(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "8ae234")

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (ac-common-setup))
(add-hook 'web-mode-hook 'web-mode-hook)
;;(add-to-list 'web-mode-snippets '("mydiv" "<div>" "</div>"))
;;----------end----------------------
;;vi emulation
;;(add-to-list 'load-path "~/.emacs.d/lisp/evil")
;;(require 'evil)
;;(evil-mode 1)
(global-set-key (kbd "M-z") 'vi-mode)

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

;; mew -- mail
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
;; Optional setup (Read Mail menu for Emacs 21):
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))
;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

;;highlight symbol
;;(add-to-list 'load-path "~/.emacs.d/lisp/highlight-symbol")
(require 'highlight-symbol)
(global-set-key [f11] 'highlight-symbol-at-point)
(global-set-key [(control f11)] 'highlight-symbol-next)
(global-set-key [(meta f11)] 'highlight-symbol-prev)

;;FUN Functions---------------------------------------------------------
;; w3m web browser
;;(setq browse-url-browser-function 'w3m-browse-url)
;;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
;;(global-set-key "\C-xm" 'browse-url)
;;(setq w3m-use-cookies t)

;;weibo
(add-to-list 'load-path "~/.emacs.d/lisp/weibo")
(require 'weibo)
;;end--------------------------------------------------------------------

;; ORG MODE
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/org-mode/lisp"))
(load-file "~/.emacs.d/lisp/htmlize.el")
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)
(setq org-agenda-files (quote ("~/Dropbox/org"
                               "~/Dropbox/org/CMU"
                               "~/Dropbox/org/Project")))

;;export
(require 'ox-html)
(require 'ox-latex)
(require 'ox-ascii)
;;(setq org-ditaa-jar-path "~/usr/bin/ditaa")
(setq org-plantuml-jar-path "~/java/plantuml.jar")
(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)

;; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (ditaa . t)
         (R . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (sh . t)
         (ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

;; Do not prompt to confirm evaluation
;; This may be dangerous - make sure you understand the consequences
;; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

;; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

;; Don't enable this because it breaks access to emacs from my Android phone
(setq org-startup-with-inline-images nil)

;;auctex mode
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))

(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
            (setq TeX-command-default "XeLaTeX")))

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

;;julia mode
(require 'julia-mode)

;;protobuf mode
(require 'protobuf-mode)

;;ack-grep
(require 'ack-and-a-half)
;; Create shorter aliases
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
(add-to-list 'load-path "~/.emacs.d/lisp/go")
(require 'go-mode-load)
(require 'auto-complete-config)
(require 'go-autocomplete)

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
                    ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
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
