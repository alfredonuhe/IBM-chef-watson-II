(define (domain Salads)
(:requirements :strips :typing :fluents)
(:types
          fruta
          hortaliza
          carne
          pescado - alimento
          alimento
          alinyo
          especia - ingrediente
          paso
	  contador
          orden
          ensalada - object)
(:constants cero - paso
	    cero - contador
	    si no - inicializado
	    si no - contado)
(:predicates
	     (recetas_generadas ?cont - contador)
	     (contador_ingredientes_usados ?conta - contador)
	     (siguiente_contador ?c1 - contador ?c2 - contador)
	     (ensalada_inicializada ?s - ensalada ?i - inicializado)
             (paso_ensalada ?s - ensalada ?p - paso)
             (datos_paso_ensalada ?s -ensalada ?p - paso ?i - ingrediente ?o - orden)
             (paso_actual ?p - paso)
             (paso_sig ?p1 - paso ?p2 - paso)
	     (ingrediente_entrada ?ie - ingrediente ?c - contado)
	     (inicializa)
	     (inicializa2)
	     (inicializa3)
	     (fin_ensalada ?c -contador)
	     (game-over)
)
    (:functions (coste_ingrediente))

(:action inicializar-ensalada
:parameters (?s - ensalada ?r1 ?r2 - contador)
:precondition (and (ensalada_inicializada ?s no)
(recetas_generadas ?r2) (siguiente_contador ?r1 ?r2) (contador_ingredientes_usados cero)(inicializa))

:effect (and (ensalada_inicializada ?s si) (not (ensalada_inicializada ?s no))
(recetas_generadas ?r1) (not (recetas_generadas ?r2))
(not(inicializa))
)
)
(:action anyadir-ingrediente-existente
:parameters (?s ?ens - ensalada ?ie -ingrediente ?p ?pm ?pa ?p2 - paso ?o - orden ?cont ?cont1 - contador)
:precondition (and (ingrediente_entrada ?ie no) (ensalada_inicializada ?s si) (datos_paso_ensalada ?ens ?p ?ie ?o) (paso_actual ?pa)
 (paso_ensalada ?s ?pm) (paso_sig ?pa ?p2)
(contador_ingredientes_usados ?cont) (siguiente_contador ?cont ?cont1)
(inicializa3))

:effect
(and (not (paso_actual ?pa)) (datos_paso_ensalada ?s ?pa ?ie ?o) (not (ingrediente_entrada ?ie no)) (not(contador_ingredientes_usados ?cont)) (contador_ingredientes_usados ?cont1)
(ingrediente_entrada ?ie si) (increase (coste_ingrediente) 1)

(when (and (= ?pm ?p2)) (and (not(inicializa2)) (not(inicializa3))  (paso_actual cero)))
(when (not (= ?pm ?p2)) (and (paso_actual ?p2)))
)
)

(:action anyadir-ingrediente-no-existente
:parameters (?s ?ens - ensalada ?ie -ingrediente ?p ?pm ?pa ?p2 - paso ?o - orden ?cont ?cont1 - contador)
:precondition (and (ensalada_inicializada ?s si) (datos_paso_ensalada ?ens ?p ?ie ?o) (paso_actual ?pa) (paso_ensalada ?s ?pm) (paso_sig ?pa ?p2)	(contador_ingredientes_usados ?cont) (siguiente_contador ?cont ?cont1)    (inicializa3))
:effect (and (not (paso_actual ?pa)) (datos_paso_ensalada ?s ?pa ?ie ?o) (contador_ingredientes_usados ?cont) (contador_ingredientes_usados ?cont1) (increase (coste_ingrediente) 5)
(when (and (= ?pm ?p2)) (and (not(inicializa2)) (not(inicializa3))  (paso_actual cero)))
(when (not (= ?pm ?p2)) (and (paso_actual ?p2)))
)
)


(:action reinicializar
:parameters (?s - ensalada ?ie -ingrediente ?cont ?cont1 -contador)
:precondition (and (not (inicializa2)) (ingrediente_entrada ?ie si) (contador_ingredientes_usados ?cont) (siguiente_contador ?cont1 ?cont)
(ensalada_inicializada ?s si))


:effect
(and (not(ingrediente_entrada ?ie si)) (ingrediente_entrada ?ie no) (not(contador_ingredientes_usados ?cont)) (contador_ingredientes_usados ?cont1)
(when (and (= ?cont1 cero)) (and (inicializa) (inicializa2) (inicializa3) (not(ensalada_inicializada ?s si))))
))

(:action finalizar
:parameters (?c - contador)
:precondition	(and(recetas_generadas ?c) (fin_ensalada ?c) (inicializa))
:effect (game-over)
)


)
