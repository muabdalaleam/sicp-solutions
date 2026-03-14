(load "./2_38.scm")
(load "../notes/unordered_lists.scm")

(define (union-set s1 s2)
  (fold-left (lambda (x y) (if (element-of-set? y s1)
							   x
							   (append x (list y))))
    s1 s2))
