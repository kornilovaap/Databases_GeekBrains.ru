/* В учебной базе данных shop присутствует таблица catalogs. 
Пусть в базе данных sample имеется таблица cat, в которой могут присутствовать строки с такими же первичными ключами. 
Напишите запрос, который копирует данные из таблицы catalogs в таблицу cat, 
при этом для записей с конфликтующими первичными ключами в таблице cat должна производиться замена значениями из таблицы catalogs.*/

use shop;
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет магазина';

use example;
DROP TABLE IF EXISTS cat;
CREATE TABLE cat (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) 
) ;

insert into cat value (1, 'TV');

INSERT INTO cat
	SELECT * FROM shop.catalogs;
SELECT * FROM cat;
