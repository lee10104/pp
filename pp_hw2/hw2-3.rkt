#lang racket
(require "hw2-1.rkt")
(provide zero one not-circuit and-circuit or-circuit)
(provide is-zero? is-one? is-not? is-and? is-or? sub-circuit)

(define zero
  (leaf 0))

(define one
  (leaf 1))

(define (not-circuit c)
  (if (equal? c (leaf 0)) (node (list (leaf 1) c))
      (if (equal? c (leaf 1)) (node (list (leaf 0) c))
          (if (equal? (car c) (leaf 0)) (node (list (leaf 1) c)) (node (list (leaf 0) c))))))

(define (add1 c1 c2)
  (node (list (leaf 1) c1 c2)))

(define (add0 c1 c2)
  (node (list (leaf 0) c1 c2)))

(define (and-circuit c1 c2)
  (cond
    ((and (is-leaf? c1) (is-leaf? c2))
     (if (and (equal? (leaf-val c1) 1) (equal? (leaf-val c2) 1)) (add1 c1 c2) (add0 c1 c2)))
    ((is-leaf? c1)
     (if (and (equal? (leaf-val c1) 1) (equal? (leaf-val (car c2)) 1)) (add1 c1 c2) (add0 c1 c2)))
    ((is-leaf? c2)
     (if (and (equal? (leaf-val (car c1)) 1) (equal? (leaf-val c2) 1)) (add1 c1 c2) (add0 c1 c2)))
    (else
     (if (and (equal? (leaf-val (car c1)) 1) (equal? (leaf-val (car c2)) 1)) (add1 c1 c2) (add0 c1 c2)))))

(define (or-circuit c1 c2)
  (cond
    ((and (is-leaf? c1) (is-leaf? c2))
     (if (and (equal? (leaf-val c1) 0) (equal? (leaf-val c2) 0)) (add0 c1 c2) (add1 c1 c2)))
    ((is-leaf? c1)
     (if (and (equal? (leaf-val c1) 0) (equal? (leaf-val (car c2)) 0)) (add0 c1 c2) (add1 c1 c2)))
    ((is-leaf? c2)
     (if (and (equal? (leaf-val (car c1)) 0) (equal? (leaf-val c2) 0)) (add0 c1 c2) (add1 c1 c2)))
    (else
     (if (and (equal? (leaf-val (car c1)) 0) (equal? (leaf-val (car c2)) 0)) (add0 c1 c2) (add1 c1 c2)))))

(define (is-zero? c)
  (if (is-leaf? c)
      (if (zero? (leaf-val c)) #t #f) #f))

(define (is-one? c)
  (if (is-leaf? c)
      (if (zero? (leaf-val c)) #f #t) #f))

(define (length l)
  (if (null? l) 0 (+ 1 (length (cdr l)))))

(define (is-not? c)
  (equal? (length c) 2))

(define (is-and? c)
  (if (equal? (length c) 3)
      (cond
        ((and (is-leaf? (car (cdr c))) (is-leaf? (car (cdr (cdr c))))) (if (equal? (car c) (and (car (cdr c)) (car (cdr (cdr c))))) #t #f))
        ((is-leaf? (car (cdr c))) (if (equal? (car c) (and (car (cdr c)) (car (car (cdr (cdr c)))))) #t #f))
        ((is-leaf? (car (cdr (cdr c)))) (if (equal? (car c) (and (car (car (cdr c))) (car (cdr (cdr c))))) #t #f))
        (else (if (equal? (car c) (and (car (car (cdr c))) (car (car (cdr (cdr c)))))) #t #f))) #f))

(define (is-or? c)
  (if (equal? (length c) 3)
      (cond
        ((and (is-leaf? (car (cdr c))) (is-leaf? (car (cdr (cdr c))))) (if (equal? (car c) (or (car (cdr c)) (car (cdr (cdr c))))) #t #f))
        ((is-leaf? (car (cdr c))) (if (equal? (car c) (or (car (cdr c)) (car (car (cdr (cdr c)))))) #t #f))
        ((is-leaf? (car (cdr (cdr c)))) (if (equal? (car c) (or (car (car (cdr c))) (car (cdr (cdr c))))) #t #f))
        (else (if (equal? (car c) (or (car (car (cdr c))) (car (car (cdr (cdr c)))))) #t #f))) #f))

(define (sub-circuit c n)
  (if (zero? n) (car (cdr c)) (car (cdr (cdr c)))))