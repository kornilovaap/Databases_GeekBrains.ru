
CREATE TABLE `communities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_communities_users1_idx` (`admin_id`),
  CONSTRAINT `fk_communities_users1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ;

CREATE TABLE `friend_requests` (
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `status` tinyint unsigned NOT NULL COMMENT 'статус: 0 - запрос, 1 - подтвержден, 2 - отклонен',
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `fk_friend_requests_users1_idx` (`from_user_id`),
  KEY `fk_friend_requests_users2_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_requests_users1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friend_requests_users2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
);

CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `media_type_id` int NOT NULL,
  `text` text,
  `file` blob COMMENT '/files/img/01.jpg',
  `size` int DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_media_types1_idx` (`media_type_id`),
  CONSTRAINT `fk_media_media_types1` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ;


CREATE TABLE `media_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users1_idx` (`from_user_id`),
  KEY `fk_messages_users2_idx` (`to_user_id`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_users2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ;

CREATE TABLE `photo_albums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  `decs` text,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_albums_users1_idx` (`user_id`),
  CONSTRAINT `fk_photo_albums_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ;

CREATE TABLE `photos` (
  `id` int NOT NULL,
  `album_id` int NOT NULL,
  `media_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photos_photo_albums1_idx` (`album_id`),
  KEY `fk_photos_media1_idx` (`media_id`),
  CONSTRAINT `fk_photos_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_photos_photo_albums1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`)
) ;

CREATE TABLE `profiles` (
  `users_id` int NOT NULL,
  `gender` enum('m','f','x') NOT NULL,
  `birthday` date NOT NULL,
  `location` varchar(245) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`),
  KEY `fk_profiles_users_idx` (`users_id`),
  CONSTRAINT `fk_profiles_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(245) NOT NULL COMMENT 'имя',
  `lastname` varchar(245) NOT NULL COMMENT 'фамилия',
  `email` varchar(245) NOT NULL,
  `phone` bigint NOT NULL COMMENT 'телефон',
  `password_hash` char(64) NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `firstname_lastname_idx` (`lastname`,`firstname`)
);

CREATE TABLE `users_communities` (
  `community_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `fk_users_communities_users1_idx` (`user_id`),
  KEY `fk_users_communities_communities1_idx` (`community_id`),
  CONSTRAINT `fk_users_communities_communities1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_users_communities_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ;
