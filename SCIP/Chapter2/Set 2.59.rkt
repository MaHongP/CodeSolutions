
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))
(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      ;(append  set (list x))
      (cons x set)
      ))
(define (intersection-set set1 set2)
  (cond((or (null? set1) (null? set2)) '())
       ((element-of-set? (car set1) set2)
           (cons (car set1)
                 (intersection-set (cdr set1) set2)))
       (else (intersection-set (cdr set1) set2))))

;Practice 2.59
(define (union-set set1 set2) 
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2)
         (union-set (cdr set1) set2))
        (else (cons (car set1) (union-set (cdr set1) set2)))))
         

;Test Unit
(element-of-set? 'x (list 'y 'z 'x))
(adjoin-set 'x '(y z ))
(intersection-set '(1 2 3 4 5) '(3 4 5 6 7))
(union-set '(1 2 3 4 5) '(3 4 5 6 7))
(< (car '(1 2 3)) (cadr '(1 2 3)))