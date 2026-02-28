(define (same-parity x . l)
  (let ((x-mod-2 (remainder x 2)))

    (define (iter valid rem rem-len)
	  (if (< rem-len 1) 
		  valid
		  (if (= x-mod-2 (remainder (car rem) 2))
			  (iter (cons (car rem) valid) (cdr rem) (- rem-len 1))
	          (iter valid (cdr rem) (- rem-len 1)))))

	(reverse (iter (cons x '()) l (length l)))))
