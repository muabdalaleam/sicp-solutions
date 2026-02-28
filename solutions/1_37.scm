(define (continuous-frac n d k)
  (define (iter d2 k-i)

	(if (= k-i 1)

	    (/ (n 1) (+ (d 1) d2))

		(iter (/ (n k-i)
				 (+ (d k-i) d2))

			  (- k-i 1))))
  
  (iter (/ (n k) (d k)) k))

(define (continuous-frac-r n d k) ;; r for recursive

  (define (iter i)
	(if (> i k)
        (/ (n i) (d i))
	    (/ (n i) 
	       (+ (d i) (iter (+ i 1))))))

  (iter 1))

;; calculates 1 / phi somehow
;; (continuous-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)
