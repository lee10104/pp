#lang racket
(require "hw2-3.rkt")
(provide output)

(define (cnot n)
  (if (= n 0) 1 0))
(define (cand n m)
  (* n m))
(define (cor n m)
  (if (= (+ n m) 0) 0 1))

(define (output c)
  (cond
    [(is-zero? c) 0]
    [(is-one? c) 1]
    [(is-not? c) (cnot (output (sub-circuit c 0)))]
    [(is-and? c) (cand (output (sub-circuit c 0)) (output (sub-circuit c 1)))]
    [(is-or? c) (cor (output (sub-circuit c 0)) (output (sub-circuit c 1)))]))

(define c1 zero)
(define c2 one)
(define c3 (not-circuit c1))
(define c4 (and-circuit c2 c3))
(define c5 (not-circuit c4))
(define c6 (or-circuit c3 c5))

; output c6 1