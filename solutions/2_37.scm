(load "./2_33.scm")
(load "./2_36.scm")

(define (dot-product v w)
  (accumulate + 0 (accumulate-n * 1 (list v w))))

(define (matrix-*-vector m v)
  (map (lambda (row) (accumulate + 0 (accumulate-n * 1 (list v row)))) m))

; Needs shape checker
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) 
	  (map (lambda (col) (dot-product row col)) cols)) m)))

(define (transpose m)
  (map reverse (accumulate-n (lambda (x y) (cons y x)) '() m)))

(define mat1 '((1 2)
			   (4 5)
			   (7 8)))

(define mat2 '((8 11 9)
			   (2 15 4)))

(define m '((1 2 3 4) (5 6 7 8) (9 10 11 12)))
(define n '((1 1 1)  (2 2 2) (3 3 3) (4 4 4)))

(define vec1 '(1 2 3))
