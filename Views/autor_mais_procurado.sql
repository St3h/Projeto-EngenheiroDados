SELECT
tb4.autor AS autor,
count(tb4.autor) AS total
FROM
(SELECT codigo_exemplar1 AS exemplares FROM emprestimos
UNION ALL 
SELECT codigo_exemplar2 AS exemplares FROM emprestimos
UNION ALL
SELECT codigo_exemplar3 AS exemplares FROM emprestimos
UNION ALL
SELECT codigo_exemplar4 AS exemplares FROM emprestimos
) tb1 
JOIN exemplares tb2 ON (tb2.codigo_exemplar = tb1.exemplares)
JOIN livros tb3 ON (tb3.codigo_livro = tb2.codigo_livro)
JOIN autores tb4 ON (tb4.codigo_autor = tb3.codigo_autor)
GROUP BY autor ORDER BY total DESC;