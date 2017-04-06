;Definition of rational number
;GCD algorithm
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))
      )
  )
(define (make-rat n d)
  (let ((g (gcd n d)))
  (cons (/ n g) (/ d g)))
  )
(define (numer x) (car x))
(define (denom x) (cdr x))

;Addition of rational number
(define (add-rat x y)
  (make-rat (+ (*(numer x) (denom y)) (* (numer y) (denom x)))
            (* (denom x) (denom y))
            )
  
  )
;Substract of rational number
(define (sub-rat x y)
  (make-rat (- (*(numer x) (denom y)) (* (numer y) (denom x)))
            (* (denom x) (denom y))
            )
  )
;Multiply of rational number
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))
            )
  )
;Division of rational number
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))
            )
  )
;Equally judgement of rational number
(define (equ-rat x y)
  (= (* (numer x) (denom y))
            (* (denom x) (numer y))
            )
  )
;Display of rational number
(define (dis-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
  )
  
;Test
;(define test-x (make-rat 1 2))
;(define test-y (make-rat 2 8))
;(dis-rat test-x)
;(dis-rat test-y)
;(dis-rat (add-rat test-x test-y))
;(dis-rat (sub-rat test-x test-y))
;(dis-rat (mul-rat test-x test-y))
;(dis-rat (div-rat test-x test-y))
;(newline)
;(display (equ-rat test-x test-y))
;(newline)
;(display (equ-rat test-x test-x))
;Test finished!
