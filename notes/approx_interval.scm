
(define (make-interval n tolerance)
  (cons n tolerance))

(define (make-interval-percent n percent)
  (cons n (* n (/ percent 100))))

(define (upper i) (+ (car i) (cdr i)))
(define (lower i) (- (car i) (cdr i)))
(define (mid i) (car i))
(define (tolerance i) (cdr i))
(define (rel-tolerance i) (/ (cdr i) (car i)))

(define (add-intervals a b)
  (make-interval (+ (mid a) (mid b)) 
				 (+ (tolerance a) (tolerance b))))

(define (sub-intervals a b)
  (make-interval (- (mid a) (mid b)) 
				 (+ (tolerance a) (tolerance b))))

(define (mul-intervals a b)
  (let ((new-mid (* (mid a) (mid b))))

    (make-interval new-mid
  				 (* (+ (rel-tolerance a)
					   (rel-tolerance b)) new-mid))))

(define (div-intervals a b)
  (if (= (mid b) 0)
	(display "Cannot divide by an interval that spans around 0")
    (make-interval (/ (mid a) (mid b))
  				   (+ (rel-tolerance a) (rel-tolerance b)))))
