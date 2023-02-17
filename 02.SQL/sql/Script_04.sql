-- ver o número de postos com GLP fiscalizados no DF por mês em 2020 
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
),
clean_tb as (
	select 
		init_date,
		state,
		prod,
		number_gas_station
	from raw_tb
	where state = 'DISTRITO FEDERAL'
)


select 
	extract(month from init_date) as month, 
	prod, 
	sum(number_gas_station) as total
from clean_tb
where extract(year from init_date) = '2020'
	and prod = 'GLP'
group by 1, 2