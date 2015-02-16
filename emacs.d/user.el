;; This is where your customizations should live

;; env PATH
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(add-to-list 'exec-path "/usr/local/bin")

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it

(setq initial-frame-alist '((top . 0) (left . 0) (width . 156) (height . 83)))
(setq default-frame-alist '((top . 0) (left . 0) (width . 156) (height . 83)))

;; font 
(set-frame-font "Source Code Pro Light")
(set-face-attribute 'default nil :height 145 :font "Source Code Pro Light")
;; (set-face-attribute 'default nil :height 140 :font "Source Code Pro Regular")
;;(set-face-attribute 'default nil :font "Anonymous")
;;(set-face-attribute 'default nil :height 140 :font "Envy Code R")
(set-face-attribute 'mode-line nil :height 160)

;; UTF-8 ALL THE THINGS!
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setenv "LANG" "en_CA.UTF-8")
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))


;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)


;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;; Uncomment this to increase font size
;; (set-face-attribute 'default nil :height 150)
;;(load-theme 'tomorrow-night-bright t)
(load-theme 'obsidian t)

;; show the menu bar
(menu-bar-mode t)
;; hide scrollbars
(toggle-scroll-bar -1) 
;; Just follow git-controlled links without asking
(setq vc-follow-symlinks t)




;; nicer show-paren colour
(set-face-foreground 'show-paren-match-face "#3498db")
(set-face-background 'show-paren-match-face nil)
(set-face-attribute 'show-paren-match-face nil
                    :weight 'bold :underline nil :overline nil :slant 'normal) 
(show-paren-mode 1)
;; Highlight matching paren when it is visible, otherwise highlight the whole expression
(setq show-paren-style 'mixed)


;; stronger colors
(require 'cl-lib)
(require 'color)
(require 'paren)
(require 'rainbow-delimiters)
(cl-loop
 for index from 1 to rainbow-delimiters-max-face-count
 do
 (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
   (cl-callf color-saturate-name (face-foreground face) 30)))


;; rainbow parens!
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;; Flyspell often slows down editing so it's turned off
;;(remove-hook 'text-mode-hook 'turn-on-flyspell)




;; hippie expand - don't try to complete with file names
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name-partially hippie-expand-try-functions-list))

(setq ido-use-filename-at-point nil)

;; undo!
(define-key global-map (kbd "C-x C-/") 'redo)


;; enable evil mode
;; (add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; jk to get out of insert mode
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; (define-key evil-normal-state-map (kbd "q") nil)
(define-key evil-normal-state-map (kbd "M-.") nil)
(define-key evil-insert-state-map (kbd "M-.") nil)
(define-key evil-normal-state-map (kbd "RET") (lambda () (interactive) (end-of-line) (newline-and-indent)))
(define-key evil-insert-state-map (kbd "C-e") nil)
(define-key evil-insert-state-map (kbd "C-d") nil)
(define-key evil-insert-state-map (kbd "C-k") nil)
(define-key evil-motion-state-map (kbd "C-e") nil)



(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (indent-according-to-mode))


(define-key evil-normal-state-map [S-return] 'smart-open-line-above)
(define-key evil-insert-state-map [S-return] (lambda () (interactive) (end-of-line) (newline-and-indent)))


(global-undo-tree-mode 1)
(define-key evil-normal-state-map "\C-r" 'undo-tree-redo) ;that got overwritten and i need it!
(setq undo-tree-auto-save-history t
      undo-tree-history-directory-alist `(("." . ,(concat user-emacs-directory "undo"))))


;; evil surround
(load "~/.emacs.d/vendor/evil-surround")
(require 'evil-surround)
(global-evil-surround-mode 1)


(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

;; REQUIRES textmate-mode.el
(textmate-mode)
(evil-leader/set-key
  "e" 'ido-find-file
  "b" 'switch-to-buffer
  "t" 'textmate-goto-file
  "T" 'textmate-goto-symbol
  "l" 'goto-line
  "C-T" 'textmate-clear-cache
  "u" 'undo-tree-visualize
  "." 'evil-search-highlight-persist-remove-all
  "x" 'smex
  "h" 'dired-jump
  "v" 'split-window-right
  "k" 'ido-kill-buffer
  "," 'other-window
  "s" 'pp-eval-last-sexp
  "w" 'save-buffer
  "q" 'kill-buffer-and-window
  "c" 'comment-or-uncomment-region-or-line
  )

;; evil-matchit
(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; keep searches until new search
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)

(load "~/.emacs.d/vendor/clojure")

;; expand region
(eval-after-load "evil" '(setq expand-region-contract-fast-key "x"))
(evil-leader/set-key "zz" 'er/expand-region)


;; turn off visual bell
(setq ring-bell-function 'ignore)


;; Change cursor in different modes.
(setq evil-default-cursor 'bar)
(setq evil-normal-state-cursor 'box)
(setq evil-visual-state-cursor 'hollow)
(setq evil-replace-state-cursor 'box)


;; Window moving
(define-key evil-normal-state-map (kbd "C-w <left>") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-w <right>") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-w <up>") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-w <down>") 'windmove-down)



;; Statusbar colour depending on mode (evil/emacs/buffer modified)
(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
            (lambda ()
              (let ((color (cond ((minibufferp) default-color)
                                 ((evil-insert-state-p) '("#d35400" . "#ffffff"))
                                 ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                                 ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                                 (t default-color))))
                (set-face-background 'mode-line (car color))
                (set-face-foreground 'mode-line (cdr color))))))


;; CSS color values colored by themselves
;; http://news.ycombinator.com/item?id=873541

(defvar hexcolor-keywords
  '(("#[abcdef[:digit:]]\\{3,6\\}"
     (0 (let ((colour (match-string-no-properties 0)))
          (if (or (= (length colour) 4)
                  (= (length colour) 7))
              (put-text-property 
               (match-beginning 0)
               (match-end 0)
               'face (list :background (match-string-no-properties 0)
                           :foreground (if (>= (apply '+ (x-color-values 
                                                          (match-string-no-properties 0)))
                                               (* (apply '+ (x-color-values "white")) .6))
                                           "black" ;; light bg, dark text
                                         "white" ;; dark bg, light text
                                         )))))
        append))))

(defun hexcolor-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolor-keywords))

(add-hook 'css-mode-hook 'hexcolor-add-to-font-lock)
(add-hook 'emacs-lisp-mode-hook 'hexcolor-add-to-font-lock)


;; always show line numbers
(global-linum-mode t)


(require 'server)
(unless (server-running-p)
  (server-start))

;; Clojure config!
(setq cider-auto-select-error-buffer nil)
(setq cider-show-error-buffer 'except-in-repl)

;; something else overrode it :(
(eval-after-load 'clojure-mode
  '(progn
     ;; don't override clojure-mode mappings (mostly M-.)
     (evil-make-overriding-map clojure-mode-map nil t)))


;; Append result of evaluating previous expression (Clojure):
(defun cider-eval-last-sexp-and-append ()
  "Evaluate the expression preceding point and append result."
  (interactive)
  (let ((last-sexp (cider-last-sexp)))
    ;; we have to be sure the evaluation won't result in an error
    (cider-eval-and-get-value last-sexp)
    (with-current-buffer (current-buffer)
      (insert ";;=>"))
    (cider-interactive-eval-print last-sexp)))

(eval-after-load 'cider-mode
  '(progn
     (define-key cider-mode-map (kbd "s-i") 'cider-jump-to-var)
     (define-key cider-mode-map (kbd "s-e") 'cider-eval-last-sexp-and-append)
     ))

(evil-define-key 'normal cider-mode (kbd "s-i") 'cider-doc)
(evil-define-key 'insert cider-mode (kbd "s-i") 'cider-doc)


;; Clojure-Refactor
(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               ;; insert keybinding setup here
                               (cljr-add-keybindings-with-prefix "C-c C-m")
                               ))

;; Autocomplete
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (setq ac-use-fuzzy 1)
;; (setq ac-auto-start 1)
;; (setq ac-quick-help-delay 0.5)

(global-company-mode)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key "\t" 'company-complete-common) ;force auto-complete instead of waiting for the timer
(setq company-dabbrev-downcase nil ;don't dowcase. Stupid idea.
      company-show-numbers t
      company-transformers '(company-sort-by-occurrence)) 

(push 'company-capf company-backends)

;;(frame-restore-mode)
;;(desktop-save-mode)


(defun save-all ()
  (interactive)
  (save-some-buffers t))

;;emacs 24.4 only :-/
(add-hook 'focus-out-hook 'save-all)


;; scrolling

(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


;; rainbow parens!
;; (global-rainbow-delimiters-mode)

;;rainbow blocks!
(load "~/.emacs.d/vendor/rainbow-blocks")
(require 'rainbow-blocks)
(add-hook 'clojure-mode-hook 'rainbow-blocks-mode)



;; split window direction!
(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa. i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window neighbour-dir next-win)))))
          ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir) other-buf))))))))

(global-set-key (kbd "C-x \\") 'window-toggle-split-direction)

(windmove-default-keybindings) ;Then you can use SHIFT+arrow to move to the next adjacent window in the specified direction.

;;move border!
(load "~/.emacs.d/vendor/move-border" )
(require 'move-border)
(global-set-key (kbd "s-<up>") 'move-border-up)
(global-set-key (kbd "s-<down>") 'move-border-down)
(global-set-key (kbd "s-<left>") 'move-border-left)
(global-set-key (kbd "s-<right>") 'move-border-right)



;;move text
(require 'move-line)
;;C-S-up/down



(global-aggressive-indent-mode)

(delete-selection-mode t) ;;overwrite selection by default. Thank God!




;; disable Emacs Evil selection auto-copies to clipboard
;; Thanks to https://stackoverflow.com/questions/17127009/how-to-disable-emacs-evil-selection-auto-copies-to-clipboard/23254728#23254728

                                        ; Override the default x-select-text function because it doesn't
                                        ; respect x-select-enable-clipboard on OS X.
(defun x-select-text (text))
(setq x-select-enable-clipboard nil)
(setq x-select-enable-primary nil)
(setq mouse-drag-copy-region nil)

(setq interprogram-cut-function 'ns-set-pasteboard)
(setq interprogram-paste-function 'ns-get-pasteboard)





;; Windows

(defun isolate-kill-ring()
  "Isolate Emacs kill ring from OS X system pasteboard.
This function is only necessary in window system."
  (interactive)
  (setq interprogram-cut-function nil)
  (setq interprogram-paste-function nil))

(defun pasteboard-copy()
  "Copy region to OS X system pasteboard."
  (interactive)
  (shell-command-on-region
   (region-beginning) (region-end) "pbcopy"))

(defun pasteboard-paste()
  "Paste from OS X system pasteboard via `pbpaste' to point."
  (interactive)
  (shell-command-on-region
   (point) (if mark-active (mark) (point)) "pbpaste" nil t))

(defun pasteboard-cut()
  "Cut region and put on OS X system pasteboard."
  (interactive)
  (pasteboard-copy)
  (delete-region (region-beginning) (region-end)))

(if window-system
    (progn
      (isolate-kill-ring)
      ;; bind CMD+C to pasteboard-copy
      (global-set-key (kbd "s-c") 'pasteboard-copy)
      ;; bind CMD+V to pasteboard-paste
      (global-set-key (kbd "s-v") 'pasteboard-paste)
      ;; bind CMD+X to pasteboard-cut
      (global-set-key (kbd "s-x") 'pasteboard-cut))

  ;; you might also want to assign some keybindings for non-window
  ;; system usage (i.e., in your text terminal, where the
  ;; command->super does not work)
  )


;; Auto revert buffer if file changed on disk
(global-auto-revert-mode t)

;; ruby/pry
;;(add-to-list 'load-path "~/.emacs.d/vendor/emacs-pry")
;;(require 'pry)

;; save all backups in one directory
(defvar --backup-directory "~/.emacs-backups")
(if (not (file-exists-p --backup-directory))
    (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq auto-save-file-name-transforms `((".*" ,--backup-directory t))) ;;autosave to backup dir too!
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )
;; Place downloaded elisp files in this directory. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")


;; better fill column
(setq-default fill-column 160)


;; scrolling
;; (require 'smooth-scrolling)
;;
;; (require 'smooth-scroll)
;; (smooth-scroll-mode t)

(setq mouse-wheel-scroll-amount '(5 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
;; (set-variable ‘scroll-conservatively 5)



;; ;; ;; hopefully make scrolling faster
;;  (setq jit-lock-defer-time 0.10)
;;  (setq redisplay-dont-pause t
;;   scroll-margin 1
;;   scroll-step 1
;;   scroll-conservatively 10000
;;   scroll-preserve-screen-position 1)

(defun download-to-local (target-path)
  "Download the specified file and change the current file to the local version"
  (interactive (list (let ((insert-default-directory nil))
                       (read-file-name "Save the file to:"))))
  (setq current-line (buffer-substring (point-at-bol) (point-at-eol)))
  (string-match "src=\"\\(http.+?\\)\"" current-line) (setq url (match-string-no-properties 1 current-line))
  (url-copy-file url target-path t)
  (goto-char (string-match "src=\"\\(http.+?\\)\"" current-line)) (search-forward url)(replace-match target-path nil t)
  (message "%s -> %s" url target-path))

;; SQL
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)



;; jabber
;;================================================================================ 

(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (if (file-exists-p filePath)
      (with-temp-buffer
        (insert-file-contents filePath)
        (buffer-string))
    nil))


(defun chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (if str
      (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
                                        (: (* (any " \t\n")) eos)))
                                ""
                                str)
    nil))



(setq jabber-account-list 
      `(("mgerlach@klick.com"
         (:password . ,(chomp (get-string-from-file "~/.jabberpasswd")))
         (:network-server . "talk.google.com")
         (:connection-type . ssl)
         (:port . 443))))

;; use history
(setq jabber-history-enabled t
      jabber-use-global-history nil ;per contact history
      jabber-backlog-number 10 ;show 10 last messages 
      jabber-backlog-days 14 ; show messages from last 14 days
      )

(setq jabber-avatar-cache-directory "~/.jabber/jabber-avatar-cache"
      jabber-history-dir "~/.jabber/jabber-history")

;; don't notify on status
(setq jabber-alert-presence-message-function (lambda (who oldstatus newstatus statustext) nil))

;; i don't care about presence and offline
(setq jabber-alert-presence-hooks nil
      jabber-show-offline-contacts nil)

;;Automatically highlight URLs
;;Here’s a hook which will highlight URLs, and bind C-c RET to open the URL using browse-url
(add-hook 'jabber-chat-mode-hook 'goto-address)


;;================================================================================
;; indentation

(require 'indent-guide)
(indent-guide-global-mode)
(setq indent-guide-recursive t)
(set-face-foreground 'indent-guide-face "#2b547e")
(set-face-background 'indent-guide-face nil)
(setq indent-guide-delay 0.2)
(setq indent-guide-char "\u2502")





;; scroll-offset
(setq scroll-margin 2)

;; ================================================================================
;; html-encode
;; http://emacs.stackexchange.com/questions/8166/encode-non-html-characters-to-html-equivalent

(setq web-mode-html-entities
      '(("quot" . 34)
        ("amp" . 38)
        ("apos" . 39)
        ("lt" . 60)
        ("gt" . 62)
        ("nbsp" . 160)
        ("iexcl" . 161)
        ("cent" . 162)
        ("pound" . 163)
        ("curren" . 164)
        ("yen" . 165)
        ("brvbar" . 166)
        ("sect" . 167)
        ("uml" . 168)
        ("copy" . 169)
        ("ordf" . 170)
        ("laquo" . 171)
        ("not" . 172)
        ("shy" . 173)
        ("reg" . 174)
        ("macr" . 175)
        ("deg" . 176)
        ("plusmn" . 177)
        ("sup2" . 178)
        ("sup3" . 179)
        ("acute" . 180)
        ("micro" . 181)
        ("para" . 182)
        ("middot" . 183)
        ("cedil" . 184)
        ("sup1" . 185)
        ("ordm" . 186)
        ("raquo" . 187)
        ("frac14" . 188)
        ("frac12" . 189)
        ("frac34" . 190)
        ("iquest" . 191)
        ("Agrave" . 192)
        ("Aacute" . 193)
        ("Acirc" . 194)
        ("Atilde" . 195)
        ("Auml" . 196)
        ("Aring" . 197)
        ("AElig" . 198)
        ("Ccedil" . 199)
        ("Egrave" . 200)
        ("Eacute" . 201)
        ("Ecirc" . 202)
        ("Euml" . 203)
        ("Igrave" . 204)
        ("Iacute" . 205)
        ("Icirc" . 206)
        ("Iuml" . 207)
        ("ETH" . 208)
        ("Ntilde" . 209)
        ("Ograve" . 210)
        ("Oacute" . 211)
        ("Ocirc" . 212)
        ("Otilde" . 213)
        ("Ouml" . 214)
        ("times" . 215)
        ("Oslash" . 216)
        ("Ugrave" . 217)
        ("Uacute" . 218)
        ("Ucirc" . 219)
        ("Uuml" . 220)
        ("Yacute" . 221)
        ("THORN" . 222)
        ("szlig" . 223)
        ("agrave" . 224)
        ("aacute" . 225)
        ("acirc" . 226)
        ("atilde" . 227)
        ("auml" . 228)
        ("aring" . 229)
        ("aelig" . 230)
        ("ccedil" . 231)
        ("egrave" . 232)
        ("eacute" . 233)
        ("ecirc" . 234)
        ("euml" . 235)
        ("igrave" . 236)
        ("iacute" . 237)
        ("icirc" . 238)
        ("iuml" . 239)
        ("eth" . 240)
        ("ntilde" . 241)
        ("ograve" . 242)
        ("oacute" . 243)
        ("ocirc" . 244)
        ("otilde" . 245)
        ("ouml" . 246)
        ("divide" . 247)
        ("oslash" . 248)
        ("Ugrave" . 249)
        ("Uacute" . 250)
        ("Ucirc" . 251)
        ("Uuml" . 252)
        ("yacute" . 253)
        ("thorn" . 254)
        ("yuml" . 255)
        ("OElig" . 338)
        ("oelig" . 339)
        ("Scaron" . 352)
        ("scaron" . 353)
        ("Yuml" . 376)
        ("fnof" . 402)
        ("circ" . 710)
        ("tilde" . 732)
        ("Alpha" . 913)
        ("Beta" . 914)
        ("Gamma" . 915)
        ("Delta" . 916)
        ("Epsilon" . 917)
        ("Zeta" . 918)
        ("Eta" . 919)
        ("Theta" . 920)
        ("Iota" . 921)
        ("Kappa" . 922)
        ("Lambda" . 923)
        ("Mu" . 924)
        ("Nu" . 925)
        ("Xi" . 926)
        ("Omicron" . 927)
        ("Pi" . 928)
        ("Rho" . 929)
        ("Sigma" . 931)
        ("Tau" . 932)
        ("Upsilon" . 933)
        ("Phi" . 934)
        ("Chi" . 935)
        ("Psi" . 936)
        ("Omega" . 937)
        ("alpha" . 945)
        ("beta" . 946)
        ("gamma" . 947)
        ("delta" . 948)
        ("epsilon" . 949)
        ("zeta" . 950)
        ("eta" . 951)
        ("theta" . 952)
        ("iota" . 953)
        ("kappa" . 954)
        ("lambda" . 955)
        ("mu" . 956)
        ("nu" . 957)
        ("xi" . 958)
        ("omicron" . 959)
        ("pi" . 960)
        ("rho" . 961)
        ("sigmaf" . 962)
        ("sigma" . 963)
        ("tau" . 964)
        ("upsilon" . 965)
        ("phi" . 966)
        ("chi" . 967)
        ("psi" . 968)
        ("omega" . 969)
        ("thetasym" . 977)
        ("Upsih" . 978)
        ("piv" . 982)
        ("ensp" . 8194)
        ("emsp" . 8195)
        ("thinsp" . 8201)
        ("zwnj" . 8204)
        ("zwj" . 8205)
        ("lrm" . 8206)
        ("rlm" . 8207)
        ("ndash" . 8211)
        ("mdash" . 8212)
        ("lsquo" . 8216)
        ("rsquo" . 8217)
        ("sbquo" . 8218)
        ("ldquo" . 8220)
        ("rdquo" . 8221)
        ("bdquo" . 8222)
        ("dagger" . 8224)
        ("Dagger" . 8225)
        ("bull" . 8226)
        ("hellip" . 8230)
        ("permil" . 8240)
        ("prime" . 8242)
        ("Prime" . 8243)
        ("lsaquo" . 8249)
        ("rsaquo" . 8250)
        ("oline" . 8254)
        ("frasl" . 8260)
        ("euro" . 8364)
        ("image" . 8465)
        ("weierp" . 8472)
        ("real" . 8476)
        ("trade" . 8482)
        ("alefsym" . 8501)
        ("larr" . 8592)
        ("uarr" . 8593)
        ("rarr" . 8594)
        ("darr" . 8595)
        ("harr" . 8596)
        ("crarr" . 8629)
        ("lArr" . 8656)
        ("UArr" . 8657)
        ("rArr" . 8658)
        ("dArr" . 8659)
        ("hArr" . 8660)
        ("forall" . 8704)
        ("part" . 8706)
        ("exist" . 8707)
        ("empty" . 8709)
        ("nabla" . 8711)
        ("isin" . 8712)
        ("notin" . 8713)
        ("ni" . 8715)
        ("prod" . 8719)
        ("sum" . 8721)
        ("minus" . 8722)
        ("lowast" . 8727)
        ("radic" . 8730)
        ("prop" . 8733)
        ("infin" . 8734)
        ("ang" . 8736)
        ("and" . 8743)
        ("or" . 8744)
        ("cap" . 8745)
        ("cup" . 8746)
        ("int" . 8747)
        ("there4" . 8756)
        ("sim" . 8764)
        ("cong" . 8773)
        ("asymp" . 8776)
        ("ne" . 8800)
        ("equiv" . 8801)
        ("le" . 8804)
        ("ge" . 8805)
        ("sub" . 8834)
        ("sup" . 8835)
        ("nsub" . 8836)
        ("sube" . 8838)
        ("supe" . 8839)
        ("oplus" . 8853)
        ("otimes" . 8855)
        ("perp" . 8869)
        ("sdot" . 8901)
        ("lceil" . 8968)
        ("rceil" . 8969)
        ("lfloor" . 8970)
        ("rfloor" . 8971)
        ("lang" . 9001)
        ("rang" . 9002)
        ("loz" . 9674)
        ("spades" . 9824)
        ("clubs" . 9827)
        ("hearts" . 9829)
        ("diams" . 9830)))

(defun html-encode-region (start end)
  (interactive "r")
  (let ((count (count-matches "&")))
    (replace-string "&" "&amp;" nil start end)
    (setq end (+ end (* count 4))))
  (dolist (pair web-mode-html-entities)
    (unless (= (cdr pair) 38)
      (let* ((str (char-to-string (cdr pair)))
             (count (count-matches str start end)))
        (setq end (+ end (* count (1+ (length (car pair))))))
        (replace-string str
                        (concat "&" (car pair) ";")
                        nil start end)))))

