; built-in generic FOOP object constructor
(define (Class:Class)
  (cons (context) (args)))

; create some new classes
(new Class 'Rectangle)
;; → Rectangle
(new Class 'Circle)
;; → Circle

; create some objects using the default constructor
(set 'rect (Rectangle 10 20))
;; → (Rectangle 10 20)
(set 'circ (Circle 10 10 20))
;; → (Circle 10 10 20)

(println rect)
(println circ)

; create a list of objects
; building the list using the list function instead of assigning
; a quoted list ensures that the object constructors are executed

(set 'shapes (list (Circle 5 8 12) (Rectangle 4 8) (Circle 7 7 15)))
(println shapes)

(exit)
