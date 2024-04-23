CREATE DATABASE bikedb;
USE bikedb;
CREATE TABLE inventario(
idinventario int auto_increment primary key,
modelo VARCHAR (50) not null unique,
marca VARCHAR (50) not null,
quantidade INT not null,
preco DECIMAL(7,2) not null,
idfornecedor int not null
);
CREATE TABLE clientes(
idcliente int auto_increment primary key,
nome VARCHAR(50) not null,
endereco VARCHAR(50) not null,
numerodetelefone VARCHAR(15) not null unique,
email VARCHAR(100) not null
);

CREATE TABLE vendas(
idvenda int auto_increment primary key,
datavenda datetime default current_timestamp(),
idcliente int not null,
idinventario int not null,
quantidadevendida int not null,
precototal decimal(7,2) not null,
metododepagamento ENUM("Pix", "Dinheiro", "Cartão de Debito", "Cartão de Crédito"),
idvendedor int not null
);

CREATE TABLE fornecedores(
idfornecedor int auto_increment primary key,
nomedofornecedor VARCHAR(50) not null,
enderecodofornecedor VARCHAR(50) not null unique,
numerodetelefonedofornecedor VARCHAR(15) not null,
emaildofornecedor VARCHAR(50) not null
);

CREATE TABLE vendedores(
idvendedor int auto_increment primary key,
nomedovendedor VARCHAR(50) not null,
idfuncionario int not null
);

CREATE TABLE funcionarios(
idfuncionario int auto_increment primary key,
nomedofuncionario VARCHAR(50),
cargo VARCHAR(50),
salario DECIMAL(7,2),
datadeadmissão datetime default current_timestamp()
);

CREATE TABLE detalhevenda(
iddetalhevenda int auto_increment primary key,
idvenda int not null,
idproduto int not null,
quantidade int not null,
subtotal decimal(7,2) not null
);

ALTER TABLE inventario
ADD CONSTRAINT `fk.inventario_pk.fornecedores`
FOREIGN KEY inventario(`idfornecedor`)
REFERENCES fornecedores (`idfornecedor`);

ALTER TABLE vendas
ADD CONSTRAINT `fk.vendas_pk.clientes`
FOREIGN KEY vendas(`idcliente`)
REFERENCES clientes (`idcliente`);

ALTER TABLE vendas
ADD CONSTRAINT `fk.vendas_pk.detalhevenda`
FOREIGN KEY detalhevenda(`idinventario`)
REFERENCES inventario (`idinventario`);

ALTER TABLE vendas
ADD CONSTRAINT `fk.vendas_pk.vendedores`
FOREIGN KEY vendas(`idvendedor`)
REFERENCES vendedores (`idvendedor`);

ALTER TABLE vendedores
ADD CONSTRAINT `fk.vendedores_pk.funcionarios`
FOREIGN KEY vendedores(`idfuncionario`)
REFERENCES funcionarios (`idfuncionario`);



