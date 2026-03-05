; left-fold

(define (accumulate p initial seq)
  (define (iter val rem)
	(if (null? rem)
	    val
	    (iter (p val (car rem)) (cdr rem))))
  
  (iter initial seq))

; SICP's recursive accumulate (I hate recursive)
;
; (define (accumulate p initial seq)
;   (if (null? seq)
; 	  initial
; 	  (p (car seq) (accumulate p initial (cdr seq)))))


(define (map p seq)
  (accumulate (lambda (prev next) (append prev (list (p next)))) '() seq))

(define (append seq1 seq2)
  (accumulate (lambda (prev next) (cons next prev)) seq2 (reverse seq1)))

(define (length seq)
  (accumulate (lambda (prev next) (+ prev 1)) 0 seq))

