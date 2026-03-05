(load "./2_33.scm")

(define (horner-eval x coeff-seq)
  (accumulate 
	(lambda (prev next) (+ next (* x prev)))
	0
	(reverse coeff-seq)))

; (horner-eval 2 '(1 2 3))
; (+ 1 (* x (+ 2 (* x (+ 3 (* x 0))))))
; 1 + x(2 + x(3 + x(0)))
; 1 + 2x^1 + 3x^2 + 4x^3


; (horner-eval 2 '(3))
; 3 + x(0)
; 3
