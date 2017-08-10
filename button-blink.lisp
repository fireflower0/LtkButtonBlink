(load "packages.lisp" :external-format :utf-8)

(in-package :cl-ltk)

(load "libwiringPi.lisp" :external-format :utf-8)

(defconstant +pin+ 11)

(defun main ()
  (wiringPiSetupGpio)
  (pinMode +pin+ 1)
  (with-ltk ()
    (wm-title *tk* "Button Blink")
    (bind *tk* "<Alt-q>"
          (lambda (event)
            (setq *exit-mainloop* t)))
    (let ((btn1 (make-instance 'button
                               :master nil
			       :width 60
                               :text "Turn on LED"))
          (btn2 (make-instance 'button
                               :master nil
			       :width 60
                               :text "Turn off LED")))
          (setf (command btn1) (lambda ()
                                 (digitalWrite +pin+ 1)))
          (setf (command btn2) (lambda ()
                                 (digitalWrite +pin+ 0)))
          (pack (list btn1 btn2)))))

(main)
