#lang racket

(provide crazy2val)

(define (zpn x)
	(cond ((equal? x 'z) 0)
				((equal? x 'p) 1)
				((equal? x 'n) -1)))

(define (crazy2val c)
	(cond ((pair? c)
				 (let ((hd (car c))
							 (tl (cdr c)))
					 (+ (* 2 (crazy2val tl)) (zpn hd))))
				(else (zpn c))))
