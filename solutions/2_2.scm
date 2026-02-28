(define (make-segment p1 p2) (cons p1 p2))

(define (start-segment s) (car s))
(define (end-segment s)   (cdr s))


(define (make-point x y) (cons x y))

(define (x-point p) (car p))
(define (y-point p) (cdr p))


(define (segment-midpoint s)
  (let ((x1 (x-point (start-segment s)))
		(x2 (x-point (end-segment s)))
		(y1 (y-point (start-segment s)))
		(y2 (y-point (end-segment s))))

  (make-point (/ (+ x1 x2) 2.0)
			  (/ (+ y1 y2) 2.0))))

(define (segment-length s)
  (let ((x1 (x-point (start-segment s)))
		(x2 (x-point (end-segment s)))
		(y1 (y-point (start-segment s)))
		(y2 (y-point (end-segment s))))

  (sqrt (+ (expt (- x2 x1) 2) 
		   (expt (- y2 y1) 2)))))

(define (print-point p)
  (printf "(~A,~A)"
		  (x-point p)
		  (y-point p)))
