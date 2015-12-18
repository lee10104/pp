#lang racket
(require "hw2-1.rkt")
(provide model)
(provide make-branch)
(provide make-mobile)
(provide weight)
(provide is-balanced?)


(define (model n)
  (leaf n))
(define (make-branch n m)
  (node (list (leaf n) m)))
(define (make-mobile b1 b2)
  (let ((w1 (nth-child b1 0))
        (b1 (nth-child b1 1))
        (w2 (nth-child b2 0))
        (b2 (nth-child b2 1)))
    (node (list w1 w2 b1 b2))))

(define (weight m)
  (if (is-leaf? m) (leaf-val m)
      (+ (weight (nth-child m 2))
         (weight (nth-child m 3)))))

(define (is-balanced? m)
  (if (is-leaf? m) #t
      (let ((d1 (leaf-val (nth-child m 0)))
            (d2 (leaf-val (nth-child m 1)))
            (sm1 (nth-child m 2))
            (sm2 (nth-child m 3))
                                                   )
        (and (= (* d1 (weight sm1)) (* d2 (weight sm2))) (is-balanced? sm1) (is-balanced? sm2) ))))




(define mdl1 (model 1))
(define mdl2 (model 2))
(define b1 (make-branch 12 mdl1))
(define b2 (make-branch 7 mdl2))
(define mbl1 (make-mobile b1 b2))

;(weight mbl1)
;(is-balanced? mbl1)