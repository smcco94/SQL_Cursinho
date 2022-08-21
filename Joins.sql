-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel

select prod.brand,
        count(fun.visit_page_date) as visitas
from sales.products as prod
left join sales.funnel as fun
    on prod.product_id = fun.product_id
group by brand
order by visitas desc

-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel

select loja.store_name,
        count(fun.visit_page_date) as visitas
from sales.stores as loja
left join sales.funnel as fun
    on loja.store_id = fun.store_id
group by store_name
order by visitas desc

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)

select  reg.size,
        count(customer_id) as clientes
from temp_tables.regions as reg
left join sales.customers as cus
    on lower(reg.state) = lower(cus.state)
group by reg.size
order by clientes desc