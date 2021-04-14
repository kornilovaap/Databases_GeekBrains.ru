/*Пусть в таблице catalogs базы данных shop в строке name могут находиться пустые строки и поля принимающие значение NULL.
Напишите запрос, который заменяет все такие поля на строку ‘empty’. 
Помните, что на уроке мы установили уникальность на поле name. Возможно ли оставить это условие? Почему?
*/
use shop;

truncate catalogs;
INSERT INTO catalogs VALUES
  (DEFAULT, 'Процессоры'),
  (DEFAULT, 'Мат.платы'),
  (DEFAULT, 'Видеокарты');
  
insert into catalogs values 
	(null, null),
    (null, null),
    (null, null);
    
select * from catalogs;
+----+------------+
| id | name       |
+----+------------+
|  1 | Процессоры |
|  2 | Мат.платы  |
|  3 | Видеокарты |
|  4 | NULL       |
|  5 | NULL       |
|  6 | NULL       |
+----+------------+

update catalogs set name ='empty' where (name is null);
-- ERROR 1062 (23000): Duplicate entry 'empty' for key 'catalogs.unique_name'
/*из-за индекса уникальности запрос невыполним*/
     
