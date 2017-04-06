;Practice 2-4
(define (conns x y)
  (lambda (m) (m x y)))
(define (carr z)
  (z (lambda (p q) p)))
(define (cdrr z)
  (z (lambda (p q) q)))

;Test Unit
(define x (conns 1 2))
(display (carr x))
(newline)
(display (cdrr x))