; With help from: timwoerner.de/posts/sicp/exercises/2/27
; I don't understand anything

(define (deep-reverse lst)
  (if (null? lst)
	  '()
	  (if (pair? (car lst))
          (append (deep-reverse (cdr lst)) (cons (deep-reverse (car lst)) '()))
          (append (deep-reverse (cdr lst)) (cons (car lst) '()))))) ;; append cancels the duplicate end nils

; My invalid solution:
;
; (define (deep-reverse lst)
;   (cond ((not (pair? lst)) lst)
;         ((null? (cdr lst)) (deep-reverse (car lst)))
; 		(else (list (deep-reverse (cdr lst))
; 					(deep-reverse (car lst))))))
