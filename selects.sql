-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT
*
FROM 
produtos_pedidos FULL OUTER JOIN produtos
ON produtos_pedidos.produto_id = produtos.id
JOIN pedidos ON produtos_pedidos.pedido_id = pedidos.id

-- 2)
SELECT
pedido_id
FROM
produtos FULL OUTER JOIN produtos_pedidos
ON produtos.id = produtos_pedidos.produto_id
WHERE nome = 'Fritas'

-- 3)
SELECT
clientes.nome
FROM
produtos FULL OUTER JOIN produtos_pedidos
ON produtos.id = produtos_pedidos.produto_id
INNER JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
JOIN clientes ON clientes.id = pedidos.cliente_id
WHERE produtos.nome = 'Fritas';

-- 4)

SELECT
SUM(preço)
FROM 
pedidos FULL OUTER JOIN clientes
ON pedidos.cliente_id = clientes.id
FULL OUTER JOIN produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id
WHERE clientes.nome = 'Laura';
-- 5)
SELECT 
produtos.nome nome,
COUNT(id)
FROM produtos FULL OUTER JOIN produtos_pedidos
ON produtos.id = produtos_pedidos.produto_id
GROUP BY nome;
