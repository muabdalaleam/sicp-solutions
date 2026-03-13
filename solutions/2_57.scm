(load "../notes/symbolic_deriv.scm")
(load "./2_38.scm")

(define (multiplier e) (cadr e))
(define (multiplicand e) (fold-left make-mult 1 (cddr e)))

(define (addend e) (cadr e))
(define (augend e) (fold-left make-sum 0 (cddr e)))

(define (derive expr x)
  (cond ((same-variable? expr x) 1)
		((or (number? expr) (variable? expr)) 0)
		((mult? expr) 
		 (make-sum (make-mult (multiplier expr) (derive (multiplicand expr) x))
			       (make-mult (multiplicand expr) (derive (multiplier expr) x))))
		((sum? expr)
		 (make-sum (derive (addend expr) x)
			       (derive (augend expr) x)))
		(else (display "Unsupported expression type (unable to derive)."))))

