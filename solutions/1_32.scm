(define (accumlate combiner null-value term a next b)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (combiner result (term a)))))
  
  (iter a null-value))


(define (accumlate-recursive combiner null-value term a next b)
  (if (> a b)
	null-value
	(combiner (term a)
		(accumlate-recursive combiner null-value term (next a) next b))))

(define (sum-squares from to)
  (define (term x) (expt x 2))
  (define (inc i)  (+ i 1))

  (accumlate + 0 term from inc to))
