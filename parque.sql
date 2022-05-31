-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Jun-2022 às 01:14
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `parque`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
--

CREATE TABLE `atividade` (
  `id_parque` int(11) NOT NULL,
  `horario_inicio` time NOT NULL,
  `horario_termino` time NOT NULL,
  `nome` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `atividade`
--

INSERT INTO `atividade` (`id_parque`, `horario_inicio`, `horario_termino`, `nome`) VALUES
(1, '22:20:52', '23:20:52', 'Carro bate bate');

-- --------------------------------------------------------

--
-- Estrutura da tabela `atracao`
--

CREATE TABLE `atracao` (
  `id_parque` int(11) NOT NULL,
  `horario` double NOT NULL,
  `altura_minima` double NOT NULL,
  `idade_minima` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `atracao`
--

INSERT INTO `atracao` (`id_parque`, `horario`, `altura_minima`, `idade_minima`, `nome`) VALUES
(1, 2, 1, 7, 'Show Charles Chaplin'),
(2, 1, 1.3, 7, 'Show Chapolin Colorado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `despesas`
--

CREATE TABLE `despesas` (
  `valor` double NOT NULL,
  `id_turista` int(11) NOT NULL,
  `id_despesa` int(11) NOT NULL,
  `cnpj_parceiro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `despesas`
--

INSERT INTO `despesas` (`valor`, `id_turista`, `id_despesa`, `cnpj_parceiro`) VALUES
(500, 1, 1, 123456);

-- --------------------------------------------------------

--
-- Estrutura da tabela `parceiro_comercial`
--

CREATE TABLE `parceiro_comercial` (
  `nome` varchar(40) NOT NULL,
  `cnpj` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `parceiro_comercial`
--

INSERT INTO `parceiro_comercial` (`nome`, `cnpj`) VALUES
('Empresa X', 123456);

-- --------------------------------------------------------

--
-- Estrutura da tabela `parceria`
--

CREATE TABLE `parceria` (
  `cnpj_parceiro` int(11) NOT NULL,
  `id_parque` int(11) NOT NULL,
  `percentual` double NOT NULL,
  `valor_investimento` double NOT NULL,
  `valor_diario` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `parceria`
--

INSERT INTO `parceria` (`cnpj_parceiro`, `id_parque`, `percentual`, `valor_investimento`, `valor_diario`) VALUES
(123456, 1, 10, 10000, 150);

-- --------------------------------------------------------

--
-- Estrutura da tabela `parque`
--

CREATE TABLE `parque` (
  `id_parque` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `valor_ingresso` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `parque`
--

INSERT INTO `parque` (`id_parque`, `nome`, `endereco`, `valor_ingresso`) VALUES
(1, 'Parque X', 'Rua X', 10),
(2, 'Parque Y', 'Rua Y', 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turista`
--

CREATE TABLE `turista` (
  `id_turista` int(11) NOT NULL,
  `enderco` varchar(60) NOT NULL,
  `nome` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `turista`
--

INSERT INTO `turista` (`id_turista`, `enderco`, `nome`) VALUES
(1, 'Rua 000', 'Pablo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `visita`
--

CREATE TABLE `visita` (
  `id_parque` int(11) NOT NULL,
  `valor_ingresso` int(11) NOT NULL,
  `data_entrada` date NOT NULL,
  `data_saida` date NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_saida` time NOT NULL,
  `num_cartao_turista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `visita`
--

INSERT INTO `visita` (`id_parque`, `valor_ingresso`, `data_entrada`, `data_saida`, `hora_entrada`, `hora_saida`, `num_cartao_turista`) VALUES
(1, 15, '2022-05-01', '2022-05-03', '08:00:56', '23:00:56', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atividade`
--
ALTER TABLE `atividade`
  ADD KEY `id_parque` (`id_parque`);

--
-- Índices para tabela `atracao`
--
ALTER TABLE `atracao`
  ADD KEY `id_parque` (`id_parque`);

--
-- Índices para tabela `despesas`
--
ALTER TABLE `despesas`
  ADD PRIMARY KEY (`id_despesa`),
  ADD KEY `id_turista` (`id_turista`),
  ADD KEY `cnpj_parceiro` (`cnpj_parceiro`);

--
-- Índices para tabela `parceiro_comercial`
--
ALTER TABLE `parceiro_comercial`
  ADD PRIMARY KEY (`cnpj`);

--
-- Índices para tabela `parceria`
--
ALTER TABLE `parceria`
  ADD KEY `cnpj_parceiro` (`cnpj_parceiro`),
  ADD KEY `id_parque` (`id_parque`);

--
-- Índices para tabela `parque`
--
ALTER TABLE `parque`
  ADD PRIMARY KEY (`id_parque`);

--
-- Índices para tabela `turista`
--
ALTER TABLE `turista`
  ADD PRIMARY KEY (`id_turista`);

--
-- Índices para tabela `visita`
--
ALTER TABLE `visita`
  ADD KEY `id_parque` (`id_parque`),
  ADD KEY `id_turista` (`num_cartao_turista`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `despesas`
--
ALTER TABLE `despesas`
  MODIFY `id_despesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `parque`
--
ALTER TABLE `parque`
  MODIFY `id_parque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `turista`
--
ALTER TABLE `turista`
  MODIFY `id_turista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `atividade_ibfk_1` FOREIGN KEY (`id_parque`) REFERENCES `parque` (`id_parque`);

--
-- Limitadores para a tabela `atracao`
--
ALTER TABLE `atracao`
  ADD CONSTRAINT `atracao_ibfk_1` FOREIGN KEY (`id_parque`) REFERENCES `parque` (`id_parque`);

--
-- Limitadores para a tabela `despesas`
--
ALTER TABLE `despesas`
  ADD CONSTRAINT `despesas_ibfk_1` FOREIGN KEY (`id_turista`) REFERENCES `turista` (`id_turista`),
  ADD CONSTRAINT `despesas_ibfk_2` FOREIGN KEY (`cnpj_parceiro`) REFERENCES `parceiro_comercial` (`cnpj`);

--
-- Limitadores para a tabela `parceria`
--
ALTER TABLE `parceria`
  ADD CONSTRAINT `parceria_ibfk_1` FOREIGN KEY (`cnpj_parceiro`) REFERENCES `parceiro_comercial` (`cnpj`),
  ADD CONSTRAINT `parceria_ibfk_2` FOREIGN KEY (`id_parque`) REFERENCES `parque` (`id_parque`);

--
-- Limitadores para a tabela `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`id_parque`) REFERENCES `parque` (`id_parque`),
  ADD CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`num_cartao_turista`) REFERENCES `turista` (`id_turista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
