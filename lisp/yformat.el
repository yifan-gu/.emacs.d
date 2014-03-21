;; A simple formatting plugin, inspired by gofmt
;;
;; By Yifan Gu, Feb. 8, 2014
;;
;; Have fun!

;; TODO:
;; blank line / finished
;; duplicate white space
;; white space after comma,
;; white space before/after =,
;; white space before/after operators,

(defun replace-part-regexp-with-string (regexp string substart subend)
  (goto-char (point-min))
  ;; TODO: igore eof, throw other errors
  (ignore-errors
    (while (search-forward-regexp regexp)
      (setq end (point))
      (search-backward-regexp regexp)
      (setq start (point))
      (replace-regexp (substring regexp substart subend) string nil start end))))

(defun delete-blank-lines-around-braces ()
  "delete blank lines before or after `{}`"
  (beginning-of-buffer)
  (replace-regexp "{\n[\n]+" "{\n")
  (replace-regexp "\n[\n]+}" "\n}"))

(defun normal-mode-handle-blank-lines ()
  (beginning-of-buffer)
  (replace-regexp "\n\n[\n]+" "\n\n")

  ;; add one line after `}` or `};` if there is no lines
  (replace-part-regexp-with-string "}\n[^\n^\s]" "}\n\n" 0 -6)
  (replace-part-regexp-with-string "};\n[^\n^\s]" "};\n\n" 0 -6)

  (delete-blank-lines-around-braces))

(defun c++-mode-handle-blank-lines ()
  ;; squash multiple blank lines to two blank lines
  (beginning-of-buffer)
  (replace-regexp "\n\n\n[\n]+" "\n\n\n")

  ;; squash multiple blank lines within a block (within `{}` into one line
  (replace-part-regexp-with-string "\n\n[\n]+[\s]" "\n\n" 0 -3)
  ;;
  ;;;; add two lines after `}` or `};` when there is only zero or one line.
  (replace-part-regexp-with-string "}\n[\n]?[^\n^\s]" "}\n\n\n" 0 -6)
  (replace-part-regexp-with-string "};\n[\n]?[^\n^\s]" "};\n\n\n" 0 -6)

  (delete-blank-lines-around-braces))

(defun fmt ()
  "format the text"
  (interactive)
  (beginning-of-line)
  (set 'origin (point))

  ;; delete white spaces in blank lines
  (beginning-of-buffer)
  (replace-regexp "[\s]+\n" "\n")

  ;; delete duplicate blank lines
  (if (equal major-mode 'c++-mode)
      ;; two lines outside of classes (for mesos)
      (c++-mode-handle-blank-lines)
    (normal-mode-handle-blank-lines))

  ;; indent
  (indent-region (point-min) (point-max) nil)

  ;; delete tailing blank lines
  (goto-char (point-max))
  (set 'movement (skip-chars-backward "\n\r\t"))
  (if (not (equal movement -1))
      (progn
        (delete-region (point) (point-max))
        (insert "\n")))

  ;; move back
  (goto-char origin)
  (beginning-of-line)
  (message "formatting done"))

(provide 'yformat)
