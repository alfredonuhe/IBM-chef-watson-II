;prueba la ejecucuión de la regla ingrediente_existente e ingrediente intercambiado
(define (problem p7)
(:domain Salads)
(:objects
	cortar vertir anyadir rallar - paso
	s0 s1 s2 s3 s4 s5 - ensalada
	jamon pollo cordero chorizo - carne
	atun pulpo gambas bacalao - pescado
	melon manzana fresa aceitunas uva - fruta
	lechuga tomate patata trufa calabacin pepino - hortaliza
)
(:init
    (hecho_paso_ensalada s0 jamon cortar cero)
    (hecho_paso_ensalada s0 melon cortar uno)
    (hecho_paso_ensalada s0 manzana vertir dos)
    (hecho_paso_ensalada s0 patata cortar tres)
    (hecho_paso_ensalada s1 gambas cortar cero)
    (hecho_paso_ensalada s1 aceitunas anyadir uno)
    (hecho_paso_ensalada s1 atun anyadir dos)
    (hecho_paso_ensalada s1 pulpo anyadir tres)
    
    (peticion_ensalada s2)
    (peticion_pasos_ensalada s2 cuatro)
    (peticion_ensalada s3)
    (peticion_pasos_ensalada s3 cuatro)
    (peticion_ingrediente jamon)
    (peticion_ingrediente melon)
    (peticion_ingrediente pepino)
    (peticion_ingrediente uva)
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
    
    (= (totalcost) 0)
    (fase cero)
)
(:goal (game-over))


(:metric minimize (totalcost))
)
