DROP TABLE IF EXISTS tbl;
CREATE TABLE tbl (
  name CHAR(10) DEFAULT 'anonymous',
  description VARCHAR(255)
);
INSERT INTO tbl VALUES(DEFAULT, 'Новый пользователь');
INSERT INTO tbl VALUES('Anna', 'Новый пользователь');
SELECT * FROM tbl;
>>>
+-----------+--------------------+
| name      | description        |
+-----------+--------------------+
| anonymous | Новый пользователь |
| Anna      | Новый пользователь |
+-----------+--------------------+
    
INSERT INTO tbl VALUES('Очень длинное имя пользователя', 'Еще один пользователь');
>>> ERROR 1406 (22001): Data too long for column 'name' at row 1
    
