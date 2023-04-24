select *
from (
	SELECT 
		TO_DATE("DATA FINAL",'YYYY-MM-DD') as date,
		"REGIÃO" as region,
		"ESTADO" as state,
		"PRODUTO" as prod,
		"NÚMERO DE POSTOS PESQUISADOS" as number_gas_station
	FROM gas_price
) as t
where region = 'NORDESTE'