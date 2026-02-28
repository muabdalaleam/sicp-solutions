(load "./approx_interval.scm")

(define (par1 r1 r2)
  (let
	((one (make-interval 1 0.0)))

    (div-intervals one 
				   (add-intervals (div-intervals one r1)
								  (div-intervals one r2)))))

(define (par2 r1 r2)
	(div-intervals (mul-intervals r1 r2)
				   (add-intervals r1 r2)))

