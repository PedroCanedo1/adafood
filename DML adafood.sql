INSERT INTO cliente (nome, cpf, telefone, email, data_nascimento) VALUES
('José Bonifácio Carvalho', '11122233344', '31911111111', null, '1966-01-15'),
('Ana Maria Braga', '22233344455', '31922222222', 'maria.souza@gmail.com', '1985-02-25'),
('João Pedro Souza', '33344455566', '31933333333', 'carlos.oliveira@gmail.com', '1992-03-30'),
('Paulo Batista Lima', '44455566677', '31944444444', 'ana.ferreira@gmail.com', '1995-04-20'),
('Jorge Pirelli Filho', '55566677788', '31955555555', 'paulo.lima@gmail.com', '1988-05-10');

INSERT INTO funcionario (nome, cpf, cargo, telefone) VALUES
('José Pereira', '67890123456', 'Garçom', '999996666'),
('Cláudia Costa', '78901234567', 'Chefe de Cozinha', '999997777'),
('Fernando Almeida', '89012345678', 'Atendente', '999998888'),
('Beatriz Santos', '90123456789', 'Gerente', '999999999'),
('Ricardo Mendes', '01234567890', 'Cozinheiro', '999991010');

INSERT INTO prato (nome, descricao, preco) VALUES
('Feijoada', 'Feijoada completa com arroz, couve e laranja', 49.90),
('Macarrão à Bolonhesa', 'Macarrão com molho bolonhesa e queijo parmesão', 34.50),
('Bife à Parmegiana', 'Bife empanado com molho de tomate e queijo', 44.90),
('Salada Caesar', 'Salada com alface, croutons e molho caesar', 29.90),
('Picanha na Chapa', 'Picanha fatiada com batata frita e farofa', 79.90);

INSERT INTO mesa (numero, capacidade) VALUES
(1, 4),
(2, 2),
(3, 6),
(4, 4),
(5, 8);

INSERT INTO reserva (data, hora, cliente_id, mesa_id) VALUES
('2024-09-28', '19:00', 1, 2),
('2024-09-29', '20:00', 2, 4),
('2024-09-30', '18:30', 3, 1),
('2024-10-01', '21:00', 4, 5),
('2024-10-02', '19:30', 5, 3);

INSERT INTO pedido (data, hora, cliente_id, mesa_id) VALUES
('2024-09-28', '19:10', 1, 2),
('2024-09-29', '20:10', 2, 4),
('2024-09-30', '18:45', 3, 1),
('2024-10-01', '21:15', 4, 5),
('2024-10-02', '19:50', 5, 3);

INSERT INTO prato_pedido (prato_id, pedido_id) VALUES
(1, 5),
(2, 1),
(3, 2),
(4, 3),
(5, 4);

INSERT INTO funcionario_pedido (funcionario_id, pedido_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

UPDATE cliente
SET email = 'boninho@gmail.com'
WHERE id = 1;

UPDATE prato
SET preco = 97.00
WHERE id = 1; 

DELETE FROM reserva
WHERE id = 1; 

DELETE FROM funcionario
WHERE id = 4; 




