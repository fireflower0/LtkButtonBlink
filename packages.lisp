(ql:quickload "cffi")
(ql:quickload "ltk")

(defpackage :cl-ltk
  (:use :common-lisp
	:ltk
	:cffi))
