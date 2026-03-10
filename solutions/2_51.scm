(load "./2_50.scm")

(define (below p1 p2)
  (let ((top (transform-painter p1
		  (make-vect 0 0.5)
		  (make-vect 1 0.5)
		  (make-vect 0 1)))
		
		(bottom (transform-painter p1
		  (make-vect 0 0)
		  (make-vect 1 0)
		  (make-vect 0 0.5))))

	(lambda (frame) (top frame) (bottom frame))))

; (define (below p1 p2)
;   (rotate90 (beside (rotate270 p1)
; 					(rotate270 p2))))
