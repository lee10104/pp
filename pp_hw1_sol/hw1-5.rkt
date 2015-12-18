#lang racket

(provide zipperN)

(define (getcar l)
  (if (null? l) '()
    (if (null? (car l)) (getcar (cdr l))
      (cons (car (car l)) (getcar (cdr l)) ) )))

(define (getcdr l)
  (if (null? l) '()
    (if (null? (car l)) (getcdr (cdr l))
      (cons (cdr (car l)) (getcdr (cdr l)) ) )))

(define (zipperN l)
  (let ([carlist (getcar l)] [cdrs (getcdr l)])
    (if (null? carlist) '()
      (append carlist (zipperN cdrs)) )))

(zipperN '(() ()))
(zipperN '((1 3 2) (4) (10 11)))
