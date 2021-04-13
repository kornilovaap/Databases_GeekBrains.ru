DROP TABLE IF EXISTS tbl;
CREATE TABLE tbl (price DECIMAL(8,4));
INSERT INTO tbl VALUES (111.2);
select * from tbl;
>>>
+----------+
| price    |
+----------+
| 111.2000 |
+----------+
     
INSERT INTO tbl VALUES (10000.0);  --неправильный формат числа
>>>> ERROR 1264 (22003): Out of range value for column 'price' at row 1
    
