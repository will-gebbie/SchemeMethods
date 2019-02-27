
;To run this file, you would type:
; scheme --load methods.scm

;These methods can be tested on list list0-list7

(DEFINE list0 (LIST 'j 'k 'l 'm 'n 'o 'j) )
(DEFINE list1 (LIST 'a 'b 'c 'd 'e 'f 'g) )
(DEFINE list2 (LIST 's 't 'u 'v 'w 'x 'y 'z) )
(DEFINE list3 (LIST 'j 'k 'l 'm 'l 'k 'j) )
(DEFINE list4 (LIST 'n 'o 'p 'q 'q 'p 'o 'n) )
(DEFINE list5 '((a b) c (d e d) c (a b)) )
(DEFINE list6 '((h i) (j k) l (m n)) )
(DEFINE list7 '(f (a b) c (d e d) (b a) f) )

(DEFINE (evens lst)
	(COND
		((NOT (LIST? lst)) (display "USAGE: evens [list]"))
		((NULL? lst) lst)
		((NULL? (CDR lst)) '()) ;Returns empty list if there is only one atom in the list
		(ELSE (CONS (CADR lst) (evens (CDDR lst)))) ;appends second item and then shaves two items off of the list and repeats until the list is empty or 
))

;Append function understood from https://www.cs.bham.ac.uk/research/projects/poplog/paradigms_lectures/lecture5.html
(DEFINE (reverse lst)
   (COND
   		((NULL? lst) '())
       	(ELSE (append (reverse (CDR lst)) (LIST (CAR lst)))) ;adds each of the elements from the beginning of the list passed in the parameter on the tail of the newly cdr'd list 
))

;Helper function for oddsrev, returns odd list same way as evens
(DEFINE (odds lst)
	(COND
		((NOT (LIST? lst)) (display "USAGE: odds [list]"))
		((NULL? lst) lst)
		((NULL? (CDR lst)) lst)
		(ELSE (CONS (CAR lst) (odds (CDDR lst))))
))

(DEFINE (oddrev lst)
	(COND
		((NOT (LIST? lst)) (display "USAGE: oddrev [list]"))
		((NULL? lst) lst)
		(ELSE (reverse (odds lst))) ;reverse the odd list
))

(DEFINE (middle lst)
	(COND
		((NOT (LIST? lst)) (display "USAGE: middle [list]"))
		((NULL? lst) lst)
		((NULL? (CDR lst)) lst)
		(ELSE (middle (CDR (reverse (CDR lst))))) ;Takes off both ends until middle is reached or a null list is returned
))

(DEFINE (endsmatch lst)
	(COND
		((NOT (LIST? lst)) (display "USAGE: endsmatch [list]"))
		((NULL? lst) #T)
		((NULL? (CDR lst)) #T)
		(ELSE (EQUAL? (CAR lst) (CAR (reverse lst)))) ;Returns true if the beginning of the list and the beginning of the reversed list are equal
))

