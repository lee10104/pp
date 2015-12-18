#lang racket

(require "hw3-2-library.rkt")

(provide maze-check)

(define (next-visit maze set already-passed)
  (if (null? set) null
      (if (not (is-member? (car set) already-passed)) (car set) (next-visit maze (cdr set) already-passed))))

(define (maze-checking maze start end already-passed temp)
  (if (null? temp) #f
      (if (equal? (car temp) end) #t
          (if (null? (next-visit maze (can-enter maze (car temp)) already-passed)) (maze-checking maze (car temp) end (add-element (car temp) already-passed) (cdr temp))
              (maze-checking maze (car temp) end (add-element (next-visit maze (can-enter maze (car temp)) already-passed) already-passed) (cons (next-visit maze (can-enter maze (car temp)) already-passed) temp))))))

(define (maze-check maze start end)
  (maze-checking maze start end (add-element start empty-set) (cons start '())))

;checking already passed room, it always ends.