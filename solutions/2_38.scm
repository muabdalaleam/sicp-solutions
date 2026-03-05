(define (fold-left p initial seq)
  (define (iter val rem)
	(if (null? rem)
	    val
	    (iter (p val (car rem)) (cdr rem))))
  
  (iter initial seq))

(define (fold-right p initial seq)
  (if (null? seq)
	  initial
	  (p (car seq) (fold-right p initial (cdr seq)))))

; (fold-left / 1 '(1 2 3))
; (iter 1 '(2 3))
; (iter 0.5 '(3))
; (iter (/ 0.5 3) '())
; 1/6

; (fold-right / 1 '(1 2 3))
; (/ 1 (/ 2 (/ 3 1)))
; (/ 1 (/ 2 3))
; (1 / 2/3)
; 3/2

