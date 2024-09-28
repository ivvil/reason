;;;; reason.asd

(asdf:defsystem #:reason
  :description "Reason is a way to simplify userspace drivers for peripherals like keyboards and mice"
  :author "Iván Villagrasa <ivvil412@gmail.com>"
  :license "GPL-3"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "reason"))
  :depends-on (dbus))
