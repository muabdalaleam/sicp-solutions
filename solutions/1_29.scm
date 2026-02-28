(define (sum term a next b)
  (if (> a b) 0
      (+ (term a)
		 (sum term (next a) next b))))

(define (cube x)
  (* x x x))

(define (integeral f a b n)
  (define h (/ (- b a) n))

  (define (get-y-mult i)
	(cond ((or (= i 1) (= i n)) 1)
		  ((odd? i) 4)
		  (else 2)))

  (define (next i)
	(+ i 1))

  (define (term i)
	(* (get-y-mult i) (f (+ a (* i h)))))

  (* (/ h 3) (sum term 0 next n)))


(display "Integral of cube(x) between 0 and 1: ")
(display (integeral cube 0 1 100))

(newline)
