(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)



;(load-library "~/elisp/vtl.el")

;(require 'vtl)
;(add-to-list 'auto-mode-alist '("\\.vm\\'" . vtl-mode))

; (global-set-key (kbd "C-l") (recenter-top-bottom '(-1) ))
; (global-set-key (kbd "C-l") (lambda () (interactive) (recenter-top-bottom -1)))
(global-set-key (kbd "s-l") (lambda () (interactive) (recenter-top-bottom -1)))

(global-set-key (kbd "C-<f5>") 'linum-mode) 


; <lamdk> wait whats the function to check if im using emacs in the GUI
;         (as opposed to in terminal)
; <isomer> lamdk: (when window-system ....)

;; 5/18/09
;;<lamdk> hmm anyone know off hand the variable or thing to turn off
;;        scrollbars o_O                 [23:16]
;; <twb> lamdk: yes.
;; <twb> (when (featurep 'x) (tool-bar-mode -1) (scroll-bar-mode -1))
;; <lamdk> nice exactly what i was looking for                 [23:17]
;; <lamdk> bahahah
;; <lamdk> whoa when you select lisp in emacs 23 the text turns blue [23:18]
;; <lamdk> oh wait is the featurep part equivalent to...  
;;        (string-equal window-system "x") ?                 [23:19]
;; <ggole> No. Also, that test should be (eq window-system 'x)

;; (if (string-equal window-system "x")
;;(if (eq window-system 'x)
;;    (progn
;;      (global-set-key (kbd "M-`")  'other-frame))
;;)

(global-set-key (kbd "M-`")  'other-frame)

(when (featurep 'x) (tool-bar-mode -1) (scroll-bar-mode -1))
  
(if (string-equal system-type "darwin")    
    (progn (setq mac-pass-command-to-system nil)
           (setq mac-option-modifier 'meta)
;           (when 'window-system (global-set-key (kbd "M-`")  'win:other-frame)))
;           (global-set-key (kbd "M-`")  'win:other-frame)
    )
  (identity "else block!!1")
)

(if (string-equal system-type "gnu/linux")
    (setq x-select-enable-clipboard t)
)



;; http://www.emacswiki.org/emacs/FrameTitle
;; (setq frame-title-format 'buffer-file-name)
;; (setq frame-title-format 'buffer-file-truename)
(setq frame-title-format 'buffer-name)
(setq frame-title-format "%b!")  ;; see mode-line-format


(global-font-lock-mode t)
(column-number-mode t)
(which-function-mode t)
(winner-mode t)
(show-paren-mode t)
(setq indent-tabs-mode nil)

(windmove-default-keybindings)
(setq tab-width 4)
(setq erc-nick "dlam")

(setq compilation-scroll-output t) ;; make compilation window also scroll to bottom


;; From "Including subdirectories" at 

;; http://www.emacswiki.org/emacs/LoadPath  
;; (progn (cd "~/elisp") (normal-top-level-add-subdirs-to-load-path))

;; (load-library "~/elisp/nxhtml/autostart.el")

;; Saves window configurations and stuff! from http://www.emacswiki.org/emacs/WindowsMode                                               
;; (load-library "~/elisp/revive.el")
;; (load-library "~/elisp/windows.el")

;; (define-key ctl-x-map "S" 'save-current-configuration)
;; (define-key ctl-x-map "F" 'resume)
;; (define-key ctl-x-map "K" 'wipe) 
(global-set-key (kbd "C-M-x S") 'save-current-configuration)
(global-set-key (kbd "C-M-x F") 'resume)
(global-set-key (kbd "C-M-x K") 'wipe)



;; (require 'rails)

;; (require 'mumamo-fun)
;; (setq mumamo-chunk-coloring 'submode-colored)


;; (add-to-list 'auto-mode-alist '("\\.rhtml\\'" . eruby-html-mumamo-mode))
;; (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-html-mumamo-mode))

;; (global-set-key (kbd "<f2> <f3>") 
;; 				(lambda () (interactive) 
;; 				    (eruby-html-mumamo)
;; 				    (rails-minor-mode)))

;;; rhtml-mode  (alternate for the above ^^)
;; (add-to-list 'load-path "~/elisp/rhtml")
;; (require 'rhtml-mode)



;;  4/7/09  Ok this is weird,  but i get a hella big error when doing this 
;;
;;(add-hook 'eruby-html-mumamo-mode-hook 'rails-minor-mode)

;; (require 'ruby-mode)
;; (require 'ruby-electric)

;; (add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode 0)))

;; (defun my-ruby-hook ()
;;  (ruby-electric-mode 0)
;; )


;; i.e. the optional params there to add to end of hook list
;;      because inf-ruby.el adds its own ruby-mode-hook with
;;      (ruby-electric-mode t)
;; 
;;(add-hook 'ruby-mode-hook 'my-ruby-hook t nil)  

;; (add-hook 'eruby-html-mumamo-mode-hook '(lambda () (rails-minor-mode)))

 ;; this dont seem to work 
;;(add-hook 'mumamo-turn-on-hook '(lambda () (rails-minor-mode))) 



;;    1/7/2009     read from GNU emacs mailing list
;;                 Speedbar that exists in the same frame, like taglist!!
;;(require 'sr-speedbar)
;;(global-set-key (kbd "<f5> <f5>") 'sr-speedbar-toggle)


(global-set-key (kbd "C-<pause>") 'previous-buffer)
(global-set-key (kbd "M-<pause>") 'next-buffer)

(global-set-key [f7] 'recompile)   ;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Function-Keys.html

;;(global-set-key "\C-c\r" 'recompile)    ;; CANT DO THIS,  because \r binds this to C-c RET

(global-set-key [?\C-c ?r] 'recompile)    ;; Use a elisp Vector instead,  (see 57.4.6 Rebinding Keys in Your Init 
(global-set-key [?\C-c ?x] 'recompile)    

(global-set-key "\C-c\c" 'recompile)    
(global-set-key [?\C-c ?C] 'compile)    

;; 2-11-09 
(global-set-key "\C-x\C-o" (lambda () (interactive) (other-window -1)))  

(global-set-key (kbd "M-K") 'kill-whole-line)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require  'color-theme)
(color-theme-initialize)
(color-theme-jsc-dark)  ;; 12/2/2008 - "Cooper Dark" in the color scheme test
;; (color-theme-matrix)  

;;    for COEN 281 omg: 
;; (load "C:/emacs-22.3/ess-5.3.8/lisp/ess-site")

;;  from http://www.gnu.org/software/emms/quickstart.html
;; (require 'emms-setup)
;; (emms-standard)              
;; (emms-default-players)




;; 32 = ASCII <space>
(defun prev-word-end (&optional arg)
  "ge in vi"
 (interactive "p")
 (let ((arg (or arg 1)))
   (cond
    ((= (preceding-char) 32)  (progn (backward-word (+ arg)) (forward-word))) ;; bw fw
    (t  (progn (backward-word (+ 1 arg)) (forward-word)))                     ;; bw bw fw
    )                             
 );; let
);;defun

(global-set-key "\C-x\M-b" 'prev-word-end)
(global-set-key "\M-B" 'prev-word-end)


(defun kill-ring-save-current-line (&optional arg)
  "Copy current line, or next arg lines to kill ring without killing the text!"
  (interactive "p")
  (setq arg (- arg 1))   ;; when you dont give universal-argument, arg = 1 (?)
  (or arg (setq arg 0))
  (save-excursion
	(beginning-of-line)
	(set-mark (point))
    (next-line arg) 
	(end-of-line)
	(kill-ring-save (point) (mark-marker))) 
  )


(global-set-key (kbd "M-W") 'kill-ring-save-current-line )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;   BEGIN VI STUFF  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun line-to-top-of-window ()
   "Shift current line to the top of the window-  i.e. zt in Vim"
   (interactive)
   (set-window-start (selected-window) (point)))                    

(defun line-to-bottom-of-window ()
  "Shift current line to the botom of the window- i.e. zb in Vim"
  (interactive)
  (setq curr-col-temp (current-column))    ;; remember column position
  (line-to-top-of-window)
  (scroll-down (- (window-height) 3))
;  (scroll-down (- (window-height) 1))
  (forward-char curr-col-temp)             ;; move back to the column etc.
  )

;; TODO: still need to make arg work...
(defun vi-join (arg)
  "J in vi"
  (interactive "p")
  (save-excursion 
    (delete-indentation 't)        ; i.e. M-^
    (indent-according-to-mode)
    (next-line) 
    (indent-according-to-mode)))


;;  (require 'vip)
;;(global-set-key "\C-x\C-e" 'vip-line-to-bottom)

(setq viper-mode nil) ;; So viper dosent start automatically after the require
(require 'viper)

(global-set-key (kbd "M-F")         'viper-forward-word)   
;;(global-set-key (kbd "C-F")         'viper-forward-Word)   ;; can't bind shift with Ctrl  
(global-set-key (kbd "C-x C-a C-a") 'viper-line-to-top)
;; (global-set-key (kbd "C-x C-e")     'viper-line-to-bottom)   ;; dosent work always, like in ERC windows
(global-set-key (kbd "C-x C-e")     'line-to-bottom-of-window)   

(global-set-key (kbd "C-x M-r")     'viper-window-top)
(global-set-key (kbd "C-x M-c")     'viper-window-bottom)
(global-set-key (kbd "M-R")         'viper-window-top)
(global-set-key (kbd "M-C")         'viper-window-bottom)

(global-set-key (kbd "M-n")         'viper-scroll-up-one)
(global-set-key (kbd "M-p")         'viper-scroll-down-one)
(global-set-key (kbd "s-e")         'viper-scroll-up-one)
(global-set-key (kbd "s-y")         'viper-scroll-down-one)
(global-set-key (kbd "M-N")         'viper-scroll-up)
(global-set-key (kbd "M-P")         'viper-scroll-down)

(global-set-key (kbd "C-|")         'viper-goto-col)
(global-set-key (kbd "C-%")         'viper-paren-match)
(global-set-key (kbd "M-?")         'viper-paren-match)   ;; easier to press ^^


(global-set-key (kbd "M-J") 'vi-join)
;; (global-set-key (kbd "M-J") 'viper-join-lines)

  (require 'vip)   ;; Viper functions for f/F/t/T are incorrect!
  (global-set-key [(super f)]   'vip-find-char-forward) 
  (global-set-key [(super F)]   'vip-find-char-backward)
  (global-set-key [(super t)]    'vip-goto-char-forward)
  (global-set-key [(super T)]   'vip-goto-char-backward)
  (global-set-key (kbd "s-;")   'vip-repeat-find)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; dont need this key
(global-unset-key "\C-z")      ;; iconify-or-deiconify-frame 
(global-unset-key "\C-x\C-z")  ;; iconify-or-deiconify-frame

;; 10/17/08 - whoa cool thingy

;;  11/6/08 -   because Shift-'key' dosent work when in SSH terminal.
(global-set-key "\C-c\h" 'windmove-left)
(global-set-key "\C-c\k" 'windmove-up)
(global-set-key "\C-c\j" 'windmove-down)
(global-set-key "\C-c\l" 'windmove-right)

(global-set-key (kbd "C-S-<left>")  'previous-buffer)
(global-set-key (kbd "C-S-<right>") 'next-buffer)





(global-set-key (kbd "<f6>") 'new-empty-buffer)

;;    From 1st day on the Emacs mailing list!
;; "Re: How to get rid of *GNU Emacs* buffer on start-up?"  9/24/08 816pm
(defun new-empty-buffer ()
 "Opens a new empty buffer."
 (interactive)
 (let ((buf (generate-new-buffer "untitled")))
   (switch-to-buffer buf)
   (funcall (and initial-major-mode))
   ))





;;  1/13/2008 - Set f11 and C-c o to switch to the buffer 
;;  just switched from
;;
;;  1/25/2008 - changed this to make it call (switch-to-buffer (other-buffer)), 
;;  which is better... its the same action as hitting C-x b <Enter>
;;  With (switch-to-buffer (cadr (buffer-list))), it also included window
;;  changes in the buffer history!
;;
(defun switch-to-other-buffer ()
  "Switches to the most recent buffer... THIS DOSENT WORK RIGHT NOW"
  (interactive)
  (switch-to-buffer (other-buffer))
)

;; 1/25/2008
(global-set-key (kbd "<f11>") (lambda () (interactive) (switch-to-buffer (other-buffer))))

(global-set-key [(control ?c) ?o] (lambda () (interactive) (switch-to-buffer (other-buffer))))
                                                             
;; 1/13/2008
;;(global-set-key [(control ?c) ?o] (lambda () (interactive)
;;	      (switch-to-buffer (cadr (buffer-list)))))

;;(global-set-key (kbd "<f11>") (lambda () (interactive)
;;				(switch-to-buffer (cadr (buffer-list)))))


;; these dont work over SSH...
(global-set-key (kbd "C-'") 'jump-to-register)
(global-set-key (kbd "C-M-'") 'point-to-register)




;; 1/25/2009 1:52AM  
;;   trying to map a key to the [] key in VIM...

;; <quotemstr_> lamdk: re-search-etc, or (save-excursion (forward-line -1)
;;                           	          (looking-at blahblahblah))
(defun end-of-previous-defun (&optional arg)
  (interactive "p")
  (let ((arg (or arg 1)))
    (cond
     ((save-excursion (forward-line -1) (looking-at "\n"))
      (progn (beginning-of-defun (+ arg) (end-of-defun)))
      (t (progn (beginning-of-defun (+ 1 arg)) (end-of-defun))))
     )
    )
)

(global-set-key (kbd "C-M-S-a") 'end-of-previous-defun)


(defun kill-all-dired-buffers()
  "Kill all dired buffers.        put in 3/31/09
   ...from http://www.emacswiki.org/emacs/KillingBuffers#toc3"
  (interactive)
  (save-excursion
    (let((count 0))
      (dolist(buffer (buffer-list))
	(set-buffer buffer)
	(when (equal major-mode 'dired-mode)
	  (setq count (1+ count))
	  (kill-buffer buffer)))
      (message "Killed %i dired buffer(s)." count ))))

(global-set-key (kbd "C-M-x d") 'kill-all-dired-buffers)



;; 1/14/2009
;;   TODO:
;;         TRY TO FIGURE OUT HOW TO MAKE THE COMMENT STYLE
;;         IN c-mode the same as C++ mode! 
;; 
;; <snogglethorpe> lamdk: it looks like you can also force // comments
;; 		   even in c mode, by setting `c-lit-type' to 'c++
;; <snogglethorpe> lamdk: but it's undocumented, so... 
;;
;; from 57.3.2 Hooks in the manual

     (setq my-c-style
;;       '((c-comment-only-line-offset . 4)
;;	 (comment-start . ("//"))
;;	 (comment-end . (""))
	 )

     (add-hook 'c-mode-common-hook
       '(lambda ()
          (c-add-style "my-style" my-c-style t)))


;; java
;; (defun my-java-mode-hook ()
;;    "Hook for running Java file..."
;;    ;;don't indent braces
;;    (c-set-offset 'substatement-open 0)
;;    (c-set-offset 'statement-case-open 0)
;;    (c-set-offset 'case-label '+)
;;    (setq indent-tabs-mode nil))
;; (add-hook 'java-mode-hook 'my-java-mode-hook)

(defun my-comint-init ()
  (ansi-color-for-comint-mode-on)
  (local-set-key (kbd "<tab>") 'dabbrev-expand)
  (local-set-key (kbd "C-M-n") 'viper-scroll-up-one)
  (local-set-key (kbd "C-M-p") 'viper-scroll-down-one)
  (local-set-key (kbd "M-r") 'move-to-window-line))  ;; originally 'comint-previous-matching-input

(add-hook 'comint-mode-hook 'my-comint-init) 

(defun my-erc-init() 
;;  (setq longlines-wrap-follows-window-size t)  ; dosent work that well 
;;  (longlines-mode)
;  (color-theme-ld-dark)
  (erc-scrolltobottom-mode 1)
;  (scroll-all-mode)
)

(add-hook 'erc-mode-hook 'my-erc-init) 

(defun my-diff-init() 
  (local-set-key (kbd "s-n") 'viper-scroll-up-one)
  (local-set-key (kbd "s-p") 'viper-scroll-down-one)
)

(add-hook 'diff-mode-hook 'my-diff-init)




(require 'telnet)
(defun telnet (host)
  "Open a network login connection to host named HOST (a string).
Communication with HOST is recorded in a buffer `*PROGRAM-HOST*'
where PROGRAM is the telnet program being used.  This program
is controlled by the contents of the global variable
`telnet-host-properties', falling back on the value of the
global variable `telnet-program'. Normally input is edited
in Emacs and sent a line at a time."
  (interactive "Open connection to host: ")
  (let* ((comint-delimiter-argument-list '(?\  ?\t))
         (properties (cdr (assoc host telnet-host-properties)))
         (telnet-program (if properties (car properties) telnet-program))
         (name (concat telnet-program "-" (comint-arguments host 0 nil) ))
         (buffer (get-buffer (concat "*" name "*")))
         (telnet-options (if (cdr properties)
                 (cons "-l" (cdr properties))))
         process)
    (if (and buffer (get-buffer-process buffer))
        (pop-to-buffer (concat "*" name "*"))
      (pop-to-buffer
       (apply 'make-comint name telnet-program nil telnet-options))
      (setq process (get-buffer-process (current-buffer)))
      ;;(set-process-filter process 'telnet-initial-filter)
      ;; Don't send the `open' cmd till telnet is ready for it.
      ;;(accept-process-output process)
      (erase-buffer)
      (send-string process (concat "open " host "\n"))
      (telnet-mode)
      (setq telnet-remote-echoes nil)
;;      (setq telnet-new-line "\n") ;; needed for cygwin 1.3.11
      (setq comint-input-sender 'telnet-simple-send)
      (setq telnet-count telnet-initial-count)
      (setq comint-process-echoes t)
      )))




(defun geno ()
  "Go to Genocide -_-"
  (interactive)
  (telnet "geno.org 2222")
; (color-theme-ld-dark)
;  (setq frame-title-format "GENO")
)


; from...  http://www.emacswiki.org/emacs/TabCompletion
;;;
;; Smart Tab

(defvar smart-tab-using-hippie-expand nil
  "turn this on if you want to use hippie-expand completion.")

;; (global-set-key [(tab)] 'smart-tab)
(defun smart-tab (prefix)
  "Needs `transient-mark-mode' to be on. This smart tab is
minibuffer compliant: it acts as usual in the minibuffer.

In all other buffers: if PREFIX is \\[universal-argument], calls
`smart-indent'. Else if point is at the end of a symbol,
expands it. Else calls `smart-indent'."
  (interactive "P")
  (if (minibufferp)
      (minibuffer-complete)
    (if (smart-tab-must-expand prefix)
        (if smart-tab-using-hippie-expand
            (hippie-expand nil)
          (dabbrev-expand nil))
      (smart-indent))))

(defun smart-indent ()
  "Indents region if mark is active, or current line otherwise."
  (interactive)
  (if mark-active
      (indent-region (region-beginning)
                     (region-end))
    (indent-for-tab-command)))

(defun smart-tab-must-expand (&optional prefix)
  "If PREFIX is \\[universal-argument], answers no.
Otherwise, analyses point position and answers."
  (unless (or (consp prefix)
              mark-active)
    (looking-at "\\_>")))

(global-set-key (kbd "<tab>") 'smart-tab)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(erc-fill-column 70)
 '(erc-hide-list (quote ("JOIN" "NICK" "PART" "QUIT")))
 '(erc-input-line-position -1)
 '(indent-tabs-mode nil)
 '(mail-interactive t)
 '(ns-alternate-modifier (quote super))
 '(safe-local-variable-values (quote ((compilation-scroll-output))))
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

