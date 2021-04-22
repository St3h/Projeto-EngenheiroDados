SELECT
tb2.nome AS biblioteca,
ROUND(SUM(tb1.valor),2) AS faturamento
FROM multas AS tb1
JOIN bibliotecas tb2 ON (tb2.codigo_biblioteca = tb1.codigo_biblioteca)
GROUP BY tb2.nome;