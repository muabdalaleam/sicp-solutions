(define (last-pair lst)
  (define (iter l)
	(if (null? (cdr l))
	    l
		(iter (cdr l))))

  (iter lst))
