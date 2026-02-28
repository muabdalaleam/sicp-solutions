(load "./1_37.scm") ;; continuous-frac

(define (euler-fc acc)
  (+ 2 (continuous-frac (lambda (i) 1)
				        (lambda (i) (if (= (remainder i 3) 2)
									    (- i (quotient (- i 2) 3))
										1))
				        acc)))
