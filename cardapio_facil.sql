-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/03/2024 às 21:13
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cardapio_facil`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `administrador`
--
-- Criação: 22/03/2024 às 01:30
-- Última atualização: 27/03/2024 às 18:51
--

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `data_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `administrador`:
--

--
-- Despejando dados para a tabela `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `cpf`, `nome`, `email`, `senha`, `cargo`, `data_registro`) VALUES
(1, '01267842210', 'joão silva', 'joão@gmail.com', '$2y$12$hash_aqui', 'administrador', '2024-03-01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `administrador_sistema`
--
-- Criação: 22/03/2024 às 01:30
-- Última atualização: 27/03/2024 às 18:51
--

CREATE TABLE `administrador_sistema` (
  `id_administrador` int(11) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `data_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `administrador_sistema`:
--

--
-- Despejando dados para a tabela `administrador_sistema`
--

INSERT INTO `administrador_sistema` (`id_administrador`, `cpf`, `nome`, `email`, `senha`, `cargo`, `data_registro`) VALUES
(1, '01267842210', 'joão silva', 'joão@gmail.com', '$2y$12$hash_aqui', 'administrador', '2024-03-01'),
(2, '01234567890', 'iokim diego', 'iokimdiego@gmail.com', '$2y$12$novo_hash_admin_sistema', 'Cargo Administrativo', '2024-03-09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendente`
--
-- Criação: 27/03/2024 às 18:43
-- Última atualização: 27/03/2024 às 18:49
--

CREATE TABLE `atendente` (
  `id_atendente` int(11) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `senha` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `atendente`:
--

--
-- Despejando dados para a tabela `atendente`
--

INSERT INTO `atendente` (`id_atendente`, `cpf`, `email`, `cargo`, `nome`, `senha`) VALUES
(1, '12345678901', 'elianeperedaniel@gmail.com', 'Garçom', 'eliane pereira', '$2y$12$hash_atendente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--
-- Criação: 27/03/2024 às 19:19
-- Última atualização: 27/03/2024 às 20:03
--

CREATE TABLE `avaliacao` (
  `id_avaliacao` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_atendente` int(11) DEFAULT NULL,
  `data_avaliacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `nota_avaliacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `avaliacao`:
--   `id_cliente`
--       `cliente` -> `id_cliente`
--   `id_atendente`
--       `atendente` -> `id_atendente`
--

--
-- Despejando dados para a tabela `avaliacao`
--

INSERT INTO `avaliacao` (`id_avaliacao`, `id_cliente`, `id_atendente`, `data_avaliacao`, `nota_avaliacao`) VALUES
(3, 1, 1, '2024-03-27 20:03:25', 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `caixa`
--
-- Criação: 27/03/2024 às 18:44
-- Última atualização: 27/03/2024 às 19:10
--

CREATE TABLE `caixa` (
  `id_caixa` int(11) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `data_transacao` date NOT NULL,
  `valor_total_dia` decimal(12,2) NOT NULL,
  `id_pedido_fk` int(11) DEFAULT NULL,
  `id_mesa_fk` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `caixa`:
--   `id_pedido_fk`
--       `pedido` -> `id_pedido`
--   `id_mesa_fk`
--       `mesa` -> `id_mesa`
--

--
-- Despejando dados para a tabela `caixa`
--

INSERT INTO `caixa` (`id_caixa`, `cpf`, `email`, `senha`, `data_transacao`, `valor_total_dia`, `id_pedido_fk`, `id_mesa_fk`, `nome`) VALUES
(4, '87654321098', 'maria@gmail.com', '$2y$12$novo-hash_senh_caixa', '2024-03-09', 50.00, 1, 1, 'jessica souza');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_item`
--
-- Criação: 22/03/2024 às 01:28
-- Última atualização: 27/03/2024 às 18:54
--

CREATE TABLE `categoria_item` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `categoria_item`:
--

--
-- Despejando dados para a tabela `categoria_item`
--

INSERT INTO `categoria_item` (`id_categoria`, `nome`) VALUES
(1, 'bebida');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--
-- Criação: 27/03/2024 às 18:45
-- Última atualização: 27/03/2024 às 18:54
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `cliente`:
--

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `email`) VALUES
(1, 'Marcos vinicios', 'maria@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cozinha`
--
-- Criação: 22/03/2024 às 01:29
-- Última atualização: 27/03/2024 às 19:00
--

CREATE TABLE `cozinha` (
  `id_cozinha` int(11) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `cozinha`:
--

--
-- Despejando dados para a tabela `cozinha`
--

INSERT INTO `cozinha` (`id_cozinha`, `cpf`, `email`, `senha`, `nome`) VALUES
(1, '98765432101', 'cozinha@email.com', '$2y$12$novo-hash_senha_cozinha', 'Cozinha 1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cronograma_preparo`
--
-- Criação: 22/03/2024 às 01:29
-- Última atualização: 27/03/2024 às 19:00
--

CREATE TABLE `cronograma_preparo` (
  `id_cronograma` int(11) NOT NULL,
  `dia_semana` varchar(20) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `id_cozinha_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `cronograma_preparo`:
--

--
-- Despejando dados para a tabela `cronograma_preparo`
--

INSERT INTO `cronograma_preparo` (`id_cronograma`, `dia_semana`, `hora_inicio`, `hora_fim`, `id_cozinha_fk`) VALUES
(1, 'Segunda', '08:00:00', '17:00:00', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item`
--
-- Criação: 22/03/2024 às 01:28
-- Última atualização: 27/03/2024 às 18:54
--

CREATE TABLE `item` (
  `id_item` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(12,2) NOT NULL,
  `id_categoria_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `item`:
--   `id_categoria_fk`
--       `categoria_item` -> `id_categoria`
--

--
-- Despejando dados para a tabela `item`
--

INSERT INTO `item` (`id_item`, `nome`, `descricao`, `preco`, `id_categoria_fk`) VALUES
(2, 'coca-cola', 'refrigerante', 5.00, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--
-- Criação: 22/03/2024 às 01:29
-- Última atualização: 27/03/2024 às 19:06
--

CREATE TABLE `item_pedido` (
  `id_item_pedido` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `observacoes` text DEFAULT NULL,
  `id_pedido_fk` int(11) DEFAULT NULL,
  `id_item_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `item_pedido`:
--   `id_pedido_fk`
--       `pedido` -> `id_pedido`
--   `id_item_fk`
--       `item` -> `id_item`
--

--
-- Despejando dados para a tabela `item_pedido`
--

INSERT INTO `item_pedido` (`id_item_pedido`, `quantidade`, `observacoes`, `id_pedido_fk`, `id_item_fk`) VALUES
(2, 2, 'Sem cebola', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `log`
--
-- Criação: 22/03/2024 às 01:30
-- Última atualização: 27/03/2024 às 18:50
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo_operacao` varchar(60) NOT NULL,
  `detalhes` text DEFAULT NULL,
  `id_administrado_sistema` int(11) DEFAULT NULL,
  `ip_origem` varchar(15) DEFAULT NULL,
  `id_atendente` int(11) DEFAULT NULL,
  `id_caixa` int(11) DEFAULT NULL,
  `id_administrador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `log`:
--

--
-- Despejando dados para a tabela `log`
--

INSERT INTO `log` (`id_log`, `data_hora`, `tipo_operacao`, `detalhes`, `id_administrado_sistema`, `ip_origem`, `id_atendente`, `id_caixa`, `id_administrador`) VALUES
(1, '2024-03-27 18:50:27', 'operação administrador', 'descrição da operação', 123, 'o.o.o.o.', NULL, NULL, 789);

-- --------------------------------------------------------

--
-- Estrutura para tabela `mesa`
--
-- Criação: 22/03/2024 às 01:29
-- Última atualização: 27/03/2024 às 18:59
--

CREATE TABLE `mesa` (
  `id_mesa` int(11) NOT NULL,
  `numero_fisico` int(11) NOT NULL,
  `estatus` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `mesa`:
--

--
-- Despejando dados para a tabela `mesa`
--

INSERT INTO `mesa` (`id_mesa`, `numero_fisico`, `estatus`) VALUES
(1, 1, 'Disponível');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--
-- Criação: 22/03/2024 às 01:29
-- Última atualização: 27/03/2024 às 19:01
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `estatus_entrega` varchar(200) DEFAULT NULL,
  `tempo_preparo_estimado` int(11) DEFAULT NULL,
  `tempo_preparo_real` int(11) DEFAULT NULL,
  `id_cliente_fk` int(11) DEFAULT NULL,
  `id_mesa_fk` int(11) DEFAULT NULL,
  `id_cronograma_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `pedido`:
--   `id_cliente_fk`
--       `cliente` -> `id_cliente`
--   `id_mesa_fk`
--       `mesa` -> `id_mesa`
--   `id_cronograma_fk`
--       `cronograma_preparo` -> `id_cronograma`
--

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `estatus_entrega`, `tempo_preparo_estimado`, `tempo_preparo_real`, `id_cliente_fk`, `id_mesa_fk`, `id_cronograma_fk`) VALUES
(1, 'Pendente', 30, NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `resumo_diario`
--
-- Criação: 22/03/2024 às 01:30
-- Última atualização: 27/03/2024 às 19:16
--

CREATE TABLE `resumo_diario` (
  `id_resumo` int(11) NOT NULL,
  `data_resumo` date NOT NULL,
  `total_vendas` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `resumo_diario`:
--

--
-- Despejando dados para a tabela `resumo_diario`
--

INSERT INTO `resumo_diario` (`id_resumo`, `data_resumo`, `total_vendas`) VALUES
(1, '2024-03-09', 150.00),
(2, '2024-03-09', 150.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `senha` (`senha`);

--
-- Índices de tabela `administrador_sistema`
--
ALTER TABLE `administrador_sistema`
  ADD PRIMARY KEY (`id_administrador`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `senha` (`senha`);

--
-- Índices de tabela `atendente`
--
ALTER TABLE `atendente`
  ADD PRIMARY KEY (`id_atendente`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `senha` (`senha`);

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_atendente` (`id_atendente`);

--
-- Índices de tabela `caixa`
--
ALTER TABLE `caixa`
  ADD PRIMARY KEY (`id_caixa`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `senha` (`senha`),
  ADD KEY `id_pedido_fk` (`id_pedido_fk`),
  ADD KEY `id_mesa_fk` (`id_mesa_fk`);

--
-- Índices de tabela `categoria_item`
--
ALTER TABLE `categoria_item`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `cozinha`
--
ALTER TABLE `cozinha`
  ADD PRIMARY KEY (`id_cozinha`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `senha` (`senha`);

--
-- Índices de tabela `cronograma_preparo`
--
ALTER TABLE `cronograma_preparo`
  ADD PRIMARY KEY (`id_cronograma`);

--
-- Índices de tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_categoria_fk` (`id_categoria_fk`);

--
-- Índices de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`id_item_pedido`),
  ADD KEY `id_pedido_fk` (`id_pedido_fk`),
  ADD KEY `id_item_fk` (`id_item_fk`);

--
-- Índices de tabela `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`);

--
-- Índices de tabela `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`id_mesa`),
  ADD UNIQUE KEY `numero_fisico` (`numero_fisico`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente_fk` (`id_cliente_fk`),
  ADD KEY `id_mesa_fk` (`id_mesa_fk`),
  ADD KEY `id_cronograma_fk` (`id_cronograma_fk`);

--
-- Índices de tabela `resumo_diario`
--
ALTER TABLE `resumo_diario`
  ADD PRIMARY KEY (`id_resumo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `administrador_sistema`
--
ALTER TABLE `administrador_sistema`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `atendente`
--
ALTER TABLE `atendente`
  MODIFY `id_atendente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `caixa`
--
ALTER TABLE `caixa`
  MODIFY `id_caixa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `categoria_item`
--
ALTER TABLE `categoria_item`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cozinha`
--
ALTER TABLE `cozinha`
  MODIFY `id_cozinha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cronograma_preparo`
--
ALTER TABLE `cronograma_preparo`
  MODIFY `id_cronograma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  MODIFY `id_item_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `mesa`
--
ALTER TABLE `mesa`
  MODIFY `id_mesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `resumo_diario`
--
ALTER TABLE `resumo_diario`
  MODIFY `id_resumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`id_atendente`) REFERENCES `atendente` (`id_atendente`);

--
-- Restrições para tabelas `caixa`
--
ALTER TABLE `caixa`
  ADD CONSTRAINT `caixa_ibfk_1` FOREIGN KEY (`id_pedido_fk`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `caixa_ibfk_2` FOREIGN KEY (`id_mesa_fk`) REFERENCES `mesa` (`id_mesa`);

--
-- Restrições para tabelas `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categoria_item` (`id_categoria`) ON DELETE SET NULL;

--
-- Restrições para tabelas `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`id_pedido_fk`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`id_item_fk`) REFERENCES `item` (`id_item`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente_fk`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_mesa_fk`) REFERENCES `mesa` (`id_mesa`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`id_cronograma_fk`) REFERENCES `cronograma_preparo` (`id_cronograma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
