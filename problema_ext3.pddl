(define (problem exercices-example1)
	
  (:domain exercices)

  (:objects
    exP exA exPr exP2 exP3 exP4 exP5 none - exercice
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
  	(currentDay d1)

  	(before d1 d2)
  	(before d2 d3)
  	(before d3 d4)
  	(before d4 d5)
  	(before d5 d6)
  	(before d6 d7)
  	(before d7 d8)
  	(before d8 d9)
  	(before d9 d10)
  	(before d10 d11)
  	(before d11 d12)
  	(before d12 d13)
  	(before d13 d14)
  	(before d14 d15)

  	(= (exLevel exA) 5)
  	(= (exLevel exP) 1)
  	(= (exLevel exP2) 1)
  	(= (exLevel exP3) 1)
  	(= (exLevel exP4) 1)
  	(= (exLevel exP5) 1)
  	(= (exLevel exPr) 1)
  	
  	(= (numExToday) 0)

	(null none)

		(precursor none exP)
        (precursor exPr exA) 
		(precursor none exPr)
		(precursor exP5 exP2)
		(precursor none exP3)
		(precursor none exP4)
        (precursor none exP5) 
  	(preparer exP exA)
  	(preparer exP2 exA)
  	(preparer exP3 exA)
  	;(preparer exP4 exA)
  	(preparer exP5 exA)
  ) 
  
  (:goal (and (currentDay d15) (= (exLevel exA) 7))

  ))