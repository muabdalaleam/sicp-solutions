;; 1^2 = 1 * 1
;; 5^3 = 5*5*5
;; 5^5 = 5*5*5*5 or (5*5)*25
;;
;; aka: 5^4 = (5^2)*(5^2)

(define (fast-exp x n)

  (define (iter product i)
	(cond ((= i 1) product)
		  ((= i 0) 1)
		  ((even? i) (iter (* product product) (/ i 2)))
		  ((odd? i)  (iter (* x product) (- i 1)))
		  (else      (display "fast-exp expect integer powers only."))))

  (iter x n))
