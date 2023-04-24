with raw_tb as (
	SELECT 
		TO_DATE("DATA FINAL",'YYYY-MM-DD') as date,
		"REGIÃO" as region,
		"ESTADO" as state,
		"PRODUTO" as prod,
		"NÚMERO DE POSTOS PESQUISADOS" as number_gas_station
	FROM gas_price
	-- WHERE "REGIÃO" = 'CENTRO OESTE'
)

select 
	date, 
	avg(number_gas_station) as media, 
	mode() WITHIN GROUP (ORDER BY number_gas_station) AS moda,
	percentile_cont(0.5) WITHIN GROUP (ORDER BY number_gas_station),
	min(number_gas_station) as minimum,
	max(number_gas_station) as maximum,
	sum(number_gas_station) as soma_total,
	stddev(number_gas_station) as desvio_padrao 
from raw_tb
group by date
order by date desc