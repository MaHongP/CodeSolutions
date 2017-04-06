#lang planet neil/sicp
; practice 3-5
(define (square x) (* x x))
; Given random in range
(define (random-in-range low high)
  (let ((range ( - high low)))
    (+ low (random range))))
; Given monte-carlo method
(define (monte-carlo trials experiment) 
   (define (iter trials-remaining trials-passed) 
     (cond ((= trials-remaining 0) 
             (/ trials-passed trials)) 
           ((experiment) 
             (iter (- trials-remaining 1) (+ trials-passed 1))) 
           (else 
             (iter (- trials-remaining 1) trials-passed)))) 
   (iter trials 0))

;
(define (integral-test f x1 x2 y1 y2)
  (lambda () (f (random-in-range x1 x2) (random-in-range y1 y2))))
(define (estimate-integral pred x1 x2 y1 y2 trials)
  ( * 4 (monte-carlo trials
                     (integral-test pred x1 x2 y1 y2))))
(define find-pi (estimate-integral (lambda (x y) (<= ( + (square x) (square y)) 100)) -10 10 -10 10 100000))

; practice 3-6
 (define random-init 0)
 (define (rand-update x) (+ x 1)) ; A not-very-evolved PNRG 
 (define rand 
   (let ((x random-init)) 
     (define (dispatch message) 
       (cond ((eq? message 'generate) 
               (begin (set! x (rand-update x)) 
                      x)) 
             ((eq? message 'reset) 
               (lambda (new-value) (set! x new-value))))) 
     dispatch)) 