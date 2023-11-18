-- ACADEMIC_SYS PROJET
-- DB: ACADEMIC_SYS


-- COURSES TABLE
CREATE TABLE course(
    courseId INT PRIMARY KEY AUTO_INCREMENT,
    courseName VARCHAR(90) NOT NULL,
    courseType VARCHAR(50) NOT NULL
);

-- STUDENTS TABLE
CREATE TABLE student(
    id INT PRIMARY KEY AUTO_INCREMENT,
    studentNumber INT NOT NULL UNIQUE,
    studentName VARCHAR(100) NOT NULL,
    courseId INT,
    	CONSTRAINT fk_student_course FOREIGN KEY(id)
    	REFERENCES course(courseId)
);

-- TABELA DOS USUÁRIOS DO SISTEMA
CREATE TABLE user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    user VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL
);


-- ALGUNS INSERTS....
INSERT INTO course (courseName, courseType)
VALUES ('Course 1', 'Free Course');

INSERT INTO course (courseName, courseType)
VALUES ('Computer Science', 'Bachelor of Science');

INSERT INTO course (courseName, courseType)
VALUES ('Flutter', 'Module');

INSERT INTO course (courseName, courseType)
VALUES ('TikTok dance', 'PhD');

INSERT INTO course (courseName, courseType)
VALUES ('Music', 'Master');

INSERT INTO student(studentNumber, studentName, courseId)
VALUES (1234, 'Thiago', 2);

INSERT INTO student(studentNumber, studentName, courseId)
VALUES (122, 'Traue', 3);

INSERT INTO student(studentNumber, studentName, courseId)
VALUES (3211, 'Mario', 1);

INSERT INTO student(studentNumber, studentName, courseId)
VALUES (665, 'Little Prince', 4);

INSERT INTO student(studentNumber, studentName, courseId)
VALUES (333, 'Shrek', 1);

INSERT INTO student(studentNumber, studentName, courseId)
VALUES (444, 'Super man', 1);

INSERT INTO user (user, password)
VALUES ('traue', '10a9c136d796bab18d3e144092a4f20a'); --Senha123 (MD5)

INSERT INTO user (user, password)
VALUES ('test', '10a9c136d796bab18d3e144092a4f20a'); --Senha123 (MD5)

