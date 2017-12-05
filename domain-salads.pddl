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
          ensalada - object)

(:predicates (pertenece_a ?i - ingrediente ?s - ensalada)
             (paso_ensalada ?s - ensalada ?p - paso ?o - orden)
             (paso_ingrediente ?s - ensalada ?p - paso ?i - ingrediente)
             (full ?s - store)
             (in_sun ?w - waypoint)
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
