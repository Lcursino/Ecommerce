
**README - Sistema de Gerenciamento de E-commerce**  
*Projeto de banco de dados para um sistema de e-commerce com MySQL*

---

### **1. Visão Geral do Projeto**  
Este projeto implementa um banco de dados relacional para um sistema de e-commerce, modelado para gerenciar:  
- **Clientes** (PF e PJ)  
- **Pedidos** e entregas  
- **Produtos** e estoque  
- **Fornecedores** e vendedores terceiros  
- **Pagamentos** e métodos (cartão de crédito, Pix, etc.)  

O modelo segue boas práticas de normalização e relacionamentos via chaves estrangeiras.

---

### **2. Diagrama Entidade-Relacionamento (DER)**  
![ecommerce](https://github.com/user-attachments/assets/cd0597ee-664a-4d4f-9343-f267b7f572fc)

---

### **3. Configuração do Ambiente**  
**Pré-requisitos:**  
- MySQL Server (versão 8.0+)  
- MySQL Workbench (recomendado)  

**Passos para execução:**  
1. **Criar o banco de dados:**  
   ```sql
   CREATE DATABASE mydb;
   ```

2. **Executar o script SQL de schema:**  
   ```bash
   mysql -u root -p mydb < schema.sql
   ```

3. **Inserir dados fictícios (opcional):**  
   ```bash
   mysql -u root -p mydb < insert_data.sql
   ```

---

### **4. Estrutura do Banco de Dados**  
**Principais Tabelas:**  
| Tabela               | Descrição                                  | Chave Primária                     |
|----------------------|--------------------------------------------|-------------------------------------|
| `Cliente`            | Dados básicos dos clientes                | `idCliente`                        |
| `PF`/`PJ`            | Detalhes de clientes (PF e PJ)            | `idPF`/`idPJ` + `CPF`/`CNPJ`       |
| `Pedido`             | Pedidos dos clientes                      | `idPedido` + `Cliente_idCliente`   |
| `Produto`            | Catálogo de produtos                      | `idProduto`                        |
| `Fornecedor`         | Fornecedores de produtos                  | `idFornecedor`                     |
| `Pagamento`          | Métodos de pagamento                      | `idPagamento`                      |

**Relacionamentos-chave:**  
- `Cliente` → `Pedido` (1:N)  
- `Produto` → `Pedido` (N:N via `RelaçãoProdutoPedido`)  
- `Fornecedor` → `Produto` (N:N via `OrigemProduto`)  

---

### **5. Consultas Exemplo**  
**a. Listar clientes PF com pedidos:**  
```sql
SELECT 
    c.Nome AS Cliente, 
    p.`Descrição` AS Pedido, 
    pe.Status 
FROM 
    Cliente c
JOIN 
    Pedido pe ON c.idCliente = pe.Cliente_idCliente
JOIN 
    RelaçãoProdutoPedido rpp ON pe.idPedido = rpp.Pedido_idPedido
JOIN 
    Produto p ON rpp.Produto_idProduto = p.idProduto;
```

**b. Produtos e seus fornecedores:**  
```sql
SELECT 
    pr.Descrição AS Produto, 
    f.`Razão Social` AS Fornecedor
FROM 
    Produto pr
JOIN 
    OrigemProduto op ON pr.idProduto = op.Produto_idProduto
JOIN 
    Fornecedor f ON op.Fornecedor_idFornecedor = f.idFornecedor;
```

**c. Total de vendas por cliente:**  
```sql
SELECT 
    c.Nome, 
    SUM(pr.Valor * r.quantidade) AS TotalGasto
FROM 
    Cliente c
JOIN 
    Pedido p ON c.idCliente = p.Cliente_idCliente
JOIN 
    RelaçãoProdutoPedido r ON p.idPedido = r.Pedido_idPedido
JOIN 
    Produto pr ON r.Produto_idProduto = pr.idProduto
GROUP BY 
    c.idCliente
ORDER BY 
    TotalGasto DESC;
```

---

### **6. Observações Importantes**  
- **ENUMs:**  
  - `Entrega.Status`: `('enviado', 'entregue', 'retornado')`  
  - `Pedido.Status`: `('pendente', 'aprovado', 'cancelado')`  

- **Campos únicos:**  
  - `PF.CPF` e `PJ.CNPJ` possuem índices únicos.  

- **Dados sensíveis:**  
  - Senhas e informações financeiras não são armazenadas em claro (ajuste conforme necessidade).  

---


