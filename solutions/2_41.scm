(load "2_40.scm") ; flatmap, unique-pairs
(load "2_38.scm") ; fold-left

(define (unique-triples n)
  (flatmap 
	(lambda (p) (map (lambda (k) (append p (list k)))
					 (enumerate-interval 1 (- (cadr p) 1)))) 
	(unique-pairs n)))

(define (sum-triples n s)
  (filter (lambda (t) (= s (fold-left + 0 t)))
		  (unique-triples n)))
