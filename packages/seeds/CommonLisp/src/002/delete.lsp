(defvar *db* nil)

(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))

(defun where
  (&key
    title artist rating
    (ripped nil ripped-p))
  #'(lambda (cd)
      (and
        (if title (equal (getf cd :title) title) t)
        (if artist (equal (getf cd :artist) artist) t)
        (if rating (equal (getf cd :rating) rating) t)
        (if ripped-p (equal (getf cd :ripped) ripped) t))))

(defun delete-rows (selector-fn)
  (setf *db*
    (remove-if selector-fn *db*)))

(defun save-db (filename)
  (with-open-file
    (out filename
      :direction :output
      :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

(load-db "./my-cds.db")
(delete-rows (where :artist "Dixie Chicks"))
(save-db "./my-cds.db")
