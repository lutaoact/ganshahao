-- MySQL dump 10.11
--
-- Host: localhost    Database: ganshahao
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `company` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `logo` varchar(255) NOT NULL default 'default_logo.png',
  `description` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'数据测试数据测试数据1','logo.png','1999年底，身在美国硅谷的李彦宏看到了中国互联网及中文搜索引擎服务的巨大发展潜力，抱着技术改变世界的梦想，他毅然辞掉硅谷的高薪工作，携搜索引擎专利技术，于2000年1月1日在中关村创建了百度公司。从最初的不足10人发展至今，员工人数超过18000人。如今的百度，已成为中国最受欢迎、影响力最大的中文网站。百度拥有数千名研发工程师，这是中国乃至全球最为优秀的技术团队，这支队伍掌握着世界上最为先进的搜索引擎技术，使百度成为中国掌握世界尖端科学核心技术的中国高科技企业，也使中国成为美国、俄罗斯、和韩国之外，全球仅有的4个拥有搜索引擎核心技术的国家之一。'),(2,'数据测试数据测试数据2','logo.png','McDonald\'s Plaza麦当劳餐厅（McDonald\'s Corporation）是大型的连锁快餐集团，在世界上大约拥有三万间分店，主要售卖汉堡包、薯条、炸鸡、汽水、沙拉等。麦当劳餐厅遍布在全世界六大洲百余个国家。在很多国家麦当劳代表着一种美国式的生活方式。在中国大陆地区的早期的译名是“麦克唐纳快餐”。2010年7月4日，美国媒体报道麦当劳出售的麦乐鸡，含有泥胶和石油成分的化学物质，即聚二甲基硅氧烷和特丁基对苯二酚。2012年1月中旬，麦当劳提高中国市场部分产品价格。2012年5月，麦当劳悄然启动年内第二次涨价，涨幅16.6%。'),(3,'数据测试数据测试数据3','logo.png','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据'),(4,'数据测试数据测试数据4','logo.png','1999年底，身在美国硅谷的李彦宏看到了中国互联网及中文搜索引擎服务的巨大发展潜力，抱着技术改变世界的梦想，他毅然辞掉硅谷的高薪工作，携搜索引擎专利技术，于2000年1月1日在中关村创建了百度公司。从最初的不足10人发展至今，员工人数超过18000人。如今的百度，已成为中国最受欢迎、影响力最大的中文网站。百度拥有数千名研发工程师，这是中国乃至全球最为优秀的技术团队，这支队伍掌握着世界上最为先进的搜索引擎技术，使百度成为中国掌握世界尖端科学核心技术的中国高科技企业，也使中国成为美国、俄罗斯、和韩国之外，全球仅有的4个拥有搜索引擎核心技术的国家之一。'),(5,'数据测试数据测试数据5','logo.png','McDonald\'s Plaza麦当劳餐厅（McDonald\'s Corporation）是大型的连锁快餐集团，在世界上大约拥有三万间分店，主要售卖汉堡包、薯条、炸鸡、汽水、沙拉等。麦当劳餐厅遍布在全世界六大洲百余个国家。在很多国家麦当劳代表着一种美国式的生活方式。在中国大陆地区的早期的译名是“麦克唐纳快餐”。2010年7月4日，美国媒体报道麦当劳出售的麦乐鸡，含有泥胶和石油成分的化学物质，即聚二甲基硅氧烷和特丁基对苯二酚。2012年1月中旬，麦当劳提高中国市场部分产品价格。2012年5月，麦当劳悄然启动年内第二次涨价，涨幅16.6%。'),(6,'数据测试数据测试数据6','logo.png','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据'),(7,'数据测试数据测试数据7','logo.png','1999年底，身在美国硅谷的李彦宏看到了中国互联网及中文搜索引擎服务的巨大发展潜力，抱着技术改变世界的梦想，他毅然辞掉硅谷的高薪工作，携搜索引擎专利技术，于2000年1月1日在中关村创建了百度公司。从最初的不足10人发展至今，员工人数超过18000人。如今的百度，已成为中国最受欢迎、影响力最大的中文网站。百度拥有数千名研发工程师，这是中国乃至全球最为优秀的技术团队，这支队伍掌握着世界上最为先进的搜索引擎技术，使百度成为中国掌握世界尖端科学核心技术的中国高科技企业，也使中国成为美国、俄罗斯、和韩国之外，全球仅有的4个拥有搜索引擎核心技术的国家之一。'),(8,'数据测试数据测试数据8','logo.png','McDonald\'s Plaza麦当劳餐厅（McDonald\'s Corporation）是大型的连锁快餐集团，在世界上大约拥有三万间分店，主要售卖汉堡包、薯条、炸鸡、汽水、沙拉等。麦当劳餐厅遍布在全世界六大洲百余个国家。在很多国家麦当劳代表着一种美国式的生活方式。在中国大陆地区的早期的译名是“麦克唐纳快餐”。2010年7月4日，美国媒体报道麦当劳出售的麦乐鸡，含有泥胶和石油成分的化学物质，即聚二甲基硅氧烷和特丁基对苯二酚。2012年1月中旬，麦当劳提高中国市场部分产品价格。2012年5月，麦当劳悄然启动年内第二次涨价，涨幅16.6%。'),(9,'数据测试数据测试数据9','logo.png','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `job` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `company_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `status` tinyint(1) NOT NULL default '0',
  `updated_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `zipcode` int(6) NOT NULL default '200001',
  `salary` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,1,'临时工1',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,10),(2,1,'临时工2',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,20),(3,1,'临时工1',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,10),(4,2,'临时工2',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,20),(5,2,'临时工1',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,10),(6,2,'临时工2',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,20),(7,3,'临时工1',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,10),(8,3,'临时工2',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,20),(9,3,'临时工1',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,10),(10,3,'临时工2',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,20),(11,4,'临时工1',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,10),(12,4,'临时工2',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,20),(13,4,'临时工1',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,10),(14,5,'临时工2',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,20),(15,5,'临时工1',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,10),(16,5,'临时工2',0,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200011,20),(17,6,'临时工3',1,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200022,20),(18,7,'临时工3',1,'2013-06-06 15:52:53','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','花还东路',200033,30);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_application`
--

DROP TABLE IF EXISTS `job_application`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `job_application` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `job_id` int(10) unsigned NOT NULL default '0',
  `user_id` int(10) unsigned NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `job_application`
--

LOCK TABLES `job_application` WRITE;
/*!40000 ALTER TABLE `job_application` DISABLE KEYS */;
INSERT INTO `job_application` VALUES (1,1,1,0),(2,2,1,0),(3,1,2,0);
/*!40000 ALTER TABLE `job_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `question` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `training_id` int(10) unsigned NOT NULL default '0',
  `content` varchar(255) NOT NULL default '',
  `choices` text NOT NULL,
  `answer` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'怎么扫地？','[\"方法1\", \"方法2\", \"方法3\", \"方法4\"]',1),(2,1,'怎么提水？','[\"方法1\", \"方法2\", \"方法3\", \"方法4\"]',2),(3,1,'怎么炒菜？','[\"方法1\", \"方法2\", \"方法3\", \"方法4\"]',3),(4,2,'怎么扫地2？','[\"方法1\", \"方法2\", \"方法3\", \"方法4\"]',3),(5,2,'怎么提水2？','[\"方法1\", \"方法2\", \"方法3\", \"方法4\"]',2),(6,2,'怎么炒菜2？','[\"方法1\", \"方法2\", \"方法3\", \"方法4\"]',1),(7,3,'怎么扫地3？','[\"方法1\", \"方法2\", \"方法3\", \"方法4\"]',3),(8,3,'怎么提水3？','[\"方法1\", \"方法2\", \"方法3\", \"方法4\"]',2),(9,3,'怎么炒菜3？','[\"方法1\", \"方法2\", \"方法3\", \"方法4\"]',1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `training` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `job_id` int(10) unsigned NOT NULL default '0',
  `training_type` tinyint(1) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `link` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (1,1,1,'给连四你1','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据',''),(2,1,2,'给连四你2','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','test_description.png'),(3,1,3,'给连四你2','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','<embed src=\"http://player.youku.com/player.php/sid/XNTYxMTg2MTQ4/v.swf\" allowFullScreen=\"true\" quality=\"high\" width=\"480\" height=\"400\" align=\"middle\" allowScriptAccess=\"always\" type=\"application/x-shockwave-flash\"></embed>');
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_completed`
--

DROP TABLE IF EXISTS `training_completed`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `training_completed` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `training_id` int(10) unsigned NOT NULL default '0',
  `user_id` int(10) unsigned NOT NULL default '0',
  `score` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `training_completed`
--

LOCK TABLES `training_completed` WRITE;
/*!40000 ALTER TABLE `training_completed` DISABLE KEYS */;
INSERT INTO `training_completed` VALUES (1,1,1,80),(2,2,1,90),(3,2,2,100),(4,1,1,20),(5,2,1,0),(6,1,1,0),(7,2,1,0),(8,3,1,0),(9,1,1,0),(10,2,1,0),(11,3,1,0),(12,1,1,0),(13,2,1,0),(14,3,1,0),(15,1,1,0),(16,2,1,0),(17,3,1,0),(18,1,1,0),(19,2,1,0),(20,3,1,0),(21,1,1,0),(22,2,1,0),(23,3,1,0),(24,1,1,0),(25,2,1,0),(26,3,1,0),(27,1,1,0),(28,2,1,0),(29,3,1,0),(30,1,1,0),(31,2,1,0),(32,3,1,0),(33,1,1,0),(34,2,1,0),(35,3,1,0),(36,1,1,0),(37,2,1,0),(38,3,1,0),(39,1,1,0),(40,2,1,0),(41,3,1,0),(42,1,1,0),(43,2,1,0),(44,3,1,0),(45,1,1,0),(46,2,1,0),(47,3,1,0),(48,1,1,0),(49,2,1,0),(50,3,1,0),(51,1,1,0),(52,2,1,0),(53,1,1,0),(54,2,1,0),(55,1,1,0),(56,2,1,0),(57,1,1,0);
/*!40000 ALTER TABLE `training_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nick_name` varchar(255) NOT NULL default 'nick_name',
  `picture` varchar(255) NOT NULL default 'logo.png',
  `email` varchar(255) NOT NULL default '',
  `mobile` varchar(255) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `zipcode` int(6) NOT NULL default '200001',
  `resume` varchar(255) NOT NULL default '',
  `available_time` text NOT NULL,
  `real_name` varchar(255) NOT NULL default '',
  `is_veteran` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test_nick1','logo.png','a@a.com','13800000000','111','description1',200011,'/doc/resume/id1.doc','[\"1\",\"0\",\"1\",\"0\",\"1\",\"0\",\"1\",\"0\",\"1\",\"0\",\"1\",\"0\",\"1\",\"0\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\"]','来火焰1',0),(2,'test_nick2','logo.png','a@b.com','13800000000','222','description2',200022,'/doc/resume/id2.doc','[\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\"]','来火焰2',0),(3,'test_nick3','logo.png','a@c.com','13800000000','333','description3',200033,'/doc/resume/id3.doc','[\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\"]','来火焰3',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-07  8:10:15
