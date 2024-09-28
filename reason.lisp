;;;; reason.lisp

(in-package #:dev.shft.reason)

(define-dbus-object root
  (:path "/"))

(define-dbus-object reason
  (:path "/dev/shft/reason")
  (:parent root))

(define-dbus-method (reason my-test) ((s1 :string) (s2 :string)) (:string)
  (:interface "dev.shft.reason")
  (concatenate 'string s1 s2))

(define-dbus-signal-handler (reason on-signal) ((s :string))
  (:interface "dev.shft.reason")
  (format t "Got signal with arg ~S~%" s))

(defun publish-example ()
  (handler-case
      (with-open-bus (bus (session-server-addresses))
        (format t "Bus connection name: ~A~%" (bus-name bus))
        (publish-objects bus))
    (end-of-file ()
      :disconnected-by-bus)))
