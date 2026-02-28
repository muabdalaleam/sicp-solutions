(define (make-rational n d)
  (let ((g (gcd n d)))

    (cons (* (if (positive? (* n d)) 1 -1) (/ n g))
		  (abs (/ d g)))))

(define (print-rational r)
  (display (car r))
  (display "/")
  (display (cdr r))
  (newline))

(define rat (make-rational 3 27))

(print-rational rat)
