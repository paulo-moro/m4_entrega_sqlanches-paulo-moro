-- Aqui você deve colocar os códigos SQL referentes à
CREATE DATABASE sqlanches;
-- Criação das tabelas

-- Tabela clientes
CREATE TABLE IF NOT EXISTS Clientes(
	id BIGSERIAL PRIMARY KEY,
  	nome VARCHAR(50) NOT NULL,
  	lealdade INTEGER NOT NULL
);
-- Tabela endereços
CREATE TABLE IF NOT EXISTS Enderecos(
 id BIGSERIAL PRIMARY KEY,
 CEP VARCHAR(9) NOT NULL,
 rua VARCHAR(50) NOT NULL,
  numero INTEGER NOT NULL,
  bairro VARCHAR(50) NOT NULL,
  complemento VARCHAR(100),
  cliente_id INTEGER  NOT NULL UNIQUE ,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
-- Tabela pedidos
CREATE TABLE IF NOT EXISTS Pedidos(
  id BIGSERIAL PRIMARY KEY,
  status VARCHAR(50) NOT NULL,
  cliente_id INTEGER NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
-- Tabela produtos
CREATE TABLE IF NOT EXISTS Produtos(
  id BIGSERIAL PRIMARY KEY,
  nome VARCHAR(30) UNIQUE NOT NULL,
  tipo VARCHAR(30) NOT NULL,
  preco FLOAT NOT NULL,
  pts_de_lealdade INTEGER NOT NULL
);
-- Tabela produtos_pedidos
CREATE TABLE IF NOT EXISTS Produtos_Pedidos(
	id BIGSERIAL PRIMARY KEY,
  	pedido_id INTEGER NOT NULL,
  	produto_id INTEGER NOT NULL,
  	FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
  	FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);
