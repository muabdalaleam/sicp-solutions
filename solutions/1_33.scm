(define (filtered-accumlate combiner filter null-value term a next b) 
  (define (iter a result)
	(if (> a b)
	    result
	    (if (filter a)
	        (iter (next a) (combiner result (term a)))
			(iter (next a) result))))

  (iter a null-value))

;; doesn't work with 1, 2
(define (prime? n)
  (define (iter i)
	(cond ((> (expt i 2) n)      #t)
		  ((= (remainder n i) 0) #f)
		  (else (iter (+ i 2))) ))

  (if (= (remainder n 2) 0)
	  #f
	  (iter 3)))

;; (define (gcd a b)
;;   (if (= b 0)
;;       a
;;       (gcd b (remainder a b))))

;; Sum of squares of prime numbers between a & b
(define (f a b)
  (define (inc x) (+ x 1))
  (define (square x) (expt x 2))

  (filtered-accumlate + prime? 0 square a inc b))


;; Product of positive integers less than n that are coprimes to it
(define (g n)
  (define (coprime? x) (= (gcd n x) 1))
  (define (term x) x)
  (define (inc x) (+ x 1))

  (filtered-accumlate * coprime? 1 term 1 inc n))

