#lang racket
(provide leaf)
(provide node)
(provide is-leaf?)
(provide leaf-val)
(provide nth-child)

(define (leaf n)
  (cons 'leaf n))

(define (node l)
  (cons 'node l))

(define (is-leaf? t)
  (if (eq? (car t) 'leaf) #t #f))

(define (leaf-val t)
  (if (is-leaf? t) (cdr t) #f))

(define (get-nth tl n)
  (if (null? tl) #f
      (if (= n 0) (car tl)
          (get-nth (cdr tl) (- n 1)))))

(define (nth-child t n)
  (if (eq? (car t) 'node)
            (get-nth (cdr t) n)
            #f))