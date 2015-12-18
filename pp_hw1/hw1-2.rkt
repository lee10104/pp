#lang racket

(provide t2)

(define (t2 n)
  (if (zero? n) "0"
      (string-append (t2 (- (absolut n) 1)) "0" (number->string (1n (absolut n))))))

(define (absolut n)
  (if (>= n 0) n (* -1 n)))

(define (1n n)
  (if (zero? n) 0
      (+ (expt 10 (- (absolut n) 1)) (1n (- (absolut n) 1)))))