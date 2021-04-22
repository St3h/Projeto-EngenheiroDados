SELECT
SUBSTRING(CAST(tb1.cpf AS char(11)), 9, 11) AS final_cpf, 
tb1.nome AS nome, 
COUNT(tb2.codigo_multa) AS multas 
FROM associados tb1
JOIN emprestimos tb2 on (tb1.cpf = tb2.cpf_associado)
GROUP BY tb1.cpf, tb1.nome ORDER BY multas DESC;