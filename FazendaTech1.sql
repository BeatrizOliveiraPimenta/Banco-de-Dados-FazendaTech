

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Banco de dados: `fazendatech`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro cliente`
--

CREATE TABLE `cadastro cliente` (
  `Codigo_ID` int(5) NOT NULL,
  `CPF` int(11) NOT NULL,
  `E-mail` varchar(50) NOT NULL,
  `Senha` varchar(8) NOT NULL,
  `ID_Pedido` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `Quant_Disponivel` int(200) NOT NULL,
  `Descrição` varchar(150) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `ID_Produto` int(9) NOT NULL,
  `Preço` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `ID_Pagamento` int(8) NOT NULL,
  `ID_Pedido` int(7) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `ID_Pedido` int(7) NOT NULL,
  `ID_Produto` int(9) NOT NULL,
  `Código_ID` int(5) NOT NULL,
  `ID_Pagamento` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `Nome` varchar(50) NOT NULL,
  `Quantidade` int(200) NOT NULL,
  `ID_Produto` int(9) NOT NULL,
  `ID_Pedido` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cadastro cliente`
--
ALTER TABLE `cadastro cliente`
  ADD PRIMARY KEY (`Codigo_ID`),
  ADD KEY `ID_Pedido_FK` (`ID_Pedido`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`ID_Produto`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`ID_Pagamento`),
  ADD KEY `ID_Pedido_FK` (`ID_Pedido`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `ID_Produto_FK` (`ID_Produto`),
  ADD KEY `ID_Cliente` (`Código_ID`),
  ADD KEY `ID_Pagamento` (`ID_Pagamento`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`ID_Produto`),
  ADD KEY `ID_Pedido_FK` (`ID_Pedido`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cadastro cliente`
--
ALTER TABLE `cadastro cliente`
  MODIFY `Codigo_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `ID_Produto` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `ID_Pagamento` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ID_Pedido` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `ID_Produto` int(9) NOT NULL AUTO_INCREMENT;
COMMIT;

