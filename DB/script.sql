-- PROJETO SIS_ACADEMICO
-- BANCO: SIS_ACADEMICO_2N


-- TABLEA DOS CURSOS
CREATE TABLE curso(
    idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nomeCurso VARCHAR(90) NOT NULL,
    tipoCurso VARCHAR(50) NOT NULL
);

-- TABELA DOS ALUNOS
CREATE TABLE aluno(
    idAluno INT PRIMARY KEY AUTO_INCREMENT,
    ra INT NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    idCurso INT,
    	CONSTRAINT fk_aluno_curso FOREIGN KEY(idCurso)
    	REFERENCES curso(idCurso)
);

-- TABELA DOS USUÁRIOS DO SISTEMA
CREATE TABLE usuario(
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(20) NOT NULL UNIQUE,
    senha VARCHAR(128) NOT NULL
);


-- ALGUNS INSERTS....
INSERT INTO curso (nomeCurso, tipoCurso)
VALUES ('TADS', 'Tecnologo');

INSERT INTO curso (nomeCurso, tipoCurso)
VALUES ('Ciência da Computação', 'Bacharelado');

INSERT INTO curso (nomeCurso, tipoCurso)
VALUES ('Redes', 'Tecnólogo');

INSERT INTO curso (nomeCurso, tipoCurso)
VALUES ('Dancinha do TikTok', 'Doutorado');

INSERT INTO curso (nomeCurso, tipoCurso)
VALUES ('Física', 'Livre');

INSERT INTO aluno(ra, nome, idCurso)
VALUES (1234, 'Thiago', 2);

INSERT INTO aluno(ra, nome, idCurso)
VALUES (122, 'Mia', 3);

INSERT INTO aluno(ra, nome, idCurso)
VALUES (3211, 'Bla', 1);

INSERT INTO aluno(ra, nome, idCurso)
VALUES (666, 'Luci', 4);

INSERT INTO aluno(ra, nome, idCurso)
VALUES (333, 'Blé', 1);

INSERT INTO aluno(ra, nome, idCurso)
VALUES (444, 'Marcio Klein', 1);

INSERT INTO usuario (usuario, senha)
VALUES ('traue', '10a9c136d796bab18d3e144092a4f20a'); --Senha123 (em MD5)

INSERT INTO usuario (usuario, senha)
VALUES ('mia', '10a9c136d796bab18d3e144092a4f20a'); --Senha123 (em MD5)