(load "./2_38.scm")

(define (element-of-set? x set)
  (if (null? set) 
	  #f
	  (if (equal? x (car set))
		  #t
	      (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (intersection-set s1 s2)
  (fold-left (lambda (x y) (if (element-of-set? y s2)
							   (append x (list y))
							   x)) 
    '() s1))

(define (union-set s1 s2)
  (append s1 s2))
