-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes
  (nome, lealdade)
VALUES
  ('Georgia',0);

-- 2)
INSERT INTO pedidos 
  (status, cliente_id)
VALUES
  ('Recebido', 6);

-- 3)
INSERT INTO produtos_pedidos 
  (pedido_id,produto_id)
VALUES
  (6,1),
  (6,2),
  (6,6),
  (6,8),
  (6,8);

-- Leitura

-- 1)
SELECT
  cl.id,
  cl.nome,
  cl.lealdade,
  pd.id id,
  pd.status status,
  pd.cliente_id,
  pdt.id id,
  pdt.nome nome,
  pdt.tipo tipo,
  pdt.preco preço,
  pdt.pts_de_lealdade
FROM
  produtos_pedidos pp 
JOIN
  pedidos pd 
ON
  pd.id=pp.pedido_id
JOIN
  produtos pdt
ON
  pp.produto_id=pdt.id
JOIN
  clientes cl
ON
  pd.cliente_id=cl.id  
WHERE 
  cl.nome ILIKE ('GEORGIA')
 ;  

-- Atualização

-- 1)
UPDATE clientes 
SET lealdade=(SELECT
  SUM(pdt.pts_de_lealdade)
FROM
  produtos_pedidos pp 
JOIN
  pedidos pd 
ON
  pd.id=pp.pedido_id
JOIN
  produtos pdt
ON
  pp.produto_id=pdt.id
JOIN
  clientes cl
ON
  pd.cliente_id=cl.id  
WHERE 
  cl.nome ILIKE ('GEORGIA')
   )
WHERE clientes.nome ILIKE('GEORGIA');


-- Deleção

-- 1)
DELETE FROM 
  clientes
WHERE 
  nome ILIKE 'georgia';

