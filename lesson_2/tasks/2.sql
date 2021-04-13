/* 2) Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample */

create database sample; -- создали бд для развертывания дампа
\q -- вышли из mysql
mysqldump example > example.sql -- создали дамп
mysql sample < example.sql -- развернули дамп в бд

mysql -- вернулись в утилиту
use sample; -- выбрали базу, в кот развернули дамп
show tables; 
select * from users; -- проверили, что всё скопировалось верно

