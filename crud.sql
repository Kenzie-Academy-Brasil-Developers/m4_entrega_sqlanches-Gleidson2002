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
('Recebido','7')


-- 3)
INSERT INTO produtos_pedidos (pedido_id, produto_id)
VALUES
(7,1),
(7,2),
(7,6),
(7,8)



-- Leitura

-- 1)

SELECT
*
FROM
clientes FULL OUTER JOIN pedidos
ON clientes.id = pedidos.cliente_id
FULL OUTER JOIN produtos 
ON pedidos.id = produtos.id;

-- Atualização

-- 1)



-- Deleção

-- 1)


