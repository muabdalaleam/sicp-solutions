(load "./2_48.scm") ; segments
(load "./2_47.scm") ; frames
(load "./2_46.scm") ; vectors

; TODO: understand what is `frame`
; TODO: implement `draw-line`

(define (frame-coord-map frame)
  (lambda (v)
	(add-vect (origin-frame frame)
			  (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
						(scale-vect (ycor-vect v) (edge2-frame frame))))))

(define (segments->painter segs)
  (lambda (frame)
	(let ((seg-scaler (frame-coord-map frame)))
	  (for-each 
	    (lambda (seg) (draw-line (seg-scaler (start-segment seg))
	    						 (seg-scaler (end-segment seg))))
	    segs))))

(define frame-painter (segments->painter (list
	(make-segment (make-vect 0 0) (make-vect 0 1))
	(make-segment (make-vect 0 0) (make-vect 1 0))
	(make-segment (make-vect 0 1) (make-vect 1 1))
	(make-segment (make-vect 1 0) (make-vect 1 1)))))

(define x-painter (segments->painter (list
	(make-segment (make-vect 1 1) (make-vect 1 0))
	(make-segment (make-vect 0 0) (make-vect 0 1)))))

(define diamond-painter (segments->painter (list
	(make-segment (make-vect 0.5 0) (make-vect 1 0.5))
	(make-segment (make-vect 0.5 0) (make-vect 0 0.5))
	(make-segment (make-vect 1 0.5) (make-vect 0.5 1))
	(make-segment (make-vect 0 0.5) (make-vect 0.5 1)))))

; (define wave-painter ) This will take a full weekend so ... NO
