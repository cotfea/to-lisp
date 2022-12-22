(defvar *db* nil)

(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))

(defun make-comparison-expr (field value)
  `(equal (get cd ,field) ,value)
)

(defun make-comparisons-list (fields)
  (loop while fields
    collecting (make-comparison-expr (pop fields) (pop fields))))

(defmacro where (&rest clauses)
  `#'(lambda (cd)
    (and ,@(make-comparisions-list clauses))))

(defun update
  (selector-fn
    &key
      title artist rating
      (ripped nil ripped-p))

  (setf *db*
    (mapcar
      #'(lambda (row)
          (when (funcall selector-fn row)
            (if title (setf (getf row :title) title))
            (if artist (setf (getf row :artist) artist))
            (if rating (setf (getf row :rating) rating))
            (if ripped-p (setf (getf row :ripped) ripped)))
          row)
      *db*)))

(defun save-db (filename)
  (with-open-file
    (out filename
      :direction :output
      :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

(load-db "./my-cds.db")
(update (where :artist "Dixie Chicks") :rating 11)
(save-db "./my-cds.db")
