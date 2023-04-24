with centro_oeste_tb as (
	SELECT 
		"REGIÃO" as region,
		"PRODUTO" as prod,
		MAX("PREÇO MÉDIO REVENDA") as max_average_price
	FROM gas_price
	WHERE "REGIÃO" = 'CENTRO OESTE'
		and "PRODUTO" != 'GLP'
	group by 1, 2
),
sudeste_tb as (
	SELECT 
		"REGIÃO" as region,
		"PRODUTO" as prod,
		MAX("PREÇO MÉDIO REVENDA") as max_average_price
	FROM gas_price
	WHERE "REGIÃO" = 'SUDESTE'
		and "PRODUTO" != 'ETANOL HIDRATADO'
	group by 1, 2

)
select 
 	coalesce(cotb.prod, sutb.prod) as prod,
	cotb.max_average_price as max_price_centro_oeste,
	sutb.max_average_price as max_price_sudeste
from centro_oeste_tb as cotb
full join sudeste_tb as sutb
	on cotb.prod = sutb.prod