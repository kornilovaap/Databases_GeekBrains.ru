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
    
