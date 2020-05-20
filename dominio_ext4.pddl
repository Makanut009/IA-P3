(define (domain ejercicios)

  (:requirements 
    :strips
    :typing
    :adl
    :fluents
  )

  (:types
    ejercicio dia dificultad - object
  )
  
  (:functions
    (duracion ?ej - ejercicio)
    (tiempo_dia)
  )

  (:predicates
    (anterior ?d1 - dia ?d2 - dia)
    (precursor ?ej_precursor - ejercicio ?ej_a_asignar - ejercicio)
    (preparador ?ej_preparador - ejercicio ?ej_a_asignar - ejercicio)
    (dia_actual ?dia - dia)
    (hecho_hoy ?ej - ejercicio)
    (ultimo_ejercicio ?ej - ejercicio)
    (nulo ?ej - ejercicio)
    (dificultad_siguiente ?dif1 - dificultad ?dif2 - dificultad)
    (dificultad_actual ?ej - ejercicio ?dif - dificultad)
  )

  (:action asigna_ejercicio
    :parameters (?ej_a_asignar - ejercicio ?difsiguiente - dificultad ?dia - dia)
    :precondition (and
  
      (dia_actual ?dia)

      (exists (?dif - dificultad)
        (and
          (dificultad_actual ?ej_a_asignar ?dif)
          (dificultad_siguiente ?dif ?difsiguiente)
        )
      )      

      (exists (?ej_precursor - ejercicio)
        (and
          (precursor ?ej_precursor ?ej_a_asignar)
          (or (nulo ?ej_precursor) (ultimo_ejercicio ?ej_precursor))
        )
      )

      (not (nulo ?ej_a_asignar))
    	(not (hecho_hoy ?ej_a_asignar))

      ; Preparadores
    	(forall (?ej - ejercicio)
    		(or (nulo ?ej) (not (and (preparador ?ej ?ej_a_asignar) (not (hecho_hoy ?ej)))))
    	)

    	(<= (+ (duracion ?ej_a_asignar) (tiempo_dia)) 90)
    )
    :effect (and 
  		(forall (?ej - ejercicio)
  			(when (ultimo_ejercicio ?ej) (not (ultimo_ejercicio ?ej)))
  		)
    	(ultimo_ejercicio ?ej_a_asignar)
    	(hecho_hoy ?ej_a_asignar)
    		
    	(increase (tiempo_dia) (duracion ?ej_a_asignar))

      (forall (?difi - dificultad)
        (when (dificultad_actual ?ej_a_asignar ?difi) (not (dificultad_actual ?ej_a_asignar ?difi)))
  		)
      (dificultad_actual ?ej_a_asignar ?difsiguiente)
    )
  )

  (:action cambia_dia
    :parameters (?d1 ?d2 - dia)
    :precondition (and (dia_actual ?d1) (anterior ?d1 ?d2))
    :effect (and
      (not (dia_actual ?d1))
      (dia_actual ?d2)
      
      (forall (?ej - ejercicio)
        (when (hecho_hoy ?ej) (not (hecho_hoy ?ej)))
      )
      (forall (?ej - ejercicio)
        (when (ultimo_ejercicio ?ej) (not (ultimo_ejercicio ?ej)))
      )
      (assign (tiempo_dia) 0)
    )
  )
)