-- MySQL dump 10.13  Distrib 5.6.25, for Linux (x86_64)
--
-- Host: localhost    Database: joomla-torneos
-- ------------------------------------------------------
-- Server version	5.6.25

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
-- Table structure for table `imacj_assets`
--

DROP TABLE IF EXISTS `imacj_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_assets`
--

LOCK TABLES `imacj_assets` WRITE;
/*!40000 ALTER TABLE `imacj_assets` DISABLE KEYS */;
INSERT INTO `imacj_assets` VALUES (1,0,0,143,0,'root.1','Root Asset','{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `imacj_assets` VALUES (2,1,1,2,1,'com_admin','com_admin','{}');
INSERT INTO `imacj_assets` VALUES (3,1,3,6,1,'com_banners','com_banners','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (4,1,7,8,1,'com_cache','com_cache','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `imacj_assets` VALUES (5,1,9,10,1,'com_checkin','com_checkin','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `imacj_assets` VALUES (6,1,11,12,1,'com_config','com_config','{}');
INSERT INTO `imacj_assets` VALUES (7,1,13,16,1,'com_contact','com_contact','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `imacj_assets` VALUES (8,1,17,34,1,'com_content','com_content','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}');
INSERT INTO `imacj_assets` VALUES (9,1,35,36,1,'com_cpanel','com_cpanel','{}');
INSERT INTO `imacj_assets` VALUES (10,1,37,38,1,'com_installer','com_installer','{\"core.admin\":[],\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}');
INSERT INTO `imacj_assets` VALUES (11,1,39,40,1,'com_languages','com_languages','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (12,1,41,42,1,'com_login','com_login','{}');
INSERT INTO `imacj_assets` VALUES (13,1,43,44,1,'com_mailto','com_mailto','{}');
INSERT INTO `imacj_assets` VALUES (14,1,45,46,1,'com_massmail','com_massmail','{}');
INSERT INTO `imacj_assets` VALUES (15,1,47,48,1,'com_media','com_media','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}');
INSERT INTO `imacj_assets` VALUES (16,1,49,50,1,'com_menus','com_menus','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (17,1,51,52,1,'com_messages','com_messages','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `imacj_assets` VALUES (18,1,53,110,1,'com_modules','com_modules','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (19,1,111,114,1,'com_newsfeeds','com_newsfeeds','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `imacj_assets` VALUES (20,1,115,116,1,'com_plugins','com_plugins','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (21,1,117,118,1,'com_redirect','com_redirect','{\"core.admin\":{\"7\":1},\"core.manage\":[]}');
INSERT INTO `imacj_assets` VALUES (22,1,119,120,1,'com_search','com_search','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}');
INSERT INTO `imacj_assets` VALUES (23,1,121,122,1,'com_templates','com_templates','{\"core.admin\":{\"7\":1},\"core.options\":[],\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (24,1,123,126,1,'com_users','com_users','{\"core.admin\":{\"7\":1},\"core.options\":[],\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (26,1,127,128,1,'com_wrapper','com_wrapper','{}');
INSERT INTO `imacj_assets` VALUES (27,8,18,21,2,'com_content.category.2','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `imacj_assets` VALUES (28,3,4,5,2,'com_banners.category.3','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (29,7,14,15,2,'com_contact.category.4','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `imacj_assets` VALUES (30,19,112,113,2,'com_newsfeeds.category.5','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `imacj_assets` VALUES (32,24,124,125,1,'com_users.category.7','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (33,1,129,130,1,'com_finder','com_finder','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}');
INSERT INTO `imacj_assets` VALUES (34,1,131,132,1,'com_joomlaupdate','com_joomlaupdate','{\"core.admin\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (35,1,133,134,1,'com_tags','com_tags','{\"core.admin\":[],\"core.manage\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (36,1,135,136,1,'com_contenthistory','com_contenthistory','{}');
INSERT INTO `imacj_assets` VALUES (37,1,137,138,1,'com_ajax','com_ajax','{}');
INSERT INTO `imacj_assets` VALUES (38,1,139,140,1,'com_postinstall','com_postinstall','{}');
INSERT INTO `imacj_assets` VALUES (39,18,54,55,2,'com_modules.module.1','Main Menu','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (40,18,56,57,2,'com_modules.module.2','Login','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (41,18,58,59,2,'com_modules.module.3','Popular Articles','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (42,18,60,61,2,'com_modules.module.4','Recently Added Articles','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (43,18,62,63,2,'com_modules.module.8','Toolbar','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (44,18,64,65,2,'com_modules.module.9','Quick Icons','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (45,18,66,67,2,'com_modules.module.10','Logged-in Users','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (46,18,68,69,2,'com_modules.module.12','Admin Menu','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (47,18,70,71,2,'com_modules.module.13','Admin Submenu','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (48,18,72,73,2,'com_modules.module.14','User Status','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (49,18,74,75,2,'com_modules.module.15','Title','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (50,18,76,77,2,'com_modules.module.16','Login Form','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (51,18,78,79,2,'com_modules.module.17','Breadcrumbs','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (52,18,80,81,2,'com_modules.module.79','Multilanguage status','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (53,18,82,83,2,'com_modules.module.86','Joomla Version','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `imacj_assets` VALUES (54,8,22,29,2,'com_content.category.8','Configuración Torneos','{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `imacj_assets` VALUES (55,18,84,85,2,'com_modules.module.87','Configuración del Torneo','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (56,18,86,87,2,'com_modules.module.88','Navegación Principal','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (57,18,88,89,2,'com_modules.module.89','Perfil de Usuario','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (58,1,141,142,1,'com_quicklogout','Quick Logout','{}');
INSERT INTO `imacj_assets` VALUES (59,54,23,24,3,'com_content.article.1','Cómo administrar tus torneos.','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `imacj_assets` VALUES (60,18,90,91,2,'com_modules.module.90','Vista Torneos','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (61,27,19,20,3,'com_content.article.2','Vista Previa','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `imacj_assets` VALUES (62,18,92,93,2,'com_modules.module.91','Opciones de Gestión','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (63,54,25,26,3,'com_content.article.3','Configurar Torneo','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `imacj_assets` VALUES (64,54,27,28,3,'com_content.article.4','Equipos','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `imacj_assets` VALUES (65,18,94,95,2,'com_modules.module.92','FavSlider Responsive Slideshow','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (66,18,96,97,2,'com_modules.module.93','Banner','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (67,18,98,99,2,'com_modules.module.94','FavSlider Responsive Slideshow (2)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (68,18,100,101,2,'com_modules.module.95','buscar','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (69,18,102,103,2,'com_modules.module.96','Top','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (70,8,30,33,2,'com_content.category.9','Empresa','{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `imacj_assets` VALUES (71,70,31,32,3,'com_content.article.5','Quienes Somos','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `imacj_assets` VALUES (72,18,104,105,2,'com_modules.module.97','EMPRESA','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (73,18,106,107,2,'com_modules.module.98','Menu Ayuda','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}');
INSERT INTO `imacj_assets` VALUES (74,18,108,109,2,'com_modules.module.99','Menu Ayuda','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}');
/*!40000 ALTER TABLE `imacj_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_associations`
--

DROP TABLE IF EXISTS `imacj_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_associations`
--

LOCK TABLES `imacj_associations` WRITE;
/*!40000 ALTER TABLE `imacj_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_banner_clients`
--

DROP TABLE IF EXISTS `imacj_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_banner_clients`
--

LOCK TABLES `imacj_banner_clients` WRITE;
/*!40000 ALTER TABLE `imacj_banner_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_banner_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_banner_tracks`
--

DROP TABLE IF EXISTS `imacj_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_banner_tracks`
--

LOCK TABLES `imacj_banner_tracks` WRITE;
/*!40000 ALTER TABLE `imacj_banner_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_banner_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_banners`
--

DROP TABLE IF EXISTS `imacj_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_banners`
--

LOCK TABLES `imacj_banners` WRITE;
/*!40000 ALTER TABLE `imacj_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_categories`
--

DROP TABLE IF EXISTS `imacj_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_categories`
--

LOCK TABLES `imacj_categories` WRITE;
/*!40000 ALTER TABLE `imacj_categories` DISABLE KEYS */;
INSERT INTO `imacj_categories` VALUES (1,0,0,0,15,0,'','system','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'{}','','','{}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1);
INSERT INTO `imacj_categories` VALUES (2,27,1,1,2,1,'uncategorised','com_content','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1);
INSERT INTO `imacj_categories` VALUES (3,28,1,3,4,1,'uncategorised','com_banners','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1);
INSERT INTO `imacj_categories` VALUES (4,29,1,5,6,1,'uncategorised','com_contact','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1);
INSERT INTO `imacj_categories` VALUES (5,30,1,7,8,1,'uncategorised','com_newsfeeds','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1);
INSERT INTO `imacj_categories` VALUES (7,32,1,9,10,1,'uncategorised','com_users','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1);
INSERT INTO `imacj_categories` VALUES (8,54,1,11,12,1,'configuracion-torneos','com_content','Configuración Torneos','configuracion-torneos','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',398,'2015-09-24 18:28:09',0,'2015-09-24 18:28:09',0,'*',1);
INSERT INTO `imacj_categories` VALUES (9,70,1,13,14,1,'empresa','com_content','Empresa','empresa','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',398,'2015-10-26 17:36:47',398,'2015-10-31 01:33:22',0,'*',1);
/*!40000 ALTER TABLE `imacj_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_contact_details`
--

DROP TABLE IF EXISTS `imacj_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_contact_details`
--

LOCK TABLES `imacj_contact_details` WRITE;
/*!40000 ALTER TABLE `imacj_contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_content`
--

DROP TABLE IF EXISTS `imacj_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_content`
--

LOCK TABLES `imacj_content` WRITE;
/*!40000 ALTER TABLE `imacj_content` DISABLE KEYS */;
INSERT INTO `imacj_content` VALUES (1,59,'Cómo administrar tus torneos.','como-administrar-tus-torneos','<p>Hola, Te damos la bienvenida al panel de administración del torneo, donde podrás gestionar completamente tu torneo.</p>\r\n<p> </p>','',1,8,'2015-10-05 16:54:44',398,'','2015-10-14 22:50:20',398,398,'2015-11-01 23:04:22','2015-10-05 16:54:44','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',8,2,'','',2,145,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*','');
INSERT INTO `imacj_content` VALUES (2,61,'Vista Previa','vista-previa','<p><iframe src=\"external/vista_torneos.php\" width=\"100%\" height=\"500px\" frameborder=\"0\"></iframe></p>','',-2,2,'2015-10-05 17:34:27',398,'','2015-10-26 00:15:16',398,0,'0000-00-00 00:00:00','2015-10-05 17:34:27','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"0\",\"link_titles\":\"\",\"show_tags\":\"0\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"0\",\"link_category\":\"\",\"show_parent_category\":\"0\",\"link_parent_category\":\"\",\"show_author\":\"0\",\"link_author\":\"\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_vote\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',9,0,'','',2,297,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*','');
INSERT INTO `imacj_content` VALUES (3,63,'Configurar Torneo','configurar-torneo','<p>{source}<span style=\"font-family: courier new, courier, monospace;\"><br />&lt;?php<br />$id_torneo = $_GET[\'id_torneo\'];<br />echo \"&lt;form name=\'ids\' action=\'../external/definir_torneo.php\'&gt;</span></p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\">&lt;input type=\'hidden\' name=\'id_tor\' value=\'.$id_torneo.\'&gt;</span></p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\">&lt;/form&gt;<br />\";<br />?&gt;<br /></span>{/source}</p>\r\n<p><input name=\"id_tor\" type=\"hidden\" value=\"..\" /></p>\r\n<p><iframe src=\"external/definir_torneo.php\" width=\"100%\" height=\"500px\" frameborder=\"0\"></iframe></p>','',-2,8,'2015-10-05 18:38:46',398,'','2015-10-06 20:56:25',398,398,'2015-10-09 23:21:22','2015-10-05 18:38:46','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',7,1,'','',2,68,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*','');
INSERT INTO `imacj_content` VALUES (4,64,'Equipos','equipos','<p><iframe src=\"external/equipos.php\" width=\"100%\" height=\"500px\" frameborder=\"0\"></iframe></p>','',-2,8,'2015-10-05 18:39:39',398,'','2015-10-05 18:39:39',0,0,'0000-00-00 00:00:00','2015-10-05 18:39:39','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',1,0,'','',2,16,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*','');
INSERT INTO `imacj_content` VALUES (5,71,'Quienes Somos','quienes-somos','<p>Información de la empresa</p>','',1,9,'2015-10-26 17:37:19',398,'','2015-10-31 01:34:45',398,0,'0000-00-00 00:00:00','2015-10-26 17:37:19','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',2,0,'','',1,2,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*','');
/*!40000 ALTER TABLE `imacj_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_content_frontpage`
--

DROP TABLE IF EXISTS `imacj_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_content_frontpage`
--

LOCK TABLES `imacj_content_frontpage` WRITE;
/*!40000 ALTER TABLE `imacj_content_frontpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_content_frontpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_content_rating`
--

DROP TABLE IF EXISTS `imacj_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_content_rating`
--

LOCK TABLES `imacj_content_rating` WRITE;
/*!40000 ALTER TABLE `imacj_content_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_content_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_content_types`
--

DROP TABLE IF EXISTS `imacj_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_content_types`
--

LOCK TABLES `imacj_content_types` WRITE;
/*!40000 ALTER TABLE `imacj_content_types` DISABLE KEYS */;
INSERT INTO `imacj_content_types` VALUES (1,'Article','com_content.article','{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"Content\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\"}, \"special\":{\"fulltext\":\"fulltext\"}}','ContentHelperRoute::getArticleRoute','{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}');
INSERT INTO `imacj_content_types` VALUES (2,'Contact','com_contact.contact','{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"Contact\",\"prefix\":\"ContactTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}','ContactHelperRoute::getContactRoute','{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }');
INSERT INTO `imacj_content_types` VALUES (3,'Newsfeed','com_newsfeeds.newsfeed','{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"Newsfeed\",\"prefix\":\"NewsfeedsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}','NewsfeedsHelperRoute::getNewsfeedRoute','{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}');
INSERT INTO `imacj_content_types` VALUES (4,'User','com_users.user','{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerdate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}','UsersHelperRoute::getUserRoute','');
INSERT INTO `imacj_content_types` VALUES (5,'Article Category','com_content.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','ContentHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
INSERT INTO `imacj_content_types` VALUES (6,'Contact Category','com_contact.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','ContactHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
INSERT INTO `imacj_content_types` VALUES (7,'Newsfeeds Category','com_newsfeeds.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','NewsfeedsHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
INSERT INTO `imacj_content_types` VALUES (8,'Tag','com_tags.tag','{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"Tag\",\"prefix\":\"TagsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}','TagsHelperRoute::getTagRoute','{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}');
INSERT INTO `imacj_content_types` VALUES (9,'Banner','com_banners.banner','{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"Banner\",\"prefix\":\"BannersTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}','','{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}');
INSERT INTO `imacj_content_types` VALUES (10,'Banners Category','com_banners.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
INSERT INTO `imacj_content_types` VALUES (11,'Banner Client','com_banners.client','{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"Client\",\"prefix\":\"BannersTable\"}}','','','','{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}');
INSERT INTO `imacj_content_types` VALUES (12,'User Notes','com_users.note','{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"Note\",\"prefix\":\"UsersTable\"}}','','','','{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}');
INSERT INTO `imacj_content_types` VALUES (13,'User Notes Category','com_users.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
/*!40000 ALTER TABLE `imacj_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_contentitem_tag_map`
--

DROP TABLE IF EXISTS `imacj_contentitem_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_tag` (`tag_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_contentitem_tag_map`
--

LOCK TABLES `imacj_contentitem_tag_map` WRITE;
/*!40000 ALTER TABLE `imacj_contentitem_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_contentitem_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_core_log_searches`
--

DROP TABLE IF EXISTS `imacj_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_core_log_searches`
--

LOCK TABLES `imacj_core_log_searches` WRITE;
/*!40000 ALTER TABLE `imacj_core_log_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_core_log_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_example_items`
--

DROP TABLE IF EXISTS `imacj_example_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_example_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_example_items`
--

LOCK TABLES `imacj_example_items` WRITE;
/*!40000 ALTER TABLE `imacj_example_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_example_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_extensions`
--

DROP TABLE IF EXISTS `imacj_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_extensions`
--

LOCK TABLES `imacj_extensions` WRITE;
/*!40000 ALTER TABLE `imacj_extensions` DISABLE KEYS */;
INSERT INTO `imacj_extensions` VALUES (1,'com_mailto','component','com_mailto','',0,1,1,1,'{\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mailto\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (2,'com_wrapper','component','com_wrapper','',0,1,1,1,'{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (3,'com_admin','component','com_admin','',1,1,1,1,'{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (4,'com_banners','component','com_banners','',1,1,1,0,'{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}','{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (5,'com_cache','component','com_cache','',1,1,1,1,'{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (6,'com_categories','component','com_categories','',1,1,1,1,'{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (7,'com_checkin','component','com_checkin','',1,1,1,1,'{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"Unknown\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (8,'com_contact','component','com_contact','',1,1,1,0,'{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','{\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_misc\":\"1\",\"show_image\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"show_profile\":\"0\",\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"show_headings\":\"1\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"allow_vcard_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_email_form\":\"1\",\"show_email_copy\":\"1\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_category_crumb\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (9,'com_cpanel','component','com_cpanel','',1,1,1,1,'{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (10,'com_installer','component','com_installer','',1,1,1,1,'{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (11,'com_languages','component','com_languages','',1,1,1,1,'{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}','{\"administrator\":\"es-ES\",\"site\":\"es-ES\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (12,'com_login','component','com_login','',1,1,1,1,'{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (13,'com_media','component','com_media','',1,1,0,1,'{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}','{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (14,'com_menus','component','com_menus','',1,1,1,1,'{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (15,'com_messages','component','com_messages','',1,1,1,1,'{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (16,'com_modules','component','com_modules','',1,1,1,1,'{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (17,'com_newsfeeds','component','com_newsfeeds','',1,1,1,0,'{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (18,'com_plugins','component','com_plugins','',1,1,1,1,'{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (19,'com_search','component','com_search','',1,1,1,0,'{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"search\"}','{\"enabled\":\"0\",\"show_date\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (20,'com_templates','component','com_templates','',1,1,1,1,'{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}','{\"template_positions_display\":\"1\",\"upload_limit\":\"2\",\"image_formats\":\"gif,bmp,jpg,jpeg,png\",\"source_formats\":\"txt,less,ini,xml,js,php,css\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (22,'com_content','component','com_content','',1,1,0,1,'{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"1\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (23,'com_config','component','com_config','',1,1,0,1,'{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}','{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (24,'com_redirect','component','com_redirect','',1,1,0,1,'{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (25,'com_users','component','com_users','',1,1,0,1,'{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}','{\"allowUserRegistration\":\"1\",\"new_usertype\":\"6\",\"guest_usergroup\":\"9\",\"sendpassword\":\"0\",\"useractivation\":\"0\",\"mail_to_admin\":\"0\",\"captcha\":\"\",\"frontend_userparams\":\"0\",\"site_language\":\"0\",\"change_login_name\":\"1\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"4\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (27,'com_finder','component','com_finder','',1,1,0,0,'{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}','{\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_advanced\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stemmer\":\"snowball\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (28,'com_joomlaupdate','component','com_joomlaupdate','',1,1,0,1,'{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (29,'com_tags','component','com_tags','',1,1,1,1,'{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"show_tag_num_items\":\"0\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_descripion\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (30,'com_contenthistory','component','com_contenthistory','',1,1,1,0,'{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (31,'com_ajax','component','com_ajax','',1,1,1,0,'{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (32,'com_postinstall','component','com_postinstall','',1,1,1,1,'{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (101,'SimplePie','library','simplepie','',0,1,1,1,'{\"name\":\"SimplePie\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"SimplePie\",\"copyright\":\"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/simplepie.org\\/\",\"version\":\"1.2\",\"description\":\"LIB_SIMPLEPIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"simplepie\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (102,'phputf8','library','phputf8','',0,1,1,1,'{\"name\":\"phputf8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phputf8\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (103,'Joomla! Platform','library','joomla','',0,1,1,1,'{\"name\":\"Joomla! Platform\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{\"mediaversion\":\"1956054a89b3f2038774224cb098aa80\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (104,'IDNA Convert','library','idna_convert','',0,1,1,1,'{\"name\":\"IDNA Convert\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"phlyLabs\",\"copyright\":\"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de\",\"authorEmail\":\"phlymail@phlylabs.de\",\"authorUrl\":\"http:\\/\\/phlylabs.de\",\"version\":\"0.8.0\",\"description\":\"LIB_IDNA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"idna_convert\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (105,'FOF','library','fof','',0,1,1,1,'{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2015-04-22 13:15:32\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2015 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.4.3\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fof\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (106,'PHPass','library','phpass','',0,1,1,1,'{\"name\":\"PHPass\",\"type\":\"library\",\"creationDate\":\"2004-2006\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"http:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (200,'mod_articles_archive','module','mod_articles_archive','',0,1,1,0,'{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (201,'mod_articles_latest','module','mod_articles_latest','',0,1,1,0,'{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (202,'mod_articles_popular','module','mod_articles_popular','',0,1,1,0,'{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (203,'mod_banners','module','mod_banners','',0,1,1,0,'{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (204,'mod_breadcrumbs','module','mod_breadcrumbs','',0,1,1,1,'{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (205,'mod_custom','module','mod_custom','',0,1,1,1,'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (206,'mod_feed','module','mod_feed','',0,1,1,0,'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (207,'mod_footer','module','mod_footer','',0,1,1,0,'{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (208,'mod_login','module','mod_login','',0,1,1,1,'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (209,'mod_menu','module','mod_menu','',0,1,1,1,'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (210,'mod_articles_news','module','mod_articles_news','',0,1,1,0,'{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (211,'mod_random_image','module','mod_random_image','',0,1,1,0,'{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (212,'mod_related_items','module','mod_related_items','',0,1,1,0,'{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (213,'mod_search','module','mod_search','',0,1,1,0,'{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_search\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (214,'mod_stats','module','mod_stats','',0,1,1,0,'{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (215,'mod_syndicate','module','mod_syndicate','',0,1,1,1,'{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (216,'mod_users_latest','module','mod_users_latest','',0,1,1,0,'{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (218,'mod_whosonline','module','mod_whosonline','',0,1,1,0,'{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (219,'mod_wrapper','module','mod_wrapper','',0,1,1,0,'{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (220,'mod_articles_category','module','mod_articles_category','',0,1,1,0,'{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (221,'mod_articles_categories','module','mod_articles_categories','',0,1,1,0,'{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (222,'mod_languages','module','mod_languages','',0,1,1,1,'{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (223,'mod_finder','module','mod_finder','',0,1,0,0,'{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_finder\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (300,'mod_custom','module','mod_custom','',1,1,1,1,'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (301,'mod_feed','module','mod_feed','',1,1,1,0,'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (302,'mod_latest','module','mod_latest','',1,1,1,0,'{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (303,'mod_logged','module','mod_logged','',1,1,1,0,'{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (304,'mod_login','module','mod_login','',1,1,1,1,'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (305,'mod_menu','module','mod_menu','',1,1,1,0,'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (307,'mod_popular','module','mod_popular','',1,1,1,0,'{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (308,'mod_quickicon','module','mod_quickicon','',1,1,1,1,'{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (309,'mod_status','module','mod_status','',1,1,1,0,'{\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_status\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (310,'mod_submenu','module','mod_submenu','',1,1,1,0,'{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (311,'mod_title','module','mod_title','',1,1,1,0,'{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (312,'mod_toolbar','module','mod_toolbar','',1,1,1,1,'{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (313,'mod_multilangstatus','module','mod_multilangstatus','',1,1,1,0,'{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}','{\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (314,'mod_version','module','mod_version','',1,1,1,0,'{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_version\"}','{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (315,'mod_stats_admin','module','mod_stats_admin','',1,1,1,0,'{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}','{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (316,'mod_tags_popular','module','mod_tags_popular','',0,1,1,0,'{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}','{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (317,'mod_tags_similar','module','mod_tags_similar','',0,1,1,0,'{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}','{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (400,'plg_authentication_gmail','plugin','gmail','authentication',0,0,1,0,'{\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"gmail\"}','{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `imacj_extensions` VALUES (401,'plg_authentication_joomla','plugin','joomla','authentication',0,1,1,1,'{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (402,'plg_authentication_ldap','plugin','ldap','authentication',0,0,1,0,'{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}','{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}','','',0,'0000-00-00 00:00:00',3,0);
INSERT INTO `imacj_extensions` VALUES (403,'plg_content_contact','plugin','contact','content',0,1,1,0,'{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"January 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `imacj_extensions` VALUES (404,'plg_content_emailcloak','plugin','emailcloak','content',0,1,1,0,'{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}','{\"mode\":\"1\"}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `imacj_extensions` VALUES (406,'plg_content_loadmodule','plugin','loadmodule','content',0,1,1,0,'{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}','{\"style\":\"xhtml\"}','','',0,'2011-09-18 15:22:50',0,0);
INSERT INTO `imacj_extensions` VALUES (407,'plg_content_pagebreak','plugin','pagebreak','content',0,1,1,0,'{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}','{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}','','',0,'0000-00-00 00:00:00',4,0);
INSERT INTO `imacj_extensions` VALUES (408,'plg_content_pagenavigation','plugin','pagenavigation','content',0,1,1,0,'{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}','{\"position\":\"1\"}','','',0,'0000-00-00 00:00:00',5,0);
INSERT INTO `imacj_extensions` VALUES (409,'plg_content_vote','plugin','vote','content',0,1,1,0,'{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}','','','',0,'0000-00-00 00:00:00',6,0);
INSERT INTO `imacj_extensions` VALUES (410,'plg_editors_codemirror','plugin','codemirror','editors',0,1,1,1,'{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"http:\\/\\/codemirror.net\\/\",\"version\":\"5.3\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}','{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `imacj_extensions` VALUES (411,'plg_editors_none','plugin','none','editors',0,1,1,1,'{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"September 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}','','','',0,'0000-00-00 00:00:00',2,0);
INSERT INTO `imacj_extensions` VALUES (412,'plg_editors_tinymce','plugin','tinymce','editors',0,1,1,0,'{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2014\",\"author\":\"Moxiecode Systems AB\",\"copyright\":\"Moxiecode Systems AB\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"tinymce.moxiecode.com\",\"version\":\"4.1.7\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}','{\"skin\":\"0\",\"skin_admin\":\"0\",\"mode\":\"1\",\"mobile\":\"0\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"invalid_elements\":\"script,applet\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"html_height\":\"550\",\"html_width\":\"750\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"fonts\":\"1\",\"paste\":\"1\",\"searchreplace\":\"1\",\"insertdate\":\"1\",\"colors\":\"1\",\"table\":\"1\",\"smilies\":\"1\",\"hr\":\"1\",\"link\":\"1\",\"media\":\"1\",\"print\":\"1\",\"directionality\":\"1\",\"fullscreen\":\"1\",\"alignment\":\"1\",\"visualchars\":\"1\",\"visualblocks\":\"1\",\"nonbreaking\":\"1\",\"template\":\"1\",\"blockquote\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"inlinepopups\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}','','',398,'2015-11-01 23:51:26',3,0);
INSERT INTO `imacj_extensions` VALUES (413,'plg_editors-xtd_article','plugin','article','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}','','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `imacj_extensions` VALUES (414,'plg_editors-xtd_image','plugin','image','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}','','','',0,'0000-00-00 00:00:00',2,0);
INSERT INTO `imacj_extensions` VALUES (415,'plg_editors-xtd_pagebreak','plugin','pagebreak','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}','','','',0,'0000-00-00 00:00:00',3,0);
INSERT INTO `imacj_extensions` VALUES (416,'plg_editors-xtd_readmore','plugin','readmore','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}','','','',0,'0000-00-00 00:00:00',4,0);
INSERT INTO `imacj_extensions` VALUES (417,'plg_search_categories','plugin','categories','search',0,1,1,0,'{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (418,'plg_search_contacts','plugin','contacts','search',0,1,1,0,'{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (419,'plg_search_content','plugin','content','search',0,1,1,0,'{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (420,'plg_search_newsfeeds','plugin','newsfeeds','search',0,1,1,0,'{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (422,'plg_system_languagefilter','plugin','languagefilter','system',0,0,1,1,'{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}','','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `imacj_extensions` VALUES (423,'plg_system_p3p','plugin','p3p','system',0,0,1,0,'{\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"p3p\"}','{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}','','',0,'0000-00-00 00:00:00',2,0);
INSERT INTO `imacj_extensions` VALUES (424,'plg_system_cache','plugin','cache','system',0,0,1,1,'{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}','{\"browsercache\":\"0\",\"cachetime\":\"15\"}','','',0,'0000-00-00 00:00:00',9,0);
INSERT INTO `imacj_extensions` VALUES (425,'plg_system_debug','plugin','debug','system',0,1,1,0,'{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}','{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}','','',0,'0000-00-00 00:00:00',4,0);
INSERT INTO `imacj_extensions` VALUES (426,'plg_system_log','plugin','log','system',0,1,1,1,'{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}','','','',0,'0000-00-00 00:00:00',5,0);
INSERT INTO `imacj_extensions` VALUES (427,'plg_system_redirect','plugin','redirect','system',0,0,1,1,'{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}','','','',0,'0000-00-00 00:00:00',6,0);
INSERT INTO `imacj_extensions` VALUES (428,'plg_system_remember','plugin','remember','system',0,1,1,1,'{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}','','','',0,'0000-00-00 00:00:00',7,0);
INSERT INTO `imacj_extensions` VALUES (429,'plg_system_sef','plugin','sef','system',0,1,1,0,'{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}','','','',0,'0000-00-00 00:00:00',8,0);
INSERT INTO `imacj_extensions` VALUES (430,'plg_system_logout','plugin','logout','system',0,1,1,1,'{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}','','','',0,'0000-00-00 00:00:00',3,0);
INSERT INTO `imacj_extensions` VALUES (431,'plg_user_contactcreator','plugin','contactcreator','user',0,0,1,0,'{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}','{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `imacj_extensions` VALUES (432,'plg_user_joomla','plugin','joomla','user',0,1,1,0,'{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}','','',0,'0000-00-00 00:00:00',2,0);
INSERT INTO `imacj_extensions` VALUES (433,'plg_user_profile','plugin','profile','user',0,0,1,0,'{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}','{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (434,'plg_extension_joomla','plugin','joomla','extension',0,1,1,1,'{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `imacj_extensions` VALUES (435,'plg_content_joomla','plugin','joomla','content',0,1,1,0,'{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (436,'plg_system_languagecode','plugin','languagecode','system',0,0,1,0,'{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}','','','',0,'0000-00-00 00:00:00',10,0);
INSERT INTO `imacj_extensions` VALUES (437,'plg_quickicon_joomlaupdate','plugin','joomlaupdate','quickicon',0,1,1,1,'{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (438,'plg_quickicon_extensionupdate','plugin','extensionupdate','quickicon',0,1,1,1,'{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (439,'plg_captcha_recaptcha','plugin','recaptcha','captcha',0,0,1,0,'{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}','{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (440,'plg_system_highlight','plugin','highlight','system',0,1,1,0,'{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}','','','',0,'0000-00-00 00:00:00',7,0);
INSERT INTO `imacj_extensions` VALUES (441,'plg_content_finder','plugin','finder','content',0,0,1,0,'{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (442,'plg_finder_categories','plugin','categories','finder',0,1,1,0,'{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}','','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `imacj_extensions` VALUES (443,'plg_finder_contacts','plugin','contacts','finder',0,1,1,0,'{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}','','','',0,'0000-00-00 00:00:00',2,0);
INSERT INTO `imacj_extensions` VALUES (444,'plg_finder_content','plugin','content','finder',0,1,1,0,'{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','','','',0,'0000-00-00 00:00:00',3,0);
INSERT INTO `imacj_extensions` VALUES (445,'plg_finder_newsfeeds','plugin','newsfeeds','finder',0,1,1,0,'{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','','','',0,'0000-00-00 00:00:00',4,0);
INSERT INTO `imacj_extensions` VALUES (447,'plg_finder_tags','plugin','tags','finder',0,1,1,0,'{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"February 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (448,'plg_twofactorauth_totp','plugin','totp','twofactorauth',0,0,1,0,'{\"name\":\"plg_twofactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (449,'plg_authentication_cookie','plugin','cookie','authentication',0,1,1,0,'{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cookie\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (450,'plg_twofactorauth_yubikey','plugin','yubikey','twofactorauth',0,0,1,0,'{\"name\":\"plg_twofactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (451,'plg_search_tags','plugin','tags','search',0,1,1,0,'{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (503,'beez3','template','beez3','',0,1,1,0,'{\"name\":\"beez3\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"3.1.0\",\"description\":\"TPL_BEEZ3_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (504,'hathor','template','hathor','',1,1,1,0,'{\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"hathor@tarrconsulting.com\",\"authorUrl\":\"http:\\/\\/www.tarrconsulting.com\",\"version\":\"3.0.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (506,'protostar','template','protostar','',0,1,1,0,'{\"name\":\"protostar\",\"type\":\"template\",\"creationDate\":\"4\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_PROTOSTAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (507,'isis','template','isis','',1,1,1,0,'{\"name\":\"isis\",\"type\":\"template\",\"creationDate\":\"3\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ISIS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"templateColor\":\"\",\"logoFile\":\"\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (600,'English (en-GB)','language','en-GB','',0,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2013-03-07\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.2\",\"description\":\"en-GB site language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (601,'English (en-GB)','language','en-GB','',1,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2013-03-07\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.2\",\"description\":\"en-GB administrator language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (700,'files_joomla','file','joomla','',0,1,1,1,'{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"June 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.3\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (701,'torneos_j','template','torneos_j','',0,1,1,0,'{\"name\":\"torneos_j\",\"type\":\"template\",\"creationDate\":\"4\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_PROTOSTAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"templateColor\":\"#08C\",\"templateBackgroundColor\":\"#F4F6F7\",\"logoFile\":\"\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (702,'Quick Logout','component','com_quicklogout','',1,1,0,0,'{\"name\":\"Quick Logout\",\"type\":\"component\",\"creationDate\":\"2014-07-25\",\"author\":\"John Muehleisen\",\"copyright\":\"Copyright (C) 2014. All rights reserved.\",\"authorEmail\":\"john@welcometojoomla.com\",\"authorUrl\":\"www.welcometojoomla.com\",\"version\":\"1.9.3\",\"description\":\"Adds a new menu option type to Joomla to allow a one click logout\",\"group\":\"\",\"filename\":\"quicklogout\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (704,'plg_system_nnframework','plugin','nnframework','system',0,1,1,0,'{\"name\":\"plg_system_nnframework\",\"type\":\"plugin\",\"creationDate\":\"August 2015\",\"author\":\"NoNumber (Peter van Westen)\",\"copyright\":\"Copyright \\u00a9 2015 NoNumber All Rights Reserved\",\"authorEmail\":\"peter@nonumber.nl\",\"authorUrl\":\"https:\\/\\/www.nonumber.nl\",\"version\":\"15.8.11040\",\"description\":\"PLG_SYSTEM_NNFRAMEWORK_DESC\",\"group\":\"\",\"filename\":\"nnframework\"}','{\"max_list_count\":\"2500\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (705,'plg_editors-xtd_sourcerer','plugin','sourcerer','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_sourcerer\",\"type\":\"plugin\",\"creationDate\":\"August 2015\",\"author\":\"NoNumber (Peter van Westen)\",\"copyright\":\"Copyright \\u00a9 2015 NoNumber All Rights Reserved\",\"authorEmail\":\"peter@nonumber.nl\",\"authorUrl\":\"https:\\/\\/www.nonumber.nl\",\"version\":\"5.0.2\",\"description\":\"PLG_EDITORS-XTD_SOURCERER_DESC\",\"group\":\"\",\"filename\":\"sourcerer\"}','[]','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (706,'plg_system_sourcerer','plugin','sourcerer','system',0,1,1,0,'{\"name\":\"plg_system_sourcerer\",\"type\":\"plugin\",\"creationDate\":\"August 2015\",\"author\":\"NoNumber (Peter van Westen)\",\"copyright\":\"Copyright \\u00a9 2015 NoNumber All Rights Reserved\",\"authorEmail\":\"peter@nonumber.nl\",\"authorUrl\":\"https:\\/\\/www.nonumber.nl\",\"version\":\"5.0.2\",\"description\":\"PLG_SYSTEM_SOURCERER_DESC\",\"group\":\"\",\"filename\":\"sourcerer\"}','{\"syntax_word\":\"source\",\"include_path\":\"\\/\",\"enable_css\":\"1\",\"enable_js\":\"1\",\"enable_php\":\"1\",\"forbidden_php\":\"dl, escapeshellarg, escapeshellcmd, exec, passthru, popen, proc_close, proc_open, shell_exec, symlink, system\",\"forbidden_tags\":\"\",\"@notice_articles_security_level\":\"NN_ONLY_AVAILABLE_IN_PRO\",\"@notice_articles_enable_css\":\"NN_ONLY_AVAILABLE_IN_PRO\",\"@notice_articles_enable_js\":\"NN_ONLY_AVAILABLE_IN_PRO\",\"@notice_articles_enable_php\":\"NN_ONLY_AVAILABLE_IN_PRO\",\"@notice_components_enable_css\":\"NN_ONLY_AVAILABLE_IN_PRO\",\"@notice_components_enable_js\":\"NN_ONLY_AVAILABLE_IN_PRO\",\"@notice_components_enable_php\":\"NN_ONLY_AVAILABLE_IN_PRO\",\"@wizard\":\"0\",\"@noticeother_enable_css\":\"NN_ONLY_AVAILABLE_IN_PRO\",\"@notice_other_enable_js\":\"NN_ONLY_AVAILABLE_IN_PRO\",\"@notice_other_enable_php\":\"NN_ONLY_AVAILABLE_IN_PRO\",\"button_text\":\"Code\",\"enable_frontend\":\"1\",\"addsourcetags\":\"1\",\"@notice_use_example_code\":\"NN_ONLY_AVAILABLE_IN_PRO\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (707,'joomla_lang_full','language','es-ES','',0,1,0,0,'{\"name\":\"joomla_lang_full\",\"type\":\"language\",\"creationDate\":\"09\\/09\\/2015\",\"author\":\"Spanish Translation Team: Comunidad Joomla\",\"copyright\":\"Copyright (C) 2005 - 2015 comunididadjomla.org. All rights reserved.\",\"authorEmail\":\"info@comunidadjoomla.org\",\"authorUrl\":\"\",\"version\":\"3.4.4.1\",\"description\":\"es-ESsite language\",\"group\":\"\",\"filename\":\"install\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (708,'joomla_lang_full','language','es-ES','',1,1,0,0,'{\"name\":\"joomla_lang_full\",\"type\":\"language\",\"creationDate\":\"09\\/09\\/2015\",\"author\":\"Spanish Translation Team: Comunidad Joomla\",\"copyright\":\"Copyright (C) 2005 - 2015 comunididadjomla.org. All rights reserved.\",\"authorEmail\":\"info@comunidadjoomla.org\",\"authorUrl\":\"\",\"version\":\"3.4.4.1\",\"description\":\"es-ESsite language\",\"group\":\"\",\"filename\":\"install\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (709,'joomla_lang_full','package','pkg_es-ES','',0,1,1,0,'{\"name\":\"joomla_lang_full\",\"type\":\"package\",\"creationDate\":\"09\\/09\\/2015\",\"author\":\"Spanish Translation Team: Comunidad Joomla\",\"copyright\":\"Copyright (C) 2005 - 2015 comunididadjomla.org. All rights reserved.\",\"authorEmail\":\"info@comunidadjoomla.org\",\"authorUrl\":\"\",\"version\":\"3.4.4.1\",\"description\":\"<div style=\\\"text-align:left;\\\"><h2>Successfully installed the spanish language pack for Joomla! 3.4.4.<\\/h2><p><\\/p><p>Please report any bugs or issues at the Comunidad Joomla! <a href=\\\"http:\\/\\/foro.comunidadjoomla.org\\/traduccion-ext\\/\\\" target=\\\"_blank\\\">Translation forum<\\/a><\\/p><p><\\/p><p>Translated by: <a href=\\\"http:\\/\\/www.comunidadjoomla.org\\\" target=\\\"_blank\\\" title=\\\"\\\">The spanish translation team of Comunidad Joomla!<\\/a><\\/p><h2>El paquete en espa\\u00f1ol para Joomla! 3.4.4 se ha instalado correctamente.<\\/h2><p><\\/p><p>Por favor, reporte cualquier bug o asunto relacionado a nuestro <a href=\\\"http:\\/\\/foro.comunidadjoomla.org\\/traduccion-ext\\/\\\" target=\\\"_blank\\\">Foro de traducciones<\\/a><\\/p><p><\\/p><p>Traducci\\u00f3n: <a href=\\\"http:\\/\\/www.comunidadjoomla.org\\\" target=\\\"_blank\\\" title=\\\"\\\">El equipo de traducci\\u00f3n de Comunidad Joomla!<\\/a><\\/p><\\/div>\",\"group\":\"\",\"filename\":\"pkg_es-ES\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `imacj_extensions` VALUES (710,'FavSlider Responsive Slideshow','module','mod_favslider','',0,1,0,0,'{\"name\":\"FavSlider Responsive Slideshow\",\"type\":\"module\",\"creationDate\":\"2013\",\"author\":\"FavThemes\",\"copyright\":\"Copyright (C) FavThemes. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.favthemes.com\",\"version\":\"1.7\",\"description\":\"\\n\\t\\n\\n<a href=\\\"http:\\/\\/extensions.favthemes.com\\/favslider\\\" target=\\\"_blank\\\"><strong>FavSlider<\\/strong><\\/a> is a free responsive Joomla! module that let\'s you use images and video to create a slideshow with 4 default layouts and customize each slide with 100+ module parameters.\\n\\nFor more info, please see the <a href=\\\"http:\\/\\/extensions.favthemes.com\\/favslider\\\" target=\\\"_blank\\\" style=\\\"font-weight: bold;\\\">demo and documentation<\\/a> for the FavSlider module.\\n<br\\/><br\\/>\\n\\n<a href=\\\"http:\\/\\/extensions.favthemes.com\\/favslider\\\" target=\\\"_blank\\\">\\n\\t<img src=\\\"..\\/modules\\/mod_favslider\\/theme\\/img\\/favslider.jpg\\\" alt=\\\"FavSlider Reponsive Slideshow\\\">\\n<\\/a>\\n\\n<br\\/><br\\/>\\nCopyright &#169; 2012-2015 <a href=\\\"http:\\/\\/www.favthemes.com\\\" target=\\\"_blank\\\" style=\\\"font-weight: bold;\\\">FavThemes<\\/a>.\\n<br\\/><br\\/>\\n\\n<link rel=\\\"stylesheet\\\" href=\\\"..\\/modules\\/mod_favslider\\/theme\\/css\\/admin.css\\\" type=\\\"text\\/css\\\" \\/>\\n<script src=\\\"..\\/modules\\/mod_favslider\\/theme\\/js\\/jscolor\\/jscolor.js\\\" type=\\\"text\\/javascript\\\"><\\/script>\\n\\n\\t\",\"group\":\"\",\"filename\":\"mod_favslider\"}','{\"sliderType\":\"slidernav\",\"jqueryLoad\":\"1\",\"animationEffect\":\"slide\",\"slideHeight\":\"\",\"thumbHeight\":\"\",\"linkTarget\":\"self\",\"arrowNav\":\"1\",\"arrowNavStyle\":\"dark-arrows\",\"controlNav\":\"1\",\"slideshow\":\"0\",\"randomize\":\"0\",\"animationLoop\":\"1\",\"pauseOnHover\":\"1\",\"keyboardNav\":\"1\",\"mousewheel\":\"0\",\"slideshowSpeed\":\"7000\",\"captionHide\":\"visible\",\"layoutEffect\":\"layout-effect1\",\"captionTextAlign\":\"favalign-left\",\"captionStyle\":\"favstyle-default\",\"captionBgStyle\":\"favstyle-bg-dark\",\"captionWidth\":\"\",\"captionHeight\":\"\",\"captionTitleGoogleFont\":\"Open Sans\",\"captionTitleFontSize\":\"\",\"captionTitleTextTransform\":\"uppercase\",\"captionTitlePadding\":\"\",\"captionTitleMargin\":\"\",\"captionDescriptionGoogleFont\":\"Open Sans\",\"captionDescriptionFontSize\":\"\",\"captionReadMoreColor\":\"\",\"captionReadMoreBgColor\":\"\",\"captionReadMoreGoogleFont\":\"Open Sans\",\"captionReadMorePadding\":\"\",\"captionReadMoreMargin\":\"\",\"file1active\":\"1\",\"file1type\":\"image\",\"file1\":\"media\\/favslider\\/demo\\/slide1.jpg\",\"file1link\":\"\",\"file1favtitle\":\"\",\"file1favdescription\":\"\",\"file2active\":\"1\",\"file2type\":\"image\",\"file2\":\"media\\/favslider\\/demo\\/slide2.jpg\",\"file3active\":\"1\",\"file3type\":\"image\",\"file3\":\"media\\/favslider\\/demo\\/slide3.jpg\",\"file4active\":\"1\",\"file4type\":\"image\",\"file4\":\"media\\/favslider\\/demo\\/slide4.jpg\",\"file5active\":\"1\",\"file5type\":\"image\",\"file5\":\"media\\/favslider\\/demo\\/slide5.jpg\",\"file6active\":\"0\",\"file6type\":\"image\",\"file6\":\"\",\"file7active\":\"0\",\"file7type\":\"image\",\"file7\":\"\",\"file8active\":\"0\",\"file8type\":\"image\",\"file8\":\"\",\"file9active\":\"0\",\"file9type\":\"image\",\"file9\":\"\",\"file10active\":\"0\",\"file10type\":\"image\",\"file10\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}','','',0,'0000-00-00 00:00:00',0,0);
/*!40000 ALTER TABLE `imacj_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_filters`
--

DROP TABLE IF EXISTS `imacj_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_filters`
--

LOCK TABLES `imacj_finder_filters` WRITE;
/*!40000 ALTER TABLE `imacj_finder_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links`
--

DROP TABLE IF EXISTS `imacj_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links`
--

LOCK TABLES `imacj_finder_links` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_terms0`
--

DROP TABLE IF EXISTS `imacj_finder_links_terms0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_terms0`
--

LOCK TABLES `imacj_finder_links_terms0` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_terms0` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_terms0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_terms1`
--

DROP TABLE IF EXISTS `imacj_finder_links_terms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_terms1`
--

LOCK TABLES `imacj_finder_links_terms1` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_terms1` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_terms1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_terms2`
--

DROP TABLE IF EXISTS `imacj_finder_links_terms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_terms2`
--

LOCK TABLES `imacj_finder_links_terms2` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_terms2` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_terms2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_terms3`
--

DROP TABLE IF EXISTS `imacj_finder_links_terms3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_terms3`
--

LOCK TABLES `imacj_finder_links_terms3` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_terms3` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_terms3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_terms4`
--

DROP TABLE IF EXISTS `imacj_finder_links_terms4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_terms4`
--

LOCK TABLES `imacj_finder_links_terms4` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_terms4` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_terms4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_terms5`
--

DROP TABLE IF EXISTS `imacj_finder_links_terms5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_terms5`
--

LOCK TABLES `imacj_finder_links_terms5` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_terms5` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_terms5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_terms6`
--

DROP TABLE IF EXISTS `imacj_finder_links_terms6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_terms6`
--

LOCK TABLES `imacj_finder_links_terms6` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_terms6` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_terms6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_terms7`
--

DROP TABLE IF EXISTS `imacj_finder_links_terms7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_terms7`
--

LOCK TABLES `imacj_finder_links_terms7` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_terms7` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_terms7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_terms8`
--

DROP TABLE IF EXISTS `imacj_finder_links_terms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_terms8`
--

LOCK TABLES `imacj_finder_links_terms8` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_terms8` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_terms8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_terms9`
--

DROP TABLE IF EXISTS `imacj_finder_links_terms9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_terms9`
--

LOCK TABLES `imacj_finder_links_terms9` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_terms9` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_terms9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_termsa`
--

DROP TABLE IF EXISTS `imacj_finder_links_termsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_termsa`
--

LOCK TABLES `imacj_finder_links_termsa` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_termsa` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_termsa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_termsb`
--

DROP TABLE IF EXISTS `imacj_finder_links_termsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_termsb`
--

LOCK TABLES `imacj_finder_links_termsb` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_termsb` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_termsb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_termsc`
--

DROP TABLE IF EXISTS `imacj_finder_links_termsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_termsc`
--

LOCK TABLES `imacj_finder_links_termsc` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_termsc` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_termsc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_termsd`
--

DROP TABLE IF EXISTS `imacj_finder_links_termsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_termsd`
--

LOCK TABLES `imacj_finder_links_termsd` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_termsd` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_termsd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_termse`
--

DROP TABLE IF EXISTS `imacj_finder_links_termse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_termse`
--

LOCK TABLES `imacj_finder_links_termse` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_termse` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_termse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_links_termsf`
--

DROP TABLE IF EXISTS `imacj_finder_links_termsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_links_termsf`
--

LOCK TABLES `imacj_finder_links_termsf` WRITE;
/*!40000 ALTER TABLE `imacj_finder_links_termsf` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_links_termsf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_taxonomy`
--

DROP TABLE IF EXISTS `imacj_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_taxonomy`
--

LOCK TABLES `imacj_finder_taxonomy` WRITE;
/*!40000 ALTER TABLE `imacj_finder_taxonomy` DISABLE KEYS */;
INSERT INTO `imacj_finder_taxonomy` VALUES (1,0,'ROOT',0,0,0);
/*!40000 ALTER TABLE `imacj_finder_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `imacj_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_taxonomy_map`
--

LOCK TABLES `imacj_finder_taxonomy_map` WRITE;
/*!40000 ALTER TABLE `imacj_finder_taxonomy_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_taxonomy_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_terms`
--

DROP TABLE IF EXISTS `imacj_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_terms`
--

LOCK TABLES `imacj_finder_terms` WRITE;
/*!40000 ALTER TABLE `imacj_finder_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_terms_common`
--

DROP TABLE IF EXISTS `imacj_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_terms_common`
--

LOCK TABLES `imacj_finder_terms_common` WRITE;
/*!40000 ALTER TABLE `imacj_finder_terms_common` DISABLE KEYS */;
INSERT INTO `imacj_finder_terms_common` VALUES ('a','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('about','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('after','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('ago','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('all','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('am','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('an','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('and','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('ani','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('any','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('are','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('aren\'t','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('as','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('at','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('be','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('but','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('by','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('for','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('from','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('get','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('go','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('how','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('if','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('in','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('into','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('is','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('isn\'t','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('it','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('its','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('me','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('more','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('most','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('must','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('my','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('new','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('no','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('none','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('not','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('noth','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('nothing','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('of','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('off','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('often','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('old','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('on','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('onc','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('once','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('onli','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('only','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('or','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('other','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('our','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('ours','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('out','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('over','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('page','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('she','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('should','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('small','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('so','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('some','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('than','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('thank','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('that','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('the','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('their','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('theirs','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('them','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('then','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('there','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('these','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('they','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('this','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('those','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('thus','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('time','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('times','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('to','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('too','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('true','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('under','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('until','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('up','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('upon','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('use','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('user','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('users','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('veri','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('version','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('very','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('via','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('want','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('was','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('way','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('were','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('what','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('when','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('where','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('whi','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('which','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('who','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('whom','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('whose','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('why','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('wide','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('will','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('with','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('within','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('without','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('would','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('yes','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('yet','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('you','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('your','en');
INSERT INTO `imacj_finder_terms_common` VALUES ('yours','en');
/*!40000 ALTER TABLE `imacj_finder_terms_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_tokens`
--

DROP TABLE IF EXISTS `imacj_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_tokens`
--

LOCK TABLES `imacj_finder_tokens` WRITE;
/*!40000 ALTER TABLE `imacj_finder_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `imacj_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_tokens_aggregate`
--

LOCK TABLES `imacj_finder_tokens_aggregate` WRITE;
/*!40000 ALTER TABLE `imacj_finder_tokens_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_tokens_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_finder_types`
--

DROP TABLE IF EXISTS `imacj_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_finder_types`
--

LOCK TABLES `imacj_finder_types` WRITE;
/*!40000 ALTER TABLE `imacj_finder_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_finder_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_languages`
--

DROP TABLE IF EXISTS `imacj_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_languages`
--

LOCK TABLES `imacj_languages` WRITE;
/*!40000 ALTER TABLE `imacj_languages` DISABLE KEYS */;
INSERT INTO `imacj_languages` VALUES (1,'en-GB','English (UK)','English (UK)','en','en','','','','',1,1,1);
/*!40000 ALTER TABLE `imacj_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_menu`
--

DROP TABLE IF EXISTS `imacj_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_menu`
--

LOCK TABLES `imacj_menu` WRITE;
/*!40000 ALTER TABLE `imacj_menu` DISABLE KEYS */;
INSERT INTO `imacj_menu` VALUES (1,'','Menu_Item_Root','root','','','','',1,0,0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,93,0,'*',0);
INSERT INTO `imacj_menu` VALUES (2,'menu','com_banners','Banners','','Banners','index.php?option=com_banners','component',0,1,1,4,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',1,10,0,'*',1);
INSERT INTO `imacj_menu` VALUES (3,'menu','com_banners','Banners','','Banners/Banners','index.php?option=com_banners','component',0,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',2,3,0,'*',1);
INSERT INTO `imacj_menu` VALUES (4,'menu','com_banners_categories','Categories','','Banners/Categories','index.php?option=com_categories&extension=com_banners','component',0,2,2,6,0,'0000-00-00 00:00:00',0,0,'class:banners-cat',0,'',4,5,0,'*',1);
INSERT INTO `imacj_menu` VALUES (5,'menu','com_banners_clients','Clients','','Banners/Clients','index.php?option=com_banners&view=clients','component',0,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners-clients',0,'',6,7,0,'*',1);
INSERT INTO `imacj_menu` VALUES (6,'menu','com_banners_tracks','Tracks','','Banners/Tracks','index.php?option=com_banners&view=tracks','component',0,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners-tracks',0,'',8,9,0,'*',1);
INSERT INTO `imacj_menu` VALUES (7,'menu','com_contact','Contacts','','Contacts','index.php?option=com_contact','component',0,1,1,8,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',53,58,0,'*',1);
INSERT INTO `imacj_menu` VALUES (8,'menu','com_contact','Contacts','','Contacts/Contacts','index.php?option=com_contact','component',0,7,2,8,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',54,55,0,'*',1);
INSERT INTO `imacj_menu` VALUES (9,'menu','com_contact_categories','Categories','','Contacts/Categories','index.php?option=com_categories&extension=com_contact','component',0,7,2,6,0,'0000-00-00 00:00:00',0,0,'class:contact-cat',0,'',56,57,0,'*',1);
INSERT INTO `imacj_menu` VALUES (10,'menu','com_messages','Messaging','','Messaging','index.php?option=com_messages','component',0,1,1,15,0,'0000-00-00 00:00:00',0,0,'class:messages',0,'',47,52,0,'*',1);
INSERT INTO `imacj_menu` VALUES (11,'menu','com_messages_add','New Private Message','','Messaging/New Private Message','index.php?option=com_messages&task=message.add','component',0,10,2,15,0,'0000-00-00 00:00:00',0,0,'class:messages-add',0,'',48,49,0,'*',1);
INSERT INTO `imacj_menu` VALUES (12,'menu','com_messages_read','Read Private Message','','Messaging/Read Private Message','index.php?option=com_messages','component',0,10,2,15,0,'0000-00-00 00:00:00',0,0,'class:messages-read',0,'',50,51,0,'*',1);
INSERT INTO `imacj_menu` VALUES (13,'menu','com_newsfeeds','News Feeds','','News Feeds','index.php?option=com_newsfeeds','component',0,1,1,17,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',59,64,0,'*',1);
INSERT INTO `imacj_menu` VALUES (14,'menu','com_newsfeeds_feeds','Feeds','','News Feeds/Feeds','index.php?option=com_newsfeeds','component',0,13,2,17,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',60,61,0,'*',1);
INSERT INTO `imacj_menu` VALUES (15,'menu','com_newsfeeds_categories','Categories','','News Feeds/Categories','index.php?option=com_categories&extension=com_newsfeeds','component',0,13,2,6,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds-cat',0,'',62,63,0,'*',1);
INSERT INTO `imacj_menu` VALUES (16,'menu','com_redirect','Redirect','','Redirect','index.php?option=com_redirect','component',0,1,1,24,0,'0000-00-00 00:00:00',0,0,'class:redirect',0,'',67,68,0,'*',1);
INSERT INTO `imacj_menu` VALUES (17,'menu','com_search','Basic Search','','Basic Search','index.php?option=com_search','component',0,1,1,19,0,'0000-00-00 00:00:00',0,0,'class:search',0,'',71,72,0,'*',1);
INSERT INTO `imacj_menu` VALUES (18,'menu','com_finder','Smart Search','','Smart Search','index.php?option=com_finder','component',0,1,1,27,0,'0000-00-00 00:00:00',0,0,'class:finder',0,'',75,76,0,'*',1);
INSERT INTO `imacj_menu` VALUES (19,'menu','com_joomlaupdate','Joomla! Update','','Joomla! Update','index.php?option=com_joomlaupdate','component',1,1,1,28,0,'0000-00-00 00:00:00',0,0,'class:joomlaupdate',0,'',65,66,0,'*',1);
INSERT INTO `imacj_menu` VALUES (20,'main','com_tags','Tags','','Tags','index.php?option=com_tags','component',0,1,1,29,0,'0000-00-00 00:00:00',0,1,'class:tags',0,'',69,70,0,'',1);
INSERT INTO `imacj_menu` VALUES (21,'main','com_postinstall','Post-installation messages','','Post-installation messages','index.php?option=com_postinstall','component',0,1,1,32,0,'0000-00-00 00:00:00',0,1,'class:postinstall',0,'',73,74,0,'*',1);
INSERT INTO `imacj_menu` VALUES (101,'mainmenu','Home','home','','home','index.php?option=com_content&view=featured','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"3\",\"num_columns\":\"3\",\"num_links\":\"0\",\"multi_column_order\":\"1\",\"orderby_pri\":\"\",\"orderby_sec\":\"front\",\"order_date\":\"\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"1\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',77,78,1,'*',0);
INSERT INTO `imacj_menu` VALUES (102,'menutorneo','Definir Torneo','definir-torneo','','definir-torneo','index.php?option=com_content&view=article&id=3','component',-2,1,1,22,0,'0000-00-00 00:00:00',0,2,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',45,46,0,'*',0);
INSERT INTO `imacj_menu` VALUES (103,'navprincipal','Entrar','entrar','','entrar','index.php?option=com_users&view=login','component',1,1,1,25,0,'0000-00-00 00:00:00',0,5,'',0,'{\"login_redirect_url\":\"index.php\\/perfil\",\"logindescription_show\":\"1\",\"login_description\":\"\",\"login_image\":\"\",\"logout_redirect_url\":\"\",\"logoutdescription_show\":\"1\",\"logout_description\":\"\",\"logout_image\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',87,88,0,'*',0);
INSERT INTO `imacj_menu` VALUES (104,'navprincipal','Registro','registro','','registro','index.php?option=com_users&view=registration','component',1,1,1,25,0,'0000-00-00 00:00:00',0,5,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',89,90,0,'*',0);
INSERT INTO `imacj_menu` VALUES (105,'perfil','Perfil','perfil','','perfil','index.php?option=com_users&view=profile','component',1,1,1,25,398,'2015-10-16 22:44:15',0,2,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',37,38,0,'*',0);
INSERT INTO `imacj_menu` VALUES (106,'perfil','Administrar','2015-09-24-20-59-13','','2015-09-24-20-59-13','index.php?option=com_wrapper&view=wrapper','component',1,1,1,2,0,'0000-00-00 00:00:00',0,2,'',0,'{\"url\":\"\\/joomla-torneos\\/external\\/vista_torneos.php\",\"scrolling\":\"auto\",\"width\":\"100%\",\"height\":\"500\",\"height_auto\":\"0\",\"add_scheme\":\"1\",\"frameborder\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\" margen_i_frame\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',39,40,0,'*',0);
INSERT INTO `imacj_menu` VALUES (107,'main','COM_QUICKLOGOUT','com-quicklogout','','com-quicklogout','index.php?option=com_quicklogout','component',0,1,1,702,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',79,80,0,'',1);
INSERT INTO `imacj_menu` VALUES (108,'perfil','Salir','salir','','salir','index.php?option=com_quicklogout&view=quicklogout','component',0,1,1,702,0,'0000-00-00 00:00:00',0,2,'',0,'{\"quick_logout_redirect\":\"101\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',43,44,0,'*',0);
INSERT INTO `imacj_menu` VALUES (109,'top','Salir','salir-ad','','salir-ad','index.php?option=com_quicklogout&view=quicklogout','component',1,1,1,702,0,'0000-00-00 00:00:00',0,2,'',0,'{\"quick_logout_redirect\":\"101\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',35,36,0,'*',0);
INSERT INTO `imacj_menu` VALUES (110,'menutorneo','Equipos/Participantes','equipos','','equipos','index.php?option=com_wrapper&view=wrapper','component',1,1,1,2,0,'0000-00-00 00:00:00',0,2,'',0,'{\"url\":\"\\/joomla-torneos\\/external\\/equipos.php\",\"scrolling\":\"auto\",\"width\":\"100%\",\"height\":\"500\",\"height_auto\":\"0\",\"add_scheme\":\"1\",\"frameborder\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',25,26,0,'*',0);
INSERT INTO `imacj_menu` VALUES (111,'top','Ayuda','inicio','','inicio','index.php?option=com_wrapper&view=wrapper','component',1,1,1,2,0,'0000-00-00 00:00:00',0,2,'',0,'{\"url\":\"\\/joomla-torneos\\/external\\/ayuda\\/ayuda_home.html\",\"scrolling\":\"auto\",\"width\":\"100%\",\"height\":\"500\",\"height_auto\":\"0\",\"add_scheme\":\"1\",\"frameborder\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',21,22,0,'*',0);
INSERT INTO `imacj_menu` VALUES (113,'opciones','Perfil','gestion','','gestion','index.php?Itemid=','alias',1,1,1,0,0,'0000-00-00 00:00:00',0,2,'',0,'{\"aliasoptions\":\"105\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',15,16,0,'*',0);
INSERT INTO `imacj_menu` VALUES (114,'opciones','Nuevo Torneo','2015-10-05-18-13-51','','2015-10-05-18-13-51','index.php?Itemid=','alias',1,1,1,0,398,'2015-11-02 04:04:53',0,2,'',0,'{\"aliasoptions\":\"111\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',13,14,0,'*',0);
INSERT INTO `imacj_menu` VALUES (115,'menutorneo','Definición de Torneo','definir-tor','','definir-tor','index.php?option=com_wrapper&view=wrapper','component',1,1,1,2,0,'0000-00-00 00:00:00',0,2,'',0,'{\"url\":\"\\/joomla-torneos\\/external\\/definir_torneo.php\",\"scrolling\":\"auto\",\"width\":\"100%\",\"height\":\"500\",\"height_auto\":\"0\",\"add_scheme\":\"1\",\"frameborder\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',23,24,0,'*',0);
INSERT INTO `imacj_menu` VALUES (116,'opciones','Salir','2015-10-15-17-12-50','','2015-10-15-17-12-50','index.php?Itemid=','alias',1,1,1,0,0,'0000-00-00 00:00:00',0,2,'',0,'{\"aliasoptions\":\"109\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',19,20,0,'*',0);
INSERT INTO `imacj_menu` VALUES (117,'opciones','Inicio','2015-10-15-17-14-15','','2015-10-15-17-14-15','index.php?Itemid=','alias',1,1,1,0,398,'2015-11-02 04:04:41',0,2,'',0,'{\"aliasoptions\":\"101\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',11,12,0,'*',0);
INSERT INTO `imacj_menu` VALUES (118,'top','Vista Torneos','2015-10-15-17-38-32','','2015-10-15-17-38-32','index.php?Itemid=','alias',1,1,1,0,0,'0000-00-00 00:00:00',0,2,'',0,'{\"aliasoptions\":\"106\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',33,34,0,'*',0);
INSERT INTO `imacj_menu` VALUES (119,'menutorneo','Clasificación','clasificacion','','clasificacion','index.php?option=com_wrapper&view=wrapper','component',1,1,1,2,0,'0000-00-00 00:00:00',0,2,'',0,'{\"url\":\"\\/joomla-torneos\\/external\\/clasificacion.php\",\"scrolling\":\"auto\",\"width\":\"100%\",\"height\":\"500\",\"height_auto\":\"0\",\"add_scheme\":\"1\",\"frameborder\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',27,28,0,'*',0);
INSERT INTO `imacj_menu` VALUES (120,'menutorneo','Calendario','calendario','','calendario','index.php?option=com_wrapper&view=wrapper','component',1,1,1,2,0,'0000-00-00 00:00:00',0,2,'',0,'{\"url\":\"\\/joomla-torneos\\/external\\/calendario.php\",\"scrolling\":\"auto\",\"width\":\"100%\",\"height\":\"500\",\"height_auto\":\"0\",\"add_scheme\":\"1\",\"frameborder\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',29,30,0,'*',0);
INSERT INTO `imacj_menu` VALUES (121,'perfil','Torneos Públicos','torneos-publicos','','torneos-publicos','index.php?option=com_wrapper&view=wrapper','component',1,1,1,2,398,'2015-10-26 05:20:56',0,2,'',0,'{\"url\":\"\\/joomla-torneos\\/external\\/lista_torneos_publicos.php\",\"scrolling\":\"auto\",\"width\":\"100%\",\"height\":\"500\",\"height_auto\":\"0\",\"add_scheme\":\"1\",\"frameborder\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',41,42,0,'*',0);
INSERT INTO `imacj_menu` VALUES (122,'menutorneo','Estadísticas','estadisticas','','estadisticas','index.php?option=com_wrapper&view=wrapper','component',0,1,1,2,0,'0000-00-00 00:00:00',0,2,'',0,'{\"url\":\"\\/joomla-torneos\\/external\\/estadisticas.php\",\"scrolling\":\"auto\",\"width\":\"100%\",\"height\":\"500\",\"height_auto\":\"0\",\"add_scheme\":\"1\",\"frameborder\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',31,32,0,'*',0);
INSERT INTO `imacj_menu` VALUES (123,'navprincipal','prueba','prueba','','prueba','index.php?option=com_wrapper&view=wrapper','component',-2,1,1,2,0,'0000-00-00 00:00:00',0,1,'',0,'{\"url\":\"\\/joomla-torneos\\/external\\/prueba.php\",\"scrolling\":\"auto\",\"width\":\"100%\",\"height\":\"500\",\"height_auto\":\"0\",\"add_scheme\":\"1\",\"frameborder\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',81,82,0,'*',0);
INSERT INTO `imacj_menu` VALUES (124,'opciones','CREAR NOTICIA','crear-noticia','','crear-noticia','index.php?option=com_content&view=form&layout=edit','component',0,1,1,22,0,'0000-00-00 00:00:00',0,2,'',0,'{\"enable_category\":\"1\",\"catid\":\"2\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',17,18,0,'*',0);
INSERT INTO `imacj_menu` VALUES (125,'navprincipal','HOME','2015-10-25-23-48-06','','2015-10-25-23-48-06','index.php?Itemid=','alias',0,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"101\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',83,84,0,'*',0);
INSERT INTO `imacj_menu` VALUES (126,'navprincipal','OPCIONES','2015-10-25-23-52-58','','2015-10-25-23-52-58','#','url',0,1,1,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',85,86,0,'*',0);
INSERT INTO `imacj_menu` VALUES (127,'ayuda','Menu Ayuda','menu-ayuda','','menu-ayuda','index.php?option=com_wrapper&view=wrapper','component',1,1,1,2,0,'0000-00-00 00:00:00',0,2,'',0,'{\"url\":\"\\/joomla-torneos\\/external\\/ayuda\\/menu_ayuda.html\",\"scrolling\":\"auto\",\"width\":\"100%\",\"height\":\"500\",\"height_auto\":\"0\",\"add_scheme\":\"1\",\"frameborder\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',91,92,0,'*',0);
/*!40000 ALTER TABLE `imacj_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_menu_types`
--

DROP TABLE IF EXISTS `imacj_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_menu_types`
--

LOCK TABLES `imacj_menu_types` WRITE;
/*!40000 ALTER TABLE `imacj_menu_types` DISABLE KEYS */;
INSERT INTO `imacj_menu_types` VALUES (1,'mainmenu','Main Menu','The main menu for the site');
INSERT INTO `imacj_menu_types` VALUES (2,'menutorneo','Menú Torneo','');
INSERT INTO `imacj_menu_types` VALUES (3,'navprincipal','Navegación Principal','');
INSERT INTO `imacj_menu_types` VALUES (4,'perfil','Perfil','');
INSERT INTO `imacj_menu_types` VALUES (6,'opciones','Opciones de Gestión','');
INSERT INTO `imacj_menu_types` VALUES (7,'top','Top','');
INSERT INTO `imacj_menu_types` VALUES (8,'ayuda','Ayuda','');
/*!40000 ALTER TABLE `imacj_menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_messages`
--

DROP TABLE IF EXISTS `imacj_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_messages`
--

LOCK TABLES `imacj_messages` WRITE;
/*!40000 ALTER TABLE `imacj_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_messages_cfg`
--

DROP TABLE IF EXISTS `imacj_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_messages_cfg`
--

LOCK TABLES `imacj_messages_cfg` WRITE;
/*!40000 ALTER TABLE `imacj_messages_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_messages_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_modules`
--

DROP TABLE IF EXISTS `imacj_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_modules`
--

LOCK TABLES `imacj_modules` WRITE;
/*!40000 ALTER TABLE `imacj_modules` DISABLE KEYS */;
INSERT INTO `imacj_modules` VALUES (1,39,'Main Menu','','',1,'position-1',398,'2015-10-26 00:18:28','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,1,'{\"menutype\":\"mainmenu\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\" nav-pills\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (2,40,'Login','','',1,'login',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'',1,'*');
INSERT INTO `imacj_modules` VALUES (3,41,'Popular Articles','','',3,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_popular',3,1,'{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*');
INSERT INTO `imacj_modules` VALUES (4,42,'Recently Added Articles','','',4,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_latest',3,1,'{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*');
INSERT INTO `imacj_modules` VALUES (8,43,'Toolbar','','',1,'toolbar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_toolbar',3,1,'',1,'*');
INSERT INTO `imacj_modules` VALUES (9,44,'Quick Icons','','',1,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_quickicon',3,1,'',1,'*');
INSERT INTO `imacj_modules` VALUES (10,45,'Logged-in Users','','',2,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_logged',3,1,'{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*');
INSERT INTO `imacj_modules` VALUES (12,46,'Admin Menu','','',1,'menu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',3,1,'{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}',1,'*');
INSERT INTO `imacj_modules` VALUES (13,47,'Admin Submenu','','',1,'submenu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_submenu',3,1,'',1,'*');
INSERT INTO `imacj_modules` VALUES (14,48,'User Status','','',2,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_status',3,1,'',1,'*');
INSERT INTO `imacj_modules` VALUES (15,49,'Title','','',1,'title',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_title',3,1,'',1,'*');
INSERT INTO `imacj_modules` VALUES (16,50,'Login Form','','',7,'position-7',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_login',1,1,'{\"greeting\":\"1\",\"name\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (17,51,'Breadcrumbs','','',1,'position-2',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_breadcrumbs',1,1,'{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (79,52,'Multilanguage status','','',1,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_multilangstatus',3,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*');
INSERT INTO `imacj_modules` VALUES (86,53,'Joomla Version','','',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_version',3,1,'{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*');
INSERT INTO `imacj_modules` VALUES (87,55,'Configuración del Torneo','','',1,'position-3',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',2,1,'{\"menutype\":\"menutorneo\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\" nav-tabs\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (88,56,'Navegación Principal','','',1,'position-0',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',5,1,'{\"menutype\":\"navprincipal\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\" nav-pills\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (89,57,'Perfil de Usuario','','',1,'position-1',398,'2015-10-26 00:18:31','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',2,1,'{\"menutype\":\"perfil\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\" nav-tabs\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (91,62,'Opciones de Gestión','','',1,'position-0',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',2,1,'{\"menutype\":\"opciones\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\" nav-pills\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (92,65,'FavSlider Responsive Slideshow','','',1,'banner',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_favslider',1,0,'{\"sliderType\":\"basic\",\"jqueryLoad\":\"1\",\"animationEffect\":\"slide\",\"slideHeight\":\"350\",\"thumbHeight\":\"\",\"linkTarget\":\"self\",\"arrowNav\":\"1\",\"arrowNavStyle\":\"dark-arrows\",\"controlNav\":\"1\",\"slideshow\":\"1\",\"randomize\":\"1\",\"animationLoop\":\"1\",\"pauseOnHover\":\"1\",\"keyboardNav\":\"1\",\"mousewheel\":\"0\",\"slideshowSpeed\":\"5000\",\"captionHide\":\"visible\",\"layoutEffect\":\"layout-effect1\",\"captionTextAlign\":\"favalign-left\",\"captionStyle\":\"favstyle-default\",\"captionBgStyle\":\"favstyle-bg-dark\",\"captionWidth\":\"\",\"captionHeight\":\"\",\"captionTitleGoogleFont\":\"Open Sans\",\"captionTitleFontSize\":\"\",\"captionTitleTextTransform\":\"uppercase\",\"captionTitlePadding\":\"\",\"captionTitleMargin\":\"\",\"captionDescriptionGoogleFont\":\"Open Sans\",\"captionDescriptionFontSize\":\"\",\"captionReadMoreColor\":\"\",\"captionReadMoreBgColor\":\"\",\"captionReadMoreGoogleFont\":\"Open Sans\",\"captionReadMorePadding\":\"\",\"captionReadMoreMargin\":\"\",\"file1active\":\"1\",\"file1type\":\"image\",\"file1\":\"media\\/favslider\\/demo\\/01.jpg\",\"file1alt\":\"\",\"file1link\":\"\",\"file1favtitle\":\"\",\"file1favdescription\":\"\",\"file1favreadmore\":\"\",\"file2active\":\"1\",\"file2type\":\"image\",\"file2\":\"media\\/favslider\\/demo\\/02.jpg\",\"file2alt\":\"\",\"file2link\":\"\",\"file2favtitle\":\"\",\"file2favdescription\":\"\",\"file2favreadmore\":\"\",\"file3active\":\"1\",\"file3type\":\"image\",\"file3\":\"media\\/favslider\\/demo\\/03.jpg\",\"file3alt\":\"\",\"file3link\":\"\",\"file3favtitle\":\"\",\"file3favdescription\":\"\",\"file3favreadmore\":\"\",\"file4active\":\"1\",\"file4type\":\"image\",\"file4\":\"media\\/favslider\\/demo\\/04.jpg\",\"file4alt\":\"\",\"file4link\":\"\",\"file4favtitle\":\"\",\"file4favdescription\":\"\",\"file4favreadmore\":\"\",\"file5active\":\"1\",\"file5type\":\"image\",\"file5\":\"media\\/favslider\\/demo\\/05.jpg\",\"file5alt\":\"\",\"file5link\":\"\",\"file5favtitle\":\"\",\"file5favdescription\":\"\",\"file5favreadmore\":\"\",\"file6active\":\"0\",\"file6type\":\"image\",\"file6\":\"\",\"file6alt\":\"\",\"file6link\":\"\",\"file6favtitle\":\"\",\"file6favdescription\":\"\",\"file6favreadmore\":\"\",\"file7active\":\"0\",\"file7type\":\"image\",\"file7\":\"\",\"file7alt\":\"\",\"file7link\":\"\",\"file7favtitle\":\"\",\"file7favdescription\":\"\",\"file7favreadmore\":\"\",\"file8active\":\"0\",\"file8type\":\"image\",\"file8\":\"\",\"file8alt\":\"\",\"file8link\":\"\",\"file8favtitle\":\"\",\"file8favdescription\":\"\",\"file8favreadmore\":\"\",\"file9active\":\"0\",\"file9type\":\"image\",\"file9\":\"\",\"file9alt\":\"\",\"file9link\":\"\",\"file9favtitle\":\"\",\"file9favdescription\":\"\",\"file9favreadmore\":\"\",\"file10active\":\"0\",\"file10type\":\"image\",\"file10\":\"\",\"file10alt\":\"\",\"file10link\":\"\",\"file10favtitle\":\"\",\"file10favdescription\":\"\",\"file10favreadmore\":\"\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (93,66,'Banner','','',1,'position-0',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_random_image',1,0,'{\"type\":\"jpg\",\"folder\":\"\\/external\\/img\\/banner\",\"link\":\"\",\"width\":\"600\",\"height\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (94,67,'FavSlider Responsive Slideshow (2)','','',1,'banner',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_favslider',1,0,'{\"sliderType\":\"carousel\",\"jqueryLoad\":\"1\",\"animationEffect\":\"slide\",\"slideHeight\":\"80\",\"thumbHeight\":\"\",\"linkTarget\":\"self\",\"arrowNav\":\"1\",\"arrowNavStyle\":\"dark-arrows\",\"controlNav\":\"0\",\"slideshow\":\"1\",\"randomize\":\"1\",\"animationLoop\":\"1\",\"pauseOnHover\":\"1\",\"keyboardNav\":\"1\",\"mousewheel\":\"0\",\"slideshowSpeed\":\"4000\",\"captionHide\":\"visible\",\"layoutEffect\":\"layout-effect1\",\"captionTextAlign\":\"favalign-left\",\"captionStyle\":\"favstyle-default\",\"captionBgStyle\":\"favstyle-bg-dark\",\"captionWidth\":\"\",\"captionHeight\":\"\",\"captionTitleGoogleFont\":\"Open Sans\",\"captionTitleFontSize\":\"\",\"captionTitleTextTransform\":\"uppercase\",\"captionTitlePadding\":\"\",\"captionTitleMargin\":\"\",\"captionDescriptionGoogleFont\":\"Open Sans\",\"captionDescriptionFontSize\":\"\",\"captionReadMoreColor\":\"\",\"captionReadMoreBgColor\":\"\",\"captionReadMoreGoogleFont\":\"Open Sans\",\"captionReadMorePadding\":\"\",\"captionReadMoreMargin\":\"\",\"file1active\":\"1\",\"file1type\":\"image\",\"file1\":\"media\\/favslider\\/demo\\/08.jpg\",\"file1alt\":\"\",\"file1link\":\"\",\"file1favtitle\":\"\",\"file1favdescription\":\"\",\"file1favreadmore\":\"\",\"file2active\":\"1\",\"file2type\":\"image\",\"file2\":\"media\\/favslider\\/demo\\/07.jpg\",\"file2alt\":\"\",\"file2link\":\"\",\"file2favtitle\":\"\",\"file2favdescription\":\"\",\"file2favreadmore\":\"\",\"file3active\":\"1\",\"file3type\":\"image\",\"file3\":\"media\\/favslider\\/demo\\/06.jpg\",\"file3alt\":\"\",\"file3link\":\"\",\"file3favtitle\":\"\",\"file3favdescription\":\"\",\"file3favreadmore\":\"\",\"file4active\":\"1\",\"file4type\":\"image\",\"file4\":\"media\\/favslider\\/demo\\/09.jpg\",\"file4alt\":\"\",\"file4link\":\"\",\"file4favtitle\":\"\",\"file4favdescription\":\"\",\"file4favreadmore\":\"\",\"file5active\":\"1\",\"file5type\":\"image\",\"file5\":\"media\\/favslider\\/demo\\/10.jpg\",\"file5alt\":\"\",\"file5link\":\"\",\"file5favtitle\":\"\",\"file5favdescription\":\"\",\"file5favreadmore\":\"\",\"file6active\":\"0\",\"file6type\":\"image\",\"file6\":\"\",\"file6alt\":\"\",\"file6link\":\"\",\"file6favtitle\":\"\",\"file6favdescription\":\"\",\"file6favreadmore\":\"\",\"file7active\":\"0\",\"file7type\":\"image\",\"file7\":\"\",\"file7alt\":\"\",\"file7link\":\"\",\"file7favtitle\":\"\",\"file7favdescription\":\"\",\"file7favreadmore\":\"\",\"file8active\":\"0\",\"file8type\":\"image\",\"file8\":\"\",\"file8alt\":\"\",\"file8link\":\"\",\"file8favtitle\":\"\",\"file8favdescription\":\"\",\"file8favreadmore\":\"\",\"file9active\":\"0\",\"file9type\":\"image\",\"file9\":\"\",\"file9alt\":\"\",\"file9link\":\"\",\"file9favtitle\":\"\",\"file9favdescription\":\"\",\"file9favreadmore\":\"\",\"file10active\":\"0\",\"file10type\":\"image\",\"file10\":\"\",\"file10alt\":\"\",\"file10link\":\"\",\"file10favtitle\":\"\",\"file10favdescription\":\"\",\"file10favreadmore\":\"\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (95,68,'buscar','','',1,'position-8',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_search',1,1,'{\"label\":\"\",\"width\":\"\",\"text\":\"\",\"button\":\"0\",\"button_pos\":\"left\",\"imagebutton\":\"0\",\"button_text\":\"\",\"opensearch\":\"1\",\"opensearch_title\":\"\",\"set_itemid\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (96,69,'Top','','',1,'position-0',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,0,'{\"menutype\":\"top\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\" nav-pills\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (97,72,'EMPRESA','','',1,'position-3',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_articles_category',1,0,'{\"mode\":\"normal\",\"show_on_article_page\":\"1\",\"count\":\"0\",\"show_front\":\"hide\",\"category_filtering_type\":\"1\",\"catid\":[\"9\"],\"show_child_category_articles\":\"0\",\"levels\":\"1\",\"author_filtering_type\":\"1\",\"created_by\":[\"\"],\"author_alias_filtering_type\":\"1\",\"created_by_alias\":[\"\"],\"excluded_articles\":\"\",\"date_filtering\":\"off\",\"date_field\":\"a.created\",\"start_date_range\":\"\",\"end_date_range\":\"\",\"relative_date\":\"30\",\"article_ordering\":\"a.title\",\"article_ordering_direction\":\"ASC\",\"article_grouping\":\"none\",\"article_grouping_direction\":\"ksort\",\"month_year_format\":\"F Y\",\"link_titles\":\"1\",\"show_date\":\"0\",\"show_date_field\":\"created\",\"show_date_format\":\"Y-m-d H:i:s\",\"show_category\":\"0\",\"show_hits\":\"0\",\"show_author\":\"0\",\"show_introtext\":\"0\",\"introtext_limit\":\"100\",\"show_readmore\":\"0\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"15\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (98,73,'Menu Ayuda','','',0,'position-8',398,'2015-11-06 00:16:59','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_menu',2,1,'{\"menutype\":\"ayuda\",\"base\":\"127\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
INSERT INTO `imacj_modules` VALUES (99,74,'Menu Ayuda','','<div class=\"col-md-3\">\r\n<ul class=\"nav nav-pills nav-stacked\">\r\n<li class=\"active\"><a href=\"external/ayuda/ayuda_home.html\" target=\"iframe\">AYUDA</a></li>\r\n<li><a href=\"external/ayuda/ayuda_definir_torneo.html\" target=\"iframe\">Definir Torneo</a></li>\r\n<li class=\"dropdown\"><a class=\"dropdown-toggle\" href=\"#\" data-toggle=\"dropdown\">Participantes </a>\r\n<ul class=\"dropdown-menu\">\r\n<li><a href=\"external/ayuda/ayuda_equipos.html\" target=\"iframe\">Equipos</a></li>\r\n<li><a href=\"external/ayuda/ayuda_jugadores.html\" target=\"iframe\">Jugadores</a></li>\r\n</ul>\r\n</li>\r\n<li><a href=\"external/ayuda/ayuda_clasificacion.html\" target=\"iframe\">Clasificación</a></li>\r\n<li><a href=\"external/ayuda/ayuda_calendario.html\" target=\"iframe\">Calendario</a></li>\r\n</ul>\r\n</div>',1,'position-7',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',2,0,'{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
/*!40000 ALTER TABLE `imacj_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_modules_menu`
--

DROP TABLE IF EXISTS `imacj_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_modules_menu`
--

LOCK TABLES `imacj_modules_menu` WRITE;
/*!40000 ALTER TABLE `imacj_modules_menu` DISABLE KEYS */;
INSERT INTO `imacj_modules_menu` VALUES (1,101);
INSERT INTO `imacj_modules_menu` VALUES (2,0);
INSERT INTO `imacj_modules_menu` VALUES (3,0);
INSERT INTO `imacj_modules_menu` VALUES (4,0);
INSERT INTO `imacj_modules_menu` VALUES (6,0);
INSERT INTO `imacj_modules_menu` VALUES (7,0);
INSERT INTO `imacj_modules_menu` VALUES (8,0);
INSERT INTO `imacj_modules_menu` VALUES (9,0);
INSERT INTO `imacj_modules_menu` VALUES (10,0);
INSERT INTO `imacj_modules_menu` VALUES (12,0);
INSERT INTO `imacj_modules_menu` VALUES (13,0);
INSERT INTO `imacj_modules_menu` VALUES (14,0);
INSERT INTO `imacj_modules_menu` VALUES (15,0);
INSERT INTO `imacj_modules_menu` VALUES (16,0);
INSERT INTO `imacj_modules_menu` VALUES (17,0);
INSERT INTO `imacj_modules_menu` VALUES (79,0);
INSERT INTO `imacj_modules_menu` VALUES (86,0);
INSERT INTO `imacj_modules_menu` VALUES (87,110);
INSERT INTO `imacj_modules_menu` VALUES (87,111);
INSERT INTO `imacj_modules_menu` VALUES (87,115);
INSERT INTO `imacj_modules_menu` VALUES (87,119);
INSERT INTO `imacj_modules_menu` VALUES (87,120);
INSERT INTO `imacj_modules_menu` VALUES (87,122);
INSERT INTO `imacj_modules_menu` VALUES (88,101);
INSERT INTO `imacj_modules_menu` VALUES (88,103);
INSERT INTO `imacj_modules_menu` VALUES (88,104);
INSERT INTO `imacj_modules_menu` VALUES (89,101);
INSERT INTO `imacj_modules_menu` VALUES (89,105);
INSERT INTO `imacj_modules_menu` VALUES (89,121);
INSERT INTO `imacj_modules_menu` VALUES (90,112);
INSERT INTO `imacj_modules_menu` VALUES (91,106);
INSERT INTO `imacj_modules_menu` VALUES (91,124);
INSERT INTO `imacj_modules_menu` VALUES (92,101);
INSERT INTO `imacj_modules_menu` VALUES (93,0);
INSERT INTO `imacj_modules_menu` VALUES (94,103);
INSERT INTO `imacj_modules_menu` VALUES (94,104);
INSERT INTO `imacj_modules_menu` VALUES (94,105);
INSERT INTO `imacj_modules_menu` VALUES (94,106);
INSERT INTO `imacj_modules_menu` VALUES (94,108);
INSERT INTO `imacj_modules_menu` VALUES (94,109);
INSERT INTO `imacj_modules_menu` VALUES (94,110);
INSERT INTO `imacj_modules_menu` VALUES (94,111);
INSERT INTO `imacj_modules_menu` VALUES (94,113);
INSERT INTO `imacj_modules_menu` VALUES (94,114);
INSERT INTO `imacj_modules_menu` VALUES (94,115);
INSERT INTO `imacj_modules_menu` VALUES (94,116);
INSERT INTO `imacj_modules_menu` VALUES (94,117);
INSERT INTO `imacj_modules_menu` VALUES (94,118);
INSERT INTO `imacj_modules_menu` VALUES (94,119);
INSERT INTO `imacj_modules_menu` VALUES (94,120);
INSERT INTO `imacj_modules_menu` VALUES (94,121);
INSERT INTO `imacj_modules_menu` VALUES (94,122);
INSERT INTO `imacj_modules_menu` VALUES (94,124);
INSERT INTO `imacj_modules_menu` VALUES (95,103);
INSERT INTO `imacj_modules_menu` VALUES (95,104);
INSERT INTO `imacj_modules_menu` VALUES (95,105);
INSERT INTO `imacj_modules_menu` VALUES (95,106);
INSERT INTO `imacj_modules_menu` VALUES (95,108);
INSERT INTO `imacj_modules_menu` VALUES (95,109);
INSERT INTO `imacj_modules_menu` VALUES (95,110);
INSERT INTO `imacj_modules_menu` VALUES (95,111);
INSERT INTO `imacj_modules_menu` VALUES (95,113);
INSERT INTO `imacj_modules_menu` VALUES (95,114);
INSERT INTO `imacj_modules_menu` VALUES (95,115);
INSERT INTO `imacj_modules_menu` VALUES (95,116);
INSERT INTO `imacj_modules_menu` VALUES (95,117);
INSERT INTO `imacj_modules_menu` VALUES (95,118);
INSERT INTO `imacj_modules_menu` VALUES (95,119);
INSERT INTO `imacj_modules_menu` VALUES (95,120);
INSERT INTO `imacj_modules_menu` VALUES (95,121);
INSERT INTO `imacj_modules_menu` VALUES (95,122);
INSERT INTO `imacj_modules_menu` VALUES (95,124);
INSERT INTO `imacj_modules_menu` VALUES (96,105);
INSERT INTO `imacj_modules_menu` VALUES (96,109);
INSERT INTO `imacj_modules_menu` VALUES (96,110);
INSERT INTO `imacj_modules_menu` VALUES (96,111);
INSERT INTO `imacj_modules_menu` VALUES (96,115);
INSERT INTO `imacj_modules_menu` VALUES (96,118);
INSERT INTO `imacj_modules_menu` VALUES (96,119);
INSERT INTO `imacj_modules_menu` VALUES (96,120);
INSERT INTO `imacj_modules_menu` VALUES (96,121);
INSERT INTO `imacj_modules_menu` VALUES (96,122);
INSERT INTO `imacj_modules_menu` VALUES (97,101);
INSERT INTO `imacj_modules_menu` VALUES (98,111);
INSERT INTO `imacj_modules_menu` VALUES (99,111);
/*!40000 ALTER TABLE `imacj_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_newsfeeds`
--

DROP TABLE IF EXISTS `imacj_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_newsfeeds`
--

LOCK TABLES `imacj_newsfeeds` WRITE;
/*!40000 ALTER TABLE `imacj_newsfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_newsfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_overrider`
--

DROP TABLE IF EXISTS `imacj_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_overrider`
--

LOCK TABLES `imacj_overrider` WRITE;
/*!40000 ALTER TABLE `imacj_overrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_overrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_postinstall_messages`
--

DROP TABLE IF EXISTS `imacj_postinstall_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_postinstall_messages`
--

LOCK TABLES `imacj_postinstall_messages` WRITE;
/*!40000 ALTER TABLE `imacj_postinstall_messages` DISABLE KEYS */;
INSERT INTO `imacj_postinstall_messages` VALUES (1,700,'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE','PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY','PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION','plg_twofactorauth_totp',1,'action','site://plugins/twofactorauth/totp/postinstall/actions.php','twofactorauth_postinstall_action','site://plugins/twofactorauth/totp/postinstall/actions.php','twofactorauth_postinstall_condition','3.2.0',1);
INSERT INTO `imacj_postinstall_messages` VALUES (2,700,'COM_CPANEL_WELCOME_BEGINNERS_TITLE','COM_CPANEL_WELCOME_BEGINNERS_MESSAGE','','com_cpanel',1,'message','','','','','3.2.0',1);
/*!40000 ALTER TABLE `imacj_postinstall_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_redirect_links`
--

DROP TABLE IF EXISTS `imacj_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) DEFAULT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_redirect_links`
--

LOCK TABLES `imacj_redirect_links` WRITE;
/*!40000 ALTER TABLE `imacj_redirect_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_redirect_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_schemas`
--

DROP TABLE IF EXISTS `imacj_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_schemas`
--

LOCK TABLES `imacj_schemas` WRITE;
/*!40000 ALTER TABLE `imacj_schemas` DISABLE KEYS */;
INSERT INTO `imacj_schemas` VALUES (700,'3.4.0-2015-02-26');
/*!40000 ALTER TABLE `imacj_schemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_session`
--

DROP TABLE IF EXISTS `imacj_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_session`
--

LOCK TABLES `imacj_session` WRITE;
/*!40000 ALTER TABLE `imacj_session` DISABLE KEYS */;
INSERT INTO `imacj_session` VALUES ('djua9fk8r433f549bp6gcjar03',0,0,'1446792008','__default|a:8:{s:15:\"session.counter\";i:484;s:19:\"session.timer.start\";i:1446766151;s:18:\"session.timer.last\";i:1446792008;s:17:\"session.timer.now\";i:1446792008;s:22:\"session.client.browser\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36\";s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":2:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":1:{s:5:\"users\";O:8:\"stdClass\":1:{s:5:\"login\";O:8:\"stdClass\":1:{s:4:\"form\";O:8:\"stdClass\":2:{s:4:\"data\";a:0:{}s:6:\"return\";s:16:\"index.php/perfil\";}}}}s:9:\"separator\";s:1:\".\";}s:4:\"user\";O:5:\"JUser\":28:{s:9:\"\\0\\0\\0isRoot\";b:0;s:2:\"id\";s:3:\"410\";s:4:\"name\";s:19:\"prueba con apellido\";s:8:\"username\";s:6:\"prueba\";s:5:\"email\";s:18:\"doolpoes@gmail.com\";s:8:\"password\";s:60:\"$2y$10$wTnX3o96OFOJxxvUR2eN6uWS9qm6XBhr1EIT0QOmW66PHIzgWr.Nq\";s:14:\"password_clear\";s:0:\"\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"0\";s:12:\"registerDate\";s:19:\"2015-09-24 20:40:53\";s:13:\"lastvisitDate\";s:19:\"2015-11-05 19:24:54\";s:10:\"activation\";s:0:\"\";s:6:\"params\";s:92:\"{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}\";s:6:\"groups\";a:2:{i:2;s:1:\"2\";i:6;s:1:\"6\";}s:5:\"guest\";i:0;s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:12:\"requireReset\";s:1:\"0\";s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":2:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":6:{s:11:\"admin_style\";s:0:\"\";s:14:\"admin_language\";s:0:\"\";s:8:\"language\";s:0:\"\";s:6:\"editor\";s:0:\"\";s:8:\"helpsite\";s:0:\"\";s:8:\"timezone\";s:0:\"\";}s:9:\"separator\";s:1:\".\";}s:14:\"\\0\\0\\0_authGroups\";a:3:{i:0;i:1;i:1;i:2;i:3;i:6;}s:14:\"\\0\\0\\0_authLevels\";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:13:\"\\0\\0\\0userHelper\";O:18:\"JUserWrapperHelper\":0:{}s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;s:6:\"otpKey\";s:0:\"\";s:4:\"otep\";s:0:\"\";}s:13:\"session.token\";s:32:\"18d5a2a8594f3987021acfd5a604f002\";}id_tab|s:1:\"2\";suf_equipos|i:0;id_torneo|s:1:\"1\";correcto|i:1;',410,'prueba');
/*!40000 ALTER TABLE `imacj_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_tags`
--

DROP TABLE IF EXISTS `imacj_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_tags`
--

LOCK TABLES `imacj_tags` WRITE;
/*!40000 ALTER TABLE `imacj_tags` DISABLE KEYS */;
INSERT INTO `imacj_tags` VALUES (1,0,0,1,0,'','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'','','','',0,'2011-01-01 00:00:01','',0,'0000-00-00 00:00:00','','',0,'*',1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `imacj_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_template_styles`
--

DROP TABLE IF EXISTS `imacj_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_template_styles`
--

LOCK TABLES `imacj_template_styles` WRITE;
/*!40000 ALTER TABLE `imacj_template_styles` DISABLE KEYS */;
INSERT INTO `imacj_template_styles` VALUES (4,'beez3',0,'0','Beez3 - Default','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.png\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}');
INSERT INTO `imacj_template_styles` VALUES (5,'hathor',1,'0','Hathor - Default','{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}');
INSERT INTO `imacj_template_styles` VALUES (7,'protostar',0,'0','protostar - Default','{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}');
INSERT INTO `imacj_template_styles` VALUES (8,'isis',1,'1','isis - Default','{\"templateColor\":\"\",\"logoFile\":\"\"}');
INSERT INTO `imacj_template_styles` VALUES (9,'torneos_j',0,'1','torneos_j - Default','{\"templateColor\":\"#337ab7\",\"templateBackgroundColor\":\"#b8c6ff\",\"logoFile\":\"\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}');
/*!40000 ALTER TABLE `imacj_template_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_ucm_base`
--

DROP TABLE IF EXISTS `imacj_ucm_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_ucm_base`
--

LOCK TABLES `imacj_ucm_base` WRITE;
/*!40000 ALTER TABLE `imacj_ucm_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_ucm_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_ucm_content`
--

DROP TABLE IF EXISTS `imacj_ucm_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_ucm_content`
--

LOCK TABLES `imacj_ucm_content` WRITE;
/*!40000 ALTER TABLE `imacj_ucm_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_ucm_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_ucm_history`
--

DROP TABLE IF EXISTS `imacj_ucm_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_ucm_history`
--

LOCK TABLES `imacj_ucm_history` WRITE;
/*!40000 ALTER TABLE `imacj_ucm_history` DISABLE KEYS */;
INSERT INTO `imacj_ucm_history` VALUES (1,8,5,'','2015-09-24 18:28:09',398,584,'41f7fe857d7f0516455358d7b088f0746bd33f64','{\"id\":8,\"asset_id\":54,\"parent_id\":\"1\",\"lft\":\"11\",\"rgt\":12,\"level\":1,\"path\":null,\"extension\":\"com_content\",\"title\":\"Configuraci\\u00f3n Torneos\",\"alias\":\"configuracion-torneos\",\"note\":\"\",\"description\":\"\",\"published\":\"1\",\"checked_out\":null,\"checked_out_time\":null,\"access\":\"1\",\"params\":\"{\\\"category_layout\\\":\\\"\\\",\\\"image\\\":\\\"\\\",\\\"image_alt\\\":\\\"\\\"}\",\"metadesc\":\"\",\"metakey\":\"\",\"metadata\":\"{\\\"author\\\":\\\"\\\",\\\"robots\\\":\\\"\\\"}\",\"created_user_id\":\"398\",\"created_time\":\"2015-09-24 18:28:09\",\"modified_user_id\":null,\"modified_time\":\"2015-09-24 18:28:09\",\"hits\":\"0\",\"language\":\"*\",\"version\":null}',0);
INSERT INTO `imacj_ucm_history` VALUES (2,1,1,'','2015-10-05 16:54:44',398,1860,'1c770f7d805a2b513abe148ca3757c246b744201','{\"id\":1,\"asset_id\":59,\"title\":\"C\\u00f3mo administrar tus torneos.\",\"alias\":\"como-administrar-tus-torneos\",\"introtext\":\"<p>Hola, Te damos la bienvenida al panel de administraci\\u00f3n de torneos, donde podr\\u00e1s gestionar completamente el desarrollo de cada uno de ellos.<\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 16:54:44\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-05 16:54:44\",\"modified_by\":null,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2015-10-05 16:54:44\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":1,\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":null,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (3,2,1,'','2015-10-05 17:34:27',398,1664,'c48223fe6c079e03b662569aabb2acdf57c912ac','{\"id\":2,\"asset_id\":61,\"title\":\"Vista Previa\",\"alias\":\"vista-previa\",\"introtext\":\"\",\"fulltext\":\"\",\"state\":1,\"catid\":\"2\",\"created\":\"2015-10-05 17:34:27\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-05 17:34:27\",\"modified_by\":null,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2015-10-05 17:34:27\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":1,\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":null,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (4,2,1,'','2015-10-05 17:50:37',398,1773,'ec95f3e3808e16671d1bf805d67c9fe598ed2e55','{\"id\":2,\"asset_id\":\"61\",\"title\":\"Vista Previa\",\"alias\":\"vista-previa\",\"introtext\":\"<p><iframe src=\\\"http:\\/\\/www.google.com\\\" width=\\\"100%\\\" height=\\\"500px\\\"><\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"2\",\"created\":\"2015-10-05 17:34:27\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-05 17:50:37\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-05 17:37:20\",\"publish_up\":\"2015-10-05 17:34:27\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":4,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"4\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (5,2,1,'','2015-10-05 17:51:32',398,1774,'5df7f402d192454b9eda0b0611ebe1fd20a0dc45','{\"id\":2,\"asset_id\":\"61\",\"title\":\"Vista Previa\",\"alias\":\"vista-previa\",\"introtext\":\"<p><iframe src=\\\"https:\\/\\/www.google.com\\\" width=\\\"100%\\\" height=\\\"500px\\\"><\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"2\",\"created\":\"2015-10-05 17:34:27\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-05 17:51:32\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-05 17:50:37\",\"publish_up\":\"2015-10-05 17:34:27\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":5,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"6\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (6,2,1,'','2015-10-05 17:53:02',398,1746,'211eaddf011abf052b5b2235c1263622ec420586','{\"id\":2,\"asset_id\":\"61\",\"title\":\"Vista Previa\",\"alias\":\"vista-previa\",\"introtext\":\"<p><iframe src=\\\"external\\/definir_torneo.php\\\"><\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"2\",\"created\":\"2015-10-05 17:34:27\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-05 17:53:02\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-05 17:51:32\",\"publish_up\":\"2015-10-05 17:34:27\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":6,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"7\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (7,2,1,'','2015-10-05 17:53:46',398,1778,'69aea059f8d00a5f280c00dfb2ace99b080ae4bb','{\"id\":2,\"asset_id\":\"61\",\"title\":\"Vista Previa\",\"alias\":\"vista-previa\",\"introtext\":\"<p><iframe src=\\\"external\\/definir_torneo.php\\\" width=\\\"100%\\\" height=\\\"500px\\\"><\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"2\",\"created\":\"2015-10-05 17:34:27\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-05 17:53:46\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-05 17:53:02\",\"publish_up\":\"2015-10-05 17:34:27\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":7,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"8\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (8,2,1,'','2015-10-05 17:55:27',398,1795,'901d121255c577926fb7339e2eda39cf11d3f703','{\"id\":2,\"asset_id\":\"61\",\"title\":\"Vista Previa\",\"alias\":\"vista-previa\",\"introtext\":\"<p><iframe src=\\\"external\\/vista_torneos.php\\\" width=\\\"100%\\\" height=\\\"500px\\\" frameborder=\\\"0\\\"><\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"2\",\"created\":\"2015-10-05 17:34:27\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-05 17:55:27\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-05 17:53:46\",\"publish_up\":\"2015-10-05 17:34:27\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":8,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"9\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (9,1,1,'','2015-10-05 18:14:35',398,1855,'b21240b71b023c470ed6879bf7857686dc7764ba','{\"id\":1,\"asset_id\":\"59\",\"title\":\"C\\u00f3mo administrar tus torneos.\",\"alias\":\"como-administrar-tus-torneos\",\"introtext\":\"<p>Hola, Te damos la bienvenida al panel de administraci\\u00f3n del torneo, donde podr\\u00e1s gestionar completamente tu torneo.<\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 16:54:44\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-05 18:14:35\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-05 18:14:11\",\"publish_up\":\"2015-10-05 16:54:44\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":2,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"10\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (10,3,1,'','2015-10-05 18:38:46',398,1769,'c5b801d0c2dca6467c5917386c15f1c0a33ebf94','{\"id\":3,\"asset_id\":63,\"title\":\"Configurar Torneo\",\"alias\":\"configurar-torneo\",\"introtext\":\"<p><iframe src=\\\"external\\/definir_torneo.php\\\" width=\\\"100%\\\" height=\\\"500px\\\"><\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 18:38:46\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-05 18:38:46\",\"modified_by\":null,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2015-10-05 18:38:46\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":1,\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":null,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (11,4,1,'','2015-10-05 18:39:39',398,1760,'40b355df3d2a512f8ca431ae33cd337e61b104e5','{\"id\":4,\"asset_id\":64,\"title\":\"Equipos\",\"alias\":\"equipos\",\"introtext\":\"<p><iframe src=\\\"external\\/equipos.php\\\" width=\\\"100%\\\" height=\\\"500px\\\" frameborder=\\\"0\\\"><\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 18:39:39\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-05 18:39:39\",\"modified_by\":null,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2015-10-05 18:39:39\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":1,\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":null,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (12,3,1,'','2015-10-05 18:39:57',398,1806,'e53b36f345c5290c5b3f9d63c2252178b773dc13','{\"id\":3,\"asset_id\":\"63\",\"title\":\"Configurar Torneo\",\"alias\":\"configurar-torneo\",\"introtext\":\"<p><iframe src=\\\"external\\/definir_torneo.php\\\" width=\\\"100%\\\" height=\\\"500px\\\" frameborder=\\\"0\\\"><\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 18:38:46\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-05 18:39:57\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-05 18:38:46\",\"publish_up\":\"2015-10-05 18:38:46\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":2,\"ordering\":\"1\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"0\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (13,1,1,'','2015-10-06 02:36:09',398,1873,'2417c89eda45e0a6b3484f900e5d59b03b9d51a5','{\"id\":1,\"asset_id\":\"59\",\"title\":\"C\\u00f3mo administrar tus torneos.\",\"alias\":\"como-administrar-tus-torneos\",\"introtext\":\"<p>Hola, Te damos la bienvenida al panel de administraci\\u00f3n del torneo, donde podr\\u00e1s gestionar completamente tu torneo.<\\/p>\\r\\n<p>\\u00a0<\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 16:54:44\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-06 02:36:09\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-06 02:35:53\",\"publish_up\":\"2015-10-05 16:54:44\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":3,\"ordering\":\"2\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"22\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (14,1,1,'','2015-10-06 02:42:17',398,2080,'e8eaf9ee93e807b74c15b98ac1c7504152e5caf0','{\"id\":1,\"asset_id\":\"59\",\"title\":\"C\\u00f3mo administrar tus torneos.\",\"alias\":\"como-administrar-tus-torneos\",\"introtext\":\"<p>{source}<span style=\\\"font-family: courier new, courier, monospace;\\\"><br \\/>&lt;p&gt;&lt;?php <br \\/> $id_torneo = $_GET[\'id_torneo\'];<br \\/> echo $id_torneo;<br \\/>?&gt;&lt;\\/p&gt;<br \\/><\\/span>{\\/source}Hola, Te damos la bienvenida al panel de administraci\\u00f3n del torneo, donde podr\\u00e1s gestionar completamente tu torneo.<\\/p>\\r\\n<p>\\u00a0<\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 16:54:44\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-06 02:42:17\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-06 02:40:47\",\"publish_up\":\"2015-10-05 16:54:44\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":4,\"ordering\":\"2\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"22\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (15,1,1,'','2015-10-06 02:43:27',398,2149,'f34fa5fd98578770a637a852c76914cd0ca2c31f','{\"id\":1,\"asset_id\":\"59\",\"title\":\"C\\u00f3mo administrar tus torneos.\",\"alias\":\"como-administrar-tus-torneos\",\"introtext\":\"<p>Hola, Te damos la bienvenida al panel de administraci\\u00f3n del torneo, donde podr\\u00e1s gestionar completamente tu torneo.<\\/p>\\r\\n<p>\\u00a0<span style=\\\"font-size: 12.16px; line-height: 1.3em;\\\">{source}<\\/span><\\/p>\\r\\n<p><span style=\\\"font-family: courier new, courier, monospace;\\\">&lt;p&gt;&lt;?php <br \\/> $id_torneo = $_GET[\'id_torneo\'];<br \\/> echo $id_torneo;<br \\/>?&gt;&lt;\\/p&gt;<br \\/><\\/span>{\\/source}<\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 16:54:44\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-06 02:43:27\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-06 02:42:17\",\"publish_up\":\"2015-10-05 16:54:44\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":5,\"ordering\":\"2\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"25\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (16,3,1,'','2015-10-06 20:11:39',398,1855,'3cb71255a14d7faacd927a41ecd15ebec93c199e','{\"id\":3,\"asset_id\":\"63\",\"title\":\"Configurar Torneo\",\"alias\":\"configurar-torneo\",\"introtext\":\"<p><iframe src=\\\"external\\/definir_torneo.php{source}\\r\\n\\r\\n&lt;?php\\\">\\r\\n{\\/source}\\\" width=\\\"100%\\\" height=\\\"500px\\\" frameborder=\\\"0\\\"&amp;gt;<\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 18:38:46\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-06 20:11:39\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-06 20:08:14\",\"publish_up\":\"2015-10-05 18:38:46\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":3,\"ordering\":\"1\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"39\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (17,3,1,'','2015-10-06 20:14:24',398,2051,'05bbe724b553a6a6d9b09ab797d2e570560b794e','{\"id\":3,\"asset_id\":\"63\",\"title\":\"Configurar Torneo\",\"alias\":\"configurar-torneo\",\"introtext\":\"<p>{source}<span style=\\\"font-family: courier new, courier, monospace;\\\"><br \\/>&lt;?php<br \\/>$id_torneo = $_GET[\'id_torneo\'];<br \\/><img src=\\\"media\\/sourcerer\\/images\\/tab.png\\\" alt=\\\"\\\" \\/>echo $id_torneo; <br \\/>?&gt;<br \\/><\\/span>{\\/source}<iframe src=\\\"external\\/definir_torneo.php\\\" width=\\\"100%\\\" height=\\\"500px\\\" frameborder=\\\"0\\\"><\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 18:38:46\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-06 20:14:24\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-06 20:12:30\",\"publish_up\":\"2015-10-05 18:38:46\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":5,\"ordering\":\"1\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"42\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (18,3,1,'','2015-10-06 20:55:36',398,2378,'6bb4e9faa938cff03df5ec7a5653824d358c2cac','{\"id\":3,\"asset_id\":\"63\",\"title\":\"Configurar Torneo\",\"alias\":\"configurar-torneo\",\"introtext\":\"<p>{source}<span style=\\\"font-family: courier new, courier, monospace;\\\"><br \\/>&lt;?php<br \\/>$id_torneo = $_GET[\'id_torneo\'];<br \\/>echo \\\"&lt;form name=\'ids\' action=\'..\\/external\\/definir_torneo.php\'&gt;<\\/span><\\/p>\\r\\n<p><span style=\\\"font-family: courier new, courier, monospace;\\\">&lt;input type=\\\"hidden\\\" name=\'id_tor\' value=\'.$id_torneo.\'&gt;<\\/span><\\/p>\\r\\n<p><span style=\\\"font-family: courier new, courier, monospace;\\\">&lt;\\/form&gt;<br \\/>\\\";<br \\/>?&gt;<br \\/><\\/span>{\\/source}<\\/p>\\r\\n<p><input name=\\\"id_tor\\\" type=\\\"hidden\\\" value=\\\"..\\\" \\/><\\/p>\\r\\n<p><iframe src=\\\"external\\/definir_torneo.php\\\" width=\\\"100%\\\" height=\\\"500px\\\" frameborder=\\\"0\\\"><\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 18:38:46\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-06 20:55:36\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-06 20:14:24\",\"publish_up\":\"2015-10-05 18:38:46\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":6,\"ordering\":\"1\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"46\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (19,3,1,'','2015-10-06 20:56:25',398,2376,'08b90246e0080feefc6576c090556bf0d0a9be66','{\"id\":3,\"asset_id\":\"63\",\"title\":\"Configurar Torneo\",\"alias\":\"configurar-torneo\",\"introtext\":\"<p>{source}<span style=\\\"font-family: courier new, courier, monospace;\\\"><br \\/>&lt;?php<br \\/>$id_torneo = $_GET[\'id_torneo\'];<br \\/>echo \\\"&lt;form name=\'ids\' action=\'..\\/external\\/definir_torneo.php\'&gt;<\\/span><\\/p>\\r\\n<p><span style=\\\"font-family: courier new, courier, monospace;\\\">&lt;input type=\'hidden\' name=\'id_tor\' value=\'.$id_torneo.\'&gt;<\\/span><\\/p>\\r\\n<p><span style=\\\"font-family: courier new, courier, monospace;\\\">&lt;\\/form&gt;<br \\/>\\\";<br \\/>?&gt;<br \\/><\\/span>{\\/source}<\\/p>\\r\\n<p><input name=\\\"id_tor\\\" type=\\\"hidden\\\" value=\\\"..\\\" \\/><\\/p>\\r\\n<p><iframe src=\\\"external\\/definir_torneo.php\\\" width=\\\"100%\\\" height=\\\"500px\\\" frameborder=\\\"0\\\"><\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 18:38:46\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-06 20:56:25\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-06 20:55:36\",\"publish_up\":\"2015-10-05 18:38:46\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":7,\"ordering\":\"1\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"46\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (20,1,1,'','2015-10-09 23:18:53',398,1855,'042f0ddea17c9d7242c262236247f38cf6d3ef04','{\"id\":1,\"asset_id\":\"59\",\"title\":\"C\\u00f3mo administrar tus torneos.\",\"alias\":\"como-administrar-tus-torneos\",\"introtext\":\"<p>Hola, Te damos la bienvenida al panel de administraci\\u00f3n del torneo, donde podr\\u00e1s gestionar completamente tu torneo.<\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 16:54:44\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-09 23:18:53\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-09 23:18:37\",\"publish_up\":\"2015-10-05 16:54:44\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":6,\"ordering\":\"2\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"57\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (21,1,1,'','2015-10-14 22:48:08',398,2486,'984262821bbb7c7ee6ef09108251e242be9af8cd','{\"id\":1,\"asset_id\":\"59\",\"title\":\"C\\u00f3mo administrar tus torneos.\",\"alias\":\"como-administrar-tus-torneos\",\"introtext\":\"<p>Hola, Te damos la bienvenida al panel de administraci\\u00f3n del torneo, donde podr\\u00e1s gestionar completamente tu torneo.<\\/p>\\r\\n<p>{source}<span style=\\\"font-family: courier new, courier, monospace;\\\"><br \\/>&lt;!-- You can place html anywhere within the source tags --&gt;<br \\/><br \\/><br \\/>&lt;script language=\\\"javascript\\\" type=\\\"text\\/javascript\\\"&gt;<br \\/><img src=\\\"media\\/sourcerer\\/images\\/tab.png\\\" alt=\\\"\\\" \\/>\\/\\/ You can place JavaScript like this<br \\/><img src=\\\"media\\/sourcerer\\/images\\/tab.png\\\" alt=\\\"\\\" \\/><br \\/>&lt;\\/script&gt;<br \\/>&lt;?php<br \\/><img src=\\\"media\\/sourcerer\\/images\\/tab.png\\\" alt=\\\"\\\" \\/>echo \\\"Hola\\\";<br \\/><img src=\\\"media\\/sourcerer\\/images\\/tab.png\\\" alt=\\\"\\\" \\/><br \\/>?&gt;<br \\/><\\/span>{\\/source}<\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"8\",\"created\":\"2015-10-05 16:54:44\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-14 22:48:08\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-14 22:46:58\",\"publish_up\":\"2015-10-05 16:54:44\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":7,\"ordering\":\"2\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"76\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (22,2,1,'','2015-10-26 00:15:16',398,1811,'4a5c68f212b23d3902521048d0a79535fccf3562','{\"id\":2,\"asset_id\":\"61\",\"title\":\"Vista Previa\",\"alias\":\"vista-previa\",\"introtext\":\"<p><iframe src=\\\"external\\/vista_torneos.php\\\" width=\\\"100%\\\" height=\\\"500px\\\" frameborder=\\\"0\\\"><\\/iframe><\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"2\",\"created\":\"2015-10-05 17:34:27\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-26 00:15:16\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-26 00:13:25\",\"publish_up\":\"2015-10-05 17:34:27\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_icons\\\":\\\"0\\\",\\\"show_print_icon\\\":\\\"0\\\",\\\"show_email_icon\\\":\\\"0\\\",\\\"show_vote\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":9,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"2\",\"hits\":\"279\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (23,9,5,'','2015-10-26 17:36:47',398,551,'8558eab9b88d28829e5dcdb70d244d5d9549f5d0','{\"id\":9,\"asset_id\":70,\"parent_id\":\"1\",\"lft\":\"13\",\"rgt\":14,\"level\":1,\"path\":null,\"extension\":\"com_content\",\"title\":\"EMPRESA\",\"alias\":\"empresa\",\"note\":\"\",\"description\":\"\",\"published\":\"1\",\"checked_out\":null,\"checked_out_time\":null,\"access\":\"1\",\"params\":\"{\\\"category_layout\\\":\\\"\\\",\\\"image\\\":\\\"\\\",\\\"image_alt\\\":\\\"\\\"}\",\"metadesc\":\"\",\"metakey\":\"\",\"metadata\":\"{\\\"author\\\":\\\"\\\",\\\"robots\\\":\\\"\\\"}\",\"created_user_id\":\"398\",\"created_time\":\"2015-10-26 17:36:47\",\"modified_user_id\":null,\"modified_time\":\"2015-10-26 17:36:47\",\"hits\":\"0\",\"language\":\"*\",\"version\":null}',0);
INSERT INTO `imacj_ucm_history` VALUES (24,5,1,'','2015-10-26 17:37:19',398,1704,'09409083157f8488525e272a454ebf86117de1da','{\"id\":5,\"asset_id\":71,\"title\":\"QUIENES SOMOS\",\"alias\":\"quienes-somos\",\"introtext\":\"<p>Informaci\\u00f3n de la empresa<\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"9\",\"created\":\"2015-10-26 17:37:19\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-26 17:37:19\",\"modified_by\":null,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2015-10-26 17:37:19\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":1,\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":null,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (25,9,5,'','2015-10-31 01:33:22',398,580,'a5c6d0bbd1693635f55986b10cae6876393545a4','{\"id\":9,\"asset_id\":\"70\",\"parent_id\":\"1\",\"lft\":\"13\",\"rgt\":\"14\",\"level\":\"1\",\"path\":\"empresa\",\"extension\":\"com_content\",\"title\":\"Empresa\",\"alias\":\"empresa\",\"note\":\"\",\"description\":\"\",\"published\":\"1\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-31 01:33:14\",\"access\":\"1\",\"params\":\"{\\\"category_layout\\\":\\\"\\\",\\\"image\\\":\\\"\\\",\\\"image_alt\\\":\\\"\\\"}\",\"metadesc\":\"\",\"metakey\":\"\",\"metadata\":\"{\\\"author\\\":\\\"\\\",\\\"robots\\\":\\\"\\\"}\",\"created_user_id\":\"398\",\"created_time\":\"2015-10-26 17:36:47\",\"modified_user_id\":\"398\",\"modified_time\":\"2015-10-31 01:33:22\",\"hits\":\"0\",\"language\":\"*\",\"version\":\"1\"}',0);
INSERT INTO `imacj_ucm_history` VALUES (26,5,1,'','2015-10-31 01:34:45',398,1723,'b290da382c8750681eb0d1a0854559a8f6b1a6e0','{\"id\":5,\"asset_id\":\"71\",\"title\":\"Quienes Somos\",\"alias\":\"quienes-somos\",\"introtext\":\"<p>Informaci\\u00f3n de la empresa<\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"9\",\"created\":\"2015-10-26 17:37:19\",\"created_by\":\"398\",\"created_by_alias\":\"\",\"modified\":\"2015-10-31 01:34:45\",\"modified_by\":\"398\",\"checked_out\":\"398\",\"checked_out_time\":\"2015-10-31 01:34:30\",\"publish_up\":\"2015-10-26 17:37:19\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_layout\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":2,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":\"1\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\"}',0);
/*!40000 ALTER TABLE `imacj_ucm_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_update_sites`
--

DROP TABLE IF EXISTS `imacj_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_update_sites`
--

LOCK TABLES `imacj_update_sites` WRITE;
/*!40000 ALTER TABLE `imacj_update_sites` DISABLE KEYS */;
INSERT INTO `imacj_update_sites` VALUES (1,'Joomla! Core','collection','http://update.joomla.org/core/list.xml',1,1446769014,'');
INSERT INTO `imacj_update_sites` VALUES (2,'Joomla! Extension Directory','collection','http://update.joomla.org/jed/list.xml',1,1446769014,'');
INSERT INTO `imacj_update_sites` VALUES (3,'Accredited Joomla! Translations','collection','http://update.joomla.org/language/translationlist_3.xml',1,1446769012,'');
INSERT INTO `imacj_update_sites` VALUES (4,'Joomla! Update Component Update Site','extension','http://update.joomla.org/core/extensions/com_joomlaupdate.xml',1,1446769012,'');
INSERT INTO `imacj_update_sites` VALUES (5,'NoNumber Sourcerer','extension','http://download.nonumber.nl/updates.php?e=sourcerer&type=.xml',0,0,'');
/*!40000 ALTER TABLE `imacj_update_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_update_sites_extensions`
--

DROP TABLE IF EXISTS `imacj_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_update_sites_extensions`
--

LOCK TABLES `imacj_update_sites_extensions` WRITE;
/*!40000 ALTER TABLE `imacj_update_sites_extensions` DISABLE KEYS */;
INSERT INTO `imacj_update_sites_extensions` VALUES (1,700);
INSERT INTO `imacj_update_sites_extensions` VALUES (2,700);
INSERT INTO `imacj_update_sites_extensions` VALUES (3,600);
INSERT INTO `imacj_update_sites_extensions` VALUES (3,709);
INSERT INTO `imacj_update_sites_extensions` VALUES (4,28);
INSERT INTO `imacj_update_sites_extensions` VALUES (5,705);
INSERT INTO `imacj_update_sites_extensions` VALUES (5,706);
/*!40000 ALTER TABLE `imacj_update_sites_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_updates`
--

DROP TABLE IF EXISTS `imacj_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_updates`
--

LOCK TABLES `imacj_updates` WRITE;
/*!40000 ALTER TABLE `imacj_updates` DISABLE KEYS */;
INSERT INTO `imacj_updates` VALUES (1,1,700,'Joomla','','joomla','file','',0,'3.4.5','','http://update.joomla.org/core/sts/extension_sts.xml','','');
INSERT INTO `imacj_updates` VALUES (2,3,0,'Armenian','','pkg_hy-AM','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/hy-AM_details.xml','','');
INSERT INTO `imacj_updates` VALUES (3,3,0,'Malay','','pkg_ms-MY','package','',0,'3.4.1.2','','http://update.joomla.org/language/details3/ms-MY_details.xml','','');
INSERT INTO `imacj_updates` VALUES (4,3,0,'Romanian','','pkg_ro-RO','package','',0,'3.4.3.1','','http://update.joomla.org/language/details3/ro-RO_details.xml','','');
INSERT INTO `imacj_updates` VALUES (5,3,0,'Flemish','','pkg_nl-BE','package','',0,'3.4.5.2','','http://update.joomla.org/language/details3/nl-BE_details.xml','','');
INSERT INTO `imacj_updates` VALUES (6,3,0,'Chinese Traditional','','pkg_zh-TW','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/zh-TW_details.xml','','');
INSERT INTO `imacj_updates` VALUES (7,3,0,'French','','pkg_fr-FR','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/fr-FR_details.xml','','');
INSERT INTO `imacj_updates` VALUES (8,3,0,'Galician','','pkg_gl-ES','package','',0,'3.3.1.2','','http://update.joomla.org/language/details3/gl-ES_details.xml','','');
INSERT INTO `imacj_updates` VALUES (9,3,0,'German','','pkg_de-DE','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/de-DE_details.xml','','');
INSERT INTO `imacj_updates` VALUES (10,3,0,'Greek','','pkg_el-GR','package','',0,'3.4.2.1','','http://update.joomla.org/language/details3/el-GR_details.xml','','');
INSERT INTO `imacj_updates` VALUES (11,3,0,'Japanese','','pkg_ja-JP','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/ja-JP_details.xml','','');
INSERT INTO `imacj_updates` VALUES (12,3,0,'Hebrew','','pkg_he-IL','package','',0,'3.1.1.1','','http://update.joomla.org/language/details3/he-IL_details.xml','','');
INSERT INTO `imacj_updates` VALUES (13,3,0,'EnglishAU','','pkg_en-AU','package','',0,'3.3.1.1','','http://update.joomla.org/language/details3/en-AU_details.xml','','');
INSERT INTO `imacj_updates` VALUES (14,3,0,'EnglishUS','','pkg_en-US','package','',0,'3.3.1.1','','http://update.joomla.org/language/details3/en-US_details.xml','','');
INSERT INTO `imacj_updates` VALUES (15,3,0,'Hungarian','','pkg_hu-HU','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/hu-HU_details.xml','','');
INSERT INTO `imacj_updates` VALUES (16,3,0,'Afrikaans','','pkg_af-ZA','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/af-ZA_details.xml','','');
INSERT INTO `imacj_updates` VALUES (17,3,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/ar-AA_details.xml','','');
INSERT INTO `imacj_updates` VALUES (18,3,0,'Belarusian','','pkg_be-BY','package','',0,'3.2.1.1','','http://update.joomla.org/language/details3/be-BY_details.xml','','');
INSERT INTO `imacj_updates` VALUES (19,3,0,'Bulgarian','','pkg_bg-BG','package','',0,'3.4.4.2','','http://update.joomla.org/language/details3/bg-BG_details.xml','','');
INSERT INTO `imacj_updates` VALUES (20,3,0,'Catalan','','pkg_ca-ES','package','',0,'3.4.4.2','','http://update.joomla.org/language/details3/ca-ES_details.xml','','');
INSERT INTO `imacj_updates` VALUES (21,3,0,'Chinese Simplified','','pkg_zh-CN','package','',0,'3.4.1.1','','http://update.joomla.org/language/details3/zh-CN_details.xml','','');
INSERT INTO `imacj_updates` VALUES (22,3,0,'Croatian','','pkg_hr-HR','package','',0,'3.4.4.2','','http://update.joomla.org/language/details3/hr-HR_details.xml','','');
INSERT INTO `imacj_updates` VALUES (23,3,0,'Czech','','pkg_cs-CZ','package','',0,'3.4.1.1','','http://update.joomla.org/language/details3/cs-CZ_details.xml','','');
INSERT INTO `imacj_updates` VALUES (24,3,0,'Danish','','pkg_da-DK','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/da-DK_details.xml','','');
INSERT INTO `imacj_updates` VALUES (25,3,0,'Dutch','','pkg_nl-NL','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/nl-NL_details.xml','','');
INSERT INTO `imacj_updates` VALUES (26,3,0,'Estonian','','pkg_et-EE','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/et-EE_details.xml','','');
INSERT INTO `imacj_updates` VALUES (27,3,0,'Italian','','pkg_it-IT','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/it-IT_details.xml','','');
INSERT INTO `imacj_updates` VALUES (28,3,0,'Khmer','','pkg_km-KH','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/km-KH_details.xml','','');
INSERT INTO `imacj_updates` VALUES (29,3,0,'Korean','','pkg_ko-KR','package','',0,'3.4.4.2','','http://update.joomla.org/language/details3/ko-KR_details.xml','','');
INSERT INTO `imacj_updates` VALUES (30,3,0,'Latvian','','pkg_lv-LV','package','',0,'3.4.3.1','','http://update.joomla.org/language/details3/lv-LV_details.xml','','');
INSERT INTO `imacj_updates` VALUES (31,3,0,'Macedonian','','pkg_mk-MK','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/mk-MK_details.xml','','');
INSERT INTO `imacj_updates` VALUES (32,3,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/nb-NO_details.xml','','');
INSERT INTO `imacj_updates` VALUES (33,3,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'3.4.2.1','','http://update.joomla.org/language/details3/nn-NO_details.xml','','');
INSERT INTO `imacj_updates` VALUES (34,3,0,'Persian','','pkg_fa-IR','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/fa-IR_details.xml','','');
INSERT INTO `imacj_updates` VALUES (35,3,0,'Polish','','pkg_pl-PL','package','',0,'3.4.2.1','','http://update.joomla.org/language/details3/pl-PL_details.xml','','');
INSERT INTO `imacj_updates` VALUES (36,3,0,'Portuguese','','pkg_pt-PT','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/pt-PT_details.xml','','');
INSERT INTO `imacj_updates` VALUES (37,3,0,'Russian','','pkg_ru-RU','package','',0,'3.4.1.3','','http://update.joomla.org/language/details3/ru-RU_details.xml','','');
INSERT INTO `imacj_updates` VALUES (38,3,0,'Slovak','','pkg_sk-SK','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/sk-SK_details.xml','','');
INSERT INTO `imacj_updates` VALUES (39,3,0,'Swedish','','pkg_sv-SE','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/sv-SE_details.xml','','');
INSERT INTO `imacj_updates` VALUES (40,3,0,'Syriac','','pkg_sy-IQ','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/sy-IQ_details.xml','','');
INSERT INTO `imacj_updates` VALUES (41,3,0,'Tamil','','pkg_ta-IN','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/ta-IN_details.xml','','');
INSERT INTO `imacj_updates` VALUES (42,3,0,'Thai','','pkg_th-TH','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/th-TH_details.xml','','');
INSERT INTO `imacj_updates` VALUES (43,3,0,'Turkish','','pkg_tr-TR','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/tr-TR_details.xml','','');
INSERT INTO `imacj_updates` VALUES (44,3,0,'Ukrainian','','pkg_uk-UA','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/uk-UA_details.xml','','');
INSERT INTO `imacj_updates` VALUES (45,3,0,'Uyghur','','pkg_ug-CN','package','',0,'3.3.0.1','','http://update.joomla.org/language/details3/ug-CN_details.xml','','');
INSERT INTO `imacj_updates` VALUES (46,3,0,'Albanian','','pkg_sq-AL','package','',0,'3.1.1.1','','http://update.joomla.org/language/details3/sq-AL_details.xml','','');
INSERT INTO `imacj_updates` VALUES (47,3,0,'Hindi','','pkg_hi-IN','package','',0,'3.3.6.1','','http://update.joomla.org/language/details3/hi-IN_details.xml','','');
INSERT INTO `imacj_updates` VALUES (48,3,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/pt-BR_details.xml','','');
INSERT INTO `imacj_updates` VALUES (49,3,0,'Serbian Latin','','pkg_sr-YU','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/sr-YU_details.xml','','');
INSERT INTO `imacj_updates` VALUES (50,3,0,'Bosnian','','pkg_bs-BA','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/bs-BA_details.xml','','');
INSERT INTO `imacj_updates` VALUES (51,3,0,'Serbian Cyrillic','','pkg_sr-RS','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/sr-RS_details.xml','','');
INSERT INTO `imacj_updates` VALUES (52,3,0,'Vietnamese','','pkg_vi-VN','package','',0,'3.2.1.1','','http://update.joomla.org/language/details3/vi-VN_details.xml','','');
INSERT INTO `imacj_updates` VALUES (53,3,0,'Bahasa Indonesia','','pkg_id-ID','package','',0,'3.3.0.2','','http://update.joomla.org/language/details3/id-ID_details.xml','','');
INSERT INTO `imacj_updates` VALUES (54,3,0,'Finnish','','pkg_fi-FI','package','',0,'3.4.2.1','','http://update.joomla.org/language/details3/fi-FI_details.xml','','');
INSERT INTO `imacj_updates` VALUES (55,3,0,'Swahili','','pkg_sw-KE','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/sw-KE_details.xml','','');
INSERT INTO `imacj_updates` VALUES (56,3,0,'Montenegrin','','pkg_srp-ME','package','',0,'3.3.1.1','','http://update.joomla.org/language/details3/srp-ME_details.xml','','');
INSERT INTO `imacj_updates` VALUES (57,3,0,'EnglishCA','','pkg_en-CA','package','',0,'3.3.6.1','','http://update.joomla.org/language/details3/en-CA_details.xml','','');
INSERT INTO `imacj_updates` VALUES (58,3,0,'FrenchCA','','pkg_fr-CA','package','',0,'3.4.4.3','','http://update.joomla.org/language/details3/fr-CA_details.xml','','');
INSERT INTO `imacj_updates` VALUES (59,3,0,'Welsh','','pkg_cy-GB','package','',0,'3.3.0.2','','http://update.joomla.org/language/details3/cy-GB_details.xml','','');
INSERT INTO `imacj_updates` VALUES (60,3,0,'Sinhala','','pkg_si-LK','package','',0,'3.3.1.1','','http://update.joomla.org/language/details3/si-LK_details.xml','','');
INSERT INTO `imacj_updates` VALUES (61,3,0,'Dari Persian','','pkg_prs-AF','package','',0,'3.4.4.1','','http://update.joomla.org/language/details3/prs-AF_details.xml','','');
INSERT INTO `imacj_updates` VALUES (62,3,0,'Turkmen','','pkg_tk-TM','package','',0,'3.4.5.1','','http://update.joomla.org/language/details3/tk-TM_details.xml','','');
/*!40000 ALTER TABLE `imacj_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_user_keys`
--

DROP TABLE IF EXISTS `imacj_user_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(255) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_user_keys`
--

LOCK TABLES `imacj_user_keys` WRITE;
/*!40000 ALTER TABLE `imacj_user_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_user_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_user_notes`
--

DROP TABLE IF EXISTS `imacj_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_user_notes`
--

LOCK TABLES `imacj_user_notes` WRITE;
/*!40000 ALTER TABLE `imacj_user_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_user_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_user_profiles`
--

DROP TABLE IF EXISTS `imacj_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_user_profiles`
--

LOCK TABLES `imacj_user_profiles` WRITE;
/*!40000 ALTER TABLE `imacj_user_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `imacj_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_user_usergroup_map`
--

DROP TABLE IF EXISTS `imacj_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_user_usergroup_map`
--

LOCK TABLES `imacj_user_usergroup_map` WRITE;
/*!40000 ALTER TABLE `imacj_user_usergroup_map` DISABLE KEYS */;
INSERT INTO `imacj_user_usergroup_map` VALUES (398,8);
INSERT INTO `imacj_user_usergroup_map` VALUES (410,2);
INSERT INTO `imacj_user_usergroup_map` VALUES (410,6);
INSERT INTO `imacj_user_usergroup_map` VALUES (411,6);
/*!40000 ALTER TABLE `imacj_user_usergroup_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_usergroups`
--

DROP TABLE IF EXISTS `imacj_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_usergroups`
--

LOCK TABLES `imacj_usergroups` WRITE;
/*!40000 ALTER TABLE `imacj_usergroups` DISABLE KEYS */;
INSERT INTO `imacj_usergroups` VALUES (1,0,1,18,'Public');
INSERT INTO `imacj_usergroups` VALUES (2,1,8,15,'Registered');
INSERT INTO `imacj_usergroups` VALUES (3,2,9,14,'Author');
INSERT INTO `imacj_usergroups` VALUES (4,3,10,13,'Editor');
INSERT INTO `imacj_usergroups` VALUES (5,4,11,12,'Publisher');
INSERT INTO `imacj_usergroups` VALUES (6,1,4,7,'Manager');
INSERT INTO `imacj_usergroups` VALUES (7,6,5,6,'Administrator');
INSERT INTO `imacj_usergroups` VALUES (8,1,16,17,'Super Users');
INSERT INTO `imacj_usergroups` VALUES (9,1,2,3,'Guest');
/*!40000 ALTER TABLE `imacj_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_users`
--

DROP TABLE IF EXISTS `imacj_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_users`
--

LOCK TABLES `imacj_users` WRITE;
/*!40000 ALTER TABLE `imacj_users` DISABLE KEYS */;
INSERT INTO `imacj_users` VALUES (398,'Super User','admin','torneos.joomla@gmai.com','$2y$10$vMICYboqqGjSVOm3x9WAD.A4nvZK/OLCSxXVxvb8pckKS9TNaZrBm',0,1,'2015-09-19 23:28:09','2015-11-06 00:16:48','0','{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}','0000-00-00 00:00:00',0,'','',0);
INSERT INTO `imacj_users` VALUES (410,'prueba con apellido','prueba','doolpoes@gmail.com','$2y$10$wTnX3o96OFOJxxvUR2eN6uWS9qm6XBhr1EIT0QOmW66PHIzgWr.Nq',0,0,'2015-09-24 20:40:53','2015-11-05 23:29:18','','{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}','0000-00-00 00:00:00',0,'','',0);
INSERT INTO `imacj_users` VALUES (411,'Olfrey Escucha','cr8','douyyi_365@hotmail.com','$2y$10$cdt3Azg.1v7t3hA.MChBrejIgwktGulIlSNwpcYwDOVmJ0ZpAnMKK',0,0,'2015-10-21 17:07:00','2015-11-05 02:59:39','','{}','0000-00-00 00:00:00',0,'','',0);
/*!40000 ALTER TABLE `imacj_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imacj_viewlevels`
--

DROP TABLE IF EXISTS `imacj_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imacj_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imacj_viewlevels`
--

LOCK TABLES `imacj_viewlevels` WRITE;
/*!40000 ALTER TABLE `imacj_viewlevels` DISABLE KEYS */;
INSERT INTO `imacj_viewlevels` VALUES (1,'Public',0,'[1]');
INSERT INTO `imacj_viewlevels` VALUES (2,'Registered',2,'[6,2,8]');
INSERT INTO `imacj_viewlevels` VALUES (3,'Special',3,'[6,3,8]');
INSERT INTO `imacj_viewlevels` VALUES (5,'Guest',1,'[9]');
INSERT INTO `imacj_viewlevels` VALUES (6,'Super Users',4,'[8]');
/*!40000 ALTER TABLE `imacj_viewlevels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-06  1:40:40
