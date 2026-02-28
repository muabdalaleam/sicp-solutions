(load "./1_37.scm")

;; https://sicp-solutions.net/post/sicp-solution-exercise-1-39

(define (tan-cf theta acc)
  (let ((theta^2 (expt theta 2)))

	 (continuous-frac 
       (lambda (i) (if (= i 1) theta (* theta^2 -1)))
       (lambda (i) (- (* i 2) 1)) ;; starts from 3
	   acc)))

;; (tan-cf 1.0)
