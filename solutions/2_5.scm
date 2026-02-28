(define (cons a b)
  (if (and (integer? a) (integer? b)
		   (positive? a) (positive? b))

      (* (expt 2 a) (expt 3 b))
	  (display "Error: A and B must be positive integers")))

(define (car p)

  (define (iter i x)
	(if (= (remainder x 2) 0)
	    (iter (+ i 1) (/ x 2))
	    i))

  (iter 0 p))

(define (cdr p)

  (define (iter i x)
	(if (= (remainder x 3) 0)
	    (iter (+ i 1) (/ x 3))
	    i))

  (iter 0 p))
