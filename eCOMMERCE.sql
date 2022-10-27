-- banco de dados E-COMMERCE
 drop database ecommerce;
create database ecommerce;

use ecommerce;

-- Tabela cliente
create table cliente(
	idCliente int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(255),
    constraint unique_cpf_cliente unique (CPF)
);

alter table cliente auto_increment=1;

-- Tabela produto
	-- size= dimensão produto
create table produto(
	idProduct int auto_increment primary key,
    Fname varchar(30),
    classification_kids bool default false,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    avaliação float default 0,
    size varchar(10)
);

-- Melhoria
	-- tabela pagamento
		-- Termine a implementação, crie conexão com as tabelas necessárias e coloque no esquema relacional
create table payments(
	idclient int,
    id_payment int,
    typePayment enum('Boleto', 'Cartão', 'Dois cartões'),
    limitAvailable float,
    primary key(idClient, id_payment)
);


-- Tabela pedido
	-- Criar constraints relacionadas a pagamento
-- drop table pedido;
create table pedido(
	idOrder int auto_increment primary key,
    idOrderClient int, 
    orderStatus enum('Cancelado', 'Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10, 
    paymentCash boolean default false,
    constraint fk_orders_client foreign key (idOrderClient) references cliente(idCliente)
			on update cascade
);

-- tabela estoque 
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity float default 0
    );

-- tabela fornecedor
create table supplier(
	idsupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contato char(11) not null,
    constraint unique_supplier unique (CNPJ)
    );
    
-- tabela vendedor
create table vendedor(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    AbstName varchar(255),
    location varchar(255),
    CNPJ char(15),
    CPF char(11),
    contato char(11) not null,
    constraint unique_CNPJ_seller unique (CNPJ),
    constraint unique_CPF_seller unique (CPF)
    );

desc produto;
create table produtSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key(idpSeller, idpProduct),
    constraint fk_product_seller foreign key(idPseller) references vendedor(idSeller),
	constraint fk_product_product foreign key(idPproduct) references produto(idproduct)
);

create table produtOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponivel', 'Sem estoque') default 'Disponível',
    primary key(idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key(idPOproduct) references produto(idProduct),
	constraint fk_productorder_product foreign key(idPOorder) references pedido(idOrder)
);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key(idLproduct, idLstorage),
    constraint fk_storage_location_product_seller foreign key(idLproduct) references produto(idProduct),
	constraint fk_storage_location_product_product foreign key(idLstorage) references productstorage(idProdStorage)
);

create table productSupplier(
	idPsProduct int,
    idPsSupplier int,
    quantity int not null,
    primary key(idPsProduct, idPsSupplier),
    constraint fk_product_supplier_supplier foreign key(idPsSupplier) references supplier(idSupplier),
	constraint fk_product_supplier_product foreign key(idPsProduct) references produto(idProduct)
);

show tables;