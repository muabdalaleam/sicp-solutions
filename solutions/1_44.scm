(load "./1_43.scm") ;; `repeat`

(define (smooth f dx)
  (lambda (x) (/ (+ (f (- x dx))
					(f x)
					(f (+ x dx)))
				 3)))

(define (smooth-n-times f dx n)
  ((repeat smooth n) f dx))
