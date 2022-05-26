;;; Base Settings
(in-package :stumpwm)

;; connection to the REPL
;; use M-x slime-connect with port 4004 to connect emacs to StumpWM REPL
(require :swank)
(swank-loader:init)
(swank:create-server :port 4004
                     :style swank:*communication-style*
                     :dont-close t)

;; change focus on mouse click
(setf *mouse-focus-policy* :click)

;;; Keybinds

;; using C-t C-q, send the next keypress directly
;; for example, C-t C-q C-n sends C-n to Firefox (instead of "Down")
(define-key *root-map* (kbd "C-q") "send-raw-key")

;;;; Browsers

;; use Emacs-style keybinds in Firefox and Chromium
(define-remapped-keys
    '(("(firefox|Firefox|Chromium)" 
       ("C-n"   . "Down")
       ("C-p"   . "Up")
       ("C-f"   . "Right")
       ("C-b"   . "Left")
       ("C-v"   . "Next")
       ("M-v"   . "Prior")
       ("M-w"   . "C-c")
       ("C-w"   . "C-x")
       ("C-y"   . "C-v")
       ("M-<"   . "Home")
       ("M->"   . "End")
       ("C-M-b" . "M-Left")
       ("C-M-f" . "M-Right")
       ("C-k"   . ("C-S-End" "C-x")))))


