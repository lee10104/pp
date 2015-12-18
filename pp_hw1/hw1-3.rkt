#lang racket

(provide yanghui)

(define (fact n)
  (if (zero? n) 1 (* n (fact (- n 1)))))

(define (strcomb n r)
        (number->string (/ (/ (fact n) (fact (- n r))) (fact r))))
                                  
(define (nthraw n r)
  (if (zero? n) "1"
      (if (equal? n r) (strcomb n r) (string-append (strcomb n r) (nthraw n (+ r 1))))))

(define (yanghui n)
  (if (zero? n) ""
      (string-append (yanghui (- n 1)) (nthraw (- n 1) 0))))
