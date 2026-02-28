(define (reverse tree)

  (define (iter first last)
      (if (null? (cdr first))
		  (cons (car first) last)
		  (iter (cdr first) (cons (car first) last))))
  
  (iter (cdr tree)
		(cons (car tree) '())))


; (1 (4 (9 (16 (25 nil)))))

; (iter (4 (9 (16 (25 nil)))) (1 nil))
; (iter (9 (16 (25 nil))) (4 (1 nil)))
; (iter (16 (25 nil)) (9 (4 (1 nil))))
; (iter (25 nil) (16 (9 (4 (1 nil)))))

; (25 (16 (9 (4 (1 nil)))))
