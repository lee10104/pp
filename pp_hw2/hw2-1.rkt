#lang racket
(provide leaf node)
(provide is-leaf? leaf-val nth-child)

(define (leaf n)
  (cons 'leaf n))

(define (node l)
  l)

(define (is-leaf? t)
  (equal? (car t) 'leaf))

(define (leaf-val t)
  (cdr t))

(define (nth-child t n)
  (if (zero? n) (car t) (nth-child (cdr t) (- n 1))))