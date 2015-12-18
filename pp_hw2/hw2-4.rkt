#lang racket
(require "hw2-3.rkt")
(provide output)

(define (output c)
  (if (is-zero? c) 0
      (if (is-one? c) 1
          (if (is-zero? (car c)) 0 1))))