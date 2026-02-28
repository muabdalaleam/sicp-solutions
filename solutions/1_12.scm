;; Thanks for: https://sicp-solutions.net/post/sicp-solution-exercise-1-12/

;; Pacal traingle:
;; 1
;; 1 1
;; 1 2 1
;; 1 3 3 1
;; 1 4 6 4 1
;; 1 5 10 10 5 1

(define (pascal row col)
  (if (or (= col row) (= col 1))
	  1
	  (+ (pascal (- row 1) col) (pascal (- row 1) (- col 1)))))


(define (display-pascal-row n)

  (define (iter-column i)
	(display (pascal n i)) (display "  ")

	(if (= i n)
	    0
	    (iter-column (+ i 1))))

  (iter-column 1))


(define (display-pascal n)

  (define (iter-row i)
	(display-pascal-row i) (newline)

	(if (= i n)
	    (newline)
	    (iter-row (+ i 1))))

  (iter-row 1))
