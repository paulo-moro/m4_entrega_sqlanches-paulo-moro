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
    
    
  FROM produtos prod 
  JOIN produtos_pedidos ON prod.id = produtos_pedidos.produto_id 
  JOIN pedidos ped ON produtos_pedidos.pedido_id = ped.id 
  JOIN clientes cli ON cli.id = ped.cliente_id
WHERE
	cli.nome like 'Georgia';


-- Atualização

-- 1)

UPDATE 
	clientes  
SET
	lealdade = (SELECT SUM(prod.pts_de_lealdade) as sum  
FROM produtos prod 
JOIN produtos_pedidos ON prod.id = produtos_pedidos.produto_id 
JOIN pedidos ped ON produtos_pedidos.pedido_id = ped.id 
JOIN clientes ON clientes.id = ped.cliente_id
WHERE
	clientes.nome LIKE 'Georgia')
 WHERE 
 	clientes.nome LIKE 'Georgia' RETURNING *;

-- Deleção

-- 1)
DELETE FROM
  clientes
WHERE 
  clientes.nome LIKE 'Marcelo' returning *;


