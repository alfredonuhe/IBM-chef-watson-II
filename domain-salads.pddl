(define (domain Salads)
(:requirements :strips :typing :fluents)
(:types
          fruta
          hortaliza
          carne
          pescado- alimento
          alimento
          alinyo
          especia- ingrediente
          paso
          orden
          ensalada - object)
(:constants cero - orden)
(:predicates 
             (paso_ensalada ?s - ensalada ?p - paso)
             (datos_paso ?p - paso ?i - ingrediente ?o - orden)
             (paso-actual ?p -paso)
             (paso-sig ?p1 - paso ?p2 - paso)
)

(:functions (coste-ensalada))
	
(:action añadir-ingrediente
:parameters (?x - rover ?y - waypoint ?z - waypoint) 
:precondition (and (can_traverse ?x ?y ?z) (available ?x) (at ?x ?y) 
                (visible ?y ?z) (>= (energy ?x) 8)
	    )
:effect (and (decrease (energy ?x) 8) (not (at ?x ?y)) (at ?x ?z)
		)
)
)
