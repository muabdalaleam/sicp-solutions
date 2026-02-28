(load "./2_2.scm")

(define (make-origin-rect height width)
  (cons (make-segment (make-point 0      height) ;; top left
					  (make-point width  height))
		(make-segment (make-point 0      0)
					  (make-point width  0))))

(define (make-rect top-left height width)
  (let ((x (x-point top-left))
		(y (y-point top-left)))
    
	(cons (make-segment 
			top-left 
			(make-point (+ x width) y))
		  (make-segment 
			(make-point x (- y height))
			(make-point (+ x width) (- y height)) ))))

(define (height r)
  (abs (- (y-point (start-segment (car r)))
	      (y-point (start-segment (cdr r))))))

(define (width r)
  (abs (- (x-point (start-segment (car r)))
	      (x-point (end-segment (car r))))))


;; Those two procedures below don't care how the rectangle is
;; implemented

(define (rect-area r)
  (* (height r) (width r)))

(define (rect-perimeter r)
  (sqrt (+ (expt (height r) 2)
	       (expt (width r) 2))))
