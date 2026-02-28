(define (square-tree tree)
  (if (null? tree) 
    '()
    (if (not (pair? tree))
	  (expt tree 2)
	  (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (x) (cond 
    ((null? x) '())
    ((not (pair? x)) (expt x 2))
    (else (square-tree x)))) tree))
