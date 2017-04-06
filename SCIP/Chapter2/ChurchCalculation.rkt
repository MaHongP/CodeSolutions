;Practice 2-6 Church calculation
;Definition of zero and addition of one
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
;Definition of one and two (without using zero and add-1
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (square x) (* x x))

(define (add a b)
  (lambda (f) (lambda (x) (a f (b f x)))))
;Test Unit
(display (square 2))
(newline)
((one square) 2)
((two square) 2)