/* 3) Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы */

create database keydump; -- сделали пустую бд для будущего дампа
\q -- вышли из скуля, чтобы делать дамп
mysqldump --where="true limit 100" mysql help_keyword > qwerty.sql -- скопировали 
mysql keydump < qwerty.sql
-- ERROR 3723 (HY000) at line 25: The table 'help_keyword' may not be created in the reserved tablespace 'mysql'
-- я попробовала. не получилось (((
    
