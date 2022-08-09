-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
--QUERY 1
SELECT
  pd.id id,
  pd.status status,
  pd.cliente_id,
  pdt.id id,
  pdt.nome nome,
  pdt.tipo tipo,
  pdt.preco preço,
  pdt.pts_de_lealdade pontos_de_lealdade_do_produto
FROM
  produtos_pedidos pp 
JOIN
  pedidos pd 
ON
  pd.id=pp.pedido_id
JOIN
  produtos pdt
ON
  pp.produto_id=pdt.id; 
-- 2)
--QUERY 2
SELECT
  pp.pedido_id id
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
WHERE
  pdt.nome ILIKE 'FRITAS'; 
-- 3)
--QUERY 3
SELECT
  cl.nome gostam_de_fritas
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
  cl.id=pd.cliente_id
WHERE
  pdt.nome ILIKE 'FRITAS'; 
-- 4)
--QUERY 4
SELECT
 SUM(pdt.preco)
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
  cl.id=pd.cliente_id
WHERE
  cl.nome ILIKE 'laura'; 
-- 5)
--QUERY 5
SELECT
  pdt.nome,
  COUNT(pp.produto_id) 
FROM
  produtos_pedidos pp
JOIN
  produtos pdt
ON
  pp.produto_id=pdt.id
GROUP BY 
  pdt.nome
ORDER BY 
  pdt.nome ;
