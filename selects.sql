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
FROM produtos_pedidos
	JOIN produtos prod ON prod.id = produto_id 
	JOIN pedidos ped ON ped.id = pedido_id AND ped.status LIKE 'En%',
    pedidos
    JOIN clientes cli ON cli.id = cliente_id
WHERE
	prod.nome ILIKE 'fritas';
-- 4)
SELECT 
	ROUND(SUM(preco)::NUMERIC,2)    
FROM produtos_pedidos
	JOIN produtos prod ON prod.id = produto_id 
	JOIN pedidos ped ON ped.id = pedido_id ,
    pedidos
    JOIN clientes cli ON cli.id = cliente_id
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