;Trees

;Length of a list
(define (length items)
  (define (length-iter a count)
    (if (null? a)
         count
         (length-iter (cdr a) (+ count 1))))
  (length-iter items 0)
  )

;Count leaves of a tree
(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree )) 1)
        (else (+(count-leaves (car tree))
                (count-leaves (cdr tree))))))


;Deep reverse Practice 2.27
(define (reverse items)
  (define (reverse-inner li)
    (if (or (null? li) (not(pair? li)))
        li
        (append (reverse-inner  (cdr li)) (list (car li)))))
  (reverse-inner items))
     
(define (deep-reverse items)
  (define (dr-inner item)
    (if (pair? item) (map dr-inner (map reverse item))
        item
        ))
  (if (null? items) items
      (dr-inner (reverse items))))
;Test Unit
;Practice 2.24
(define test-tr (cons (list 1 2) (list 3 4)))
(display test-tr)
(newline)
(count-leaves test-tr)
;Deep-reverse
(newline)
(display test-tr)
(newline)
(display (reverse test-tr))
;(deep-reverse test-tr)
(newline)
(map reverse test-tr)
(map reverse (list (list 1 2) (list 3 4 ) ))
(pair? test-tr)
(deep-reverse test-tr)
(newline)
(display (deep-reverse (list (list (list 1 2) 3 4) 5 6)))

