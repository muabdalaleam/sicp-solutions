(load "./1_43.scm") ;; `repeat`

(define threshold 0.0001)

(define (average-damp f)
  (lambda (x) (/ (+ x (f x))
				 2)))

(define (fixed-point f guess)
  ;; (display )

  (if (< (abs (- (f guess) guess)) threshold)
	  (f guess)
	  (fixed-point f (f guess))))

(define (nth-root x n)
  (fixed-point 
	((repeat average-damp (floor (log n 2)))
	  (lambda (y) (/ x (expt y (- n 1))))
	) 1.0))
