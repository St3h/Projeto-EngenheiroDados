SELECT
tb3.assunto AS assunto,
COUNT(tb3.assunto) AS total
FROM
(SELECT codigo_exemplar1 AS exemplar FROM emprestimos
UNION ALL
SELECT codigo_exemplar2 AS exemplar FROM emprestimos
UNION ALL
SELECT codigo_exemplar3 AS exemplar FROM emprestimos
UNION ALL
SELECT codigo_exemplar4 AS exemplar FROM emprestimos) tb1
JOIN exemplares tb2 ON (tb2.codigo_exemplar = tb1.exemplar)
JOIN
(SELECT assunto1 AS assunto, codigo_livro FROM livros
UNION ALL
SELECT assunto2 AS assunto, codigo_livro FROM livros
UNION ALL
SELECT assunto3 AS assunto, codigo_livro FROM livros) tb3 ON (tb2.codigo_livro = tb3.codigo_livro)
GROUP BY assunto ORDER BY total DESC;