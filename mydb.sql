-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'this is my blog Title','This is my Blog Content This is my Blog Content This is my Blog Content This is my Blog Content This is my Blog Content This is my Blog Content ','Mina Amir',3,'2017-10-20 21:16:06','2017-10-20 19:16:06','2017-10-20 19:16:06'),(2,'second Title','This is my Blog Content','Mina Amir',0,'2017-10-14 11:53:31','2017-09-20 17:49:28','2017-10-02 22:00:00'),(3,'this is my blog Title','This is my Blog Content','Mina Amir',0,'2017-09-20 17:51:14','2017-09-20 17:51:14',NULL),(4,'four title','This is my Blog Content','Mina Amir',0,'2017-09-29 18:48:23','2017-09-20 17:56:35',NULL),(5,'this is my blog Title','This is my Blog Content','Mina Amir',0,'2017-09-20 17:56:55','2017-09-20 17:56:55',NULL),(6,'this is my blog Title','This is my Blog Content','Mina Amir',0,'2017-09-20 17:57:27','2017-09-20 17:57:27',NULL),(7,'jejejs','This is my Blog Content','Mina Amir',0,'2017-09-29 18:48:27','2017-09-20 17:57:54',NULL),(8,'this is my blog Title','This is my Blog Content','Mina Amir',0,'2017-09-20 17:58:38','2017-09-20 17:58:38',NULL),(9,'this is my blog Title','This is my Blog Content','Mina Amir',0,'2017-09-20 17:59:31','2017-09-20 17:59:31',NULL),(10,'adfgssd','This is my Blog Content','Mina Amir',0,'2017-09-29 18:48:31','2017-09-20 17:59:54',NULL),(11,'this is my blog Title 1','This is my Blog Content 0000','Mina Amir 0000',0,'2017-09-20 20:21:18','2017-09-20 18:21:18','2017-09-20 18:21:18'),(12,'this is my blog Title','This is my Blog Content','Mina Amir',0,'2017-09-26 18:16:35','2017-09-26 18:16:35',NULL),(13,'wdwdw','aa','sss',0,'2017-09-26 18:54:08','2017-09-26 18:54:08',NULL),(14,'wdwdw','aa','sss',0,'2017-09-26 18:54:57','2017-09-26 18:54:57',NULL),(15,'this.newBlog.blogTitle','this.newBlog.blogContent','this.newBlog.blogAuthor',0,'2017-09-26 19:01:48','2017-09-26 19:01:48',NULL),(16,'this.newBlog.blogTitle','this.newBlog.blogContent','this.newBlog.blogAuthor',0,'2017-09-26 19:02:01','2017-09-26 19:02:01',NULL),(17,'this.newBlog.blogTitle','this.newBlog.blogContent','this.newBlog.blogAuthor',0,'2017-09-26 19:02:38','2017-09-26 19:02:38',NULL),(18,'this.newBlog.blogTitle','this.newBlog.blogContent','this.newBlog.blogAuthor',0,'2017-09-26 19:03:56','2017-09-26 19:03:56',NULL),(19,'this.newBlog.blogTitle','this.newBlog.blogContent','this.newBlog.blogAuthor',0,'2017-09-26 19:06:13','2017-09-26 19:06:13',NULL),(20,'this.newBlog.blogTitle','this.newBlog.blogContent','this.newBlog.blogAuthor',0,'2017-09-26 19:08:05','2017-09-26 19:08:05',NULL),(21,'test from Vue Api','asdaksldklakld;aksl;d','ahmed',0,'2017-09-26 19:25:22','2017-09-26 19:25:22',NULL),(22,'aaaa','aasdasds da da sd','Mina',0,'2017-09-28 16:40:17','2017-09-28 16:40:17',NULL),(23,'this is testing Validation','asdasdasd','Mina',0,'2017-09-28 17:29:47','2017-09-28 17:29:47',NULL),(24,'this is testing Validation','asdasdasd','Mina',0,'2017-09-28 17:33:47','2017-09-28 17:33:47',NULL),(25,'ssssss','sssssssss','ahmed',0,'2017-09-28 17:39:06','2017-09-28 17:39:06',NULL),(26,'s','ddd','ahmed',0,'2017-09-28 17:57:45','2017-09-28 17:57:45',NULL),(27,'ssss','sssssss','Mina',0,'2017-09-28 18:02:59','2017-09-28 18:02:59',NULL),(28,'ssss','sssssss','Mina',0,'2017-09-28 18:03:58','2017-09-28 18:03:58',NULL),(29,'ssss','sssssss','Mina',0,'2017-09-28 18:27:36','2017-09-28 18:27:36',NULL),(30,'ssss','sssssss','Mina',0,'2017-09-28 18:27:54','2017-09-28 18:27:54',NULL),(31,'ssss','sssssss','Mina',0,'2017-09-28 18:28:08','2017-09-28 18:28:08',NULL),(32,'ssss','sssssss','Mina',0,'2017-09-28 18:28:49','2017-09-28 18:28:49',NULL),(33,'ssss','sssssss','Mina',0,'2017-09-28 18:29:32','2017-09-28 18:29:32',NULL),(34,'testing Data','hehe idi akad da\ndas dmaksdk maksdm','ahmed',0,'2017-09-29 07:28:29','2017-09-29 07:28:29',NULL),(35,'ggfghf','jhkjhjkhkjh','Mina',0,'2017-10-04 08:06:20','2017-10-04 08:06:20',NULL),(37,'ssssss','ssssssssssss','Mina Amir samy',0,'2017-10-20 17:07:14','2017-10-20 17:07:14',NULL),(38,'ssssss','ssssssssssss','Mina Amir samy',0,'2017-10-20 17:07:35','2017-10-20 17:07:35',NULL),(39,'ssssss','ssssssssssss','Mina Amir samy',0,'2017-10-20 17:08:54','2017-10-20 17:08:54',NULL),(40,'ssssss','ssssssssssss','Mina Amir samy',0,'2017-10-20 17:09:00','2017-10-20 17:09:00',NULL),(41,'ssssss','ssssssssssss','Mina Amir samy',0,'2017-10-20 17:09:13','2017-10-20 17:09:13',NULL),(42,'ddddd','ddddddddddddd','Mina Amir samy',0,'2017-10-20 17:10:56','2017-10-20 17:10:56',NULL),(43,'this ist test','asd kabjsd nad','Mina Amir samy',3,'2017-10-20 21:23:45','2017-10-20 19:23:45','2017-10-20 19:23:45'),(44,'aaaaaaaaaaaa','dddddddddddddddddddddddddddddddddddddd','Mina Amir samy',3,'2017-10-20 21:13:25','2017-10-20 19:13:25','2017-10-20 19:13:25'),(45,'asdaksbd asd janjkdn','ansdjnakjsndjasnjkd najksndk','Mina Amir samy',3,'2017-10-20 21:19:02','2017-10-20 19:19:02','2017-10-20 19:19:02'),(46,'sssssssssss','sssssssssss','Mina Amir samy',3,'2017-10-20 21:23:15','2017-10-20 19:23:15','2017-10-20 19:23:15'),(47,'fffffffffff','ffffffffffffff','Mina Amir samy',3,'2017-10-20 21:21:48','2017-10-20 19:21:48','2017-10-20 19:21:48'),(48,'ssssssssss','ssssss','Mina Amir samy',3,'2017-10-20 21:32:53','2017-10-20 19:32:53','2017-10-20 19:32:53'),(49,'ddddddd','dddddddddd','Mina Amir samy',3,'2017-10-20 21:32:38','2017-10-20 19:32:38','2017-10-20 19:32:38'),(50,'ffffffff','ffffffff','Mina Amir samy',3,'2017-10-20 21:24:50','2017-10-20 19:24:50','2017-10-20 19:24:50'),(51,'ddddddddd','ddddddddddddddd','Mina Amir samy',3,'2017-10-20 21:38:51','2017-10-20 19:38:51','2017-10-20 19:38:51'),(52,'ddddddddd','dddddddddddddd','Mina Amir',3,'2017-10-20 19:54:25','2017-10-20 19:54:25',NULL),(53,'aaaaaaaaaaddddddddd','hhhhhhaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','Mina Amir',3,'2017-10-21 13:05:36','2017-10-21 11:05:36',NULL);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varbinary(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Wizards','2017-09-20 19:34:11','0000-00-00 00:00:00',NULL),(2,'Action','2017-09-20 19:34:11','0000-00-00 00:00:00',NULL),(3,'Drama','2017-09-20 19:34:22','0000-00-00 00:00:00',NULL),(4,'Comedy','2017-09-20 19:34:22','0000-00-00 00:00:00',NULL),(5,'philosophy','2017-09-20 19:34:45','0000-00-00 00:00:00',NULL),(6,'Cinema','2017-09-20 19:34:45','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_articles`
--

DROP TABLE IF EXISTS `categories_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_articles`
--

LOCK TABLES `categories_articles` WRITE;
/*!40000 ALTER TABLE `categories_articles` DISABLE KEYS */;
INSERT INTO `categories_articles` VALUES (1,1,2,'2017-10-20 21:16:06','2017-10-20 19:16:06','2017-10-20 19:16:06'),(2,11,1,'2017-09-20 20:19:25','2017-09-20 18:19:25','2017-09-20 18:19:25'),(3,11,2,'2017-09-20 20:19:25','2017-09-20 18:19:25','2017-09-20 18:19:25'),(4,11,4,'2017-09-20 20:19:25','2017-09-20 18:19:25','2017-09-20 18:19:25'),(5,11,3,'2017-09-20 20:19:25','2017-09-20 18:19:25','2017-09-20 18:19:25'),(6,11,5,'2017-09-20 20:19:25','2017-09-20 18:19:25','2017-09-20 18:19:25'),(7,11,1,'2017-09-20 20:19:25','2017-09-20 18:19:25','2017-09-20 18:19:25'),(8,11,6,'2017-09-20 20:19:25','2017-09-20 18:19:25','2017-09-20 18:19:25'),(9,11,1,'2017-09-20 20:19:25','2017-09-20 18:19:25','2017-09-20 18:19:25'),(10,11,6,'2017-09-20 20:19:25','2017-09-20 18:19:25','2017-09-20 18:19:25'),(11,11,1,'2017-09-20 20:21:18','2017-09-20 18:21:18','2017-09-20 18:21:18'),(12,11,6,'2017-09-20 20:21:18','2017-09-20 18:21:18','2017-09-20 18:21:18'),(13,12,3,'2017-09-26 18:16:35','2017-09-26 18:16:35',NULL),(14,12,5,'2017-09-26 18:16:35','2017-09-26 18:16:35',NULL),(15,14,1,'2017-09-26 18:54:57','2017-09-26 18:54:57',NULL),(16,14,2,'2017-09-26 18:54:57','2017-09-26 18:54:57',NULL),(17,14,3,'2017-09-26 18:54:57','2017-09-26 18:54:57',NULL),(18,20,1,'2017-09-26 19:08:06','2017-09-26 19:08:06',NULL),(19,20,2,'2017-09-26 19:08:06','2017-09-26 19:08:06',NULL),(20,20,3,'2017-09-26 19:08:06','2017-09-26 19:08:06',NULL),(21,21,1,'2017-09-26 19:25:22','2017-09-26 19:25:22',NULL),(22,21,2,'2017-09-26 19:25:22','2017-09-26 19:25:22',NULL),(23,21,3,'2017-09-26 19:25:22','2017-09-26 19:25:22',NULL),(24,22,1,'2017-09-28 16:40:17','2017-09-28 16:40:17',NULL),(25,22,2,'2017-09-28 16:40:17','2017-09-28 16:40:17',NULL),(26,22,3,'2017-09-28 16:40:17','2017-09-28 16:40:17',NULL),(27,32,2,'2017-09-28 18:28:49','2017-09-28 18:28:49',NULL),(28,32,3,'2017-09-28 18:28:49','2017-09-28 18:28:49',NULL),(29,33,2,'2017-09-28 18:29:32','2017-09-28 18:29:32',NULL),(30,33,3,'2017-09-28 18:29:32','2017-09-28 18:29:32',NULL),(31,34,1,'2017-09-29 07:28:29','2017-09-29 07:28:29',NULL),(32,34,3,'2017-09-29 07:28:29','2017-09-29 07:28:29',NULL),(33,35,3,'2017-10-04 08:06:20','2017-10-04 08:06:20',NULL),(34,38,5,'2017-10-20 17:07:35','2017-10-20 17:07:35',NULL),(35,38,4,'2017-10-20 17:07:35','2017-10-20 17:07:35',NULL),(36,38,3,'2017-10-20 17:07:35','2017-10-20 17:07:35',NULL),(37,41,5,'2017-10-20 17:09:14','2017-10-20 17:09:14',NULL),(38,41,4,'2017-10-20 17:09:14','2017-10-20 17:09:14',NULL),(39,42,1,'2017-10-20 17:10:56','2017-10-20 17:10:56',NULL),(40,42,3,'2017-10-20 17:10:56','2017-10-20 17:10:56',NULL),(41,42,5,'2017-10-20 17:10:56','2017-10-20 17:10:56',NULL),(42,43,1,'2017-10-20 21:23:45','2017-10-20 19:23:45','2017-10-20 19:23:45'),(43,43,2,'2017-10-20 21:23:45','2017-10-20 19:23:45','2017-10-20 19:23:45'),(44,44,1,'2017-10-20 21:13:25','2017-10-20 19:13:25','2017-10-20 19:13:25'),(45,44,3,'2017-10-20 21:13:25','2017-10-20 19:13:25','2017-10-20 19:13:25'),(46,44,5,'2017-10-20 21:13:25','2017-10-20 19:13:25','2017-10-20 19:13:25'),(47,45,1,'2017-10-20 21:19:02','2017-10-20 19:19:02','2017-10-20 19:19:02'),(48,45,2,'2017-10-20 21:19:02','2017-10-20 19:19:02','2017-10-20 19:19:02'),(49,45,3,'2017-10-20 21:19:02','2017-10-20 19:19:02','2017-10-20 19:19:02'),(50,45,4,'2017-10-20 21:19:02','2017-10-20 19:19:02','2017-10-20 19:19:02'),(51,51,1,'2017-10-20 21:38:51','2017-10-20 19:38:51','2017-10-20 19:38:51'),(52,51,2,'2017-10-20 21:38:51','2017-10-20 19:38:51','2017-10-20 19:38:51'),(53,51,4,'2017-10-20 21:38:51','2017-10-20 19:38:51','2017-10-20 19:38:51'),(54,51,5,'2017-10-20 21:38:51','2017-10-20 19:38:51','2017-10-20 19:38:51'),(55,51,6,'2017-10-20 21:38:51','2017-10-20 19:38:51','2017-10-20 19:38:51'),(56,52,1,'2017-10-20 19:54:25','2017-10-20 19:54:25',NULL),(57,52,3,'2017-10-20 19:54:25','2017-10-20 19:54:25',NULL),(58,53,1,'2017-10-20 23:04:02','2017-10-20 21:04:02','2017-10-20 21:04:02'),(59,53,2,'2017-10-20 23:04:02','2017-10-20 21:04:02','2017-10-20 21:04:02'),(60,53,1,'2017-10-20 23:07:44','2017-10-20 21:07:44','2017-10-20 21:07:44'),(61,53,3,'2017-10-20 23:07:44','2017-10-20 21:07:44','2017-10-20 21:07:44'),(62,53,4,'2017-10-20 23:07:44','2017-10-20 21:07:44','2017-10-20 21:07:44'),(63,53,1,'2017-10-20 23:08:11','2017-10-20 21:08:11','2017-10-20 21:08:11'),(64,53,3,'2017-10-20 23:08:11','2017-10-20 21:08:11','2017-10-20 21:08:11'),(65,53,1,'2017-10-21 11:05:36','2017-10-21 11:05:36',NULL),(66,53,2,'2017-10-21 11:05:36','2017-10-21 11:05:36',NULL),(67,53,3,'2017-10-21 11:05:36','2017-10-21 11:05:36',NULL),(68,53,4,'2017-10-21 11:05:36','2017-10-21 11:05:36',NULL),(69,53,5,'2017-10-21 11:05:36','2017-10-21 11:05:36',NULL),(70,53,6,'2017-10-21 11:05:37','2017-10-21 11:05:37',NULL);
/*!40000 ALTER TABLE `categories_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'ssss','ssss','sssss\r\n','\r\n',NULL,NULL),(3,'Mina Amir','eng.mina23@gmail.com','$2y$10$dD2ypc.Rxl5e7wkA.jQswOfa5K0GGiey4Cl0YUGsj2jJvmg4cH54y','wFzvLmcZSOOLOwnIzy5OikzLBnsk0ekSKyQcGVREqoGHjR8L2NOGnGy5ij4l','2017-10-07 14:06:53','2017-10-21 11:00:42'),(5,'Mina Test','mina1989@gmail.com','$2y$10$hyW0iP4KBbKjMzV2.0iv/OgheXZRq9cxvlxlK92/T7kmDAFPY2KUG',NULL,'2017-10-07 14:18:01','2017-10-07 14:18:01'),(6,'Mina','eng.mina23@mail.com','$2y$10$MJK7/JfjwtFVkPgXZOAiWeAx9Ub2692thkdNRhivMiiZiZGp5YetS',NULL,'2017-10-13 20:10:18','2017-10-13 20:10:18'),(7,'tiger','tiger_mask499@hotmail.com','$2y$10$JWjIB2VlpNThYh6n0V3ECeq2lNCw0vLDeGkKWtoAipxLP1bkpqAru',NULL,'2017-10-13 20:13:33','2017-10-13 20:13:33'),(8,'aaaaa','ssss@2212.com','$2y$10$PrH7V1f60hZlQ.HQwEqSi.YnC4iGre6Y8sxN9EqUEbJDUdANG/TEW',NULL,'2017-10-17 14:05:40','2017-10-17 14:05:40'),(9,'Mina','mm@mm.com','$2y$10$gxtSEIhYv2H0f1MLlHAxrO9dLD9O2wSGJIFOsOhiiGMi5tWBMbk4K',NULL,'2017-10-17 14:08:43','2017-10-17 14:08:43'),(10,'ssss','ss@ss.com','$2y$10$kBnnEzy.91aFy7lrZin25.tTjM7ObnqiX0c5I128DOSvHtd2zNbZi',NULL,'2017-10-19 17:23:11','2017-10-19 17:23:11'),(11,'ddddddd','dddddddddddddddd@aaaaaaaaaaa.com','$2y$10$bDBcxUrSOpaLCD3QKOrUR.83vkyAefYzTIn5ZzNMM/45JrJFZdV6.',NULL,'2017-10-21 11:03:12','2017-10-21 11:03:12');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-21 15:30:19
