;; A simple wrapper for recentf to open recent file list in
;; another window.
;;
;; By Yifan Gu, Feb. 8, 2014
;; All copyright reserved
;;
;; Have fun!
;;
;;
;; usage:
;;
;; put this file in your emacs load path.
;; add following lines in your .emacs file:
;;
;; (load "recentf-wrapper")
;; (require 'recentf_wrapper)
;; (global-set-key (kbd "C-x 4 C-r") 'open-recentf-in-new-window)
;;

(require 'windmove)

(defun open-recentf-in-new-window ()
  (interactive)
  (setq other-win (windmove-find-other-window 'right))
  (if other-win
      ;; move to right
      (windmove-right)
    (progn
      ;; test if have left window
      (setq other-win (windmove-find-other-window 'left))
      (if other-win
          ;; move to left
          (windmove-left)
        (progn
          ;; no other window, let's open a new window on right
          (split-window-horizontally)
          (windmove-right)))))

  ;; open recent-file dialog
  (recentf-open-files))

(provide 'recentf-wrapper)
