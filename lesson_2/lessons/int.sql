CREATE TABLE tbl (id INT(8) ZEROFILL);  -- добавляет нули вместо пробелов
INSERT INTO tbl VALUES (5);
INSERT INTO tbl VALUES (500000);
select * from tbl;
>>>    
+----------+
| id       |
+----------+
| 00000005 |
| 00500000 |
+----------+


INSERT INTO tbl VALUES (500000000000000);  -- слишком большое значение, т.к. в инт у нас 8
>>> ERROR 1264 (22003): Out of range value for column 'id' at row 1
     
