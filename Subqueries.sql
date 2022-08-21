-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers
with visitas_realizadas as (
    select customer_id,
    count(visit_page_date) as visitas
    from sales.funnel
    group by customer_id
)
select cus.customer_id,
        cus.first_name,
        visitas_realizadas.visitas
from sales.customers as cus
left join visitas_realizadas
    on cus.customer_id = visitas_realizadas.customer_id
order by visitas desc