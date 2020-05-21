(define (problem juego_pruebas_1)
	
  (:domain ejercicios)

  (:objects
    ej1 ej2 ej3 ej4 ej5 ej6 ej_goal ninguno - ejercicio
    dia1 dia2 dia3 - dia
    dif0 dif1 dif2 dif3 dif4 dif5 dif6 dif7 dif8 dif9 dif10 - dificultad
  )

  (:init
  	(dia_actual dia1)

  	(dia_siguiente dia1 dia2)
  	(dia_siguiente dia2 dia3)

  	(dificultad_actual ej1 dif0)
  	(dificultad_actual ej2 dif0)
  	(dificultad_actual ej3 dif0)
  	(dificultad_actual ej4 dif0)
  	(dificultad_actual ej5 dif0)
  	(dificultad_actual ej6 dif0)
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
  	
  	(= (numero_ej) 0)

	(nulo ninguno)

	(precursor ninguno ej1)	
  	(precursor ninguno ej2)
  	(precursor ninguno ej3)
  	(precursor ninguno ej4)
	(precursor ninguno ej5)
	(precursor ninguno ej6)
	(precursor ninguno ej_goal)

  	(preparador ej1 ej_goal)
  	(preparador ej2 ej_goal)
  	(preparador ej3 ej_goal)
  	(preparador ej4 ej_goal)
	(preparador ej5 ej_goal)
	(preparador ej6 ej_goal)
  ) 
  
  (:goal (and (dia_actual dia3) (dificultad_actual ej_goal dif1))

  )
)