(define (make-mobile left right)
  (cons left right))

(define (make-branch len hold)
  (cons len hold))

(define (left-branch m)  (car m))
(define (right-branch m) (cdr m))

(define (branch-length b) (car b))
(define (branch-hold b)  (cdr b))

(define (is-mobile? b) 
  (if (not (pair? b))
	  #f
	  (and (pair? (left-branch b))
		   (pair? (right-branch b)))))

(define (mobile-weight m)
  (if (not (is-mobile? m))
	  m
	  (+ (mobile-weight (branch-hold (right-branch m)))
		 (mobile-weight (branch-hold (left-branch m))))))

(define (mobile-balanced? m)
  (if (not (is-mobile? m))
	#t
    (let ((left (left-branch m))
  		  (right (right-branch m)))
  
      (and (= (* (branch-length left) (mobile-weight (branch-hold left)))
              (* (branch-length right) (mobile-weight (branch-hold right))))
  	    (mobile-balanced? (branch-hold left))
  	    (mobile-balanced? (branch-hold right))))))


(define m1 (make-mobile 
  (make-branch 10 20) ; length of 10 and weight of 20
  (make-branch 20 10)))

(define m2 (make-mobile 
  (make-branch 10 (make-mobile
    (make-branch 5 10)
    (make-branch 5 10)))
  (make-branch 20 10)))

(define m3 (make-mobile 
  (make-branch 20 (make-mobile
    (make-branch 5 5)
    (make-branch 10 5)))
  (make-branch 20 10)))

; (assert (= (mobile-balanced? m1) #t))
; (assert (= (mobile-balanced? m2) #t))
; (assert (= (mobile-balanced? m3) #f))
; 
; (assert (= (total-weight m1) 30))
; (assert (= (total-weight m2) 30))
; (assert (= (total-weight m3) 20))
