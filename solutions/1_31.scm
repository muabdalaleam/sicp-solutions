(define (product term a next b)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (* result (term a)))))

  (iter a 1))

(define (recursive-product term a next b)
  (if (> a b)
	  1
	  (* (term a) (recursive-product term (next a) next b))))

(define (factorial x)
  (define (inc x)  (+ x 1))
  (define (term x) x)

  (product term 1 inc x))


(define (approximate-pi-wallis acc)
  (define (numerator-term x)   
	(cond ((= x 1)   2)
		  ((even? x) (+ x 2))
		  (else      (+ x 1))))

  (define (denominator-term x)
	(cond ((odd? x) (+ x 2))
		  (else     (+ x 1))))

  (define (inc x) (+ x 1))
  
  (* 4 (/ (product numerator-term   1.0 inc acc)
		  (product denominator-term 1.0 inc acc))))

;; 4 * 4 * 6 * 6
;; --------------
;; 3 * 3 * 5 * 5
