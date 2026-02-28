(define (compose f g)
  (lambda (x) (f (g x))))

(define square (lambda (x) (expt x 2)))
(define inc    (lambda (x) (+ x 1)))

(display ((compose square inc) 6))
(newline)
