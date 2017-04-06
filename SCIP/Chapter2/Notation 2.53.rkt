;#lang racket

;(memq 'apple '(pear banana prune))
;(memq 'apple '(x (apple sauce) y apple pear))
;Practice 2.54
(define (equal? list1 list2)
  (cond ((and (null? list1) (null? list2)) #t)
        ((eq? (car list1) (car list2)) (equal? (cdr list1) (cdr list2)))
        (else #f)))



;Test Unit

(list 'a 'b)
'(a b)
;Practice 2.53
(list 'a 'b 'c)
(list (list 'george))
(cdr '((x1 x2) (y1 y2)))
(car '((x1 x2) (y1 y2)))
(cadr '((x1 x2) (y1 y2)))
(pair? (car '(a short list)))
(memq 'red '((red shoes) (blue socks)))
(memq 'red '(red shoes blue socks))

;Practice 2.54
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))


;Practice 2.55
(car ''adfa)