-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: vkontakte
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_communities_users1_idx` (`admin_id`),
  CONSTRAINT `fk_communities_users1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'voluptatibus',97),(2,'voluptates',40),(3,'voluptates',39),(4,'est',11),(5,'magnam',5),(6,'quas',75),(7,'vel',99),(8,'ducimus',17),(9,'earum',76),(10,'id',70);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `from_user_id` int NOT NULL AUTO_INCREMENT,
  `to_user_id` int NOT NULL,
  `status` tinyint unsigned NOT NULL COMMENT 'статус: запрос - 1, подтвержден - 2, отклонен - 0',
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `fk_friend_requests_users1_idx` (`from_user_id`),
  KEY `fk_friend_requests_users2_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_requests_users1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friend_requests_users2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,43,0),(3,13,0),(3,37,0),(4,36,0),(4,56,0),(7,25,0),(7,90,0),(8,62,0),(8,76,0),(10,14,0),(11,41,0),(11,63,0),(11,66,0),(12,1,0),(12,13,0),(12,33,0),(14,22,0),(15,97,0),(15,99,0),(16,16,0),(16,27,0),(17,58,0),(17,66,0),(17,73,0),(18,89,0),(20,18,0),(20,39,0),(21,27,0),(22,22,0),(23,93,0),(26,8,0),(27,50,0),(29,80,0),(29,93,0),(30,72,0),(31,84,0),(32,51,0),(34,20,0),(34,94,0),(38,44,0),(38,54,0),(39,51,0),(39,63,0),(42,23,0),(43,20,0),(43,42,0),(44,96,0),(45,37,0),(46,17,0),(46,42,0),(46,43,0),(49,51,0),(52,51,0),(52,67,0),(52,71,0),(55,1,0),(55,42,0),(57,41,0),(57,43,0),(59,75,0),(61,100,0),(62,69,0),(62,95,0),(63,69,0),(63,86,0),(64,11,0),(65,13,0),(67,43,0),(70,57,0),(73,30,0),(74,87,0),(75,31,0),(77,28,0),(79,10,0),(79,33,0),(80,6,0),(80,19,0),(80,81,0),(80,83,0),(81,92,0),(81,95,0),(82,28,0),(82,79,0),(83,12,0),(83,96,0),(84,34,0),(84,42,0),(88,86,0),(88,96,0),(91,15,0),(91,54,0),(91,56,0),(94,89,0),(97,42,0),(97,43,0),(98,25,0),(98,62,0),(99,2,0),(100,76,0);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `media_type_id` int NOT NULL,
  `text` text,
  `file` blob,
  `size` int DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_media_types1_idx` (`media_type_id`),
  CONSTRAINT `fk_media_media_types1` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,2,'Sed facere rerum explicabo eius. Corporis enim quo vel nulla. Vel voluptas officia temporibus laborum odit quam.',NULL,87523,NULL),(2,3,'Quasi aspernatur mollitia sint modi. Repudiandae numquam harum sit ullam vel neque. Sit eveniet mollitia quasi ipsa vel placeat eum et. Quia qui quia aut sed unde ullam.',NULL,8976,NULL),(3,3,'Incidunt qui iure et accusamus ut tempora. A at quae quia dolor sed vitae.',NULL,2,NULL),(4,3,'Enim atque dolorem eaque et reprehenderit autem. Cumque eos eligendi ex consequatur.\nSit fuga perferendis eveniet suscipit. Nesciunt esse sit veniam est eos consectetur. Amet totam odio est dolores.',NULL,302789,NULL),(5,4,'Culpa qui corporis quo sit. Et voluptas rerum quisquam omnis id. Dolor ut nihil vero soluta qui.',NULL,494270,NULL),(6,3,'Et officiis non in quisquam vel ut rerum. Minus porro eum vel laudantium et vel. Ab autem eaque quaerat molestiae voluptatem.',NULL,11,NULL),(7,3,'Consequatur a est rerum nobis ipsam eos. Et incidunt dicta quisquam aut.',NULL,642995,NULL),(8,4,'Rerum totam libero distinctio fuga rerum at. Officia et reprehenderit tenetur eos molestiae quia. Voluptatibus perferendis voluptatem sit aut. Sit voluptatem est nihil et et sequi sit.',NULL,86564255,NULL),(9,2,'Tenetur quas occaecati ipsa vel. Ea doloremque excepturi et quam. Nostrum illum ut et voluptas.',NULL,5896889,NULL),(10,4,'Est qui sit debitis vero accusamus dolore. Est necessitatibus eos non sunt. Totam ea repellat placeat voluptatem minus. Occaecati autem voluptatum nostrum vel quo accusamus dolorum repudiandae.',NULL,6,NULL),(11,1,'Eum inventore temporibus vero sequi vel sint perspiciatis excepturi. Beatae quo aliquid ut voluptatem nam dolore error. Pariatur est autem autem voluptas quidem quas sit.',NULL,25233,NULL),(12,1,'Nostrum temporibus aliquid laboriosam quia autem qui culpa. Fuga est omnis architecto. Eaque tempore a eos impedit quia vel.',NULL,346,NULL),(13,2,'Qui maxime delectus repellat nobis. Ipsum atque odit commodi aut aut aut. Ut quo ea at omnis facilis quo enim.',NULL,19,NULL),(14,4,'Ea sapiente quae aut nisi est soluta ab. Tempora rerum voluptas sed consequuntur. Culpa illo impedit neque quis fuga suscipit.',NULL,38,NULL),(15,2,'Sunt ea accusantium est laboriosam omnis consequuntur optio assumenda. Ratione labore consequuntur dolor. Rerum itaque minima vel ut. Id similique quam exercitationem laudantium.',NULL,4,NULL),(16,1,'Quia non soluta rem corrupti dicta. Eum asperiores provident consequuntur aliquam nostrum. Similique quis perspiciatis quia.',NULL,965,NULL),(17,2,'Qui corrupti sit vel qui facere. Exercitationem rerum minus ab iusto corrupti nihil. Est laborum deserunt occaecati aperiam vel. Et quaerat eos iste asperiores.',NULL,4852,NULL),(18,4,'Laudantium dolorem aliquam rerum occaecati ea. Ratione libero veniam praesentium praesentium laborum. Quo occaecati iste eum qui eos accusantium consectetur.',NULL,861,NULL),(19,3,'Laboriosam ex ab numquam sed vero. Eum accusamus omnis ipsam quam autem non. Placeat nesciunt et laboriosam deserunt tempora. Suscipit adipisci consequuntur accusantium.',NULL,18670481,NULL),(20,1,'Dolore dolor veniam provident ut enim quam. Quam laboriosam consequuntur nostrum voluptate quibusdam officia. Et excepturi quas itaque ut voluptas animi cumque.',NULL,288968,NULL),(21,1,'Voluptas iste nam occaecati non autem non. Excepturi esse atque eum dolore est laboriosam ipsam. Voluptatibus voluptas et qui quia aliquam voluptates omnis. Et et at est voluptatibus.',NULL,30850494,NULL),(22,3,'Molestias porro perferendis eum aspernatur voluptatem autem a debitis. Cupiditate autem amet esse suscipit.',NULL,19,NULL),(23,4,'Et sed inventore harum optio adipisci voluptas quia error. Commodi quaerat qui et. Natus natus enim voluptatum amet rerum occaecati. Autem ea sapiente aperiam quisquam recusandae cum.',NULL,5,NULL),(24,3,'Sit est sed voluptas rerum repellendus est amet. Tenetur non facilis quis cumque neque a quia. Amet reiciendis voluptatem nihil.',NULL,29411,NULL),(25,2,'Voluptatum quis cum qui nesciunt. Fuga atque fugit omnis qui earum est. Et voluptas possimus minus architecto repellat similique omnis. Voluptatem facere minima et qui.',NULL,0,NULL),(26,4,'Provident aut quia veritatis animi. Ut nisi error sit id nostrum id.',NULL,2,NULL),(27,3,'Est ex veniam quibusdam vero et. Harum aut officiis ipsum vero vel. Et mollitia libero atque sit. Dignissimos soluta eius nihil.',NULL,3307,NULL),(28,4,'Aperiam libero ad et inventore exercitationem natus. Necessitatibus fugit at totam earum. Qui rerum ea qui et quidem doloremque et recusandae.',NULL,4022482,NULL),(29,3,'Earum et consectetur voluptates vero. Nihil omnis sunt qui eius quisquam. Et possimus omnis id qui voluptatem. Est quibusdam non omnis quo.',NULL,50811,NULL),(30,3,'Cum quia sunt eveniet laboriosam enim architecto aliquid fuga. Consequatur sed amet itaque quod. Ratione distinctio corporis totam maiores aperiam odit.',NULL,762388958,NULL),(31,4,'Architecto quod quia aut delectus dolores nostrum. Ratione et necessitatibus sed vero. Ut suscipit ducimus dolore et nesciunt. Officiis est corporis neque aut architecto rem quaerat.',NULL,1,NULL),(32,1,'Eligendi aut impedit ipsam dolor ad. Cumque error quis impedit illo exercitationem. Eligendi rerum voluptatem voluptatem vitae earum placeat asperiores.',NULL,3737,NULL),(33,1,'Incidunt repellat atque delectus quod eos praesentium. Quod ut consequuntur eligendi soluta eligendi qui aut. Placeat numquam debitis porro alias et quo. Ullam perspiciatis blanditiis magni illum.',NULL,2,NULL),(34,2,'Sequi quia maiores autem laboriosam doloremque. Voluptate est et at adipisci quisquam quia eos et. Sit et quos error.',NULL,7310,NULL),(35,3,'In unde quia voluptas amet. Tempore quis nulla nemo voluptatum. Adipisci nostrum id molestias iure perferendis dolorem.',NULL,3422762,NULL),(36,1,'Non quia voluptas nihil dolor numquam dolore. Rerum voluptatem et laboriosam nihil voluptatem possimus itaque.',NULL,43909,NULL),(37,1,'Nihil consequatur laudantium ut. Est quis velit provident quo nemo qui dolores expedita. Veritatis est optio voluptas id aperiam.',NULL,539,NULL),(38,1,'Vel tempore vel est laborum. Id magni rerum sit. Adipisci fugit quia quam repudiandae perspiciatis quia. Vel distinctio nihil amet vel sit et est.',NULL,845,NULL),(39,4,'Deleniti asperiores neque cum. Earum reprehenderit eveniet id omnis quis delectus. Pariatur repudiandae occaecati nesciunt odio aspernatur vel cumque. Aspernatur pariatur omnis natus aliquam omnis.',NULL,5390,NULL),(40,2,'Ea dolores est consequatur aut molestiae saepe exercitationem. Soluta voluptatum tempore iure. Eum eveniet laboriosam qui.',NULL,498398192,NULL),(41,4,'Dolor aspernatur recusandae voluptatem occaecati suscipit optio et. Expedita sapiente illo nam repellat eos alias fuga.',NULL,31752559,NULL),(42,1,'Ut culpa minima consectetur pariatur et id ea. Deserunt sapiente non sint. Dolor unde hic esse qui dignissimos.',NULL,39139,NULL),(43,3,'Est quasi sit libero provident consequatur eveniet reprehenderit. Deserunt amet distinctio dolores. Autem aliquid et aliquid quasi.',NULL,5158,NULL),(44,1,'Omnis aut eos voluptas ex possimus qui expedita. Corporis totam aut dolore delectus qui possimus. Perspiciatis consequatur soluta non omnis repellat.',NULL,99,NULL),(45,1,'Non quis sit minima maiores ea. Velit quos cupiditate qui omnis delectus sequi. Deleniti et asperiores qui dicta blanditiis et maxime.',NULL,388297217,NULL),(46,1,'Tempore voluptatem nulla sed est perferendis. Quos rerum harum ipsam qui doloribus omnis consequatur. Deleniti porro ipsa labore.',NULL,368292,NULL),(47,1,'Eum pariatur blanditiis asperiores. Nostrum neque totam ut. Quis nobis est optio aperiam voluptates ullam aut. Facilis commodi architecto est commodi.',NULL,964644603,NULL),(48,3,'Nostrum sit beatae repellendus sit corrupti. Culpa aut quo modi inventore eligendi. Esse laudantium quia sed et eius necessitatibus. Voluptatem dolores sunt distinctio.',NULL,552540279,NULL),(49,1,'Fugiat in in nesciunt error consectetur. Et rem consequatur nostrum architecto labore. Temporibus ut nobis reprehenderit. Ut minima ut tempore et. Tenetur dolores excepturi dolor sed dolorum et.',NULL,8400542,NULL),(50,4,'Officiis velit sit distinctio sapiente. Ducimus assumenda quisquam in ipsam omnis sed suscipit. Qui maiores voluptatem quaerat.',NULL,6805,NULL),(51,3,'Debitis cupiditate asperiores totam nemo. Beatae voluptatum iure quia dignissimos soluta in. Neque deleniti nisi consequatur odio expedita. Debitis odio et et animi quod nobis quod.',NULL,0,NULL),(52,1,'Placeat quisquam beatae optio ab cupiditate asperiores error nulla. Reiciendis nihil ducimus et amet odio veritatis aspernatur atque. Unde animi dolorem odio ratione illo molestiae.',NULL,978655,NULL),(53,2,'Fugiat sit id dolores aliquam mollitia. Praesentium magnam odio autem delectus fugit. Accusantium aut ab porro iste temporibus. Voluptatibus exercitationem delectus cupiditate aut aut soluta.',NULL,25,NULL),(54,2,'Omnis nostrum laudantium deleniti. Ea assumenda possimus eveniet facere libero. Error ab quisquam ducimus dicta.',NULL,87687,NULL),(55,4,'Est ipsa necessitatibus dignissimos est omnis. Dignissimos a omnis delectus ipsum dolorem deserunt eveniet. Voluptate omnis numquam dolorem libero voluptatibus consequatur quos.',NULL,52073,NULL),(56,3,'Incidunt vel et consectetur nam suscipit occaecati consequuntur. Optio laborum dolorem ab error vitae nemo. Dolorum delectus omnis quibusdam.',NULL,3920,NULL),(57,1,'Beatae iure id enim asperiores et velit non. Aliquam quas non quia aut ut. Harum accusamus ad autem.',NULL,56727870,NULL),(58,3,'Necessitatibus consectetur qui minima beatae est culpa ut ipsa. Molestiae a mollitia velit accusamus. Quisquam ut labore qui omnis.',NULL,801499335,NULL),(59,3,'Ab eius veritatis fuga error dolores non modi. Est eveniet sunt provident sapiente doloribus omnis eveniet voluptate. Culpa nihil ipsam dicta culpa dolor cum ea.',NULL,2299,NULL),(60,4,'Enim at id non fugiat doloremque. Animi sit vitae error earum dolores ullam mollitia. Molestiae sed tenetur quo vel repellendus. Doloribus laborum nostrum autem quos ea.',NULL,57,NULL),(61,1,'Laudantium voluptate molestias alias eum veniam. Eum sed voluptatem provident ut. Cum aspernatur est quia. Voluptatem et ab vel temporibus ipsa.',NULL,692756,NULL),(62,3,'Est quo aperiam vitae praesentium ipsam. Veniam repellendus aspernatur illo. Et quisquam expedita expedita repellat et. Dolor commodi vel deserunt quis aut deserunt.',NULL,0,NULL),(63,4,'Praesentium omnis saepe rem. Et qui maiores atque quidem iste est dolores. Est ipsam voluptatem nisi doloribus voluptate dolorem voluptate.',NULL,9,NULL),(64,1,'Alias unde nisi nam incidunt eum. Quis nulla error autem nihil dolor nam qui. Et repellat sint aspernatur asperiores maiores omnis consequatur eum.',NULL,979536,NULL),(65,4,'Numquam et aspernatur qui et ut enim asperiores in. Ut aperiam et atque ipsam. Nisi qui sunt qui cumque. Necessitatibus totam consequuntur aut voluptatem asperiores.',NULL,98,NULL),(66,2,'Molestias cum odit nihil eum repellat. Aut cumque excepturi non id et amet dolor ducimus. Consequatur fugit id ut vel laudantium.',NULL,201,NULL),(67,2,'Quos laboriosam qui odit. Et cupiditate harum quaerat.',NULL,114733378,NULL),(68,1,'Ea sed impedit qui repellat laudantium numquam non possimus. Quae ex fuga vel magnam. Voluptas ea quis aut. Ipsam incidunt et placeat et dolorem quae.',NULL,67,NULL),(69,2,'Ut nesciunt dolores excepturi magni et libero qui. Quia incidunt voluptatem voluptates et voluptate accusamus. Delectus nihil aut dolor voluptatum consequatur qui.',NULL,1,NULL),(70,2,'Ipsam voluptatum et enim et voluptates magni. Tenetur doloremque eligendi impedit quia. Ea ad eligendi natus sapiente. Incidunt quia quod voluptatum aut.',NULL,2309836,NULL),(71,3,'Esse praesentium totam ipsum quia. Autem similique autem ratione sed pariatur minus. Veniam accusamus porro cumque voluptates. Nisi officiis magni eum velit et iure.',NULL,9,NULL),(72,1,'Eveniet dolores et corrupti atque magni. Enim ea ut autem accusamus. Beatae enim sint fugit iure omnis magnam.',NULL,0,NULL),(73,2,'Consequatur error quia iure recusandae quia quos. Quidem laboriosam explicabo aut voluptatem harum perferendis accusantium. Vel minus ducimus fuga corporis consequatur quia quas.',NULL,61070,NULL),(74,2,'Ullam et mollitia eum. Modi molestiae deleniti dolore.',NULL,0,NULL),(75,2,'Deserunt beatae eveniet nesciunt quae nisi dignissimos rem. Molestias blanditiis placeat eum porro rem dignissimos. Tenetur culpa et illo aut est qui.',NULL,59471,NULL),(76,3,'Accusantium rerum delectus sit dolorem consequatur numquam optio. Dolorem iste saepe et et ex optio saepe. Quasi molestiae quis veniam atque. Id esse aut expedita aspernatur doloremque.',NULL,0,NULL),(77,2,'Eum laudantium magnam eius fugiat et saepe. Porro aliquam omnis ut velit. Praesentium et sit officia qui.',NULL,6817621,NULL),(78,3,'Commodi in est omnis cupiditate. Occaecati aut sed id et ea dicta magnam. Ut accusantium culpa voluptas vel est sit placeat velit. Molestiae ut nulla magni eligendi est ut.',NULL,34,NULL),(79,1,'Fugiat necessitatibus ratione accusamus quia. Autem nobis ducimus placeat magnam consequatur temporibus aut aut. Ut quia similique voluptas aut.',NULL,69220868,NULL),(80,3,'Blanditiis quis saepe accusantium quaerat. Labore qui est quas sunt sint eos. Quia tenetur velit ea ex.',NULL,75221035,NULL),(81,2,'Dolor sed velit consequatur recusandae nam est at. Dolor et dolore qui tenetur iste consequuntur. Sint nisi accusantium tempore maxime explicabo.',NULL,4651,NULL),(82,3,'Earum aperiam quia aut quis eum molestias. Ipsam voluptatem dolorum non assumenda modi officiis veritatis. Aut velit aut cumque blanditiis iste aperiam recusandae. Sed est quo nihil maiores adipisci.',NULL,137,NULL),(83,4,'Hic inventore rem impedit suscipit nobis. Ut aut quasi delectus dolor. Earum consectetur sint ab voluptatum. Tempore molestiae officiis tenetur excepturi fugit est labore eum.',NULL,585365374,NULL),(84,4,'Delectus autem ut nesciunt. Mollitia id eveniet accusantium id. Quae vel non ea asperiores vero voluptatem perferendis. Est fugit repudiandae aut.',NULL,9959,NULL),(85,1,'Qui molestias rerum aut iusto. Odit delectus fugit facilis maiores quibusdam inventore ducimus ut. Eos voluptatibus odit voluptas officia deserunt. Veniam facere aut provident unde sunt rerum est.',NULL,47698,NULL),(86,4,'Alias eveniet et ipsum ea et. Expedita consequatur sed est dolores. Aut numquam dignissimos quisquam consequatur quae amet quia quidem.',NULL,0,NULL),(87,3,'Dolore esse harum nisi ipsam unde tenetur molestiae rem. Atque dolorum maxime reprehenderit ut. Et est deserunt adipisci aut quia rerum molestiae.',NULL,745643524,NULL),(88,2,'Ex ipsam nihil et repellendus nemo. Aut occaecati ut provident. Et autem ut voluptatem. Est corporis suscipit corporis sunt aliquid.',NULL,5,NULL),(89,2,'Sapiente et quas ab nulla. Velit repudiandae quo sit impedit quibusdam et. Soluta debitis quo aspernatur molestias nesciunt optio qui. Cupiditate et a sit accusamus quam.',NULL,0,NULL),(90,1,'Sint rerum assumenda accusantium dolorum ad sunt aut. Dolorem dolores odit maxime omnis qui recusandae. Ut reprehenderit veritatis accusantium sed voluptatem nesciunt.',NULL,3,NULL),(91,1,'Dolor nisi voluptas veniam nihil repudiandae occaecati est. Rem commodi fugit et laborum architecto eius sint molestias. Fuga harum minima eos eaque non officiis voluptatem sint.',NULL,84,NULL),(92,2,'In excepturi perspiciatis itaque totam quas laborum aperiam. Quidem doloribus ut quasi. Consequuntur inventore quam qui et quo repellat. Quo atque similique aut quibusdam voluptatem.',NULL,67,NULL),(93,3,'Qui dolor non quisquam et maiores voluptas fuga atque. Velit amet autem veritatis molestiae nobis voluptas. Tempora est et fugit voluptas eum eos. Non nihil quisquam quo tenetur.',NULL,7568965,NULL),(94,4,'Et quaerat inventore eveniet aliquid eum reiciendis nam. Veniam quod maiores modi. Accusantium voluptas recusandae aut dicta.',NULL,0,NULL),(95,3,'Voluptatem molestiae delectus qui facilis vel. Molestiae sunt provident nam et architecto possimus. Quasi quia ullam fugit placeat possimus voluptatibus.',NULL,838,NULL),(96,3,'Tempora deserunt iusto similique perspiciatis sit. Dolorem animi qui et sed id. Consequatur officia nihil qui ea voluptas. Laudantium eveniet occaecati error dolore laboriosam.',NULL,819,NULL),(97,1,'Provident tempora qui rerum suscipit. Dolores quaerat quia earum porro distinctio deleniti architecto. Aut aliquam voluptatum velit pariatur itaque. Culpa et quibusdam est velit ut nihil.',NULL,719920315,NULL),(98,4,'Nemo eum incidunt voluptates cumque. Fugit quod praesentium quia perspiciatis iste saepe. Pariatur in velit voluptatibus.',NULL,0,NULL),(99,3,'A omnis reiciendis molestiae occaecati beatae. Tenetur repellat voluptatem quae dolorum quod qui laborum. Maxime asperiores corrupti consectetur aliquam laborum dolor ut.',NULL,9,NULL),(100,2,'Voluptates accusamus praesentium facilis facilis quos perspiciatis. Occaecati sunt est provident similique iste qui sit. Et consequuntur est eligendi necessitatibus aut.',NULL,1193623,NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'img'),(2,'video'),(3,'music'),(4,'text');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `text` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users1_idx` (`from_user_id`),
  KEY `fk_messages_users2_idx` (`to_user_id`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_users2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,44,23,'Voluptates voluptas in molestiae enim eius magnam.','1980-04-05 13:44:54'),(2,5,33,'Voluptatem voluptatibus quo quia reiciendis nihil ratione.','2012-03-11 20:48:50'),(3,58,1,'Dolorum maiores quia eum nihil laboriosam non eveniet.','1991-01-18 18:36:40'),(4,70,73,'Accusantium ad sint eum.','2001-12-15 04:54:49'),(5,64,39,'Molestias ea doloribus repudiandae itaque ullam.','2015-04-02 02:09:26'),(6,43,33,'Atque qui in necessitatibus velit voluptas.','1972-09-11 23:47:01'),(7,2,61,'Ipsa minus est consequatur id voluptatum eum.','1992-08-11 22:32:06'),(8,4,62,'Et inventore occaecati dolor quis iusto enim ratione cum.','2006-02-01 15:19:23'),(9,68,20,'Aut ut doloribus consectetur cupiditate autem facilis sed aut.','1983-09-21 23:24:00'),(10,26,21,'Et perferendis recusandae delectus fugit.','2001-10-31 03:14:50'),(11,14,52,'Reprehenderit velit est dolorum dolor occaecati.','1981-07-16 11:11:03'),(12,45,19,'Incidunt voluptatem architecto quidem fugiat sed ut.','2008-04-01 12:52:25'),(13,81,21,'Voluptatum et pariatur et dolor et temporibus.','2019-07-10 09:06:15'),(14,76,89,'Ea architecto voluptates quia.','2001-01-04 13:11:39'),(15,2,88,'Aut in quia dolorem maxime omnis officiis aut.','1991-08-28 03:00:25'),(16,4,46,'Voluptatum temporibus sit quas quos fugiat iure sequi.','2005-05-24 01:52:43'),(17,10,8,'Quibusdam dolor voluptatem deleniti molestiae cumque voluptatem et.','1971-09-03 14:29:50'),(18,79,68,'Quasi nam veniam ut dolor.','1994-04-17 16:59:01'),(19,9,49,'Qui et velit quae quibusdam enim deleniti porro.','2007-10-22 11:08:07'),(20,41,72,'Perspiciatis magni autem veritatis ad est aut similique.','2000-07-24 00:33:36'),(21,87,84,'Error qui mollitia et rem deleniti mollitia eum.','1980-08-09 11:54:26'),(22,5,89,'Magni nesciunt aliquam aut cumque et et voluptas.','2002-03-17 11:21:57'),(23,44,9,'Pariatur voluptatem sed et dicta.','1976-10-31 18:53:50'),(24,50,12,'Pariatur ut autem et perferendis.','2004-06-25 05:16:32'),(25,28,76,'Quibusdam quaerat laborum dolorum deleniti officia qui.','2018-01-13 17:05:46'),(26,32,41,'Esse eos dignissimos incidunt vel dolor praesentium.','1973-06-21 17:14:02'),(27,28,77,'Deserunt quae sapiente quo ut ipsam.','1975-06-05 03:34:26'),(28,60,9,'Ea earum nesciunt ipsa in reprehenderit tempora non.','2013-07-27 20:51:33'),(29,97,35,'Aut amet et in sint.','1997-05-21 17:15:33'),(30,97,99,'Nemo hic eum error mollitia.','1999-07-09 05:01:47'),(31,22,100,'Ut cum id vel illo eveniet magni non.','2012-08-05 21:35:06'),(32,45,32,'Dolorum quia id et aliquid non et aut.','2015-08-20 08:14:08'),(33,8,23,'Alias id aut et sit.','2003-04-14 20:35:56'),(34,100,16,'Quibusdam voluptatem vitae delectus sed enim ducimus.','2014-05-21 10:41:05'),(35,72,41,'Eveniet saepe voluptatum eligendi et aut.','2014-11-24 12:00:56'),(36,88,59,'Voluptas non rerum vero nostrum saepe vel ut.','1980-10-01 23:04:40'),(37,24,92,'Repellendus quam omnis eos soluta et sint.','1993-10-05 21:43:30'),(38,47,67,'Dolorem veniam sed quia ea.','1998-03-01 07:15:21'),(39,100,97,'Quasi ipsa veritatis qui veritatis ullam dolores.','2006-06-26 00:10:47'),(40,78,27,'Consequatur non suscipit aut quis.','1985-05-25 22:53:00'),(41,73,10,'Debitis minus sint commodi omnis sint assumenda et.','2018-04-04 08:33:40'),(42,68,1,'Dolorum exercitationem ut voluptates maxime culpa.','2005-10-07 19:02:03'),(43,87,27,'Velit et esse at non.','1980-10-29 07:49:20'),(44,9,83,'Consequuntur cum praesentium exercitationem repudiandae corrupti.','2010-03-25 12:41:07'),(45,62,5,'Non fuga quisquam perferendis et sed commodi vero similique.','1991-09-01 02:00:50'),(46,82,84,'Quas quidem possimus accusamus eius.','1981-07-29 07:17:26'),(47,5,26,'Mollitia perspiciatis tempore consectetur in qui.','1996-01-06 02:01:23'),(48,16,12,'Dolor eveniet ipsa voluptate earum.','2012-06-21 16:52:45'),(49,49,16,'Ex dolor officia eum ut quisquam.','1972-11-23 10:15:38'),(50,28,20,'Illum repudiandae soluta officiis ut iste.','2001-09-08 15:52:46'),(51,56,15,'Velit voluptatem voluptatem quisquam rerum.','2004-03-12 00:47:28'),(52,78,80,'Cupiditate sint qui vitae et.','1993-10-10 22:16:31'),(53,6,25,'Velit quia enim id sit.','1970-08-15 20:14:18'),(54,46,5,'Id aut fugiat ut.','1979-07-27 01:32:08'),(55,22,24,'Repellat et in excepturi aliquam sed ut ipsum.','2010-12-23 08:10:20'),(56,32,95,'Et tempora quisquam accusamus similique nostrum consectetur unde.','1978-04-04 11:33:04'),(57,34,100,'Reiciendis minima nihil aut sit suscipit reiciendis earum.','2007-07-29 07:11:04'),(58,95,20,'Et assumenda ut atque natus.','2017-11-02 01:50:13'),(59,27,3,'Vero atque suscipit eius iure deserunt eum culpa.','1973-11-09 07:06:31'),(60,3,89,'Libero eum eaque et et et autem id.','2002-05-06 06:47:23'),(61,8,84,'Pariatur dolorem quaerat nihil facere autem doloremque quia.','1995-08-10 19:49:06'),(62,73,12,'Ut quia reprehenderit numquam distinctio voluptate.','1981-09-30 03:21:43'),(63,10,89,'Omnis consequatur neque labore est cum vero.','2013-08-07 20:41:05'),(64,24,59,'Omnis enim culpa magni quia.','1985-04-25 02:20:46'),(65,4,52,'Rerum eum nobis id voluptatem placeat ut et.','2017-01-02 15:35:00'),(66,78,60,'Qui facilis molestiae et qui dolores ipsam vero.','1993-09-04 02:00:12'),(67,66,56,'Perspiciatis et consequatur qui amet.','1978-04-30 18:16:30'),(68,39,71,'Laudantium provident aliquam illo similique distinctio.','1981-08-05 02:00:14'),(69,81,85,'Nulla qui sunt nulla quod voluptatem optio.','1986-02-08 15:45:21'),(70,76,2,'Nemo nihil exercitationem deserunt quibusdam et modi.','2012-03-09 05:35:43'),(71,9,8,'Consequatur adipisci qui expedita deleniti perferendis explicabo cumque.','1995-02-02 17:21:16'),(72,96,42,'Dolore minima quibusdam pariatur fuga aut inventore.','2016-07-06 15:25:32'),(73,8,91,'Sed aut saepe et magni corporis temporibus est.','1987-08-27 21:39:22'),(74,62,34,'Doloribus aliquid eum totam dolor doloribus.','2000-10-05 16:35:11'),(75,93,65,'Itaque molestias quae laboriosam quia beatae quis est.','2017-11-06 08:12:08'),(76,23,100,'Dolorum dignissimos cupiditate dolore aliquid debitis illum.','2014-05-25 03:26:36'),(77,48,95,'Dolorem exercitationem architecto ab mollitia voluptatem hic.','2011-05-26 00:52:30'),(78,12,58,'Minus ex aperiam doloremque non.','1999-01-15 00:12:18'),(79,84,35,'Ut fugit et sit.','2007-02-01 17:54:40'),(80,16,88,'Repellendus temporibus et odit et laudantium dolores repellendus quod.','2017-11-04 23:32:13'),(81,86,94,'Quibusdam qui quis corporis aperiam.','1977-09-12 21:24:48'),(82,47,52,'Labore asperiores aut et vel minima.','1992-09-02 02:55:04'),(83,49,86,'Vero sint sint est facere ut.','2013-10-30 03:12:20'),(84,23,30,'Quae sint a voluptatem.','2016-02-24 12:52:48'),(85,70,99,'Mollitia dolorem quis quia distinctio et omnis.','1988-08-11 00:07:38'),(86,32,79,'Et fugiat vel ipsam ut eaque labore.','1978-04-03 08:43:30'),(87,6,27,'Repellendus debitis accusantium culpa laborum odio at.','1980-11-22 02:15:20'),(88,20,13,'Dolores magni omnis eveniet laudantium repudiandae deserunt.','1976-08-15 05:32:47'),(89,17,82,'Vero ut ratione quia.','1979-09-20 13:29:40'),(90,47,10,'Aut occaecati ea dolorem est aut accusantium.','2012-05-08 07:28:27'),(91,46,69,'Ab libero qui perferendis ut saepe ut et molestias.','2005-11-23 04:30:32'),(92,9,94,'Voluptatem assumenda sed esse asperiores aperiam laborum.','1996-11-11 19:53:52'),(93,64,21,'Quo et est maiores quos dolorem.','2012-07-06 00:32:48'),(94,51,47,'Accusamus est qui optio quia rerum.','1986-09-27 02:51:26'),(95,56,66,'Rem maxime quae sed distinctio repellendus.','1997-02-20 03:45:42'),(96,34,42,'Voluptas debitis est cumque quidem totam et.','2005-06-18 11:58:48'),(97,59,81,'Non corrupti ipsam saepe dignissimos voluptatum.','1983-08-14 03:13:57'),(98,93,8,'Impedit quia in tempore porro nemo dolores.','2010-06-25 21:28:30'),(99,66,16,'Molestias quisquam temporibus enim repellendus nihil.','2007-06-30 09:02:43'),(100,37,36,'Sed ullam aut sunt et et consectetur nihil.','2002-06-23 19:49:54');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_albums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  `decs` text,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_album_users1_idx` (`user_id`),
  CONSTRAINT `fk_photo_album_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'sed',NULL,1),(2,'quia',NULL,2),(3,'quod',NULL,3),(4,'veritatis',NULL,4),(5,'deserunt',NULL,5),(6,'voluptas',NULL,6),(7,'blanditiis',NULL,7),(8,'commodi',NULL,8),(9,'sapiente',NULL,9),(10,'minus',NULL,10),(11,'repudiandae',NULL,11),(12,'quam',NULL,12),(13,'consequatur',NULL,13),(14,'quae',NULL,14),(15,'commodi',NULL,15),(16,'aliquam',NULL,16),(17,'id',NULL,17),(18,'consectetur',NULL,18),(19,'aut',NULL,19),(20,'ex',NULL,20),(21,'autem',NULL,21),(22,'minima',NULL,22),(23,'quasi',NULL,23),(24,'voluptas',NULL,24),(25,'quia',NULL,25),(26,'quae',NULL,26),(27,'asperiores',NULL,27),(28,'repudiandae',NULL,28),(29,'quo',NULL,29),(30,'rerum',NULL,30),(31,'ut',NULL,31),(32,'est',NULL,32),(33,'veritatis',NULL,33),(34,'optio',NULL,34),(35,'sed',NULL,35),(36,'eos',NULL,36),(37,'non',NULL,37),(38,'ut',NULL,38),(39,'modi',NULL,39),(40,'error',NULL,40),(41,'sunt',NULL,41),(42,'quam',NULL,42),(43,'nam',NULL,43),(44,'eos',NULL,44),(45,'nisi',NULL,45),(46,'asperiores',NULL,46),(47,'hic',NULL,47),(48,'quas',NULL,48),(49,'cumque',NULL,49),(50,'velit',NULL,50),(51,'numquam',NULL,51),(52,'voluptas',NULL,52),(53,'quidem',NULL,53),(54,'est',NULL,54),(55,'et',NULL,55),(56,'molestiae',NULL,56),(57,'veniam',NULL,57),(58,'enim',NULL,58),(59,'a',NULL,59),(60,'reiciendis',NULL,60),(61,'aut',NULL,61),(62,'quae',NULL,62),(63,'alias',NULL,63),(64,'accusantium',NULL,64),(65,'molestiae',NULL,65),(66,'ut',NULL,66),(67,'totam',NULL,67),(68,'aut',NULL,68),(69,'laborum',NULL,69),(70,'officiis',NULL,70),(71,'dolor',NULL,71),(72,'nobis',NULL,72),(73,'doloremque',NULL,73),(74,'nobis',NULL,74),(75,'libero',NULL,75),(76,'mollitia',NULL,76),(77,'a',NULL,77),(78,'excepturi',NULL,78),(79,'ea',NULL,79),(80,'id',NULL,80),(81,'ea',NULL,81),(82,'rerum',NULL,82),(83,'qui',NULL,83),(84,'neque',NULL,84),(85,'est',NULL,85),(86,'autem',NULL,86),(87,'rem',NULL,87),(88,'molestiae',NULL,88),(89,'voluptatem',NULL,89),(90,'deleniti',NULL,90),(91,'quis',NULL,91),(92,'omnis',NULL,92),(93,'earum',NULL,93),(94,'dicta',NULL,94),(95,'quos',NULL,95),(96,'omnis',NULL,96),(97,'nostrum',NULL,97),(98,'doloribus',NULL,98),(99,'laboriosam',NULL,99),(100,'expedita',NULL,100);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` int NOT NULL,
  `album_id` int NOT NULL,
  `media_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_photo_album1_idx` (`album_id`),
  KEY `fk_photo_media1_idx` (`media_id`),
  CONSTRAINT `fk_photo_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_photo_photo_album1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,83,83),(2,92,92),(3,59,59),(4,62,62),(5,80,80),(6,14,14),(7,99,99),(8,20,20),(9,63,63),(10,39,39),(11,26,26),(12,67,67),(13,36,36),(14,35,35),(15,32,32),(16,72,72),(17,75,75),(18,16,16),(19,6,6),(20,70,70),(21,13,13),(22,42,42),(23,88,88),(24,9,9),(25,56,56),(26,50,50),(27,96,96),(28,15,15),(29,18,18),(30,34,34),(31,44,44),(32,86,86),(33,87,87),(34,95,95),(35,77,77),(36,97,97),(37,29,29),(38,4,4),(39,85,85),(40,21,21),(41,68,68),(42,45,45),(43,43,43),(44,31,31),(45,3,3),(46,17,17),(47,98,98),(48,66,66),(49,55,55),(50,61,61),(51,58,58),(52,53,53),(53,22,22),(54,81,81),(55,2,2),(56,82,82),(57,69,69),(58,54,54),(59,78,78),(60,100,100),(61,12,12),(62,47,47),(63,33,33),(64,30,30),(65,73,73),(66,24,24),(67,65,65),(68,46,46),(69,8,8),(70,79,79),(71,48,48),(72,64,64),(73,90,90),(74,5,5),(75,74,74),(76,19,19),(77,51,51),(78,60,60),(79,10,10),(80,40,40),(81,94,94),(82,76,76),(83,7,7),(84,38,38),(85,37,37),(86,52,52),(87,1,1),(88,93,93),(89,91,91),(90,41,41),(91,84,84),(92,71,71),(93,57,57),(94,27,27),(95,49,49),(96,11,11),(97,89,89),(98,23,23),(99,25,25),(100,28,28);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `users_id` int NOT NULL,
  `gender` enum('m','f','x') NOT NULL,
  `birthday` date NOT NULL,
  `location` varchar(245) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`),
  KEY `fk_profile_users_idx` (`users_id`),
  CONSTRAINT `fk_profile_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','1971-02-09','5907 Gerhard Radial Apt. 567\nHarmonyberg, MT 64948','1971-06-24 11:31:56'),(2,'m','2018-07-11','231 Walter Lakes\nNew Fern, AL 32610','1996-08-05 15:42:07'),(3,'m','2015-02-22','8354 Kirlin Bypass Suite 444\nO\'Reillyfort, TX 92092','2002-12-04 01:26:06'),(4,'x','1984-03-09','30309 Keyon Points Apt. 889\nMyraburgh, MN 06058','2015-01-07 06:37:50'),(5,'m','2009-09-17','19321 Prince Hill Suite 452\nTatyanaside, MA 50067-9056','1991-12-17 09:30:58'),(6,'m','1992-08-31','4668 Garth Fork Suite 797\nPort Eldoraview, WV 23208','2006-07-15 00:12:43'),(7,'f','2007-08-31','175 Konopelski Roads Suite 768\nLisastad, CA 74003','1985-08-25 22:43:35'),(8,'f','1996-03-05','25631 Stanton Tunnel\nMuellerhaven, KS 40974','1976-02-04 11:39:26'),(9,'x','2011-08-17','373 Rodriguez Mission Suite 436\nNew Aglaeborough, MA 19411-7735','2000-07-30 20:59:44'),(10,'m','2018-06-14','466 Sydney Skyway\nNorth Tellybury, OK 08680-2490','1996-08-26 09:28:49'),(11,'f','1998-08-30','0600 Schinner Ports\nSouth Ashlyhaven, VT 14766-1265','1992-09-24 06:07:25'),(12,'f','1993-02-26','7366 Keebler Camp\nWest Medaland, WA 18062','1991-03-29 04:51:18'),(13,'m','2006-01-31','13473 Xavier Burgs Apt. 083\nLabadieberg, DE 62935-3789','1995-12-06 19:43:53'),(14,'f','2011-05-30','658 Gleason Junction Apt. 615\nWest Harmon, DC 59882-8276','2017-03-08 07:33:04'),(15,'x','2006-09-05','1544 Ernser Divide\nAbelardofurt, WY 03844-3199','1992-01-28 10:55:35'),(16,'m','1994-04-22','0814 Meredith Orchard Suite 554\nNew Camillastad, HI 33571','1977-02-18 16:09:11'),(17,'m','1977-05-10','78278 Strosin Cove Suite 509\nEmmerichside, KY 73756','1970-04-22 06:47:09'),(18,'x','2013-05-21','598 Hagenes Turnpike Apt. 990\nPowlowskiburgh, MA 03647','2011-08-31 20:14:37'),(19,'f','2008-02-17','967 Maude Divide Suite 594\nLeopoldoside, ND 15038','2012-03-16 09:56:04'),(20,'x','2004-04-21','681 Dorthy Forges Suite 547\nLake Vidafurt, AL 78136','2013-03-15 09:14:23'),(21,'f','2002-01-19','388 Aufderhar Key\nJeffryland, CA 84384','1996-11-08 15:42:33'),(22,'m','1981-01-29','926 Jade Village\nNew Gertrudeville, CT 58923','2014-11-22 08:15:10'),(23,'m','2004-07-03','2358 Altenwerth Vista Apt. 930\nNorth Marquesmouth, AL 71175-0302','1995-09-22 15:09:41'),(24,'f','2009-08-23','3857 Schaden Locks Apt. 191\nNew Rhiannonville, TX 06962','1993-05-16 01:53:44'),(25,'f','1993-09-12','5280 Oberbrunner Mill Apt. 319\nWest Magdalenborough, ME 79059','2010-09-22 19:11:08'),(26,'m','1986-09-24','90590 Amalia Via\nEast Simeonside, OR 23631-2223','1971-05-17 22:27:39'),(27,'x','2015-01-10','41617 Dach Terrace\nKuhicshire, MN 23771-1359','2016-04-03 05:15:15'),(28,'f','1992-01-22','9192 Mohr Orchard Apt. 772\nHodkiewiczberg, AR 69260','2002-03-28 12:36:16'),(29,'x','1987-07-06','3904 Hudson Mountain\nSonialand, NE 72976-3916','2018-05-06 18:02:40'),(30,'m','1971-05-14','5725 Samara Greens\nAlannaport, TN 16070','1970-09-30 04:17:18'),(31,'m','1985-01-09','640 Daphnee Station Apt. 497\nAnibalbury, MS 66717-8019','2015-06-21 17:37:31'),(32,'m','1984-07-05','85489 Kub Causeway Apt. 468\nJohnpaulfurt, GA 19194-6988','2003-12-04 03:53:35'),(33,'x','2002-01-30','153 Bernhard Union Suite 969\nNew Clay, WY 29399-7210','1984-03-30 09:30:01'),(34,'m','1976-10-25','615 Lynn Spur\nNew Ruben, CT 55827-5656','2013-07-17 12:49:03'),(35,'m','1984-05-25','1692 Carolyn Mountain\nLake Robbiechester, AL 90661','1982-01-26 18:17:42'),(36,'m','2015-10-26','525 Mitchell Greens Suite 414\nNew Ken, SD 79923','2006-07-10 02:17:19'),(37,'f','1980-08-18','0567 Alessandro Lights\nAdelberthaven, ME 42753','1997-12-29 01:15:07'),(38,'m','1987-06-01','2294 Hackett Mountain Suite 744\nPort Jackson, ND 40739','1978-08-11 14:36:59'),(39,'f','1976-03-13','85036 Wiegand Crossing Suite 292\nSpencerland, FL 76493-6006','1976-02-12 21:28:04'),(40,'x','1997-03-11','9648 Alaina Island\nJanamouth, VT 32043-8167','2005-11-10 05:00:01'),(41,'x','2020-12-24','37117 Nolan Port\nNorth Eliaschester, NV 19983-9922','1970-11-20 23:20:18'),(42,'f','2014-04-01','44395 McGlynn Light Apt. 285\nWilliamsonton, DE 89012','2000-03-19 00:12:31'),(43,'m','2004-01-07','408 Hirthe Lodge Suite 363\nWillport, ID 27325-7600','2011-07-09 10:23:01'),(44,'f','1977-01-14','52069 O\'Conner Forges Apt. 382\nEast Armando, UT 18741-1416','1996-02-01 19:50:00'),(45,'x','2000-10-08','51051 Geo Mountains\nSouth Chaya, MT 22882','1970-07-04 06:41:05'),(46,'f','2003-08-09','59707 Solon Plain\nWaynemouth, ID 36986-1612','2014-08-09 09:04:40'),(47,'x','2007-04-05','3827 Eino Manor Suite 728\nNedraburgh, AK 03602-4240','2010-07-22 17:33:24'),(48,'m','2000-11-25','203 Becker Trace\nNew Murphyland, TX 29061-4075','2003-05-21 16:58:18'),(49,'f','1986-10-26','99972 Troy Stravenue\nEast Lennatown, IN 47214-9912','1993-08-23 07:03:00'),(50,'f','2010-02-15','5779 Dave Vista Suite 517\nKristinmouth, SC 89915-8320','1973-11-26 21:12:32'),(51,'f','1987-11-14','75697 Reichert Shores Suite 127\nWest Sabina, DE 15034-1778','1970-04-10 18:07:20'),(52,'m','1997-01-14','071 Raven Drives Suite 260\nKaiaview, OR 10516','1997-10-18 07:07:12'),(53,'m','1974-09-14','797 Renner Dam Apt. 031\nBeierland, NY 65878-1970','1978-06-29 23:40:46'),(54,'m','1980-06-16','7908 Shania Summit Apt. 115\nPatriciaview, MS 43676-9800','1973-12-28 17:45:01'),(55,'m','1995-07-06','0779 Schumm Keys\nFlorencioberg, OK 73639','1989-02-01 03:22:32'),(56,'f','1978-07-30','418 Muriel Station Suite 915\nHartmanntown, NH 71518-0479','1990-09-08 20:03:57'),(57,'x','1972-01-14','542 Cali Shores Suite 290\nDarestad, UT 56063','2019-07-28 18:47:14'),(58,'f','2008-08-29','9619 Klocko Meadow Apt. 057\nMcKenzieport, CA 47549','2019-11-09 04:05:15'),(59,'f','1983-08-19','1199 Lavonne Plains Suite 332\nRamonaton, NC 41435-7230','1974-05-05 10:02:53'),(60,'m','1980-08-28','1262 Wiegand Ways Apt. 153\nNorth Loniemouth, KS 99235','1985-10-30 08:13:49'),(61,'f','2006-12-04','97205 Hermann Lake\nMillsbury, WY 23704-0660','2007-02-24 06:51:41'),(62,'f','1994-12-18','75766 Medhurst Lakes Suite 101\nNedburgh, SC 08324','2001-07-12 14:54:55'),(63,'m','1997-10-18','25996 Yost Island Apt. 090\nQuentinchester, UT 58021-6027','2013-07-21 16:49:38'),(64,'m','1990-10-01','828 Pagac Mews Apt. 344\nEast Luzborough, RI 37640-1237','1986-06-11 06:05:06'),(65,'m','1989-07-28','63800 Beer Row\nWest Juwanland, WY 55774-3348','2015-03-04 12:52:59'),(66,'x','1999-09-22','031 White Path\nEast Bryce, CA 44487-0031','1985-03-29 00:56:33'),(67,'m','2010-08-12','11424 Millie Port Suite 934\nMorartown, CA 62521','1970-01-08 17:30:29'),(68,'m','2009-12-19','3683 Ottis Islands\nMcLaughlinbury, DE 80418','2006-10-21 19:30:36'),(69,'x','1990-08-08','41881 Garth Forges\nPort Reva, OH 58211','2019-12-28 16:09:29'),(70,'f','1986-12-18','3120 Abernathy Field Suite 378\nPort Waltonbury, SD 59637-0796','2002-04-17 19:28:54'),(71,'x','2000-09-28','27424 Effertz Stream Apt. 392\nMargeborough, MA 28029-3044','1991-08-11 09:21:24'),(72,'f','1971-05-25','950 Mills Islands\nMcKenzieview, WY 04611','1989-12-27 10:21:55'),(73,'m','1981-06-16','723 Keely Mission\nBrentstad, NY 43309-5090','1987-07-25 10:45:24'),(74,'x','1989-06-11','907 Frami Tunnel\nPort Olafberg, MT 27750-3182','2005-07-31 05:22:33'),(75,'m','2006-02-05','62159 Lehner Trace Suite 099\nJovanibury, MT 37816','1996-11-20 03:49:48'),(76,'f','1983-08-23','007 Kuhn Village\nWest Naomiburgh, AK 54447','1999-08-27 13:58:29'),(77,'x','2010-12-21','008 Adeline Haven Suite 850\nNyasiaside, ND 49885-8364','2002-10-23 02:14:36'),(78,'f','2012-01-27','72766 Purdy Row\nNorth Kaylahport, OR 53625','2019-12-26 21:01:10'),(79,'m','1988-05-30','030 Rachael Port\nWest Candacemouth, NJ 25305','1988-08-07 17:13:47'),(80,'f','2011-06-24','89683 Amely Prairie Suite 971\nSouth Shadmouth, PA 04263-0553','1975-06-14 21:50:22'),(81,'f','1977-03-14','6596 Keeling Forge Suite 879\nGusikowskichester, OH 97025','2011-03-09 15:18:32'),(82,'x','2020-08-19','779 Davis Inlet Apt. 202\nEast Tara, ND 06264','1971-04-15 10:53:37'),(83,'x','1985-03-02','04597 Leannon Pines Suite 435\nPagacville, NC 59050','2014-02-19 04:30:14'),(84,'m','2018-02-14','5984 Hallie Ranch Apt. 080\nJaylinport, VA 11638','1983-03-05 17:09:16'),(85,'x','1981-08-17','317 Kayley Way Apt. 645\nWest Julio, MT 95641','2010-07-15 11:16:22'),(86,'x','2011-08-25','56966 Corkery Lakes Suite 522\nSouth Stanfordview, KY 44749','1983-04-01 01:20:16'),(87,'f','2003-04-26','10548 Johns Haven Apt. 605\nAbagailborough, CO 97303','1976-09-30 18:48:42'),(88,'m','2015-05-20','76486 Beer Springs\nSouth Jailyn, TX 04712-7886','1979-11-06 22:39:25'),(89,'x','1987-08-17','59080 Wiegand Terrace\nWest Lexieberg, IA 12725','2012-11-30 00:53:29'),(90,'m','2006-08-12','5470 Avery Vista Suite 126\nGleasonstad, DE 93505','1988-06-05 00:53:52'),(91,'x','1996-02-11','8485 Corene Springs\nNew Calistamouth, SC 58640-0116','2004-08-29 00:48:12'),(92,'f','2012-12-04','21590 Christiansen Knoll Apt. 239\nFritschview, AK 70823','2012-09-21 13:29:38'),(93,'m','1993-09-07','45278 Kirsten Plaza\nNew Hoyt, TN 75711','1999-09-28 18:43:28'),(94,'x','1976-02-15','5732 Kyle Lights Apt. 857\nGleichnerbury, OR 30704-6986','2012-11-14 19:37:38'),(95,'m','1976-12-26','9640 Wolf Mall Apt. 953\nNew Twilahaven, CO 92951-0186','2010-04-19 21:38:19'),(96,'f','1997-06-13','06081 Dennis Expressway Suite 823\nLake Buddy, NM 18746','2011-08-26 07:01:16'),(97,'x','2018-08-18','13978 Stanley Court Suite 444\nNorth Sisterfort, CO 97846-2060','1974-11-26 07:15:16'),(98,'x','1990-06-03','75717 Bayer Common\nEast Delfinahaven, RI 01454-0293','2008-07-26 03:24:28'),(99,'f','2000-04-12','6654 Conor Harbor\nReyborough, NJ 99556','1991-05-12 00:04:16'),(100,'m','2009-11-29','54992 Agustina Centers Apt. 857\nAlizehaven, SD 68953','1994-12-09 13:11:45');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(245) NOT NULL COMMENT 'Имя',
  `lastname` varchar(245) NOT NULL COMMENT 'Фамилия',
  `email` varchar(245) NOT NULL COMMENT 'Электронная почта',
  `phone` bigint NOT NULL COMMENT 'Сотовый телефон',
  `password_hash` char(64) NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `first_name_last_name_idx` (`lastname`,`firstname`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Eliezer','Gottlieb','ratke.loren@example.org',79772959973,'4465db6c7d47ba3f8e121332863565de8fdc31d8',_binary '\0'),(2,'Tomasa','Wiegand','edgar.hirthe@example.com',79471515664,'1a249059d58a1146af7a05cf24b9bfa2a175f433',_binary '\0'),(3,'Lew','Strosin','ghartmann@example.net',79602467806,'9f1079dca4ad5064aaf2e3bb81d185792ba336df',_binary '\0'),(4,'Taryn','Hand','dgislason@example.org',79438551064,'f053e2a88add1ce5e940cec07515a2fae8218fe2',_binary '\0'),(5,'Laurie','Schamberger','hills.madelynn@example.net',79551495362,'e62b5cd95c496737bcc106c3c6529c734634b68f',_binary '\0'),(6,'Christ','Hagenes','nader.gerson@example.net',79807265340,'e50dd1cd53522a89a931fd5c649a92e94330f2fb',_binary '\0'),(7,'Patrick','Hamill','merritt.white@example.com',79344228245,'503136d0e01c12b3ba69addb84983dc63c483b6f',_binary '\0'),(8,'Araceli','Goldner','zulauf.heidi@example.com',79320424262,'da6be9e1d638f1d9579076b49f2dd7e7797f8e05',_binary '\0'),(9,'Jaylin','Hilll','keegan23@example.com',79056169701,'b693eac23518fbe7c5e5cb63cddebdc91a2f77de',_binary '\0'),(10,'Gerald','Stamm','o\'kon.brandy@example.net',79695240294,'95061aa0a95efbdb5c66d23dd52be8e776f59048',_binary '\0'),(11,'Pasquale','Marquardt','jairo00@example.com',79792030177,'22c0c894419884a45afe4595bfbf852f6fdf2fa6',_binary '\0'),(12,'Pink','Windler','salvatore.bode@example.com',79803761748,'74d8a8c7f0b578704baf7006763cb3bb4e4b9f64',_binary '\0'),(13,'Zetta','Marks','stefan.kshlerin@example.com',79881252900,'ce5c40dd55e8311453f246ebd2f1a55e592a6c5d',_binary '\0'),(14,'Flossie','Ebert','legros.holden@example.net',79282850832,'4e36f911e969d280748fc022b7f292c5edf79c45',_binary '\0'),(15,'Everett','Hickle','qthiel@example.net',79538575336,'fbf10e4aa4402ade11ba2c0d9bbf004c559c968e',_binary '\0'),(16,'Monserrate','Schneider','xswift@example.net',79254366265,'57949641ac6099fcad654a775b79254f6cc169a5',_binary '\0'),(17,'Marshall','Schmidt','reichel.glen@example.org',79990099477,'cf976934ca682cd823bb8d699ef5b397fd2ec05c',_binary '\0'),(18,'Jeff','Hills','prunte@example.org',79145407406,'04a2f1e150d08ea384b15ee3a33c6b891d126c8e',_binary '\0'),(19,'Juliet','Beatty','jace.ritchie@example.com',79511740297,'ad8506cea616d28312470082ee874c495f8c1a95',_binary '\0'),(20,'Willis','O\'Kon','percival.towne@example.net',79341579265,'209b5747e0ae12bc798bf1f49e715c9abd4c16f7',_binary '\0'),(21,'Kendrick','Yundt','minnie.corwin@example.org',79267085118,'987fd2cc5b65f7cd62ce2e8d1aad6ffadf8703c3',_binary '\0'),(22,'Jimmie','Howell','marty70@example.net',79667378837,'d6ea26c118aa1afc39dc5550ac569376d992c210',_binary '\0'),(23,'Bryce','O\'Hara','ckohler@example.org',79147567833,'983c45fc643cb989d37d5d83b4f0d8467b6c8447',_binary '\0'),(24,'Dayana','Block','windler.dixie@example.org',79441551280,'135622b9ab22f6464e6b346bbf4edfd7f2b5b205',_binary '\0'),(25,'Joana','Ferry','deanna.watsica@example.com',79665241770,'4da70550d8b38b63997856d77b16e9f1abd167cc',_binary '\0'),(26,'Ernesto','Shanahan','kenneth.hayes@example.org',79806561168,'fd46808c6250c2bd055e63df4211410afadc6a62',_binary '\0'),(27,'Kenna','Pfannerstill','bpredovic@example.net',79638288684,'543cba20bd15fd42785c012363df3973d5b9e06a',_binary '\0'),(28,'Eloisa','Prohaska','hettinger.leatha@example.net',79865868750,'653d8ff629f16f9c7fedab349795f3ee379e8566',_binary '\0'),(29,'Gayle','Beahan','jo.murray@example.org',79612913273,'f7075184fd9c34c962a33c599f01eb19e6a84e4a',_binary '\0'),(30,'Theron','Shanahan','percival.schimmel@example.com',79894851517,'284f98ede1946ffa78421c79250a53e46f748f60',_binary '\0'),(31,'Larue','Howell','odie.kshlerin@example.com',79140061815,'e2536271a017c1a395bf4b235c7c450e11b4f8ab',_binary '\0'),(32,'Ramon','Wolf','wade48@example.com',79777451539,'84250f081a7271fefbda7df5a877343bfef0bde7',_binary '\0'),(33,'Santa','Schmidt','caroline.hagenes@example.com',79474244178,'13cc737939487e3251e87ad2c3d93b1a845e9b58',_binary '\0'),(34,'Eleazar','Leuschke','kherzog@example.com',79865200510,'9bfe78e45ef14dfdead2d904aecd424cb45e63f6',_binary '\0'),(35,'Santino','Monahan','maddison.keeling@example.net',79552440358,'689aff1b5155787d43c0fcf5bfb7b59203e1d185',_binary '\0'),(36,'Abagail','Reinger','lavinia72@example.com',79207642148,'d06343a5f921bf87a1d014dd8f2d1aa3096b3fe1',_binary '\0'),(37,'Lonie','VonRueden','sstark@example.org',79261875273,'ec1e4cb0c774e2c58e5f98a598b733ace2a0b052',_binary '\0'),(38,'Jerrell','Sipes','macejkovic.ryan@example.com',79598313711,'8b4c27c86f0f33346367fda49f0503b289b5e5d4',_binary '\0'),(39,'Catherine','Osinski','samara15@example.com',79967284697,'92dcd37bc65b51914698a2a7415f960d58ad0bfa',_binary '\0'),(40,'Germaine','Reilly','mertie85@example.com',79155831569,'c6acd48320781587f704b2a5d95f4dde12435386',_binary '\0'),(41,'Kaylin','Ruecker','reanna63@example.org',79695280836,'87fd755d0e0781610be52f0316c049844e3e42d8',_binary '\0'),(42,'Maxie','Deckow','xhills@example.net',79742171558,'5814938bbbba5ce03cd682633a85c70322119eed',_binary '\0'),(43,'Dana','Blanda','laurine.jacobson@example.net',79273258917,'e2ae5b519fe8cfe16c60d9640dbcc755b99a6894',_binary '\0'),(44,'Daphnee','Gutkowski','chaya25@example.com',79363855459,'b0acf9a6c41accc621a835aebf3b922ff126e4de',_binary '\0'),(45,'Jovanny','Fahey','samanta78@example.net',79173463172,'78007608ad4810944db74e1ee4a5b36e738521bd',_binary '\0'),(46,'Amina','Dicki','eleonore.kub@example.com',79277511603,'435b55541b6053dac0795b612f25dd5f319cf3a6',_binary '\0'),(47,'Emmett','Hintz','rohan.myles@example.org',79559046096,'ed1757f3f4fbf808479d66137288b8268122b17b',_binary '\0'),(48,'Brittany','Waters','goldner.bernardo@example.org',79610081526,'497b4ab94e16dd2abe6715c401e6d798f3ee9696',_binary '\0'),(49,'Porter','Hane','lucie.bednar@example.net',79261649893,'ab8c7a2fbc43b4681e0033390ec6ceb0cfa8e6c5',_binary '\0'),(50,'Marian','Cormier','miracle.hickle@example.com',79548173519,'d1cfe937e2a1b1a80546c42daff89a12eccf930a',_binary '\0'),(51,'Clark','Blanda','blick.henry@example.com',79470244722,'3130d6db9fa8e50ce9add8a4263cd8e879c80baf',_binary '\0'),(52,'Josefina','Zieme','virgie.dicki@example.net',79041534173,'42971536f449d20def395d6d3a2f20b6ab9ba882',_binary '\0'),(53,'Leila','Kemmer','irma71@example.com',79028363972,'80c3ffcc97751b2b5b0993a8514da3e5475507ab',_binary '\0'),(54,'Era','O\'Keefe','michale49@example.org',79994758179,'b19178562f128185dafbc1dfa647584117ceb369',_binary '\0'),(55,'Vena','Feeney','bwalsh@example.org',79255012538,'a00afd8471bf24c51401cf6eec002da3791f72eb',_binary '\0'),(56,'Jorge','Sporer','ucremin@example.net',79399686879,'c0f3b021d4e4bfe21d08385736a9c9eeae11d011',_binary '\0'),(57,'Josianne','Reynolds','larry.nienow@example.net',79604936857,'18b42b3321ef0c2cd36620ac9ff62e882a6149ea',_binary '\0'),(58,'Scottie','Predovic','kcruickshank@example.org',79004707624,'8fc8f3228e9ddef108421c6542062fc21633ec49',_binary '\0'),(59,'Briana','Grimes','jazmyne.huel@example.net',79375925616,'a06dfbed67c9c3e267afc6ce499866421792a70a',_binary '\0'),(60,'Alice','Reichert','kuhlman.keegan@example.net',79002529426,'5d3be14851dc33bd211c50500770bfdbcbf1f9c0',_binary '\0'),(61,'Nathanial','Hamill','joan71@example.org',79614430407,'e137828c02abfdc6a8a49205392e572a1eeea655',_binary '\0'),(62,'Kathlyn','Nicolas','jmorissette@example.org',79590939130,'c9e4687c0adecb8967ce29dc3bcdc4c647ec7113',_binary '\0'),(63,'Dariana','Yost','jaycee.stark@example.net',79300448625,'5c4da624d65e2ddad569f5f02dc68130b83847bc',_binary '\0'),(64,'Verlie','Raynor','reichel.yasmeen@example.org',79995122270,'047667ca21892f937d1869adfeaba3e85c219058',_binary '\0'),(65,'Troy','Batz','rframi@example.com',79028906207,'a25048cdfddca85404651fef147d24fbd9bd9c04',_binary '\0'),(66,'Arielle','Kub','deonte19@example.net',79793544787,'44882eab1c5c3c3915a11d784ac578ae289611b7',_binary '\0'),(67,'Athena','Baumbach','parker.schuster@example.org',79534052431,'a1a76dc76d84159bae3c89b9984196faf0945629',_binary '\0'),(68,'Lawson','Will','breitenberg.jon@example.com',79824063452,'977662a0beb714b844a1deea6dbd52cefeed4669',_binary '\0'),(69,'Dereck','Medhurst','mnolan@example.com',79708761290,'c76a64ce9b8b1861dff1b8ae8f67391b6878a837',_binary '\0'),(70,'Erin','O\'Hara','rbradtke@example.net',79044786033,'fa96882684dc66897bae339647762322406a8c77',_binary '\0'),(71,'Milton','Towne','hcummings@example.com',79825683284,'8b170d0449e7610e37335f294155f68b930ca417',_binary '\0'),(72,'Kaci','Rau','bessie.quitzon@example.net',79518250394,'0ab89cec52a686a04ab734a963933efa7c2bad0c',_binary '\0'),(73,'Darian','Beatty','eichmann.amelia@example.org',79547014738,'73283b524828b885d6ba14654f97ac276d3fc381',_binary '\0'),(74,'Elnora','Dibbert','elliott35@example.org',79266328752,'7dda0031ff6413c2a043de732a3ca8ff24586ec8',_binary '\0'),(75,'Madilyn','Jacobs','reichel.ayla@example.com',79514397794,'e1994b211797549e5370717b457484ee884796f5',_binary '\0'),(76,'Bertram','Cremin','simonis.edyth@example.org',79704408021,'10c5988861ca5a4e14cc0d898c8175a281f99ca8',_binary '\0'),(77,'Leanna','Kilback','jarrett.schuppe@example.net',79320647622,'d9ef351fa120b2492aa4a8514dde5c8e616cb248',_binary '\0'),(78,'Virginie','Schultz','adrain92@example.org',79425618095,'64fde99066f007355ee380d9363452ae0a7e3439',_binary '\0'),(79,'Lea','Funk','chelsea.graham@example.org',79242431397,'f4391ddb44cd31ccbb30f1b6bf66506db08faa21',_binary '\0'),(80,'Selmer','Ledner','ajerde@example.org',79430694319,'b3cc4a7ca565e5d0e5ffa3e45b0a3b958df50e09',_binary '\0'),(81,'Austen','Bartoletti','hershel.bartell@example.com',79590961260,'7d7b823f3b10d77ee79fb14c79516065718edcf8',_binary '\0'),(82,'Lavonne','Thiel','larson.mafalda@example.org',79517232613,'347b7fff4e81b2634da35f3f3e161f7f3520ffda',_binary '\0'),(83,'Susanna','Harvey','tremblay.keira@example.net',79506477360,'3e285078299677b8922b3416d04238d3b04cdbbf',_binary '\0'),(84,'Sonya','Yundt','hosinski@example.net',79045902737,'c8a0fa1283abc5f83073e7dbb8bfa985c88d8201',_binary '\0'),(85,'Sabryna','Luettgen','jordyn56@example.com',79829168724,'f978053195f7421bcf0e1075e73960ea60d341df',_binary '\0'),(86,'Clementine','Emmerich','ramon.cormier@example.com',79996582020,'a8ebba00f7c5ed09a6610b06431cde3e6695ba67',_binary '\0'),(87,'Skyla','Hoeger','luigi.jacobi@example.net',79694581639,'53764b3aca89c54de484a1217c3d9af23f8996aa',_binary '\0'),(88,'Garrett','Becker','ruecker.sydnie@example.net',79281252763,'93b574205f33f5551680d6c7fbe3fe3e5a64f9f9',_binary '\0'),(89,'Elvis','Graham','merl.hintz@example.net',79186946253,'fc36c19e24e12e424d858bc63fbd3dd015ec7aac',_binary '\0'),(90,'Kacey','Bruen','reilly.garrett@example.com',79114319487,'b9617002c2dfee63f044f15fad2acf830011c980',_binary '\0'),(91,'Aiden','Hartmann','valentine70@example.org',79293178358,'2dec9205663dd28bfe57664e1f685de33ef4ad06',_binary '\0'),(92,'Margret','Kuhlman','blanche77@example.org',79786416110,'2e43556c30df29dbd9003c49994a2a85eee2d21a',_binary '\0'),(93,'Brooke','Runolfsdottir','gracie.altenwerth@example.com',79259990738,'d0fcc881d022cd7d93424d61058e4f2e994832b5',_binary '\0'),(94,'Halie','Keeling','edmund08@example.org',79747448671,'f4b5c9523b2115331e3bf42c58563e7533731aaf',_binary '\0'),(95,'Andy','Bernhard','montana.wolf@example.org',79453611801,'c72d1de004452fd27d7c900048b1a6e96a45c007',_binary '\0'),(96,'Fatima','Quigley','rvon@example.net',79238584626,'52781f9bd95adeed6c57f3a587a35fec0a5ef897',_binary '\0'),(97,'Francesco','Hamill','lynch.fred@example.net',79318200389,'e034043a8ecf377969fe59f89defdfd2c3df29e1',_binary '\0'),(98,'Cheyenne','Murphy','gunner.rolfson@example.net',79580927359,'1c956e1516523d09015942a75d4a729ccc21f027',_binary '\0'),(99,'August','Green','anissa92@example.net',79609427693,'e1b332a11e5f9a5a75ea2a76a795ceb28d8c527d',_binary '\0'),(100,'Camila','Christiansen','tjaskolski@example.net',79727532896,'031a439358402d5e8dcb97234a4e7cb79762493b',_binary '\0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_communities` (
  `user_id` int NOT NULL,
  `community_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `fk_users_communutuies_users1_idx` (`user_id`),
  KEY `fk_users_communutuies_communities1_idx` (`community_id`),
  CONSTRAINT `fk_users_communutuies_communities1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_users_communutuies_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (5,1),(5,3),(6,5),(7,2),(7,5),(9,5),(9,9),(9,10),(10,5),(13,1),(13,3),(13,9),(17,6),(18,4),(18,6),(20,4),(20,7),(20,9),(21,2),(21,3),(22,5),(22,6),(22,7),(22,8),(23,1),(23,6),(23,7),(24,4),(25,10),(27,6),(27,9),(29,3),(30,6),(30,7),(30,8),(32,3),(32,4),(33,10),(36,1),(38,7),(38,8),(39,1),(39,9),(42,9),(43,6),(44,2),(47,6),(47,8),(49,1),(51,1),(51,3),(53,3),(53,4),(54,2),(55,1),(55,10),(56,5),(56,9),(60,5),(60,7),(62,4),(65,3),(65,6),(66,1),(67,2),(68,4),(69,1),(69,6),(70,6),(70,9),(70,10),(71,4),(76,9),(79,6),(80,4),(80,8),(81,10),(82,5),(85,9),(86,6),(87,3),(87,7),(87,10),(89,8),(90,2),(90,10),(91,4),(91,5),(93,2),(93,7),(93,9),(94,5),(96,5),(98,6),(99,6),(99,8),(99,10);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-19 17:09:00
