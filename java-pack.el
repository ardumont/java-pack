;;; java-pack.el --- java development with emacs

;;; Commentary:

;;; Code:

(require 'install-packages-pack)
(install-packs '(emacs-eclim))

;; ===================== setup file

(defvar *ECLIPSE_HOME* nil "Eclipse's installation folder.")

(defun mail-pack/--log (str)
  "Log STR with specific pack prefix."
  (message "java-pack - %s" str))

(defun java-pack/--setup! ()
  "Setup the java-pack"
  (require 'eclim)

  (custom-set-variables
   '(eclim-eclipse-dirs '(*ECLIPSE_HOME*))
   '(eclim-executable (format "%s/eclim" *ECLIPSE_HOME*)))

  (global-eclim-mode)

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
