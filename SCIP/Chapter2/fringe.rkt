;Practice 2.28 Frange
(define (fringe items)
  (define (fringe-inner x)
  (if (pair? (car x))
      (fringe (append (list (car (car x))) (append (cdr (car x)) (cdr x))))
      (append (list (car x)) (fringe (cdr x)))
      ))
  (if (null? items) items
      (fringe-inner items)))


;Test Unit
(define test-l (list (list 1 2 ) (list (list 3 4 ) 5 6)))
(display test-l)
(newline)
(display (fringe test-l))