-- Bando de Dados FazendaTech Versão 1 --
-----------------------------------------
--Estrutura da tabela PRODUTO--

CREATE TABLE Produto ( 
    ID_Produto NUMBER(6) PRIMARY KEY, 
    Quant_Pedido NUMBER(5), 
    Quant_Disponivel NUMBER(5), 
    Descricao VARCHAR2(255), 
    Nome VARCHAR2(100), 
    Preco NUMBER(10, 2) 
)
;

--Estrutura da Tabela CADASTRO_CLIENTE--
CREATE TABLE Cadastro_Cliente ( 
    ID_Cliente NUMBER(6) PRIMARY KEY, 
    Nome VARCHAR(200),
    CPF VARCHAR2(14), 
    Email VARCHAR2(100), 
    Senha VARCHAR2(8) 
)
;

--Estrutura tabela PEDIDO --
CREATE TABLE Pedido( 
    ID_Pedido NUMBER(6) PRIMARY KEY, 
    ID_Produto NUMBER, 
    ID_CLiente NUMBER, 
    ID_Pagamento NUMBER(6), 
    CONSTRAINT fk_produto_pedido FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto), 
    CONSTRAINT fk_cliente_pedido FOREIGN KEY (ID_Cliente) REFERENCES Cadastro_Cliente (ID_Cliente) 
)
;

--Estrutura tabela Pgamento--
CREATE TABLE Pagamento ( 
    ID_Pagamento NUMBER PRIMARY KEY, 
    ID_Pedido NUMBER, 
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido) 
)
;

--Adicionando chaves estrangeiras --
ALTER TABLE Cadastro_Cliente 
    ADD ID_PEDIDO NUMBER(6)
;

ALTER TABLE Cadastro_Cliente 
ADD FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
;

ALTER TABLE Produto 
ADD ID_PEDIDO NUMBER(6)
;

ALTER TABLE Produto 
ADD FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
;

ALTER TABLE Pedido 
ADD FOREIGN KEY (ID_Pagamento) REFERENCES Pagamento(ID_Pagamento)
;