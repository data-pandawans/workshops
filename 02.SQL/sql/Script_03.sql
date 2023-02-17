with raw_tb as (
	SELECT 
		TO_DATE("DATA INICIAL",'YYYY-MM-DD') as init_date,
		TO_DATE("DATA FINAL",'YYYY-MM-DD') as final_date,
		"REGIÃO" as region,
		"ESTADO" as state,
		"PRODUTO" as prod,
		"NÚMERO DE POSTOS PESQUISADOS" as number_gas_station,
		"PREÇO MÉDIO REVENDA" as average_price
	FROM gas_price
)

select 
	region, 
	state, 
	sum(number_gas_station) as sum_gas_station,
	max(init_date) as last_init_date,
	min(init_date) as last_init_date
from raw_tb
where region = 'CENTRO OESTE'
group by region, state -- clausula de agrupamento
order by 3 desc