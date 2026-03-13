(load "../notes/symbolic_deriv.scm")

(define (sum? e)  (eq? (cadr e) '+))
(define (mult? e) (eq? (cadr e) '*))

(define (make-sum a b)
  (let ((expr (list a '+ b)))
    (cond ((and (number? a) (number? b)) (+ a b))
  	      ((number? a) (if (= a 0) b expr))
  		  ((number? b) (if (= b 0) a expr))
  		  (else expr))))

(define (make-mult a b)
  (let ((expr (list a '* b)))
    (cond ((and (number? a) (number? b)) (* a b))
		  ((number? a) (cond ((= a 0) 0) ((= a 1) b) (else expr)))
		  ((number? b) (cond ((= b 0) 0) ((= b 1) a) (else expr)))
  		  (else expr))))

(define (multiplier e) (car e))
(define (multiplicand e) (caddr e))

(define (addend e) (car e))
(define (augend e) (caddr e))
