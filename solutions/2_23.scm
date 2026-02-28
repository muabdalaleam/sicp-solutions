(define (for-each f l)
  (f (car l))

  (if (null? (cdr l))
	  #t
	  (for-each f (cdr l))))
