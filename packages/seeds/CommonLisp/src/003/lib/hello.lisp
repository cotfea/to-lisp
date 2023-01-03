(load "lib/common/print.lisp")

(defun hello (&optional (name "World"))
  (println "Hello ~a!!!" name))
