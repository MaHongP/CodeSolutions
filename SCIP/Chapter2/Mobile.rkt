;Mobile
;A mobile has two branches, left and right
;branch consists two variables length and structure
;length is a number while structure can be a number representing weight or another mobile
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

;Branch choose
(define (left-branch x)
  (if (null? x) 0
  (car x)))
(define (right-branch x)
  (if (null? x) 0
  (car (cdr x))))
(define (branch-length x)
  (if (null? x) 0
  (car x)))
(define (branch-structure x)
  (if (null? x) 0
  (car (cdr  x))))

;Total weight
(define (lb-structure x)
  (if (null? x) 0
      (branch-structure (left-branch x))))
(define (rb-structure x)
  (if (null? x) 0
      (branch-structure (right-branch x))))
(define (total-weight mobile)
  (define (tw x)
    (if (not (pair? (lb-structure x))) (+ (lb-structure x) (total-weight (rb-structure x)))
        (+ (total-weight (lb-structure x)) (total-weight (rb-structure x)))
        ))
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
      (else (tw mobile)))
  )
;Balance
(define (lb-len x)
  (if (or (null? x) (not (pair? x)))
      0
      (branch-length (left-branch x))))
(define (rb-len x)
  
  (if (or (null? x) (not (pair? x)))
      0
      (branch-length (right-branch x))))
                         
(define (balance? mobile)
  (define (b? x)
    (if (= (* (lb-len x) (total-weight (lb-structure x)))
           (* (rb-len x) (total-weight (rb-structure x))))
        (and (balance? (lb-structure x)) (balance? (rb-structure x)))
        #f))
  (if (or (not(pair? mobile)) (null? mobile))
      #t
     (b? mobile)))


;Test Unit
(define t-mobile (make-mobile (make-branch 1 2) (make-branch 3 4)))
(define t-mobile2 (make-mobile (make-branch 1
                               (make-mobile (make-branch 2 3) (make-branch 4 5)))
                               (make-branch 6 7)))
(define t-mobile3 (make-mobile (make-branch 10
                               (make-mobile (make-branch 3 1) (make-branch 1 3)))
                               (make-branch 5 8)))
(display t-mobile)
;(newline)
;
;(display t-mobile2)
;
;(newline)
;(display (left-branch t-mobile2))
;(newline)
;(display (right-branch t-mobile2))
;(newline)
;(display (lb-structure t-mobile2))
;(newline)
;(display (rb-structure t-mobile2))
;(total-weight t-mobile)
;(total-weight t-mobile2)


;2.29 c)
;(display (balance? t-mobile3))