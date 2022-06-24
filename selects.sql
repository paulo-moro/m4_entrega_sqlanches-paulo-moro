-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT *
FROM produtos_pedidos 
	JOIN produtos prod ON prod.id = produto_id
	JOIN pedidos ped ON ped.id = pedido_id;
-- 2)
SELECT 
	ped.id
FROM produtos_pedidos
	JOIN produtos prod ON prod.id = produto_id
	JOIN pedidos ped ON ped.id = pedido_id
WHERE
	prod.nome ILIKE 'fritas';
-- 3)
SELECT 
	cli.nome gostam_de_fritas
FROM produtos prod 
  JOIN produtos_pedidos ON prod.id = produtos_pedidos.produto_id 
  JOIN pedidos ped ON produtos_pedidos.pedido_id = ped.id 
  JOIN clientes cli ON cli.id = ped.cliente_id
WHERE
	prod.nome ILIKE 'fritas';
-- 4)
SELECT 
	ROUND(SUM(preco)::NUMERIC,2)    
FROM produtos prod 
  JOIN produtos_pedidos ON prod.id = produtos_pedidos.produto_id 
  JOIN pedidos ped ON produtos_pedidos.pedido_id = ped.id 
  JOIN clientes cli ON cli.id = ped.cliente_id
WHERE
	cli.nome ILIKE 'Laura';
-- 5)
SELECT 
	prod.nome,
    COUNT(prod.id)
FROM produtos_pedidos
	JOIN produtos prod ON prod.id = produto_id  
    JOIN pedidos ped ON ped.id = pedido_id
GROUP BY
	prod.nome