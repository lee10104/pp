#lang racket

(provide crazy2val)

(define (crazy2val c)
  (cond
    ((equal? c 'z) 0)
    ((equal? c 'p) 1)
    ((equal? c 'n) -1)
    (else (cond ((equal? (car c) 'z) (* 2 (crazy2val (cdr c))))
                ((equal? (car c) 'p) (+ 1 (* 2 (crazy2val (cdr c)))))
                ((equal? (car c) 'n) (+ -1 (* 2 (crazy2val (cdr c)))))))))