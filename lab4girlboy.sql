create database lesson2;
use lesson2;
create table boyfriend(
	b_id int primary key auto_increment,
    b_name varchar(50)
);
create table girlfriend(
	g_id int primary key auto_increment,
    g_name varchar(50),
    b_id INT,
    FOREIGN KEY (b_id) REFERENCES boyfriend(b_id)
);
INSERT INTO boyfriend (b_id, b_name) VALUES
(1, 'Шинэбаяр'),
(2, 'Мэндбаатар'),
(3, 'Буянхишиг'),
(4, 'Хатан-Илд'),
(5, 'Анар');
INSERT INTO girlfriend (g_id, g_name, b_id) VALUES
(1, 'Марал', 1),
(2, 'Номин', 2),
(3, 'Хонгорзул', NULL),
(4, 'Чинцэцэг', NULL),
(5, 'Санчирмаа', NULL),
(6, 'Ариунмаа', NULL),
(7, 'Анаржаргал', NULL);

SELECT 
    boyfriend.b_name AS 'bfname', girlfriend.g_name AS 'gfname'
FROM
    boyfriend
        INNER JOIN
    girlfriend ON boyfriend.b_id = girlfriend.b_id;

SELECT 
    boyfriend.b_name AS 'bfname', 
    girlfriend.g_name AS 'gfname'
FROM boyfriend
LEFT JOIN girlfriend ON boyfriend.b_id = girlfriend.b_id;

SELECT 
    boyfriend.b_name AS 'bfname', 
    girlfriend.g_name AS 'gfname'
FROM boyfriend
RIGHT JOIN girlfriend ON boyfriend.b_id = girlfriend.b_id;

SELECT b_name AS 'bfname', g_name AS 'gfname'
FROM boyfriend
LEFT JOIN girlfriend ON boyfriend.b_id = girlfriend.b_id
UNION
SELECT b_name AS 'bfname', g_name AS 'gfname'
FROM boyfriend
RIGHT JOIN girlfriend ON boyfriend.b_id = girlfriend.b_id;

SELECT boyfriend.b_id, boyfriend.b_name
FROM boyfriend
LEFT JOIN girlfriend ON boyfriend.b_id = girlfriend.b_id
WHERE girlfriend.b_id IS NULL;

SELECT g_id, g_name
FROM girlfriend
WHERE b_id IS NULL;
