-- DML - Data Manipulation Language 
-- insert, delete, update


/* ENDEREÇOS */

insert into endereco  
	values(default, '41211625', 'Rua São Jorge da Bela Vista', '236', 'Salvador', 'BA');

insert into endereco  
	values(default, '64016550', 'Rua Uruçuí', '792', 'Teresina', 'PI');

insert into endereco  
	values(default, '83605235', 'Rua Gumercindo Emeliano Vieira', '1369', 'Campo Largo', 'PR');

insert into endereco  
	values(default, '13183703', 'Rua Rio Iguaçu', '1308', 'Hortolândia', 'SP');

insert into endereco  
	values(default, '08526140', 'Rua Kiwa Iwata', '1600', 'Ferraz de Vasconcelos', 'SP');

insert into endereco  
	values(default, '06634012', 'Rua Joana DArc', '1300', 'Jandira', 'SP');

insert into endereco  
	values(default, '50970280', 'Rua Soldado Gregório Vilalva', '364', 'Recife', 'PE');

insert into endereco  
	values(default, '14700130', 'Travessa Engenheiro Jaime Blandy', '548', 'Bebedouro', 'SP');

insert into endereco  
	values(default, '86060315', 'Praça José Pegoraro', '236', 'Londrina', 'PR');

insert into endereco  
	values(default, '04112020', 'Rua Ismênia dos Santos', '583', 'São Paulo', 'SP');

/* CLIENTES */

insert into cliente 
	values(default, '14059510360', 'Tomás Cunha', 5);
	
insert into cliente 
	values(default, '11677544503', 'Bianca Dias', 6);
	
insert into cliente 
	values(default, '10285118765', 'Estevan Lima', 7);
	
insert into cliente 
	values(default, '44788821508', 'Brenda Pereira', 8);
	
insert into cliente 
	values(default, '37145375893', 'Isabella Martins', 9);

insert into cliente 
	values(default, '58044757546', 'Bruno Barbosa', 10);
	

/* FORNECEDORES */

insert into fornecedor  
	values(default, 'Três irmãos LTDA', '33720539000174', 1);

insert into fornecedor  
	values(default, 'Nova Geração SA', '15611892000134', 2);


/* ESTOQUES */

insert into estoque  
	values(default, 3);

insert into estoque  
	values(default, 4);

/* PRODUTOS */

insert into produto(codigo_barras, descricao, valor) 
 values 
  ('221369000928', 'Carregador Portatil Branco', '49.99'),
  ('686141970481', 'Aparador de pelos Philips', '79.99'),
  ('361747691658', 'Headset Wireless RGB', '99.99'),
  ('865254560078', 'Cabo USB 2M', '9.99'),
  ('529398923956', 'Capinha Smartphone Samsung A20', '19.99');
  
 
 /* PRODUTOS EM ESTOQUE */
 
 insert into produto_em_estoque  
	values(8, 1, 1000);
	
 insert into produto_em_estoque  
	values(9, 2, 800);
	
 insert into produto_em_estoque  
	values(10, 2, 400);
	
 insert into produto_em_estoque  
	values(11, 1, 3000);
	
 insert into produto_em_estoque  
	values(12, 2, 3000);
	
 /* FORNECIMENTO DE PRODUTO */
 
 insert into fornecimento_produto  
	values(8, 1);
	
 insert into fornecimento_produto 
	values(9, 2);
	
 insert into fornecimento_produto 
	values(10, 2);
	
 insert into fornecimento_produto 
	values(11, 1);
	
 insert into fornecimento_produto  
	values(12, 1);

 /* CARRINHOS */
 
 insert into carrinho 
 	values(8, 1, 2, CURRENT_TIMESTAMP);
 
 insert into carrinho 
 	values(11, 1, 1, CURRENT_TIMESTAMP);
 
 insert into carrinho 
 	values(9, 4, 1, CURRENT_TIMESTAMP);
 
 insert into carrinho 
 	values(10, 4, 1, CURRENT_TIMESTAMP);
 
 insert into carrinho 
 	values(12, 4, 1, CURRENT_TIMESTAMP);
 
 /* PEDIDOS */

 insert into pedido 
 	values(default, '2023-04-02 17:59:59', 'PIX', 'Em processamento', 2, CURRENT_TIMESTAMP)
 	
 insert into pedido 
 	values(default, '2023-05-02 17:59:59', 'CARTÃO CRÉDITO', 'Em processamento', 3, CURRENT_TIMESTAMP)
 	
 insert into pedido 
 	values(default, '2023-05-02 17:59:59', 'CARTÃO CRÉDITO', 'Em processamento', 4, CURRENT_TIMESTAMP)
 	
 insert into pedido 
 	values(default, '2023-07-02 17:59:59', 'PAYPAL', 'Em processamento', 5, CURRENT_TIMESTAMP)
 	
 insert into pedido 
 	values(default, '2023-04-02 17:59:59', 'PIX', 'Em processamento', 1, CURRENT_TIMESTAMP)
 	
 insert into pedido 
 	values(default, '2023-06-02 17:59:59', 'CARTÃO CRÉDITO', 'Em processamento', 2, CURRENT_TIMESTAMP)
 
 /* ITEM DE PEDIDOS */

 insert into item_pedido 
 	values(1, 8, 1, 49.99);
 
 insert into item_pedido 
 	values(1, 11, 2, 19.98);
 
 insert into item_pedido 
 	values(2, 10, 2, 199.98);
 
 insert into item_pedido 
 	values(2, 11, 1, 9.99);
 
 insert into item_pedido 
 	values(3, 9, 1, 79.99);
 
 insert into item_pedido 
 	values(3, 12, 1, 19.99);
 
 insert into item_pedido 
 	values(4, 8, 1, 49.99);
 
 insert into item_pedido 
 	values(4, 10, 1, 99.99);
 
 insert into item_pedido 
 	values(5, 9, 1, 79.99);
 
 insert into item_pedido 
 	values(5, 12, 2, 39.98);
 	
	
 /* CUPOM */
 
 insert into cupom
 	values(default, CURRENT_TIMESTAMP , '2023-07-20 23:59:59', 2.00, 'GANHA2');
 
 insert into cupom
 	values(default, CURRENT_TIMESTAMP , '2023-07-20 23:59:59', 5.00, 'GANHA5');
 
 insert into cupom
 	values(default, CURRENT_TIMESTAMP , '2023-07-20 23:59:59', 10.00, 'GANHA10');
 
 /* UPDATES */

update pedido set id_cupom = 3
    where id = 2;
    
update pedido set id_cupom  = 2
    where id = 4;
    
delete from cliente where id = 6;
 
update produto set descricao = 'Capinha Smartphone Samsung S20'
	where codigo_barras = '529398923956';
	
update produto set valor = 119.99
	where codigo_barras = '361747691658';
	
select * from produto order by id;