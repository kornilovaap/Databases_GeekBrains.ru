create database  if not exists shop; /*создать БД, если не существует*/
show databases;   /*показать все бд*/
show databases like 'datadir';  /*найти путь к папке с базами*/
drop database if exsists 'shop';  /*удалить бд. если существует*/
use shop;  /*выбрать бд*/
show tables;  /*показать все таблицы выбранной бд*/
select mysql.User.User from mysql.User;  /*выбрать столбец из таблицы конкретно бд*/
create table if not exists user (k Int);  /*создать таблицу, указываем парпметр столбца*/
describe users;  /*описать структуру таблицы*/
     
