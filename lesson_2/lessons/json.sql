ALTER TABLE tbl ADD collect JSON;  --добавили столбец джейсон
DESCRIBE tbl;
>>> 
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| id      | int unsigned | NO   |     | NULL    |       |
| collect | json         | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+

INSERT INTO tbl VALUES(1, '{"first": "Hello", "second": "World"}');  -- добавили значения
SELECT * FROM tbl;
>>>
+----+---------------------------------------+
| id | collect                               |
+----+---------------------------------------+
|  1 | {"first": "Hello", "second": "World"} |
+----+---------------------------------------+

SELECT collect->>"$.first" FROM tbl;  --вызов по ключам
+---------------------+
| collect->>"$.first" |
+---------------------+
| Hello               |
+---------------------+

SELECT collect->>"$.second" FROM tbl;
+----------------------+
| collect->>"$.second" |
+----------------------+
| World                |
+----------------------+
     
