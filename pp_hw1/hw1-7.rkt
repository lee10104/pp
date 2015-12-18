#lang racket

(provide crazy2add)

(define (crazy2add lhs rhs)
  (if (and (null? lhs) (null? rhs)) '()
      (cond
        ((or (and (equal? a 'n) (equal? b 'p)) (and (equal? a 'z) (equal? b 'z)) (and (equal? a 'p) (equal? b 'n))) 'z)
        ((or (and (equal? a (or 'z '())) (equal? b 'p)) (and (equal? a 'p) (equal? b (or 'z '())))) 'p)
        ((or (and (equal? a 'n) (equal? b (or 'z '()))) (and (equal? a (or 'z '())) (equal? b 'n))) 'n)
        ((and (equal? a 'p) (equal? b 'p)) (append (list 'z) (crazy2add (cdr lhs) (cdr rhs))))
        ((and (equal? a 'n) (equal? b 'n)) '(z . n))
        (else
         (if (and (equal? (car lhs) 'n) (equal? (car rhs) 'n)) (adding 'n (crazy2add (cdr lhs) (cdr rhs)))
                  (if (and (equal? (car lhs) 'p) (equal? (car rhs) 'p)) (adding 'p (crazy2add (cdr lhs) (cdr rhs)))
                      (append (adding (car lhs) (car rhs)) (crazy2add (cdr lhs) (cdr rhs))))) lhs) rhs)))
              