-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dataweb
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address_line` varchar(255) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `district` varchar(120) DEFAULT NULL,
  `postal_code` varchar(30) DEFAULT NULL,
  `country` varchar(120) DEFAULT 'Vietnam',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,2,'Lê Yến Nhi','0824646331','qwertyuio','asdfghjkl','sdfghjkl','12345678','Vietnam'),(2,2,'Lê Yến Nhi','0947681699','qwsedrftghjk','asdfgh','wertyu','12345','Vietnam'),(3,2,'Lê Yến Nhi','0947681699','qwertyuio','Ha Noi','sdfghjkl','12345','Vietnam'),(4,2,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','1234','Vietnam'),(5,2,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','1234','Vietnam'),(6,2,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','1234','Vietnam'),(7,2,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','1234','Vietnam'),(8,2,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','1234','Vietnam'),(9,2,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','1234','Vietnam'),(10,2,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','1234','Vietnam'),(11,2,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','1234','Vietnam'),(12,2,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','1234','Vietnam'),(13,2,'hehe','+84947681696','qwertyuio','asdfgh','sdfghjkl','12345678','Vietnam'),(14,3,'biendoimatran','+84947681696','qwsedrftghjk','dfghj','wertyu','12345','Vietnam'),(15,3,'hehe','0947681699','qwsedrftghjk','dfghj','wertyu','123456','Vietnam'),(16,1,'hehe','0947681699','qwsedrftghjk','trên trái đất','qwertyu','123456','Vietnam'),(17,1,'biendoimatran','+84947681696','qwsedrftghjk','trên trái đất','qwertyu','123456','Vietnam'),(18,4,'PTIT','1234567','qwsedrftghjk','asdfgh','qwertyu','890','Vietnam'),(19,4,'[ITIS - Training C 2024] Biến đổi ma trận','0947681699','qwertyuio','dfghj','wertyu','12345678','Vietnam'),(20,4,'biendoimatran','0947681699','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','asdfghjkl','qwertyu','890','Vietnam'),(21,2,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','1234','Vietnam'),(22,6,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','12345678','Vietnam'),(23,6,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','123456','Vietnam'),(24,6,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','890','Vietnam'),(25,6,'Lê Yến Nhi','0824646331','Số 10, ngõ 167, đường Nguyễn Văn Trỗi, Mỗ Lao','Hà Nội','Hà Đông','12345','Vietnam'),(26,6,'Hà','123456789','qwsedrftghjk','trên trái đất','trong tỉnh','1234','Vietnam'),(27,7,'Hòa đẹp trai','0888766106','Chiến Thắng','Hà Nội','Hà Đông','36','Vietnam');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$ACwaYnrdNuYYF9AqzQr1mH$lgziwJzp5tfoqTWaKvzZ6UXQigtlglcVfzK5oMrsNHs=','2025-10-06 15:47:22.872943',0,'lyn2609','','','nhileyen2609@gmail.com',0,1,'2025-10-05 11:08:22.384389'),(2,'pbkdf2_sha256$1000000$FaebHkRDbLzyNF9JX9Q1mm$y+RBTVMeLeAF+Ono/9C8LBwAe68oELEESyf7Bgmqc2Q=','2025-10-06 16:46:56.203462',0,'nhi26092005','','','hoathuanhungha@gmail.com',0,1,'2025-10-05 15:41:05.865675'),(3,'pbkdf2_sha256$1000000$tNhswJNhU0mXO5wmD3hC1m$qMnAGqKqJvRpzDHZFljQrX9fzQZN7r+NmWIsHuSDJis=','2025-10-06 15:23:36.114835',0,'nhile2609','','','yoonasone26092005@gmail.com',0,1,'2025-10-06 14:23:42.322372'),(4,'pbkdf2_sha256$1000000$o7ZW618JxPTGZ0HloypD1U$23zcRFQPiie6HiGcNCxiUDB5b1duK1JkKVU/JbM22go=','2025-10-06 15:48:50.455289',0,'le_yen_nhi_397','','','hoathuanhungha@gmail.com',0,1,'2025-10-06 15:48:49.038170'),(5,'pbkdf2_sha256$1000000$VU47sj8rk4fysuLl16C3Qd$TpIiVu+sfOqGnzyGrvCUf/cyh1trqE5WblMASxtyTvk=','2025-10-06 16:19:12.717385',0,'thptleloi123','','','nhileyen2609@gmail.com',0,1,'2025-10-06 16:19:11.240146'),(6,'pbkdf2_sha256$1000000$QeC5ZK9h3NL1KDIX9RIrKv$23UHfv8deq0noK3fayKw9M+5xNvueR1ouszlwt4B/qc=','2025-10-11 14:19:14.050257',0,'ptiter1234','','','ptitne@gmail.com.vn',0,1,'2025-10-06 16:49:47.020156'),(7,'pbkdf2_sha256$1000000$Y0QArCJsECqCNLw74hy4pa$5BEM0lO/00Hul3QjoHdisVV8q94oqd4zya1QPqpk0wk=','2025-10-18 12:57:23.091818',0,'danhhoa','','','1@gamil.com',0,1,'2025-10-18 12:57:21.679196');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-10-05 08:21:25.110473'),(2,'auth','0001_initial','2025-10-05 08:21:26.031111'),(3,'admin','0001_initial','2025-10-05 08:21:26.299612'),(4,'admin','0002_logentry_remove_auto_add','2025-10-05 08:21:26.307881'),(5,'admin','0003_logentry_add_action_flag_choices','2025-10-05 08:21:26.317244'),(6,'contenttypes','0002_remove_content_type_name','2025-10-05 08:21:26.499936'),(7,'auth','0002_alter_permission_name_max_length','2025-10-05 08:21:26.598715'),(8,'auth','0003_alter_user_email_max_length','2025-10-05 08:21:26.635876'),(9,'auth','0004_alter_user_username_opts','2025-10-05 08:21:26.643812'),(10,'auth','0005_alter_user_last_login_null','2025-10-05 08:21:26.730647'),(11,'auth','0006_require_contenttypes_0002','2025-10-05 08:21:26.736167'),(12,'auth','0007_alter_validators_add_error_messages','2025-10-05 08:21:26.744851'),(13,'auth','0008_alter_user_username_max_length','2025-10-05 08:21:26.854247'),(14,'auth','0009_alter_user_last_name_max_length','2025-10-05 08:21:26.962560'),(15,'auth','0010_alter_group_name_max_length','2025-10-05 08:21:26.991117'),(16,'auth','0011_update_proxy_permissions','2025-10-05 08:21:27.001533'),(17,'auth','0012_alter_user_first_name_max_length','2025-10-05 08:21:27.113973'),(18,'sessions','0001_initial','2025-10-05 08:21:27.173348');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ocda7zlopgc138ukxjglt5105dony6y0','.eJxVjDEOgzAQBP9ydWQZbN9hyvR5Azrb50ASgYShQvw9IFEk3Wp3djboeF36bi0yd0OCFghuv13g-JbxHNKLx-ek4jQu8xDUiahrLeoxJfncL_ZP0HPpjzci-doz2tp7y82RcjBEEXVGwoiSxGWrjbcGrTMNB3GBHJOWqsq6PqSR5wXaDRDaat-_GV87Nw:1vA6bC:RmVj4o_OxAknNOmTNn6houZCoiZXOBIFqwomEkm0BDg','2025-11-01 13:03:54.732902'),('vx90pa3udalwtohoh9csjkssgjoz7nmv','.eJxVjEEOwiAQRe_C2hAGkGlduvcMZGBGqRpISrsy3l2bdKHb_977LxVpXUpcu8xxYnVSoA6_W6L8kLoBvlO9NZ1bXeYp6U3RO-360lie5939OyjUy7e2aXDGZAR2gREhoCRkIbAmJ28zGSAvo0AYvAACXvmYRsc5cPAGg3p_ANdDN5Q:1v5OuC:eo_6CLai-HsYzmMYbV4TxoMhEUgF9dasKoAUTyoc2f4','2025-10-19 13:36:04.176891');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `variant_id` bigint DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `unit_price` decimal(12,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `line_total` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,1,15000000.00),(2,1,3,NULL,NULL,'Giường Ngủ Hiện Đại',12000000.00,1,12000000.00),(3,1,5,NULL,NULL,'Ghế Thư Giãn',3200000.00,1,3200000.00),(4,2,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,1,15000000.00),(5,3,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,1,15000000.00),(6,4,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,1,15000000.00),(7,5,2,NULL,NULL,'Bàn Ăn Gỗ Tự Nhiên',8500000.00,1,8500000.00),(8,6,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,1,15000000.00),(9,7,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,1,15000000.00),(10,8,3,NULL,NULL,'Giường Ngủ Hiện Đại',12000000.00,1,12000000.00),(11,8,2,NULL,NULL,'Bàn Ăn Gỗ Tự Nhiên',8500000.00,1,8500000.00),(12,9,4,NULL,NULL,'Kệ Tivi Sang Trọng',4500000.00,1,4500000.00),(13,10,4,NULL,NULL,'Kệ Tivi Sang Trọng',4500000.00,1,4500000.00),(14,11,4,NULL,NULL,'Kệ Tivi Sang Trọng',4500000.00,1,4500000.00),(15,12,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,1,15000000.00),(16,12,4,NULL,NULL,'Kệ Tivi Sang Trọng',4500000.00,1,4500000.00),(17,13,2,NULL,NULL,'Bàn Ăn Gỗ Tự Nhiên',8500000.00,1,8500000.00),(18,14,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,1,15000000.00),(19,15,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,1,15000000.00),(20,16,2,NULL,NULL,'Bàn Ăn Gỗ Tự Nhiên',8500000.00,1,8500000.00),(21,17,2,NULL,NULL,'Bàn Ăn Gỗ Tự Nhiên',8500000.00,1,8500000.00),(22,18,2,NULL,NULL,'Bàn Ăn Gỗ Tự Nhiên',8500000.00,1,8500000.00),(23,19,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,1,15000000.00),(24,20,3,NULL,NULL,'Giường Ngủ Hiện Đại',12000000.00,3,36000000.00),(25,20,6,NULL,NULL,'Sofa Góc Hiện Đại',22000000.00,4,88000000.00),(26,21,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,3,45000000.00),(27,22,4,NULL,NULL,'Kệ Tivi Sang Trọng',4500000.00,5,22500000.00),(28,23,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,3,45000000.00),(29,23,5,NULL,NULL,'Ghế Thư Giãn',3200000.00,5,16000000.00),(30,24,4,NULL,NULL,'Kệ Tivi Sang Trọng',4500000.00,5,22500000.00),(31,25,3,NULL,NULL,'Giường Ngủ Hiện Đại',12000000.00,5,60000000.00),(32,25,5,NULL,NULL,'Ghế Thư Giãn',3200000.00,4,12800000.00),(33,26,5,NULL,NULL,'Ghế Thư Giãn',3200000.00,1,3200000.00),(34,27,1,NULL,NULL,'Sofa Da Cao Cấp',15000000.00,3,45000000.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_number` varchar(30) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `subtotal` decimal(12,2) DEFAULT NULL,
  `shipping_fee` decimal(12,2) DEFAULT '0.00',
  `discount` decimal(12,2) DEFAULT '0.00',
  `total` decimal(12,2) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT 'unpaid',
  `note` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'DH20251005160335',2,'pending',30200000.00,0.00,0.00,30200000.00,'unpaid','','2025-10-06 21:11:49'),(2,'DH20251005160532',2,'pending',15000000.00,0.00,0.00,15000000.00,'unpaid','','2025-10-06 21:11:49'),(3,'DH20251005161650',2,'pending',15000000.00,0.00,0.00,15000000.00,'unpaid','','2025-10-06 21:11:49'),(4,'DH20251006125308',2,'pending',15000000.00,0.00,0.00,15000000.00,'unpaid','','2025-10-06 21:11:49'),(5,'DH20251006125535',2,'pending',8500000.00,0.00,0.00,8500000.00,'unpaid','','2025-10-06 21:11:49'),(6,'DH20251006130631',2,'pending',15000000.00,0.00,0.00,15000000.00,'unpaid','','2025-10-06 21:11:49'),(7,'DH20251006131839',2,'pending',15000000.00,0.00,0.00,15000000.00,'unpaid','','2025-10-06 21:11:49'),(8,'DH20251006132143',2,'pending',20500000.00,0.00,0.00,20500000.00,'unpaid','','2025-10-06 21:11:49'),(9,'DH20251006132525',2,'pending',4500000.00,0.00,0.00,4500000.00,'unpaid','','2025-10-06 21:11:49'),(10,'DH20251006133313',2,'pending',4500000.00,0.00,0.00,4500000.00,'unpaid','Tôi muốn giao hàng nhanh','2025-10-06 21:11:49'),(11,'DH20251006140427',2,'pending',4500000.00,0.00,0.00,4500000.00,'unpaid','','2025-10-06 21:11:49'),(12,'DH20251006141525',2,'pending',19500000.00,0.00,0.00,19500000.00,'unpaid','','2025-10-06 14:15:25'),(13,'DH20251006142650',2,'pending',8500000.00,0.00,0.00,8500000.00,'unpaid','','2025-10-06 14:26:50'),(14,'DH20251006152929',3,'pending',15000000.00,0.00,0.00,15000000.00,'unpaid','','2025-10-06 15:29:29'),(15,'DH20251006153306',3,'pending',15000000.00,0.00,0.00,15000000.00,'unpaid','','2025-10-06 15:33:06'),(16,'DH20251006154315',1,'pending',8500000.00,0.00,0.00,8500000.00,'unpaid','','2025-10-06 15:43:15'),(17,'DH20251006154735',1,'pending',8500000.00,0.00,0.00,8500000.00,'unpaid','','2025-10-06 15:47:35'),(18,'DH20251006154914',4,'pending',8500000.00,0.00,0.00,8500000.00,'unpaid','','2025-10-06 15:49:15'),(19,'DH20251006154938',4,'pending',15000000.00,0.00,0.00,15000000.00,'unpaid','','2025-10-06 15:49:39'),(20,'DH20251006161800',4,'pending',124000000.00,0.00,0.00,124000000.00,'unpaid','','2025-10-06 16:18:00'),(21,'DH20251006164710',2,'pending',45000000.00,0.00,0.00,45000000.00,'unpaid','','2025-10-06 16:47:10'),(22,'DH20251006165019',6,'pending',22500000.00,0.00,0.00,22500000.00,'unpaid','','2025-10-06 16:50:19'),(23,'DH20251006165116',6,'pending',61000000.00,0.00,0.00,61000000.00,'unpaid','','2025-10-06 16:51:17'),(24,'DH20251006165701',6,'pending',22500000.00,0.00,0.00,22500000.00,'unpaid','','2025-10-06 16:57:01'),(25,'DH20251006165754',6,'pending',72800000.00,0.00,0.00,72800000.00,'unpaid','','2025-10-06 16:57:55'),(26,'DH20251008162331',6,'pending',3200000.00,0.00,0.00,3200000.00,'unpaid','Nhi trả tiền','2025-10-08 16:23:31'),(27,'DH20251018130001',7,'pending',45000000.00,0.00,0.00,45000000.00,'unpaid','','2025-10-18 13:00:01');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `url` varchar(1024) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `position` int DEFAULT '0',
  `is_thumbnail` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,1,'/static/assets/img/sofa1.jpg','Sofa Da Cao Cấp - Hình 1',1,1),(2,1,'/static/assets/img/sofa1-2.jpg','Sofa Da Cao Cấp - Hình 2',2,0),(3,1,'/static/assets/img/sofa1-3.jpg','Sofa Da Cao Cấp - Hình 3',3,0),(4,2,'/static/assets/img/ban1.jpg','Bàn Ăn Gỗ Tự Nhiên - Hình 1',1,1),(5,2,'/static/assets/img/ban1-2.jpg','Bàn Ăn Gỗ Tự Nhiên - Hình 2',2,0),(6,3,'/static/assets/img/giuong1.jpg','Giường Ngủ Hiện Đại - Hình 1',1,1),(7,3,'/static/assets/img/giuong1-2.jpg','Giường Ngủ Hiện Đại - Hình 2',2,0),(8,4,'/static/assets/img/ke1.jpg','Kệ Tivi Sang Trọng - Hình 1',1,1),(9,4,'/static/assets/img/ke1-2.jpg','Kệ Tivi Sang Trọng - Hình 2',2,0),(10,5,'/static/assets/img/ghe1.jpg','Ghế Thư Giãn - Hình 1',1,1),(11,5,'/static/assets/img/ghe1-2.jpg','Ghế Thư Giãn - Hình 2',2,0),(12,6,'/static/assets/img/sofa2.jpg','Sofa Góc Hiện Đại - Hình 1',1,1),(13,6,'/static/assets/img/sofa2-2.jpg','Sofa Góc Hiện Đại - Hình 2',2,0);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text,
  `description` text,
  `dimensions` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `warranty` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `features` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Sofa Da Cao Cấp',15000000.00,'sofa-da-cao-cap','Sofa da cao cấp với thiết kế hiện đại','Sofa da cao cấp với thiết kế hiện đại, đệm mút dày dặn, mang lại cảm giác thoải mái tối đa cho người sử dụng.','200cm x 90cm x 85cm','Da bò thật + Gỗ sồi','24 tháng',1,'Da thật 100%; Khung gỗ tự nhiên; Đệm mút cao su non; Chống bám bụi'),(2,'Bàn Ăn Gỗ Tự Nhiên',8500000.00,'ban-an-go-tu-nhien','Bàn ăn gỗ tự nhiên tinh tế','Bàn ăn gỗ tự nhiên với thiết kế tinh tế, phù hợp với mọi không gian phòng ăn hiện đại.','160cm x 80cm x 75cm','Gỗ sồi + Sơn PU','12 tháng',1,'Gỗ sồi tự nhiên; Bề mặt phủ sơn PU; Chống mối mọt; Dễ dàng vệ sinh'),(3,'Giường Ngủ Hiện Đại',12000000.00,'giuong-ngu-hien-dai','Giường ngủ hiện đại tinh tế','Giường ngủ hiện đại với thiết kế đơn giản nhưng tinh tế, mang lại giấc ngủ ngon cho cả gia đình.','160cm x 200cm x 40cm','Gỗ MDF + Vải nỉ','24 tháng',1,'Khung gỗ chắc chắn; Đệm lò xo độc lập; Ngăn kéo tiện lợi; Dễ lắp đặt'),(4,'Kệ Tivi Sang Trọng',4500000.00,'ke-tivi-sang-trong','Kệ tivi sang trọng hiện đại','Kệ tivi sang trọng với thiết kế hiện đại, nhiều ngăn chứa đồ tiện lợi, phù hợp với mọi không gian phòng khách.','180cm x 40cm x 50cm','Gỗ MDF + Kính cường lực','12 tháng',1,'Gỗ công nghiệp cao cấp; Nhiều ngăn chứa; Chống trầy xước; Dễ dàng lau chùi'),(5,'Ghế Thư Giãn',3200000.00,'ghe-thu-gian','Ghế thư giãn thoải mái','Ghế thư giãn với thiết kế ergonomic, giúp giảm căng thẳng và mệt mỏi sau ngày dài làm việc.','70cm x 70cm x 100cm','Khung thép + Vải nỉ','12 tháng',1,'Có thể điều chỉnh độ nghiêng; Đệm mút cao cấp; Tay vịn êm ái; Chống đau lưng'),(6,'Sofa Góc Hiện Đại',22000000.00,'sofa-goc-hien-dai','Sofa góc hiện đại không gian mở','Sofa góc hiện đại với thiết kế không gian mở, phù hợp với phòng khách rộng rãi.','250cm x 160cm x 85cm','Vải linen + Gỗ thông','24 tháng',1,'Chất liệu vải cao cấp; Khung gỗ bền chắc; Đệm mút đàn hồi tốt; Dễ tháo rời vệ sinh');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-19 15:44:35
