(define (problem problema)
	
  (:domain ejercicios)

  (:objects
    exP exA exPr exP2 exP3 exP4 exP5 none - ejercicio
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - dia
  )

  (:init
  	(dia_actual d1)

  	(anterior d1 d2)
  	(anterior d2 d3)
  	(anterior d3 d4)
  	(anterior d4 d5)
  	(anterior d5 d6)
  	(anterior d6 d7)
  	(anterior d7 d8)
  	(anterior d8 d9)
  	(anterior d9 d10)
  	(anterior d10 d11)
  	(anterior d11 d12)
  	(anterior d12 d13)
  	(anterior d13 d14)
  	(anterior d14 d15)

  	(= (dificultad exA) 5)
  	(= (dificultad exP) 1)
  	(= (dificultad exP2) 1)
  	(= (dificultad exP3) 1)
  	(= (dificultad exP4) 1)
  	(= (dificultad exP5) 1)
  	(= (dificultad exPr) 1)
  	
  	(= (duracion exA) 10)
  	(= (duracion exP) 20)
  	(= (duracion exP2) 10)
  	(= (duracion exP3) 10)
  	(= (duracion exP4) 15)
  	(= (duracion exP5) 10)
  	(= (duracion exPr) 15)
  	
  	(= (tiempo_dia) 0)

	(null none)

    (precursor none exP)
    (precursor exPr exA) 
	(precursor none exPr)
	(precursor exP5 exP2)
	(precursor none exP3)
	(precursor none exP4)
    (precursor none exP5) 
  	(preparador exP exA)
  	(preparador exP2 exA)
  	(preparador exP3 exA)
  	(preparador exP4 exA)
  	(preparador exP5 exA)
  ) 
  
  (:goal (and (dia_actual d15) (= (dificultad exA) 10))

  ))