(define (domain ejercicios)

  (:requirements 
    :strips
    :typing
    :adl
    :fluents
  )

  (:types
    ejercicio dia - object
  )
  
  (:functions
    (dificultad ?ej - ejercicio)
    (numero_ej)
  )

  (:predicates
    (anterior ?d1 - dia ?d2 - dia)
    (precursor ?ej_precursor - ejercicio ?ej_a_asignar - ejercicio)
    (preparador ?ej1 - ejercicio ?ej2 - ejercicio)
    (dia_actual ?dia - dia)
    (hecho_hoy ?ej - ejercicio)
    (ultimo_ejercicio ?ej - ejercicio)
    (null ?ej - ejercicio)
  ) 

  (:action asigna_ejercicio
    :parameters (?ej_precursor ?ej_a_asignar - ejercicio)
    :precondition (and
      (not (null ?ej_a_asignar))
    	(not (hecho_hoy ?ej_a_asignar)) 

      ; Precursor
			(precursor ?ej_precursor ?ej_a_asignar)
      (or (null ?ej_precursor) (ultimo_ejercicio ?ej_precursor))

      ; Preparadores
    	(forall (?ej - ejercicio)
    		(not (and (preparador ?ej ?ej_a_asignar) (not (hecho_hoy ?ej))))
    	)

    	(< (numero_ej) 6)
    )
    :effect (and 
  		(forall (?ej - ejercicio)
  			(when (ultimo_ejercicio ?ej) (not (ultimo_ejercicio ?ej)))
  		)
    	(ultimo_ejercicio ?ej_a_asignar)
    	(hecho_hoy ?ej_a_asignar)
    		
    	(increase (numero_ej) 1)
    	(when (< (dificultad ?ej_a_asignar) 10) (increase (dificultad ?ej_a_asignar) 1))
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
      (assign (numero_ej) 0)
    )
  )
)