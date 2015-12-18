#lang racket

(provide yanghui)

(define (factorial n)
	(if (equal? 0 n) 1
			(* (factorial (- n 1)) n)))

(define (comb n m)
	(/ (factorial n) (* (factorial m) (factorial (- n m)))))

(define (yanghui np)
  (let ((n (if (> 0 np) (- np) np)))
	(let f ([h (- n 1)] [w (- n 1)])
		(if (< h 0) ""
				(if (equal? w -1) (f (- h 1) (- h 1))
						(string-append (f h (- w 1)) (number->string (comb h w))))))))

(yanghui 3)
