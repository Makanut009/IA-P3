(define (problem ejemplo_ext3)
	
  (:domain ejercicios)

  (:objects
    ej1 ej2 ej3 ej4 ej5 ej6 ej_goal ninguno - ejercicio
    dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 dia9 dia10 dia11 dia12 dia13 dia14 dia15 - dia
    dif0 dif1 dif2 dif3 dif4 dif5 dif6 dif7 dif8 dif9 dif10 - dificultad
  )

  (:init
  	(dia_actual dia1)

  	(anterior dia1 dia2)
  	(anterior dia2 dia3)
	(anterior dia3 dia4)
  	(anterior dia4 dia5)
  	(anterior dia5 dia6)
  	(anterior dia6 dia7)
  	(anterior dia7 dia8)
  	(anterior dia8 dia9)
  	(anterior dia9 dia10)
  	(anterior dia10 dia11)
  	(anterior dia11 dia12)
  	(anterior dia12 dia13)
  	(anterior dia13 dia14)
  	(anterior dia14 dia15)

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
    
    (= (duracion ej1) 50)
    (= (duracion ej2) 50)
    (= (duracion ej3) 20)
    (= (duracion ej4) 10)
    (= (duracion ej5) 20)
    (= (duracion ej6) 30)
    (= (duracion ej_goal) 15)
  	
    (= (tiempo_dia) 0)

	(nulo ninguno)

	(precursor ninguno ej1)	
  	(precursor ninguno ej2)
  	(precursor ninguno ej3)
  	(precursor ninguno ej4)
	(precursor ninguno ej5)
	(precursor ninguno ej6)
	(precursor ninguno ej_goal)

  	; (preparador ej1 ej_goal)
  	; (preparador ej2 ej_goal)
  	; (preparador ej3 ej_goal)
  	; (preparador ej4 ej_goal)
	; (preparador ej5 ej_goal)
	; (preparador ej6 ej_goal)
  ) 
  
  (:goal (and (dia_actual dia15) (dificultad_actual ej_goal dif10))

  )
)