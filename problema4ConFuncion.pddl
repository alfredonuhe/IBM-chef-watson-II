(define (problem p1)
(:domain Salads)
(:objects cero uno dos tres - contador
	 cero uno dos tres cuatro cinco seis - paso
	tomate lechuga aceite zanahoria jamon salsa-cesar - ingrediente
	cortado cocido vertido rallado hechado - orden
	ensalada1 ensalada2 S1 S2 S3 - ensalada
	si no - inicializado
	si no - contado

)
(:init
	(datos_paso_ensalada ensalada1 cero tomate cortado)
	(datos_paso_ensalada ensalada1 uno lechuga cocido)
	(datos_paso_ensalada ensalada1 dos aceite vertido)
	(paso_ensalada ensalada1 tres)
	(datos_paso_ensalada ensalada2 cero zanahoria cocido)
	(datos_paso_ensalada ensalada2 uno lechuga cortado)
	(datos_paso_ensalada ensalada2 dos jamon rallado)
	(datos_paso_ensalada ensalada2 tres salsa-cesar hechado)
	(paso_ensalada ensalada2 cuatro)
	(paso_sig cero uno) (paso_sig uno dos) (paso_sig dos tres)
	(paso_sig tres cuatro) (paso_sig cuatro cinco)
	(paso_sig cinco seis)
	(siguiente_contador cero uno) (siguiente_contador uno dos)
	(siguiente_contador dos tres)
	(ingrediente_entrada tomate no)
	(ingrediente_entrada lechuga no)
	(ingrediente_entrada jamon no)
	(ensalada_inicializada S1 no)
	(ensalada_inicializada S2 no)
	(ensalada_inicializada S3 no)
	(paso_actual cero)
	(paso_ensalada S1 dos)
	(paso_ensalada S2 dos)
	(paso_ensalada S3 dos)
	(recetas_generadas tres)
	(fin_ensalada cero)
	(inicializa)
	(inicializa2)
	(inicializa3)
	(contador_ingredientes_usados cero)
	(= (coste_ingrediente) 0)
)
(:goal (game-over))


(:metric minimize (coste_ingrediente))
)
