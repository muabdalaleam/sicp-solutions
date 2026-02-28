(define (subsets l)
  (if (null? l) 
    (list '())
	(let ((rest (subsets (cdr l)))) 
	  (append rest 
			  (map (lambda (e) (cons (car l) e)) rest)))))

; the second term of append has the same length as the first !!!

; (subsets (list 1 2 3))

; I hardly understsand it.

; (())
; (() (3))
; (() (3) (2) (2 3))
; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
