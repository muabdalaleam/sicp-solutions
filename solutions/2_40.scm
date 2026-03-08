(load "./2_38.scm") ; fole-left
(load "../notes/primes.scm") ; prime?

(define (enumerate-interval start end)
  (define (iter seq curr)
	(if (> curr end)
	    seq
		(iter (append seq (list curr)) (+ curr 1))))

  (iter '() start))

(define (flatmap p seq) 
  (fold-left append '() (map p seq)))

(define (filter p? seq)
  (reverse 
	(fold-left (lambda (x y) (if (p? y) (cons y x) x))
	           '()
	           seq)))

; O(n^2)
(define (unique-pairs n)
  (flatmap 
	(lambda (i) (map (lambda (j) (list i j))
					 (enumerate-interval 1 (- i 1))))
	(enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map (lambda (p) (list (car p)
						 (cadr p)
						 (+ (car p) (cadr p))))
       (filter (lambda (p) (prime? (+ (car p) (cadr p))))
			   (unique-pairs n))))
