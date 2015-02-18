;;; cider-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "cider" "../../../../.emacs.d/elpa/cider-0.8.2/cider.el"
;;;;;;  "2804c763103ca9ba547b7369c11d6708")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-0.8.2/cider.el

(autoload 'cider-version "cider" "\
Display CIDER's version.

\(fn)" t nil)

(autoload 'cider-jack-in "cider" "\
Start a nREPL server for the current project and connect to it.
If PROMPT-PROJECT is t, then prompt for the project for which to
start the server.

\(fn &optional PROMPT-PROJECT)" t nil)

(autoload 'cider-connect "cider" "\
Connect to an nREPL server identified by HOST and PORT.
Create REPL buffer and start an nREPL client connection.

\(fn HOST PORT)" t nil)

(eval-after-load 'clojure-mode '(progn (define-key clojure-mode-map (kbd "C-c M-j") 'cider-jack-in) (define-key clojure-mode-map (kbd "C-c M-c") 'cider-connect)))

;;;***

;;;### (autoloads nil "cider-apropos" "../../../../.emacs.d/elpa/cider-0.8.2/cider-apropos.el"
;;;;;;  "5daaa81db187d3ea5cd06b3b52caa734")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-0.8.2/cider-apropos.el

(autoload 'cider-apropos "cider-apropos" "\
Show all symbols whose names match QUERY, a regular expression.
The search may be limited to the namespace NS, and may optionally search doc
strings, include private vars, and be case sensitive.

\(fn QUERY &optional NS DOCS-P PRIVATES-P CASE-SENSITIVE-P)" t nil)

(autoload 'cider-apropos-documentation "cider-apropos" "\
Shortcut for (cider-apropos <query> nil t).

\(fn)" t nil)

;;;***

;;;### (autoloads nil "cider-browse-ns" "../../../../.emacs.d/elpa/cider-0.8.2/cider-browse-ns.el"
;;;;;;  "7a207ba09ce07746160d709bbd1c870b")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-0.8.2/cider-browse-ns.el

(autoload 'cider-browse-ns "cider-browse-ns" "\
List all NAMESPACE's vars in BUFFER.

\(fn NAMESPACE)" t nil)

(autoload 'cider-browse-ns-all "cider-browse-ns" "\
List all loaded namespaces in BUFFER.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "cider-classpath" "../../../../.emacs.d/elpa/cider-0.8.2/cider-classpath.el"
;;;;;;  "fbb2bf093e7d6ddcac35f16307f018c8")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-0.8.2/cider-classpath.el

(autoload 'cider-classpath "cider-classpath" "\
List all classpath entries.

\(fn)" t nil)

(autoload 'cider-open-classpath-entry "cider-classpath" "\
Open a classpath entry.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "cider-grimoire" "../../../../.emacs.d/elpa/cider-0.8.2/cider-grimoire.el"
;;;;;;  "f17cf53ce5dd7728bae9b28acf94647f")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-0.8.2/cider-grimoire.el

(autoload 'cider-grimoire-web "cider-grimoire" "\
Open the grimoire documentation for QUERY in the default web browser.

\(fn QUERY)" t nil)

(autoload 'cider-grimoire "cider-grimoire" "\
Open the grimoire documentation for QUERY in a popup buffer.

\(fn QUERY)" t nil)

;;;***

;;;### (autoloads nil "cider-inspector" "../../../../.emacs.d/elpa/cider-0.8.2/cider-inspector.el"
;;;;;;  "023c21b60a02b65445efae4924bf6d7b")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-0.8.2/cider-inspector.el

(autoload 'cider-inspect "cider-inspector" "\
Eval the string EXPRESSION and inspect the result.

\(fn EXPRESSION)" t nil)

;;;***

;;;### (autoloads nil "cider-macroexpansion" "../../../../.emacs.d/elpa/cider-0.8.2/cider-macroexpansion.el"
;;;;;;  "4e5c8c8bf1dbef948bc8c61a4344fd2f")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-0.8.2/cider-macroexpansion.el

(autoload 'cider-macroexpand-1 "cider-macroexpansion" "\
Invoke 'macroexpand-1' on the expression preceding point.
If invoked with a PREFIX argument, use 'macroexpand' instead of
'macroexpand-1'.

\(fn &optional PREFIX)" t nil)

(autoload 'cider-macroexpand-all "cider-macroexpansion" "\
Invoke 'clojure.walk/macroexpand-all' on the expression preceding point.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "cider-mode" "../../../../.emacs.d/elpa/cider-0.8.2/cider-mode.el"
;;;;;;  "a7f3b4302c30120170a80546c857ebdf")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-0.8.2/cider-mode.el

(defvar cider-mode-line '(:eval (format " cider[%s]" (cider-current-ns))) "\
Mode line ligher for `cider-mode'.

The value of this variable is a mode line template as in
`mode-line-format'.  See Info Node `(elisp)Mode Line Format' for
details about mode line templates.

Customize this variable to change how `cider-mode' displays its
status in the mode line.  The default value displays the current ns.
Set this variable to nil to disable the mode line
entirely.")

(custom-autoload 'cider-mode-line "cider-mode" t)

(autoload 'cider-mode "cider-mode" "\
Minor mode for REPL interaction from a Clojure buffer.

\\{cider-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "cider-scratch" "../../../../.emacs.d/elpa/cider-0.8.2/cider-scratch.el"
;;;;;;  "a2dfd0ff6f74bbe448a00bb996c1544d")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-0.8.2/cider-scratch.el

(autoload 'cider-scratch "cider-scratch" "\
Create a scratch buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "cider-selector" "../../../../.emacs.d/elpa/cider-0.8.2/cider-selector.el"
;;;;;;  "6caf5fa29fb84e4745e14d3f49dc9abf")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-0.8.2/cider-selector.el

(autoload 'cider-selector "cider-selector" "\
Select a new buffer by type, indicated by a single character.
The user is prompted for a single character indicating the method by
which to choose a new buffer.  The `?' character describes then
available methods.  OTHER-WINDOW provides an optional target.

See `def-cider-selector-method' for defining new methods.

\(fn &optional OTHER-WINDOW)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/cider-0.8.2/cider-apropos.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-browse-ns.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-classpath.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-client.el" "../../../../.emacs.d/elpa/cider-0.8.2/cider-doc.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-eldoc.el" "../../../../.emacs.d/elpa/cider-0.8.2/cider-grimoire.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-inspector.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-interaction.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-macroexpansion.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-mode.el" "../../../../.emacs.d/elpa/cider-0.8.2/cider-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-repl.el" "../../../../.emacs.d/elpa/cider-0.8.2/cider-scratch.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-selector.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-stacktrace.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider-test.el" "../../../../.emacs.d/elpa/cider-0.8.2/cider-util.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-0.8.2/cider.el" "../../../../.emacs.d/elpa/cider-0.8.2/nrepl-client.el")
;;;;;;  (21719 46064 789398 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; cider-autoloads.el ends here
