#lang racket


; We auto-grade only execute function; other functions are not
; auto-graded. However, S, K, I, v, and a are required for
; grading. See hw4-2-grade.rkt for more information.
(provide execute S K I v a)


; Implement execute. 
;
; In the document, react has the type solution -> void.
; However, implement react: solution -> string for ease of grading.
; Return the string of the given solution printed by pprint.
;
; See hw4-2-grade.rkt for more information on what the returned string should look like.
; In short,
; S prints "S";
; K prints "K";
; I prints "I";
; variable x prints "x";
; tuple (E F) prints "(" + E + " " + F + ")".

(define (execute e) ; execute: E -> string
  (pprint 
   'TODO
   ))

(define S ; S: E
  'TODO)
(define K ; K: E
  'TODO)
(define I ; I: E
  'TODO)
(define (v str) ; v: string -> E
  'TODO)
(define (a lhs rhs) ; a: E * E -> E
  'TODO)


; You may need the following tree interface.

(define (isS? e) ; isS?: E -> bool
  'TODO)
(define (isK? e) ; isK?: E -> bool
  'TODO)
(define (isI? e) ; isI?: E -> bool
  'TODO)
(define (isv? e) ; isv?: E -> bool
  'TODO)
(define (isa? e) ; isa?: E -> bool
  'TODO)
(define (var e) ; var: E -> string
  'TODO)
(define (al e) ; al: E -> E
  'TODO)
(define (ar e) ; ar: E -> E
  'TODO)
(define (pprint e) ; pprint: E -> string
  'TODO)