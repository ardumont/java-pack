;;; java-pack.el --- java development with emacs

;;; Commentary:

;;; Code:

(require 'install-packages-pack)
(install-packs '(emacs-eclim
                 company))

;; ===================== setup file

(defvar *ECLIPSE_HOME* nil "Eclipse's installation folder.")

(defun mail-pack/--log (str)
  "Log STR with specific pack prefix."
  (message "java-pack - %s" str))

(defun java-pack/--setup! ()
  "Setup the java-pack"
  (require 'eclim)

  (custom-set-variables
   '(eclim-eclipse-dirs `(,*ECLIPSE_HOME*)))

  (global-eclim-mode)

  ;; When the cursor is positioned on an error marker in a code buffer, emacs-eclim
  ;; uses the local help feature in emacs to display the corresponding error message in the echo area.
  ;; You can either invoke (display-local-help) manually or activate automatic display of local help by adding the following to .emacs:
  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1)
  (help-at-pt-set-timer)

  ;; Configuring company-mode
  ;; Emacs-eclim can integrate with company-mode to provide pop-up dialogs for auto-completion.
  ;; To activate this, you need to add the following to your .emacs:

  (require 'company)
  (require 'company-emacs-eclim)
  (company-emacs-eclim-setup)
  (global-company-mode t)

  (mail-pack/--log "Setup done!"))

;; ===================== setup functions

(defun java-pack/--setup-possible-p! ()
  "Check if the setup is possible by checking the value of *ECLIPSE-HOME*.
When not set, the setup is not possible, otherwise, all is good."
  (setq *ECLIPSE_HOME* (getenv "ECLIPSE_HOME")))

;; ===================== setup routine

(defun java-pack/load-pack! ()
  "A routine to (re)load the java-pack."
  (interactive)
  (if (java-pack/--setup-possible-p!)
      (java-pack/--setup!)
    (mail-pack/--log (concat "This pack depends on eclipse and eclim installation.\n"
                             "You need to setup your *ECLIPSE-HOME* to your rightful eclipse home folder.\n"
                             "Otherwise, this pack will not load!"))))

(provide 'java-pack)
;;; java-pack.el ends here
