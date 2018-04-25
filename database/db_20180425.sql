-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: db_travelapp
-- ------------------------------------------------------
-- Server version	5.6.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `position` int(11) DEFAULT NULL,
  `thumbnailUrl` varchar(255) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (18,'Internet',1,NULL,6,NULL,NULL),(19,'Family Friendly',2,NULL,6,NULL,NULL),(20,'Kitchen',3,NULL,6,NULL,NULL),(21,'Wifi',4,NULL,6,NULL,NULL),(22,'TV',5,NULL,6,NULL,NULL),(23,'Internet',1,NULL,7,NULL,NULL),(24,'Family Friendly',NULL,NULL,7,NULL,NULL),(25,'Kitchen',NULL,NULL,7,NULL,NULL);
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `description` text,
  `type` int(11) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Day plan',NULL,1,'2018-04-01 22:54:47.684','2018-04-01 22:54:47.506'),(2,'Thing to do',NULL,1,'2018-04-01 22:54:59.108','2018-04-01 22:54:59.028'),(3,'Food & Drink',NULL,1,'2018-04-01 22:55:04.045','2018-04-01 22:55:03.954'),(4,'Flights',NULL,1,'2018-04-01 22:55:08.527','2018-04-01 22:55:08.472'),(5,'Hotels',NULL,1,'2018-04-01 22:55:13.321','2018-04-01 22:55:13.223'),(6,'Breakfirst',NULL,2,'2018-04-01 22:54:47.684','2018-04-01 22:54:47.684'),(7,'Dinner',NULL,2,'2018-04-01 22:54:47.684','2018-04-01 22:54:47.684'),(8,'Coffes',NULL,2,'2018-04-01 22:54:47.684','2018-04-01 22:54:47.684'),(9,'Wine bars',NULL,2,'2018-04-01 22:54:47.684','2018-04-01 22:54:47.684'),(10,'On Arrival','Ha Noi\'s Noi Bai International Airport (HAN) is located about 45km north of the city center. The easiest mode of transport from the airport is a taxi or ride service, though taxis can be expensive.',3,'2018-04-01 22:54:47.684','2018-04-01 22:54:47.684'),(11,'Public Transport','After exiting the Arrivals terminal, you\'ll need to cross the street to the taxi line. The Arrivals terminal who can help direct you:',3,'2018-04-01 22:54:47.684','2018-04-01 22:54:47.684'),(12,'Taxi/Ride Service','After exiting the Arrivals terminal, you\'ll need to cross the street to the taxi line. The Arrivals terminal who can help direct you:',3,'2018-04-01 22:54:47.684','2018-04-01 22:54:47.684');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_store`
--

DROP TABLE IF EXISTS `core_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` text,
  `value` text,
  `environment` text,
  `type` text,
  `tag` text,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `core_store_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `core_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store`
--

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` VALUES (1,'plugin_upload_provider','{\"enabled\":true,\"provider\":\"local\",\"sizeLimit\":100000000}','development','object','',NULL),(2,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-official\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"redirect_uri\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"}}','','object','',NULL),(3,'core_application','{\"name\":\"Default Application\",\"description\":\"This API is going to be awesome!\"}','','object','',NULL),(4,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"refresh\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"­Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}}}','','object','',NULL),(5,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true}','','object','',NULL);
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `description` text,
  `late7` int(11) DEFAULT NULL,
  `lnge7` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `address` text,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ratingHistogram` float DEFAULT NULL,
  `reviewsCount` int(11) DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `mood_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (1,'Chùa Một Cột','Rebuilt iconic Buddhist temple, originally erected in 1049, designed to resemble a lotus bloosson.',210343299,1058315194,'/uploads/26d54a2e6a064843838a1e662bfc58aa.jpg','Lê Lợi, Minh An, TP Hội An, Quảng Nam, Việt Nam','01699809770','https://developer.android.com',4.3,150,150,3,1,NULL,1,'2018-03-25 13:24:25',NULL),(2,'Hoàn Kiếm Lake','Hoan Kiem Lake also known as Hồ Gươm (Sword Lake), is a lake in the historical center of Hanoi, the capital city of Vietnam. The lake is one of the major scenic spots in the city and serves as a focal point for its public life.',210343299,1058315194,'/uploads/10b5f0cd41a54ba086e07b32feb95598.jpg','Lê Lợi, Minh An, TP Hội An, Quảng Nam, Việt Nam','01699809770','https://developer.android.com',3.5,350,150,3,2,NULL,1,'2018-04-05 23:51:39.408',NULL),(3,'Văn Miếu - Quốc Tử Giám','Văn Miếu - Quốc Tử Giám is a Temple of Confucius in Hanoi, northern Vietnam. The temple hosts the \"Imperial Academy\" (Quốc Tử Giám, 國子監), Vietnam\'s first national university. The temple was built in 1070 at the time of Emperor Lý Thánh Tông. It is one of several temples in Vietnam which is dedicated to Confucius, sages and scholars. The temple is located to the south of the Imperial Citadel of Thăng Long. The various pavilions, halls, statues and stelae of doctors are places where offering ceremonies, study sessions and the strict exams of the Đại Việt took place. The temple is featured on the back of the 100,000 Vietnamese đồng banknote. Just before the Vietnamese New Year celebration Tết, calligraphists will assemble outside the temple and write wishes in Hán characters. The art works are given away as gifts or are used as home decorations for special occasions.',210343299,1058315194,'/uploads/5dc40fab30b74d62953527a2883feaa6.jpg','Lê Lợi, Minh An, TP Hội An, Quảng Nam, Việt Nam','01699809770','https://developer.android.com',4,200,150,2,2,NULL,1,'2018-04-05 23:51:53.289',NULL),(4,'An Giang Mùa Nước Nổi','An Giang is a province of Vietnam. It is located in the Mekong Delta, in the southwestern part of the country, sharing a border with Cambodia to the northwest.',210343299,1058315194,'/uploads/905652cf907442ff88da47e780543235.jpg','Lê Lợi, Minh An, TP Hội An, Quảng Nam, Việt Nam','01699809770','https://developer.android.com',2.7,100,150,1,2,NULL,1,'2018-04-05 23:52:25.942',NULL),(5,'Mộc Châu','Mộc Châu đẹp như tranh những ngày đầu xuân.',210343299,1058315194,'/uploads/6b98cef61b3346ab8d55541460820588.jpg','Lê Lợi, Minh An, TP Hội An, Quảng Nam, Việt Nam','01699809770','https://developer.android.com',4,250,250,2,1,NULL,1,'2018-04-05 23:52:48.871',NULL),(6,'Villa Sông Saigon','Villa Sông Saigon',2103432990,1058315194,'/uploads/edb87ccc1f4847fa8ceaf9d13789913f.jpg','197/2 Nguyễn Văn Hưởng, Q.2, Thành phố Hồ Chí Minh, Việt Nam','01664646646','https://developer.android.com',NULL,NULL,NULL,1,NULL,NULL,2,'2018-04-07 14:15:41.729',NULL),(7,'Sofitel Sài Gòn Plaza','Sofitel Sài Gòn Plaza',2103432990,1058315194,'/uploads/922fbdcffb14436d8e565aa5299e97a7.jpg','17 Le Duan Boulevard | District 1, Thành phố Hồ Chí Minh, Việt Nam ','01664646646','https://developer.android.com',NULL,NULL,NULL,1,NULL,NULL,2,'2018-04-07 14:17:55.194',NULL),(8,'Khách sạn New World Sài Gòn','Khách sạn New World Sài Gòn',2103432990,1058315194,'/uploads/3317ef164fee40828008621818f17640.jpg','76 Le Lai Street, District 1, Thành phố Hồ Chí Minh, Việt Nam','01664646646','https://developer.android.com',NULL,NULL,NULL,1,NULL,NULL,2,'2018-04-07 14:18:38.380',NULL),(9,'Khách sạn Asian Ruby','Khách sạn Asian Ruby',2103432990,1058315194,'/uploads/65bd9d2bd55f41deb6f6af732ff5a5d8.jpg','26 Thi Sach Street | Ben Nghe Ward, District 1, Thành phố Hồ Chí Minh, Việt Nam','01664646646','https://developer.android.com',NULL,NULL,NULL,2,NULL,NULL,2,'2018-04-07 14:19:43.900',NULL),(10,'Hotel Nikko Saigon','Hotel Nikko Saigon',2103432990,1058315194,'/uploads/677e0818f6714032b55b433c6520c444.jpg','235 Nguyen Van Cu, Thành phố Hồ Chí Minh, Việt Nam','01664646646','https://developer.android.com',NULL,NULL,NULL,2,NULL,NULL,2,'2018-04-07 14:20:19.863',NULL),(13,'KFC Nguyễn Thị Minh Khai','KFC Nguyễn Thị Minh Khai',2103432990,1058315194,'/uploads/1382815c1db64adca8c441e34ff91de8.jpg','26 Thi Sach Street | Ben Nghe Ward, District 1, Thành phố Hồ Chí Minh, Việt Nam','0120 347 8479','https://developer.android.com',NULL,NULL,NULL,1,NULL,6,3,'2018-04-07 18:12:15.537',NULL),(14,'Pizza Hut Cách Mạng Tháng Tám','Pizza Hut Cách Mạng Tháng Tám',2103432990,1058315194,'/uploads/b42e19b0aad344bc90e15e6f843d495d.jpg','Hoàng Diệu 2, Linh Chiểu, Hồ Chí Minh','0120 347 8479','https://developer.android.com',NULL,NULL,NULL,1,NULL,6,3,'2018-04-07 18:11:50.074',NULL),(15,'Cà Phê Tí Tách','Cà Phê Tí Tách',2103432990,1058315194,'/uploads/faf8fc76a13a4b4a8efd1c16fc9c856f.jpg','7 Phan Văn Trị, P. 10,  Quận Gò Vấp, TP. HCM, Viet Name','01664646646','https://developer.android.com',NULL,NULL,NULL,1,NULL,7,3,'2018-04-07 18:11:35.588',NULL),(16,'Rex Hotel Rooftop Bar','Rex Hotel Rooftop Bar',2103432990,1058315194,'/uploads/c77325aaac1443e0b1c0249eef9c3d97.jpg','141 Nguyen Hue Blvd | District 1, Thành phố Hồ Chí Minh, Việt Nam','(84-8)829 2185','https://developer.android.com',NULL,NULL,NULL,1,NULL,8,3,'2018-04-07 18:12:43.031',NULL),(17,'Chill Skybar','Chill Skybar',2103432990,1058315194,'/uploads/c77325aaac1443e0b1c0249eef9c3d97.jpg','76A Lê Lai, Quận 1 | Tầng thượng Tòa nhà AB Tower, Thành phố Hồ Chí Minh, Việt Nam','01664646646','https://developer.android.com',NULL,NULL,NULL,1,NULL,9,3,'2018-04-07 18:12:39.518',NULL);
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guidelines`
--

DROP TABLE IF EXISTS `guidelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guidelines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `description` text,
  `photo` text,
  `category_id` int(11) DEFAULT '0',
  `updated_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guidelines`
--

LOCK TABLES `guidelines` WRITE;
/*!40000 ALTER TABLE `guidelines` DISABLE KEYS */;
INSERT INTO `guidelines` VALUES (5,'On Arrival','Ha Noi\'s Noi Bai International Airport (HAN) is located about 45km north of the city center. The easiest mode of transport from the airport is a taxi or ride service, though taxis can be expensive.',NULL,10,NULL,NULL),(6,'Taxi','After exiting the Arrivals terminal, you\'ll need to cross the street to the taxi line. The Arrivals terminal who can help direct you:',NULL,10,NULL,NULL),(7,'Ride service','Ride services such as Uber and Grab are an alternative to taxis, matching passengers with cars via mobile app.',NULL,10,NULL,NULL),(8,'Public Transport','After exiting the Arrivals terminal, you\'ll need to cross the street to the taxi line. The Arrivals terminal who can help direct you:',NULL,11,NULL,NULL),(9,'Taxi/Ride Service','After exiting the Arrivals terminal, you\'ll need to cross the street to the taxi line. The Arrivals terminal who can help direct you:',NULL,12,NULL,NULL);
/*!40000 ALTER TABLE `guidelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `hotelClass` float DEFAULT NULL,
  `prices` float DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,6,1,900,'2018-04-07 14:15:41.729',NULL),(2,7,5,100,'2018-04-07 14:17:55.194',NULL),(3,8,5,400,'2018-04-07 14:18:38.380',NULL),(4,9,5,500,'2018-04-07 14:19:43.900',NULL),(5,10,5,540,'2018-04-07 14:20:19.863',NULL);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landmarks`
--

DROP TABLE IF EXISTS `landmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(45) DEFAULT NULL,
  `indoorType` varchar(45) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landmarks`
--

LOCK TABLES `landmarks` WRITE;
/*!40000 ALTER TABLE `landmarks` DISABLE KEYS */;
INSERT INTO `landmarks` VALUES (1,'1',NULL,'2018-03-25 13:24:25',NULL),(2,'2',NULL,'2018-04-05 23:51:39.408',NULL),(3,'3',NULL,'2018-04-05 23:51:53.289',NULL),(4,'4',NULL,'2018-04-05 23:52:25.942',NULL),(5,'5',NULL,'2018-04-05 23:52:48.871',NULL);
/*!40000 ALTER TABLE `landmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moods`
--

DROP TABLE IF EXISTS `moods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `position` int(11) DEFAULT NULL,
  `photo` text,
  `updated_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moods`
--

LOCK TABLES `moods` WRITE;
/*!40000 ALTER TABLE `moods` DISABLE KEYS */;
INSERT INTO `moods` VALUES (1,'Top spots',1,NULL,'2018-04-05 23:22:56.575','2018-04-05 23:22:55.702'),(2,'For you',2,NULL,'2018-04-05 23:22:56.575','2018-04-05 23:22:55.702'),(3,'Places A-Z',3,NULL,'2018-04-05 23:22:56.575','2018-04-05 23:22:56.575');
/*!40000 ALTER TABLE `moods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` text,
  `field` text,
  `updated_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,7,4,'landmarks','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.216'),(2,8,4,'landmarks','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.216'),(3,33,1,'landmarks','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.216'),(4,34,1,'landmarks','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.216'),(5,35,2,'landmarks','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.216'),(6,9,4,'landmarks','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.216'),(7,10,4,'landmarks','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.216'),(8,11,4,'landmarks','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.216'),(9,42,1,'hotels','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.365'),(10,42,2,'hotels','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.365'),(11,43,3,'hotels','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.365'),(12,44,4,'hotels','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.365'),(13,45,5,'hotels','photos','2018-03-25 15:35:15.365','2018-03-25 15:35:15.365');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (11,13,6,'2018-04-07 18:12:15.537',NULL),(12,14,6,'2018-04-07 18:11:50.074',NULL),(13,15,7,'2018-04-07 18:11:35.588',NULL),(14,16,8,'2018-04-07 18:12:43.031',NULL),(15,17,9,'2018-04-07 18:12:39.518',NULL);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `text` text,
  `rating` int(11) DEFAULT '0',
  `reviewerName` varchar(255) DEFAULT NULL,
  `reviewerImageUrl` varchar(255) DEFAULT NULL,
  `timeStamp` int(11) DEFAULT '0',
  `entity_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'Good Design','Good Design',5,'john henry',NULL,100000000,1,1,'2018-04-07 18:12:15.537','2018-04-07 18:12:15.537'),(2,'Clean Code','Clean Code',4,'john henry',NULL,100000000,2,1,'2018-04-07 18:12:15.537','2018-04-07 18:12:15.537'),(5,'Review 1','Review 1',3,'Do Nguyen',NULL,100000000,1,1,'2018-04-07 18:12:15.537','2018-04-07 18:12:15.537'),(6,'Review 2','Review 2',3,'Do Nguyen',NULL,100000000,1,1,'2018-04-07 18:12:15.537','2018-04-07 18:12:15.537'),(7,'Review 3','Review 3',3,'Do Nguyen',NULL,100000000,1,1,'2018-04-07 18:12:15.537','2018-04-07 18:12:15.537');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `photo` text,
  `status` int(11) DEFAULT '0',
  `updated_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,'An Giang','2018-03-25 00:00:00','2018-03-25 00:00:00','/uploads/bd5ddd3125394e8aa6b7793c3e3b29f6.jpg',0,'2018-04-01 22:45:43.117',NULL),(2,'Tây Bắc','2018-03-25 00:00:00','2018-03-25 00:00:00','/uploads/7999809045a147edbe11526993024231.jpg',0,'2018-04-07 10:36:30.963',NULL),(3,'Hạ Long','2018-03-25 00:00:00','2018-03-25 00:00:00','/uploads/560077b3bb4a4e0e8f8599d0c2c7ad9c.jpg',0,'2018-04-07 10:36:34.615',NULL),(4,'Phan Thiết','2018-03-25 00:00:00','2018-03-25 00:00:00','/uploads/e48d55c0289c41b0a1f8505fc2a706c4.jpg',0,'2018-04-07 10:36:41.179',NULL),(5,'Hà Nội','2018-03-25 00:00:00','2018-03-25 00:00:00','/uploads/e48d55c0289c41b0a1f8505fc2a706c4.jpg',0,'2018-04-07 10:36:41.179',NULL),(6,'TP Hồ Chí Minh','2018-03-25 00:00:00','2018-03-25 00:00:00','/uploads/e48d55c0289c41b0a1f8505fc2a706c4.jpg',0,'2018-04-07 10:36:41.179',NULL),(7,'Hội An','2018-03-25 00:00:00','2018-03-25 00:00:00','/uploads/7999809045a147edbe11526993024231.jpg',0,'2018-04-07 10:36:41.179',NULL),(8,'Vũng Tàu','2018-03-25 00:00:00','2018-03-25 00:00:00','/uploads/7999809045a147edbe11526993024231.jpg',0,'2018-04-07 10:36:41.179',NULL),(9,'TP Nha Trang','2018-03-25 00:00:00','2018-03-25 00:00:00','/uploads/7999809045a147edbe11526993024231.jpg',0,'2018-04-07 10:36:41.179',NULL),(10,'Đà Nẵng','2018-03-25 00:00:00','2018-03-25 00:00:00','/uploads/7999809045a147edbe11526993024231.jpg',0,'2018-04-07 10:36:41.179',NULL);
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `hash` text,
  `ext` text,
  `mime` text,
  `size` text,
  `url` text,
  `provider` text,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `undefined` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file`
--

LOCK TABLES `upload_file` WRITE;
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
INSERT INTO `upload_file` VALUES (1,'161204205354_33902024.jpg','560077b3bb4a4e0e8f8599d0c2c7ad9c','.jpg','image/jpeg','141.87','/uploads/560077b3bb4a4e0e8f8599d0c2c7ad9c.jpg','local','2018-03-25 03:35:59','2018-03-25 03:35:59',NULL),(2,'161205220956_xengallery_photos_l_76912_24685e0514d3a21ad55208c8d1febeb7.jpg','7999809045a147edbe11526993024231','.jpg','image/jpeg','651.07','/uploads/7999809045a147edbe11526993024231.jpg','local','2018-03-25 03:37:18','2018-03-25 03:37:18',NULL),(3,'161205010023_3913349_huynhphuchau_camera.tinhte.vn.jpg','bd5ddd3125394e8aa6b7793c3e3b29f6','.jpg','image/jpeg','243.70','/uploads/bd5ddd3125394e8aa6b7793c3e3b29f6.jpg','local','2018-03-25 03:37:59','2018-03-25 03:37:59',NULL),(4,'161205225916_xengallery_photos_l_76824_f68db9094b9347b03bd870971e9f9c64.jpg','e48d55c0289c41b0a1f8505fc2a706c4','.jpg','image/jpeg','699.08','/uploads/e48d55c0289c41b0a1f8505fc2a706c4.jpg','local','2018-03-25 03:38:26','2018-03-25 03:38:26',NULL),(5,'161204205354_33902029.jpg','7fe05955fa794fc3aa8357fb3f1e14ad','.jpg','image/jpeg','110.25','/uploads/7fe05955fa794fc3aa8357fb3f1e14ad.jpg','local','2018-03-25 04:43:55','2018-03-25 04:43:55',NULL),(6,'161204205354_33902026.jpg','9e32839b452b407f94adc5e0c41c0bee','.jpg','image/jpeg','71.88','/uploads/9e32839b452b407f94adc5e0c41c0bee.jpg','local','2018-03-25 04:43:55','2018-03-25 04:43:55',NULL),(7,'161205010016_3913341_huynhphuchau_camera.tinhte.vn-3.jpg','576bc92e8b754fec94f244df0d300748','.jpg','image/jpeg','266.43','/uploads/576bc92e8b754fec94f244df0d300748.jpg','local','2018-03-25 04:44:11','2018-03-25 04:44:11',NULL),(8,'161205010018_3913343_huynhphuchau_camera.tinhte.vn-7.jpg','6bc1443ee01d4dfc920deb3b842b4696','.jpg','image/jpeg','308.43','/uploads/6bc1443ee01d4dfc920deb3b842b4696.jpg','local','2018-03-25 04:44:11','2018-03-25 04:44:11',NULL),(9,'161205010021_3913346_huynhphuchau_camera.tinhte.vn-9.jpg','fe7a8b49191441eb8a5da09c730d70e7','.jpg','image/jpeg','247.69','/uploads/fe7a8b49191441eb8a5da09c730d70e7.jpg','local','2018-03-25 04:44:11','2018-03-25 04:44:11',NULL),(10,'161205010023_3913349_huynhphuchau_camera.tinhte.vn.jpg','905652cf907442ff88da47e780543235','.jpg','image/jpeg','243.70','/uploads/905652cf907442ff88da47e780543235.jpg','local','2018-03-25 04:44:11','2018-03-25 04:44:11',NULL),(11,'161205010016_3913340_huynhphuchau_camera.tinhte.vn-2.jpg','61af2117ab9647c58082fe26d1e58323','.jpg','image/jpeg','259.02','/uploads/61af2117ab9647c58082fe26d1e58323.jpg','local','2018-03-25 04:44:11','2018-03-25 04:44:11',NULL),(12,'161205010023_3913347_huynhphuchau_camera.tinhte.vn-6.jpg','0ec64a99ac8f4352bdf2d89cd0524e99','.jpg','image/jpeg','356.04','/uploads/0ec64a99ac8f4352bdf2d89cd0524e99.jpg','local','2018-03-25 04:44:11','2018-03-25 04:44:11',NULL),(13,'161205010023_3913348_huynhphuchau_camera.tinhte.vn-10.jpg','d76b968659cf41cfa96abafc461f46eb','.jpg','image/jpeg','338.76','/uploads/d76b968659cf41cfa96abafc461f46eb.jpg','local','2018-03-25 04:44:11','2018-03-25 04:44:11',NULL),(14,'161205010020_3913345_huynhphuchau_camera.tinhte.vn-8.jpg','5d5f0cf299874700b88a77e39687f87a','.jpg','image/jpeg','333.18','/uploads/5d5f0cf299874700b88a77e39687f87a.jpg','local','2018-03-25 04:44:11','2018-03-25 04:44:11',NULL),(15,'161205010019_3913344_huynhphuchau_camera.tinhte.vn-4.jpg','2a6059280b6a4f32b93207b54ab2af54','.jpg','image/jpeg','279.38','/uploads/2a6059280b6a4f32b93207b54ab2af54.jpg','local','2018-03-25 04:44:11','2018-03-25 04:44:11',NULL),(16,'161205010017_3913342_huynhphuchau_camera.tinhte.vn-5.jpg','cc59d41a57a34be4b4b3b5526a774849','.jpg','image/jpeg','243.19','/uploads/cc59d41a57a34be4b4b3b5526a774849.jpg','local','2018-03-25 04:44:11','2018-03-25 04:44:11',NULL),(17,'161204210251_1026805.jpg','3b12165961614752a9fb67af6dac32b6','.jpg','image/jpeg','228.53','/uploads/3b12165961614752a9fb67af6dac32b6.jpg','local','2018-03-25 06:24:25','2018-03-25 06:24:25',NULL),(18,'161204205354_33902026.jpg','2ea315a587a04813a2c6c69f3865bcd3','.jpg','image/jpeg','71.88','/uploads/2ea315a587a04813a2c6c69f3865bcd3.jpg','local','2018-03-25 06:30:02','2018-03-25 06:30:02',NULL),(19,'161204205354_33902024.jpg','b6060c91dd2d4eac8ae17700fd1e750e','.jpg','image/jpeg','141.87','/uploads/b6060c91dd2d4eac8ae17700fd1e750e.jpg','local','2018-03-25 07:01:19','2018-03-25 07:01:19',NULL),(20,'161204205354_33902024.jpg','2b2ebe72c3c84ae7a7f6167e6352b8cc','.jpg','image/jpeg','141.87','/uploads/2b2ebe72c3c84ae7a7f6167e6352b8cc.jpg','local','2018-03-25 07:25:08','2018-03-25 07:25:08',NULL),(21,'161204205354_33902024.jpg','b632d96817914998a67eaa54ba57ddf2','.jpg','image/jpeg','141.87','/uploads/b632d96817914998a67eaa54ba57ddf2.jpg','local','2018-03-25 07:25:30','2018-03-25 07:25:30',NULL),(22,'161204205354_33902024.jpg','82d229410ec841079850b7156b368dc8','.jpg','image/jpeg','141.87','/uploads/82d229410ec841079850b7156b368dc8.jpg','local','2018-03-25 07:31:15','2018-03-25 07:31:15',NULL),(23,'161204205354_33902024.jpg','179b8b4afe8c472cac7ef14b43c47ea3','.jpg','image/jpeg','141.87','/uploads/179b8b4afe8c472cac7ef14b43c47ea3.jpg','local','2018-03-25 07:31:29','2018-03-25 07:31:29',NULL),(24,'161204205354_33902024.jpg','31c75e258cdc401a8e66d9e073a842c9','.jpg','image/jpeg','141.87','/uploads/31c75e258cdc401a8e66d9e073a842c9.jpg','local','2018-03-25 07:31:35','2018-03-25 07:31:35',NULL),(25,'161204205354_33902024.jpg','88a7d5e275004a22ba7c52c738d3f3a2','.jpg','image/jpeg','141.87','/uploads/88a7d5e275004a22ba7c52c738d3f3a2.jpg','local','2018-03-25 07:34:30','2018-03-25 07:34:30',NULL),(26,'161204205354_33902024.jpg','0ad20ff8e82845678f6fa71ab41b5ed1','.jpg','image/jpeg','141.87','/uploads/0ad20ff8e82845678f6fa71ab41b5ed1.jpg','local','2018-03-25 07:34:33','2018-03-25 07:34:33',NULL),(27,'161204205354_33902024.jpg','437cdcf6850d48b1b7befedef8b1092e','.jpg','image/jpeg','141.87','/uploads/437cdcf6850d48b1b7befedef8b1092e.jpg','local','2018-03-25 08:07:48','2018-03-25 08:07:48',NULL),(28,'161204205354_33902024.jpg','e75d12afca1e41c49df7bdd039a747f0','.jpg','image/jpeg','141.87','/uploads/e75d12afca1e41c49df7bdd039a747f0.jpg','local','2018-03-25 08:09:46','2018-03-25 08:09:46',NULL),(29,'161204205354_33902024.jpg','7f0c7e51b0734d0fb4e768be510fa400','.jpg','image/jpeg','141.87','/uploads/7f0c7e51b0734d0fb4e768be510fa400.jpg','local','2018-03-25 08:11:30','2018-03-25 08:11:30',NULL),(30,'161204205354_33902024.jpg','9cb0b930cdea461b88c38d3e7d05abee','.jpg','image/jpeg','141.87','/uploads/9cb0b930cdea461b88c38d3e7d05abee.jpg','local','2018-03-25 08:25:45','2018-03-25 08:25:45',NULL),(31,'161204205354_33902024.jpg','7b8e7bf23eea4018ae13c0815a82581f','.jpg','image/jpeg','141.87','/uploads/7b8e7bf23eea4018ae13c0815a82581f.jpg','local','2018-03-25 08:25:47','2018-03-25 08:25:47',NULL),(32,'161204205354_33902024.jpg','7d7966457bb34050b3ebf461bb92eb8c','.jpg','image/jpeg','141.87','/uploads/7d7966457bb34050b3ebf461bb92eb8c.jpg','local','2018-03-25 08:25:50','2018-03-25 08:25:50',NULL),(33,'161204205354_33902024.jpg','0e105c31ff064da98af5d53451169bb3','.jpg','image/jpeg','141.87','/uploads/0e105c31ff064da98af5d53451169bb3.jpg','local','2018-03-25 08:26:11','2018-03-25 08:26:11',NULL),(34,'161204205354_33902024.jpg','e993319957c54fc19708d0b3c4196808','.jpg','image/jpeg','141.87','/uploads/e993319957c54fc19708d0b3c4196808.jpg','local','2018-03-25 08:27:19','2018-03-25 08:27:19',NULL),(35,'161204205354_33902024.jpg','2fb51fe5d8ce4ff1b6c38666ba6745dc','.jpg','image/jpeg','141.87','/uploads/2fb51fe5d8ce4ff1b6c38666ba6745dc.jpg','local','2018-03-25 08:27:54','2018-03-25 08:27:54','[object Object]'),(36,'161204205354_33902024.jpg','10b5f0cd41a54ba086e07b32feb95598','.jpg','image/jpeg','141.87','/uploads/10b5f0cd41a54ba086e07b32feb95598.jpg','local','2018-03-25 14:58:13','2018-03-25 14:58:13','[object Object]'),(37,'161204205354_33902024.jpg','d32f2c923429477f9031ba4c25536c21','.jpg','image/jpeg','141.87','/uploads/d32f2c923429477f9031ba4c25536c21.jpg','local','2018-03-25 15:01:34','2018-03-25 15:01:34','[object Object]'),(38,'161204205354_33902024.jpg','8f27af48fe7b4a3f926c0bc5ad160ac8','.jpg','image/jpeg','141.87','/uploads/8f27af48fe7b4a3f926c0bc5ad160ac8.jpg','local','2018-03-25 15:03:21','2018-03-25 15:03:21','[object Object]'),(39,'161204205850_20420463.jpg','5dc40fab30b74d62953527a2883feaa6','.jpg','image/jpeg','221.02','/uploads/5dc40fab30b74d62953527a2883feaa6.jpg','local','2018-03-25 15:05:34','2018-03-25 15:05:34','[object Object]'),(40,'161204205850_20420463.jpg','26d54a2e6a064843838a1e662bfc58aa','.jpg','image/jpeg','221.02','/uploads/26d54a2e6a064843838a1e662bfc58aa.jpg','local','2018-04-05 16:47:57','2018-04-05 16:47:57',NULL),(41,'161205220956_xengallery_photos_l_76912_24685e0514d3a21ad55208c8d1febeb7.jpg','6b98cef61b3346ab8d55541460820588','.jpg','image/jpeg','651.07','/uploads/6b98cef61b3346ab8d55541460820588.jpg','local','2018-04-05 16:52:40','2018-04-05 16:52:39',NULL),(42,'171012232012_d6a8da0648f8c2a002fff95f6735b70f.jpg','edb87ccc1f4847fa8ceaf9d13789913f','.jpg','image/jpeg','115.68','/uploads/edb87ccc1f4847fa8ceaf9d13789913f.jpg','local','2018-04-07 07:15:24','2018-04-07 07:15:24',NULL),(43,'171012231728_the-pool-is-big-and-offers.jpg','922fbdcffb14436d8e565aa5299e97a7','.jpg','image/jpeg','457.34','/uploads/922fbdcffb14436d8e565aa5299e97a7.jpg','local','2018-04-07 07:17:48','2018-04-07 07:17:47',NULL),(44,'171012232526_photo2jpg.jpg','3317ef164fee40828008621818f17640','.jpg','image/jpeg','90.92','/uploads/3317ef164fee40828008621818f17640.jpg','local','2018-04-07 07:18:33','2018-04-07 07:18:33',NULL),(45,'171012232743_879b9c9c7637d3a6050b6dbaec9e97c2.jpg','65bd9d2bd55f41deb6f6af732ff5a5d8','.jpg','image/jpeg','104.45','/uploads/65bd9d2bd55f41deb6f6af732ff5a5d8.jpg','local','2018-04-07 07:19:39','2018-04-07 07:19:39',NULL),(46,'171014212440_45f17d39eaa9ce6240279bd911fe9709.jpg','677e0818f6714032b55b433c6520c444','.jpg','image/jpeg','125.43','/uploads/677e0818f6714032b55b433c6520c444.jpg','local','2018-04-07 07:20:16','2018-04-07 07:20:16',NULL),(47,'171014211909_photo3jpg.jpg','faf8fc76a13a4b4a8efd1c16fc9c856f','.jpg','image/jpeg','122.53','/uploads/faf8fc76a13a4b4a8efd1c16fc9c856f.jpg','local','2018-04-07 11:11:21','2018-04-07 11:11:21',NULL),(48,'171014205835_5589_290715134632_burger-comjpg.jpg','1382815c1db64adca8c441e34ff91de8','.jpg','image/jpeg','321.20','/uploads/1382815c1db64adca8c441e34ff91de8.jpg','local','2018-04-07 11:11:44','2018-04-07 11:11:44',NULL),(49,'171014210517_e090ff2857a54e86d80647e41c6e2706.jpg','b42e19b0aad344bc90e15e6f843d495d','.jpg','image/jpeg','182.69','/uploads/b42e19b0aad344bc90e15e6f843d495d.jpg','local','2018-04-07 11:12:05','2018-04-07 11:12:05',NULL),(50,'171014212439_20160120-223549-largejpg.jpg','c77325aaac1443e0b1c0249eef9c3d97','.jpg','image/jpeg','231.46','/uploads/c77325aaac1443e0b1c0249eef9c3d97.jpg','local','2018-04-07 11:12:34','2018-04-07 11:12:34',NULL),(51,'screen-shot-2018-04-08-at-12-10-08-pm (3).png','900d7607276145a98f1270fa6846abcb','.png','image/png','662.83','/uploads/900d7607276145a98f1270fa6846abcb.png','local','2018-04-21 03:16:26','2018-04-21 03:16:26',NULL);
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_morph`
--

DROP TABLE IF EXISTS `upload_file_morph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_file_morph` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` text,
  `field` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_morph`
--

LOCK TABLES `upload_file_morph` WRITE;
/*!40000 ALTER TABLE `upload_file_morph` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_morph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_permission`
--

DROP TABLE IF EXISTS `users-permissions_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users-permissions_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) DEFAULT NULL,
  `type` text,
  `controller` text,
  `action` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `policy` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_permission`
--

LOCK TABLES `users-permissions_permission` WRITE;
/*!40000 ALTER TABLE `users-permissions_permission` DISABLE KEYS */;
INSERT INTO `users-permissions_permission` VALUES (1,1,'analytics','analytics','index',1,''),(2,1,'content-manager','contentmanager','models',1,''),(3,1,'content-manager','contentmanager','find',1,''),(4,1,'content-manager','contentmanager','count',1,''),(5,1,'content-manager','contentmanager','findone',1,''),(6,1,'content-manager','contentmanager','create',1,''),(7,1,'content-manager','contentmanager','update',1,''),(8,1,'content-manager','contentmanager','delete',1,''),(9,1,'content-type-builder','contenttypebuilder','getmodels',1,''),(10,1,'content-type-builder','contenttypebuilder','getmodel',1,''),(11,1,'content-type-builder','contenttypebuilder','getconnections',1,''),(12,1,'content-type-builder','contenttypebuilder','createmodel',1,''),(13,1,'content-type-builder','contenttypebuilder','updatemodel',1,''),(14,1,'content-type-builder','contenttypebuilder','deletemodel',1,''),(15,1,'content-type-builder','contenttypebuilder','autoreload',1,''),(16,1,'content-type-builder','contenttypebuilder','checktableexists',1,''),(17,1,'settings-manager','settingsmanager','menu',1,''),(18,1,'settings-manager','settingsmanager','environments',1,''),(19,1,'settings-manager','settingsmanager','languages',1,''),(20,1,'settings-manager','settingsmanager','databases',1,''),(21,1,'settings-manager','settingsmanager','database',1,''),(22,1,'settings-manager','settingsmanager','databasemodel',1,''),(23,1,'settings-manager','settingsmanager','get',1,''),(24,1,'settings-manager','settingsmanager','update',1,''),(25,1,'settings-manager','settingsmanager','createlanguage',1,''),(26,1,'settings-manager','settingsmanager','deletelanguage',1,''),(27,1,'settings-manager','settingsmanager','createdatabase',1,''),(28,1,'settings-manager','settingsmanager','updatedatabase',1,''),(29,1,'settings-manager','settingsmanager','deletedatabase',1,''),(30,1,'settings-manager','settingsmanager','autoreload',1,''),(31,1,'upload','upload','upload',1,''),(32,1,'upload','upload','getenvironments',1,''),(33,1,'upload','upload','getsettings',1,''),(34,1,'upload','upload','updatesettings',1,''),(35,1,'upload','upload','find',1,''),(36,1,'upload','upload','count',1,''),(37,1,'upload','upload','destroy',1,''),(38,1,'upload','upload','search',1,''),(39,1,'users-permissions','auth','callback',1,''),(40,1,'users-permissions','auth','changepassword',1,''),(41,1,'users-permissions','auth','connect',1,''),(42,1,'users-permissions','auth','forgotpassword',1,''),(43,1,'users-permissions','auth','register',1,''),(44,1,'users-permissions','user','find',1,''),(45,1,'users-permissions','user','me',1,''),(46,1,'users-permissions','user','findone',1,''),(47,1,'users-permissions','user','create',1,''),(48,1,'users-permissions','user','update',1,''),(49,1,'users-permissions','user','destroy',1,''),(50,1,'users-permissions','userspermissions','createrole',1,''),(51,1,'users-permissions','userspermissions','deleteprovider',1,''),(52,1,'users-permissions','userspermissions','deleterole',1,''),(53,1,'users-permissions','userspermissions','getpermissions',1,''),(54,1,'users-permissions','userspermissions','getpolicies',1,''),(55,1,'users-permissions','userspermissions','getrole',1,''),(56,1,'users-permissions','userspermissions','getroles',1,''),(57,1,'users-permissions','userspermissions','getroutes',1,''),(58,1,'users-permissions','userspermissions','index',1,''),(59,1,'users-permissions','userspermissions','init',1,''),(60,1,'users-permissions','userspermissions','searchusers',1,''),(61,1,'users-permissions','userspermissions','updaterole',1,''),(62,1,'users-permissions','userspermissions','getemailtemplate',1,''),(63,1,'users-permissions','userspermissions','updateemailtemplate',1,''),(64,1,'users-permissions','userspermissions','getadvancedsettings',1,''),(65,1,'users-permissions','userspermissions','updateadvancedsettings',1,''),(66,1,'users-permissions','userspermissions','getproviders',1,''),(67,1,'users-permissions','userspermissions','updateproviders',1,''),(68,2,'analytics','analytics','index',0,''),(69,2,'content-manager','contentmanager','models',0,''),(70,2,'content-manager','contentmanager','find',0,''),(71,2,'content-manager','contentmanager','count',0,''),(72,2,'content-manager','contentmanager','findone',0,''),(73,2,'content-manager','contentmanager','create',0,''),(74,2,'content-manager','contentmanager','update',0,''),(75,2,'content-manager','contentmanager','delete',0,''),(76,2,'content-type-builder','contenttypebuilder','getmodels',0,''),(77,2,'content-type-builder','contenttypebuilder','getmodel',0,''),(78,2,'content-type-builder','contenttypebuilder','getconnections',0,''),(79,2,'content-type-builder','contenttypebuilder','createmodel',0,''),(80,2,'content-type-builder','contenttypebuilder','updatemodel',0,''),(81,2,'content-type-builder','contenttypebuilder','deletemodel',0,''),(82,2,'content-type-builder','contenttypebuilder','autoreload',1,''),(83,2,'content-type-builder','contenttypebuilder','checktableexists',0,''),(84,2,'settings-manager','settingsmanager','menu',0,''),(85,2,'settings-manager','settingsmanager','environments',0,''),(86,2,'settings-manager','settingsmanager','languages',0,''),(87,2,'settings-manager','settingsmanager','databases',0,''),(88,2,'settings-manager','settingsmanager','database',0,''),(89,2,'settings-manager','settingsmanager','databasemodel',0,''),(90,2,'settings-manager','settingsmanager','get',0,''),(91,2,'settings-manager','settingsmanager','update',0,''),(92,2,'settings-manager','settingsmanager','createlanguage',0,''),(93,2,'settings-manager','settingsmanager','deletelanguage',0,''),(94,2,'settings-manager','settingsmanager','createdatabase',0,''),(95,2,'settings-manager','settingsmanager','updatedatabase',0,''),(96,2,'settings-manager','settingsmanager','deletedatabase',0,''),(97,2,'settings-manager','settingsmanager','autoreload',1,''),(98,2,'upload','upload','upload',1,''),(99,2,'upload','upload','getenvironments',1,''),(100,2,'upload','upload','getsettings',1,''),(101,2,'upload','upload','updatesettings',1,''),(102,2,'upload','upload','find',1,''),(103,2,'upload','upload','count',1,''),(104,2,'upload','upload','destroy',1,''),(105,2,'upload','upload','search',1,''),(106,2,'users-permissions','auth','callback',1,''),(107,2,'users-permissions','auth','changepassword',1,''),(108,2,'users-permissions','auth','connect',1,''),(109,2,'users-permissions','auth','forgotpassword',1,''),(110,2,'users-permissions','auth','register',1,''),(111,2,'users-permissions','user','find',0,''),(112,2,'users-permissions','user','me',1,''),(113,2,'users-permissions','user','findone',0,''),(114,2,'users-permissions','user','create',0,''),(115,2,'users-permissions','user','update',0,''),(116,2,'users-permissions','user','destroy',0,''),(117,2,'users-permissions','userspermissions','createrole',0,''),(118,2,'users-permissions','userspermissions','deleteprovider',0,''),(119,2,'users-permissions','userspermissions','deleterole',0,''),(120,2,'users-permissions','userspermissions','getpermissions',0,''),(121,2,'users-permissions','userspermissions','getpolicies',0,''),(122,2,'users-permissions','userspermissions','getrole',0,''),(123,2,'users-permissions','userspermissions','getroles',0,''),(124,2,'users-permissions','userspermissions','getroutes',0,''),(125,2,'users-permissions','userspermissions','index',0,''),(126,2,'users-permissions','userspermissions','init',1,''),(127,2,'users-permissions','userspermissions','searchusers',0,''),(128,2,'users-permissions','userspermissions','updaterole',0,''),(129,2,'users-permissions','userspermissions','getemailtemplate',0,''),(130,2,'users-permissions','userspermissions','updateemailtemplate',0,''),(131,2,'users-permissions','userspermissions','getadvancedsettings',0,''),(132,2,'users-permissions','userspermissions','updateadvancedsettings',0,''),(133,2,'users-permissions','userspermissions','getproviders',0,''),(134,2,'users-permissions','userspermissions','updateproviders',0,''),(135,1,'application','trips','find',1,''),(136,1,'application','trips','findone',1,''),(137,1,'application','trips','create',1,''),(138,1,'application','trips','update',1,''),(139,1,'application','trips','destroy',1,''),(140,1,'application','trips','createrelation',1,''),(141,1,'application','trips','updaterelation',1,''),(142,1,'application','trips','destroyrelation',1,''),(143,2,'application','trips','find',1,''),(144,2,'application','trips','findone',1,''),(145,2,'application','trips','create',0,''),(146,2,'application','trips','update',0,''),(147,2,'application','trips','destroy',0,''),(148,2,'application','trips','createrelation',0,''),(149,2,'application','trips','updaterelation',0,''),(150,2,'application','trips','destroyrelation',0,''),(151,1,'application','landmarks','find',1,''),(152,1,'application','landmarks','findone',1,''),(153,1,'application','landmarks','create',1,''),(154,1,'application','landmarks','update',1,''),(155,1,'application','landmarks','destroy',1,''),(156,1,'application','landmarks','createrelation',1,''),(157,1,'application','landmarks','updaterelation',1,''),(158,1,'application','landmarks','destroyrelation',1,''),(159,2,'application','landmarks','find',1,''),(160,2,'application','landmarks','findone',1,''),(161,2,'application','landmarks','create',0,''),(162,2,'application','landmarks','update',0,''),(163,2,'application','landmarks','destroy',0,''),(164,2,'application','landmarks','createrelation',0,''),(165,2,'application','landmarks','updaterelation',0,''),(166,2,'application','landmarks','destroyrelation',0,''),(167,1,'application','photos','find',1,''),(168,1,'application','photos','findone',1,''),(169,1,'application','photos','create',1,''),(170,1,'application','photos','update',1,''),(171,1,'application','photos','destroy',1,''),(172,1,'application','photos','createrelation',1,''),(173,1,'application','photos','updaterelation',1,''),(174,1,'application','photos','destroyrelation',1,''),(175,2,'application','photos','find',1,''),(176,2,'application','photos','findone',1,''),(177,2,'application','photos','create',0,''),(178,2,'application','photos','update',0,''),(179,2,'application','photos','destroy',0,''),(180,2,'application','photos','createrelation',0,''),(181,2,'application','photos','updaterelation',0,''),(182,2,'application','photos','destroyrelation',0,''),(183,1,'application','photos','find',1,''),(184,1,'application','photos','findone',1,''),(185,1,'application','photos','create',1,''),(186,1,'application','photos','update',1,''),(187,1,'application','photos','destroy',1,''),(188,1,'application','photos','createrelation',1,''),(189,1,'application','photos','updaterelation',1,''),(190,1,'application','photos','destroyrelation',1,''),(191,2,'application','photos','find',0,''),(192,2,'application','photos','findone',0,''),(193,2,'application','photos','create',0,''),(194,2,'application','photos','update',0,''),(195,2,'application','photos','destroy',0,''),(196,2,'application','photos','createrelation',0,''),(197,2,'application','photos','updaterelation',0,''),(198,2,'application','photos','destroyrelation',0,''),(199,1,'application','landmarks','find',1,''),(200,1,'application','landmarks','findone',1,''),(201,1,'application','landmarks','create',1,''),(202,1,'application','landmarks','update',1,''),(203,1,'application','landmarks','destroy',1,''),(204,1,'application','landmarks','createrelation',1,''),(205,1,'application','landmarks','updaterelation',1,''),(206,1,'application','landmarks','destroyrelation',1,''),(207,2,'application','landmarks','find',0,''),(208,2,'application','landmarks','findone',0,''),(209,2,'application','landmarks','create',0,''),(210,2,'application','landmarks','update',0,''),(211,2,'application','landmarks','destroy',0,''),(212,2,'application','landmarks','createrelation',0,''),(213,2,'application','landmarks','updaterelation',0,''),(214,2,'application','landmarks','destroyrelation',0,''),(215,1,'application','categories','destroyrelation',1,''),(216,2,'application','categories','find',1,''),(217,2,'application','categories','findone',1,''),(218,1,'application','categories','destroy',1,''),(219,1,'application','categories','create',1,''),(220,1,'application','categories','update',1,''),(221,1,'application','categories','findone',1,''),(222,1,'application','categories','updaterelation',1,''),(223,1,'application','categories','createrelation',1,''),(224,1,'application','categories','find',1,''),(225,2,'application','categories','create',0,''),(226,2,'application','categories','update',0,''),(227,2,'application','categories','destroy',0,''),(228,2,'application','categories','createrelation',0,''),(229,2,'application','categories','updaterelation',0,''),(230,2,'application','categories','destroyrelation',0,''),(247,1,'application','moods','find',1,''),(248,1,'application','moods','findone',1,''),(249,1,'application','moods','create',1,''),(250,1,'application','moods','update',1,''),(251,1,'application','moods','destroy',1,''),(252,1,'application','moods','createrelation',1,''),(253,1,'application','moods','updaterelation',1,''),(254,1,'application','moods','destroyrelation',1,''),(255,2,'application','moods','find',1,''),(256,2,'application','moods','findone',1,''),(257,2,'application','moods','create',0,''),(258,2,'application','moods','update',0,''),(259,2,'application','moods','destroy',0,''),(260,2,'application','moods','createrelation',0,''),(261,2,'application','moods','updaterelation',0,''),(262,2,'application','moods','destroyrelation',0,''),(263,1,'application','hotels','find',1,''),(264,1,'application','hotels','findone',1,''),(265,1,'application','hotels','create',1,''),(266,1,'application','hotels','update',1,''),(267,1,'application','hotels','destroy',1,''),(268,1,'application','hotels','createrelation',1,''),(269,1,'application','hotels','updaterelation',1,''),(270,1,'application','hotels','destroyrelation',1,''),(271,2,'application','hotels','find',1,''),(272,2,'application','hotels','findone',1,''),(273,2,'application','hotels','create',0,''),(274,2,'application','hotels','update',0,''),(275,2,'application','hotels','destroy',0,''),(276,2,'application','hotels','createrelation',0,''),(277,2,'application','hotels','updaterelation',0,''),(278,2,'application','hotels','destroyrelation',0,''),(279,1,'application','restaurants','find',1,''),(280,1,'application','restaurants','findone',1,''),(281,1,'application','restaurants','create',1,''),(282,1,'application','restaurants','update',1,''),(283,1,'application','restaurants','destroy',1,''),(284,1,'application','restaurants','createrelation',1,''),(285,1,'application','restaurants','updaterelation',1,''),(286,1,'application','restaurants','destroyrelation',1,''),(287,2,'application','restaurants','find',1,''),(288,2,'application','restaurants','findone',1,''),(289,2,'application','restaurants','create',0,''),(290,2,'application','restaurants','update',0,''),(291,2,'application','restaurants','destroy',0,''),(292,2,'application','restaurants','createrelation',0,''),(293,2,'application','restaurants','updaterelation',0,''),(294,2,'application','restaurants','destroyrelation',0,''),(305,1,'application','guidelines','find',1,''),(306,1,'application','guidelines','findone',1,''),(307,1,'application','guidelines','create',1,''),(308,1,'application','guidelines','update',1,''),(309,1,'application','guidelines','destroy',1,''),(310,1,'application','guidelines','createrelation',1,''),(311,1,'application','guidelines','updaterelation',1,''),(312,1,'application','guidelines','destroyrelation',1,''),(313,2,'application','guidelines','find',1,''),(314,2,'application','guidelines','findone',1,''),(315,2,'application','guidelines','create',0,''),(316,2,'application','guidelines','update',0,''),(317,2,'application','guidelines','destroy',0,''),(318,2,'application','guidelines','createrelation',0,''),(319,2,'application','guidelines','updaterelation',0,''),(320,2,'application','guidelines','destroyrelation',0,''),(321,1,'application','searchs','find',1,''),(322,2,'application','searchs','find',1,''),(323,1,'application','visitedplaces','find',1,''),(324,1,'application','visitedplaces','findone',1,''),(325,1,'application','visitedplaces','create',1,''),(326,1,'application','visitedplaces','update',1,''),(327,1,'application','visitedplaces','destroy',1,''),(328,1,'application','visitedplaces','createrelation',1,''),(329,1,'application','visitedplaces','updaterelation',1,''),(330,1,'application','visitedplaces','destroyrelation',1,''),(331,2,'application','visitedplaces','find',1,''),(332,2,'application','visitedplaces','findone',1,''),(333,2,'application','visitedplaces','create',0,''),(334,2,'application','visitedplaces','update',0,''),(335,2,'application','visitedplaces','destroy',0,''),(336,2,'application','visitedplaces','createrelation',0,''),(337,2,'application','visitedplaces','updaterelation',0,''),(338,2,'application','visitedplaces','destroyrelation',0,''),(339,1,'application','entities','find',1,''),(340,1,'application','entities','findone',1,''),(341,1,'application','entities','create',1,''),(342,1,'application','entities','update',1,''),(343,1,'application','entities','destroy',1,''),(344,1,'application','entities','createrelation',1,''),(345,1,'application','entities','updaterelation',1,''),(346,1,'application','entities','destroyrelation',1,''),(347,2,'application','entities','find',1,''),(348,2,'application','entities','findone',1,''),(349,2,'application','entities','create',0,''),(350,2,'application','entities','update',0,''),(351,2,'application','entities','destroy',0,''),(352,2,'application','entities','createrelation',0,''),(353,2,'application','entities','updaterelation',0,''),(354,2,'application','entities','destroyrelation',0,''),(355,1,'application','reviews','find',1,''),(356,1,'application','reviews','findone',1,''),(357,1,'application','reviews','create',1,''),(358,1,'application','reviews','update',1,''),(359,1,'application','reviews','destroy',1,''),(360,1,'application','reviews','createrelation',1,''),(361,1,'application','reviews','updaterelation',1,''),(362,2,'application','reviews','find',1,''),(363,1,'application','reviews','destroyrelation',1,''),(364,2,'application','reviews','findone',1,''),(365,2,'application','reviews','create',0,''),(366,2,'application','reviews','update',0,''),(367,2,'application','reviews','destroy',0,''),(368,2,'application','reviews','createrelation',0,''),(369,2,'application','reviews','updaterelation',0,''),(370,2,'application','reviews','destroyrelation',0,''),(371,1,'application','categories','find',1,''),(372,1,'application','categories','findone',1,''),(373,1,'application','categories','create',1,''),(374,1,'application','categories','update',1,''),(375,1,'application','categories','destroy',1,''),(376,1,'application','categories','createrelation',1,''),(377,1,'application','categories','updaterelation',1,''),(378,1,'application','categories','destroyrelation',1,''),(379,1,'application','entities','find',1,''),(380,1,'application','entities','findone',1,''),(381,1,'application','entities','create',1,''),(382,1,'application','entities','update',1,''),(383,1,'application','entities','destroy',1,''),(384,1,'application','entities','createrelation',1,''),(385,1,'application','entities','updaterelation',1,''),(386,1,'application','entities','destroyrelation',1,''),(387,1,'application','guidelines','find',1,''),(388,1,'application','guidelines','findone',1,''),(389,1,'application','guidelines','create',1,''),(390,1,'application','guidelines','update',1,''),(391,1,'application','guidelines','destroy',1,''),(392,1,'application','guidelines','createrelation',1,''),(393,1,'application','guidelines','updaterelation',1,''),(394,1,'application','guidelines','destroyrelation',1,''),(395,1,'application','hotels','find',1,''),(396,1,'application','hotels','findone',1,''),(397,1,'application','hotels','create',1,''),(398,1,'application','hotels','update',1,''),(399,1,'application','hotels','destroy',1,''),(400,1,'application','hotels','createrelation',1,''),(401,1,'application','hotels','updaterelation',1,''),(402,1,'application','hotels','destroyrelation',1,''),(403,1,'application','landmarks','find',1,''),(404,1,'application','landmarks','findone',1,''),(405,1,'application','landmarks','create',1,''),(406,1,'application','landmarks','update',1,''),(407,1,'application','landmarks','destroy',1,''),(408,1,'application','landmarks','createrelation',1,''),(409,1,'application','landmarks','updaterelation',1,''),(410,1,'application','landmarks','destroyrelation',1,''),(411,1,'application','photos','find',1,''),(412,1,'application','photos','findone',1,''),(413,1,'application','photos','create',1,''),(414,1,'application','photos','update',1,''),(415,1,'application','photos','destroy',1,''),(416,1,'application','photos','createrelation',1,''),(417,1,'application','photos','updaterelation',1,''),(418,1,'application','photos','destroyrelation',1,''),(419,1,'application','restaurants','find',1,''),(420,1,'application','restaurants','findone',1,''),(421,1,'application','restaurants','create',1,''),(422,1,'application','restaurants','update',1,''),(423,1,'application','restaurants','destroy',1,''),(424,1,'application','restaurants','createrelation',1,''),(425,1,'application','restaurants','updaterelation',1,''),(426,1,'application','restaurants','destroyrelation',1,''),(427,1,'application','reviews','find',1,''),(428,1,'application','reviews','findone',1,''),(429,1,'application','reviews','create',1,''),(430,1,'application','reviews','update',1,''),(431,1,'application','reviews','destroy',1,''),(432,1,'application','reviews','createrelation',1,''),(433,1,'application','reviews','updaterelation',1,''),(434,1,'application','reviews','destroyrelation',1,''),(435,1,'application','searchs','find',1,''),(436,1,'application','trips','find',1,''),(437,1,'application','trips','findone',1,''),(438,1,'application','trips','create',1,''),(439,1,'application','trips','update',1,''),(440,1,'application','trips','destroy',1,''),(441,1,'application','trips','createrelation',1,''),(442,1,'application','trips','updaterelation',1,''),(443,1,'application','trips','destroyrelation',1,''),(444,1,'application','visitedplaces','find',1,''),(445,1,'application','visitedplaces','findone',1,''),(446,1,'application','visitedplaces','create',1,''),(447,1,'application','visitedplaces','update',1,''),(448,1,'application','visitedplaces','destroy',1,''),(449,1,'application','visitedplaces','createrelation',1,''),(450,1,'application','visitedplaces','updaterelation',1,''),(451,1,'application','visitedplaces','destroyrelation',1,''),(452,1,'application','moods','find',1,''),(453,1,'application','moods','findone',1,''),(454,1,'application','moods','create',1,''),(455,1,'application','moods','update',1,''),(456,1,'application','moods','destroy',1,''),(457,1,'application','moods','createrelation',1,''),(458,1,'application','moods','updaterelation',1,''),(459,1,'application','moods','destroyrelation',1,''),(460,2,'application','categories','find',0,''),(461,2,'application','categories','findone',0,''),(462,2,'application','categories','create',0,''),(463,2,'application','categories','update',0,''),(464,2,'application','categories','destroy',0,''),(465,2,'application','categories','createrelation',0,''),(466,2,'application','categories','updaterelation',0,''),(467,2,'application','categories','destroyrelation',0,''),(468,2,'application','entities','find',0,''),(469,2,'application','entities','findone',0,''),(470,2,'application','entities','create',0,''),(471,2,'application','entities','update',0,''),(472,2,'application','entities','destroy',0,''),(473,2,'application','entities','createrelation',0,''),(474,2,'application','entities','updaterelation',0,''),(475,2,'application','entities','destroyrelation',0,''),(476,2,'application','guidelines','find',0,''),(477,2,'application','guidelines','findone',0,''),(478,2,'application','guidelines','create',0,''),(479,2,'application','guidelines','update',0,''),(480,2,'application','guidelines','destroy',0,''),(481,2,'application','guidelines','createrelation',0,''),(482,2,'application','guidelines','updaterelation',0,''),(483,2,'application','guidelines','destroyrelation',0,''),(484,2,'application','hotels','find',0,''),(485,2,'application','hotels','findone',0,''),(486,2,'application','hotels','create',0,''),(487,2,'application','hotels','update',0,''),(488,2,'application','hotels','destroy',0,''),(489,2,'application','hotels','createrelation',0,''),(490,2,'application','hotels','updaterelation',0,''),(491,2,'application','hotels','destroyrelation',0,''),(492,2,'application','landmarks','find',0,''),(493,2,'application','landmarks','findone',0,''),(494,2,'application','landmarks','create',0,''),(495,2,'application','landmarks','update',0,''),(496,2,'application','landmarks','destroy',0,''),(497,2,'application','landmarks','createrelation',0,''),(498,2,'application','landmarks','updaterelation',0,''),(499,2,'application','landmarks','destroyrelation',0,''),(500,2,'application','photos','find',0,''),(501,2,'application','photos','findone',0,''),(502,2,'application','photos','create',0,''),(503,2,'application','photos','update',0,''),(504,2,'application','photos','destroy',0,''),(505,2,'application','photos','createrelation',0,''),(506,2,'application','photos','updaterelation',0,''),(507,2,'application','photos','destroyrelation',0,''),(508,2,'application','restaurants','find',0,''),(509,2,'application','restaurants','findone',0,''),(510,2,'application','restaurants','create',0,''),(511,2,'application','restaurants','update',0,''),(512,2,'application','restaurants','destroy',0,''),(513,2,'application','restaurants','createrelation',0,''),(514,2,'application','restaurants','updaterelation',0,''),(515,2,'application','restaurants','destroyrelation',0,''),(516,2,'application','reviews','find',0,''),(517,2,'application','reviews','findone',0,''),(518,2,'application','reviews','create',0,''),(519,2,'application','reviews','update',0,''),(520,2,'application','reviews','destroy',0,''),(521,2,'application','reviews','createrelation',0,''),(522,2,'application','reviews','updaterelation',0,''),(523,2,'application','reviews','destroyrelation',0,''),(524,2,'application','searchs','find',0,''),(525,2,'application','trips','find',0,''),(526,2,'application','trips','findone',0,''),(527,2,'application','trips','create',0,''),(528,2,'application','trips','update',0,''),(529,2,'application','trips','destroy',0,''),(530,2,'application','trips','createrelation',0,''),(531,2,'application','trips','updaterelation',0,''),(532,2,'application','trips','destroyrelation',0,''),(533,2,'application','visitedplaces','find',0,''),(534,2,'application','visitedplaces','findone',0,''),(535,2,'application','visitedplaces','create',0,''),(536,2,'application','visitedplaces','update',0,''),(537,2,'application','visitedplaces','destroy',0,''),(538,2,'application','visitedplaces','createrelation',0,''),(539,2,'application','visitedplaces','updaterelation',0,''),(540,2,'application','visitedplaces','destroyrelation',0,''),(541,2,'application','moods','find',0,''),(542,2,'application','moods','findone',0,''),(543,2,'application','moods','create',0,''),(544,2,'application','moods','update',0,''),(545,2,'application','moods','destroy',0,''),(546,2,'application','moods','createrelation',0,''),(547,2,'application','moods','updaterelation',0,''),(548,2,'application','moods','destroyrelation',0,''),(549,1,'application','amenities','find',1,''),(550,1,'application','amenities','findone',1,''),(551,1,'application','amenities','create',1,''),(552,1,'application','amenities','update',1,''),(553,1,'application','amenities','destroy',1,''),(554,1,'application','amenities','createrelation',1,''),(555,1,'application','amenities','updaterelation',1,''),(556,1,'application','amenities','destroyrelation',1,''),(557,2,'application','amenities','find',0,''),(558,2,'application','amenities','findone',0,''),(559,2,'application','amenities','create',0,''),(560,2,'application','amenities','update',0,''),(561,2,'application','amenities','destroy',0,''),(562,2,'application','amenities','createrelation',0,''),(563,2,'application','amenities','updaterelation',0,''),(564,2,'application','amenities','destroyrelation',0,''),(565,1,'application','watchs','find',1,''),(566,2,'application','watchs','find',0,'');
/*!40000 ALTER TABLE `users-permissions_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_role`
--

DROP TABLE IF EXISTS `users-permissions_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users-permissions_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `description` text,
  `type` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_role`
--

LOCK TABLES `users-permissions_role` WRITE;
/*!40000 ALTER TABLE `users-permissions_role` DISABLE KEYS */;
INSERT INTO `users-permissions_role` VALUES (1,'Administrator','These users have all access in the project.','root'),(2,'Guest','Default role given to unauthenticated user.','guest');
/*!40000 ALTER TABLE `users-permissions_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_user`
--

DROP TABLE IF EXISTS `users-permissions_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users-permissions_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text,
  `email` text,
  `provider` text,
  `role` int(11) DEFAULT NULL,
  `resetPasswordToken` text,
  `password` text,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_user`
--

LOCK TABLES `users-permissions_user` WRITE;
/*!40000 ALTER TABLE `users-permissions_user` DISABLE KEYS */;
INSERT INTO `users-permissions_user` VALUES (1,'admin','admin@gmail.com','local',1,NULL,'$2a$10$p6yRlMxZ4.foRQhFN4d0J.HjHRhALOUMopRtcAwrLY2xSBR/Troly','2018-04-25 03:48:55','0000-00-00 00:00:00'),(2,'donguyen','donguyen','local',2,NULL,'$2a$10$8WzIAIOUhzUUwTtB.7BRK.0UslnghK3C1EGNnIxBbBC2e5ep5MEGi','2018-04-25 03:55:09','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users-permissions_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitedplaces`
--

DROP TABLE IF EXISTS `visitedplaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitedplaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` text,
  `field` text,
  `updated_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitedplaces`
--

LOCK TABLES `visitedplaces` WRITE;
/*!40000 ALTER TABLE `visitedplaces` DISABLE KEYS */;
INSERT INTO `visitedplaces` VALUES (1,1,1,'landmarks',NULL,NULL,NULL),(2,1,2,'landmarks',NULL,NULL,NULL),(3,1,2,'hotels',NULL,NULL,NULL),(4,1,2,'landmarks',NULL,'2018-04-25 12:38:33.852','2018-04-25 12:38:33.773');
/*!40000 ALTER TABLE `visitedplaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_travelapp'
--

--
-- Dumping routines for database 'db_travelapp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-25 18:48:50
