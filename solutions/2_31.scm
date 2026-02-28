(define (tree-map proc tree)
  (map (lambda (x) (cond 
    ((null? x) '())
    ((not (pair? x)) (proc x))
    (else (tree-map proc x)))) tree))

(define l '((2 3 4) 2 3 4 (5 6 7)))
(define l-squared '((4 9 16) 4 9 16 (25 36 49)))

(assert (equal? (tree-map (lambda (x) (expt x 2)) l) l-squared))

(assert (equal? (tree-map (lambda (x) (expt x 2)) '(())) '(())))
