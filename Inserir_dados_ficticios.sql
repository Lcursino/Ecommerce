USE mydb;

-- -----------------------------------------------------
-- Insert into `PF`
-- -----------------------------------------------------
INSERT INTO `PF` (`Nome`, `CPF`, `Data de Nascimento`) VALUES
('João Silva', '12345678901', '1990-05-15'),
('Maria Oliveira', '98765432109', '1985-08-22'),
('Pedro Souza', '45678912301', '1995-03-10'),
('Ana Costa', '32165498701', '2000-11-25'),
('Lucas Pereira', '65432198701', '1988-07-14');

-- -----------------------------------------------------
-- Insert into `PJ`
-- -----------------------------------------------------
INSERT INTO `PJ` (`CNPJ`, `Razão Social`) VALUES
('12345678901234', 'Empresa A Ltda'),
('98765432109876', 'Indústria XYZ SA'),
('45678912301234', 'Comércio Virtual LTDA'),
('32165498701234', 'Serviços Rápidos SA'),
('65432198701234', 'Tecnologia Global LTDA');

-- -----------------------------------------------------
-- Insert into `Cliente`
-- -----------------------------------------------------
INSERT INTO `Cliente` (`Nome`) VALUES
('Cliente 1'),
('Cliente 2'),
('Cliente 3'),
('Cliente 4'),
('Cliente 5');

-- -----------------------------------------------------
-- Insert into `Entrega` (ENUM values fixed)
-- -----------------------------------------------------
INSERT INTO `Entrega` (`Status`, `Previsão de entrega`, `Empresa`) VALUES
('enviado', '2024-01-10', 'Correios'),
('entregue', '2024-01-05', 'Transportadora X'),
('enviado', '2024-01-15', 'Correios'),  -- Changed 'pendente' to 'enviado'
('enviado', '2024-01-12', 'Transportadora Y'),
('retornado', '2024-01-08', 'Correios');

-- -----------------------------------------------------
-- Insert into `Produto`
-- -----------------------------------------------------
INSERT INTO `Produto` (`Categoria`, `Descrição`, `Valor`) VALUES
('Eletrônicos', 'Smartphone X', 1500.00),
('Vestuário', 'Camiseta Premium', 50.00),
('Alimentos', 'Café Arábica', 25.50),
('Livros', 'Guia de SQL', 80.90),
('Esportes', 'Bicicleta Pro', 1200.00);

-- -----------------------------------------------------
-- Insert into `Fornecedor`
-- -----------------------------------------------------
INSERT INTO `Fornecedor` (`Razão Social`, `CNPJ`) VALUES
('Fornecedor Alpha', '11223344556677'),
('Beta Suprimentos', '77665544332211'),
('Gama Distribuidora', '12345678901234'),
('Delta Comércio', '45678912301234'),
('Epsilon Indústria', '32165498701234');

-- -----------------------------------------------------
-- Insert into `OrigemProduto` (requires existing IDs)
-- -----------------------------------------------------
INSERT INTO `OrigemProduto` (`Fornecedor_idFornecedor`, `Produto_idProduto`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- -----------------------------------------------------
-- Insert into `Estoque`
-- -----------------------------------------------------
INSERT INTO `Estoque` (`Local`) VALUES
('São Paulo'),
('Rio de Janeiro'),
('Curitiba'),
('Belo Horizonte'),
('Porto Alegre');

-- -----------------------------------------------------
-- Insert into `ProdutoPorEstoque` (requires existing IDs)
-- -----------------------------------------------------
INSERT INTO `ProdutoPorEstoque` (`Produto_idProduto`, `Estoque_idEstoque`, `quantidade`) VALUES
(1, 1, 100),
(2, 2, 50),
(3, 3, 200),
(4, 4, 75),
(5, 5, 150);

-- -----------------------------------------------------
-- Insert into `Pedido` (requires existing IDs)
-- -----------------------------------------------------
INSERT INTO `Pedido` (`Descrição`, `Cliente_idCliente`, `Frete`, `Código de rastreio`, `Entrega_idEntrega`, `Status`) VALUES
('Pedido de eletrônicos', 1, 50.00, 'TRK123456', 1, 'aprovado'),
('Pedido de vestuário', 2, 20.00, 'TRK789012', 2, 'pendente'),
('Pedido de alimentos', 3, 15.00, 'TRK345678', 3, 'enviado'),
('Pedido de livros', 4, 10.00, 'TRK901234', 4, 'cancelado'),
('Pedido de esportes', 5, 80.00, 'TRK567890', 5, 'entregue');

-- -----------------------------------------------------
-- Insert into `RelaçãoProdutoPedido` (requires existing IDs)
-- -----------------------------------------------------
INSERT INTO `RelaçãoProdutoPedido` (`Produto_idProduto`, `Pedido_idPedido`, `quantidade`) VALUES
(1, 1, 2),
(2, 2, 5),
(3, 3, 10),
(4, 4, 3),
(5, 5, 1);

-- -----------------------------------------------------
-- Insert into `VendederMarketplace`
-- -----------------------------------------------------
INSERT INTO `VendederMarketplace` (`Razão Social`, `Endereço`) VALUES
('Vendedor A', 'Rua X, 123'),
('Vendedor B', 'Avenida Y, 456'),
('Vendedor C', 'Praça Z, 789'),
('Vendedor D', 'Estrada W, 101'),
('Vendedor E', 'Alameda K, 202');

-- -----------------------------------------------------
-- Insert into `ProdutosPorVendedor` (requires existing IDs)
-- -----------------------------------------------------
INSERT INTO `ProdutosPorVendedor` (`Terceiro - vendedor_idTerceiro - vendedor`, `Produto_idProduto`, `quantidade`) VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 100),
(4, 4, 20),
(5, 5, 10);

-- -----------------------------------------------------
-- Insert into `ClientePF` (requires existing IDs)
-- -----------------------------------------------------
INSERT INTO `ClientePF` (`Cliente_idCliente`, `PF_CPF`) VALUES
(1, '12345678901'),
(2, '98765432109'),
(3, '45678912301'),
(4, '32165498701'),
(5, '65432198701');

-- -----------------------------------------------------
-- Insert into `ClientePJ` (requires existing IDs)
-- -----------------------------------------------------
INSERT INTO `ClientePJ` (`Cliente_idCliente`, `PJ_CNPJ`) VALUES
(1, '12345678901234'),
(2, '98765432109876'),
(3, '45678912301234'),
(4, '32165498701234'),
(5, '65432198701234');

-- -----------------------------------------------------
-- Insert into `Pagamento`
-- -----------------------------------------------------
INSERT INTO `Pagamento` (`Método de pagamento`) VALUES
('Cartão de Crédito'),
('Boleto'),
('Pix'),
('Cartão de Débito'),
('Transferência');

-- -----------------------------------------------------
-- Insert into `PagamentoCliente` (requires existing IDs)
-- -----------------------------------------------------
INSERT INTO `PagamentoCliente` (`Pagamento_idPagamento`, `Cliente_idCliente`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- -----------------------------------------------------
-- Insert into `CartãoCrédito`
-- -----------------------------------------------------
INSERT INTO `CartãoCrédito` (`Bandeira`, `Código`, `Validade`) VALUES
('Visa', 123456, '2025-12-01'),
('Mastercard', 789012, '2026-11-01'),
('Elo', 345678, '2024-10-01'),
('Amex', 901234, '2027-09-01'),
('Hipercard', 567890, '2025-08-01');

-- -----------------------------------------------------
-- Insert into `Cartões` (requires existing IDs)
-- -----------------------------------------------------
INSERT INTO `Cartões` (`Cartão de Crédito_idCartão de Crédito`, `Pagamento_idPagamento`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- -----------------------------------------------------
-- Insert into `Endereço`
-- -----------------------------------------------------
INSERT INTO `Endereço` (`Rua`, `Número`, `Cidade`, `Estado`, `CEP`) VALUES
('Rua das Flores', '123', 'São Paulo', 'SP', '01234567'),
('Avenida Paulista', '456', 'Rio de Janeiro', 'RJ', '09876543'),
('Praça da Sé', '789', 'Curitiba', 'PR', '12345678'),
('Rua 25 de Março', '101', 'Belo Horizonte', 'MG', '23456789'),
('Alameda Santos', '202', 'Porto Alegre', 'RS', '34567890');

-- -----------------------------------------------------
-- Insert into `EndereçoPF` (requires existing IDs)
-- -----------------------------------------------------
INSERT INTO `EndereçoPF` (`Endereço_idEndereço`, `PF_idPF`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- -----------------------------------------------------
-- Insert into `EndereçoPJ` (requires existing IDs)
-- -----------------------------------------------------
INSERT INTO `EndereçoPJ` (`PJ_idPJ`, `Endereço_idEndereço`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- -----------------------------------------------------
-- Insert into `category`
-- -----------------------------------------------------
INSERT INTO `category` (`category_id`, `name`) VALUES
(1, 'Eletrônicos'),
(2, 'Vestuário'),
(3, 'Alimentos'),
(4, 'Livros'),
(5, 'Esportes');
