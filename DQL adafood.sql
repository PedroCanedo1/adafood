-- Lista o total de pedidos que cada cliente já fez
SELECT cliente.nome, COUNT(pedido.id) AS total_pedidos
FROM pedido
JOIN cliente ON pedido.cliente_id = cliente.id
GROUP BY cliente.nome
ORDER BY total_pedidos DESC;

-- Lista os pedidos e o nome do cliente que os fez.
SELECT pedido.id AS pedido_id, pedido.data, pedido.hora, cliente.nome AS cliente_nome
FROM pedido
JOIN cliente ON pedido.cliente_id = cliente.id;

-- Lista os pratos pedidos junto com as mesas e a data/hora dos pedidos.
SELECT pedido.data, pedido.hora, mesa.numero AS numero_mesa, prato.nome AS nome_prato
FROM pedido
JOIN mesa ON pedido.mesa_id = mesa.id
JOIN prato_pedido ON pedido.id = prato_pedido.pedido_id
JOIN prato ON prato_pedido.prato_id = prato.id;

-- Lista os pedidos atendidos por cada funcionário.
SELECT funcionario.nome AS funcionario_nome, funcionario.cargo, pedido.id AS pedido_id, pedido.data, pedido.hora
FROM funcionario
JOIN funcionario_pedido ON funcionario.id = funcionario_pedido.funcionario_id
JOIN pedido ON funcionario_pedido.pedido_id = pedido.id;
