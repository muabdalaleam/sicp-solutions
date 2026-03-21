(load "../notes/binary_trees.scm")

(define (tree->list1 tree)
  (if (null? tree)
	  '()
	  (append (tree->list1 (left-branch tree))
			  (cons (entry tree)
					(tree->list1 (right-branch tree))))))

(define (tree->list2 tree)
  (define (copy-to-list tree result-list)
	(display tree) (newline)
	(display result-list) (newline)
	(newline)

	(if (null? tree)
	    result-list
		(copy-to-list 
		  (left-branch tree)
		  (cons (entry tree) 
				(copy-to-list (right-branch tree) result-list)))))

  (copy-to-list tree '()))

; Trees from figure 2.16 left to right
(define tree1
  (adjoin-tree 1
    (adjoin-tree 5
      (adjoin-tree 11
        (adjoin-tree 3
          (adjoin-tree 9
            (make-tree 7 '() '())))))))

(define tree2 
  (adjoin-tree 11
    (adjoin-tree 5
      (adjoin-tree 9
        (adjoin-tree 1
          (adjoin-tree 7
            (make-tree 3 '() '())))))))

(define tree3
  (adjoin-tree 1
    (adjoin-tree 7
      (adjoin-tree 11
        (adjoin-tree 3
          (adjoin-tree 9
            (make-tree 5 '() '())))))))
