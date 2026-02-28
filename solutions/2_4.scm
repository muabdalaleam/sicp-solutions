(define (cons a b)
  (lambda (m) (m a b)))

(define (car c)
  (c (lambda (a b) a)))

(define (cdr c)
  (c (lambda (a b) b)))

;; (define c (cons 1 4)) -> (lambda (m) (m 1 4))
;; (define a (car c))    -> (lambda ((lambda (a b) a)) (m 1 4))
