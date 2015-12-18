#lang racket

(provide gcd)

(define (gcd n m)
	(if (equal? n 0) m
			(gcd (remainder m n) n)))
