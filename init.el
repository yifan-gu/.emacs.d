;;;;Ivan's .emacs file
; Yifan Gu
; 17 January 2013

; set username and mail address
(setq user-full-name "Yifan Gu")
(setq user-mail-address "gu_yifan@vobile.com")
(defconst my-company "vobile")

(add-to-list 'load-path "~/.emacs.d/lisp")
;(load-theme 'solarized-dark)
; not to show GNU startup 
;(setq inhibit-startup-message t)
; show key seq fast
(setq echo-keystrokes 0.1)
; show line number
;(add-hook 'find-file-hook (lambda () (linum-mode 1)))

; not asking yes or no, use y/n
(fset 'yes-or-no-p 'y-or-n-p)
; prevent rolling page jump too much, scroll-margin 3
(setq scroll-margin 3
      scroll-conservatively 10000)
; no menu bar
(menu-bar-mode nil)
; no tool bar
(tool-bar-mode nil)
; no scroll bar
(set-scroll-bar-mode nil)

;(auto-image-file-mode t);image mode
(show-paren-mode t);
(setq mouse-yank-at-point t); yank with middle key
(setq x-selet-enable-clipboard t);emacs paste clip with other program
; full screen
(defun toggle-fullscreen()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  )
(toggle-fullscreen)

;color theme
(add-to-list 'load-path "~/.emacs.d/lisp/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
                 '(progn (color-theme-initialize) ;(color-theme-billw) 
                         (color-theme-tangotango)
                         ))
;font
(set-default-font "Monospace-10")
;(set-frame-font "Monaco-10")


; indent
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list ())
;c indent
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)
(require 'cc-mode)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)


;python autoindent
(add-hook 'python-mode-hook '(lambda ()
                               (local-set-key (kbd "RET") 'newline-and-indent)))

;autopair
;(require 'autopair)
;(autopair-global-mode) ;; enable autopair in all buffers


;kill whole line biding
;(global-set-key (kbd "M-g") 'kill-whole-line)
;
;CEDET
(load-file "~/.emacs.d/lisp/cedet-1.1/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu
;semantic config
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;(semantic-load-enable-guady-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)
;[f12] to jump
(global-set-key [f12] 'semantic-ia-fast-jump)
;[S-f12] to jump back
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
;(global-semantic-idle-completions-mode)
;
;set ssh as the tramp default method
;(setq tramp-default-method "ssh")

;bash-complete
(require 'bash-completion)
(bash-completion-setup)

; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

;buffer-move: swap windows
(require 'buffer-move)
(global-set-key (kbd "<M-S-up>")     'buf-move-up)
(global-set-key (kbd "<M-S-down>")   'buf-move-down)
(global-set-key (kbd "<M-S-left>")   'buf-move-left)
(global-set-key (kbd "<M-S-right>")  'buf-move-right)
;bind window move key
(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-down>") 'windmove-down)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-left>") 'windmove-left)

;;fringe background color black,
;(custom-set-variables
;  ;; custom-set-variables was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
; )
;(custom-set-faces
;  ;; custom-set-faces was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
; '(fringe ((((class color) (background dark)) (:background "black")))))

;color for shell
(setq ansi-color-names-vector
      ["black" "#EF2929" "green" "#FCE94F" "#728FCF" "#AD7FA8" "#34E2E2" "white"])
;default vector:["black" "red" "green" "yellow" "blue" "magenta" "cyan" "white"]
;
;ibus for chinese input
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

;compile keybinding
(global-set-key (kbd "C-c l") 'compile)

(add-to-list 'load-path "~/.emacs.d/lisp/yasnippet-0.6.1c")
(require 'yasnippet)
;(yas-global-mode 1)
(yas/initialize)
(yas/load-directory "~/.emacs.d/lisp/yasnippet-0.6.1c/snippets")
(setq yas/trigger-key (kbd "M-["))
;
;;;auto complete
(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete-1.3.1/ac-dict")
(ac-config-default)
(require 'ac-python)
;add ac-source-semantic to all buffer
;(defun ac-common-setup ()
;  (setq ac-sources (append ac-sources '(ac-source-semantic-raw)))
;  )
(defun ac-common-setup ()
  (setq ac-sources (append ac-sources '(ac-source-yasnippet)))
  )

(with-no-warnings
;; >0.6.0
(apply 'append (mapcar 'ac-yasnippet-candidate-1
                       (yas/get-snippet-tables)))
)
;;shell autocomplete
(add-to-list 'load-path "~/.emacs.d/lisp/readline-complete")
(require 'readline-complete)

(add-to-list 'ac-modes 'shell-mode)
(add-hook 'shell-mode-hook 'ac-rlc-setup-sources)

