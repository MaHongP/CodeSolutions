(define (cont-frac n d k)
   ( if ( = k 0 )
        (/ (n k) (d k))
        (/ (n k) (+ (d k)  (cont-frac (n k) (d k) (- k 1))))))
(cont-frac 1.0 1.0 100)

(cont-frac (lambda (x) 1.0) (lambda (x) 1.0) 20)