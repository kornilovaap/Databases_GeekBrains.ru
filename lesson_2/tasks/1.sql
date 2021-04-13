/* 1) Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name */

create database if not exists example; -- создали бд
show databases; -- проверили её наличие
 
use example; -- выбрали созданную бд для работы с  ней
create table users (id int unsigned not null, name varchar(255)); -- создали таблицу
show tables; -- проверили наличие созданной таблицы
describe users; -- проверили содержимое таблицы

insert into users values (1, 'Anna');
insert into users values (2, 'Ivan'); -- добавили пару строчек в таблицу
select * from users; -- проверили таблицу

/* 3) Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample */

create database sample; -- создали бд для развертывания дампа
\q -- вышли из mysql
mysqldump example > example.sql -- создали дамп
mysql sample < example.sql -- развернули дамп в бд

mysql -- вернулись в утилиту
use sample; -- выбрали базу, в кот развернули дамп
show tables; 
select * from users; -- проверили, что всё скопировалось верно

/* 4) Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы */

create database keydump; -- сделали пустую бд для будущего дампа
\q -- вышли из скуля, чтобы делать дамп
mysqldump --where="true limit 100" mysql help_keyword > qwerty.sql -- скопировали 
mysql keydump < qwerty.sql
-- ERROR 3723 (HY000) at line 25: The table 'help_keyword' may not be created in the reserved tablespace 'mysql'
-- я попробовала. не получилось (((
