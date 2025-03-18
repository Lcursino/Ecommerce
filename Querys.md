
---

### **1. Recuperações simples com SELECT**
**Pergunta:** Quais são os nomes e CNPJs de todos os fornecedores?
```sql
SELECT 
    `Razão Social`, 
    CNPJ 
FROM 
    Fornecedor;
```

---

### **2. Filtros com WHERE**
**Pergunta:** Quais produtos têm valor maior que R$ 1000?
```sql
SELECT 
    idProduto, 
    Descrição, 
    Valor 
FROM 
    Produto 
WHERE 
    Valor > 1000;
```

---

### **3. Atributos derivados (expressões)**
**Pergunta:** Qual o valor total de cada pedido (quantidade × valor do produto)?
```sql
SELECT 
    p.idPedido,
    pr.Descrição AS Produto,
    (r.quantidade * pr.Valor) AS TotalValor
FROM 
    Pedido p
JOIN 
    RelaçãoProdutoPedido r ON p.idPedido = r.Pedido_idPedido
JOIN 
    Produto pr ON r.Produto_idProduto = pr.idProduto;
```

---

### **4. Ordenação com ORDER BY**
**Pergunta:** Liste todos os clientes PF em ordem alfabética pelo nome.
```sql
SELECT 
    c.Nome AS Cliente, 
    pf.CPF 
FROM 
    Cliente c
JOIN 
    ClientePF cp ON c.idCliente = cp.Cliente_idCliente
JOIN 
    PF pf ON cp.PF_CPF = pf.CPF
ORDER BY 
    c.Nome ASC;
```

---

### **5. Filtros em grupos (HAVING)**
**Pergunta:** Quais clientes fizeram mais de 2 pedidos?
```sql
SELECT 
    c.Nome, 
    COUNT(p.idPedido) AS TotalPedidos
FROM 
    Cliente c
JOIN 
    Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY 
    c.idCliente
HAVING 
    TotalPedidos > 2;
```

---

### **6. Junções entre tabelas**
**Pergunta:** Relação de produtos, fornecedores e estoque:
```sql
SELECT 
    pr.Descrição AS Produto,
    f.`Razão Social` AS Fornecedor,
    e.Local AS Estoque,
    ppe.quantidade AS QuantidadeEmEstoque
FROM 
    Produto pr
JOIN 
    OrigemProduto op ON pr.idProduto = op.Produto_idProduto
JOIN 
    Fornecedor f ON op.Fornecedor_idFornecedor = f.idFornecedor
JOIN 
    ProdutoPorEstoque ppe ON pr.idProduto = ppe.Produto_idProduto
JOIN 
    Estoque e ON ppe.Estoque_idEstoque = e.idEstoque;
```

---

### **7. Pergunta complexa (combina múltiplas cláusulas)**
**Pergunta:** Vendedores que também são fornecedores (se houver):
```sql
SELECT 
    v.`Razão Social` AS Vendedor, 
    f.CNPJ AS CNPJ_Fornecedor
FROM 
    VendederMarketplace v
LEFT JOIN 
    Fornecedor f ON v.`Razão Social` = f.`Razão Social`
WHERE 
    f.CNPJ IS NOT NULL;
```

---

### **8. Exemplo de HAVING + GROUP BY**
**Pergunta:** Fornecedores com mais de 3 produtos cadastrados:
```sql
SELECT 
    f.`Razão Social`, 
    COUNT(op.Produto_idProduto) AS TotalProdutos
FROM 
    Fornecedor f
JOIN 
    OrigemProduto op ON f.idFornecedor = op.Fornecedor_idFornecedor
GROUP BY 
    f.idFornecedor
HAVING 
    TotalProdutos > 3;
```

---

### **9. Ordenação e filtro combinados**
**Pergunta:** Entregas da empresa "Correios" ordenadas por data de previsão:
```sql
SELECT 
    Empresa, 
    `Previsão de entrega`, 
    Status
FROM 
    Entrega
WHERE 
    Empresa = 'Correios'
ORDER BY 
    `Previsão de entrega` DESC;
```

---

### **10. Atributo derivado com função de data**
**Pergunta:** Pagamentos realizados no último mês:
```sql
SELECT 
    `Método de pagamento`, 
    `Data do pagamento`
FROM 
    Pagamento
WHERE 
    `Data do pagamento` >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
```

---

### **Diretrizes atendidas:**
- `SELECT` simples e com junções
- `WHERE` para filtrar registros
- Atributos derivados (ex: `TotalValor`)
- `ORDER BY` para ordenação
- `HAVING` para filtrar grupos
- Junções entre 3+ tabelas
- Combinação de múltiplas cláusulas

