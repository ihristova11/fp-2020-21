#lang racket
(require rackunit)
(require rackunit/text-ui)

; Ще сортираме списък по метода на пряката селекция.
; За тази цел започваме с дефиниции на спомагателни функции.

; remove-first - връща ни xs, но без първото срещане на x
(define (remove-first x xs)
  (cond ((null? xs) '())
        ((= x (car xs)) (cdr xs))
        (else (cons (car xs) (remove-first x (cdr xs))))))


; find-min - връща ни най-малкото число от непразен списък
(define (find-min xs)
  (cond ((null? (cdr xs)) (car xs))
        (else (min (car xs) (find-min (cdr xs))))))


(define (selection-sort xs)
  (if (null? xs)
      '()
       (let ((min-element (find-min xs)))
             (cons min-element (selection-sort (remove-first min-element xs))))))

(define tests
  (test-suite "Selection sort"
    (check-true (= (length (selection-sort '(2 6 1 2 9 7))) (length '(2 6 1 2 9 7))))
    (check-equal? (selection-sort '(2 6 1 2 9 7)) '(1 2 2 6 7 9))
    (check-equal? (selection-sort '(2)) '(2))
    (check-equal? (selection-sort '(1 2 2 6 7 9)) '(1 2 2 6 7 9))
  )
)

(run-tests tests 'verbose)