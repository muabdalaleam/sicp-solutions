(define (enumerate-interval start end)
  (define (iter seq curr)
	(if (> curr end)
	    seq
		(iter (append seq (list curr)) (+ curr 1))))

  (iter '() start))
