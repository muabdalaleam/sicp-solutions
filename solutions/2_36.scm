(load "2_33.scm")

; left-wise iterative accumulation in contrast from SICP's right-wise recursive
; accumulation

(define (accumulate-n p init seqs)
  (define (iter val rem)
	(if (null? (car rem))
	    val
		(iter (cons (accumulate p init (map (lambda (s) (car s)) rem)) val)
			  (map (lambda (s) (cdr s)) rem))))

  (reverse (iter '() seqs)))

; (define (accumulate-n p init seqs)
;   (if (null? (car seqs))
; 	  '()
; 	  (cons (accumulate p init   (map (lambda (s) (car s)) seqs))
; 			(accumulate-n p init (map (lambda (s) (cdr s)) seqs)))))

(assert (equal? (accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9))) 
			    (list 12 15 18)))
