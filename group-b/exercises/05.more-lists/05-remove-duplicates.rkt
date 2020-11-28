#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (contains? x lst)
    (cond ((null? lst) #f)
      ((= (car lst) x) #t)
      (else (contains? x (cdr lst)))
    )
  )

; remove-duplicates 
; премахва всички повтарящи се елементи от списъка
(define (remove-duplicates xs)
  (define (helper xs res)
  (cond ((null? xs) res)
        ((not (contains? (car xs) res)) (helper (cdr xs) (append res (list (car xs)))))
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
