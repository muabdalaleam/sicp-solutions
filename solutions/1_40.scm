(define *threshold* 0.001)
(define *dx* 0.001)


(define (fixed-point f x)
  (if (< (abs (- (f x) x)) *threshold*)
	  (f x)
	  (fixed-point f (f x))))

(define (derive f)
  (lambda (x) (/ (- (f (+ x *dx*)) (f x))
				 *dx*)))

(define (newton-method f guess)
  (fixed-point (lambda (x) (- x (/ (f x) 
								   ((derive f) x)))) guess))

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

;; (newton-method (cubic a b c) 1.0)
