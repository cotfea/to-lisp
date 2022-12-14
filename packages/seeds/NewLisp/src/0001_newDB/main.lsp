(set 'Mydb:data (sequence 1 100000))

(define (change-db obj idx value)
    (setf (obj:data idx) value))

(change-db Mydb 1234 "abcdefg")

;; (nth 1234 Mydb:data)

(Mydb:data 1234)

(println (Mydb:data 1234))

(exit)
