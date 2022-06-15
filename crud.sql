-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO
	clientes(nome, lealdade)
VALUES
	('Georgia',0);

-- 2)

INSERT INTO 
	pedidos(status,cliente_id)
VALUES
	('Recebido',6);

-- 3)
INSERT INTO produtos_pedidos
	(pedido_id, produto_id)
VALUES
	(6,8),
    (6,8),
    (6,1),
    (6,2);


-- Leitura

-- 1)
SELECT 
	cli.id cliente_id,
	cli.nome,
    cli.lealdade,
    ped.id pedido_id,
    ped.status,
    prod.id produto_id,
    prod.nome,
    prod.tipo,
    prod.preco,
    prod.pts_de_lealdade
    
    
FROM produtos_pedidos
    JOIN produtos prod ON prod.id = produto_id
	JOIN pedidos ped ON ped.id = pedido_id, clientes cli
WHERE
	cli.nome like 'Georgia'
;


-- Atualização

-- 1)

UPDATE 
	clientes  
SET
	lealdade = sum
FROM (
SELECT SUM(prod.pts_de_lealdade)  as sum
       FROM produtos_pedidos prod_ped
       JOIN produtos prod ON prod.id = produto_id
       JOIN pedidos ped ON ped.id = pedido_id, clientes cli

WHERE 
	cli.nome like 'Georgia') l
WHERE clientes.nome like 'Georgia' returning *; 

-- Deleção

-- 1)
DELETE FROM
  clientes
WHERE 
  clientes.nome LIKE 'Marcelo' returning *;


