(define (f-iterative n)
  (define (f-loop i n-1 n-2 n-3)
    (if (= (+ i 2) n) ;; one based iteration
	  (+ (* n-1 1)
  	  	 (* n-2 2)
  	  	 (* n-3 3)) 
  
  	  (f-loop (+ 1 i)
  	    (+ (* n-1 1)
  	       (* n-2 2)
  	       (* n-3 3))
  	    n-1
  	    n-2)))
  
  (if (< n 3)
    n
    (f-loop 1 2 1 0)))

(define (f-recursive n)
  (if (< n 3) 
    n
    (+    (f-recursive (- n 1))
	   (* (f-recursive (- n 2)) 2)
	   (* (f-recursive (- n 3)) 3))))
