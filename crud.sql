-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes (nome,lealdade)
VALUES
('GEORGIA',0)
-- 2)
INSERT INTO pedidos (status,cliente_id)
VALUES

('Recebido',(
SELECT
id
FROM clientes
WHERE clientes.nome = 'GEORGIA'
));


-- 3)
INSERT INTO produtos_pedidos (pedido_id, produto_id)
VALUES
((SELECT id FROM clientes WHERE clientes.nome = 'GEORGIA'),
(SELECT id FROM produtos WHERE produtos.nome = 'Big Serial')
),


((SELECT id FROM clientes WHERE clientes.nome = 'GEORGIA'),
((SELECT id FROM produtos WHERE produtos.nome = 'Varchapa'))
),
((SELECT id FROM clientes WHERE clientes.nome = 'GEORGIA'),
((SELECT id FROM produtos WHERE produtos.nome = 'Fritas'))
),

((SELECT id FROM clientes WHERE clientes.nome = 'GEORGIA'),
((SELECT id FROM produtos WHERE produtos.nome =  'Coca-Cola'))
),
((SELECT id FROM clientes WHERE clientes.nome = 'GEORGIA'),
((SELECT id FROM produtos WHERE produtos.nome =  'Coca-Cola'))

)


-- Leitura
-- 1)
SELECT
*
FROM
clientes FULL OUTER JOIN pedidos
ON clientes.id = pedidos.cliente_id
FULL OUTER JOIN produtos_pedidos
ON produtos_pedidos.pedido_id = pedidos.id
FULL OUTER JOIN produtos
ON produtos.id = produtos_pedidos.produto_id
WHERE clientes.nome = 'GEORGIA'
-- Atualização
-- 1)

UPDATE clientes 
SET lealdade = (SELECT
SUM(produtos.pts_de_lealdade)
FROM
clientes FULL OUTER JOIN pedidos
ON clientes.id = pedidos.cliente_id
FULL OUTER JOIN produtos_pedidos
ON produtos_pedidos.pedido_id = pedidos.id
FULL OUTER JOIN produtos
ON produtos.id = produtos_pedidos.produto_id
WHERE clientes.nome = 'GEORGIA') 

WHERE clientes.nome = 'GEORGIA'
-- Deleção
-- 1)
DELETE 
FROM
clientes
WHERE clientes.nome = 'Marcelo'




