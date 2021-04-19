ALTER TABLE `vkontakte`.`users` 
ADD COLUMN `is_deleted` BIT NOT NULL DEFAULT 0 AFTER `is_deleted`;
