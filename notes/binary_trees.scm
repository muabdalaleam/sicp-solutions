(load "../solutions/2_23.scm") ; for-each
(load "../solutions/2_38.scm") ; fold-left
(load "../solutions/2_40.scm") ; filter

(define (make-tree entry left right)
  (list entry left right))

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (element-of-tree? x tree)
  (cond ((null? tree) #f)
	    ((= x (entry tree)) #t)
		((> x (entry tree)) (element-of-tree? x (right-branch tree)))
		((< x (entry tree)) (element-of-tree? x (left-branch tree)))))

(define (adjoin-tree x tree)
	(cond ((null? tree) (make-tree x '() '()))
	      ((= x (entry tree)) tree)
		  ((> x (entry tree)) (make-tree 
								(entry tree)
								(left-branch tree)
								(adjoin-tree x (right-branch tree))))
		  ((< x (entry tree)) (make-tree 
							    (entry tree)
								(adjoin-tree x (left-branch tree))
								(right-branch tree)))))


; I regret my life decisions
(define (display-tree tree)
  (define (iter trees)
    (if (null? trees)
	    '()
        (begin 
	      (for-each (lambda (t) (if (null? t) 
	      						    (display " ")
	      						    (printf " ~A " (entry t)))) trees)
		  (newline)

	      (iter 
	        (fold-left  (lambda (p n) (append p n)) '()
	          (map      (lambda (t) (list (left-branch t) (right-branch t)))
	            (filter (lambda (t) (not (null? t))) trees)))))))

  (iter (list tree)))

