#lang racket
(require "hw2-1.rkt")
(provide zero one not-circuit and-circuit or-circuit)
(provide is-zero? is-one? is-not? is-and? is-or? sub-circuit)

(define zero
  (leaf 'z))
(define one
  (leaf 'o))
(define (not-circuit c)
  (node (list (leaf 'not) c)))
(define (and-circuit c1 c2)
  (node (list (leaf 'and) c1 c2)))
(define (or-circuit c1 c2)
  (node (list (leaf 'or) c1 c2)))

(define (is-zero? c)
  (and (is-leaf? c) (eq? 'z (leaf-val c))))
(define (is-one? c)
  (and (is-leaf? c) (eq? 'o (leaf-val c))))
(define (is-not? c)
  (and (not (is-leaf? c)) (eq? 'not (leaf-val (nth-child c 0)) )))
(define (is-and? c)
  (and (not (is-leaf? c)) (eq? 'and (leaf-val (nth-child c 0)) )))
(define (is-or? c)
  (and (not (is-leaf? c)) (eq? 'or (leaf-val (nth-child c 0)) )))

(define (sub-circuit c n)
  (nth-child c (+ 1 n)))

(define c1 zero)
(define c2 one)
(define c3 (not-circuit c1))
(define c4 (and-circuit c2 c3))
(define c5 (not-circuit c4))
(define c6 (or-circuit c3 c5))