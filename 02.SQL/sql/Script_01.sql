SELECT 
	TO_DATE("DATA INICIAL",'YYYY-MM-DD') as init_date,
	TO_DATE("DATA FINAL",'YYYY-MM-DD') as final_date,
	"REGIÃO" as region,
	"ESTADO" as state,
	"PRODUTO" as prod,
	"NÚMERO DE POSTOS PESQUISADOS" as number_gas_staion,
	"PREÇO MÉDIO REVENDA" as average_price
FROM gas_price