#lang racket

(provide zipperN)

(define (firstl l)
  (if (null? l) '()
      (if (null? (car l)) (firstl (cdr l))
          (append (list (car (car l))) (firstl (cdr l))))))

(define (lastl l)
  (if (null? l) '()
      (if (null? (car l)) (lastl (cdr l))
          (append (list (cdr (car l))) (lastl (cdr l))))))

(define (zipperN l)
  (if (null? l) '()
      (append (firstl l) (zipperN (lastl l)))))
  