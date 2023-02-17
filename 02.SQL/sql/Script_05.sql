-- Retorne o preço médio de revenda para cada produto em cada estado, 
-- ordenando pelo preço médio de revenda em ordem decrescente.
select 
	"ESTADO" as state,
	"PRODUTO" as prod,
	AVG("PREÇO MÁXIMO REVENDA") as average_price
from gas_price
group by "ESTADO", "PRODUTO"
order by AVG("PREÇO MÁXIMO REVENDA") DESC