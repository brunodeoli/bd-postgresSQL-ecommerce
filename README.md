# BD-PO-001-926-Ecommerce

Este é uma das atividades de avaliação feita no curso de Back-End oferecido pela Ada e Americanas Polo Tech.

Grupo: 
* Bruno de Oliveira 
* Ivana Maria Feitosa Silva
* Rachel Lizandra Borborema

## Enunciado parte 1
#### 1 - Modelagem do e-commerce

Façam o modelo físico completo referente ao projeto conceitual do ecommerce visto em aula. Entregar o link do github com os arquivos do print do modelo físico completo e o arquivo (.dbs) do DBSchema.

#### 2 - DDL - Data definition Language

Para o modelo físico entregue no tópico anterior, entreguem o SQL com todo o DDL necessário para criar esse banco de dados no postgreSql. O SQL pode estar em um arquivo chamado ecommerce-ddl.sql no github.

#### 3 - DML - Data Manipulation Language

Com o banco de dados e tabelas criadas agora é hora de popularmos nosso e-commerce com dados, crie o SQL com a inserção dos seguintes dados:

* 5 clientes
* 5 produtos
* 2 clientes devem ter pelo menos 3 produtos no carrinho
* 6 pedidos com pelo menos 2 produtos cada um
* 3 campanhas de cupons
* 2 pedidos que utilizaram cupons
* 2 fornecedores
* associe os produtos com esses dois fornecedores
* 2 estoques
adicione os produtos cadastrados nos estoque
Entregar também a remoção de 1 cliente que não possua pedidos ou items no carrinho e a atualização da descrição e valor de um produto. A entrega pode ser feita no github e estar em um arquivo chamado ecommerce-dml.sql.

## Enunciado parte 2

Utilizando o banco de dados da primeira parte do projeto, ou o disponibilizado em sala de aula. Crie consultas SQL para os seguintes problemas:

* Listar todos os cliente que tem o nome 'ANA'.> Dica: Buscar sobre função Like
* Pedidos feitos em 2023
* Pedidos feitos em Janeiro de qualquer ano
* Itens de pedido com valor entre R$2 e R$5
* Trazer o Item mais caro comprado em um pedido
* Listar todos os status diferentes de pedidos;
* Listar o maior, menor e valor médio dos produtos disponíveis.
* Listar fornecedores com os dados: nome, cnpj, logradouro, numero, cidade e uf de todos os fornecedores;
* Informações de produtos em estoque com os dados: id do estoque, descrição do produto, quantidade do produto no estoque, logradouro, numero, cidade e uf do estoque;
* Informações sumarizadas de estoque de produtos com os dados: descrição do produto, código de barras, quantidade total do produto em todos os estoques;
* Informações do carrinho de um cliente específico (cliente com cpf '26382080861') com os dados: descrição do produto, quantidade no carrinho, valor do produto.
* Relatório de quantos produtos diferentes cada cliente tem no carrinho ordenado pelo cliente que tem mais produtos no carrinho para o que tem menos, com os dados: id do cliente, nome, cpf e quantidade de produtos diferentes no carrinho.
* Relatório com os produtos que estão em um carrinho a mais de 10 meses, ordenados pelo inserido a mais tempo, com os dados: id do produto, descrição do produto, data de inserção no carrinho, id do cliente e nome do cliente;
* Relatório de clientes por estado, com os dados: uf (unidade federativa) e quantidade de clientes no estado;
* Listar cidade com mais clientes e a quantidade de clientes na cidade;
* Exibir informações de um pedido específico, pedido com id 952, com os dados (não tem problema repetir dados em mais de uma linha): nome do cliente, id do pedido, previsão de entrega, status do pedido, descrição dos produtos comprados, quantidade comprada produto, valor total pago no produto;
* Relatório de clientes que realizaram algum pedido em 2022, com os dados: id_cliente, nome_cliente, data da última compra de 2022;
* Relatório com os TOP 10 clientes que mais gastaram esse ano, com os dados: nome do cliente, valor total gasto;
* Relatório com os TOP 10 produtos vendidos esse ano, com os dados: descrição do produto, quantidade vendida, valor total das vendas desse produto;
* Exibir o ticket médio do nosso e-commerce, ou seja, a média dos valores totais gasto em pedidos com sucesso;
* Relatório dos clientes gastaram acima de R$ 10000 em um pedido, com os dados: id_cliente, nome do cliente, valor máximo gasto em um pedido;
* Listar TOP 10 cupons mais utilizados e o total descontado por eles.
* Listar cupons que foram utilizados mais que seu limite;
* Listar todos os ids dos pedidos que foram feitos por pessoas que moram em São Paulo (unidade federativa, uf, SP) e compraram o produto com código de barras '97692630963921';



## Aprendizados

- PostgresSQL
- Docker
- Dbeaver
- DbSchema
- Definição, manipulação e consulta de dados

