(load "./2_46.scm")
(load "./2_47.scm")
(load "./2_49.scm")

; I hate vectors
(define (transform-painter p origin edge1 edge2)
  (lambda (frame)
	(let ((frame-map (frame-coord-map frame)))
	  (let ((new-origin (frame-map origin)))
		(p (make-frame
			 new-origin
			 (sub-vect new-origin (frame-map edge1)) ; don't understand why we are subtracting here
			 (sub-vect new-origin (frame-map edge2))))))))

(define (flip-horiz p)
  (transform-painter p 
    (make-vect 1 0)
    (make-vect 0 0)
	(make-vect 1 1)))

(define (rotate90 p)
  (transform-painter p
    (make-vect 1 0)
	(make-vect 1 1)
	(make-vect 0 0)))

(define (rotate180 p)
  (transform-painter p
    (make-vect 1 1)
	(make-vect 0 1)
	(make-vect 1 0)))

; (define (rotate180 p) (rotate90 (rotate90 p)))

(define (rotate270 p)
  (transform-painter p
	(make-vect 0 1)
	(make-vect 0 0)
	(make-vect 1 1)))

; Identity frame
; (make-frame (make-vect 0 0) (make-vect 1 0) (make-vect 0 1))

; |
; |
; |
; O————
