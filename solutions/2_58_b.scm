(load "./2_38.scm") ; fold-left
(load "../notes/symbolic_deriv.scm")

;; Helper procedures
(define (in? s seq)
  (pair? (memq s seq)))

(define (until-symbol s seq)
  (define (iter temp remaining)
	(if (eq? (car remaining) s)
	    temp
		(iter (append temp (list (car remaining))) (cdr remaining))))

  (iter '() seq))

(define (after-symbol s seq)
  (cdr (memq s seq)))

(define (unlist-if-single s)
  (if (null? (cdr s)) (car s) s))

(define (sum? e) (in? '+ e))
(define (mult? e) (and (in? '* e) (not (sum? e))))

(define (make-sum a b)
  (let ((expr (if (pair? a) 
				  (append a (list '+ b))
				  (list a '+ b))))

    (cond ((and (number? a) (number? b)) (+ a b))
  	      ((number? a) (if (= a 0) b expr))
  		  ((number? b) (if (= b 0) a expr))
  		  (else expr))))

(define (make-mult a b)
  (let ((expr (if (pair? a)
				  (append a (list '* b))
				  (list a '* b))))

    (cond ((and (number? a) (number? b)) (* a b))
		  ((number? a) (cond ((= a 0) 0) ((= a 1) b) (else expr)))
		  ((number? b) (cond ((= b 0) 0) ((= b 1) a) (else expr)))
  		  (else expr))))

(define (multiplier e) 
  (unlist-if-single (until-symbol '* e)))

(define (multiplicand e)
  (unlist-if-single (after-symbol '* e))) ; XXX:

(define (addend e) 
  (unlist-if-single (until-symbol '+ e)))

(define (augend e) 
  (unlist-if-single (after-symbol '+ e)))

; (1 + 2 + 3 + 4)
; (1 + 2 * 3 + 4) -> (1 + (2 * 3 + 4)) -> (1 + (4 + (2 * 3)))
; (1 * 2 + 3 * 4)
; (1 * 2 * 3 * 4)
