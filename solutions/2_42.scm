(load "./2_40.scm") ; flatmap, filter

(define empty-board '())

; What is this shit
(define (safe? positions col)
  (let ((queen (car positions))
		(rest (cdr positions))
	    (temp-or (lambda (x y) (or x y))))
    (if (or (= col 1))
        #t
		(and (not (fold-left (lambda (x y) (or x (= (car queen) (car y)))) #f rest))
			 (not (fold-left (lambda (x y) (or x (= (abs (- (car queen) (car y)))
													(- (cdr queen) (cdr y))))) #f rest))))))

(define (adjoin-pos row col rest)
  (append (list (cons row col)) rest))

(define (queens board-size)
  (define (col-iter col)
	(if (= col 0)
	    (list empty-board)
	    (filter 
		  (lambda (positions) (safe? positions col))
		  (flatmap 
			(lambda (rest) (map 
			  (lambda (row) (adjoin-pos row col rest))
			  (enumerate-interval 1 board-size)))
		    (col-iter (- col 1)))))) ; start thinking from here then reverse.

  (col-iter board-size))

; (queens 3)
; ( nil )
; ( ((1 1)) (2 1) (3 1) )
; ( ((1 1) (1 2)) ((1 1) (2 2)) ((1 1) (3 2)) ... )
