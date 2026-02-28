(define (find-fixed f x-guess threshold)

  (define (iter x x-next i)
	(display "Iteration: ") (display i) (newline)
	(display "X current: ") (display x) (newline)
	(display "X new: ") (display x-next) (newline)
	(display "---------")
	(newline)

	(if (< (abs (- x x-next)) threshold)
	    x-next
		(iter x-next (f x-next) (+ 1 i))))
  
  (iter x-guess (f x-guess) 1))


;; solving for x^x = 1000
;; (find-fixed (lambda (x) (/ (+ (/ (log 1000) (log x)) x) 2)) 1.1 1e-5)

