;; (defun println (&rest line)
;;   (format t "~a" `(format t
;;     ,(format nil "~{\"~a~^\" ~}\"" line)
;;   )))

(defun println (&rest line)
  (apply #'format (append (list t) line))
  (format t "~%")
)
