/*создаем таблицу с нулевым значением стобца*/
CREATE TABLE tbl (id INT UNSIGNED);
INSERT INTO tbl VALUES();
SELECT * FROM tbl;
>>>>
+------+
| id   |
+------+
| NULL |
+------+
    
ALTER TABLE tbl CHANGE id id INT UNSIGNED NOT NULL;  --меняем значение стобца на Нуль
ERROR 1138 (22004): Invalid use of NULL value  -- ошибка, так как унас уже есть в таблице Нуль

TRUNCATE tbl;  -- очисили таблицу

ALTER TABLE tbl CHANGE id id INT UNSIGNED NOT NULL; -- заново поробовали изменить столбец
INSERT INTO tbl VALUES(); -- теперь уже не получится втсавить пустье значение
>>> ERROR 1364 (HY000): Field 'id' doesn't have a default value
    
