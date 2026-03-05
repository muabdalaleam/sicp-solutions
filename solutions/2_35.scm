(load "./2_33.scm")

(define (count-leaves tree)
  (accumulate 
	(lambda (prev next) (+ prev 1))
	0
	(map (lambda (x) (if (pair? x) (count-leaves x) x)) tree)))
