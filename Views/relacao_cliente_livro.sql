SELECT
tb3.nome AS nome,
tb5.titulo AS livro
FROM
(SELECT cpf_associado, codigo_exemplar1 AS exemplar FROM emprestimos
UNION ALL
SELECT cpf_associado, codigo_exemplar2 AS exemplar FROM emprestimos
UNION ALL
SELECT cpf_associado, codigo_exemplar3 AS exemplar FROM emprestimos
UNION ALL
SELECT cpf_associado, codigo_exemplar4 AS exemplar FROM emprestimos) tb2
JOIN associados tb3 ON (tb2.cpf_associado = tb3.cpf)
JOIN exemplares tb4 ON (tb4.codigo_exemplar = tb2.exemplar)
JOIN livros tb5 ON (tb5.codigo_livro = tb4.codigo_livro);