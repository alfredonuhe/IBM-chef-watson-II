;prueba la ejecucuión de la regla ingrediente_existente
(define (problem p1)
(:domain Salads)
(:objects
	cortar vertir anyadir rallar - paso
	s0 s1 s2 s3 s4 s5 - ensalada
	jamon pollo cordero - carne
	atun pulpo gambas - pescado
	melon manzana fresa aceitunas - fruta
	lechuga tomate patata - hortaliza
)
(:init
    (hecho_paso_ensalada s0 jamon cortar cero)
    (hecho_paso_ensalada s0 melon cortar uno)
    (hecho_paso_ensalada s0 manzana vertir dos)
    (hecho_paso_ensalada s1 lechuga cortar cero)
    (hecho_paso_ensalada s1 aceitunas anyadir uno)
    (hecho_paso_ensalada s1 atun anyadir dos)
    (hecho_paso_ensalada s1 pulpo anyadir tres)
    
    (peticion_ensalada s2)
    (peticion_pasos_ensalada s2 tres)
    (peticion_ensalada s3)
    (peticion_pasos_ensalada s3 tres)
    (peticion_ensalada s4)
    (peticion_pasos_ensalada s4 dos)
    (peticion_ingrediente jamon)
    (peticion_ingrediente pulpo)
    (peticion_ingrediente melon)
    (peticion_ingrediente manzana)
    (ensaladas_por_generar tres)
    
    (sig_cont cero uno)
    (sig_cont uno dos)
    (sig_cont dos tres)
    (sig_cont tres cuatro)
    (sig_cont cuatro cinco)
    (sig_cont cinco seis)
    (sig_cont seis siete)
    (sig_cont siete ocho)
    (sig_cont ocho nueve)
    
    (= (totalcost) 0)
    (fase cero)
)
(:goal (game-over))


(:metric minimize (totalcost))
)
