#lang racket

(require "hw3-3-library.rkt")

(provide mazeGen)

; Play around the interface of hw3-3-library.rkt.
; After executing this file, see hw3-3.ps.
; To read .ps files, you will need
;  - GhostScript: http://www.ghostscript.com/download/gsdnld.html
;  - Ghostview: http://pages.cs.wisc.edu/~ghost/gsview/

(define (randomchoose n m maze k)
  (if (equal? k 0) (open-e n m maze)
      (if (equal? k 1) (open-w n m maze)
          (if (equal? k 2) (open-s n m maze)
              (open-n n m maze)))))

(define (one-line n m maze)
  (if (zero? m) maze
      (one-line n (- m 1) (open-w n m maze))))

(define (sev-line n m maze)
  (if (zero? n) (one-line n m maze)
      (sev-line (- n 1) m (one-line n m maze))))

(define (make-maze n m maze)
  (if (zero? n) (open-n n (random m) (open-s n (random m) maze))
      (make-maze (- n 1) m (open-s n (random m) maze))))

(define (mazeGen n m)
  (let ((maze (init-maze n m)))
    (if (zero? n) null
        (if (zero? m) null
            (make-maze n m (sev-line n (- m 1) maze))))))