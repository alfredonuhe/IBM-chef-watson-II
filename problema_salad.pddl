(define (problem p1)
(:domain Salads)
(:objects
	cortar vertir anyadir rallar - paso
	jamon melon miel lechuga aceitunas atun queso tomate pollo pan - ingrediente
	s0 s1 s2 s3 s4 s5 - ensalada
)
(:init
    (hecho_ensalada s0)
    (hecho_paso_ensalada s0 jamon cortar cero)
    (hecho_paso_ensalada s0 melon cortar uno)
    (hecho_paso_ensalada s0 miel vertir dos)
    (hecho_ensalada s1)
    (hecho_paso_ensalada s1 lechuga cortar cero)
    (hecho_paso_ensalada s1 aceitunas anyadir uno)
    (hecho_paso_ensalada s1 atun anyadir dos)
    (hecho_paso_ensalada s1 pan anyadir tres)
    
    (peticion_ensalada s3)
    (peticion_pasos_ensalada s3 tres)
    (peticion_ensalada s4)
    (peticion_pasos_ensalada s4 dos)   
    (peticion_ingrediente jamon)
    (peticion_ingrediente lechuga)
    (peticion_ingrediente pan)
    (ensaladas_por_generar dos)
    
    (sig_cont cero uno)
    (sig_cont uno dos)
    (sig_cont dos tres)
    (sig_cont tres cuatro)
    (sig_cont cuatro cinco)
    (sig_cont cinco seis)
    (sig_cont seis siete)
    (sig_cont siete ocho)
    (sig_cont ocho nueve)
    
    (tipo_ingrediente jamon animal)
    (tipo_ingrediente melon vegetal)
    (tipo_ingrediente miel animal)
    (tipo_ingrediente lechuga vegetal)
    (tipo_ingrediente aceitunas vegetal)
    (tipo_ingrediente atun animal)
    (tipo_ingrediente pan vegetal)
    
    (= (totalcost) 0)
    (fase cero)
)
(:goal (game-over))


(:metric minimize (totalcost))
)
