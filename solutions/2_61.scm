(define (element-of-set? x set)
  (cond ((null? set) #f)
    	((= x (car set)) #t)
		((< x (car set)) #f)
	    (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (define (iter s rest)
	(cond ((null? rest) (append s (list x)))
		  ((< x (car rest)) (append s (cons x rest)))
		  ((> x (car rest)) (iter (append s (list (car rest))) (cdr rest)))))

  (if (element-of-set? x set)
	  set
	  (iter '() set)))

