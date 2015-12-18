#lang racket

(provide t2)

(define (t2 n)
	(let f ([m (abs n)])
		(if (equal? m 0) "0"
				(string-append (f (- m 1)) "0" (make-string m #\1)))))
