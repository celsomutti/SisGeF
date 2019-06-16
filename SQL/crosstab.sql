SELECT COD_AGENTE,  
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 1 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 1",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 2 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 2",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 3 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 3",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 4 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 4",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 5 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 5",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 6 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 6",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 7 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 7",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 8 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 8",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 9 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 9",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 10 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 10", 
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 11 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 11",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 12 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 12",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 13 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 13",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 14 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 14",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 15 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 15", 
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 16 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 16",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 17 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 17",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 18 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 18",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 19 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 19",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 20 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 20", 
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 21 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 21",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 22 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 22",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 23 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 23",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 24 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 24",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 25 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 25", 
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 26 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 26",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 27 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 27",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 28 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 28",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 29 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 29",
	COUNT(CASE WHEN DAY(DAT_BAIXA) = 30 THEN NUM_NOSSONUMERO ELSE NULL END) 	AS "DIA 30",
	COUNT(NUM_NOSSONUMERO) AS "TOTAL GERAL" 
FROM TBENTREGAS
WHERE DAT_BAIXA BETWEEN '2015.11.01' AND '2015.11.30'
GROUP BY COD_AGENTE;