(define *threshold* 0.001)
(define *dx* 0.001)
(define *guess* 1.0)


(define (fixed-point f x)
  (if (< (abs (- (f x) x)) *threshold*)
	  (f x)
	  (fixed-point f (f x))))

(define (average-damp f)
  (lambda (x) (/ (+ (f x) x) 2)))

(define (derive f)
  (lambda (x) (/ (- (f (+ x *dx*)) (f x))
				 *dx*)))

(define (newton-method f)
  (fixed-point (lambda (x) (- x (/ (f x) 
								   ((derive f) x)))) *guess*))

;; The `y` value that satisfies `y^2 - x = 0` is the sqrt of x
(define (newton-sqrt x) (newton-method (lambda (y) (- (* y y) x))))
