SELECT
tb2.nome AS nome,
count(tb1.cpf_associado) AS total
FROM
(SELECT cpf_associado, codigo_exemplar1 AS exemplares FROM emprestimos
UNION ALL 
SELECT cpf_associado, codigo_exemplar2 AS exemplares FROM emprestimos
UNION ALL
SELECT cpf_associado, codigo_exemplar3 AS exemplares FROM emprestimos
UNION ALL
SELECT cpf_associado, codigo_exemplar4 AS exemplares FROM emprestimos
) tb1
JOIN associados tb2 ON (tb1.cpf_associado = tb2.cpf)
GROUP BY cpf_associado, nome ORDER BY total DESC;