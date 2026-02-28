(define (find-fixed f x-guess threshold)
  (let ((x-next (f x-guess)))

	(if (< (abs (- x-next x-guess)) threshold)
	    x-next
		(find-fixed f x-next threshold))))
