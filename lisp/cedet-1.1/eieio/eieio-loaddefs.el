;;; eieio-loaddefs.el --- Auto-generated CEDET autoloads
;;
;;; Code:


;;;### (autoloads (chart-test-it-all) "chart" "chart.el" (23502 24461))
;;; Generated autoloads from chart.el

(autoload (quote chart-test-it-all) "chart" "\
Test out various charting features.

\(fn)" t nil)

;;;***

;;;### (autoloads (data-debug-show data-debug-insert-object-button
;;;;;;  data-debug-insert-object-slots) "eieio-datadebug" "eieio-datadebug.el"
;;;;;;  (23502 24461))
;;; Generated autoloads from eieio-datadebug.el

(autoload (quote data-debug-insert-object-slots) "eieio-datadebug" "\
Insert all the slots of OBJECT.
PREFIX specifies what to insert at the start of each line.

\(fn OBJECT PREFIX)" nil nil)

(autoload (quote data-debug-insert-object-button) "eieio-datadebug" "\
Insert a button representing OBJECT.
PREFIX is the text that preceeds the button.
PREBUTTONTEXT is some text between PREFIX and the object button.

\(fn OBJECT PREFIX PREBUTTONTEXT)" nil nil)

(autoload (quote data-debug-show) "eieio-datadebug" "\
Run ddebug against any EIEIO object OBJ

\(fn (OBJ eieio-default-superclass))" nil nil)

;;;***

;;;### (autoloads (eieio-describe-generic eieio-describe-constructor
;;;;;;  eieio-describe-class eieio-browse) "eieio-opt" "eieio-opt.el"
;;;;;;  (23502 24461))
;;; Generated autoloads from eieio-opt.el

(autoload (quote eieio-browse) "eieio-opt" "\
Create an object browser window to show all objects.
If optional ROOT-CLASS, then start with that, otherwise start with
variable `eieio-default-superclass'.

\(fn &optional ROOT-CLASS)" t nil)

(defalias (quote describe-class) (quote eieio-describe-class))

(autoload (quote eieio-describe-class) "eieio-opt" "\
Describe a CLASS defined by a string or symbol.
If CLASS is actually an object, then also display current values of that object.
Optional HEADERFCN should be called to insert a few bits of info first.

\(fn CLASS &optional HEADERFCN)" t nil)

(autoload (quote eieio-describe-constructor) "eieio-opt" "\
Describe the constructor function FCN.
Uses `eieio-describe-class' to describe the class being constructed.

\(fn FCN)" t nil)

(defalias (quote describe-method) (quote eieio-describe-generic))

(defalias (quote describe-generic) (quote eieio-describe-generic))

(defalias (quote eieio-describe-method) (quote eieio-describe-generic))

(autoload (quote eieio-describe-generic) "eieio-opt" "\
Describe the generic function GENERIC.
Also extracts information about all methods specific to this generic.

\(fn GENERIC)" t nil)

;;;***

;;;### (autoloads (eieio-perftest-onemethodcall eieio-perftest-methodcall)
;;;;;;  "eieio-perftest" "eieio-perftest.el" (23502 24461))
;;; Generated autoloads from eieio-perftest.el

(autoload (quote eieio-perftest-methodcall) "eieio-perftest" "\
Test and time performance of method invocation.

\(fn)" t nil)

(autoload (quote eieio-perftest-onemethodcall) "eieio-perftest" "\
Test and time performance of method invocation.

\(fn)" t nil)

;;;***

;;;### (autoloads (enable-visual-studio-bookmarks) "linemark" "linemark.el"
;;;;;;  (23502 24461))
;;; Generated autoloads from linemark.el

(autoload (quote enable-visual-studio-bookmarks) "linemark" "\
Bind the viss bookmark functions to F2 related keys.
\\<global-map>
\\[viss-bookmark-toggle]     - To=ggle a bookmark on this line.
\\[viss-bookmark-next-buffer]   - Move to the next bookmark.
\\[viss-bookmark-prev-buffer]   - Move to the previous bookmark.
\\[viss-bookmark-clear-all-buffer] - Clear all bookmarks.

\(fn)" t nil)

;;;***

;;;### (autoloads (lmcompile-do-highlight) "lmcompile" "lmcompile.el"
;;;;;;  (23502 24461))
;;; Generated autoloads from lmcompile.el

(autoload (quote lmcompile-do-highlight) "lmcompile" "\
Do compilation mode highlighting.
Works on grep, compile, or other type mode.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("eieio-base.el" "eieio-comp.el" "eieio-custom.el"
;;;;;;  "eieio-doc.el" "eieio-load.el" "eieio-speedbar.el" "eieio-test-methodinvoke.el"
;;;;;;  "eieio-test-mro.el" "eieio-test-persist.el" "eieio-tests.el"
;;;;;;  "eieio.el") (23502 29378 329047))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; eieio-loaddefs.el ends here
