#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (duplicate? x lst)
  (define (helper x lst count)
    (cond ((null? lst) #f)
      ((> count 1) #t)
      ((= (car lst) x) (helper x (cdr lst) (+ 1 count)))
      (else (helper x (cdr lst) count))
    )
  )

  (helper x lst 0) 
)

; remove-duplicates 
; премахва всички повтарящи се елементи от списъка
(define (remove-duplicates xs)
  (define (helper xs res)
  (cond ((null? xs) res)
        ((not (duplicate? (car xs) res)) (helper (cdr xs) (cons (car xs) res)))
        (else (helper (cdr xs) res))
  )
)
  (helper xs '()) 
)

(define tests
  (test-suite "remove-duplicates"
    (check-equal? (remove-duplicates '(1 1 2 2 1 3 3 2 3))  '(1 2 3))
    (check-equal? (remove-duplicates '(1 2 3))  '(1 2 3))
  )
)

(run-tests tests 'verbose)
