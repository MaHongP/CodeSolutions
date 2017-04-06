;Demo

(define (random-integer)
  (floor (* 100000000000000 (random))))
(define (estimate-pi trials)
  (sqrt (/  6 (monte-carlo trials cesaro-test))))
(define (cesaro-test)
  (= (gcd (random-integer) (random-integer)) 1))
(define (monte-carlo trials experiment)
  (define (iter trials-r trials-p)
    (cond ((= trials-r 0) (/ trials-p trials))
          ((experiment)
           (iter (- trials-r 1) (+ trials-p 1)))
          (else
           (iter (- trials-r 1) trials-p))))
    (iter trials 0))
;Practice 3.5
(define (random-in-range low high)
  (+ low (* (random) (- high low))))
(define (estimate-integral p x1 x2 y1 y2)

  )
;Test Unit
(random)
(random-integer)
(random-in-range 10 20)
(monte-carlo 100000 cesaro-test)
(estimate-pi 100000)