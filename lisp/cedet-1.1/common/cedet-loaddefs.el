;;; cedet-loaddefs.el --- Auto-generated CEDET autoloads
;;
;;; Code:


;;;### (autoloads (cedet-android-sdk-update-classpath cedet-android-adb-shell
;;;;;;  cedet-android-adb-version-check cedet-android-adb-devices
;;;;;;  cedet-android-adb-help cedet-android-start-ddms cedet-android-layoutopt
;;;;;;  cedet-android-target-list cedet-android-create-project) "cedet-android"
;;;;;;  "cedet-android.el" (23502 24461))
;;; Generated autoloads from cedet-android.el

(autoload (quote cedet-android-create-project) "cedet-android" "\
Create an android project with NAME.
Your activity class will be created in the java PACKAGE.
You need to specify a TARGET, which is a number specifying the desired type
of package you intend to build.
Create the project in optional DIR, or in the default directory if not specified.
NAME will be used as the name of the project.

\(fn NAME PACKAGE TARGET &optional DIR)" t nil)

(autoload (quote cedet-android-target-list) "cedet-android" "\
Get the list of available targets for an android environment.

\(fn)" t nil)

(autoload (quote cedet-android-layoutopt) "cedet-android" "\
Get the list of available targets for an android environment.
Argument PROJECTROOT is the directory root of some project to be optimized.

\(fn PROJECTROOT)" t nil)

(autoload (quote cedet-android-start-ddms) "cedet-android" "\
Start Android's ddms debugging proxy.

\(fn)" t nil)

(autoload (quote cedet-android-adb-help) "cedet-android" "\
Get help for Android Debug Bridge.

\(fn)" t nil)

(autoload (quote cedet-android-adb-devices) "cedet-android" "\
The the list of attached devices from Android Debug Bridge.

\(fn)" t nil)

(autoload (quote cedet-android-adb-version-check) "cedet-android" "\
Check the version of the installed Android ADB command.
If optional programatic argument NOERROR is non-nil, then
instead of throwing an error if Global isn't available, then
return nil.

\(fn &optional NOERROR)" t nil)

(autoload (quote cedet-android-adb-shell) "cedet-android" "\
Create an inferior shell for Android Debug Bridge.

\(fn)" t nil)

(autoload (quote cedet-android-sdk-update-classpath) "cedet-android" "\
Update the classpath for `cedet-java' to include the android compile-time libraries.

\(fn)" t nil)

;;;***

;;;### (autoloads (cedet-update-autoloads) "cedet-autogen" "cedet-autogen.el"
;;;;;;  (23502 24461))
;;; Generated autoloads from cedet-autogen.el

(autoload (quote cedet-update-autoloads) "cedet-autogen" "\
Update autoloads in file LOADDEFS from sources.
Optional argument DIRECTORY, specifies the directory to scan for
autoloads.  It defaults to the current directory.
DIRECTORIES is a list of extra directory to scan.  Those directory
names are relative to DIRECTORY.  If DIRECTORIES is nil try to scan
sub directories of DIRECTORY where a `cedet-autogen-tagfile' file
exists.

\(fn LOADDEFS &optional DIRECTORY &rest DIRECTORIES)" t nil)

;;;***

;;;### (autoloads (cedet-compat-utest) "cedet-compat" "cedet-compat.el"
;;;;;;  (23502 24461))
;;; Generated autoloads from cedet-compat.el

(if (or (featurep (quote xemacs)) (inversion-test (quote emacs) "22.0")) (defalias (quote cedet-split-string) (quote cedet-split-string-1)) (defalias (quote cedet-split-string) (quote split-string)))

(when (not (fboundp (quote with-no-warnings))) (put (quote with-no-warnings) (quote lisp-indent-function) 0) (defun with-no-warnings (&rest body) "Copied from `with-no-warnings' in Emacs 23.\nLike `progn', but prevents compiler warnings in the body.\nNote: Doesn't work if this version is being loaded." (car (last body))))

(autoload (quote cedet-compat-utest) "cedet-compat" "\
Test compatability functions.

\(fn)" t nil)

;;;***

;;;### (autoloads (cedet-cscope-version-check cedet-cscope-expand-filename
;;;;;;  cedet-cscope-search cedet-cscope-command) "cedet-cscope"
;;;;;;  "cedet-cscope.el" (23502 24461))
;;; Generated autoloads from cedet-cscope.el

(defvar cedet-cscope-command "cscope" "\
Command name for the CScope executable.")

(custom-autoload (quote cedet-cscope-command) "cedet-cscope" t)

(autoload (quote cedet-cscope-search) "cedet-cscope" "\
Perform a search with CScope, return the created buffer.
SEARCHTEXT is text to find.
TEXTTYPE is the type of text, such as 'regexp, 'string, 'tagname,
'tagregexp, or 'tagcompletions.
TYPE is the type of search, meaning that SEARCHTEXT is compared to
filename, tagname (tags table), references (uses of a tag) , or
symbol (uses of something not in the tag table.)
SCOPE is the scope of the search, such as 'project or 'subdirs.

\(fn SEARCHTEXT TEXTTYPE TYPE SCOPE)" nil nil)

(autoload (quote cedet-cscope-expand-filename) "cedet-cscope" "\
Expand the FILENAME with CScope.
Return a fully qualified filename.

\(fn FILENAME)" t nil)

(autoload (quote cedet-cscope-version-check) "cedet-cscope" "\
Check the version of the installed CScope command.
If optional programatic argument NOERROR is non-nil, then
instead of throwing an error if cscope isn't available, then
return nil.

\(fn &optional NOERROR)" t nil)

;;;***

;;;### (autoloads nil "cedet-edebug" "cedet-edebug.el" (23502 24461))
;;; Generated autoloads from cedet-edebug.el

(add-hook (quote edebug-setup-hook) (lambda nil (require (quote cedet-edebug)) (defalias (quote edebug-prin1-to-string) (quote cedet-edebug-prin1-to-string)) (define-key edebug-mode-map "A" (quote data-debug-edebug-expr))))

(add-hook (quote debugger-mode-hook) (lambda nil (require (quote cedet-edebug)) (define-key debugger-mode-map "A" (quote data-debug-edebug-expr))))

;;;***

;;;### (autoloads (cedet-files-utest) "cedet-files" "cedet-files.el"
;;;;;;  (23502 24461))
;;; Generated autoloads from cedet-files.el

(autoload (quote cedet-files-utest) "cedet-files" "\
Test out some file name conversions.

\(fn)" t nil)

;;;***

;;;### (autoloads (cedet-gnu-global-version-check cedet-gnu-global-root
;;;;;;  cedet-gnu-global-show-root cedet-gnu-global-expand-filename
;;;;;;  cedet-gnu-global-search cedet-global-gtags-command cedet-global-command)
;;;;;;  "cedet-global" "cedet-global.el" (23502 24461))
;;; Generated autoloads from cedet-global.el

(defvar cedet-global-command "global" "\
Command name for the GNU Global executable.")

(custom-autoload (quote cedet-global-command) "cedet-global" t)

(defvar cedet-global-gtags-command "gtags" "\
Command name for the GNU Global gtags executable.
GTAGS is used to create the tags table queried by the 'global' command.")

(custom-autoload (quote cedet-global-gtags-command) "cedet-global" t)

(autoload (quote cedet-gnu-global-search) "cedet-global" "\
Perform a search with GNU Global, return the created buffer.
SEARCHTEXT is text to find.
TEXTTYPE is the type of text, such as 'regexp, 'string, 'tagname,
'tagregexp, or 'tagcompletions.
TYPE is the type of search, meaning that SEARCHTEXT is compared to
filename, tagname (tags table), references (uses of a tag) , or
symbol (uses of something not in the tag table.)
SCOPE is the scope of the search, such as 'project or 'subdirs.

\(fn SEARCHTEXT TEXTTYPE TYPE SCOPE)" nil nil)

(autoload (quote cedet-gnu-global-expand-filename) "cedet-global" "\
Expand the FILENAME with GNU Global.
Return a fully qualified filename.

\(fn FILENAME)" t nil)

(autoload (quote cedet-gnu-global-show-root) "cedet-global" "\
Show the root of a GNU Global area under the current buffer.

\(fn)" t nil)

(autoload (quote cedet-gnu-global-root) "cedet-global" "\
Return the root of any GNU Global scanned project.
If a default starting DIR is not specified, the current buffer's
`default-directory' is used.

\(fn &optional DIR)" nil nil)

(autoload (quote cedet-gnu-global-version-check) "cedet-global" "\
Check the version of the installed GNU Global command.
If optional programatic argument NOERROR is non-nil, then
instead of throwing an error if Global isn't available, then
return nil.

\(fn &optional NOERROR)" t nil)

;;;***

;;;### (autoloads (cedet-graphviz-dot-version-check cedet-graphviz-neato-command
;;;;;;  cedet-graphviz-dot-command) "cedet-graphviz" "cedet-graphviz.el"
;;;;;;  (23502 24461))
;;; Generated autoloads from cedet-graphviz.el

(defvar cedet-graphviz-dot-command "dot" "\
Command name for the Graphviz DOT executable.")

(custom-autoload (quote cedet-graphviz-dot-command) "cedet-graphviz" t)

(defvar cedet-graphviz-neato-command "neato" "\
Command name for the Graphviz NEATO executable.")

(custom-autoload (quote cedet-graphviz-neato-command) "cedet-graphviz" t)

(autoload (quote cedet-graphviz-dot-version-check) "cedet-graphviz" "\
Check the version of the installed Graphviz dot command.
If optional programatic argument NOERROR is non-nil, then
instead of throwing an error if Global isn't available, then
return nil.

\(fn &optional NOERROR)" t nil)

;;;***

;;;### (autoloads (cedet-idutils-version-check cedet-idutils-expand-filename
;;;;;;  cedet-idutils-make-command cedet-idutils-token-command cedet-idutils-file-command)
;;;;;;  "cedet-idutils" "cedet-idutils.el" (23502 24461))
;;; Generated autoloads from cedet-idutils.el

(defvar cedet-idutils-file-command "fnid" "\
Command name for the ID Utils executable for searching file names.")

(custom-autoload (quote cedet-idutils-file-command) "cedet-idutils" t)

(defvar cedet-idutils-token-command "lid" "\
Command name for the ID Utils executable for searching for tokens.")

(custom-autoload (quote cedet-idutils-token-command) "cedet-idutils" t)

(defvar cedet-idutils-make-command "mkid" "\
Command name for the ID Utils executable for creating token databases.")

(custom-autoload (quote cedet-idutils-make-command) "cedet-idutils" t)

(autoload (quote cedet-idutils-expand-filename) "cedet-idutils" "\
Expand the FILENAME with ID Utils.
Return a filename relative to the default directory.

\(fn FILENAME)" t nil)

(autoload (quote cedet-idutils-version-check) "cedet-idutils" "\
Check the version of the installed ID Utils command.
If optional programatic argument NOERROR is non-nil, then
instead of throwing an error if Global isn't available, then
return nil.

\(fn &optional NOERROR)" t nil)

;;;***

;;;### (autoloads (cedet-javap-dump-class cedet-java-version-check)
;;;;;;  "cedet-java" "cedet-java.el" (23502 24461))
;;; Generated autoloads from cedet-java.el

(autoload (quote cedet-java-version-check) "cedet-java" "\
Check the version of the installed java command.
If optional programatic argument NOERROR is non-nil, then
instead of throwing an error if Global isn't available, then
return nil.

\(fn &optional NOERROR)" t nil)

(autoload (quote cedet-javap-dump-class) "cedet-java" "\
Dump out a Java signatures for CLASS.
Display in a javap output buffer.

\(fn CLASS)" t nil)

;;;***

;;;### (autoloads (global-cedet-m3-minor-mode cedet-m3-minor-mode)
;;;;;;  "cedet-m3" "cedet-m3.el" (23502 24461))
;;; Generated autoloads from cedet-m3.el

(autoload (quote cedet-m3-minor-mode) "cedet-m3" "\
Toggle cedet-m3 minor mode, a mouse 3 context menu.
With prefix argument ARG, turn on if positive, otherwise off.
Return non-nil if the minor mode is enabled.

\\{cedet-m3-mode-map}

\(fn &optional ARG)" t nil)

(autoload (quote global-cedet-m3-minor-mode) "cedet-m3" "\
Toggle global use of cedet-m3 minor mode.
If ARG is positive, enable, if it is negative, disable.
If ARG is nil, then toggle.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (cedet-utest-batch cedet-utest) "cedet-utests"
;;;;;;  "cedet-utests.el" (23502 24461))
;;; Generated autoloads from cedet-utests.el

(autoload (quote cedet-utest) "cedet-utests" "\
Run the CEDET unittests.
EXIT-ON-ERROR causes the test suite to exit on an error, instead
of just logging the error.

\(fn &optional EXIT-ON-ERROR)" t nil)

(autoload (quote cedet-utest-batch) "cedet-utests" "\
Run the CEDET unit test in BATCH mode.

\(fn)" nil nil)

;;;***

;;;### (autoloads (data-debug-eval-expression data-debug-edebug-expr
;;;;;;  data-debug-show-stuff data-debug-new-buffer data-debug-mode
;;;;;;  data-debug-insert-thing data-debug-insert-stuff-vector data-debug-insert-stuff-list
;;;;;;  data-debug-insert-widget-properties data-debug-insert-hash-table
;;;;;;  data-debug-insert-property-list) "data-debug" "data-debug.el"
;;;;;;  (23502 24461))
;;; Generated autoloads from data-debug.el

(autoload (quote data-debug-insert-property-list) "data-debug" "\
Insert the property list PROPLIST.
Each line starts with PREFIX.
The attributes belong to the tag PARENT.

\(fn PROPLIST PREFIX &optional PARENT)" nil nil)

(autoload (quote data-debug-insert-hash-table) "data-debug" "\
Insert the contents of HASH-TABLE inserting PREFIX before each element.

\(fn HASH-TABLE PREFIX)" nil nil)

(autoload (quote data-debug-insert-widget-properties) "data-debug" "\
Insert the contents of WIDGET inserting PREFIX before each element.

\(fn WIDGET PREFIX)" nil nil)

(autoload (quote data-debug-insert-stuff-list) "data-debug" "\
Insert all the parts of STUFFLIST.
PREFIX specifies what to insert at the start of each line.

\(fn STUFFLIST PREFIX)" nil nil)

(autoload (quote data-debug-insert-stuff-vector) "data-debug" "\
Insert all the parts of STUFFVECTOR.
PREFIX specifies what to insert at the start of each line.

\(fn STUFFVECTOR PREFIX)" nil nil)

(autoload (quote data-debug-insert-thing) "data-debug" "\
Insert THING with PREFIX.
PREBUTTONTEXT is some text to insert between prefix and the thing
that is not included in the indentation calculation of any children.
If PARENT is non-nil, it is somehow related as a parent to thing.

\(fn THING PREFIX PREBUTTONTEXT &optional PARENT)" nil nil)

(autoload (quote data-debug-mode) "data-debug" "\
Major-mode for the Analyzer debugger.

\\{data-debug-map}

\(fn)" t nil)

(autoload (quote data-debug-new-buffer) "data-debug" "\
Create a new ddebug buffer with NAME.

\(fn NAME)" nil nil)

(autoload (quote data-debug-show-stuff) "data-debug" "\
Data debug STUFF in a buffer named *NAME DDebug*.

\(fn STUFF NAME)" nil nil)

(autoload (quote data-debug-edebug-expr) "data-debug" "\
Dump out the contents of some expression EXPR in edebug with ddebug.

\(fn EXPR)" t nil)

(autoload (quote data-debug-eval-expression) "data-debug" "\
Evaluate EXPR and display the value.
If the result is something simple, show it in the echo area.
If the result is a list or vector, then use the data debugger to display it.

\(fn EXPR)" t nil)

;;;***

;;;### (autoloads (define-fame-channel) "fame" "fame.el" (23502 24461))
;;; Generated autoloads from fame.el

(autoload (quote define-fame-channel) "fame" "\
Define the new message channel CHANNEL.
CHANNEL must be a non-nil symbol.
The optional argument DEFAULT specifies the default value of message
levels for this channel.  By default it is the value of
`fame-default-level-values'.
DOCSTRING is an optional channel documentation.

This defines the option `CHANNEL-fame-levels' to customize the current
value of message levels.  And the functions `CHANNEL-send-debug',
`CHANNEL-send-info', `CHANNEL-send-warning', and `CHANNEL-send-error',
that respectively send debug, informational, warning, and error
messages to CHANNEL.

\(fn CHANNEL &optional DEFAULT DOCSTRING)" nil (quote macro))

;;;***

;;;### (autoloads (inversion-upgrade-package inversion-add-to-load-path
;;;;;;  inversion-find-version inversion-require-emacs inversion-require)
;;;;;;  "inversion" "inversion.el" (23502 24461))
;;; Generated autoloads from inversion.el

(autoload (quote inversion-require) "inversion" "\
Declare that you need PACKAGE with at least VERSION.
PACKAGE might be found in FILE.  (See `require'.)
Throws an error if VERSION is incompatible with what is installed.
Optional argument DIRECTORY is a location where new versions of
this tool can be located.  If there is a versioning problem and
DIRECTORY is provided, inversion will offer to download the file.
Optional argument RESERVED is saved for later use.

\(fn PACKAGE VERSION &optional FILE DIRECTORY &rest RESERVED)" nil nil)

(autoload (quote inversion-require-emacs) "inversion" "\
Declare that you need either EMACS-VER, XEMACS-VER or SXEMACE-ver.
Only checks one based on which kind of Emacs is being run.

\(fn EMACS-VER XEMACS-VER SXEMACS-VER)" nil nil)

(autoload (quote inversion-find-version) "inversion" "\
Search for the version and incompatible version of PACKAGE.
Does not load PACKAGE nor requires that it has been previously loaded.
Search in the directories in `load-path' for a PACKAGE.el library.
Visit the file found and search for the declarations of variables or
constants `PACKAGE-version' and `PACKAGE-incompatible-version'.  The
value of these variables must be a version string.

Return a pair (VERSION-STRING . INCOMPATIBLE-VERSION-STRING) where
INCOMPATIBLE-VERSION-STRING can be nil.
Return nil when VERSION-STRING was not found.

\(fn PACKAGE)" nil nil)

(autoload (quote inversion-add-to-load-path) "inversion" "\
Add the PACKAGE path to `load-path' if necessary.
MINIMUM is the minimum version requirement of PACKAGE.
Optional argument INSTALLDIR is the base directory where PACKAGE is
installed.  It defaults to `default-directory'/PACKAGE.
SUBDIRS are sub-directories to add to `load-path', following the main
INSTALLDIR path.

\(fn PACKAGE MINIMUM &optional INSTALLDIR &rest SUBDIRS)" nil nil)

(autoload (quote inversion-upgrade-package) "inversion" "\
Try to upgrade PACKAGE in DIRECTORY is available.

\(fn PACKAGE &optional DIRECTORY)" t nil)

;;;***

;;;### (autoloads (mode-local-read-function) "mode-local" "mode-local.el"
;;;;;;  (23502 24461))
;;; Generated autoloads from mode-local.el

(autoload (quote mode-local-read-function) "mode-local" "\
Interactively read in the name of a mode-local function.
PROMPT, INITIAL, HIST, and DEFAULT are the same as for `completing-read'.

\(fn PROMPT &optional INITIAL HIST DEFAULT)" nil nil)

;;;***

;;;### (autoloads (pprint-function pprint pprint-to-string) "pprint"
;;;;;;  "pprint.el" (23502 24461))
;;; Generated autoloads from pprint.el

(autoload (quote pprint-to-string) "pprint" "\
Return a string containing the pretty-printed representation of OBJECT.
OBJECT can be any Lisp object.  Quoting characters are used as needed
to make output that `read' can handle, whenever this is possible.  The
pretty printer try as much as possible to limit the length of lines to
given WIDTH.  WIDTH value defaults to `fill-column'.

\(fn OBJECT &optional WIDTH)" nil nil)

(autoload (quote pprint) "pprint" "\
Output the pretty-printed representation of OBJECT, any Lisp object.
Quoting characters are printed as needed to make output that `read'
can handle, whenever this is possible.  Output stream is STREAM, or
value of `standard-output' (which see).  The pretty printer try as
much as possible to limit the length of lines to given WIDTH.  WIDTH
value defaults to `fill-column'.

\(fn OBJECT &optional STREAM WIDTH)" nil nil)

(autoload (quote pprint-function) "pprint" "\
See a pretty-printed representation of FUNCTION-NAME.

\(fn FUNCTION-NAME)" t nil)

;;;***

;;;### (autoloads (pulse-line-hook-function pulse-toggle-integration-advice
;;;;;;  pulse-momentary-highlight-region pulse-momentary-highlight-one-line
;;;;;;  pulse-momentary-highlight-overlay pulse-test pulse) "pulse"
;;;;;;  "pulse.el" (23502 24461))
;;; Generated autoloads from pulse.el

(autoload (quote pulse) "pulse" "\
Pulse the colors on our highlight face.
If optional FACE is provide, reset the face to FACE color,
instead of `pulse-highlight-start-face'.
Be sure to call `pulse-reset-face' after calling pulse.

\(fn &optional FACE)" nil nil)

(autoload (quote pulse-test) "pulse" "\
Test the lightening function for pulsing a line.
When optional NO-ERROR Don't throw an error if we can't run tests.

\(fn &optional NO-ERROR)" t nil)

(autoload (quote pulse-momentary-highlight-overlay) "pulse" "\
Pulse the overlay O, unhighlighting before next command.
Optional argument FACE specifies the fact to do the highlighting.

\(fn O &optional FACE)" nil nil)

(autoload (quote pulse-momentary-highlight-one-line) "pulse" "\
Highlight the line around POINT, unhighlighting before next command.
Optional argument FACE specifies the face to do the highlighting.

\(fn POINT &optional FACE)" nil nil)

(autoload (quote pulse-momentary-highlight-region) "pulse" "\
Highlight between START and END, unhighlighting before next command.
Optional argument FACE specifies the fact to do the highlighting.

\(fn START END &optional FACE)" nil nil)

(autoload (quote pulse-toggle-integration-advice) "pulse" "\
Toggle activation of advised functions that will now pulse.
Wint no ARG, toggle the pulse advice.
With a negative ARG, disable pulse advice.
With a positive ARG, enable pulse advice.
Currently advised functions include:
  `goto-line'
  `exchange-point-and-mark'
  `find-tag'
  `tags-search'
  `tags-loop-continue'
  `pop-tag-mark'
  `imenu-default-goto-function'
Pulsing via `pulse-line-hook-function' has also been added to
the following hook:
  `next-error-hook'

\(fn ARG)" t nil)

(autoload (quote pulse-line-hook-function) "pulse" "\
Function used in hooks to pulse the current line.
Only pulses the line if `pulse-command-advice-flag' is non-nil.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("cedet-load.el" "cedet.el" "ezimage.el"
;;;;;;  "working.el") (23502 29377 341305))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; cedet-loaddefs.el ends here
