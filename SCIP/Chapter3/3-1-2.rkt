#lang planet neil/sicp
(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance )
        "Insufficient Fund")))
(define (make-account balance)
  (define (withdraw amount)
    (if ( >= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient Fund"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT" m))))
  dispatch)

; practice 3-2
(define (make-monitored fuc)
  (define counts 0)
  ; dispatch message
  (define (dispatch m)
    (cond ((eq? m 'how-many-calls) counts)
          ((eq? m 'reset-count) (begin (set! counts 0) counts))
          (else (begin (set! counts (+ counts 1)) (fuc m)))))
  dispatch)

; practice 3-3
(define (make-account-pw balance passwd)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)))
  (define (deposit amount)
    (begin (set! balance ( + balance amount)) balance))
  (define (dispatch pw msg)
    (if (not (eq? pw passwd))
        (lambda (x) "Incorrect password")
        (cond ((eq? msg 'withdraw) withdraw)
              ((eq? msg 'deposit) deposit))))
  dispatch)

; practice 3-4
(define (call-the-cops) 
   (error "The cops have been called!"))

(define (password-guard passwd proc)
  (define incorrect-counts 0)
    (lambda (password m) 
     (cond [(= incorrect-counts 7) 
            (call-the-cops)] 
           [(eq? password passwd) 
            (set! incorrect-counts 0) 
            (proc m)] 
           [else 
            (set! incorrect-counts (+ 1 incorrect-counts)) 
            (error "Incorrect password")])))

  
(define (make-account-gd balance passwd)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)))
  (define (deposit amount)
    (begin (set! balance ( + balance amount)) balance))
  (define (dispatch  msg)
        (cond ((eq? msg 'withdraw) withdraw)
              ((eq? msg 'deposit) deposit)
              (else (error "UNKNOWN ACTION" msg ))))
  
(password-guard passwd  dispatch))