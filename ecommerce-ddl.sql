-- DDL - data definition language

--create schema ecommerce926;


create table produto(
    id serial primary key,
    descricao varchar(1000) not null,
    codigo_barras varchar(44) unique,
    valor numeric not null
);


create table endereco(
    id serial,
    cep char(8) not null,
    logradouro varchar(1000) not null,
    numero varchar(30) not null,
    cidade varchar(200) not null,
    uf char(2) not null,
    constraint pk_id_endereco primary key(id)
);

create table cliente(
    id serial primary key,
    cpf char(11) unique not null,
    nome varchar(895) not null,
    id_endereco int unique not null,
    foreign key(id_endereco) references endereco(id)
);

create table pedido (
    id serial primary key,
    previsao_entrega date not null,
    meio_pagamento varchar(200) not null,
    status varchar(100) not null,
    id_cliente int not null,
    data_criacao timestamp not null,
    foreign key(id_cliente) references cliente
);

create table item_pedido(
    id_pedido int not null,
    id_produto int not null,
    quantidade int not null,
    valor numeric not null,
    primary key(id_pedido, id_produto),
    foreign key(id_pedido) references pedido(id),
    foreign key(id_produto) references produto
);

--

create table fornecedor(
	id serial primary key,
	nome varchar(100) not null,
	cnpj varchar(14) unique not null,
	id_endereco int unique not null,
	foreign key(id_endereco) references endereco(id)
);

create table fornecimento_produto(
	id_produto int not null,
	id_fornecedor int not null,
	foreign key(id_fornecedor) references fornecedor(id),
	foreign key(id_produto) references produto(id)
);

create table estoque(
	id serial primary key,
	id_endereco int not null,
	foreign key(id_endereco) references endereco(id)
);


create table produto_em_estoque(
	id_produto int not null,
	id_estoque int not null,
	quantidade int not null,
	foreign key(id_produto) references produto(id),
	foreign key(id_estoque) references estoque(id)
);

create table carrinho(
	id_produto int not null,
	id_cliente int not null,
	quantidade int not null,
	data_insercao timestamp not null,
	foreign key(id_produto) references produto(id),
	foreign key(id_cliente) references cliente(id)
);

create table cupom( 
	id serial primary key,
	data_inicio timestamp not null,
	data_expiracao timestamp not null,
	valor_desconto numeric not null,
	descricao varchar(1000) not null,
	foreign key(id) references pedido(id)
);

--

alter table pedido 
  add column id_cupom int unique;

alter table pedido
  drop constraint pedido_id_cliente_key;
    
alter table pedido
    add unique(id_cliente, id_cupom);

