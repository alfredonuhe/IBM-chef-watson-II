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
          ensalada
          ingrediente 
          tipo - object)
(:constants cero uno dos tres cuatro cinco seis siete ocho nueve - contador)
(:predicates
        (hecho_paso_ensalada ?s - ensalada ?i - ingrediente ?p - paso ?orden - contador)
        
        (peticion_ensalada ?s - ensalada)
        (peticion_pasos_ensalada ?s - ensalada ?num_pasos - contador)
        (peticion_ingrediente ?i - ingrediente)
        
        (sig_cont ?c1 - contador ?c2 - contador)
        (fase ?fase - contador)
        (paso_actual ?paso - contador)
        (ensalada_actual ?s - ensalada)
        (ensalada_procesada ?s - ensalada)
        (ingrediente_asignado ?s - ensalada ?i - ingrediente)
        (ensaladas_por_generar ?c - contador)
        (game-over)
)
(:functions (totalcost))

(:action seleccionar_ensalada
:parameters (?s - ensalada ?c0 ?c1 - contador)
:precondition (and (peticion_ensalada ?s) (not (ensalada_procesada ?s)) (not (ensalada_actual ?s)) (ensaladas_por_generar ?c1) (sig_cont ?c0 ?c1) (fase cero))
:effect (and (ensalada_actual ?s) (paso_actual uno) (not (ensaladas_por_generar ?c1)) (ensaladas_por_generar ?c0) 
        (not (fase cero)) (fase uno))
)

(:action fin_proceso
:parameters (?c0 - contador)
:precondition (and (ensaladas_por_generar ?c0) (fase cero))
:effect (and 
            (when (= ?c0 cero) (and (game-over))))
)

(:action ingrediente_existente
:parameters (?s0 ?s1 - ensalada ?i0 - ingrediente ?p0 - paso ?c0 ?c1 ?c2 ?c3 - contador)
:precondition   (and (ensalada_actual ?s0) (paso_actual ?c0) (sig_cont ?c0 ?c1) (hecho_paso_ensalada ?s1 ?i0 ?p0 ?c2) (peticion_ingrediente ?i0) 
                (not (ingrediente_asignado ?s0 ?i0)) (peticion_pasos_ensalada ?s0 ?c3) (fase uno))
:effect (and (ingrediente_asignado ?s0 ?i0) (hecho_paso_ensalada ?s0 ?i0 ?p0 ?c0) (increase (totalcost) 1)
        (when (and (= ?c0 ?c3)) (and (not (ensalada_actual ?s0)) (ensalada_procesada ?s0) (not (paso_actual ?c0)) (not (fase uno)) (fase cero)))
        (when (not (= ?c0 ?c3)) (and (not (paso_actual ?c0)) (paso_actual ?c1))))
)

(:action ingrediente_intercambiado-carne
:parameters (?s0 ?s1 - ensalada ?i0 ?i1 - carne ?p0 - paso ?c0 ?c1 ?c2 ?c3 - contador)
:precondition   (and (ensalada_actual ?s0) (paso_actual ?c0) (sig_cont ?c0 ?c1) (hecho_paso_ensalada ?s1 ?i0 ?p0 ?c2) (peticion_ingrediente ?i1) 
                (not (ingrediente_asignado ?s0 ?i1)) (peticion_pasos_ensalada ?s0 ?c3) (fase uno))
:effect (and (ingrediente_asignado ?s0 ?i1) (hecho_paso_ensalada ?s0 ?i1 ?p0 ?c0) (increase (totalcost) 5)
        (when (and (= ?c0 ?c3)) (and (not (ensalada_actual ?s0)) (ensalada_procesada ?s0) (not (paso_actual ?c0)) (not (fase uno)) (fase cero)))
        (when (not (= ?c0 ?c3)) (and (not (paso_actual ?c0)) (paso_actual ?c1))))
)

(:action ingrediente_intercambiado-pescado
:parameters (?s0 ?s1 - ensalada ?i0 ?i1 - pescado ?p0 - paso ?c0 ?c1 ?c2 ?c3 - contador)
:precondition   (and (ensalada_actual ?s0) (paso_actual ?c0) (sig_cont ?c0 ?c1) (hecho_paso_ensalada ?s1 ?i0 ?p0 ?c2) (peticion_ingrediente ?i1) 
                (not (ingrediente_asignado ?s0 ?i1)) (peticion_pasos_ensalada ?s0 ?c3) (fase uno))
:effect (and (ingrediente_asignado ?s0 ?i1) (hecho_paso_ensalada ?s0 ?i1 ?p0 ?c0) (increase (totalcost) 5)
        (when (and (= ?c0 ?c3)) (and (not (ensalada_actual ?s0)) (ensalada_procesada ?s0) (not (paso_actual ?c0)) (not (fase uno)) (fase cero)))
        (when (not (= ?c0 ?c3)) (and (not (paso_actual ?c0)) (paso_actual ?c1))))
)

(:action ingrediente_intercambiado-fruta
:parameters (?s0 ?s1 - ensalada ?i0 ?i1 - fruta ?p0 - paso ?c0 ?c1 ?c2 ?c3 - contador)
:precondition   (and (ensalada_actual ?s0) (paso_actual ?c0) (sig_cont ?c0 ?c1) (hecho_paso_ensalada ?s1 ?i0 ?p0 ?c2) (peticion_ingrediente ?i1) 
                (not (ingrediente_asignado ?s0 ?i1)) (peticion_pasos_ensalada ?s0 ?c3) (fase uno))
:effect (and (ingrediente_asignado ?s0 ?i1) (hecho_paso_ensalada ?s0 ?i1 ?p0 ?c0) (increase (totalcost) 5)
        (when (and (= ?c0 ?c3)) (and (not (ensalada_actual ?s0)) (ensalada_procesada ?s0) (not (paso_actual ?c0)) (not (fase uno)) (fase cero)))
        (when (not (= ?c0 ?c3)) (and (not (paso_actual ?c0)) (paso_actual ?c1))))
)

(:action ingrediente_intercambiado-hortaliza
:parameters (?s0 ?s1 - ensalada ?i0 ?i1 - hortaliza ?p0 - paso ?c0 ?c1 ?c2 ?c3 - contador)
:precondition   (and (ensalada_actual ?s0) (paso_actual ?c0) (sig_cont ?c0 ?c1) (hecho_paso_ensalada ?s1 ?i0 ?p0 ?c2) (peticion_ingrediente ?i1) 
                (not (ingrediente_asignado ?s0 ?i1)) (peticion_pasos_ensalada ?s0 ?c3) (fase uno))
:effect (and (ingrediente_asignado ?s0 ?i1) (hecho_paso_ensalada ?s0 ?i1 ?p0 ?c0) (increase (totalcost) 5)
        (when (and (= ?c0 ?c3)) (and (not (ensalada_actual ?s0)) (ensalada_procesada ?s0) (not (paso_actual ?c0)) (not (fase uno)) (fase cero)))
        (when (not (= ?c0 ?c3)) (and (not (paso_actual ?c0)) (paso_actual ?c1))))
)

(:action ingrediente_aleatorio
:parameters (?s0 ?s1 - ensalada ?i0 - ingrediente ?p0 - paso ?c0 ?c1 ?c2 ?c3 - contador)
:precondition   (and (ensalada_actual ?s0) (paso_actual ?c0) (sig_cont ?c0 ?c1) (hecho_paso_ensalada ?s1 ?i0 ?p0 ?c2) (not (ingrediente_asignado ?s0 ?i0))
                (peticion_pasos_ensalada ?s0 ?c3) (fase uno))
:effect (and (ingrediente_asignado ?s0 ?i0) (hecho_paso_ensalada ?s0 ?i0 ?p0 ?c0) (increase (totalcost) 10)
        (when (and (= ?c0 ?c3)) (and (not (ensalada_actual ?s0)) (ensalada_procesada ?s0) (not (paso_actual ?c0)) (not (fase uno)) (fase cero)))
        (when (not (= ?c0 ?c3)) (and (not (paso_actual ?c0)) (paso_actual ?c1))))
)
)
