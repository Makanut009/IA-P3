(define (problem juego_pruebas_4)
	
  (:domain ejercicios)

  (:objects
    ej1 ej2 ej_goal ninguno - ejercicio
    dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 dia9 dia10 dia11 dia12 dia13 dia14 dia15 - dia
    dif0 dif1 dif2 dif3 dif4 dif5 dif6 dif7 dif8 dif9 dif10 - dificultad
  )

  (:init
  	(dia_actual dia1)

  	(dia_siguiente dia1 dia2)
  	(dia_siguiente dia2 dia3)
	(dia_siguiente dia3 dia4)
  	(dia_siguiente dia4 dia5)
  	(dia_siguiente dia5 dia6)
  	(dia_siguiente dia6 dia7)
  	(dia_siguiente dia7 dia8)
  	(dia_siguiente dia8 dia9)
  	(dia_siguiente dia9 dia10)
  	(dia_siguiente dia10 dia11)
  	(dia_siguiente dia11 dia12)
  	(dia_siguiente dia12 dia13)
  	(dia_siguiente dia13 dia14)
  	(dia_siguiente dia14 dia15)

  	(dificultad_actual ej1 dif0)
  	(dificultad_actual ej2 dif0)
  	(dificultad_actual ej_goal dif0)

	(dificultad_siguiente dif0 dif1)
    (dificultad_siguiente dif1 dif2)
    (dificultad_siguiente dif2 dif3)
    (dificultad_siguiente dif3 dif4)
    (dificultad_siguiente dif4 dif5)
    (dificultad_siguiente dif5 dif6)
    (dificultad_siguiente dif6 dif7)
    (dificultad_siguiente dif7 dif8)
    (dificultad_siguiente dif8 dif9)
    (dificultad_siguiente dif9 dif10) 
	(dificultad_siguiente dif10 dif10)
    
    (= (duracion ej1) 50)
    (= (duracion ej2) 50)
    (= (duracion ej_goal) 15)
  	
    (= (tiempo_dia) 0)

	(nulo ninguno)

	(precursor ninguno ej1)	
  	(precursor ninguno ej2)
	(precursor ninguno ej_goal)

  	(preparador ej1 ej_goal)
  	(preparador ej2 ej_goal)
  ) 
  
  (:goal (and (dia_actual dia15) (dificultad_actual ej_goal dif2))

  )
)