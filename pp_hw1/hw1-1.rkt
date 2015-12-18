#lang racket

(provide gcd)

(define (gcd n m)
  (if (zero? n) m
      (if (zero? m) n
          (if (>= n m) (gcd (- n m) m) (gcd (- m n) n)))))