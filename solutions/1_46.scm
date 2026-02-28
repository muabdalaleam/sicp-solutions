(define threshold 0.001)

(define (iterative-improve good-enough? improve)
  (define (iter x)
	(if (good-enough? x)
	    x
		(iter (improve x))))

  iter)

(define (fixed-point f guess) 
  ((iterative-improve 
	 (lambda (x) (< (abs (- (f x) x)) threshold))
	 (lambda (x) (f x))) guess))

(define (newton-sqrt n guess)
  ((iterative-improve
	 (lambda (x) (< (abs (- n (expt x 2))) threshold))
	 (lambda (x) (/ (+ x (/ n x)) 2))) guess))
