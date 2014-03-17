;; A simple format function, inspired by gofmt
;;
;; By Yifan Gu, Feb. 8, 2014
;; All copyright reserved
;;
;; Have fun!

;; TODO:
;; blank line / finished
;; duplicate white space
;; white space after comma,
;; white space before/after =,
;; white space before/after operators,
;; white space before/after {},

(defun double-blank-line-between-braces ()
  "make two blank lines between classes, structs, etc"
  (beginning-of-buffer)
  (replace-regexp "}\n\n" "}\n\n\n")
  (beginning-of-buffer)
  (replace-regexp "};\n\n" "};\n\n\n")
  )

(defun fmt ()
  "format the text"
  (interactive)
  (beginning-of-line)
  (set 'origin (point))

  ;; delete white spaces in blank lines
  (beginning-of-buffer)
  (replace-regexp "[\s]+\n" "\n")

  ;; delete duplicate blank lines
  (beginning-of-buffer)
  (replace-regexp "\n\n[\n]+" "\n\n")
  (if (equal major-mode 'c++-mode)
      ;; two lines outside of classes (for mesos)
      (double-blank-line-between-braces)
    )

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
