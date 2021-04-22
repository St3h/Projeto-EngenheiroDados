CREATE TABLE AUTOR
(
    codigo_autor character varying (10) NOT NULL,
    autor character varying (100) NOT NULL,
    constraint autor_pk primary key (codigo_autor)
);

CREATE TABLE LIVRO
(
    codigo_livro integer NOT NULL,
    codigo_autor character varying (10) NOT NULL,
    titulo character varying (150) NOT NULL,
    assunto1 character varying (50) NOT NULL,
    assunto2 character varying (50) NOT NULL,
    assunto3 character varying (50) NOT NULL,
    constraint livro_pk primary key (codigo_livro)
);

CREATE TABLE SITUACAO
(
    codigo_situacao integer NOT NULL,
    descricao character varying (20) NOT NULL,
    constraint situacao_pk primary key (codigo_situacao)
);

CREATE TABLE EXEMPLAR
(
    codigo_exemplar integer NOT NULL,
    situacao integer NOT NULL,
    codigo_livro integer NOT NULL,
    codigo_biblioteca integer NOT NULL,
    ano integer NOT NULL,
    editora character varying(50) NOT NULL,
    constraint exemplar_pk primary key (codigo_exemplar)
);

CREATE TABLE BIBLIOTECA
(
    codigo_biblioteca integer NOT NULL,
    codigo_cidade integer NOT NULL,
    estado character (2) NOT NULL,
    nome character varying (50) NOT NULL,
    constraint biblioteca_pk primary key (codigo_biblioteca)
);

CREATE TABLE CIDADE
(
    codigo_cidade integer NOT NULL,
    nome_cidade character varying (50) NOT NULL,
    estado character (2) NOT NULL,
    constraint cidade_pk primary key (codigo_cidade)
);

CREATE TABLE EMPRESTIMO 
(
    codigo_emprestimo bigint NOT NULL,
    codigo_exemplar1 integer NOT NULL,
    codigo_exemplar2 integer,
    codigo_exemplar3 integer,
    codigo_exemplar4 integer,
    cpf_associado bigint NOT NULL,
    codigo_biblioteca integer NOT NULL,
    data_emprestimo date NOT NULL,
    prazo_devolucao date NOT NULL,
    data_devolucao date,
    codigo_multa integer,
    constraint emprestimo_pk primary key (codigo_emprestimo)
);

CREATE TABLE MULTA
(
    codigo_multa integer NOT NULL,
    codigo_emprestimo bigint NOT NULL,
    cpf_associado bigint NOT NULL,
    codigo_biblioteca integer NOT NULL,
    valor numeric (4,2) NOT NULL,
    data_pagamento date,
    constraint multa_pk primary key (codigo_multa)
);

CREATE TABLE ASSOCIADO
(
    cpf bigint NOT NULL,
    codigo_cidade integer NOT NULL,
    nome character varying (100) NOT NULL,
    bairro character varying (50) NOT NULL,
    estado character (2) NOT NULL,
    telefone bigint NOT NULL,
    email text NOT NULL,
    data_nascimento date NOT NULL,
    constraint associado_pk primary key (cpf)
);