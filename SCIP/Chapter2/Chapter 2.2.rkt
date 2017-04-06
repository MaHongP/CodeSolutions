;Length of a list
(define (length items)
  (define (length-iter a count)
    (if (null? a)
         count
         (length-iter (cdr a) (+ count 1))))
  (length-iter items 0)
  )
;Practice 2.17 last-pair
(define (last-pari items)
  (define (last-pair-inner a n)
    (if (= n 1)
        (car a)
        (last-pair-inner (cdr a) (- n 1))
        )
    )
  (if (null? items)
      (display "Input Error: Null List!")
      (last-pair-inner a (length a))
      )
  )
;Practice 2.18 reverse
(define (reverse items)
  (define (reverse-inner li)
    (if (null? li)
        ()
        (append (reverse (cdr li)) (list (car li)))))
  (reverse-inner items ))

;Practice 2.20 Same parity

(define (same-parity . lis)
  (define (same-parity-inner parity li re)
    (cond ((null? li)  re)
           ((= (remainder (car li) 2)  parity) (same-parity-inner parity (cdr li) (cons (car li) re)))
           ((not (= (remainder (car li) 2) parity)) (same-parity-inner parity (cdr li) re))
           ))
  (if (null? lis)
      lis
      ;(display lis)
  (cons (car lis) (reverse (same-parity-inner (remainder (car lis) 2) (cdr lis) (list ))))
  ))
          

; Test Unit
(define testl (list 1  2 3 5 7))
(define testl2 (list 2 4 6 8))
(append testl testl2)
(cdr testl)
(newline)
(length testl)
(last-pair testl)
(reverse testl)
(display "Same Parity")
(same-parity 1 2 3 4 5 8)
(same-parity 2 4 5 7 8)