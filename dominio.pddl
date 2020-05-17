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
    (duracion ?ej - ejercicio)
    (dificultad ?ej - ejercicio)
    (tiempo_dia)
  )

  (:predicates
    (anterior ?d1 - dia ?d2 - dia)
    (precursor ?ej1 - ejercicio ?ej2 - ejercicio)
    (preparador ?ej1 - ejercicio ?ej2 - ejercicio)
    (dia_actual ?dia - dia)
    (hecho_hoy ?ej - ejercicio)
    (ultimo_ejercicio ?ej - ejercicio)
    (null ?ej - ejercicio)
  ) 

  (:action asigna_ejercicio
    :parameters (?ej1 ?ej2 - ejercicio)
    :precondition (and
			(precursor ?ej1 ?ej2)
			(not (null ?ej2))
    		(not (hecho_hoy ?ej2)) 
    		(or (null ?ej1) (ultimo_ejercicio ?ej1))
    		(forall (?ej - ejercicio)
    			(not (and (preparador ?ej ?ej2) (not (hecho_hoy ?ej))))
    		)
    		(<= (+ (tiempo_dia) (duracion ?ej2)) 90)
    	)
    :effect (and 
  		(forall (?ultimo - ejercicio)
  			(when (ultimo_ejercicio ?ultimo) (not (ultimo_ejercicio ?ultimo)))
  		)
    		(ultimo_ejercicio ?ej2)
    		(hecho_hoy ?ej2)
    		
    		(increase (tiempo_dia) (duracion ?ej2))
    		
                (when (< (dificultad ?ej2) 10) (increase (dificultad ?ej2) 1))
    	)
    )

  (:action cambia_dia
    :parameters (?d1 ?d2 - day)
    :precondition (and (dia_actual ?d1) (anterior ?d1 ?d2))
    :effect (and (not (dia_actual ?d1)) (dia_actual ?d2)
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