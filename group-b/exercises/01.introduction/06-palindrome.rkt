#lang racket
(require rackunit)
(require rackunit/text-ui)
; 1.7 - Търсим процедура, която проверява дали едно число е палиндром.
; Трябва да работи и за отрицателни числа.

(define (reverse-helper new old)
  (if (not (= old 0))
      (reverse-helper (+ (* 10 new) (modulo old 10)) (floor (/ old 10)))
      new
  )
)

(define (reverse-digits number)
  (if (< number 0)
      (* -1 (reverse-helper 0 (abs number)))
      (reverse-helper 0 number)
      )
)

(define (palindrome? number)
  (= number (reverse-digits number))
)

(define tests (test-suite
  "Palindrome tests"

  (test-case "Should function correctly"
    (check-true (palindrome? 12321))
    (check-false (palindrome? 872))
    (check-true (palindrome? 2))
    (check-true (palindrome? 310013))
    (check-true (palindrome? -21212))
)))

(run-tests tests 'verbose)
