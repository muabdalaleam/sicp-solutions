;; returns a function that repeats `f` n times
(define (repeat f n)

  (define (iter x i)
	(if (> i n) x (iter (f x) (+ i 1))))

  (lambda (x) (iter x 1))) 

(display ((repeat (lambda (x) (* x x)) 2) 5))
(newline)
