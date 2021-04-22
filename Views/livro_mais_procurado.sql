SELECT
tb3.titulo AS titulo,
COUNT(tb2.codigo_livro) AS frequencia
FROM (SELECT codigo_exemplar1 AS exemplares FROM emprestimos
UNION ALL 
SELECT codigo_exemplar2 AS exemplares FROM emprestimos
UNION ALL
SELECT codigo_exemplar3 AS exemplares FROM emprestimos
UNION ALL
SELECT codigo_exemplar4 AS exemplares FROM emprestimos
) tb1
JOIN exemplares tb2 ON (tb1.exemplares = tb2.codigo_exemplar)
JOIN livros tb3 ON (tb2.codigo_livro = tb3.codigo_livro)
GROUP BY tb2.codigo_livro, tb3.titulo ORDER BY frequencia DESC;