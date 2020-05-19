(define (problem juego_pruebas_1)
	
  (:domain ejercicios)

  (:objects
    ej1 ej2 ej3 ej4 ej5 ej6 ej_goal none - ejercicio
    d1 d2 d3 - dia
  )

  (:init
  	(dia_actual d1)

  	(anterior d1 d2)
  	(anterior d2 d3)

  	(= (dificultad ej1) 1)
  	(= (dificultad ej2) 1)
  	(= (dificultad ej3) 1)
  	(= (dificultad ej4) 1)
  	(= (dificultad ej5) 1)
  	(= (dificultad ej6) 1)
  	(= (dificultad ej_goal) 1)
  	
  	(= (numero_ej) 0)

	(null none)

	(precursor none ej1)	
  	(precursor none ej2)
  	(precursor none ej3)
  	(precursor none ej4)
	(precursor none ej5)
	(precursor none ej6)
	(precursor none ej_goal)

  	(preparador ej1 ej_goal)
  	(preparador ej2 ej_goal)
  	(preparador ej3 ej_goal)
  	(preparador ej4 ej_goal)
	(preparador ej5 ej_goal)
	(preparador ej6 ej_goal)
  ) 
  
  (:goal (and (dia_actual d3) (= (dificultad ej_goal) 2))

  )
)