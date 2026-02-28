(define (smallest-divisor n)
  (define (next-divisor n)
    (if (= n 2)
	  3
	  (+ n 2)))

  (define (iter i)
	(cond ((> (expt i 2) n) n)
		  ((= (remainder n i) 0) i)
		  (else (iter (next-divisor i)))))
  (iter 2))

;; (define (expmod base exp m)
;;   (remainder (expt base exp) m))

(define (expmod base exp m)
  (cond
	((= exp 0)   (remainder 1 m))
	((even? exp) (remainder (expt (expmod base (/ exp 2) m) 2) m))
	((odd? exp)  (remainder (* (expmod base (- exp 1) m) base) m))))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (fermet-prime? n times)
  (define (iter i x)
    (cond ((> i times) #t)
		  ((= (expmod x n n) x) (iter (+ i 1) (+ 1 (random (- n 1)))))
		  (else #f)))

  (iter 1 (+ 1 (random (- n 1)))))

(define (search-for-primes from to)
  (define start '())
  (define end   '())

  (define (iter i)
	(set! start (current-time))
	(if (fermet-prime? i 2) (begin
		(set! end (current-time))

		(newline)
		(display i)
	    (display " *** ")
	    (display (time-difference end start))))

	(if (not (> (+ i 2) to))
		(iter (+ i 2))))

  (if (even? from)
	  (search-for-primes (+ 1 from) to)
	  (iter from)))
