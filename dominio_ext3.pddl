(define (domain exercices)

  (:requirements 
    :strips
    :typing
    :adl
    :fluents
  )

  (:types
    exercice day - object
  )
  
  (:functions
    (exLevel ?ex - exercice)
    (numExToday)
  )

  (:predicates
    (before ?d1 - day ?d2 - day)
    (precursor ?before - exercice ?after - exercice)
    (preparer ?before - exercice ?after - exercice)
    (currentDay ?day - day)
    (exerciceToday ?exercice - exercice)
    (lastExerciceToday ?exercice - exercice)
    (null ?exercice - exercice)
  ) 

  (:action do-exercice
    :parameters (?e ?pr - exercice )
    :precondition (and
			(precursor ?pr ?e)
			(not (null ?e))
    		(not (exerciceToday ?e)) 
    		(or (null ?pr) (lastExerciceToday ?pr))
    		(forall (?p - exercice)
    			(not (and (preparer ?p ?e) (not (exerciceToday ?p))))
    		)
    		(< (numExToday) 6)
    	)
    :effect (and 
  		(forall (?last - exercice)
  			(when (lastExerciceToday ?last) (not (lastExerciceToday ?last)))
  		)
    		(lastExerciceToday ?e)
    		(exerciceToday ?e)

    		(increase (numExToday) 1)
                (when (< (exLevel ?e) 10) (increase (exLevel ?e) 1))
    	)
    )

  (:action skip-day
  		:parameters (?d1 ?d2 - day)
  		:precondition (and (currentDay ?d1) (before ?d1 ?d2))
  		:effect (and (not (currentDay ?d1)) (currentDay ?d2)
  				(forall (?e - exercice)
  					(when (exerciceToday ?e) (not (exerciceToday ?e)))
  				)
  				(forall (?e - exercice)
  					(when (lastExerciceToday ?e) (not (lastExerciceToday ?e)))
  				)
  				(assign (numExToday) 0)  				
  			)
  	)
)