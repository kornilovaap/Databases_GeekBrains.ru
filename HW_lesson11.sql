/*Создайте таблицу logs типа Archive. 
Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, 
название таблицы, идентификатор первичного ключа и содержимое поля name.*/
CREATE TABLE `shop`.`logs` (
  `apdate_at` DATETIME NOT NULL,
  `tbl_name` VARCHAR(45) NOT NULL,
  `id` BIGINT NOT NULL,
  `description_name` VARCHAR(245) NOT NULL)
ENGINE = ARCHIVE;

-- для USERS
DROP TRIGGER IF EXISTS `shop`.`users_AFTER_INSERT`;
DELIMITER $$
USE `vk`$$
CREATE DEFINER = CURRENT_USER TRIGGER `shop`.`users_AFTER_INSERT` AFTER INSERT ON `users` FOR EACH ROW
BEGIN
  insert into `shop`.`logs` (apdate_at,tbl_name,id,description_name)
  values (now(), `users`, new.id, new.name);
END$$
DELIMITER ;

-- для catalogs
DROP TRIGGER IF EXISTS `shop`.`catalogs_AFTER_INSERT`;
DELIMITER $$
USE `shop`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `catalogs_AFTER_INSERT` AFTER INSERT ON `catalogs` FOR EACH ROW 
BEGIN
  insert into `shop`.`logs` (apdate_at, tbl_name, id, description_name)
  values (now(), `catalogs`, new.id, new.name);
END$$
DELIMITER ;

-- для products
DROP TRIGGER IF EXISTS `shop`.`products_AFTER_INSERT`;
DELIMITER $$
USE `shop`$$
CREATE DEFINER = CURRENT_USER TRIGGER `shop`.`products_AFTER_INSERT` AFTER INSERT ON `products` FOR EACH ROW
BEGIN
 insert into `shop`.`logs` (apdate_at, tbl_name, id, description_name)
 values (now(), `products`, new.id, new.name);
END$$
DELIMITER ;


/*Создайте SQL-запрос, который помещает в таблицу users миллион записей.*/
USE `shop`;
DROP procedure IF EXISTS `insert_one_million`;

DELIMITER $$
USE `shop`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_one_million`()
BEGIN
 DECLARE i INT DEFAULT 1000000;
 DECLARE j INT DEFAULT 1;
 WHILE i > 0 DO
	INSERT INTO test(name, created_at) VALUES ( j, NOW());
	SET j = j + 1;
	SET i = i - 1;
 END WHILE;
END$$
DELIMITER ;

				  
				  
/*В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов*/
SADD ip '127.0.0.1'
						   
/*При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса пользователя по его имени.*/
set mail@mail.ru name 
set name mail@mail.ru
get mail@mail.ru 
get name 

/*Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.*/
db.shop.insert({category: 'Процессоры'})
db.shop.insert({category: 'Мат. платы'})
db.shop.update({category: 'Процессоры'}, {$set: { products:['пр1', 'пр2', 'пр3'] }})
db.shop.update({category: 'Мат. платы'}, {$set: { products:['мп1', 'мп2', 'мп3'] }})						   
						   
