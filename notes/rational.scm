(define (make-rat n d) (cons n d))

(define (numer p) (car p))

(define (denom p) (cdr p))

(define (add-rat x y)
  (let ((n1 (numer x))
		(n2 (numer y))
		(d1 (denom x))
		(d2 (denom y)))
	
	(make-rat (+ (* n1 d2) (* n2 d1)) (* d1 d2))))

(define (sub-rat x y)
  (let ((n1 (numer x))
		(n2 (numer y))
		(d1 (denom x))
		(d2 (denom y)))
	
	(make-rat (- (* n1 d2) (* n2 d1)) (* d1 d2))))

(define (mut-rat x y)
  (let ((n1 (numer x))
		(n2 (numer y))
		(d1 (denom x))
		(d2 (denom y)))
	
	(make-rat (* n1 n2) (* d1 d2))))

(define (div-rat x y)
  (let ((n1 (numer x))
		(n2 (numer y))
		(d1 (denom x))
		(d2 (denom y)))
	
	(make-rat (* n1 d2) (* n2 d1))))

