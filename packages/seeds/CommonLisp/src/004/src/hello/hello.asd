;;;; hello.asd

(asdf:defsystem #:hello
  :description "Describe hello here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "hello")))
