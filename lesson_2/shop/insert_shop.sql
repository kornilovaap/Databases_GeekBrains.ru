/* INSERT INTO catalogs (name) VALUES ('Процессоры');
INSERT INTO catalogs VALUES (0, 'Мат.платы');
INSERT INTO catalogs VALUES (NULL, 'Видекарты');  */

INSERT INTO catalogs VALUES
  (DEFAULT, 'Процессоры'),
  (DEFAULT, 'Мат.платы'),
  (DEFAULT, 'Видеокарты');
  
SELECT * FROM catalogs;
>>>
+----+------------+
| id | name       |
+----+------------+
|  1 | Процессоры |
|  2 | Мат.платы  |
|  3 | Видекарты  |
+----+------------+
