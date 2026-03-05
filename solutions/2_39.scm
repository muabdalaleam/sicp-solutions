(load "./2_38.scm")



(define (reverse-right seq)
  (fold-right (lambda (x y) (append y (list x))) '() seq))

(define (reverse-left seq)
  (fold-left (lambda (x y) (cons y x)) '() seq))

; (reverse-right (1 . (2 . (3 . nil))))
; (λ 1 (λ 2 (λ 3 nil)))

; (append (reverse-right '(2 3)) 1)
