-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Conte quantos clientes da tabela sales.customers tem menos de 30 anos

-- Lista de cliente com menos de 30 anos
select customer_id,
        first_name,
        email,
        birth_date,
       ((current_date - birth_date) / 360) as Idade
from sales.customers
group by customer_id, email
having ((current_date - birth_date) / 360) < 30
-- Numero de clientes com menos de 30 anos
select count(*)
from sales.customers
where ((current_date - birth_date) / 360) < 30

-- (Exercício 2) Informe a idade do cliente mais velho e mais novo da tabela sales.customers

select  'Clientes' as Cliente,
        min(((current_date - birth_date) / 360)) as "Mais Novo",
        max(((current_date - birth_date) / 360)) as "Mais Velho"
from sales.customers

-- (Exercício 3) Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possívelmente a resposta contém mais de um cliente)

select  *
from sales.customers
where income = (select max(income) from sales.customers)
order by first_name


-- (Exercício 4) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca

select  brand,
        count(*)
from sales.products
group by brand
order by brand

-- (Exercício 5) Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo

select  brand,
        model_year,
        count(product_id) as "Qtd Veiculos"
from sales.products
group by brand , model_year
order by brand

-- (Exercício 6) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados

select  brand,
        count(product_id) as "Qtd Veiculos"
from sales.products
group by brand
having count(product_id) > 10
order by brand
