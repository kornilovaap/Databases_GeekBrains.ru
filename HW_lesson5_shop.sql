/*Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем*/

UPDATE users SET created_at = NOW()
WHERE created_at IS NULL;
  
UPDATE users SET updated_at = NOW()
WHERE updated_at IS NULL;    



/*Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.*/
-- 1. Создаем таблицу с неправильными типами
DROP TABLE IF EXISTS users_hw;
CREATE TABLE users_hw (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at VARCHAR(255),
    updated_at VARCHAR(255)
 ) COMMENT = 'Пользователи';
 INSERT INTO users_hw (name, created_at, updated_at) VALUES
    ('Anna', '09.10.2020 15:09', '10.10.2020 10:10'),
    ('Roma', '08.10.2020 15:08', '11.10.2020 20:10'),
    ('Ivan', '07.10.2020 15:07', '12.10.2020 22:10');
-- 2. 
UPDATE users set created_at=STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'), updated_at=STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
ALTER TABLE users MODIFY created_at DATETIME, MODIFY updated_at DATETIME;


/*В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех */
insert into storehouses_products (value) values (11), (0),(0),(3),(5),(8);
sselect * from storehouses_products ORDER BY CASE WHEN value = 0 then 999999999 else value end;


/*Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий (may, august)*/
SELECT * FROM users WHERE DATE_FORMAT(birthday_at,'%M') in ('may', 'august');


/*Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.*/
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);


/*Подсчитайте средний возраст пользователей в таблице users.*/
select round(avg (TIMESTAMPDIFF(YEAR, birthday_at, NOW())), 0) as avg  from users;
                  
                  
 /*Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/
 select weekday (birthday_at) as weekday, count(*) as count -- дата рождения в виде номера дня недели и количество записей записей внутри каждого дня
from users
group by weekday
order by weekday;
                  
                  
/*Подсчитайте произведение чисел в столбце таблицы*/
