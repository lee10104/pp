#lang racket
(require "hw2-1.rkt")
(provide model make-branch make-mobile)
(provide weight is-balanced?)

(define (model n)
  (leaf n))

(define (make-branch n m)
  (node (list (leaf n) m)))

(define (make-mobile b1 b2)
  (node (list b1 b2)))

(define (weight m)
  (if (is-leaf? m) (leaf-val m)
      (if (is-leaf? (car (cdr m))) (leaf-val (car (cdr m)))
          (if (is-leaf? (car m)) (weight (car (cdr m))) (+ (weight (car m)) (weight (car (cdr m))))))))

(define (is-balanced? m)
  (if (is-leaf? m) #t
      (if (and (is-leaf? (car (cdr (car m)))) (is-leaf? (car (cdr (car (cdr m)))))) (equal? (* (leaf-val (car (car m))) (weight (car m))) (* (leaf-val (car (car (cdr m)))) (weight (car (cdr m)))))
          (if (is-leaf? (car (cdr m))) (is-balanced? (car (cdr m))) (is-balanced? (car (cdr (car m))))))))