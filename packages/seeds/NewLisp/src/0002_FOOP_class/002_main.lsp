; create classes
(new Class 'Person)
(new Class 'Address)
(new Class 'City)
(new Class 'Street)

; create an object containing other objects
(set 'JohnDoe
  (Person
    (Address
      (City "Boston")
      (Street 123 "Main Street"))))
;; → (Person (Address (City "Boston") (Street 123 "Main Street")))

(println JohnDoe)

(println
  (assoc Address JohnDoe))

(println
  (assoc
    (list Address Street)
    JohnDoe))

(setf
  (assoc
    (list Address Street)
    JohnDoe)
  '(Street 456 "Main Street"))
;; → (Street 456 "Main Street")

(println JohnDoe)

(exit)
