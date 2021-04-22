SELECT
ano AS biblioteca,
nome AS nome,
count(ano) AS total
FROM
(SELECT 
tb1.codigo_biblioteca,
tb3.nome,
count(year(tb2.prazo_devolucao)) AS frequencia,
year(tb2.prazo_devolucao) AS ano
FROM multas tb1
JOIN emprestimos tb2 ON (tb2.codigo_emprestimo = tb1.codigo_emprestimo)
JOIN bibliotecas tb3 ON (tb3.codigo_biblioteca = tb1.codigo_biblioteca)
GROUP BY tb2.prazo_devolucao, tb1.codigo_biblioteca, tb3.nome) AS rkng
GROUP BY ano, codigo_biblioteca, nome ORDER BY ano, total;