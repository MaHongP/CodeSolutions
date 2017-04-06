#lang racket
(require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))
(paint einstein)
(define wave einstein)
(define wave2 (flip-vert einstein))
(define wave4 (below wave wave2))

(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter ( - n 1))))
        (below  painter (beside smaller smaller)))))
(define (down-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter ( - n 1))))
        (below (beside smaller smaller) painter))))
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (corner-split painter (- n 1)))
            (upper (up-split painter (- n 1)))
            (righter (right-split painter (- n 1)))
            )
        (below  (beside painter righter) (beside upper smaller)))))
    


;Test

(paint (flip-vert einstein))
(paint wave4)
(paint (flipped-pairs wave))
(paint (right-split wave 5))
(paint (up-split wave 3))
(paint (corner-split wave 3))