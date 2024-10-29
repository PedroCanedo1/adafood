-- Tabela Cliente
CREATE TABLE IF NOT EXISTS cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    data_nascimento DATE
);



-- Tabela Funcionário
CREATE TABLE IF NOT EXISTS funcionario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    cargo VARCHAR(50),
    telefone VARCHAR(15)
);

-- Tabela Prato
CREATE TABLE IF NOT EXISTS prato (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco NUMERIC(10, 2) NOT NULL  -- Preço com até 8 dígitos inteiros e 2 casas decimais
);

-- Tabela Mesa
CREATE TABLE IF NOT EXISTS mesa (
    id SERIAL PRIMARY KEY,
    numero INT UNIQUE NOT NULL,  -- Número da mesa deve ser único
    capacidade INT NOT NULL      -- Número de pessoas que cabem na mesa
);

-- Tabela Reserva
CREATE TABLE IF NOT EXISTS reserva (
    id SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    cliente_id INT REFERENCES cliente(id) ON DELETE CASCADE,  -- Deletar a reserva se o cliente for deletado
    mesa_id INT REFERENCES mesa(id) ON DELETE CASCADE        -- Deletar a reserva se a mesa for deletada
);

-- Tabela Pedido
CREATE TABLE IF NOT EXISTS pedido (
    id SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    cliente_id INT REFERENCES cliente(id) ON DELETE SET NULL,  -- Pedido continua, mas cliente pode ser removido
    mesa_id INT REFERENCES mesa(id) ON DELETE SET NULL         -- Pedido pode continuar se a mesa for removida
);

-- Tabela Prato_Pedido (Relação entre Prato e Pedido)
CREATE TABLE IF NOT EXISTS prato_pedido (
    prato_id INT REFERENCES prato(id) ON DELETE CASCADE,  -- Deletar o relacionamento se o prato for deletado
    pedido_id INT REFERENCES pedido(id) ON DELETE CASCADE,  -- Deletar o relacionamento se o pedido for deletado
    PRIMARY KEY (prato_id, pedido_id)  -- A combinação de prato e pedido deve ser única
);

-- Tabela Funcionario_Pedido (Relação entre Funcionário e Pedido)
CREATE TABLE IF NOT EXISTS funcionario_pedido (
    funcionario_id INT REFERENCES funcionario(id) ON DELETE CASCADE,  -- Deletar o relacionamento se o funcionário for deletado
    pedido_id INT REFERENCES pedido(id) ON DELETE CASCADE,  -- Deletar o relacionamento se o pedido for deletado
    PRIMARY KEY (funcionario_id, pedido_id)  -- A combinação de funcionário e pedido deve ser única
);

