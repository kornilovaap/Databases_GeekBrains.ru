-- MySQL Workbench Synchronization
-- Generated: 2020-09-29 11:25
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: v

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `vk`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(245) NOT NULL COMMENT 'имя',
  `lastname` VARCHAR(245) NOT NULL COMMENT 'фамилия',
  `email` VARCHAR(245) NOT NULL,
  `phone` BIGINT(11) NOT NULL COMMENT 'телефон',
  `password_hash` CHAR(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  INDEX `firstname_lastname_idx` (`lastname` ASC, `firstname` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'пользователи';

CREATE TABLE IF NOT EXISTS `vk`.`profiles` (
  `users_id` INT(11) NOT NULL,
  `gender` ENUM('m', 'f', 'x') NOT NULL,
  `birthday` DATE NOT NULL,
  `location` VARCHAR(245) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  INDEX `fk_profiles_users_idx` (`users_id` ASC) VISIBLE,
  PRIMARY KEY (`users_id`),
  CONSTRAINT `fk_profiles_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `vk`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `vk`.`friend_requests` (
  `from_user_id` INT(11) NOT NULL,
  `to_user_id` INT(11) NOT NULL,
  `status` TINYINT(1) UNSIGNED NOT NULL COMMENT 'статус: 0 - запрос, 1 - подтвержден, 2 - отклонен',
  INDEX `fk_friend_requests_users1_idx` (`from_user_id` ASC) VISIBLE,
  INDEX `fk_friend_requests_users2_idx` (`to_user_id` ASC) VISIBLE,
  PRIMARY KEY (`from_user_id`, `to_user_id`),
  CONSTRAINT `fk_friend_requests_users1`
    FOREIGN KEY (`from_user_id`)
    REFERENCES `vk`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friend_requests_users2`
    FOREIGN KEY (`to_user_id`)
    REFERENCES `vk`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `vk`.`messages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` INT(11) NOT NULL,
  `to_user_id` INT(11) NOT NULL,
  `text` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`id`),
  INDEX `fk_messages_users1_idx` (`from_user_id` ASC) VISIBLE,
  INDEX `fk_messages_users2_idx` (`to_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`from_user_id`)
    REFERENCES `vk`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_users2`
    FOREIGN KEY (`to_user_id`)
    REFERENCES `vk`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `vk`.`communities` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NOT NULL,
  `admin_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_communities_users1_idx` (`admin_id` ASC) VISIBLE,
  CONSTRAINT `fk_communities_users1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `vk`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `vk`.`users_communities` (
  `community_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  INDEX `fk_users_communities_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_users_communities_communities1_idx` (`community_id` ASC) VISIBLE,
  PRIMARY KEY (`community_id`, `user_id`),
  CONSTRAINT `fk_users_communities_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `vk`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_communities_communities1`
    FOREIGN KEY (`community_id`)
    REFERENCES `vk`.`communities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `vk`.`media_types` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `vk`.`media` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `media_type_id` INT(11) NOT NULL,
  `text` TEXT NULL DEFAULT NULL,
  `file` BLOB NULL DEFAULT NULL COMMENT '/files/img/01.jpg',
  `size` INT(11) NULL DEFAULT NULL,
  `metadata` JSON NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_media_media_types1_idx` (`media_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_media_media_types1`
    FOREIGN KEY (`media_type_id`)
    REFERENCES `vk`.`media_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `vk`.`photo_albums` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NOT NULL,
  `decs` TEXT NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_photo_albums_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_photo_albums_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `vk`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `vk`.`photos` (
  `id` INT(11) NOT NULL,
  `album_id` INT(11) NOT NULL,
  `media_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_photos_photo_albums1_idx` (`album_id` ASC) VISIBLE,
  INDEX `fk_photos_media1_idx` (`media_id` ASC) VISIBLE,
  CONSTRAINT `fk_photos_photo_albums1`
    FOREIGN KEY (`album_id`)
    REFERENCES `vk`.`photo_albums` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_photos_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `vk`.`media` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
