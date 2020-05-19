(define (problem juego_pruebas_4)

  (:domain ejercicios)
  (:objects 
    ej0 ej1 ej2 none - ejercicio
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15  - dia
  )
  (:init
    (dia_actual d1)

    (null none)

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

    (= (dificultad ej0) 1)
    (= (dificultad ej1) 1)
    (= (dificultad ej2) 1)

    (= (duracion ej0) 50)
    (= (duracion ej1) 50)
    (= (duracion ej2) 20)

    (= (tiempo_dia) 0)

    (precursor none ej0)
    (precursor none ej1)
    (precursor none ej2)

    (preparador ej0 ej2)
    (preparador ej1 ej2)

  )
  (:goal (and (dia_actual d15) (= (dificultad ej2) 2)))
)
