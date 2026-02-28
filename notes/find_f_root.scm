(define (find-root f x-neg x-pos threshold)
  ;; x-pos is the x value that satisfies f(x) > 0 and
  ;; x-neg is the x value that satisfies f(x) < 0
  (let ((x-mid (/ (+ x-pos x-neg) 2)))

    (if (< (abs (- x-pos x-neg)) threshold)
	    x-mid
        (let ((y-mid (f x-mid)))

          (cond ((positive? y-mid) (find-root f x-neg x-mid threshold))
				((negative? y-mid) (find-root f x-mid x-pos threshold))
				(else x-mid))))))

(define (half-interval-method f x1 x2 threshold)
  (let ((y1 (f x1))
		(y2 (f x2)))

    (cond ((and (positive? y1) (negative? y2))
		   (find-root f x2 x1 threshold))

		  ((and (negative? y1) (positive? y2))
		   (find-root f x1 x2 threshold))

		  (else (display "X values are not of opposite sings")))))

