-- 01. Listar todos os cliente que tem o nome 'ANA'.> Dica: Buscar sobre função Like
select * from cliente c
	where c.nome ilike 'ANA%';

-- 02. Pedidos feitos em 2023
select * from pedido p 
	where p.data_criacao 
	between to_date('01-01-2023', 'DD/MM/YYYY') and to_date('31-12-2023', 'DD/MM/YYYY');

-- 03. Pedidos feitos em Janeiro de qualquer ano
select * from pedido p 
	where to_char(p.data_criacao, 'MM') = '01';

-- 04. Itens de pedido com valor entre R$2 e R$5
select * from item_pedido ip 
	where ip.valor between 2 and 5
	order by valor;

-- 05. Trazer o Item mais caro comprado em um pedido
select ip.id_pedido, max(ip.valor) from item_pedido ip
	group by ip.id_pedido;

-- 06. Listar todos os status diferentes de pedidos;
select distinct status
	from pedido;

-- 07. TODO Listar o maior, menor e valor médio dos produtos disponíveis.
-- ver com o prof
select distinct descricao, min(valor), avg(valor), max(valor) from produto prod
	group by descricao;

select max(p.valor), min(p.valor), avg(p.valor) from produto p;
	
-- 08. Listar fornecedores com os dados: nome, cnpj, logradouro, numero, cidade e uf de todos os fornecedores;
select f.nome nome_fornecedor, f.cnpj, 
	e.logradouro, e.numero, e.cidade, e.uf 
	from fornecedor f
    inner join endereco e on e.id = f.id_endereco;

-- 09. Informações de produtos em estoque com os dados: id do estoque, descrição do produto, quantidade do produto no estoque, logradouro, numero, cidade e uf do estoque;
select 
	est.id, 
	prod.descricao, 
	ie.quantidade, 
	e.logradouro, e.numero, e.cidade, e.uf
	from item_estoque ie 
	inner join estoque est on ie.id_estoque = est.id
	inner join endereco e on e.id = est.id_endereco
	inner join produto prod on ie.id_produto = prod.id;
   
-- 10. Informações sumarizadas de estoque de produtos com os dados: descrição do produto, código de barras, quantidade total do produto em todos os estoques;
 select distinct prod.descricao, prod.codigo_barras, sum(quantidade) quantidade_total
 	from item_estoque ie
 	inner join produto prod on ie.id_produto = prod.id
 	group by prod.descricao, prod.codigo_barras
 	order by prod.descricao;

-- 11. Informações do carrinho de um cliente específico (cliente com cpf '26382080861') com os dados: descrição do produto, quantidade no carrinho, valor do produto.
 select prod.descricao, ic.quantidade, prod.valor
 	from item_carrinho ic 
 	inner join produto prod on prod.id = ic.id_produto 
 	inner join cliente c on c.id = ic.id_cliente 
 	where c.cpf = '26382080861';
 
-- 12. Relatório de quantos produtos diferentes cada cliente tem no carrinho ordenado pelo cliente que tem mais produtos no carrinho para o que tem menos, com os dados: id do cliente, nome, cpf e quantidade de produtos diferentes no carrinho.
 select distinct c.id, c.nome, c.cpf, count(ic.id_produto) produtos
 	from item_carrinho ic 
 	inner join cliente c on c.id = ic.id_cliente
 	group by c.id
	order by c.id;
 
-- 13. Relatório com os produtos que estão em um carrinho a mais de 10 meses, ordenados pelo inserido a mais tempo, com os dados: id do produto, descrição do produto, data de inserção no carrinho, id do cliente e nome do cliente;
 select ic.id_produto, prod.descricao, ic.data_insercao, ic.id_cliente, c.nome 
 	from item_carrinho ic 
 	inner join produto prod on prod.id = ic.id_produto 
 	inner join cliente c on c.id = ic.id_cliente
 	where ic.data_insercao  < date_trunc('month', current_timestamp) - interval '10 month'
 	order by ic.data_insercao;

-- 14. Relatório de clientes por estado, com os dados: uf (unidade federativa) e quantidade de clientes no estado;
 select e.uf, count(c.id_endereco) qtd_clientes
 	from cliente c
 	inner join endereco e on e.id = c.id_endereco 
 	group by e.uf
 	order by qtd_clientes desc;
 	
-- 15. Listar cidade com mais clientes e a quantidade de clientes na cidade;
 select e.cidade, count(c.id_endereco) qtd_clientes
 	from cliente c
 	inner join endereco e on e.id = c.id_endereco 
 	group by e.cidade
 	order by qtd_clientes desc
 	limit 1;
 
-- 16. Exibir informações de um pedido específico, pedido com id 952, com os dados (não tem problema repetir dados em mais de uma linha): nome do cliente, id do pedido, previsão de entrega, status do pedido, descrição dos produtos comprados, quantidade comprada produto, valor total pago no produto;
 select c.nome, p.id id_pedido, prod.id,  p.previsao_entrega, p.status, prod.descricao, ip.quantidade,  (ip.valor*ip.quantidade) valor_total
 	from pedido p 
 	inner join cliente c on c.id = p.id_cliente 
 	inner join item_pedido ip on ip.id_pedido = p.id
 	inner join produto prod on prod.id = ip.id_produto 
 	where p.id = '952'
 	order by valor_total; 
 
-- 17. Relatório de clientes que realizaram algum pedido em 2022, com os dados: id_cliente, nome_cliente, data da última compra de 2022;
 select distinct p.id_cliente, c.nome, max(p.data_criacao) ultima_compra
 	from pedido p 
 	inner join cliente c on c.id = p.id_cliente
	where p.data_criacao >= to_date('01-01-2022', 'DD-MM-YYYY') 
        and p.data_criacao < to_date('01-01-2023', 'DD-MM-YYYY');
	group by p.id_cliente, c.nome
	order by p.id_cliente asc;

-- 18. Relatório com os TOP 10 clientes que mais gastaram esse ano, com os dados: nome do cliente, valor total gasto;
 select distinct c.nome, sum(ip.valor*ip.quantidade) valor_total
 	from pedido p 
 	inner join cliente c on c.id = p.id_cliente
 	inner join item_pedido ip on ip.id_pedido = p.id 
	where p.data_criacao >= to_date('01-01-2023', 'DD-MM-YYYY')
		and p.status = 'SUCESSO'
	group by c.nome
	order by valor_total desc 
	limit 10;

-- 19. Relatório com os TOP 10 produtos vendidos esse ano, com os dados: descrição do produto, quantidade vendida, valor total das vendas desse produto;
 select distinct prod.descricao, sum(ip.quantidade), sum(ip.valor*ip.quantidade) valor_total
 	from item_pedido ip
 	inner join pedido p on p.id = ip.id_pedido 
 	inner join produto prod on prod.id = ip.id_produto 
	where p.data_criacao >= to_date('01-01-2023', 'DD-MM-YYYY')
		and p.status = 'SUCESSO'
	group by prod.descricao 
	order by valor_total desc 
	limit 10;

-- 20. Exibir o ticket médio do nosso e-commerce, ou seja, a média dos valores totais gasto em pedidos com sucesso
select avg(valor_total_pedido) ticket_médio
        from (
                select ip.id_pedido, sum(ip.quantidade * ip.valor) valor_total_pedido
                from pedido ped
                inner join item_pedido ip on ped.id = ip.id_pedido
                left join cupom cup on ped.id_cupom = cup.id
                where ped.status = 'SUCESSO'
                group by ip.id_pedido
        ) sub_select_pedidos_valor_total;
-- select avg(ip.quantidade * ip.valor) ticket_medio from item_pedido ip 
inner join pedido p on p.id = ip.id_pedido and p.status = 'SUCESSO';


-- 21. Relatório dos clientes gastaram acima de R$ 10000 em um pedido, com os dados: id_cliente, nome do cliente, valor máximo gasto em um pedido;
select p.id_cliente, c.nome, max(ip.valor), sum(ip.valor * ip.quantidade) as valor_total from item_pedido ip 
inner join pedido p on p.id = ip.id_pedido 
inner join cliente c on c.id = p.id_cliente 
group by p.id, p.id_cliente, c.nome
having sum(ip.valor * ip.quantidade) > 10000
order by valor_total;

-- 22. Listar TOP 10 cupons mais utilizados e o total descontado por eles
select c.descricao, p.id_cupom, count(p.id_cupom) qtd_utilizada, c.valor, sum(c.valor) total_descontado from pedido p, cupom c
where p.id_cupom = c.id 
group by p.id_cupom, c.descricao, c.valor
order by qtd_utilizada desc 
limit 10;

-- 23. Listar cupons que foram utilizados mais que seu limite
select c.descricao, p.id_cupom, count(p.id_cupom) qtd_utilizada, c.limite_maximo_usos from pedido p, cupom c
where p.id_cupom = c.id 
group by p.id_cupom, c.descricao, c.valor, c.limite_maximo_usos 
having count(p.id_cupom) > c.limite_maximo_usos 
order by p.id_cupom;

-- 24. Listar todos os ids dos pedidos que foram feitos por pessoas que moram em São Paulo (unidade federativa, uf, SP)
-- e compraram o produto com código de barras '97692630963921';
select p.codigo_barras, p.descricao, pe.id, e.uf 
	from produto p, pedido pe, item_pedido item, endereco e, cliente c
where pe.id_cliente =  c.id 
    and c.id_endereco = e.id 
    and pe.id = item.id_pedido 
    and p.id = item.id_produto 
    and p.codigo_barras = '97692630963921' and e.uf  = 'SP';