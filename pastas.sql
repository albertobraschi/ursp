-- MySQL dump 10.13  Distrib 5.1.57, for unknown-linux-gnu (x86_64)
--
-- Host: bm10.webservidor.net    Database: pastas_magento
-- ------------------------------------------------------
-- Server version	5.1.56-community

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
-- Table structure for table `admin_assert`
--

DROP TABLE IF EXISTS `admin_assert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_assert` (
  `assert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assert_type` varchar(20) NOT NULL DEFAULT '',
  `assert_data` text,
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ACL Asserts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_assert`
--

LOCK TABLES `admin_assert` WRITE;
/*!40000 ALTER TABLE `admin_assert` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_assert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tree_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `role_type` char(1) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `role_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`),
  KEY `parent_id` (`parent_id`,`sort_order`),
  KEY `tree_level` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ACL Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role`
--

LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;
INSERT INTO `admin_role` VALUES (1,0,1,1,'G',0,'Administrators'),(3,1,2,0,'U',1,'Alberto');
/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_rule`
--

DROP TABLE IF EXISTS `admin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `resource_id` varchar(255) NOT NULL DEFAULT '',
  `privileges` varchar(20) NOT NULL DEFAULT '',
  `assert_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_type` char(1) DEFAULT NULL,
  `permission` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rule_id`),
  KEY `resource` (`resource_id`,`role_id`),
  KEY `role_id` (`role_id`,`resource_id`),
  CONSTRAINT `FK_admin_rule` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ACL Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_rule`
--

LOCK TABLES `admin_rule` WRITE;
/*!40000 ALTER TABLE `admin_rule` DISABLE KEYS */;
INSERT INTO `admin_rule` VALUES (1,1,'all','',0,'G','allow');
/*!40000 ALTER TABLE `admin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `user_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `username` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT NULL,
  `logdate` datetime DEFAULT NULL,
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reload_acl_flag` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `extra` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNQ_ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'Alberto','Braschi','alberto.braschi@gmail.com','admin','a10c53c910502462ac532b0d63c04699:1Q','2011-06-30 01:20:49','2011-06-30 01:20:49','2011-06-30 01:29:31',1,0,1,'a:1:{s:11:\"configState\";a:47:{s:15:\"general_country\";s:1:\"1\";s:14:\"general_locale\";s:1:\"1\";s:25:\"general_store_information\";s:1:\"1\";s:14:\"design_package\";s:1:\"1\";s:12:\"design_theme\";s:1:\"1\";s:11:\"design_head\";s:1:\"1\";s:13:\"design_header\";s:1:\"1\";s:13:\"design_footer\";s:1:\"1\";s:16:\"design_watermark\";s:1:\"1\";s:17:\"design_pagination\";s:1:\"0\";s:25:\"trans_email_ident_general\";s:1:\"1\";s:23:\"trans_email_ident_sales\";s:1:\"1\";s:25:\"trans_email_ident_support\";s:1:\"1\";s:25:\"trans_email_ident_custom1\";s:1:\"0\";s:25:\"trans_email_ident_custom2\";s:1:\"0\";s:17:\"contacts_contacts\";s:1:\"1\";s:14:\"contacts_email\";s:1:\"1\";s:14:\"payment_ccsave\";s:1:\"0\";s:12:\"payment_free\";s:1:\"0\";s:15:\"payment_checkmo\";s:1:\"0\";s:21:\"payment_purchaseorder\";s:1:\"0\";s:20:\"payment_authorizenet\";s:1:\"0\";s:15:\"shipping_origin\";s:1:\"1\";s:15:\"shipping_option\";s:1:\"1\";s:16:\"catalog_frontend\";s:1:\"1\";s:15:\"catalog_sitemap\";s:1:\"1\";s:14:\"catalog_review\";s:1:\"1\";s:20:\"catalog_productalert\";s:1:\"0\";s:25:\"catalog_productalert_cron\";s:1:\"1\";s:19:\"catalog_placeholder\";s:1:\"0\";s:25:\"catalog_recently_products\";s:1:\"0\";s:13:\"catalog_price\";s:1:\"0\";s:26:\"catalog_layered_navigation\";s:1:\"0\";s:18:\"catalog_navigation\";s:1:\"0\";s:11:\"catalog_seo\";s:1:\"0\";s:14:\"catalog_search\";s:1:\"0\";s:20:\"catalog_downloadable\";s:1:\"0\";s:22:\"catalog_custom_options\";s:1:\"0\";s:31:\"carriers_pedroteixeira_correios\";s:1:\"0\";s:17:\"carriers_flatrate\";s:1:\"1\";s:19:\"carriers_matrixrate\";s:1:\"0\";s:18:\"carriers_tablerate\";s:1:\"0\";s:21:\"carriers_freeshipping\";s:1:\"1\";s:12:\"carriers_ups\";s:1:\"0\";s:13:\"carriers_usps\";s:1:\"0\";s:14:\"carriers_fedex\";s:1:\"0\";s:12:\"carriers_dhl\";s:1:\"0\";}}');
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminnotification_inbox`
--

DROP TABLE IF EXISTS `adminnotification_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `url` varchar(255) NOT NULL,
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_remove` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`notification_id`),
  KEY `IDX_SEVERITY` (`severity`),
  KEY `IDX_IS_READ` (`is_read`),
  KEY `IDX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminnotification_inbox`
--

LOCK TABLES `adminnotification_inbox` WRITE;
/*!40000 ALTER TABLE `adminnotification_inbox` DISABLE KEYS */;
INSERT INTO `adminnotification_inbox` VALUES (1,4,'2008-07-25 01:24:40','Magento 1.1 Production Version Now Available','We are thrilled to announce the availability of the production release of Magento 1.1. Read more about the release in the Magento Blog.','http://www.magentocommerce.com/blog/comments/magento-11-is-here-1/',0,1),(2,4,'2008-08-02 01:30:16','Updated iPhone Theme is now available','Updated iPhone theme for Magento 1.1 is now available on Magento Connect and for upgrade through your Magento Connect Manager.','http://www.magentocommerce.com/blog/comments/updated-iphone-theme-for-magento-11-is-now-available/',0,1),(3,3,'2008-08-02 01:40:27','Magento version 1.1.2 is now available','Magento version 1.1.2 is now available for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-version-112-is-now-available/',0,1),(4,3,'2008-08-13 17:51:46','Magento version 1.1.3 is now available','Magento version 1.1.3 is now available','http://www.magentocommerce.com/blog/comments/magento-version-113-is-now-available/',0,1),(5,1,'2008-09-02 21:10:31','Magento Version 1.1.4 Security Update Now Available','Magento 1.1.4 Security Update Now Available. If you are using Magento version 1.1.x, we highly recommend upgrading to this version as soon as possible.','http://www.magentocommerce.com/blog/comments/magento-version-114-security-update/',0,1),(6,3,'2008-09-15 22:09:54','Magento version 1.1.5 Now Available','Magento version 1.1.5 Now Available.\n\nThis release includes many bug fixes, a new category manager and a new skin for the default Magento theme.','http://www.magentocommerce.com/blog/comments/magento-version-115-now-available/',0,1),(7,3,'2008-09-17 20:18:35','Magento version 1.1.6 Now Available','Magento version 1.1.6 Now Available.\n\nThis version includes bug fixes for Magento 1.1.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-116-now-available/',0,1),(8,4,'2008-11-07 23:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,1),(9,3,'2008-11-20 01:31:12','Magento version 1.1.7 Now Available','Magento version 1.1.7 Now Available.\n\nThis version includes over 350 issue resolutions for Magento 1.1.x that are listed in the release notes section, and new functionality that includes:\n\n-Google Website Optimizer integration\n-Google Base integration\n-Scheduled DB logs cleaning option','http://www.magentocommerce.com/blog/comments/magento-version-117-now-available/',0,1),(10,3,'2008-11-26 21:24:50','Magento Version 1.1.8 Now Available','Magento version 1.1.8 now available.\n\nThis version includes some issue resolutions for Magento 1.1.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-118-now-available/',0,1),(11,3,'2008-12-30 07:45:59','Magento version 1.2.0 is now available for download and upgrade','We are extremely happy to announce the availability of Magento version 1.2.0 for download and upgrade.\n\nThis version includes numerous issue resolutions for Magento version 1.1.x and some highly requested new features such as:\n\n    * Support for Downloadable/Digital Products. \n    * Added Layered Navigation to site search result page.\n    * Improved site search to utilize MySQL fulltext search\n    * Added support for fixed-taxes on product level.\n    * Upgraded Zend Framework to the latest stable version 1.7.2','http://www.magentocommerce.com/blog/comments/magento-version-120-is-now-available/',0,1),(12,2,'2008-12-30 21:59:22','Magento version 1.2.0.1 now available','Magento version 1.2.0.1 now available.This version includes some issue resolutions for Magento 1.2.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-1201-available/',0,1),(13,2,'2009-01-12 20:41:49','Magento version 1.2.0.2 now available','Magento version 1.2.0.2 is now available for download and upgrade. This version includes an issue resolutions for Magento version 1.2.0.x as listed in the release notes.','http://www.magentocommerce.com/blog/comments/magento-version-1202-now-available/',0,1),(14,3,'2009-01-24 00:25:56','Magento version 1.2.0.3 now available','Magento version 1.2.0.3 is now available for download and upgrade. This version includes issue resolutions for Magento version 1.2.0.x as listed in the release notes.','http://www.magentocommerce.com/blog/comments/magento-version-1203-now-available/',0,1),(15,3,'2009-02-02 21:57:00','Magento version 1.2.1 is now available for download and upgrade','We are happy to announce the availability of Magento version 1.2.1 for download and upgrade.\n\nThis version includes some issue resolutions for Magento version 1.2.x. A full list of items included in this release can be found on the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-121-now-available/',0,1),(16,3,'2009-02-24 00:45:47','Magento version 1.2.1.1 now available','Magento version 1.2.1.1 now available.This version includes some issue resolutions for Magento 1.2.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-1211-now-available/',0,1),(17,3,'2009-02-27 01:39:24','CSRF Attack Prevention','We have just posted a blog entry about a hypothetical CSRF attack on a Magento admin panel. Please read the post to find out if your Magento installation is at risk at http://www.magentocommerce.com/blog/comments/csrf-vulnerabilities-in-web-application-and-how-to-avoid-them-in-magento/','http://www.magentocommerce.com/blog/comments/csrf-vulnerabilities-in-web-application-and-how-to-avoid-them-in-magento/',0,1),(18,2,'2009-03-03 23:03:58','Magento version 1.2.1.2 now available','Magento version 1.2.1.2 is now available for download and upgrade.\nThis version includes some updates to improve admin security as described in the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-1212-now-available/',0,1),(19,3,'2009-03-31 02:22:40','Magento version 1.3.0 now available','Magento version 1.3.0 is now available for download and upgrade. This version includes numerous issue resolutions for Magento version 1.2.x and new features as described on the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-130-is-now-available/',0,1),(20,3,'2009-04-18 04:06:02','Magento version 1.3.1 now available','Magento version 1.3.1 is now available for download and upgrade. This version includes some issue resolutions for Magento version 1.3.x and new features such as Checkout By Amazon and Amazon Flexible Payment. To see a full list of updates please check the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-131-now-available/',0,1),(21,3,'2009-05-19 22:31:21','Magento version 1.3.1.1 now available','Magento version 1.3.1.1 is now available for download and upgrade. This version includes some issue resolutions for Magento version 1.3.x and a security update for Magento installations that run on multiple domains or sub-domains. If you are running Magento with multiple domains or sub-domains we highly recommend upgrading to this version.','http://www.magentocommerce.com/blog/comments/magento-version-1311-now-available/',0,1),(22,3,'2009-05-29 22:54:06','Magento version 1.3.2 now available','This version includes some improvements and issue resolutions for version 1.3.x that are listed on the release notes page. also included is a Beta version of the Compile module.','http://www.magentocommerce.com/blog/comments/magento-version-132-now-available/',0,1),(23,3,'2009-06-01 19:32:52','Magento version 1.3.2.1 now available','Magento version 1.3.2.1 now available for download and upgrade.\n\nThis release solves an issue for users running Magento with PHP 5.2.0, and changes to index.php to support the new Compiler Module.','http://www.magentocommerce.com/blog/comments/magento-version-1321-now-available/',0,1),(24,3,'2009-07-02 01:21:44','Magento version 1.3.2.2 now available','Magento version 1.3.2.2 is now available for download and upgrade.\n\nThis release includes issue resolution for Magento version 1.3.x. To see a full list of changes please visit the release notes page http://www.magentocommerce.com/download/release_notes.','http://www.magentocommerce.com/blog/comments/magento-version-1322-now-available/',0,1),(25,3,'2009-07-23 06:48:54','Magento version 1.3.2.3 now available','Magento version 1.3.2.3 is now available for download and upgrade.\n\nThis release includes issue resolution for Magento version 1.3.x. We recommend to upgrade to this version if PayPal payment modules are in use. To see a full list of changes please visit the release notes page http://www.magentocommerce.com/download/release_notes.','http://www.magentocommerce.com/blog/comments/magento-version-1323-now-available/',0,1),(26,4,'2009-08-28 18:26:28','PayPal is updating Payflow Pro and Website Payments Pro (Payflow Edition) UK.','If you are using Payflow Pro and/or Website Payments Pro (Payflow Edition) UK.  payment methods, you will need to update the URL‘s in your Magento Administrator Panel in order to process transactions after September 1, 2009. Full details are available here: http://www.magentocommerce.com/wiki/paypal_payflow_changes','http://www.magentocommerce.com/wiki/paypal_payflow_changes',0,1),(27,2,'2009-09-23 20:16:49','Magento Version 1.3.2.4 Security Update','Magento Version 1.3.2.4 is now available. This version includes a security updates for Magento 1.3.x that solves possible XSS vulnerability issue on customer registration page and is available through SVN, Download Page and through the Magento Connect Manager.','http://www.magentocommerce.com/blog/comments/magento-version-1324-security-update/',0,1),(28,4,'2009-09-25 14:57:54','Magento Preview Version 1.4.0.0-alpha2 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-alpha2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-alpha2-now-available/',0,1),(29,4,'2009-10-07 00:55:40','Magento Preview Version 1.4.0.0-alpha3 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-alpha3 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-alpha3-now-available/',0,1),(30,4,'2009-12-08 23:30:36','Magento Preview Version 1.4.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-beta1-now-available/',0,1),(31,4,'2009-12-31 09:22:12','Magento Preview Version 1.4.0.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-rc1-now-available/',0,1),(32,4,'2010-02-13 03:39:53','Magento CE Version 1.4.0.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.0.0 Stable for upgrade and download.','http://bit.ly/c53rpK',0,1),(33,3,'2010-02-20 02:39:36','Magento CE Version 1.4.0.1 Stable is now available','Magento CE 1.4.0.1 Stable is now available for upgrade and download.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1401-stable-now-available/',0,1),(34,4,'2010-04-23 20:09:03','Magento Version CE 1.3.3.0 Stable - Now Available With Support for 3-D Secure','Based on community requests, we are excited to announce the release of Magento CE 1.3.3.0-Stable with support for 3-D Secure. This release is intended for Magento merchants using version 1.3.x, who want to add support for 3-D Secure.','http://www.magentocommerce.com/blog/comments/magento-version-ce-1330-stable-now-available-with-support-for-3-d-secure/',0,1),(35,4,'2010-05-31 17:20:21','Announcing the Launch of Magento Mobile','The Magento team is pleased to announce the launch of Magento mobile, a new product that will allow Magento merchants to easily create branded, native mobile storefront applications that are deeply integrated with Magento’s market-leading eCommerce platform. The product includes a new administrative manager, a native iPhone app that is fully customizable, and a service where Magento manages the submission and maintenance process for the iTunes App Store.\n\nLearn more by visiting the Magento mobile product page and sign-up to be the first to launch a native mobile commerce app, fully integrated with Magento.','http://www.magentocommerce.com/product/mobile',0,1),(36,4,'2010-06-10 20:08:08','Magento CE Version 1.4.1.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.1.0 Stable for upgrade and download. Some of the highlights of this release include: Enhanced PayPal integration (more info to follow), Change of Database structure of the Sales module to no longer use EAV, and much more.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1410-stable-now-available/',0,1),(37,4,'2010-07-26 21:37:34','Magento CE Version 1.4.1.1 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.1.1 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-now-available/',0,1),(38,4,'2010-07-28 05:12:12','Magento CE Version 1.4.2.0-beta1 Preview Release Now Available','This release gives a preview of the new Magento Connect Manager.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-beta1-now-available/',0,1),(39,4,'2010-07-28 20:15:01','Magento CE Version 1.4.1.1 Patch Available','As some users experienced issues with upgrading to CE 1.4.1.1 through PEAR channels we provided a patch for it that is available on our blog http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-patch/','http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-patch/',0,1),(40,4,'2010-11-08 21:52:06','Magento CE Version 1.4.2.0-RC1 Preview Release Now Available','We are happy to announce the availability of Magento Preview Version 1.4.2.0-RC1 for download.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-rc1-now-available/',0,1),(41,4,'2010-12-02 20:33:00','Magento CE Version 1.4.2.0-RC2 Preview Release Now Available','We are happy to announce the availability of Magento Preview Version 1.4.2.0-RC2 for download.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-rc2-now-available/',0,1),(42,4,'2010-12-08 22:29:55','Magento CE Version 1.4.2.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.2.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1420-stable-now-available/',0,1),(43,4,'2010-12-17 23:23:55','Magento Preview Version CE 1.5.0.0-alpha1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-alpha1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-alpha1-now-available/',0,1),(44,4,'2010-12-29 23:51:08','Magento Preview Version CE 1.5.0.0-alpha2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-alpha2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-alpha2-now-available/',0,1),(45,4,'2011-01-14 00:35:36','Magento Preview Version CE 1.5.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-beta1-now-available/',0,1),(46,4,'2011-01-21 21:19:09','Magento Preview Version CE 1.5.0.0-beta2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-beta2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-beta2-now-available/',0,1),(47,4,'2011-01-27 21:27:57','Magento Preview Version CE 1.5.0.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-rc1-now-available/',0,1),(48,4,'2011-02-03 21:56:33','Magento Preview Version CE 1.5.0.0-rc2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-rc2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-rc2-now-available/',0,1),(49,4,'2011-02-08 19:43:23','Magento CE Version 1.5.0.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.5.0.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-community-professional-and-enterprise-editions-releases-now-availab/',0,1),(50,4,'2011-02-09 23:42:57','Magento CE 1.5.0.1 stable Now Available','We are excited to announce the availability of Magento CE Version 1.5.0.1 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-1501-stable-now-available/',0,1),(51,4,'2011-03-18 20:15:45','Magento CE 1.5.1.0-beta1 Now Available','We are happy to announce the availability of Magento Preview Version CE 1.5.1.0-beta1 for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1510-beta1-now-available/',0,1),(52,4,'2011-03-31 18:43:02','Magento CE 1.5.1.0-rc1 Now Available','We are happy to announce the availability of Magento Preview Version CE 1.5.1.0-rc1 for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1510-rc1-now-available/',0,1),(53,4,'2011-04-26 19:21:07','Magento CE 1.5.1.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.5.1.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1510-stable-now-available/',0,1),(54,4,'2011-05-26 19:33:23','Magento Preview Version CE 1.6.0.0-alpha1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-alpha1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-alpha1-now-available/',0,1),(55,4,'2011-06-15 18:12:08','Magento Preview Version CE 1.6.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-beta1for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-beta1-now-available/',0,1);
/*!40000 ALTER TABLE `adminnotification_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assert`
--

DROP TABLE IF EXISTS `api_assert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_assert` (
  `assert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assert_type` varchar(20) NOT NULL DEFAULT '',
  `assert_data` text,
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Asserts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assert`
--

LOCK TABLES `api_assert` WRITE;
/*!40000 ALTER TABLE `api_assert` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_role`
--

DROP TABLE IF EXISTS `api_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tree_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `role_type` char(1) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `role_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`),
  KEY `parent_id` (`parent_id`,`sort_order`),
  KEY `tree_level` (`tree_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_role`
--

LOCK TABLES `api_role` WRITE;
/*!40000 ALTER TABLE `api_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_rule`
--

DROP TABLE IF EXISTS `api_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `resource_id` varchar(255) NOT NULL DEFAULT '',
  `privileges` varchar(20) NOT NULL DEFAULT '',
  `assert_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_type` char(1) DEFAULT NULL,
  `permission` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rule_id`),
  KEY `resource` (`resource_id`,`role_id`),
  KEY `role_id` (`role_id`,`resource_id`),
  CONSTRAINT `FK_api_rule` FOREIGN KEY (`role_id`) REFERENCES `api_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_rule`
--

LOCK TABLES `api_rule` WRITE;
/*!40000 ALTER TABLE `api_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_session`
--

DROP TABLE IF EXISTS `api_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_session` (
  `user_id` mediumint(9) unsigned NOT NULL,
  `logdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sessid` varchar(40) NOT NULL DEFAULT '',
  KEY `API_SESSION_USER` (`user_id`),
  KEY `API_SESSION_SESSID` (`sessid`),
  CONSTRAINT `FK_API_SESSION_USER` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Sessions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_session`
--

LOCK TABLES `api_session` WRITE;
/*!40000 ALTER TABLE `api_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_user`
--

DROP TABLE IF EXISTS `api_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_user` (
  `user_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `username` varchar(40) NOT NULL DEFAULT '',
  `api_key` varchar(40) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT NULL,
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reload_acl_flag` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_user`
--

LOCK TABLES `api_user` WRITE;
/*!40000 ALTER TABLE `api_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_anc_categs_index_idx`
--

DROP TABLE IF EXISTS `catalog_category_anc_categs_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_categs_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  KEY `IDX_CATEGORY` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_anc_categs_index_idx`
--

LOCK TABLES `catalog_category_anc_categs_index_idx` WRITE;
/*!40000 ALTER TABLE `catalog_category_anc_categs_index_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_anc_categs_index_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_anc_categs_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_anc_categs_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_categs_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  KEY `IDX_CATEGORY` (`category_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_anc_categs_index_tmp`
--

LOCK TABLES `catalog_category_anc_categs_index_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_anc_categs_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_anc_categs_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_anc_products_index_idx`
--

DROP TABLE IF EXISTS `catalog_category_anc_products_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_products_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_anc_products_index_idx`
--

LOCK TABLES `catalog_category_anc_products_index_idx` WRITE;
/*!40000 ALTER TABLE `catalog_category_anc_products_index_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_anc_products_index_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_anc_products_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_anc_products_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_products_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_anc_products_index_tmp`
--

LOCK TABLES `catalog_category_anc_products_index_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_anc_products_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_anc_products_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity`
--

DROP TABLE IF EXISTS `catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_LEVEL` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Category Entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity`
--

LOCK TABLES `catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity` DISABLE KEYS */;
INSERT INTO `catalog_category_entity` VALUES (1,3,0,0,'0000-00-00 00:00:00','2011-06-30 01:20:38','1',0,0,1),(2,3,3,1,'2011-06-30 01:20:38','2011-06-30 01:20:38','1/2',1,1,0);
/*!40000 ALTER TABLE `catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_category_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_datetime`
--

LOCK TABLES `catalog_category_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_category_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_decimal`
--

LOCK TABLES `catalog_category_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_int`
--

DROP TABLE IF EXISTS `catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_EMTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_EMTITY_INT_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_int`
--

LOCK TABLES `catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_int` VALUES (1,3,34,0,2,1),(2,3,34,1,2,1),(3,3,105,0,1,1),(4,3,105,0,2,1);
/*!40000 ALTER TABLE `catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_text`
--

DROP TABLE IF EXISTS `catalog_category_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_text`
--

LOCK TABLES `catalog_category_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_text` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_text` VALUES (1,3,58,0,1,''),(2,3,58,1,1,''),(3,3,58,0,2,''),(4,3,58,1,2,'');
/*!40000 ALTER TABLE `catalog_category_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`) USING BTREE,
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_varchar`
--

LOCK TABLES `catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_varchar` VALUES (1,3,33,0,1,'Root Catalog'),(2,3,33,1,1,'Root Catalog'),(3,3,35,0,1,'root-catalog'),(4,3,33,0,2,'Default Category'),(5,3,33,1,2,'Default Category'),(6,3,41,1,2,'PRODUCTS'),(7,3,35,0,2,'default-category');
/*!40000 ALTER TABLE `catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_flat_store_1`
--

DROP TABLE IF EXISTS `catalog_category_flat_store_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_flat_store_1` (
  `entity_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `all_children` text,
  `available_sort_by` text,
  `children` text,
  `custom_apply_to_products` int(10) NOT NULL DEFAULT '0',
  `custom_design` varchar(255) NOT NULL DEFAULT '',
  `custom_design_from` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `custom_design_to` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `custom_layout_update` text,
  `custom_use_parent_settings` int(10) NOT NULL DEFAULT '0',
  `default_sort_by` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `display_mode` varchar(255) NOT NULL DEFAULT '',
  `filter_price_range` int(10) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `include_in_menu` int(10) NOT NULL DEFAULT '0',
  `is_active` int(10) NOT NULL DEFAULT '0',
  `is_anchor` int(10) NOT NULL DEFAULT '0',
  `landing_page` int(10) NOT NULL DEFAULT '0',
  `meta_description` text,
  `meta_keywords` text,
  `meta_title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `page_layout` varchar(255) NOT NULL DEFAULT '',
  `path_in_store` text,
  `url_key` varchar(255) NOT NULL DEFAULT '',
  `url_path` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_PATH` (`path`),
  KEY `IDX_LEVEL` (`level`),
  CONSTRAINT `FK_CATEGORY_FLAT_CATEGORY_ID_STORE_1` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATEGORY_FLAT_STORE_ID_STORE_1` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_flat_store_1`
--

LOCK TABLES `catalog_category_flat_store_1` WRITE;
/*!40000 ALTER TABLE `catalog_category_flat_store_1` DISABLE KEYS */;
INSERT INTO `catalog_category_flat_store_1` VALUES (1,0,'0000-00-00 00:00:00','2011-06-30 01:20:38','1',0,0,1,1,'','','',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00','',0,'','','',0,'',1,0,0,0,'','','','Root Catalog','','','root-catalog',''),(2,1,'2011-06-30 01:20:38','2011-06-30 01:20:38','1/2',1,1,0,1,'','','',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00','',0,'','','',0,'',1,1,0,0,'','','','Default Category','','','default-category','');
/*!40000 ALTER TABLE `catalog_category_flat_store_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product`
--

DROP TABLE IF EXISTS `catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `UNQ_CATEGORY_PRODUCT` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY` (`category_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT` (`product_id`),
  CONSTRAINT `CATALOG_CATEGORY_PRODUCT_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product`
--

LOCK TABLES `catalog_category_product` WRITE;
/*!40000 ALTER TABLE `catalog_category_product` DISABLE KEYS */;
INSERT INTO `catalog_category_product` VALUES (2,4,1),(2,11,1),(2,20,1),(2,21,1),(2,22,1),(2,25,1),(2,26,1),(2,28,1),(2,29,1),(2,30,1),(2,31,1),(2,32,1),(2,33,1),(2,34,1),(2,35,1),(2,36,1),(2,37,1),(2,38,1),(2,49,1),(2,50,1);
/*!40000 ALTER TABLE `catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index`
--

DROP TABLE IF EXISTS `catalog_category_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) unsigned DEFAULT NULL,
  `is_parent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `visibility` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `UNQ_CATEGORY_PRODUCT` (`category_id`,`product_id`,`store_id`),
  KEY `FK_CATALOG_CATEGORY_PRODUCT_INDEX_CATEGORY_ENTITY` (`category_id`),
  KEY `IDX_JOIN` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_BASE` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`),
  CONSTRAINT `FK_CATALOG_CATEGORY_PROD_IDX_PROD_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_PROD_IDX_CATEGORY_ENTITY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATEGORY_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index`
--

LOCK TABLES `catalog_category_product_index` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index` DISABLE KEYS */;
INSERT INTO `catalog_category_product_index` VALUES (2,10,0,1,1,1),(2,12,0,1,1,1),(2,13,0,1,1,1),(2,14,0,1,1,1),(2,15,0,1,1,1),(2,16,0,1,1,1),(2,17,0,1,1,1),(2,18,0,1,1,1),(2,19,0,1,1,1),(2,40,0,1,1,1),(2,41,0,1,1,1),(2,42,0,1,1,1),(2,43,0,1,1,1),(2,44,0,1,1,1),(2,45,0,1,1,1),(2,46,0,1,1,1),(2,47,0,1,1,1),(2,48,0,1,1,1),(2,11,1,1,1,1),(2,28,1,1,1,1),(2,33,1,1,1,1),(2,34,1,1,1,1),(2,35,1,1,1,1),(2,36,1,1,1,1),(2,37,1,1,1,1),(2,38,1,1,1,1),(2,50,1,1,1,1),(2,1,0,1,1,4),(2,2,0,1,1,4),(2,3,0,1,1,4),(2,5,0,1,1,4),(2,6,0,1,1,4),(2,7,0,1,1,4),(2,8,0,1,1,4),(2,9,0,1,1,4),(2,23,0,1,1,4),(2,24,0,1,1,4),(2,27,0,1,1,4),(2,39,0,1,1,4),(2,4,1,1,1,4),(2,20,1,1,1,4),(2,21,1,1,1,4),(2,22,1,1,1,4),(2,25,1,1,1,4),(2,26,1,1,1,4),(2,29,1,1,1,4),(2,30,1,1,1,4),(2,31,1,1,1,4),(2,32,1,1,1,4),(2,49,1,1,1,4);
/*!40000 ALTER TABLE `catalog_category_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_enbl_idx`
--

DROP TABLE IF EXISTS `catalog_category_product_index_enbl_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_enbl_idx` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `visibility` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `IDX_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_enbl_idx`
--

LOCK TABLES `catalog_category_product_index_enbl_idx` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_enbl_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_enbl_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_enbl_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_enbl_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_enbl_tmp` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `visibility` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `IDX_PRODUCT` (`product_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_enbl_tmp`
--

LOCK TABLES `catalog_category_product_index_enbl_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_enbl_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_enbl_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_idx`
--

DROP TABLE IF EXISTS `catalog_category_product_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) NOT NULL DEFAULT '0',
  `is_parent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `visibility` tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_idx`
--

LOCK TABLES `catalog_category_product_index_idx` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) NOT NULL DEFAULT '0',
  `is_parent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `visibility` tinyint(3) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_tmp`
--

LOCK TABLES `catalog_category_product_index_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_compare_item`
--

DROP TABLE IF EXISTS `catalog_compare_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(11) unsigned NOT NULL DEFAULT '0',
  `customer_id` int(11) unsigned DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_CUSTOMER` (`customer_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_PRODUCT` (`product_id`),
  KEY `IDX_VISITOR_PRODUCTS` (`visitor_id`,`product_id`),
  KEY `IDX_CUSTOMER_PRODUCTS` (`customer_id`,`product_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_compare_item`
--

LOCK TABLES `catalog_compare_item` WRITE;
/*!40000 ALTER TABLE `catalog_compare_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_compare_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_eav_attribute`
--

DROP TABLE IF EXISTS `catalog_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `frontend_input_renderer` varchar(255) DEFAULT NULL,
  `is_global` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_searchable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_comparable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_visible_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_html_allowed_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_used_for_price_rules` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'deprecated after 1.4.0.1',
  `is_filterable_in_search` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `used_in_product_listing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `used_for_sort_by` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `apply_to` varchar(255) NOT NULL,
  `is_visible_in_advanced_search` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `is_wysiwyg_enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_used_for_promo_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attribute_id`),
  KEY `IDX_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `IDX_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `FK_CATALOG_EAV_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_eav_attribute`
--

LOCK TABLES `catalog_eav_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_eav_attribute` DISABLE KEYS */;
INSERT INTO `catalog_eav_attribute` VALUES (33,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(34,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(35,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(36,'',0,1,0,0,0,0,1,0,0,0,0,1,'',0,0,1,0),(37,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(38,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(39,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(40,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(41,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(42,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(43,'',1,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(44,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(45,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(46,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(47,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(48,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(49,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(50,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(51,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(52,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(53,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(54,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(55,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(56,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(57,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(58,'adminhtml/catalog_category_helper_sortby_available',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(59,'adminhtml/catalog_category_helper_sortby_default',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(60,'',0,1,1,0,0,0,0,0,0,1,1,1,'',1,0,0,0),(61,'',0,1,1,0,1,0,1,0,0,0,0,1,'',1,0,1,0),(62,'',0,1,1,0,1,0,1,0,0,1,0,1,'',1,0,1,0),(63,'',1,1,1,0,1,0,0,0,0,0,0,1,'',1,0,0,0),(64,'',2,1,1,1,0,0,0,0,0,1,1,1,'simple,configurable,virtual,bundle,downloadable',1,0,0,0),(65,'',2,1,0,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(66,'',2,1,0,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(67,'',2,1,0,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(68,'',2,1,0,0,0,0,0,0,0,0,0,1,'simple,virtual,downloadable',0,0,0,0),(69,'',1,1,0,0,0,0,0,0,0,0,0,1,'simple,bundle',0,0,0,0),(70,'',1,1,1,1,1,0,0,0,0,0,0,1,'simple',1,0,0,0),(71,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(72,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(73,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(74,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(75,'',0,1,0,0,0,0,0,0,0,1,0,1,'',0,0,0,0),(76,'',0,1,0,0,0,0,0,0,0,1,0,1,'',0,0,0,0),(77,'',1,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(78,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(79,'',2,1,0,0,0,0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(80,'',1,1,1,1,1,0,0,0,0,0,0,1,'simple',1,0,0,0),(81,'',2,1,0,0,0,0,0,0,0,1,0,1,'',0,0,0,0),(82,'',2,1,0,0,0,0,0,0,0,1,0,1,'',0,0,0,0),(83,'',1,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(84,'',2,1,1,0,0,0,0,0,0,1,0,1,'',0,0,0,0),(85,'',2,1,1,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',1,0,0,0),(86,'',0,1,0,0,0,0,0,0,0,1,0,1,'',0,0,0,0),(87,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(88,'',0,0,0,0,0,0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(89,'',1,1,0,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,0),(90,'',1,1,0,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,0),(91,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(92,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(93,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(94,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(95,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(96,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(97,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(98,'',1,0,0,0,0,0,0,0,0,1,0,1,'',0,0,0,0),(99,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(100,'',0,0,0,0,0,0,0,0,0,1,0,0,'',0,0,0,0),(101,'',0,0,0,0,0,0,0,0,0,1,0,0,'',0,0,0,0),(102,'',0,0,0,0,0,0,0,0,0,1,0,0,'',0,0,0,0),(103,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(104,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(105,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(106,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(107,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(108,'adminhtml/catalog_category_helper_pricestep',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(109,'',1,1,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0),(110,NULL,1,1,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0),(111,'',1,0,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0),(112,'',1,0,0,0,0,0,0,0,0,0,0,0,'bundle',0,0,0,0),(113,'',1,0,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0),(114,'',1,1,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0),(115,'',1,0,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0),(116,'',1,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0),(117,'',0,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0),(118,'',0,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0),(119,'',1,0,0,0,0,0,0,0,0,1,0,0,'downloadable',0,0,0,0),(120,'',1,1,0,0,0,0,0,0,0,1,0,0,'',0,0,0,0),(121,NULL,1,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(122,NULL,1,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(123,NULL,1,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0),(124,NULL,1,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
/*!40000 ALTER TABLE `catalog_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`option_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT` (`parent_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bundle Options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_option`
--

LOCK TABLES `catalog_product_bundle_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bundle Selections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_option_value`
--

LOCK TABLES `catalog_product_bundle_option_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(3) unsigned NOT NULL,
  `min_price` decimal(12,4) NOT NULL,
  `max_price` decimal(12,4) NOT NULL,
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_price_index`
--

LOCK TABLES `catalog_product_bundle_price_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_price_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_price_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `parent_product_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `selection_price_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `selection_qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `selection_can_change_qty` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`selection_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION` (`option_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bundle Selections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_selection`
--

LOCK TABLES `catalog_product_bundle_selection` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `selection_price_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`selection_id`,`website_id`),
  KEY `FK_BUNDLE_PRICE_SELECTION_WEBSITE` (`website_id`),
  CONSTRAINT `FK_BUNDLE_PRICE_SELECTION_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BUNDLE_PRICE_SELECTION_ID` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_selection_price`
--

LOCK TABLES `catalog_product_bundle_selection_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_selection_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `stock_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`entity_id`,`stock_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_stock_index`
--

LOCK TABLES `catalog_product_bundle_stock_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_stock_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_stock_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_enabled_index`
--

DROP TABLE IF EXISTS `catalog_product_enabled_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_enabled_index` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `visibility` smallint(5) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `UNQ_PRODUCT_STORE` (`product_id`,`store_id`),
  KEY `IDX_PRODUCT_VISIBILITY_IN_STORE` (`product_id`,`store_id`,`visibility`),
  KEY `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_enabled_index`
--

LOCK TABLES `catalog_product_enabled_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_enabled_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_enabled_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple',
  `sku` varchar(64) DEFAULT NULL,
  `has_options` smallint(1) NOT NULL DEFAULT '0',
  `required_options` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `sku` (`sku`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='Product Entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity`
--

LOCK TABLES `catalog_product_entity` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity` DISABLE KEYS */;
INSERT INTO `catalog_product_entity` VALUES (1,4,4,'simple','n2610',0,0,'2011-06-30 01:41:27','2011-06-30 01:41:27'),(2,4,4,'simple','bb8100',0,0,'2011-06-30 01:41:28','2011-06-30 01:41:28'),(3,4,4,'simple','sw810i',0,0,'2011-06-30 01:41:29','2011-06-30 01:41:29'),(4,4,4,'simple','8525PDA',0,0,'2011-06-30 01:41:33','2011-06-30 01:41:33'),(5,4,4,'simple','MM-A900M',0,0,'2011-06-30 01:41:34','2011-06-30 01:41:34'),(6,4,4,'simple','MA464LL/A',1,0,'2011-06-30 01:41:35','2011-06-30 01:41:35'),(7,4,4,'simple','LX.FR206.001',1,0,'2011-06-30 01:41:37','2011-06-30 01:41:37'),(8,4,4,'simple','VGN-TXN27N/B',0,0,'2011-06-30 01:41:39','2011-06-30 01:41:39'),(9,4,4,'simple','M285-E',0,0,'2011-06-30 01:41:42','2011-06-30 01:41:42'),(10,4,4,'simple','cn_3',0,0,'2011-06-30 01:41:43','2011-06-30 01:41:43'),(11,4,4,'simple','asc_8',0,0,'2011-06-30 01:41:46','2011-06-30 01:41:46'),(12,4,4,'simple','steve_4',0,0,'2011-06-30 01:41:48','2011-06-30 01:41:48'),(13,4,4,'simple','nine_3',0,0,'2011-06-30 01:41:50','2011-06-30 01:41:50'),(14,4,4,'simple','ecco_3',0,0,'2011-06-30 01:41:51','2011-06-30 01:41:51'),(15,4,4,'simple','ken_8',0,0,'2011-06-30 01:41:52','2011-06-30 01:41:52'),(16,4,4,'simple','coal_sm',0,0,'2011-06-30 01:41:53','2011-06-30 01:41:53'),(17,4,4,'simple','ink_sm',0,0,'2011-06-30 01:41:54','2011-06-30 01:41:54'),(18,4,4,'simple','oc_sm',0,0,'2011-06-30 01:41:55','2011-06-30 01:41:55'),(19,4,4,'simple','zol_r_sm',0,0,'2011-06-30 01:41:56','2011-06-30 01:41:56'),(20,4,4,'simple','4fasd5f5',0,0,'2011-06-30 01:41:57','2011-06-30 01:41:57'),(21,4,4,'simple','384822',0,0,'2011-06-30 01:41:58','2011-06-30 01:41:58'),(22,4,4,'simple','bar1234',0,0,'2011-06-30 01:41:59','2011-06-30 01:41:59'),(23,4,4,'simple','Rebel XT',0,0,'2011-06-30 01:42:00','2011-06-30 01:42:00'),(24,4,4,'simple','QC-2185',0,0,'2011-06-30 01:42:02','2011-06-30 01:42:02'),(25,4,4,'simple','750',0,0,'2011-06-30 01:42:03','2011-06-30 01:42:03'),(26,4,4,'simple','A630',0,0,'2011-06-30 01:42:04','2011-06-30 01:42:04'),(27,4,4,'simple','C530',0,0,'2011-06-30 01:42:05','2011-06-30 01:42:05'),(28,4,4,'simple','ana_9',0,0,'2011-06-30 01:42:06','2011-06-30 01:42:06'),(29,4,4,'simple','1111',0,0,'2011-06-30 01:42:07','2011-06-30 01:42:07'),(30,4,4,'simple','1112',0,0,'2011-06-30 01:42:08','2011-06-30 01:42:08'),(31,4,4,'simple','1113',0,0,'2011-06-30 01:42:09','2011-06-30 01:42:09'),(32,4,4,'grouped','1114',0,0,'2011-06-30 01:42:10','2011-06-30 01:42:10'),(33,4,4,'simple','ana_3',0,0,'2011-06-30 01:42:10','2011-06-30 01:42:10'),(34,4,4,'simple','ana_4',0,0,'2011-06-30 01:42:12','2011-06-30 01:42:12'),(35,4,4,'simple','ana_5',0,0,'2011-06-30 01:42:13','2011-06-30 01:42:13'),(36,4,4,'simple','ana_6',0,0,'2011-06-30 01:42:13','2011-06-30 01:42:13'),(37,4,4,'simple','ana_7',0,0,'2011-06-30 01:42:14','2011-06-30 01:42:14'),(38,4,4,'simple','ana_8',0,0,'2011-06-30 01:42:15','2011-06-30 01:42:15'),(39,4,4,'configurable','cn',1,0,'2011-06-30 01:42:16','2011-06-30 01:42:16'),(40,4,4,'simple','cn_4',0,0,'2011-06-30 01:42:18','2011-06-30 01:42:18'),(41,4,4,'simple','cn_5',0,0,'2011-06-30 01:42:19','2011-06-30 01:42:19'),(42,4,4,'simple','cn_6',0,0,'2011-06-30 01:42:20','2011-06-30 01:42:20'),(43,4,4,'simple','cn_7',0,0,'2011-06-30 01:42:21','2011-06-30 01:42:21'),(44,4,4,'simple','cn_m8',0,0,'2011-06-30 01:42:22','2011-06-30 01:42:22'),(45,4,4,'simple','cn_m9',0,0,'2011-06-30 01:42:23','2011-06-30 01:42:23'),(46,4,4,'simple','cn_m10',0,0,'2011-06-30 01:42:24','2011-06-30 01:42:24'),(47,4,4,'simple','cn_m11',0,0,'2011-06-30 01:42:26','2011-06-30 01:42:26'),(48,4,4,'simple','cn_m12',0,0,'2011-06-30 01:42:26','2011-06-30 01:42:26'),(49,4,4,'configurable','asc',1,0,'2011-06-30 01:42:27','2011-06-30 01:42:27'),(50,4,4,'simple','asc_9',0,0,'2011-06-30 01:42:28','2011-06-30 01:42:28');
/*!40000 ALTER TABLE `catalog_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_product_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_PRODUCT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PROD_ENTITY_DATETIME_PROD_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_datetime`
--

LOCK TABLES `catalog_product_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_datetime` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_datetime` VALUES (1,4,66,0,1,NULL),(2,4,66,0,2,NULL),(3,4,66,0,3,NULL),(4,4,66,0,4,NULL),(5,4,66,0,5,NULL),(6,4,66,0,6,NULL),(7,4,66,0,7,NULL),(8,4,66,0,8,NULL),(9,4,66,0,9,NULL),(10,4,66,0,10,NULL),(11,4,66,0,11,NULL),(12,4,66,0,12,NULL),(13,4,66,0,13,NULL),(14,4,66,0,14,NULL),(15,4,66,0,15,NULL),(16,4,66,0,16,NULL),(17,4,66,0,17,NULL),(18,4,66,0,18,NULL),(19,4,66,0,19,NULL),(20,4,66,0,20,NULL),(21,4,66,0,21,NULL),(22,4,66,0,22,NULL),(23,4,66,0,23,NULL),(24,4,66,0,24,NULL),(25,4,66,0,25,NULL),(26,4,66,0,26,NULL),(27,4,66,0,27,NULL),(28,4,66,0,28,NULL),(29,4,66,0,29,NULL),(30,4,66,0,30,NULL),(31,4,66,0,31,NULL),(32,4,66,0,33,NULL),(33,4,66,0,34,NULL),(34,4,66,0,35,NULL),(35,4,66,0,36,NULL),(36,4,66,0,37,NULL),(37,4,66,0,38,NULL),(38,4,66,0,39,NULL),(39,4,66,0,40,NULL),(40,4,66,0,41,NULL),(41,4,66,0,42,NULL),(42,4,66,0,43,NULL),(43,4,66,0,44,NULL),(44,4,66,0,45,NULL),(45,4,66,0,46,NULL),(46,4,66,0,47,NULL),(47,4,66,0,48,NULL),(48,4,66,0,49,NULL),(49,4,66,0,50,NULL);
/*!40000 ALTER TABLE `catalog_product_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_CATALOG_PROD_ENTITY_DECIMAL_PROD_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_decimal`
--

LOCK TABLES `catalog_product_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_decimal` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_decimal` VALUES (1,4,64,0,1,'149.9900'),(2,4,68,0,1,'20.0000'),(3,4,69,0,1,'3.2000'),(4,4,88,0,1,'149.9900'),(5,4,64,0,2,'349.9900'),(6,4,68,0,2,'29.9900'),(7,4,69,0,2,'15.2000'),(8,4,88,0,2,'349.9900'),(9,4,64,0,3,'399.9900'),(10,4,68,0,3,'29.9900'),(11,4,69,0,3,'13.6000'),(12,4,88,0,3,'399.9900'),(13,4,64,0,4,'199.9900'),(14,4,68,0,4,'29.9900'),(15,4,69,0,4,'30.0000'),(16,4,88,0,4,'199.9900'),(17,4,64,0,5,'150.0000'),(18,4,68,0,5,'29.9900'),(19,4,69,0,5,'1.0000'),(20,4,88,0,5,'150.0000'),(21,4,64,0,6,'2299.9900'),(22,4,68,0,6,'1299.9900'),(23,4,69,0,6,'10.6000'),(24,4,88,0,6,'2299.9900'),(25,4,64,0,7,'1799.9900'),(26,4,68,0,7,'999.9900'),(27,4,69,0,7,'11.4000'),(28,4,88,0,7,'1799.9900'),(29,4,64,0,8,'2699.9900'),(30,4,68,0,8,'899.9900'),(31,4,69,0,8,'2.8000'),(32,4,88,0,8,'2699.9900'),(33,4,64,0,9,'1599.9900'),(34,4,68,0,9,'899.9900'),(35,4,69,0,9,'10.0000'),(36,4,88,0,9,'1599.9900'),(37,4,64,0,10,'15.9900'),(38,4,68,0,10,'1.0000'),(39,4,69,0,10,'1.0000'),(40,4,88,0,10,'15.9900'),(41,4,64,0,11,'134.9900'),(42,4,68,0,11,'29.9900'),(43,4,69,0,11,'3.0000'),(44,4,88,0,11,'134.9900'),(45,4,64,0,12,'69.9900'),(46,4,68,0,12,'29.9900'),(47,4,69,0,12,'2.0000'),(48,4,88,0,12,'69.9900'),(49,4,64,0,13,'89.9900'),(50,4,68,0,13,'29.9900'),(51,4,69,0,13,'2.0000'),(52,4,88,0,13,'89.9900'),(53,4,64,0,14,'159.9900'),(54,4,68,0,14,'29.9900'),(55,4,69,0,14,'4.0000'),(56,4,88,0,14,'159.9900'),(57,4,64,0,15,'160.9900'),(58,4,68,0,15,'29.9900'),(59,4,69,0,15,'2.0000'),(60,4,88,0,15,'160.9900'),(61,4,64,0,16,'15.0000'),(62,4,68,0,16,'2.0000'),(63,4,69,0,16,'0.5000'),(64,4,88,0,16,'15.0000'),(65,4,64,0,17,'22.0000'),(66,4,68,0,17,'2.0000'),(67,4,69,0,17,'0.5000'),(68,4,88,0,17,'22.0000'),(69,4,64,0,18,'15.0000'),(70,4,68,0,18,'2.0000'),(71,4,69,0,18,'0.4400'),(72,4,88,0,18,'15.0000'),(73,4,64,0,19,'13.5000'),(74,4,68,0,19,'2.0000'),(75,4,69,0,19,'0.4400'),(76,4,88,0,19,'13.5000'),(77,4,64,0,20,'30.0000'),(78,4,68,0,20,'5.0000'),(79,4,69,0,20,'1.7500'),(80,4,88,0,20,NULL),(81,4,64,0,21,'399.9900'),(82,4,68,0,21,'100.0000'),(83,4,69,0,21,'128.9700'),(84,4,88,0,21,'399.9900'),(85,4,64,0,22,'2299.0000'),(86,4,68,0,22,'800.0000'),(87,4,69,0,22,'150.0000'),(88,4,88,0,22,'2299.0000'),(89,4,64,0,23,'550.0000'),(90,4,68,0,23,'200.0000'),(91,4,69,0,23,'4.0000'),(92,4,88,0,23,'449.0000'),(93,4,64,0,24,'37.4900'),(94,4,68,0,24,'20.0000'),(95,4,69,0,24,'1.0000'),(96,4,88,0,24,'37.4900'),(97,4,64,0,25,'161.9400'),(98,4,68,0,25,'29.9900'),(99,4,69,0,25,'2.0000'),(100,4,88,0,25,'161.9400'),(101,4,64,0,26,'329.9900'),(102,4,68,0,26,'29.9900'),(103,4,69,0,26,'3.0000'),(104,4,88,0,26,'329.9900'),(105,4,64,0,27,'199.9900'),(106,4,68,0,27,'29.9900'),(107,4,69,0,27,'2.0000'),(108,4,88,0,27,'199.9900'),(109,4,64,0,28,'41.9500'),(110,4,68,0,28,'10.0000'),(111,4,69,0,28,'2.0000'),(112,4,88,0,28,'41.9500'),(113,4,64,0,29,'299.9900'),(114,4,68,0,29,'50.0000'),(115,4,69,0,29,'20.0000'),(116,4,88,0,29,'299.9900'),(117,4,64,0,30,'129.9900'),(118,4,68,0,30,'50.0000'),(119,4,69,0,30,'50.0000'),(120,4,88,0,30,'129.9900'),(121,4,64,0,31,'599.9900'),(122,4,68,0,31,'200.0000'),(123,4,69,0,31,'200.0000'),(124,4,88,0,31,'599.9900'),(125,4,64,0,33,'41.9500'),(126,4,68,0,33,'10.0000'),(127,4,69,0,33,'2.0000'),(128,4,88,0,33,'41.9500'),(129,4,64,0,34,'41.9500'),(130,4,68,0,34,'10.0000'),(131,4,69,0,34,'2.0000'),(132,4,88,0,34,'41.9500'),(133,4,64,0,35,'41.9500'),(134,4,68,0,35,'10.0000'),(135,4,69,0,35,'2.0000'),(136,4,88,0,35,'41.9500'),(137,4,64,0,36,'41.9500'),(138,4,68,0,36,'10.0000'),(139,4,69,0,36,'2.0000'),(140,4,88,0,36,'41.9500'),(141,4,64,0,37,'41.9500'),(142,4,68,0,37,'10.0000'),(143,4,69,0,37,'2.0000'),(144,4,88,0,37,'41.9500'),(145,4,64,0,38,'41.9500'),(146,4,68,0,38,'10.0000'),(147,4,69,0,38,'2.0000'),(148,4,88,0,38,'41.9500'),(149,4,64,0,39,'15.9900'),(150,4,88,0,39,'13.9900'),(151,4,64,0,40,'15.9900'),(152,4,68,0,40,'1.0000'),(153,4,69,0,40,'1.0000'),(154,4,88,0,40,'15.9900'),(155,4,64,0,41,'15.9900'),(156,4,68,0,41,'1.0000'),(157,4,69,0,41,'1.0000'),(158,4,88,0,41,'15.9900'),(159,4,64,0,42,'15.9900'),(160,4,68,0,42,'1.0000'),(161,4,69,0,42,'1.0000'),(162,4,88,0,42,'15.9900'),(163,4,64,0,43,'15.9900'),(164,4,68,0,43,'1.0000'),(165,4,69,0,43,'1.0000'),(166,4,88,0,43,'15.9900'),(167,4,64,0,44,'15.9900'),(168,4,68,0,44,'1.0000'),(169,4,69,0,44,'1.0000'),(170,4,88,0,44,'15.9900'),(171,4,64,0,45,'15.9900'),(172,4,68,0,45,'1.0000'),(173,4,69,0,45,'1.0000'),(174,4,88,0,45,'15.9900'),(175,4,64,0,46,'15.9900'),(176,4,68,0,46,'1.0000'),(177,4,69,0,46,'1.0000'),(178,4,88,0,46,'15.9900'),(179,4,64,0,47,'15.9900'),(180,4,68,0,47,'1.0000'),(181,4,69,0,47,'1.0000'),(182,4,88,0,47,'15.9900'),(183,4,64,0,48,'15.9900'),(184,4,68,0,48,'1.0000'),(185,4,69,0,48,'1.0000'),(186,4,88,0,48,'15.9900'),(187,4,64,0,49,'134.9900'),(188,4,88,0,49,'134.9900'),(189,4,64,0,50,'134.9900'),(190,4,68,0,50,'29.9900'),(191,4,69,0,50,'3.0000'),(192,4,88,0,50,'134.9900');
/*!40000 ALTER TABLE `catalog_product_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_GALLERY_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_GALLERY_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_GALLERY_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_gallery`
--

LOCK TABLES `catalog_product_entity_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_int`
--

DROP TABLE IF EXISTS `catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_PRODUCT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_int`
--

LOCK TABLES `catalog_product_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_int` VALUES (1,4,84,0,1,1),(2,4,85,0,1,2),(3,4,91,0,1,4),(4,4,109,0,1,1),(5,4,84,0,2,1),(6,4,85,0,2,2),(7,4,91,0,2,4),(8,4,109,0,2,1),(9,4,84,0,3,1),(10,4,85,0,3,2),(11,4,91,0,3,4),(12,4,109,0,3,1),(13,4,84,0,4,1),(14,4,85,0,4,2),(15,4,91,0,4,4),(16,4,109,0,4,1),(17,4,84,0,5,1),(18,4,85,0,5,2),(19,4,91,0,5,4),(20,4,109,0,5,1),(21,4,84,0,6,1),(22,4,85,0,6,2),(23,4,91,0,6,4),(24,4,109,0,6,1),(25,4,84,0,7,1),(26,4,85,0,7,2),(27,4,91,0,7,4),(28,4,109,0,7,1),(29,4,84,0,8,1),(30,4,85,0,8,2),(31,4,91,0,8,4),(32,4,109,0,8,1),(33,4,84,0,9,1),(34,4,85,0,9,2),(35,4,91,0,9,4),(36,4,109,0,9,1),(37,4,84,0,10,1),(38,4,85,0,10,2),(39,4,91,0,10,1),(40,4,109,0,10,1),(41,4,84,0,11,1),(42,4,85,0,11,2),(43,4,91,0,11,1),(44,4,109,0,11,1),(45,4,84,0,12,1),(46,4,85,0,12,2),(47,4,91,0,12,1),(48,4,109,0,12,1),(49,4,84,0,13,1),(50,4,85,0,13,2),(51,4,91,0,13,1),(52,4,109,0,13,1),(53,4,84,0,14,1),(54,4,85,0,14,2),(55,4,91,0,14,1),(56,4,109,0,14,1),(57,4,84,0,15,1),(58,4,85,0,15,2),(59,4,91,0,15,1),(60,4,109,0,15,1),(61,4,84,0,16,1),(62,4,85,0,16,2),(63,4,91,0,16,1),(64,4,109,0,16,1),(65,4,84,0,17,1),(66,4,85,0,17,2),(67,4,91,0,17,1),(68,4,109,0,17,1),(69,4,84,0,18,1),(70,4,85,0,18,2),(71,4,91,0,18,1),(72,4,109,0,18,1),(73,4,84,0,19,1),(74,4,85,0,19,2),(75,4,91,0,19,1),(76,4,109,0,19,1),(77,4,84,0,20,1),(78,4,85,0,20,2),(79,4,91,0,20,4),(80,4,109,0,20,1),(81,4,84,0,21,1),(82,4,85,0,21,2),(83,4,91,0,21,4),(84,4,109,0,21,1),(85,4,84,0,22,1),(86,4,85,0,22,2),(87,4,91,0,22,4),(88,4,109,0,22,1),(89,4,84,0,23,1),(90,4,85,0,23,2),(91,4,91,0,23,4),(92,4,109,0,23,1),(93,4,84,0,24,1),(94,4,85,0,24,2),(95,4,91,0,24,4),(96,4,109,0,24,1),(97,4,84,0,25,1),(98,4,85,0,25,2),(99,4,91,0,25,4),(100,4,109,0,25,1),(101,4,84,0,26,1),(102,4,85,0,26,2),(103,4,91,0,26,4),(104,4,109,0,26,1),(105,4,84,0,27,1),(106,4,85,0,27,2),(107,4,91,0,27,4),(108,4,109,0,27,1),(109,4,84,0,28,1),(110,4,85,0,28,2),(111,4,91,0,28,1),(112,4,109,0,28,1),(113,4,84,0,29,1),(114,4,85,0,29,2),(115,4,91,0,29,4),(116,4,109,0,29,1),(117,4,84,0,30,1),(118,4,85,0,30,2),(119,4,91,0,30,4),(120,4,109,0,30,1),(121,4,84,0,31,1),(122,4,85,0,31,2),(123,4,91,0,31,4),(124,4,109,0,31,1),(125,4,84,0,32,1),(126,4,91,0,32,4),(127,4,109,0,32,1),(128,4,84,0,33,1),(129,4,85,0,33,2),(130,4,91,0,33,1),(131,4,109,0,33,1),(132,4,84,0,34,1),(133,4,85,0,34,2),(134,4,91,0,34,1),(135,4,109,0,34,1),(136,4,84,0,35,1),(137,4,85,0,35,2),(138,4,91,0,35,1),(139,4,109,0,35,1),(140,4,84,0,36,1),(141,4,85,0,36,2),(142,4,91,0,36,1),(143,4,109,0,36,1),(144,4,84,0,37,1),(145,4,85,0,37,2),(146,4,91,0,37,1),(147,4,109,0,37,1),(148,4,84,0,38,1),(149,4,85,0,38,2),(150,4,91,0,38,1),(151,4,109,0,38,1),(152,4,84,0,39,1),(153,4,85,0,39,2),(154,4,91,0,39,4),(155,4,109,0,39,1),(156,4,84,0,40,1),(157,4,85,0,40,2),(158,4,91,0,40,1),(159,4,109,0,40,1),(160,4,84,0,41,1),(161,4,85,0,41,2),(162,4,91,0,41,1),(163,4,109,0,41,1),(164,4,84,0,42,1),(165,4,85,0,42,2),(166,4,91,0,42,1),(167,4,109,0,42,1),(168,4,84,0,43,1),(169,4,85,0,43,2),(170,4,91,0,43,1),(171,4,109,0,43,1),(172,4,84,0,44,1),(173,4,85,0,44,2),(174,4,91,0,44,1),(175,4,109,0,44,1),(176,4,84,0,45,1),(177,4,85,0,45,2),(178,4,91,0,45,1),(179,4,109,0,45,1),(180,4,84,0,46,1),(181,4,85,0,46,2),(182,4,91,0,46,1),(183,4,109,0,46,1),(184,4,84,0,47,1),(185,4,85,0,47,2),(186,4,91,0,47,1),(187,4,109,0,47,1),(188,4,84,0,48,1),(189,4,85,0,48,2),(190,4,91,0,48,1),(191,4,109,0,48,1),(192,4,84,0,49,1),(193,4,85,0,49,2),(194,4,91,0,49,4),(195,4,109,0,49,1),(196,4,84,0,50,1),(197,4,85,0,50,2),(198,4,91,0,50,1),(199,4,109,0,50,1);
/*!40000 ALTER TABLE `catalog_product_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='Catalog product media gallery';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery`
--

LOCK TABLES `catalog_product_entity_media_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_media_gallery` VALUES (1,77,1,'/n/o/nokia-2610-phone-2.jpg'),(2,77,2,'/b/l/blackberry-8100-pearl-2.jpg'),(3,77,3,'/s/o/sony-ericsson-w810i-2.jpg'),(4,77,4,'/a/t/at-t-8525-pda-1.jpg'),(5,77,5,'/s/a/samsung-mm-a900m-ace.jpg'),(6,77,6,'/a/p/apple-macbook-pro-ma464ll-a-15-4-notebook-pc.jpg'),(7,77,7,'/a/c/acer-ferrari-3200-notebook-computer-pc.jpg'),(8,77,8,'/s/o/sony-vaio-vgn-txn27n-b-11-1-notebook-pc.jpg'),(9,77,9,'/t/o/toshiba-m285-e-14.jpg'),(10,77,10,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(11,77,10,'/c/n/cn-clogs-beach-garden-clog-3.jpg'),(12,77,10,'/c/n/cn-clogs-beach-garden-clog-4.jpg'),(13,77,12,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(14,77,12,'/s/t/steven-by-steve-madden-pryme-pump-3.jpg'),(15,77,12,'/s/t/steven-by-steve-madden-pryme-pump-4.jpg'),(16,77,14,'/e/c/ecco-womens-golf-flexor-golf-shoe-2.jpg'),(17,77,14,'/e/c/ecco-womens-golf-flexor-golf-shoe-3.jpg'),(18,77,14,'/e/c/ecco-womens-golf-flexor-golf-shoe-4.jpg'),(19,77,15,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-2.jpg'),(20,77,15,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-3.jpg'),(21,77,15,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-4.jpg'),(22,77,18,'/t/h/the-only-children-paisley-t-shirt-1.jpg'),(23,77,18,'/t/h/the-only-children-paisley-t-shirt-2.jpg'),(24,77,18,'/t/h/the-only-children-paisley-t-shirt-3.jpg'),(25,77,19,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(26,77,19,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(27,77,19,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-3.jpg'),(28,77,20,'/t/h/the-get-up-kids-band-camp-pullover-hoodie-1.jpg'),(29,77,21,'/a/k/akio-dresser.jpg'),(30,77,22,'/b/a/barcelona-bamboo-platform-bed.jpg'),(31,77,23,'/c/a/canon-digital-rebel-xt-8mp-digital-slr-camera-1.jpg'),(32,77,24,'/a/r/argus-qc-2185-quick-click-5mp-digital-camera-2.jpg'),(33,77,25,'/o/l/olympus-stylus-750-7-1mp-digital-camera-2.jpg'),(34,77,26,'/c/a/canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom-2.jpg'),(35,77,27,'/k/o/kodak-easyshare-c530-5mp-digital-camera-2.jpg'),(36,77,28,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(37,77,29,'/o/t/ottoman.jpg'),(38,77,30,'/c/h/chair.jpg'),(39,77,31,'/c/o/couch.jpg'),(40,77,32,'/m/a/magento-red-furniture-set.jpg'),(41,77,33,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(42,77,35,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(43,77,39,'/c/n/cn-clogs-beach-garden-clog.jpg'),(44,77,40,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(45,77,49,'/a/s/asics-men-s-gel-kayano-xii-2.jpg');
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `position` int(11) unsigned DEFAULT NULL,
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_GALLERY` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog product media gallery values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value`
--

LOCK TABLES `catalog_product_entity_media_gallery_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_media_gallery_value` VALUES (1,0,'',1,1),(2,0,'',1,1),(3,0,'',1,1),(4,0,'',1,1),(5,0,'',1,1),(6,0,'',1,1),(7,0,'',1,1),(8,0,'',1,1),(9,0,'',1,1),(10,0,'',1,1),(11,0,'',2,1),(12,0,'',3,1),(13,0,'',1,1),(14,0,'',2,1),(15,0,'',3,1),(16,0,'',1,1),(17,0,'',2,1),(18,0,'',3,1),(19,0,'',1,1),(20,0,'',2,1),(21,0,'',3,1),(22,0,'',1,1),(23,0,'',2,1),(24,0,'',3,1),(25,0,'',1,1),(26,0,'',2,1),(27,0,'',3,1),(28,0,'',1,1),(29,0,'',1,1),(30,0,'',1,1),(31,0,'',1,1),(32,0,'',1,1),(33,0,'',1,1),(34,0,'',1,1),(35,0,'',1,1),(36,0,'',1,1),(37,0,'',1,1),(38,0,'',1,1),(39,0,'',1,1),(40,0,'',1,1),(41,0,'',1,1),(42,0,'',1,1),(43,0,'',1,1),(44,0,'',1,1),(45,0,'',1,1);
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_text`
--

DROP TABLE IF EXISTS `catalog_product_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_PRODUCT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_text`
--

LOCK TABLES `catalog_product_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_text` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_text` VALUES (1,4,61,0,1,'The Nokia 2610 is an easy to use device that combines multiple messaging options including email, instant messaging, and more. You can even download MP3 ringtones, graphics, and games straight to the phone, or surf the Internet with Cingular\'s MEdia Net service. It\'s the perfect complement to Cingular service for those even remotely interested in mobile Web capabilities in an affordable handset.<br><br>\n\n<b>Design</b><br>\nCompact and stylish, the 2610 features a candybar design sporting a bright 128 x 128 pixel display capable of displaying over 65,000 colors. Most of the phone\'s features and on-screen menus are controlled by a center toggle on the control pad. A standard hands-free headphone jack is provided, as are volume control keys, and there\'s even a \"Go-To\" button that can be assigned by the user for quick access to favorite applications. Lastly, the included speakerphone allows you to talk handsfree, and because the phone sports an internal antenna, there\'s nothing to snag or break off.\n\n'),(2,4,62,0,1,'The words \"entry level\" no longer mean \"low-end,\" especially when it comes to the Nokia 2610. Offering advanced media and calling features without breaking the bank'),(3,4,72,0,1,'Nokia 2610, cell, phone, '),(4,4,95,0,1,''),(5,4,61,0,2,' Like the BlackBerry 7105t, the BlackBerry 8100 Pearl is \nThe BlackBerry 8100 Pearl sports a large 240 x 260 screen that supports over 65,000 colors-- plenty of real estate to view your e-mails, Web browser content, messaging sessions, and attachments. The venerable BlackBerry trackwheel has been replaced on this model with an innovative four-way trackball placed below the screen. On the rear of the handheld, you\'ll find a 1.3-megapixel camera and a self portrait mirror. The handheld\'s microSD memory card slot is located inside the device, behind the battery. There\'s also a standard 2.5mm headset jack that can be used with the included headset, as well as a mini-USB port for data connectivity.'),(6,4,62,0,2,'The BlackBerry 8100 Pearl is a departure from the form factor of previous BlackBerry devices. This BlackBerry handset is far more phone-like, and RIM\'s engineers have managed to fit a QWERTY keyboard onto the handset\'s slim frame.'),(7,4,72,0,2,'Blackberry, 8100, pearl, cell, phone'),(8,4,95,0,2,''),(9,4,61,0,3,'The W810i\'s screen sports 176 x 220 pixel resolution with support for 262,000 colors. Quick access buttons below the screen make it easy to control the phone\'s Walkman music features, while a five-way center button controls most of the phone\'s menus and features.'),(10,4,62,0,3,'The W810i follows a long tradition of beautifully designed and crafted phones from Sony Ericsson. The same candy-bar style that graced the W800 is here.'),(11,4,72,0,3,'Sony, Ericsson ,W810i, cell, phone'),(12,4,95,0,3,''),(13,4,61,0,4,' The design of the 8525 is clean and uncluttered, with just a few buttons for mail, Internet Explorer, and contextual menus. Meanwhile, call answer and end buttons surround a five-way toggle that allows you to navigate and control the Windows Mobile interface. As mentioned, a full QWERTY keyboard cleverly slides out from underneath the screen. This allows you to hold the device horizontally, and the screen is automatically placed in landscape mode when you\'re using the keyboard. A side scroll wheel is conveniently tucked away on the side, making navigation when accessing the music player and other various applications a cinch when needed. A mini-SD memory expansion card slot is provided, as is an infrared port and support for a stereo Bluetooth headset. A mini-USB port is also included for wired data transfers and charging.'),(14,4,62,0,4,'Under the hood, the 8525 features 128MB of embedded memory and 64MB RAM, running on a 400 MHz Samsung processor. Up front, the 240 x 320 LCD touch-screen supports over 65,000 colors, while the rear of the device houses a 2.0 megapixel camera.'),(15,4,72,0,4,'At&t, 8525, cell, phone'),(16,4,95,0,4,''),(17,4,61,0,5,'New services supported by both the MM-A900m include the newly announced Sprint Music StoreSM, which allows users to immediately buy and download complete songs directly to their phone; 30 channels of live and on demand video and audio from Sprint TVSM and On Demand, a personalized resource guide to news, traffic, weather, sports and entertainment. The MM-A900m offers great-looking design with the ability to download a rich selection of content directly to the phone. Features like external music-navigation keys make these phones both functional and attractive. These handsets are sure to be at the top of many wish lists.'),(18,4,62,0,5,'The MM-A900m offers great-looking design with the ability to download a rich selection of content directly to the phone. '),(19,4,72,0,5,'Samsung, MM-A900M, cell, phone'),(20,4,95,0,5,''),(21,4,61,0,6,'This, combined with myriad other engineering leaps, boosts performance up to four times higher than the PowerBook G4. With this awesome power, it\'s a breeze to render complex 3D models, enjoy smooth playback of HD video, or host a four-way video conference.Intel Core Duo is the first chip built using Intel\'s groundbreaking 65-nanometer process - resulting in transistors so small, you could fit a hundred inside a single human cell. With smaller distances for electrons to travel, and two processors designed to share resources and conserve power, Intel Core Duo achieves higher levels of performance as it uses fewer watts. Which is what makes it possible to design a super-powerful MacBook Pro that\'s only one inch thin.When Mac technology makes something easy, it\'s hardly news. So here\'s more non-news for MacBook Pro owners: software just works. If you see the Universal logo on a new application, that means it will run on Intel- and PowerPC-based Mac computers. For most existing applications, you simply do what you\'ve always done: double-click them. Thanks to the Rosetta technology in Mac OS X, they look and feel just like they did before.'),(22,4,62,0,6,'You\'ve seen improvements in notebook performance before - but never on this scale. The Intel Core Duo powering MacBook Pro is actually two processors built into a single chip.'),(23,4,72,0,6,'Apple MacBook Pro MA464LL/A 15.4\" Notebook PC (2.0 GHz Intel Core Duo, 1 GB RAM, 100 GB Hard Drive, SuperDrive) '),(24,4,95,0,6,''),(25,4,61,0,7,' Acer has flawlessly designed the Ferrari 3200, instilling it with exceptional performance, brilliant graphics, and lightning-fast connectivity. This exclusive edition is another striking symbol of cooperation between Acer and Ferrari -- two progressive companies with proud heritages built on passion, innovation, power and success.'),(26,4,62,0,7,'This exclusive edition is another striking symbol of cooperation between Acer and Ferrari -- two progressive companies with proud heritages built on passion, innovation, power and success'),(27,4,72,0,7,'Acer Ferrari 3200 Notebook Computer PC '),(28,4,95,0,7,''),(29,4,61,0,8,' Weighing in at just an amazing 2.84 pounds and offering a sleek, durable carbon-fiber case in charcoal black. And with 4 to 10 hours of standard battery life, it has the stamina to power you through your most demanding applications. With the integrated wireless WAN, you can access the national Sprint Mobile Broadband service to extend your wireless coverage beyond LAN access networks and hotspots, giving you the freedom to go farther, do more, and stay connected.\n\n'),(30,4,62,0,8,'Take a load off your shoulders when you\'re racing for your plane with the sleekly designed and ultra-portable Sony Vaio VGN-TXN27N/B notebook PC.'),(31,4,72,0,8,'Sony, VAIO, VGN-TXN27N/B , Notebook, PC, Intel, 2 GB RAM, Laptop'),(32,4,95,0,8,''),(33,4,61,0,9,'Easily mobile at just 6 pounds, the Toshiba Satellite A135-S4527 makes it easy to get your work done with a large, bright 15.4-inch widescreen LCD. The XGA-resolution screen (1280 x 800) permits side-by-side viewing of documents for increased productivity. It\'s also great for using as a media center, with Toshiba\'s unique Express Media Player enabling you to bypass the system and access CDs and DVDs with a touch of button. This affordable notebook PC is powered by Intel\'s 1.73 GHz Core Duo T2080 processor, which provides an optimized, multithreaded architecture for improved gaming and multitasking performance and efficient power consumption. It also offers a 120 GB hard drive, 1 GB of installed RAM (2 GB maximum), dual-layer/multi-format DVD drive that also burns CDs, integrated 54g wireless connectivity, and Intel GMA 950 video card with up to 256 MB of shared video RAM.\n\n'),(34,4,62,0,9,'Get the competitive edge with the Gateway M285-E. This widescreen Convertible Notebook functions as both a conventional notebook and a tablet.'),(35,4,72,0,9,'Toshiba, notebook, laptop, intel, '),(36,4,95,0,9,''),(37,4,61,0,10,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(38,4,62,0,10,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(39,4,72,0,10,'CN Clogs Beach/Garden Clog '),(40,4,95,0,10,''),(41,4,61,0,11,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. Solyte midsole material is lighter than standard EVA and SpEVA® combined with improved cushioning and durability. Impact Guidance System (I.G.S.®) uses linked componentry to encourage optimal gait while allowing for natural foot movement from heel strike to toe off. DuoMax® support system helps ensure that the shoe maintains proper support for the foot during the critical transition from heel strike to toe off. Space Trusstic® System creates a pocket between the Trusstic® System device and the midsole, allowing for greater midsole deformation and more efficient foot function. GEL® Cushioning System provides maximum rearfoot and forefoot shock attenuation. Wt. 12.6 oz.'),(42,4,62,0,11,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. '),(43,4,72,0,11,'ASICS® Men\'s GEL-Kayano® XII '),(44,4,95,0,11,''),(45,4,61,0,12,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe. It also features smooth linings, a fully cushioned insole, a sexy covered stiletto heel, and a lightly textured dress leather outsole. Any way you wear the Pryme, you\'re certain to catch a lot of attention.'),(46,4,62,0,12,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe'),(47,4,72,0,12,'Steven by Steve Madden Pryme Pump'),(48,4,95,0,12,''),(49,4,61,0,13,'The Lucero pump from Nine West may just leave him at a loss for words. This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp, leather linings, and a cushioned insole for long-wearing comfort. The stiletto heel radiates a subtle hint of sensuality, so sass up your jean and t-shirt look or nighttime attire with this hot pump and you\'ll be absolutely unforgettable.'),(50,4,62,0,13,'The Lucero pump from Nine West may just leave him at a loss for words. This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp'),(51,4,72,0,13,'Nine West Women\'s Lucero Pump '),(52,4,95,0,13,''),(53,4,61,0,14,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links. The contrasting embossed snakeskin panels attract interest, while the laid back lace-up style keeps things simple. And thanks to the one-year waterproof guarantee, you can trust these shoes to keep you in the game, even when conditions are less than perfect.'),(54,4,62,0,14,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links.'),(55,4,72,0,14,'ECCO Womens Golf Flexor Golf Shoe'),(56,4,95,0,14,''),(57,4,61,0,15,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue with side elastic panels for a comfortable, secure fit. Smooth leather lining, cushioned leather topped insole. Dress midsole with a beveled edge, 1 inch capped dress heel. Flat traction outsole.'),(58,4,62,0,15,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue'),(59,4,72,0,15,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(60,4,95,0,15,''),(61,4,61,0,16,'# 6.1 oz. 100% preshrunk heavyweight cotton \n# Shoulder-to-shoulder taping\n# Double-needle sleeves and bottom hem'),(62,4,62,0,16,'# 6.1 oz. 100% preshrunk heavyweight cotton \n# Shoulder-to-shoulder taping\n# Double-needle sleeves and bottom hem'),(63,4,72,0,16,'Coalesce: Functioning On Impatience T-Shirt'),(64,4,95,0,16,''),(65,4,61,0,17,'We bought these with the intention of making shirts for our family reunion, only to come back the next day to find each and every one of them had been tagged by The Bear.  Oh well -- can\'t argue with art.  Now you can make your grandparents proud by wearing an original piece of graf work to YOUR family reunion!'),(66,4,62,0,17,'We bought these with the intention of making shirts for our family reunion, only to come back the next day to find each and every one of them had been tagged by The Bear.  Oh well -- can\'t argue with art.  Now you can make your grandparents proud by wearing an original piece of graf work to YOUR family reunion!'),(67,4,72,0,17,'Ink Eater: Krylon Bombear Destroyed Tee'),(68,4,95,0,17,''),(69,4,61,0,18,'# 6.1 oz. 100% preshrunk heavyweight cotton \n# Double-needle sleeves and bottom hem'),(70,4,62,0,18,'Printed on American Apparel Classic style 5495 California cotton T shirst.   '),(71,4,72,0,18,'The Only Children: Paisley T-Shirt'),(72,4,95,0,18,''),(73,4,61,0,19,'# 6.1 oz. 100% preshrunk heavyweight cotton \n# Shoulder-to-shoulder taping\n# Double-needle sleeves and bottom hem'),(74,4,62,0,19,'Printed on American Apparel Classic style 5495 California t-shirts.  '),(75,4,72,0,19,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(76,4,95,0,19,''),(77,4,61,0,20,'Printed on American Apparel Classic style 5495 California Fleece Pull-Over Hoodies.  Sizing info is available here. '),(78,4,62,0,20,'Printed on American Apparel Classic style 5495 California Fleece Pull-Over Hoodies.  '),(79,4,72,0,20,'The Get Up Kids: Band Camp Pullover Hoodie'),(80,4,95,0,20,''),(81,4,61,0,21,'Features include inset panel sides and for spacious drawers and two wicker baskets. 41\"Wx18\"Dx36\"H.'),(82,4,62,0,21,'Our Akio dresser has a solid hardwood frame.  '),(83,4,72,0,21,'Hardwood, drawers, wicker, asian, beechwood'),(84,4,95,0,21,''),(85,4,61,0,22,'Entirely handcrafted of solid Bamboo. Designed for use with a mattress alone, it includes a sturdy, padded wood platform for comfort and proper mattress support.'),(86,4,62,0,22,'Our Barcelona platform bed captures the spirit and drama of late 20th century design with a variety of subtle details.'),(87,4,72,0,22,'bamboo, barcelona, platform, bed'),(88,4,95,0,22,''),(89,4,61,0,23,'The Canon EOS Digital Rebel camera now has a new, faster, even smaller big brother. Sibling rivalries aside, the 8.0-megapixel Canon EOS Digital Rebel XT SLR adds resolution, speed, extra creative control, and enhanced comfort in the hand to one of the smallest and lightest digital cameras in its class. Even with its advancements in ergonomic design and technology, this easy-to-use EOS digital camera is compatible with all of Canon\'s EF lenses, including the EF-S lenses.'),(90,4,62,0,23,' Canon EOS Digital Rebel XT SLR adds resolution, speed, extra creative control, and enhanced comfort in the hand to one of the smallest and lightest digital cameras in its class. '),(91,4,72,0,23,'canon, slr, camera, 8, digital'),(92,4,95,0,23,''),(93,4,61,0,24,'The Argus QC-2185 Quick Click 5MP digital camera offers all the basic features you need in a compact and stylish digital camera. This unit is easy to use, and is perfect for those who want a completely portable option for taking good pictures, without having to empty their wallet.\n\nThe Argus QC-2185 features a clear and bright 1.1-inch CSTN (color super-twist nematic) LCD display that makes it easy to frame the perfect picture. Thanks to its USB 1.1 connection compatibility, this digital camera lets you quickly download pictures to your Mac or PC, and can also function as a handy web camera. The QC-2185 includes eight megabytes of internal SDRAM memory, with the ability to expand camera memory via a built-in SD (secure digital) storage card slot for easy storage and transfer of your pictures. This unit also includes a built-in auto flash with a three to seven foot range, and comes with ArcSoft PhotoImpression\'s photo editing software which makes it easy for you to edit, crop, adjust and improve all your best pictures to make them even better.\n'),(94,4,62,0,24,'The Argus QC-2185 Quick Click 5MP digital camera offers all the basic features you need in a compact and stylish digital camera. This unit is easy to use, and is perfect for those who want a completely portable option for taking good pictures, without having to empty their wallet.'),(95,4,72,0,24,'Argus, QC-2185, digital, camera, 2MP'),(96,4,95,0,24,''),(97,4,61,0,25,'Olympus continues to innovate with the launch of the Stylus 750 digital camera, a technically sophisticated point-and-shoot camera offering a number of pioneering technologies such as Dual Image Stabilization, Bright Capture Technology, and TruePic Turbo, as well as a powerful 5x optical zoom that tucks away into a streamlined metal, all-weather body design. The camera is distinguished by a number of premium features, including:\n\n    * An advanced combination of the mechanical CCD-shift Image Stabilization and Digital Image Stabilization work together to ensure the clearest pictures possible in any situation;\n    * A 5x optical zoom lens with a newly developed lens element to maintain a small compact size;\n    * A 2.5-inch LCD and Bright Capture Technology dramatically improve composition, capture and review of images in low-light situations;\n    * Olympus\' exclusive TruePic Turbo Image Processing engine is coupled with a 7.1-megapixel image sensor to produce crisp, high-quality p'),(98,4,62,0,25,'A technically sophisticated point-and-shoot camera offering a number of pioneering technologies such as Dual Image Stabilization, Bright Capture Technology, and TruePic Turbo, as well as a powerful 5x optical zoom.'),(99,4,72,0,25,'Olympus, stylus, 750, 7MP, digital, camera, zoom'),(100,4,95,0,25,''),(101,4,61,0,26,'Replacing the highly popular PowerShot A620, the PowerShot A630 features a rotating 2.5-inch vari-angle LCD, 4x optical zoom lens, and a vast array of creative shooting modes.<br>\n\nThe PowerShot A630 packs a vast array of advanced features into a remarkably compact space<br><br>\n\n'),(102,4,62,0,26,'Replacing the highly popular PowerShot A620, the PowerShot A630 features a rotating 2.5-inch vari-angle LCD, 4x optical zoom lens, and a vast array of creative shooting modes.'),(103,4,72,0,26,'canon, powershot, A630, digital, camera, optical, zoom'),(104,4,95,0,26,''),(105,4,61,0,27,'Small on size. Big on value. Kodak\'s newest C-Series digital camera, the C530, sports awesome features--such as 5.0-megapixel CCD resolution, on-camera image cropping, and an on-camera Share button--at a very affordable price.'),(106,4,62,0,27,'Small on size. Big on value. Kodak\'s newest C-Series digital camera, the C530, sports awesome features'),(107,4,72,0,27,'kodak, eayshare, c530, 5MP, digital, camera'),(108,4,95,0,27,''),(109,4,61,0,28,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(110,4,62,0,28,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(111,4,72,0,28,'womens, sandal, leather, anashria, '),(112,4,95,0,28,''),(113,4,61,0,29,'The Magento ottoman will impress with its style while it delivers on quality. This piece of living room furniture is built to last with durable solid wood framing, generous padding and plush stain-resistant microfiber upholstery.'),(114,4,62,0,29,'With durable solid wood framing, generous padding and plush stain-resistant microfiber upholstery.'),(115,4,72,0,29,'Ottoman'),(116,4,95,0,29,''),(117,4,61,0,30,'This Magento chair features a fun, futuristic design, with fluid curves and gentle angles that follow the shape of the body to enhance ultimate relaxation. It combines a hint of nostalgia with the up-to-date sensibility and function of modern chairs. It is in soft, velvety microfiber.'),(118,4,62,0,30,'Combining a hint of nostalgia with the up-to-date sensibility and function of modern chairs. It is in soft, velvety microfiber.'),(119,4,72,0,30,'Chair'),(120,4,95,0,30,''),(121,4,61,0,31,'Inspired by the classic camelback sofa, Magento offers comfort and style in a low maintenance package.  For a sleek, simple and stylish piece, look no further than the Magento sofa - or sofabed!'),(122,4,62,0,31,'For a sleek, simple and stylish piece, look no further than the Magento sofa - or sofabed!'),(123,4,72,0,31,'Couch'),(124,4,95,0,31,''),(125,4,61,0,32,'The perfect furniture set for the living room!  Love red?  You\'ll love these pieces of handmade modern furniture!'),(126,4,62,0,32,'Love red?  You\'ll love these pieces of handmade modern furniture!'),(127,4,72,0,32,'Magento, Red, Furniture, Set, ottoman, couch, chair'),(128,4,95,0,32,''),(129,4,61,0,33,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(130,4,62,0,33,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(131,4,72,0,33,'womens, sandal, leather, anashria, '),(132,4,95,0,33,''),(133,4,61,0,34,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(134,4,62,0,34,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(135,4,72,0,34,'womens, sandal, leather, anashria, '),(136,4,95,0,34,''),(137,4,61,0,35,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(138,4,62,0,35,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(139,4,72,0,35,'womens, sandal, leather, anashria, '),(140,4,95,0,35,''),(141,4,61,0,36,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(142,4,62,0,36,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(143,4,72,0,36,'womens, sandal, leather, anashria, '),(144,4,95,0,36,''),(145,4,61,0,37,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(146,4,62,0,37,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(147,4,72,0,37,'womens, sandal, leather, anashria, '),(148,4,95,0,37,''),(149,4,61,0,38,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(150,4,62,0,38,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(151,4,72,0,38,'womens, sandal, leather, anashria, '),(152,4,95,0,38,''),(153,4,61,0,39,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(154,4,62,0,39,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(155,4,72,0,39,'cn, clogs, outdoor, shoes, sandals, comfortable'),(156,4,95,0,39,''),(157,4,61,0,40,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(158,4,62,0,40,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(159,4,72,0,40,'CN Clogs Beach/Garden Clog '),(160,4,95,0,40,''),(161,4,61,0,41,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(162,4,62,0,41,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(163,4,72,0,41,'CN Clogs Beach/Garden Clog '),(164,4,95,0,41,''),(165,4,61,0,42,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(166,4,62,0,42,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(167,4,72,0,42,'CN Clogs Beach/Garden Clog '),(168,4,95,0,42,''),(169,4,61,0,43,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(170,4,62,0,43,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(171,4,72,0,43,'CN Clogs Beach/Garden Clog '),(172,4,95,0,43,''),(173,4,61,0,44,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(174,4,62,0,44,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(175,4,72,0,44,'CN Clogs Beach/Garden Clog '),(176,4,95,0,44,''),(177,4,61,0,45,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(178,4,62,0,45,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(179,4,72,0,45,'CN Clogs Beach/Garden Clog '),(180,4,95,0,45,''),(181,4,61,0,46,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(182,4,62,0,46,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(183,4,72,0,46,'CN Clogs Beach/Garden Clog '),(184,4,95,0,46,''),(185,4,61,0,47,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(186,4,62,0,47,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(187,4,72,0,47,'CN Clogs Beach/Garden Clog '),(188,4,95,0,47,''),(189,4,61,0,48,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(190,4,62,0,48,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(191,4,72,0,48,'CN Clogs Beach/Garden Clog '),(192,4,95,0,48,''),(193,4,61,0,49,'Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. Solyte midsole material is lighter than standard EVA and SpEVA® combined with improved cushioning and durability. Impact Guidance System (I.G.S.®) uses linked componentry to encourage optimal gait while allowing for natural foot movement from heel strike to toe off. DuoMax® support system helps ensure that the shoe maintains proper support for the foot during the critical transition from heel strike to toe off. Space Trusstic® System creates a pocket between the Trusstic® System device and the midsole, allowing for greater midsole deformation and more efficient foot function. GEL® Cushioning System provides maximum rearfoot and forefoot shock attenuation. Wt. 12.6 oz.'),(194,4,62,0,49,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. '),(195,4,72,0,49,'asics, gel, kayano'),(196,4,95,0,49,''),(197,4,61,0,50,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. Solyte midsole material is lighter than standard EVA and SpEVA® combined with improved cushioning and durability. Impact Guidance System (I.G.S.®) uses linked componentry to encourage optimal gait while allowing for natural foot movement from heel strike to toe off. DuoMax® support system helps ensure that the shoe maintains proper support for the foot during the critical transition from heel strike to toe off. Space Trusstic® System creates a pocket between the Trusstic® System device and the midsole, allowing for greater midsole deformation and more efficient foot function. GEL® Cushioning System provides maximum rearfoot and forefoot shock attenuation. Wt. 12.6 oz.'),(198,4,62,0,50,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. '),(199,4,72,0,50,'ASICS® Men\'s GEL-Kayano® XII '),(200,4,95,0,50,'');
/*!40000 ALTER TABLE `catalog_product_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `all_groups` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_TIER_PRICE` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_GROUP` (`customer_group_id`),
  KEY `FK_CATALOG_PRODUCT_TIER_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PROD_ENTITY_TIER_PRICE_PROD_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_TIER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_tier_price`
--

LOCK TABLES `catalog_product_entity_tier_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_PRODUCT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PROD_ENTITY_VARCHAR_PROD_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=594 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_varchar`
--

LOCK TABLES `catalog_product_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_varchar` VALUES (1,4,60,0,1,'Nokia 2610 Phone'),(2,4,71,0,1,'Nokia 2610'),(3,4,73,0,1,'Offering advanced media and calling features without breaking the bank, The Nokia 2610 is an easy to use'),(4,4,86,0,1,'nokia-2610-phone'),(5,4,87,0,1,'nokia-2610-phone.html'),(6,4,97,0,1,'container2'),(7,4,100,0,1,''),(8,4,101,0,1,''),(9,4,102,0,1,''),(10,4,110,0,1,'2'),(11,4,74,0,1,'/n/o/nokia-2610-phone-2.jpg'),(12,4,75,0,1,'/n/o/nokia-2610-phone-2.jpg'),(13,4,76,0,1,'/n/o/nokia-2610-phone-2.jpg'),(14,4,60,0,2,'BlackBerry 8100 Pearl'),(15,4,71,0,2,'BlackBerry 8100 Pearl'),(16,4,73,0,2,'BlackBerry 8100 Pearl sports a large 240 x 260 screen that supports over 65,000 colors-- plenty of real estate to view your e-mails, Web browser content, messaging sessions, and attachments.'),(17,4,86,0,2,'blackberry-8100-pearl'),(18,4,87,0,2,'blackberry-8100-pearl.html'),(19,4,97,0,2,'container2'),(20,4,100,0,2,''),(21,4,101,0,2,''),(22,4,102,0,2,''),(23,4,110,0,2,'2'),(24,4,74,0,2,'/b/l/blackberry-8100-pearl-2.jpg'),(25,4,75,0,2,'/b/l/blackberry-8100-pearl-2.jpg'),(26,4,76,0,2,'/b/l/blackberry-8100-pearl-2.jpg'),(27,4,60,0,3,'Sony Ericsson W810i'),(28,4,71,0,3,'Sony Ericsson W810i'),(29,4,73,0,3,'The W810i follows a long tradition of beautifully designed and crafted phones from Sony Ericsson. The same candy-bar style that graced the W800 is here, as is the horizontally-oriented camera unit on the back of the phone, allowing you to hold the phone j'),(30,4,86,0,3,'sony-ericsson-w810i'),(31,4,87,0,3,'sony-ericsson-w810i.html'),(32,4,97,0,3,'container2'),(33,4,100,0,3,''),(34,4,101,0,3,''),(35,4,102,0,3,''),(36,4,110,0,3,'2'),(37,4,74,0,3,'/s/o/sony-ericsson-w810i-2.jpg'),(38,4,75,0,3,'/s/o/sony-ericsson-w810i-2.jpg'),(39,4,76,0,3,'/s/o/sony-ericsson-w810i-2.jpg'),(40,4,60,0,4,'AT&T 8525 PDA'),(41,4,71,0,4,'AT&T 8525 PDA Phone'),(42,4,73,0,4,'nder the hood, the 8525 features 128MB of embedded memory and 64MB RAM, running on a 400 MHz Samsung processor. Up front, the 240 x 320 LCD touch-screen supports over 65,000 colors, while the rear of the device houses a 2.0 megapixel camera. The design of'),(43,4,86,0,4,'atandt-8525-pda'),(44,4,87,0,4,'atandt-8525-pda.html'),(45,4,97,0,4,'container2'),(46,4,100,0,4,''),(47,4,101,0,4,''),(48,4,102,0,4,''),(49,4,110,0,4,'2'),(50,4,74,0,4,'/a/t/at-t-8525-pda-1.jpg'),(51,4,75,0,4,'/a/t/at-t-8525-pda-1.jpg'),(52,4,76,0,4,'/a/t/at-t-8525-pda-1.jpg'),(53,4,60,0,5,'Samsung MM-A900M Ace'),(54,4,71,0,5,'Samsung MM-A900M Ace Phone'),(55,4,73,0,5,'New services supported by both the MM-A900m include the newly announced Sprint Music StoreSM, which allows users to immediately buy and download complete songs directly to their phone'),(56,4,86,0,5,'samsung-mm-a900m-ace'),(57,4,87,0,5,'samsung-mm-a900m-ace.html'),(58,4,97,0,5,'container2'),(59,4,100,0,5,''),(60,4,101,0,5,''),(61,4,102,0,5,''),(62,4,110,0,5,'2'),(63,4,74,0,5,'/s/a/samsung-mm-a900m-ace.jpg'),(64,4,75,0,5,'/s/a/samsung-mm-a900m-ace.jpg'),(65,4,76,0,5,'/s/a/samsung-mm-a900m-ace.jpg'),(66,4,60,0,6,'Apple MacBook Pro MA464LL/A 15.4\" Notebook PC'),(67,4,71,0,6,'Apple MacBook Pro MA464LL/A 15.4\" Notebook PC (2.0 GHz Intel Core Duo, 1 GB RAM, 100 GB Hard Drive, SuperDrive)'),(68,4,73,0,6,'Apple MacBook Pro MA464LL/A 15.4\" Notebook PC (2.0 GHz Intel Core Duo, 1 GB RAM, 100 GB Hard Drive, SuperDrive)'),(69,4,86,0,6,'apple-macbook-pro-ma464ll-a-15-4-notebook-pc-2-0-ghz-intel-core-duo-1-gb-ram-100-gb-hard-drive-superdrive'),(70,4,87,0,6,'apple-macbook-pro-ma464ll-a-15-4-notebook-pc-2-0-ghz-intel-core-duo-1-gb-ram-100-gb-hard-drive-superdrive.html'),(71,4,97,0,6,'container1'),(72,4,100,0,6,''),(73,4,101,0,6,''),(74,4,102,0,6,''),(75,4,110,0,6,'2'),(76,4,74,0,6,'/a/p/apple-macbook-pro-ma464ll-a-15-4-notebook-pc.jpg'),(77,4,75,0,6,'/a/p/apple-macbook-pro-ma464ll-a-15-4-notebook-pc.jpg'),(78,4,76,0,6,'/a/p/apple-macbook-pro-ma464ll-a-15-4-notebook-pc.jpg'),(79,4,60,0,7,'Acer Ferrari 3200 Notebook Computer PC'),(80,4,71,0,7,'Acer Ferrari 3200 Notebook Computer PC'),(81,4,73,0,7,'Acer Ferrari 3200 Notebook Computer PC'),(82,4,86,0,7,'acer-ferrari-3200-notebook-computer-pc'),(83,4,87,0,7,'acer-ferrari-3200-notebook-computer-pc.html'),(84,4,97,0,7,'container2'),(85,4,100,0,7,''),(86,4,101,0,7,''),(87,4,102,0,7,''),(88,4,110,0,7,'2'),(89,4,74,0,7,'/a/c/acer-ferrari-3200-notebook-computer-pc.jpg'),(90,4,75,0,7,'/a/c/acer-ferrari-3200-notebook-computer-pc.jpg'),(91,4,76,0,7,'/a/c/acer-ferrari-3200-notebook-computer-pc.jpg'),(92,4,60,0,8,'Sony VAIO VGN-TXN27N/B 11.1\" Notebook PC'),(93,4,71,0,8,'Sony VAIO VGN-TXN27N/B 11.1\" Notebook PC (Intel Core Solo Processor U1500, 2 GB RAM, 100 GB Hard Drive, DVD±RW Drive, Vista Business) Charcoal Black'),(94,4,73,0,8,'Sony VAIO VGN-TXN27N/B 11.1\" Notebook PC (Intel Core Solo Processor U1500, 2 GB RAM, 100 GB Hard Drive, DVD±RW Drive, Vista Business) Charcoal Black'),(95,4,86,0,8,'sony-vaio-vgn-txn27n-b-11-1-notebook-pc'),(96,4,87,0,8,'sony-vaio-vgn-txn27n-b-11-1-notebook-pc.html'),(97,4,97,0,8,'container2'),(98,4,100,0,8,''),(99,4,101,0,8,''),(100,4,102,0,8,''),(101,4,110,0,8,'2'),(102,4,74,0,8,'/s/o/sony-vaio-vgn-txn27n-b-11-1-notebook-pc.jpg'),(103,4,75,0,8,'/s/o/sony-vaio-vgn-txn27n-b-11-1-notebook-pc.jpg'),(104,4,76,0,8,'/s/o/sony-vaio-vgn-txn27n-b-11-1-notebook-pc.jpg'),(105,4,60,0,9,'Toshiba M285-E 14\"'),(106,4,71,0,9,'Toshiba Satellite A135-S4527 155.4\" Notebook PC (Intel Pentium Dual Core Processor T2080, 1 GB RAM, 120 GB Hard Drive, SuperMulti DVD Drive, Vista Premium)'),(107,4,73,0,9,'Toshiba M285-E 14\" Convertible Notebook PC (Intel Core Duo Processor T2300E, 1 GB RAM, 60'),(108,4,86,0,9,'toshiba-satellite-a135-s4527-155-4-notebook-pc-intel-pentium-dual-core-processor-t2080-1-gb-ram-120-gb-hard-drive-supermulti-dvd-drive-vista-premium'),(109,4,87,0,9,'toshiba-satellite-a135-s4527-155-4-notebook-pc-intel-pentium-dual-core-processor-t2080-1-gb-ram-120-gb-hard-drive-supermulti-dvd-drive-vista-premium.html'),(110,4,97,0,9,'container2'),(111,4,100,0,9,''),(112,4,101,0,9,''),(113,4,102,0,9,''),(114,4,110,0,9,'2'),(115,4,74,0,9,'/t/o/toshiba-m285-e-14.jpg'),(116,4,75,0,9,'/t/o/toshiba-m285-e-14.jpg'),(117,4,76,0,9,'/t/o/toshiba-m285-e-14.jpg'),(118,4,60,0,10,'CN Clogs Beach/Garden Clog'),(119,4,71,0,10,'CN Clogs Beach/Garden Clog'),(120,4,73,0,10,'CN Clogs Beach/Garden Clog'),(121,4,86,0,10,'cn-clogs-beach-garden-clog-3'),(122,4,87,0,10,'cn-clogs-beach-garden-clog-3.html'),(123,4,97,0,10,'container2'),(124,4,100,0,10,''),(125,4,101,0,10,''),(126,4,102,0,10,''),(127,4,110,0,10,'2'),(128,4,74,0,10,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(129,4,75,0,10,'/c/n/cn-clogs-beach-garden-clog-3.jpg'),(130,4,76,0,10,'/c/n/cn-clogs-beach-garden-clog-4.jpg'),(131,4,60,0,11,'ASICS® Men\'s GEL-Kayano® XII'),(132,4,71,0,11,'ASICS® Men\'s GEL-Kayano® XII'),(133,4,73,0,11,'ASICS® Men\'s GEL-Kayano® XII'),(134,4,86,0,11,'asics-men-s-gel-kayano-xii-8'),(135,4,87,0,11,'asics-men-s-gel-kayano-xii-8.html'),(136,4,97,0,11,'container2'),(137,4,100,0,11,''),(138,4,101,0,11,''),(139,4,102,0,11,''),(140,4,110,0,11,'2'),(141,4,60,0,12,'Steven by Steve Madden Pryme Pump'),(142,4,71,0,12,'Steven by Steve Madden Pryme Pump'),(143,4,73,0,12,'Steven by Steve Madden Pryme Pump'),(144,4,86,0,12,'steven-by-steve-madden-pryme-pump-4'),(145,4,87,0,12,'steven-by-steve-madden-pryme-pump-4.html'),(146,4,97,0,12,'container2'),(147,4,100,0,12,''),(148,4,101,0,12,''),(149,4,102,0,12,''),(150,4,110,0,12,'2'),(151,4,74,0,12,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(152,4,75,0,12,'/s/t/steven-by-steve-madden-pryme-pump-3.jpg'),(153,4,76,0,12,'/s/t/steven-by-steve-madden-pryme-pump-4.jpg'),(154,4,60,0,13,'Nine West Women\'s Lucero Pump'),(155,4,71,0,13,'Nine West Women\'s Lucero Pump'),(156,4,73,0,13,'Nine West Women\'s Lucero Pump'),(157,4,86,0,13,'nine-west-women-s-lucero-pump-3'),(158,4,87,0,13,'nine-west-women-s-lucero-pump-3.html'),(159,4,97,0,13,'container2'),(160,4,100,0,13,''),(161,4,101,0,13,''),(162,4,102,0,13,''),(163,4,110,0,13,'2'),(164,4,60,0,14,'ECCO Womens Golf Flexor Golf Shoe'),(165,4,71,0,14,'ECCO Womens Golf Flexor Golf Shoe'),(166,4,73,0,14,'ECCO Womens Golf Flexor Golf Shoe'),(167,4,86,0,14,'ecco-womens-golf-flexor-golf-shoe-3'),(168,4,87,0,14,'ecco-womens-golf-flexor-golf-shoe-3.html'),(169,4,97,0,14,'container2'),(170,4,100,0,14,''),(171,4,101,0,14,''),(172,4,102,0,14,''),(173,4,110,0,14,'2'),(174,4,74,0,14,'/e/c/ecco-womens-golf-flexor-golf-shoe-2.jpg'),(175,4,75,0,14,'/e/c/ecco-womens-golf-flexor-golf-shoe-3.jpg'),(176,4,76,0,14,'/e/c/ecco-womens-golf-flexor-golf-shoe-4.jpg'),(177,4,60,0,15,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(178,4,71,0,15,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(179,4,73,0,15,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(180,4,86,0,15,'kenneth-cole-new-york-men-s-con-verge-slip-on-8'),(181,4,87,0,15,'kenneth-cole-new-york-men-s-con-verge-slip-on-8.html'),(182,4,97,0,15,'container2'),(183,4,100,0,15,''),(184,4,101,0,15,''),(185,4,102,0,15,''),(186,4,110,0,15,'2'),(187,4,74,0,15,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-2.jpg'),(188,4,75,0,15,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-3.jpg'),(189,4,76,0,15,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-4.jpg'),(190,4,60,0,16,'Coalesce: Functioning On Impatience T-Shirt'),(191,4,71,0,16,'Coalesce: Functioning On Impatience T-Shirt'),(192,4,73,0,16,'Coalesce: Functioning On Impatience T-Shirt'),(193,4,86,0,16,'coalesce-functioning-on-impatience-t-shirt-small'),(194,4,87,0,16,'coalesce-functioning-on-impatience-t-shirt-small.html'),(195,4,97,0,16,'container2'),(196,4,100,0,16,''),(197,4,101,0,16,''),(198,4,102,0,16,''),(199,4,110,0,16,'2'),(200,4,60,0,17,'Ink Eater: Krylon Bombear Destroyed Tee'),(201,4,71,0,17,'Ink Eater: Krylon Bombear Destroyed Tee'),(202,4,73,0,17,'Ink Eater: Krylon Bombear Destroyed Tee'),(203,4,86,0,17,'ink-eater-krylon-bombear-destroyed-tee-sm'),(204,4,87,0,17,'ink-eater-krylon-bombear-destroyed-tee-sm.html'),(205,4,97,0,17,'container2'),(206,4,100,0,17,''),(207,4,101,0,17,''),(208,4,102,0,17,''),(209,4,110,0,17,'2'),(210,4,60,0,18,'The Only Children: Paisley T-Shirt'),(211,4,71,0,18,'The Only Children: Paisley T-Shirt'),(212,4,73,0,18,'The Only Children: Paisley T-Shirt'),(213,4,86,0,18,'the-only-children-paisley-t-shirt-sm'),(214,4,87,0,18,'the-only-children-paisley-t-shirt-sm.html'),(215,4,97,0,18,'container2'),(216,4,100,0,18,''),(217,4,101,0,18,''),(218,4,102,0,18,''),(219,4,110,0,18,'2'),(220,4,74,0,18,'/t/h/the-only-children-paisley-t-shirt-1.jpg'),(221,4,75,0,18,'/t/h/the-only-children-paisley-t-shirt-2.jpg'),(222,4,76,0,18,'/t/h/the-only-children-paisley-t-shirt-3.jpg'),(223,4,60,0,19,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(224,4,71,0,19,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(225,4,73,0,19,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(226,4,86,0,19,'zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-r-sm'),(227,4,87,0,19,'zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-r-sm.html'),(228,4,97,0,19,'container2'),(229,4,100,0,19,''),(230,4,101,0,19,''),(231,4,102,0,19,''),(232,4,110,0,19,'2'),(233,4,74,0,19,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(234,4,75,0,19,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(235,4,76,0,19,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-3.jpg'),(236,4,60,0,20,'The Get Up Kids: Band Camp Pullover Hoodie'),(237,4,71,0,20,'The Get Up Kids: Band Camp Pullover Hoodie'),(238,4,73,0,20,'The Get Up Kids: Band Camp Pullover Hoodie'),(239,4,86,0,20,'the-get-up-kids-band-camp-pullover-hoodie'),(240,4,87,0,20,'the-get-up-kids-band-camp-pullover-hoodie.html'),(241,4,97,0,20,'container2'),(242,4,100,0,20,''),(243,4,101,0,20,''),(244,4,102,0,20,''),(245,4,110,0,20,'2'),(246,4,74,0,20,'/t/h/the-get-up-kids-band-camp-pullover-hoodie-1.jpg'),(247,4,75,0,20,'/t/h/the-get-up-kids-band-camp-pullover-hoodie-1.jpg'),(248,4,76,0,20,'/t/h/the-get-up-kids-band-camp-pullover-hoodie-1.jpg'),(249,4,60,0,21,'Akio Dresser'),(250,4,71,0,21,'Akio Dresser'),(251,4,73,0,21,'Our Akio dresser has a solid hardwood frame.  Features include inset panel sides and for spacious drawers and two wicker baskets.'),(252,4,86,0,21,'akio-dresser'),(253,4,87,0,21,'akio-dresser.html'),(254,4,97,0,21,'container2'),(255,4,100,0,21,''),(256,4,101,0,21,''),(257,4,102,0,21,''),(258,4,110,0,21,'2'),(259,4,74,0,21,'/a/k/akio-dresser.jpg'),(260,4,75,0,21,'/a/k/akio-dresser.jpg'),(261,4,76,0,21,'/a/k/akio-dresser.jpg'),(262,4,60,0,22,'Barcelona Bamboo Platform Bed'),(263,4,71,0,22,'Barcelona Bamboo Platform Bed'),(264,4,73,0,22,'Our Barcelona platform bed captures the spirit and drama of late 20th century design with a variety of subtle details.'),(265,4,86,0,22,'barcelona-bamboo-platform-bed'),(266,4,87,0,22,'barcelona-bamboo-platform-bed.html'),(267,4,97,0,22,'container2'),(268,4,100,0,22,''),(269,4,101,0,22,''),(270,4,102,0,22,''),(271,4,110,0,22,'2'),(272,4,74,0,22,'/b/a/barcelona-bamboo-platform-bed.jpg'),(273,4,75,0,22,'/b/a/barcelona-bamboo-platform-bed.jpg'),(274,4,76,0,22,'/b/a/barcelona-bamboo-platform-bed.jpg'),(275,4,60,0,23,'Canon Digital Rebel XT 8MP Digital SLR Camera'),(276,4,71,0,23,'Canon Digital Rebel XT 8MP Digital SLR Camera with EF-S 18-55mm f3.5-5.6 Lens (Black)'),(277,4,73,0,23,'Canon Digital Rebel XT 8MP Digital SLR Camera with EF-S 18-55mm f3.5-5.6 Lens (Black)'),(278,4,86,0,23,'canon-digital-rebel-xt-8mp-digital-slr-camera-with-ef-s-18-55mm-f3-5-5-6-lens-black'),(279,4,87,0,23,'canon-digital-rebel-xt-8mp-digital-slr-camera-with-ef-s-18-55mm-f3-5-5-6-lens-black.html'),(280,4,97,0,23,'container2'),(281,4,100,0,23,''),(282,4,101,0,23,''),(283,4,102,0,23,''),(284,4,110,0,23,'2'),(285,4,74,0,23,'/c/a/canon-digital-rebel-xt-8mp-digital-slr-camera-1.jpg'),(286,4,75,0,23,'/c/a/canon-digital-rebel-xt-8mp-digital-slr-camera-1.jpg'),(287,4,76,0,23,'/c/a/canon-digital-rebel-xt-8mp-digital-slr-camera-1.jpg'),(288,4,60,0,24,' Argus QC-2185 Quick Click 5MP Digital Camera'),(289,4,71,0,24,'Argus QC-2185 Quick Click 2MP Digital Camera'),(290,4,73,0,24,'Argus QC-2185 Quick Click 2MP Digital Camera'),(291,4,86,0,24,'argus-qc-2185-quick-click-5mp-digital-camera'),(292,4,87,0,24,'argus-qc-2185-quick-click-5mp-digital-camera.html'),(293,4,97,0,24,'container2'),(294,4,100,0,24,''),(295,4,101,0,24,''),(296,4,102,0,24,''),(297,4,110,0,24,'2'),(298,4,74,0,24,'/a/r/argus-qc-2185-quick-click-5mp-digital-camera-2.jpg'),(299,4,75,0,24,'/a/r/argus-qc-2185-quick-click-5mp-digital-camera-2.jpg'),(300,4,76,0,24,'/a/r/argus-qc-2185-quick-click-5mp-digital-camera-2.jpg'),(301,4,60,0,25,' Olympus Stylus 750 7.1MP Digital Camera'),(302,4,71,0,25,'Olympus Stylus 750 7.1MP Digital Camera with Digital Image Stabilized 5x Optical Zoom and CCD Shift Stabilization (Silver)'),(303,4,73,0,25,'Olympus Stylus 750 7.1MP Digital Camera with Digital Image Stabilized 5x Optical Zoom and CCD Shift Stabilization (Silver)'),(304,4,86,0,25,'olympus-stylus-750-7-1mp-digital-camera'),(305,4,87,0,25,'olympus-stylus-750-7-1mp-digital-camera.html'),(306,4,97,0,25,'container2'),(307,4,100,0,25,''),(308,4,101,0,25,''),(309,4,102,0,25,''),(310,4,110,0,25,'2'),(311,4,74,0,25,'/o/l/olympus-stylus-750-7-1mp-digital-camera-2.jpg'),(312,4,75,0,25,'/o/l/olympus-stylus-750-7-1mp-digital-camera-2.jpg'),(313,4,76,0,25,'/o/l/olympus-stylus-750-7-1mp-digital-camera-2.jpg'),(314,4,60,0,26,'Canon PowerShot A630 8MP Digital Camera with 4x Optical Zoom'),(315,4,71,0,26,'Canon PowerShot A630 8MP Digital Camera with 4x Optical Zoom'),(316,4,73,0,26,'Canon PowerShot A630 8MP Digital Camera with 4x Optical Zoom'),(317,4,86,0,26,'canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom'),(318,4,87,0,26,'canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom.html'),(319,4,97,0,26,'container2'),(320,4,100,0,26,''),(321,4,101,0,26,''),(322,4,102,0,26,''),(323,4,110,0,26,'2'),(324,4,74,0,26,'/c/a/canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom-2.jpg'),(325,4,75,0,26,'/c/a/canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom-2.jpg'),(326,4,76,0,26,'/c/a/canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom-2.jpg'),(327,4,60,0,27,'Kodak EasyShare C530 5MP Digital Camera'),(328,4,71,0,27,'Kodak EasyShare C530 5MP Digital Camera'),(329,4,73,0,27,'Kodak EasyShare C530 5MP Digital Camera'),(330,4,86,0,27,'kodak-easyshare-c530-5mp-digital-camera'),(331,4,87,0,27,'kodak-easyshare-c530-5mp-digital-camera.html'),(332,4,97,0,27,'container2'),(333,4,100,0,27,''),(334,4,101,0,27,''),(335,4,102,0,27,''),(336,4,110,0,27,'2'),(337,4,74,0,27,'/k/o/kodak-easyshare-c530-5mp-digital-camera-2.jpg'),(338,4,75,0,27,'/k/o/kodak-easyshare-c530-5mp-digital-camera-2.jpg'),(339,4,76,0,27,'/k/o/kodak-easyshare-c530-5mp-digital-camera-2.jpg'),(340,4,60,0,28,'Anashria Womens Premier Leather Sandal'),(341,4,71,0,28,'Anashria Womens Premier Leather Sandal'),(342,4,73,0,28,'Anashria Womens Premier Leather Sandal'),(343,4,86,0,28,'anashria-womens-premier-leather-sandal-9'),(344,4,87,0,28,'anashria-womens-premier-leather-sandal-9.html'),(345,4,97,0,28,'container2'),(346,4,100,0,28,''),(347,4,101,0,28,''),(348,4,102,0,28,''),(349,4,110,0,28,'2'),(350,4,74,0,28,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(351,4,60,0,29,'Ottoman'),(352,4,71,0,29,'Ottoman'),(353,4,73,0,29,'Ottoman'),(354,4,86,0,29,'ottoman'),(355,4,87,0,29,'ottoman.html'),(356,4,97,0,29,'container2'),(357,4,100,0,29,''),(358,4,101,0,29,''),(359,4,102,0,29,''),(360,4,110,0,29,'2'),(361,4,74,0,29,'/o/t/ottoman.jpg'),(362,4,75,0,29,'/o/t/ottoman.jpg'),(363,4,76,0,29,'/o/t/ottoman.jpg'),(364,4,60,0,30,'Chair'),(365,4,71,0,30,'Chair'),(366,4,73,0,30,'Chair'),(367,4,86,0,30,'chair'),(368,4,87,0,30,'chair.html'),(369,4,97,0,30,'container2'),(370,4,100,0,30,''),(371,4,101,0,30,''),(372,4,102,0,30,''),(373,4,110,0,30,'2'),(374,4,74,0,30,'/c/h/chair.jpg'),(375,4,75,0,30,'/c/h/chair.jpg'),(376,4,76,0,30,'/c/h/chair.jpg'),(377,4,60,0,31,'Couch'),(378,4,71,0,31,'Couch'),(379,4,73,0,31,'Couch'),(380,4,86,0,31,'couch'),(381,4,87,0,31,'couch.html'),(382,4,97,0,31,'container2'),(383,4,100,0,31,''),(384,4,101,0,31,''),(385,4,102,0,31,''),(386,4,110,0,31,'2'),(387,4,74,0,31,'/c/o/couch.jpg'),(388,4,75,0,31,'/c/o/couch.jpg'),(389,4,76,0,31,'/c/o/couch.jpg'),(390,4,60,0,32,'Magento Red Furniture Set'),(391,4,71,0,32,'Magento Red Furniture Set'),(392,4,73,0,32,'Magento Red Furniture Set'),(393,4,86,0,32,'magento-red-furniture-set'),(394,4,87,0,32,'magento-red-furniture-set.html'),(395,4,97,0,32,'container2'),(396,4,100,0,32,''),(397,4,101,0,32,''),(398,4,102,0,32,''),(399,4,110,0,32,'2'),(400,4,74,0,32,'/m/a/magento-red-furniture-set.jpg'),(401,4,75,0,32,'/m/a/magento-red-furniture-set.jpg'),(402,4,76,0,32,'/m/a/magento-red-furniture-set.jpg'),(403,4,60,0,33,'Anashria Womens Premier Leather Sandal'),(404,4,71,0,33,'Anashria Womens Premier Leather Sandal'),(405,4,73,0,33,'Anashria Womens Premier Leather Sandal'),(406,4,86,0,33,'anashria-womens-premier-leather-sandal-3'),(407,4,87,0,33,'anashria-womens-premier-leather-sandal-3.html'),(408,4,97,0,33,'container2'),(409,4,100,0,33,''),(410,4,101,0,33,''),(411,4,102,0,33,''),(412,4,110,0,33,'2'),(413,4,74,0,33,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(414,4,75,0,33,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(415,4,76,0,33,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(416,4,60,0,34,'Anashria Womens Premier Leather Sandal'),(417,4,71,0,34,'Anashria Womens Premier Leather Sandal'),(418,4,73,0,34,'Anashria Womens Premier Leather Sandal'),(419,4,86,0,34,'anashria-womens-premier-leather-sandal-4'),(420,4,87,0,34,'anashria-womens-premier-leather-sandal-4.html'),(421,4,97,0,34,'container2'),(422,4,100,0,34,''),(423,4,101,0,34,''),(424,4,102,0,34,''),(425,4,110,0,34,'2'),(426,4,60,0,35,'Anashria Womens Premier Leather Sandal'),(427,4,71,0,35,'Anashria Womens Premier Leather Sandal'),(428,4,73,0,35,'Anashria Womens Premier Leather Sandal'),(429,4,86,0,35,'anashria-womens-premier-leather-sandal-5'),(430,4,87,0,35,'anashria-womens-premier-leather-sandal-5.html'),(431,4,97,0,35,'container2'),(432,4,100,0,35,''),(433,4,101,0,35,''),(434,4,102,0,35,''),(435,4,110,0,35,'2'),(436,4,75,0,35,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(437,4,60,0,36,'Anashria Womens Premier Leather Sandal'),(438,4,71,0,36,'Anashria Womens Premier Leather Sandal'),(439,4,73,0,36,'Anashria Womens Premier Leather Sandal'),(440,4,86,0,36,'anashria-womens-premier-leather-sandal-6'),(441,4,87,0,36,'anashria-womens-premier-leather-sandal-6.html'),(442,4,97,0,36,'container2'),(443,4,100,0,36,''),(444,4,101,0,36,''),(445,4,102,0,36,''),(446,4,110,0,36,'2'),(447,4,60,0,37,'Anashria Womens Premier Leather Sandal'),(448,4,71,0,37,'Anashria Womens Premier Leather Sandal'),(449,4,73,0,37,'Anashria Womens Premier Leather Sandal'),(450,4,86,0,37,'anashria-womens-premier-leather-sandal-7'),(451,4,87,0,37,'anashria-womens-premier-leather-sandal-7.html'),(452,4,97,0,37,'container2'),(453,4,100,0,37,''),(454,4,101,0,37,''),(455,4,102,0,37,''),(456,4,110,0,37,'2'),(457,4,60,0,38,'Anashria Womens Premier Leather Sandal'),(458,4,71,0,38,'Anashria Womens Premier Leather Sandal'),(459,4,73,0,38,'Anashria Womens Premier Leather Sandal'),(460,4,86,0,38,'anashria-womens-premier-leather-sandal-8'),(461,4,87,0,38,'anashria-womens-premier-leather-sandal-8.html'),(462,4,97,0,38,'container2'),(463,4,100,0,38,''),(464,4,101,0,38,''),(465,4,102,0,38,''),(466,4,110,0,38,'2'),(467,4,60,0,39,'CN Clogs Beach/Garden Clog'),(468,4,71,0,39,'CN Clogs Beach/Garden Clog'),(469,4,73,0,39,'CN Clogs Beach/Garden Clog'),(470,4,86,0,39,'cn-clogs-beach-garden-clog'),(471,4,87,0,39,'cn-clogs-beach-garden-clog.html'),(472,4,97,0,39,'container1'),(473,4,100,0,39,''),(474,4,101,0,39,''),(475,4,102,0,39,''),(476,4,110,0,39,'2'),(477,4,74,0,39,'/c/n/cn-clogs-beach-garden-clog.jpg'),(478,4,75,0,39,'/c/n/cn-clogs-beach-garden-clog.jpg'),(479,4,76,0,39,'/c/n/cn-clogs-beach-garden-clog.jpg'),(480,4,60,0,40,'CN Clogs Beach/Garden Clog'),(481,4,71,0,40,'CN Clogs Beach/Garden Clog'),(482,4,73,0,40,'CN Clogs Beach/Garden Clog'),(483,4,86,0,40,'cn-clogs-beach-garden-clog-4'),(484,4,87,0,40,'cn-clogs-beach-garden-clog-4.html'),(485,4,97,0,40,'container2'),(486,4,100,0,40,''),(487,4,101,0,40,''),(488,4,102,0,40,''),(489,4,110,0,40,'2'),(490,4,75,0,40,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(491,4,60,0,41,'CN Clogs Beach/Garden Clog'),(492,4,71,0,41,'CN Clogs Beach/Garden Clog'),(493,4,73,0,41,'CN Clogs Beach/Garden Clog'),(494,4,86,0,41,'cn-clogs-beach-garden-clog-5'),(495,4,87,0,41,'cn-clogs-beach-garden-clog-5.html'),(496,4,97,0,41,'container2'),(497,4,100,0,41,''),(498,4,101,0,41,''),(499,4,102,0,41,''),(500,4,110,0,41,'2'),(501,4,60,0,42,'CN Clogs Beach/Garden Clog'),(502,4,71,0,42,'CN Clogs Beach/Garden Clog'),(503,4,73,0,42,'CN Clogs Beach/Garden Clog'),(504,4,86,0,42,'cn-clogs-beach-garden-clog-6'),(505,4,87,0,42,'cn-clogs-beach-garden-clog-6.html'),(506,4,97,0,42,'container2'),(507,4,100,0,42,''),(508,4,101,0,42,''),(509,4,102,0,42,''),(510,4,110,0,42,'2'),(511,4,60,0,43,'CN Clogs Beach/Garden Clog'),(512,4,71,0,43,'CN Clogs Beach/Garden Clog'),(513,4,73,0,43,'CN Clogs Beach/Garden Clog'),(514,4,86,0,43,'cn-clogs-beach-garden-clog-7'),(515,4,87,0,43,'cn-clogs-beach-garden-clog-7.html'),(516,4,97,0,43,'container2'),(517,4,100,0,43,''),(518,4,101,0,43,''),(519,4,102,0,43,''),(520,4,110,0,43,'2'),(521,4,60,0,44,'CN Clogs Beach/Garden Clog'),(522,4,71,0,44,'CN Clogs Beach/Garden Clog'),(523,4,73,0,44,'CN Clogs Beach/Garden Clog'),(524,4,86,0,44,'cn-clogs-beach-garden-clog-8'),(525,4,87,0,44,'cn-clogs-beach-garden-clog-8.html'),(526,4,97,0,44,'container2'),(527,4,100,0,44,''),(528,4,101,0,44,''),(529,4,102,0,44,''),(530,4,110,0,44,'2'),(531,4,60,0,45,'CN Clogs Beach/Garden Clog'),(532,4,71,0,45,'CN Clogs Beach/Garden Clog'),(533,4,73,0,45,'CN Clogs Beach/Garden Clog'),(534,4,86,0,45,'cn-clogs-beach-garden-clog-9'),(535,4,87,0,45,'cn-clogs-beach-garden-clog-9.html'),(536,4,97,0,45,'container2'),(537,4,100,0,45,''),(538,4,101,0,45,''),(539,4,102,0,45,''),(540,4,110,0,45,'2'),(541,4,60,0,46,'CN Clogs Beach/Garden Clog'),(542,4,71,0,46,'CN Clogs Beach/Garden Clog'),(543,4,73,0,46,'CN Clogs Beach/Garden Clog'),(544,4,86,0,46,'cn-clogs-beach-garden-clog-10'),(545,4,87,0,46,'cn-clogs-beach-garden-clog-10.html'),(546,4,97,0,46,'container2'),(547,4,100,0,46,''),(548,4,101,0,46,''),(549,4,102,0,46,''),(550,4,110,0,46,'2'),(551,4,60,0,47,'CN Clogs Beach/Garden Clog'),(552,4,71,0,47,'CN Clogs Beach/Garden Clog'),(553,4,73,0,47,'CN Clogs Beach/Garden Clog'),(554,4,86,0,47,'cn-clogs-beach-garden-clog-11'),(555,4,87,0,47,'cn-clogs-beach-garden-clog-11.html'),(556,4,97,0,47,'container2'),(557,4,100,0,47,''),(558,4,101,0,47,''),(559,4,102,0,47,''),(560,4,110,0,47,'2'),(561,4,60,0,48,'CN Clogs Beach/Garden Clog'),(562,4,71,0,48,'CN Clogs Beach/Garden Clog'),(563,4,73,0,48,'CN Clogs Beach/Garden Clog'),(564,4,86,0,48,'cn-clogs-beach-garden-clog-12'),(565,4,87,0,48,'cn-clogs-beach-garden-clog-12.html'),(566,4,97,0,48,'container2'),(567,4,100,0,48,''),(568,4,101,0,48,''),(569,4,102,0,48,''),(570,4,110,0,48,'2'),(571,4,60,0,49,'ASICS® Men\'s GEL-Kayano® XII'),(572,4,71,0,49,'ASICS® Men\'s GEL-Kayano® XII'),(573,4,73,0,49,'ASICS® Men\'s GEL-Kayano® XII'),(574,4,86,0,49,'asics-men-s-gel-kayano-xii'),(575,4,87,0,49,'asics-men-s-gel-kayano-xii.html'),(576,4,97,0,49,'container1'),(577,4,100,0,49,''),(578,4,101,0,49,''),(579,4,102,0,49,''),(580,4,110,0,49,'2'),(581,4,74,0,49,'/a/s/asics-men-s-gel-kayano-xii-2.jpg'),(582,4,75,0,49,'/a/s/asics-men-s-gel-kayano-xii-2.jpg'),(583,4,76,0,49,'/a/s/asics-men-s-gel-kayano-xii-2.jpg'),(584,4,60,0,50,'ASICS® Men\'s GEL-Kayano® XII'),(585,4,71,0,50,'ASICS® Men\'s GEL-Kayano® XII'),(586,4,73,0,50,'ASICS® Men\'s GEL-Kayano® XII'),(587,4,86,0,50,'asics-men-s-gel-kayano-xii-9'),(588,4,87,0,50,'asics-men-s-gel-kayano-xii-9.html'),(589,4,97,0,50,'container2'),(590,4,100,0,50,''),(591,4,101,0,50,''),(592,4,102,0,50,''),(593,4,110,0,50,'2');
/*!40000 ALTER TABLE `catalog_product_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_flat_1`
--

DROP TABLE IF EXISTS `catalog_product_flat_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_flat_1` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple',
  `cost` decimal(12,4) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enable_googlecheckout` tinyint(1) DEFAULT NULL,
  `gift_message_available` tinyint(1) DEFAULT NULL,
  `has_options` smallint(6) NOT NULL DEFAULT '0',
  `image_label` varchar(255) DEFAULT NULL,
  `is_imported` tinyint(1) DEFAULT NULL,
  `is_recurring` tinyint(1) DEFAULT NULL,
  `links_exist` int(11) DEFAULT NULL,
  `links_purchased_separately` int(11) DEFAULT NULL,
  `links_title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `news_from_date` datetime DEFAULT NULL,
  `news_to_date` datetime DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `price_type` int(11) DEFAULT NULL,
  `price_view` int(11) DEFAULT NULL,
  `recurring_profile` text,
  `required_options` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `shipment_type` int(11) DEFAULT NULL,
  `short_description` text,
  `sku` varchar(64) DEFAULT NULL,
  `sku_type` int(11) DEFAULT NULL,
  `small_image` varchar(255) DEFAULT NULL,
  `small_image_label` varchar(255) DEFAULT NULL,
  `special_from_date` datetime DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_to_date` datetime DEFAULT NULL,
  `tax_class_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `thumbnail_label` varchar(255) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `url_key` varchar(255) DEFAULT NULL,
  `url_path` varchar(255) DEFAULT NULL,
  `visibility` tinyint(3) unsigned DEFAULT NULL,
  `volume_altura` int(11) DEFAULT NULL,
  `volume_comprimento` int(11) DEFAULT NULL,
  `volume_largura` int(11) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `weight_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_TYPE_ID` (`type_id`),
  KEY `IDX_ATRRIBUTE_SET` (`attribute_set_id`),
  KEY `IDX_NAME` (`name`),
  KEY `IDX_PRICE` (`price`),
  CONSTRAINT `FK_CATALOG_PRODUCT_FLAT_1_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_flat_1`
--

LOCK TABLES `catalog_product_flat_1` WRITE;
/*!40000 ALTER TABLE `catalog_product_flat_1` DISABLE KEYS */;
INSERT INTO `catalog_product_flat_1` VALUES (1,4,'simple','20.0000','2011-06-30 01:41:27',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Nokia 2610 Phone',NULL,NULL,'149.9900',NULL,NULL,NULL,0,NULL,'The words \"entry level\" no longer mean \"low-end,\" especially when it comes to the Nokia 2610. Offering advanced media and calling features without breaking the bank','n2610',NULL,'/n/o/nokia-2610-phone-2.jpg','',NULL,NULL,NULL,2,'/n/o/nokia-2610-phone-2.jpg','','2011-06-30 01:41:27','nokia-2610-phone','nokia-2610-phone.html',4,NULL,NULL,NULL,'3.2000',NULL),(2,4,'simple','29.9900','2011-06-30 01:41:28',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'BlackBerry 8100 Pearl',NULL,NULL,'349.9900',NULL,NULL,NULL,0,NULL,'The BlackBerry 8100 Pearl is a departure from the form factor of previous BlackBerry devices. This BlackBerry handset is far more phone-like, and RIM\'s engineers have managed to fit a QWERTY keyboard onto the handset\'s slim frame.','bb8100',NULL,'/b/l/blackberry-8100-pearl-2.jpg','',NULL,NULL,NULL,2,'/b/l/blackberry-8100-pearl-2.jpg','','2011-06-30 01:41:28','blackberry-8100-pearl','blackberry-8100-pearl.html',4,NULL,NULL,NULL,'15.2000',NULL),(3,4,'simple','29.9900','2011-06-30 01:41:29',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Sony Ericsson W810i',NULL,NULL,'399.9900',NULL,NULL,NULL,0,NULL,'The W810i follows a long tradition of beautifully designed and crafted phones from Sony Ericsson. The same candy-bar style that graced the W800 is here.','sw810i',NULL,'/s/o/sony-ericsson-w810i-2.jpg','',NULL,NULL,NULL,2,'/s/o/sony-ericsson-w810i-2.jpg','','2011-06-30 01:41:29','sony-ericsson-w810i','sony-ericsson-w810i.html',4,NULL,NULL,NULL,'13.6000',NULL),(4,4,'simple','29.9900','2011-06-30 01:41:33',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'AT&T 8525 PDA',NULL,NULL,'199.9900',NULL,NULL,NULL,0,NULL,'Under the hood, the 8525 features 128MB of embedded memory and 64MB RAM, running on a 400 MHz Samsung processor. Up front, the 240 x 320 LCD touch-screen supports over 65,000 colors, while the rear of the device houses a 2.0 megapixel camera.','8525PDA',NULL,'/a/t/at-t-8525-pda-1.jpg','',NULL,NULL,NULL,2,'/a/t/at-t-8525-pda-1.jpg','','2011-06-30 01:41:33','atandt-8525-pda','atandt-8525-pda.html',4,NULL,NULL,NULL,'30.0000',NULL),(5,4,'simple','29.9900','2011-06-30 01:41:34',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Samsung MM-A900M Ace',NULL,NULL,'150.0000',NULL,NULL,NULL,0,NULL,'The MM-A900m offers great-looking design with the ability to download a rich selection of content directly to the phone. ','MM-A900M',NULL,'/s/a/samsung-mm-a900m-ace.jpg','',NULL,NULL,NULL,2,'/s/a/samsung-mm-a900m-ace.jpg','','2011-06-30 01:41:34','samsung-mm-a900m-ace','samsung-mm-a900m-ace.html',4,NULL,NULL,NULL,'1.0000',NULL),(6,4,'simple','1299.9900','2011-06-30 01:41:35',1,2,1,'',NULL,NULL,NULL,NULL,NULL,'Apple MacBook Pro MA464LL/A 15.4\" Notebook PC',NULL,NULL,'2299.9900',NULL,NULL,NULL,0,NULL,'You\'ve seen improvements in notebook performance before - but never on this scale. The Intel Core Duo powering MacBook Pro is actually two processors built into a single chip.','MA464LL/A',NULL,'/a/p/apple-macbook-pro-ma464ll-a-15-4-notebook-pc.jpg','',NULL,NULL,NULL,2,'/a/p/apple-macbook-pro-ma464ll-a-15-4-notebook-pc.jpg','','2011-06-30 01:41:35','apple-macbook-pro-ma464ll-a-15-4-notebook-pc-2-0-ghz-intel-core-duo-1-gb-ram-100-gb-hard-drive-superdrive','apple-macbook-pro-ma464ll-a-15-4-notebook-pc-2-0-ghz-intel-core-duo-1-gb-ram-100-gb-hard-drive-superdrive.html',4,NULL,NULL,NULL,'10.6000',NULL),(7,4,'simple','999.9900','2011-06-30 01:41:37',1,2,1,'',NULL,NULL,NULL,NULL,NULL,'Acer Ferrari 3200 Notebook Computer PC',NULL,NULL,'1799.9900',NULL,NULL,NULL,0,NULL,'This exclusive edition is another striking symbol of cooperation between Acer and Ferrari -- two progressive companies with proud heritages built on passion, innovation, power and success','LX.FR206.001',NULL,'/a/c/acer-ferrari-3200-notebook-computer-pc.jpg','',NULL,NULL,NULL,2,'/a/c/acer-ferrari-3200-notebook-computer-pc.jpg','','2011-06-30 01:41:37','acer-ferrari-3200-notebook-computer-pc','acer-ferrari-3200-notebook-computer-pc.html',4,NULL,NULL,NULL,'11.4000',NULL),(8,4,'simple','899.9900','2011-06-30 01:41:39',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Sony VAIO VGN-TXN27N/B 11.1\" Notebook PC',NULL,NULL,'2699.9900',NULL,NULL,NULL,0,NULL,'Take a load off your shoulders when you\'re racing for your plane with the sleekly designed and ultra-portable Sony Vaio VGN-TXN27N/B notebook PC.','VGN-TXN27N/B',NULL,'/s/o/sony-vaio-vgn-txn27n-b-11-1-notebook-pc.jpg','',NULL,NULL,NULL,2,'/s/o/sony-vaio-vgn-txn27n-b-11-1-notebook-pc.jpg','','2011-06-30 01:41:39','sony-vaio-vgn-txn27n-b-11-1-notebook-pc','sony-vaio-vgn-txn27n-b-11-1-notebook-pc.html',4,NULL,NULL,NULL,'2.8000',NULL),(9,4,'simple','899.9900','2011-06-30 01:41:42',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Toshiba M285-E 14\"',NULL,NULL,'1599.9900',NULL,NULL,NULL,0,NULL,'Get the competitive edge with the Gateway M285-E. This widescreen Convertible Notebook functions as both a conventional notebook and a tablet.','M285-E',NULL,'/t/o/toshiba-m285-e-14.jpg','',NULL,NULL,NULL,2,'/t/o/toshiba-m285-e-14.jpg','','2011-06-30 01:41:42','toshiba-satellite-a135-s4527-155-4-notebook-pc-intel-pentium-dual-core-processor-t2080-1-gb-ram-120-gb-hard-drive-supermulti-dvd-drive-vista-premium','toshiba-satellite-a135-s4527-155-4-notebook-pc-intel-pentium-dual-core-processor-t2080-1-gb-ram-120-gb-hard-drive-supermulti-dvd-drive-vista-premium.html',4,NULL,NULL,NULL,'10.0000',NULL),(10,4,'simple','1.0000','2011-06-30 01:41:43',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'CN Clogs Beach/Garden Clog',NULL,NULL,'15.9900',NULL,NULL,NULL,0,NULL,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear','cn_3',NULL,'/c/n/cn-clogs-beach-garden-clog-3.jpg','',NULL,NULL,NULL,2,'/c/n/cn-clogs-beach-garden-clog-4.jpg','','2011-06-30 01:41:43','cn-clogs-beach-garden-clog-3','cn-clogs-beach-garden-clog-3.html',1,NULL,NULL,NULL,'1.0000',NULL),(11,4,'simple','29.9900','2011-06-30 01:41:46',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'ASICS® Men\'s GEL-Kayano® XII',NULL,NULL,'134.9900',NULL,NULL,NULL,0,NULL,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. ','asc_8',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:41:46','asics-men-s-gel-kayano-xii-8','asics-men-s-gel-kayano-xii-8.html',1,NULL,NULL,NULL,'3.0000',NULL),(12,4,'simple','29.9900','2011-06-30 01:41:48',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Steven by Steve Madden Pryme Pump',NULL,NULL,'69.9900',NULL,NULL,NULL,0,NULL,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe','steve_4',NULL,'/s/t/steven-by-steve-madden-pryme-pump-3.jpg','',NULL,NULL,NULL,2,'/s/t/steven-by-steve-madden-pryme-pump-4.jpg','','2011-06-30 01:41:48','steven-by-steve-madden-pryme-pump-4','steven-by-steve-madden-pryme-pump-4.html',1,NULL,NULL,NULL,'2.0000',NULL),(13,4,'simple','29.9900','2011-06-30 01:41:50',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Nine West Women\'s Lucero Pump',NULL,NULL,'89.9900',NULL,NULL,NULL,0,NULL,'The Lucero pump from Nine West may just leave him at a loss for words. This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp','nine_3',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:41:50','nine-west-women-s-lucero-pump-3','nine-west-women-s-lucero-pump-3.html',1,NULL,NULL,NULL,'2.0000',NULL),(14,4,'simple','29.9900','2011-06-30 01:41:51',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'ECCO Womens Golf Flexor Golf Shoe',NULL,NULL,'159.9900',NULL,NULL,NULL,0,NULL,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links.','ecco_3',NULL,'/e/c/ecco-womens-golf-flexor-golf-shoe-3.jpg','',NULL,NULL,NULL,2,'/e/c/ecco-womens-golf-flexor-golf-shoe-4.jpg','','2011-06-30 01:41:51','ecco-womens-golf-flexor-golf-shoe-3','ecco-womens-golf-flexor-golf-shoe-3.html',1,NULL,NULL,NULL,'4.0000',NULL),(15,4,'simple','29.9900','2011-06-30 01:41:52',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Kenneth Cole New York Men\'s Con-verge Slip-on',NULL,NULL,'160.9900',NULL,NULL,NULL,0,NULL,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue','ken_8',NULL,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-3.jpg','',NULL,NULL,NULL,2,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-4.jpg','','2011-06-30 01:41:52','kenneth-cole-new-york-men-s-con-verge-slip-on-8','kenneth-cole-new-york-men-s-con-verge-slip-on-8.html',1,NULL,NULL,NULL,'2.0000',NULL),(16,4,'simple','2.0000','2011-06-30 01:41:53',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Coalesce: Functioning On Impatience T-Shirt',NULL,NULL,'15.0000',NULL,NULL,NULL,0,NULL,'# 6.1 oz. 100% preshrunk heavyweight cotton \n# Shoulder-to-shoulder taping\n# Double-needle sleeves and bottom hem','coal_sm',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:41:53','coalesce-functioning-on-impatience-t-shirt-small','coalesce-functioning-on-impatience-t-shirt-small.html',1,NULL,NULL,NULL,'0.5000',NULL),(17,4,'simple','2.0000','2011-06-30 01:41:54',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Ink Eater: Krylon Bombear Destroyed Tee',NULL,NULL,'22.0000',NULL,NULL,NULL,0,NULL,'We bought these with the intention of making shirts for our family reunion, only to come back the next day to find each and every one of them had been tagged by The Bear.  Oh well -- can\'t argue with art.  Now you can make your grandparents proud by wearing an original piece of graf work to YOUR family reunion!','ink_sm',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:41:54','ink-eater-krylon-bombear-destroyed-tee-sm','ink-eater-krylon-bombear-destroyed-tee-sm.html',1,NULL,NULL,NULL,'0.5000',NULL),(18,4,'simple','2.0000','2011-06-30 01:41:55',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'The Only Children: Paisley T-Shirt',NULL,NULL,'15.0000',NULL,NULL,NULL,0,NULL,'Printed on American Apparel Classic style 5495 California cotton T shirst.   ','oc_sm',NULL,'/t/h/the-only-children-paisley-t-shirt-2.jpg','',NULL,NULL,NULL,2,'/t/h/the-only-children-paisley-t-shirt-3.jpg','','2011-06-30 01:41:55','the-only-children-paisley-t-shirt-sm','the-only-children-paisley-t-shirt-sm.html',1,NULL,NULL,NULL,'0.4400',NULL),(19,4,'simple','2.0000','2011-06-30 01:41:56',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt',NULL,NULL,'13.5000',NULL,NULL,NULL,0,NULL,'Printed on American Apparel Classic style 5495 California t-shirts.  ','zol_r_sm',NULL,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg','',NULL,NULL,NULL,2,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-3.jpg','','2011-06-30 01:41:56','zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-r-sm','zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-r-sm.html',1,NULL,NULL,NULL,'0.4400',NULL),(20,4,'simple','5.0000','2011-06-30 01:41:57',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'The Get Up Kids: Band Camp Pullover Hoodie',NULL,NULL,'30.0000',NULL,NULL,NULL,0,NULL,'Printed on American Apparel Classic style 5495 California Fleece Pull-Over Hoodies.  ','4fasd5f5',NULL,'/t/h/the-get-up-kids-band-camp-pullover-hoodie-1.jpg','',NULL,NULL,NULL,2,'/t/h/the-get-up-kids-band-camp-pullover-hoodie-1.jpg','','2011-06-30 01:41:57','the-get-up-kids-band-camp-pullover-hoodie','the-get-up-kids-band-camp-pullover-hoodie.html',4,NULL,NULL,NULL,'1.7500',NULL),(21,4,'simple','100.0000','2011-06-30 01:41:58',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Akio Dresser',NULL,NULL,'399.9900',NULL,NULL,NULL,0,NULL,'Our Akio dresser has a solid hardwood frame.  ','384822',NULL,'/a/k/akio-dresser.jpg','',NULL,NULL,NULL,2,'/a/k/akio-dresser.jpg','','2011-06-30 01:41:58','akio-dresser','akio-dresser.html',4,NULL,NULL,NULL,'128.9700',NULL),(22,4,'simple','800.0000','2011-06-30 01:41:59',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Barcelona Bamboo Platform Bed',NULL,NULL,'2299.0000',NULL,NULL,NULL,0,NULL,'Our Barcelona platform bed captures the spirit and drama of late 20th century design with a variety of subtle details.','bar1234',NULL,'/b/a/barcelona-bamboo-platform-bed.jpg','',NULL,NULL,NULL,2,'/b/a/barcelona-bamboo-platform-bed.jpg','','2011-06-30 01:41:59','barcelona-bamboo-platform-bed','barcelona-bamboo-platform-bed.html',4,NULL,NULL,NULL,'150.0000',NULL),(23,4,'simple','200.0000','2011-06-30 01:42:00',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Canon Digital Rebel XT 8MP Digital SLR Camera',NULL,NULL,'550.0000',NULL,NULL,NULL,0,NULL,' Canon EOS Digital Rebel XT SLR adds resolution, speed, extra creative control, and enhanced comfort in the hand to one of the smallest and lightest digital cameras in its class. ','Rebel XT',NULL,'/c/a/canon-digital-rebel-xt-8mp-digital-slr-camera-1.jpg','',NULL,NULL,NULL,2,'/c/a/canon-digital-rebel-xt-8mp-digital-slr-camera-1.jpg','','2011-06-30 01:42:00','canon-digital-rebel-xt-8mp-digital-slr-camera-with-ef-s-18-55mm-f3-5-5-6-lens-black','canon-digital-rebel-xt-8mp-digital-slr-camera-with-ef-s-18-55mm-f3-5-5-6-lens-black.html',4,NULL,NULL,NULL,'4.0000',NULL),(24,4,'simple','20.0000','2011-06-30 01:42:02',1,2,0,'',NULL,NULL,NULL,NULL,NULL,' Argus QC-2185 Quick Click 5MP Digital Camera',NULL,NULL,'37.4900',NULL,NULL,NULL,0,NULL,'The Argus QC-2185 Quick Click 5MP digital camera offers all the basic features you need in a compact and stylish digital camera. This unit is easy to use, and is perfect for those who want a completely portable option for taking good pictures, without having to empty their wallet.','QC-2185',NULL,'/a/r/argus-qc-2185-quick-click-5mp-digital-camera-2.jpg','',NULL,NULL,NULL,2,'/a/r/argus-qc-2185-quick-click-5mp-digital-camera-2.jpg','','2011-06-30 01:42:02','argus-qc-2185-quick-click-5mp-digital-camera','argus-qc-2185-quick-click-5mp-digital-camera.html',4,NULL,NULL,NULL,'1.0000',NULL),(25,4,'simple','29.9900','2011-06-30 01:42:03',1,2,0,'',NULL,NULL,NULL,NULL,NULL,' Olympus Stylus 750 7.1MP Digital Camera',NULL,NULL,'161.9400',NULL,NULL,NULL,0,NULL,'A technically sophisticated point-and-shoot camera offering a number of pioneering technologies such as Dual Image Stabilization, Bright Capture Technology, and TruePic Turbo, as well as a powerful 5x optical zoom.','750',NULL,'/o/l/olympus-stylus-750-7-1mp-digital-camera-2.jpg','',NULL,NULL,NULL,2,'/o/l/olympus-stylus-750-7-1mp-digital-camera-2.jpg','','2011-06-30 01:42:03','olympus-stylus-750-7-1mp-digital-camera','olympus-stylus-750-7-1mp-digital-camera.html',4,NULL,NULL,NULL,'2.0000',NULL),(26,4,'simple','29.9900','2011-06-30 01:42:04',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Canon PowerShot A630 8MP Digital Camera with 4x Optical Zoom',NULL,NULL,'329.9900',NULL,NULL,NULL,0,NULL,'Replacing the highly popular PowerShot A620, the PowerShot A630 features a rotating 2.5-inch vari-angle LCD, 4x optical zoom lens, and a vast array of creative shooting modes.','A630',NULL,'/c/a/canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom-2.jpg','',NULL,NULL,NULL,2,'/c/a/canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom-2.jpg','','2011-06-30 01:42:04','canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom','canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom.html',4,NULL,NULL,NULL,'3.0000',NULL),(27,4,'simple','29.9900','2011-06-30 01:42:05',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Kodak EasyShare C530 5MP Digital Camera',NULL,NULL,'199.9900',NULL,NULL,NULL,0,NULL,'Small on size. Big on value. Kodak\'s newest C-Series digital camera, the C530, sports awesome features','C530',NULL,'/k/o/kodak-easyshare-c530-5mp-digital-camera-2.jpg','',NULL,NULL,NULL,2,'/k/o/kodak-easyshare-c530-5mp-digital-camera-2.jpg','','2011-06-30 01:42:05','kodak-easyshare-c530-5mp-digital-camera','kodak-easyshare-c530-5mp-digital-camera.html',4,NULL,NULL,NULL,'2.0000',NULL),(28,4,'simple','10.0000','2011-06-30 01:42:06',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Anashria Womens Premier Leather Sandal',NULL,NULL,'41.9500',NULL,NULL,NULL,0,NULL,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.','ana_9',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:06','anashria-womens-premier-leather-sandal-9','anashria-womens-premier-leather-sandal-9.html',1,NULL,NULL,NULL,'2.0000',NULL),(29,4,'simple','50.0000','2011-06-30 01:42:07',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Ottoman',NULL,NULL,'299.9900',NULL,NULL,NULL,0,NULL,'With durable solid wood framing, generous padding and plush stain-resistant microfiber upholstery.','1111',NULL,'/o/t/ottoman.jpg','',NULL,NULL,NULL,2,'/o/t/ottoman.jpg','','2011-06-30 01:42:07','ottoman','ottoman.html',4,NULL,NULL,NULL,'20.0000',NULL),(30,4,'simple','50.0000','2011-06-30 01:42:08',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Chair',NULL,NULL,'129.9900',NULL,NULL,NULL,0,NULL,'Combining a hint of nostalgia with the up-to-date sensibility and function of modern chairs. It is in soft, velvety microfiber.','1112',NULL,'/c/h/chair.jpg','',NULL,NULL,NULL,2,'/c/h/chair.jpg','','2011-06-30 01:42:08','chair','chair.html',4,NULL,NULL,NULL,'50.0000',NULL),(31,4,'simple','200.0000','2011-06-30 01:42:09',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Couch',NULL,NULL,'599.9900',NULL,NULL,NULL,0,NULL,'For a sleek, simple and stylish piece, look no further than the Magento sofa - or sofabed!','1113',NULL,'/c/o/couch.jpg','',NULL,NULL,NULL,2,'/c/o/couch.jpg','','2011-06-30 01:42:09','couch','couch.html',4,NULL,NULL,NULL,'200.0000',NULL),(32,4,'grouped',NULL,'2011-06-30 01:42:10',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Magento Red Furniture Set',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'Love red?  You\'ll love these pieces of handmade modern furniture!','1114',NULL,'/m/a/magento-red-furniture-set.jpg','',NULL,NULL,NULL,NULL,'/m/a/magento-red-furniture-set.jpg','','2011-06-30 01:42:10','magento-red-furniture-set','magento-red-furniture-set.html',4,NULL,NULL,NULL,NULL,NULL),(33,4,'simple','10.0000','2011-06-30 01:42:10',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Anashria Womens Premier Leather Sandal',NULL,NULL,'41.9500',NULL,NULL,NULL,0,NULL,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.','ana_3',NULL,'/a/n/anashria-womens-premier-leather-sandal.jpg','',NULL,NULL,NULL,2,'/a/n/anashria-womens-premier-leather-sandal.jpg','','2011-06-30 01:42:10','anashria-womens-premier-leather-sandal-3','anashria-womens-premier-leather-sandal-3.html',1,NULL,NULL,NULL,'2.0000',NULL),(34,4,'simple','10.0000','2011-06-30 01:42:12',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Anashria Womens Premier Leather Sandal',NULL,NULL,'41.9500',NULL,NULL,NULL,0,NULL,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.','ana_4',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:12','anashria-womens-premier-leather-sandal-4','anashria-womens-premier-leather-sandal-4.html',1,NULL,NULL,NULL,'2.0000',NULL),(35,4,'simple','10.0000','2011-06-30 01:42:13',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Anashria Womens Premier Leather Sandal',NULL,NULL,'41.9500',NULL,NULL,NULL,0,NULL,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.','ana_5',NULL,'/a/n/anashria-womens-premier-leather-sandal-1.jpg','',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:13','anashria-womens-premier-leather-sandal-5','anashria-womens-premier-leather-sandal-5.html',1,NULL,NULL,NULL,'2.0000',NULL),(36,4,'simple','10.0000','2011-06-30 01:42:13',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Anashria Womens Premier Leather Sandal',NULL,NULL,'41.9500',NULL,NULL,NULL,0,NULL,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.','ana_6',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:13','anashria-womens-premier-leather-sandal-6','anashria-womens-premier-leather-sandal-6.html',1,NULL,NULL,NULL,'2.0000',NULL),(37,4,'simple','10.0000','2011-06-30 01:42:14',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Anashria Womens Premier Leather Sandal',NULL,NULL,'41.9500',NULL,NULL,NULL,0,NULL,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.','ana_7',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:14','anashria-womens-premier-leather-sandal-7','anashria-womens-premier-leather-sandal-7.html',1,NULL,NULL,NULL,'2.0000',NULL),(38,4,'simple','10.0000','2011-06-30 01:42:15',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'Anashria Womens Premier Leather Sandal',NULL,NULL,'41.9500',NULL,NULL,NULL,0,NULL,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.','ana_8',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:15','anashria-womens-premier-leather-sandal-8','anashria-womens-premier-leather-sandal-8.html',1,NULL,NULL,NULL,'2.0000',NULL),(39,4,'configurable',NULL,'2011-06-30 01:42:16',1,2,1,'',NULL,NULL,NULL,NULL,NULL,'CN Clogs Beach/Garden Clog',NULL,NULL,'15.9900',NULL,NULL,NULL,0,NULL,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear','cn',NULL,'/c/n/cn-clogs-beach-garden-clog.jpg','',NULL,NULL,NULL,2,'/c/n/cn-clogs-beach-garden-clog.jpg','','2011-06-30 01:42:16','cn-clogs-beach-garden-clog','cn-clogs-beach-garden-clog.html',4,NULL,NULL,NULL,NULL,NULL),(40,4,'simple','1.0000','2011-06-30 01:42:18',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'CN Clogs Beach/Garden Clog',NULL,NULL,'15.9900',NULL,NULL,NULL,0,NULL,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear','cn_4',NULL,'/c/n/cn-clogs-beach-garden-clog-1.jpg','',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:18','cn-clogs-beach-garden-clog-4','cn-clogs-beach-garden-clog-4.html',1,NULL,NULL,NULL,'1.0000',NULL),(41,4,'simple','1.0000','2011-06-30 01:42:19',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'CN Clogs Beach/Garden Clog',NULL,NULL,'15.9900',NULL,NULL,NULL,0,NULL,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear','cn_5',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:19','cn-clogs-beach-garden-clog-5','cn-clogs-beach-garden-clog-5.html',1,NULL,NULL,NULL,'1.0000',NULL),(42,4,'simple','1.0000','2011-06-30 01:42:20',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'CN Clogs Beach/Garden Clog',NULL,NULL,'15.9900',NULL,NULL,NULL,0,NULL,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear','cn_6',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:20','cn-clogs-beach-garden-clog-6','cn-clogs-beach-garden-clog-6.html',1,NULL,NULL,NULL,'1.0000',NULL),(43,4,'simple','1.0000','2011-06-30 01:42:21',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'CN Clogs Beach/Garden Clog',NULL,NULL,'15.9900',NULL,NULL,NULL,0,NULL,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear','cn_7',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:21','cn-clogs-beach-garden-clog-7','cn-clogs-beach-garden-clog-7.html',1,NULL,NULL,NULL,'1.0000',NULL),(44,4,'simple','1.0000','2011-06-30 01:42:22',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'CN Clogs Beach/Garden Clog',NULL,NULL,'15.9900',NULL,NULL,NULL,0,NULL,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear','cn_m8',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:22','cn-clogs-beach-garden-clog-8','cn-clogs-beach-garden-clog-8.html',1,NULL,NULL,NULL,'1.0000',NULL),(45,4,'simple','1.0000','2011-06-30 01:42:23',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'CN Clogs Beach/Garden Clog',NULL,NULL,'15.9900',NULL,NULL,NULL,0,NULL,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear','cn_m9',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:23','cn-clogs-beach-garden-clog-9','cn-clogs-beach-garden-clog-9.html',1,NULL,NULL,NULL,'1.0000',NULL),(46,4,'simple','1.0000','2011-06-30 01:42:24',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'CN Clogs Beach/Garden Clog',NULL,NULL,'15.9900',NULL,NULL,NULL,0,NULL,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear','cn_m10',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:24','cn-clogs-beach-garden-clog-10','cn-clogs-beach-garden-clog-10.html',1,NULL,NULL,NULL,'1.0000',NULL),(47,4,'simple','1.0000','2011-06-30 01:42:26',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'CN Clogs Beach/Garden Clog',NULL,NULL,'15.9900',NULL,NULL,NULL,0,NULL,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear','cn_m11',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:26','cn-clogs-beach-garden-clog-11','cn-clogs-beach-garden-clog-11.html',1,NULL,NULL,NULL,'1.0000',NULL),(48,4,'simple','1.0000','2011-06-30 01:42:26',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'CN Clogs Beach/Garden Clog',NULL,NULL,'15.9900',NULL,NULL,NULL,0,NULL,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear','cn_m12',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:26','cn-clogs-beach-garden-clog-12','cn-clogs-beach-garden-clog-12.html',1,NULL,NULL,NULL,'1.0000',NULL),(49,4,'configurable',NULL,'2011-06-30 01:42:27',1,2,1,'',NULL,NULL,NULL,NULL,NULL,'ASICS® Men\'s GEL-Kayano® XII',NULL,NULL,'134.9900',NULL,NULL,NULL,0,NULL,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. ','asc',NULL,'/a/s/asics-men-s-gel-kayano-xii-2.jpg','',NULL,NULL,NULL,2,'/a/s/asics-men-s-gel-kayano-xii-2.jpg','','2011-06-30 01:42:27','asics-men-s-gel-kayano-xii','asics-men-s-gel-kayano-xii.html',4,NULL,NULL,NULL,NULL,NULL),(50,4,'simple','29.9900','2011-06-30 01:42:28',1,2,0,'',NULL,NULL,NULL,NULL,NULL,'ASICS® Men\'s GEL-Kayano® XII',NULL,NULL,'134.9900',NULL,NULL,NULL,0,NULL,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. ','asc_9',NULL,NULL,'',NULL,NULL,NULL,2,NULL,'','2011-06-30 01:42:28','asics-men-s-gel-kayano-xii-9','asics-men-s-gel-kayano-xii-9.html',1,NULL,NULL,NULL,'3.0000',NULL);
/*!40000 ALTER TABLE `catalog_product_flat_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav`
--

DROP TABLE IF EXISTS `catalog_product_index_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav`
--

LOCK TABLES `catalog_product_index_eav` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav` DISABLE KEYS */;
INSERT INTO `catalog_product_index_eav` VALUES (1,85,1,2),(2,85,1,2),(3,85,1,2),(4,85,1,2),(5,85,1,2),(6,85,1,2),(7,85,1,2),(8,85,1,2),(9,85,1,2),(20,85,1,2),(21,85,1,2),(22,85,1,2),(23,85,1,2),(24,85,1,2),(25,85,1,2),(26,85,1,2),(27,85,1,2),(29,85,1,2),(30,85,1,2),(31,85,1,2);
/*!40000 ALTER TABLE `catalog_product_index_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal`
--

LOCK TABLES `catalog_product_index_eav_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_idx`
--

LOCK TABLES `catalog_product_index_eav_decimal_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_tmp`
--

LOCK TABLES `catalog_product_index_eav_decimal_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_idx`
--

LOCK TABLES `catalog_product_index_eav_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_idx` DISABLE KEYS */;
INSERT INTO `catalog_product_index_eav_idx` VALUES (1,85,1,2),(2,85,1,2),(3,85,1,2),(4,85,1,2),(5,85,1,2),(6,85,1,2),(7,85,1,2),(8,85,1,2),(9,85,1,2),(20,85,1,2),(21,85,1,2),(22,85,1,2),(23,85,1,2),(24,85,1,2),(25,85,1,2),(26,85,1,2),(27,85,1,2),(29,85,1,2),(30,85,1,2),(31,85,1,2);
/*!40000 ALTER TABLE `catalog_product_index_eav_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_tmp`
--

LOCK TABLES `catalog_product_index_eav_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price`
--

DROP TABLE IF EXISTS `catalog_product_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `final_price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_MIN_PRICE` (`min_price`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price`
--

LOCK TABLES `catalog_product_index_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price` DISABLE KEYS */;
INSERT INTO `catalog_product_index_price` VALUES (1,0,1,2,'149.9900','149.9900','149.9900','149.9900',NULL),(1,1,1,2,'149.9900','149.9900','149.9900','149.9900',NULL),(1,2,1,2,'149.9900','149.9900','149.9900','149.9900',NULL),(1,3,1,2,'149.9900','149.9900','149.9900','149.9900',NULL),(2,0,1,2,'349.9900','349.9900','349.9900','349.9900',NULL),(2,1,1,2,'349.9900','349.9900','349.9900','349.9900',NULL),(2,2,1,2,'349.9900','349.9900','349.9900','349.9900',NULL),(2,3,1,2,'349.9900','349.9900','349.9900','349.9900',NULL),(3,0,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(3,1,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(3,2,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(3,3,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(4,0,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(4,1,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(4,2,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(4,3,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(5,0,1,2,'150.0000','150.0000','150.0000','150.0000',NULL),(5,1,1,2,'150.0000','150.0000','150.0000','150.0000',NULL),(5,2,1,2,'150.0000','150.0000','150.0000','150.0000',NULL),(5,3,1,2,'150.0000','150.0000','150.0000','150.0000',NULL),(6,0,1,2,'2299.9900','2299.9900','2299.9900','2299.9900',NULL),(6,1,1,2,'2299.9900','2299.9900','2299.9900','2299.9900',NULL),(6,2,1,2,'2299.9900','2299.9900','2299.9900','2299.9900',NULL),(6,3,1,2,'2299.9900','2299.9900','2299.9900','2299.9900',NULL),(7,0,1,2,'1799.9900','1799.9900','1799.9900','1799.9900',NULL),(7,1,1,2,'1799.9900','1799.9900','1799.9900','1799.9900',NULL),(7,2,1,2,'1799.9900','1799.9900','1799.9900','1799.9900',NULL),(7,3,1,2,'1799.9900','1799.9900','1799.9900','1799.9900',NULL),(8,0,1,2,'2699.9900','2699.9900','2699.9900','2699.9900',NULL),(8,1,1,2,'2699.9900','2699.9900','2699.9900','2699.9900',NULL),(8,2,1,2,'2699.9900','2699.9900','2699.9900','2699.9900',NULL),(8,3,1,2,'2699.9900','2699.9900','2699.9900','2699.9900',NULL),(9,0,1,2,'1599.9900','1599.9900','1599.9900','1599.9900',NULL),(9,1,1,2,'1599.9900','1599.9900','1599.9900','1599.9900',NULL),(9,2,1,2,'1599.9900','1599.9900','1599.9900','1599.9900',NULL),(9,3,1,2,'1599.9900','1599.9900','1599.9900','1599.9900',NULL),(10,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(10,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(10,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(10,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(11,0,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(11,1,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(11,2,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(11,3,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(12,0,1,2,'69.9900','69.9900','69.9900','69.9900',NULL),(12,1,1,2,'69.9900','69.9900','69.9900','69.9900',NULL),(12,2,1,2,'69.9900','69.9900','69.9900','69.9900',NULL),(12,3,1,2,'69.9900','69.9900','69.9900','69.9900',NULL),(13,0,1,2,'89.9900','89.9900','89.9900','89.9900',NULL),(13,1,1,2,'89.9900','89.9900','89.9900','89.9900',NULL),(13,2,1,2,'89.9900','89.9900','89.9900','89.9900',NULL),(13,3,1,2,'89.9900','89.9900','89.9900','89.9900',NULL),(14,0,1,2,'159.9900','159.9900','159.9900','159.9900',NULL),(14,1,1,2,'159.9900','159.9900','159.9900','159.9900',NULL),(14,2,1,2,'159.9900','159.9900','159.9900','159.9900',NULL),(14,3,1,2,'159.9900','159.9900','159.9900','159.9900',NULL),(15,0,1,2,'160.9900','160.9900','160.9900','160.9900',NULL),(15,1,1,2,'160.9900','160.9900','160.9900','160.9900',NULL),(15,2,1,2,'160.9900','160.9900','160.9900','160.9900',NULL),(15,3,1,2,'160.9900','160.9900','160.9900','160.9900',NULL),(16,0,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(16,1,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(16,2,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(16,3,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(18,0,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(18,1,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(18,2,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(18,3,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(19,0,1,2,'13.5000','13.5000','13.5000','13.5000',NULL),(19,1,1,2,'13.5000','13.5000','13.5000','13.5000',NULL),(19,2,1,2,'13.5000','13.5000','13.5000','13.5000',NULL),(19,3,1,2,'13.5000','13.5000','13.5000','13.5000',NULL),(20,0,1,2,'30.0000','30.0000','30.0000','30.0000',NULL),(20,1,1,2,'30.0000','30.0000','30.0000','30.0000',NULL),(20,2,1,2,'30.0000','30.0000','30.0000','30.0000',NULL),(20,3,1,2,'30.0000','30.0000','30.0000','30.0000',NULL),(21,0,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(21,1,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(21,2,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(21,3,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(22,0,1,2,'2299.0000','2299.0000','2299.0000','2299.0000',NULL),(22,1,1,2,'2299.0000','2299.0000','2299.0000','2299.0000',NULL),(22,2,1,2,'2299.0000','2299.0000','2299.0000','2299.0000',NULL),(22,3,1,2,'2299.0000','2299.0000','2299.0000','2299.0000',NULL),(23,0,1,2,'550.0000','550.0000','550.0000','550.0000',NULL),(23,1,1,2,'550.0000','550.0000','550.0000','550.0000',NULL),(23,2,1,2,'550.0000','550.0000','550.0000','550.0000',NULL),(23,3,1,2,'550.0000','550.0000','550.0000','550.0000',NULL),(24,0,1,2,'37.4900','37.4900','37.4900','37.4900',NULL),(24,1,1,2,'37.4900','37.4900','37.4900','37.4900',NULL),(24,2,1,2,'37.4900','37.4900','37.4900','37.4900',NULL),(24,3,1,2,'37.4900','37.4900','37.4900','37.4900',NULL),(25,0,1,2,'161.9400','161.9400','161.9400','161.9400',NULL),(25,1,1,2,'161.9400','161.9400','161.9400','161.9400',NULL),(25,2,1,2,'161.9400','161.9400','161.9400','161.9400',NULL),(25,3,1,2,'161.9400','161.9400','161.9400','161.9400',NULL),(26,0,1,2,'329.9900','329.9900','329.9900','329.9900',NULL),(26,1,1,2,'329.9900','329.9900','329.9900','329.9900',NULL),(26,2,1,2,'329.9900','329.9900','329.9900','329.9900',NULL),(26,3,1,2,'329.9900','329.9900','329.9900','329.9900',NULL),(27,0,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(27,1,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(27,2,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(27,3,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(28,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(28,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(28,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(28,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(29,0,1,2,'299.9900','299.9900','299.9900','299.9900',NULL),(29,1,1,2,'299.9900','299.9900','299.9900','299.9900',NULL),(29,2,1,2,'299.9900','299.9900','299.9900','299.9900',NULL),(29,3,1,2,'299.9900','299.9900','299.9900','299.9900',NULL),(30,0,1,2,'129.9900','129.9900','129.9900','129.9900',NULL),(30,1,1,2,'129.9900','129.9900','129.9900','129.9900',NULL),(30,2,1,2,'129.9900','129.9900','129.9900','129.9900',NULL),(30,3,1,2,'129.9900','129.9900','129.9900','129.9900',NULL),(31,0,1,2,'599.9900','599.9900','599.9900','599.9900',NULL),(31,1,1,2,'599.9900','599.9900','599.9900','599.9900',NULL),(31,2,1,2,'599.9900','599.9900','599.9900','599.9900',NULL),(31,3,1,2,'599.9900','599.9900','599.9900','599.9900',NULL),(33,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(33,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(33,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(33,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(34,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(34,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(34,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(34,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(35,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(35,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(35,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(35,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(36,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(36,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(36,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(36,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(37,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(37,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(37,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(37,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(38,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(38,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(38,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(38,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(40,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(40,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(40,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(40,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(41,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(41,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(41,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(41,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(42,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(42,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(42,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(42,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(43,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(43,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(43,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(43,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(44,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(44,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(44,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(44,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(45,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(45,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(45,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(45,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(46,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(46,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(46,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(46,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(47,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(47,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(47,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(47,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(48,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(48,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(48,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(48,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(50,0,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(50,1,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(50,2,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(50,3,1,2,'134.9900','134.9900','134.9900','134.9900',NULL);
/*!40000 ALTER TABLE `catalog_product_index_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `price_type` tinyint(1) unsigned NOT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `tier_percent` decimal(12,4) DEFAULT NULL,
  `orig_price` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  `base_tier` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `min_price` decimal(12,4) DEFAULT NULL,
  `alt_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  `alt_tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_opt_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `min_price` decimal(12,4) DEFAULT NULL,
  `alt_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  `alt_tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_type` tinyint(1) unsigned DEFAULT '0',
  `is_required` tinyint(1) unsigned DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_sel_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_sel_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_type` tinyint(1) unsigned DEFAULT '0',
  `is_required` tinyint(1) unsigned DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_sel_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_sel_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `price_type` tinyint(1) unsigned NOT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `tier_percent` decimal(12,4) DEFAULT NULL,
  `orig_price` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  `base_tier` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_agr_idx`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_idx`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_downlod_idx`
--

LOCK TABLES `catalog_product_index_price_downlod_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_downlod_tmp`
--

LOCK TABLES `catalog_product_index_price_downlod_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `orig_price` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  `base_tier` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_final_idx`
--

LOCK TABLES `catalog_product_index_price_final_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_final_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_final_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `orig_price` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  `base_tier` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_final_tmp`
--

LOCK TABLES `catalog_product_index_price_final_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_final_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_final_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `final_price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_idx`
--

LOCK TABLES `catalog_product_index_price_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_idx` DISABLE KEYS */;
INSERT INTO `catalog_product_index_price_idx` VALUES (1,0,1,2,'149.9900','149.9900','149.9900','149.9900',NULL),(1,1,1,2,'149.9900','149.9900','149.9900','149.9900',NULL),(1,2,1,2,'149.9900','149.9900','149.9900','149.9900',NULL),(1,3,1,2,'149.9900','149.9900','149.9900','149.9900',NULL),(2,0,1,2,'349.9900','349.9900','349.9900','349.9900',NULL),(2,1,1,2,'349.9900','349.9900','349.9900','349.9900',NULL),(2,2,1,2,'349.9900','349.9900','349.9900','349.9900',NULL),(2,3,1,2,'349.9900','349.9900','349.9900','349.9900',NULL),(3,0,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(3,1,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(3,2,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(3,3,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(4,0,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(4,1,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(4,2,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(4,3,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(5,0,1,2,'150.0000','150.0000','150.0000','150.0000',NULL),(5,1,1,2,'150.0000','150.0000','150.0000','150.0000',NULL),(5,2,1,2,'150.0000','150.0000','150.0000','150.0000',NULL),(5,3,1,2,'150.0000','150.0000','150.0000','150.0000',NULL),(6,0,1,2,'2299.9900','2299.9900','2299.9900','2299.9900',NULL),(6,1,1,2,'2299.9900','2299.9900','2299.9900','2299.9900',NULL),(6,2,1,2,'2299.9900','2299.9900','2299.9900','2299.9900',NULL),(6,3,1,2,'2299.9900','2299.9900','2299.9900','2299.9900',NULL),(7,0,1,2,'1799.9900','1799.9900','1799.9900','1799.9900',NULL),(7,1,1,2,'1799.9900','1799.9900','1799.9900','1799.9900',NULL),(7,2,1,2,'1799.9900','1799.9900','1799.9900','1799.9900',NULL),(7,3,1,2,'1799.9900','1799.9900','1799.9900','1799.9900',NULL),(8,0,1,2,'2699.9900','2699.9900','2699.9900','2699.9900',NULL),(8,1,1,2,'2699.9900','2699.9900','2699.9900','2699.9900',NULL),(8,2,1,2,'2699.9900','2699.9900','2699.9900','2699.9900',NULL),(8,3,1,2,'2699.9900','2699.9900','2699.9900','2699.9900',NULL),(9,0,1,2,'1599.9900','1599.9900','1599.9900','1599.9900',NULL),(9,1,1,2,'1599.9900','1599.9900','1599.9900','1599.9900',NULL),(9,2,1,2,'1599.9900','1599.9900','1599.9900','1599.9900',NULL),(9,3,1,2,'1599.9900','1599.9900','1599.9900','1599.9900',NULL),(10,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(10,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(10,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(10,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(11,0,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(11,1,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(11,2,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(11,3,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(12,0,1,2,'69.9900','69.9900','69.9900','69.9900',NULL),(12,1,1,2,'69.9900','69.9900','69.9900','69.9900',NULL),(12,2,1,2,'69.9900','69.9900','69.9900','69.9900',NULL),(12,3,1,2,'69.9900','69.9900','69.9900','69.9900',NULL),(13,0,1,2,'89.9900','89.9900','89.9900','89.9900',NULL),(13,1,1,2,'89.9900','89.9900','89.9900','89.9900',NULL),(13,2,1,2,'89.9900','89.9900','89.9900','89.9900',NULL),(13,3,1,2,'89.9900','89.9900','89.9900','89.9900',NULL),(14,0,1,2,'159.9900','159.9900','159.9900','159.9900',NULL),(14,1,1,2,'159.9900','159.9900','159.9900','159.9900',NULL),(14,2,1,2,'159.9900','159.9900','159.9900','159.9900',NULL),(14,3,1,2,'159.9900','159.9900','159.9900','159.9900',NULL),(15,0,1,2,'160.9900','160.9900','160.9900','160.9900',NULL),(15,1,1,2,'160.9900','160.9900','160.9900','160.9900',NULL),(15,2,1,2,'160.9900','160.9900','160.9900','160.9900',NULL),(15,3,1,2,'160.9900','160.9900','160.9900','160.9900',NULL),(16,0,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(16,1,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(16,2,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(16,3,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(18,0,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(18,1,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(18,2,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(18,3,1,2,'15.0000','15.0000','15.0000','15.0000',NULL),(19,0,1,2,'13.5000','13.5000','13.5000','13.5000',NULL),(19,1,1,2,'13.5000','13.5000','13.5000','13.5000',NULL),(19,2,1,2,'13.5000','13.5000','13.5000','13.5000',NULL),(19,3,1,2,'13.5000','13.5000','13.5000','13.5000',NULL),(20,0,1,2,'30.0000','30.0000','30.0000','30.0000',NULL),(20,1,1,2,'30.0000','30.0000','30.0000','30.0000',NULL),(20,2,1,2,'30.0000','30.0000','30.0000','30.0000',NULL),(20,3,1,2,'30.0000','30.0000','30.0000','30.0000',NULL),(21,0,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(21,1,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(21,2,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(21,3,1,2,'399.9900','399.9900','399.9900','399.9900',NULL),(22,0,1,2,'2299.0000','2299.0000','2299.0000','2299.0000',NULL),(22,1,1,2,'2299.0000','2299.0000','2299.0000','2299.0000',NULL),(22,2,1,2,'2299.0000','2299.0000','2299.0000','2299.0000',NULL),(22,3,1,2,'2299.0000','2299.0000','2299.0000','2299.0000',NULL),(23,0,1,2,'550.0000','550.0000','550.0000','550.0000',NULL),(23,1,1,2,'550.0000','550.0000','550.0000','550.0000',NULL),(23,2,1,2,'550.0000','550.0000','550.0000','550.0000',NULL),(23,3,1,2,'550.0000','550.0000','550.0000','550.0000',NULL),(24,0,1,2,'37.4900','37.4900','37.4900','37.4900',NULL),(24,1,1,2,'37.4900','37.4900','37.4900','37.4900',NULL),(24,2,1,2,'37.4900','37.4900','37.4900','37.4900',NULL),(24,3,1,2,'37.4900','37.4900','37.4900','37.4900',NULL),(25,0,1,2,'161.9400','161.9400','161.9400','161.9400',NULL),(25,1,1,2,'161.9400','161.9400','161.9400','161.9400',NULL),(25,2,1,2,'161.9400','161.9400','161.9400','161.9400',NULL),(25,3,1,2,'161.9400','161.9400','161.9400','161.9400',NULL),(26,0,1,2,'329.9900','329.9900','329.9900','329.9900',NULL),(26,1,1,2,'329.9900','329.9900','329.9900','329.9900',NULL),(26,2,1,2,'329.9900','329.9900','329.9900','329.9900',NULL),(26,3,1,2,'329.9900','329.9900','329.9900','329.9900',NULL),(27,0,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(27,1,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(27,2,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(27,3,1,2,'199.9900','199.9900','199.9900','199.9900',NULL),(28,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(28,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(28,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(28,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(29,0,1,2,'299.9900','299.9900','299.9900','299.9900',NULL),(29,1,1,2,'299.9900','299.9900','299.9900','299.9900',NULL),(29,2,1,2,'299.9900','299.9900','299.9900','299.9900',NULL),(29,3,1,2,'299.9900','299.9900','299.9900','299.9900',NULL),(30,0,1,2,'129.9900','129.9900','129.9900','129.9900',NULL),(30,1,1,2,'129.9900','129.9900','129.9900','129.9900',NULL),(30,2,1,2,'129.9900','129.9900','129.9900','129.9900',NULL),(30,3,1,2,'129.9900','129.9900','129.9900','129.9900',NULL),(31,0,1,2,'599.9900','599.9900','599.9900','599.9900',NULL),(31,1,1,2,'599.9900','599.9900','599.9900','599.9900',NULL),(31,2,1,2,'599.9900','599.9900','599.9900','599.9900',NULL),(31,3,1,2,'599.9900','599.9900','599.9900','599.9900',NULL),(33,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(33,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(33,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(33,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(34,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(34,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(34,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(34,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(35,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(35,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(35,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(35,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(36,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(36,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(36,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(36,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(37,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(37,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(37,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(37,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(38,0,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(38,1,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(38,2,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(38,3,1,2,'41.9500','41.9500','41.9500','41.9500',NULL),(40,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(40,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(40,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(40,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(41,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(41,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(41,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(41,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(42,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(42,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(42,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(42,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(43,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(43,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(43,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(43,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(44,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(44,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(44,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(44,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(45,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(45,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(45,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(45,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(46,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(46,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(46,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(46,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(47,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(47,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(47,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(47,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(48,0,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(48,1,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(48,2,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(48,3,1,2,'15.9900','15.9900','15.9900','15.9900',NULL),(50,0,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(50,1,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(50,2,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(50,3,1,2,'134.9900','134.9900','134.9900','134.9900',NULL);
/*!40000 ALTER TABLE `catalog_product_index_price_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_agr_idx`
--

LOCK TABLES `catalog_product_index_price_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_agr_tmp`
--

LOCK TABLES `catalog_product_index_price_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_idx`
--

LOCK TABLES `catalog_product_index_price_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `final_price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_tmp`
--

LOCK TABLES `catalog_product_index_price_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_tmp` DISABLE KEYS */;
INSERT INTO `catalog_product_index_price_tmp` VALUES (50,0,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(50,1,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(50,2,1,2,'134.9900','134.9900','134.9900','134.9900',NULL),(50,3,1,2,'134.9900','134.9900','134.9900','134.9900',NULL);
/*!40000 ALTER TABLE `catalog_product_index_price_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_index_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER` (`customer_group_id`),
  KEY `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_tier_price`
--

LOCK TABLES `catalog_product_index_tier_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_website`
--

DROP TABLE IF EXISTS `catalog_product_index_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `rate` float(12,4) unsigned DEFAULT '1.0000',
  PRIMARY KEY (`website_id`),
  KEY `IDX_DATE` (`date`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_website`
--

LOCK TABLES `catalog_product_index_website` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_website` DISABLE KEYS */;
INSERT INTO `catalog_product_index_website` VALUES (1,'2011-06-29',1.0000);
/*!40000 ALTER TABLE `catalog_product_index_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link`
--

DROP TABLE IF EXISTS `catalog_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link` (
  `link_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `link_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `IDX_UNIQUE` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `FK_LINK_PRODUCT` (`product_id`),
  KEY `FK_LINKED_PRODUCT` (`linked_product_id`),
  KEY `FK_PRODUCT_LINK_TYPE` (`link_type_id`),
  CONSTRAINT `FK_PRODUCT_LINK_LINKED_PRODUCT` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_LINK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_LINK_TYPE` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Related products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link`
--

LOCK TABLES `catalog_product_link` WRITE;
/*!40000 ALTER TABLE `catalog_product_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `link_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `product_link_attribute_code` varchar(32) NOT NULL DEFAULT '',
  `data_type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `FK_ATTRIBUTE_PRODUCT_LINK_TYPE` (`link_type_id`),
  CONSTRAINT `FK_ATTRIBUTE_PRODUCT_LINK_TYPE` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Attributes for product link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute`
--

LOCK TABLES `catalog_product_link_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute` DISABLE KEYS */;
INSERT INTO `catalog_product_link_attribute` VALUES (1,2,'qty','decimal'),(2,1,'position','int'),(3,4,'position','int'),(4,5,'position','int'),(6,1,'qty','decimal'),(7,3,'position','int'),(8,3,'qty','decimal');
/*!40000 ALTER TABLE `catalog_product_link_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_link_attribute_id` smallint(6) unsigned DEFAULT NULL,
  `link_id` int(11) unsigned DEFAULT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  KEY `FK_DECIMAL_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_DECIMAL_LINK` (`link_id`),
  CONSTRAINT `FK_DECIMAL_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DECIMAL_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Decimal attributes values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_decimal`
--

LOCK TABLES `catalog_product_link_attribute_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_link_attribute_id` smallint(6) unsigned DEFAULT NULL,
  `link_id` int(11) unsigned DEFAULT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  KEY `FK_INT_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_INT_PRODUCT_LINK` (`link_id`),
  CONSTRAINT `FK_INT_PRODUCT_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_INT_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_int`
--

LOCK TABLES `catalog_product_link_attribute_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_link_attribute_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `link_id` int(11) unsigned DEFAULT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  KEY `FK_VARCHAR_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_VARCHAR_LINK` (`link_id`),
  CONSTRAINT `FK_VARCHAR_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_VARCHAR_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varchar attributes values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_varchar`
--

LOCK TABLES `catalog_product_link_attribute_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_type`
--

DROP TABLE IF EXISTS `catalog_product_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_type` (
  `link_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Types of product link(Related, superproduct, bundles)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_type`
--

LOCK TABLES `catalog_product_link_type` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_type` DISABLE KEYS */;
INSERT INTO `catalog_product_link_type` VALUES (1,'relation'),(2,'bundle'),(3,'super'),(4,'up_sell'),(5,'cross_sell');
/*!40000 ALTER TABLE `catalog_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option`
--

DROP TABLE IF EXISTS `catalog_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `is_require` tinyint(1) NOT NULL DEFAULT '1',
  `sku` varchar(64) NOT NULL DEFAULT '',
  `max_characters` int(10) unsigned DEFAULT NULL,
  `file_extension` varchar(50) DEFAULT NULL,
  `image_size_x` smallint(5) unsigned NOT NULL,
  `image_size_y` smallint(5) unsigned NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option`
--

LOCK TABLES `catalog_product_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_price`
--

DROP TABLE IF EXISTS `catalog_product_option_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION` (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_price`
--

LOCK TABLES `catalog_product_option_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_title`
--

DROP TABLE IF EXISTS `catalog_product_option_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION` (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_title`
--

LOCK TABLES `catalog_product_option_title` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `catalog_product_option_type_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `UNQ_OPTION_TYPE_STORE` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE` (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_price`
--

LOCK TABLES `catalog_product_option_type_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `catalog_product_option_type_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `UNQ_OPTION_TYPE_STORE` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION` (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_title`
--

LOCK TABLES `catalog_product_option_type_title` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `catalog_product_option_type_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sku` varchar(64) NOT NULL DEFAULT '',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION` (`option_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_value`
--

LOCK TABLES `catalog_product_option_type_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_relation`
--

DROP TABLE IF EXISTS `catalog_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `IDX_CHILD` (`child_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_RELATION_CHILD` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_RELATION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_relation`
--

LOCK TABLES `catalog_product_relation` WRITE;
/*!40000 ALTER TABLE `catalog_product_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_super_attribute_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_PRODUCT` (`product_id`),
  CONSTRAINT `FK_SUPER_PRODUCT_ATTRIBUTE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute`
--

LOCK TABLES `catalog_product_super_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `use_default` tinyint(1) unsigned DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ATTRIBUTE_STORE` (`product_super_attribute_id`,`store_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_LABEL` (`product_super_attribute_id`),
  KEY `FK_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PROD_SUPER_ATTR_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PROD_SUPER_ATTR_LABEL_ATTR` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute_label`
--

LOCK TABLES `catalog_product_super_attribute_label` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute_pricing`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute_pricing` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value_index` varchar(255) NOT NULL DEFAULT '',
  `is_percent` tinyint(1) unsigned DEFAULT '0',
  `pricing_value` decimal(10,4) DEFAULT NULL,
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_PRICING` (`product_super_attribute_id`),
  KEY `FK_CATALOG_PRODUCT_SUPER_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_SUPER_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SUPER_PRODUCT_ATTRIBUTE_PRICING` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute_pricing`
--

LOCK TABLES `catalog_product_super_attribute_pricing` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_link`
--

DROP TABLE IF EXISTS `catalog_product_super_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`link_id`),
  KEY `FK_SUPER_PRODUCT_LINK_PARENT` (`parent_id`),
  KEY `FK_catalog_product_super_link` (`product_id`),
  CONSTRAINT `FK_SUPER_PRODUCT_LINK_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SUPER_PRODUCT_LINK_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_link`
--

LOCK TABLES `catalog_product_super_link` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_website`
--

DROP TABLE IF EXISTS `catalog_product_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_WEBSITE_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_website`
--

LOCK TABLES `catalog_product_website` WRITE;
/*!40000 ALTER TABLE `catalog_product_website` DISABLE KEYS */;
INSERT INTO `catalog_product_website` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1);
/*!40000 ALTER TABLE `catalog_product_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogindex_aggregation`
--

DROP TABLE IF EXISTS `catalogindex_aggregation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_aggregation` (
  `aggregation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `data` mediumtext,
  PRIMARY KEY (`aggregation_id`),
  UNIQUE KEY `IDX_STORE_KEY` (`store_id`,`key`),
  CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogindex_aggregation`
--

LOCK TABLES `catalogindex_aggregation` WRITE;
/*!40000 ALTER TABLE `catalogindex_aggregation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_aggregation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogindex_aggregation_tag`
--

DROP TABLE IF EXISTS `catalogindex_aggregation_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_aggregation_tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_code` varchar(255) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `IDX_CODE` (`tag_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogindex_aggregation_tag`
--

LOCK TABLES `catalogindex_aggregation_tag` WRITE;
/*!40000 ALTER TABLE `catalogindex_aggregation_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_aggregation_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogindex_aggregation_to_tag`
--

DROP TABLE IF EXISTS `catalogindex_aggregation_to_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_aggregation_to_tag` (
  `aggregation_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `IDX_AGGREGATION_TAG` (`aggregation_id`,`tag_id`),
  KEY `FK_CATALOGINDEX_AGGREGATION_TO_TAG_TAG` (`tag_id`),
  CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_TO_TAG_AGGREGATION` FOREIGN KEY (`aggregation_id`) REFERENCES `catalogindex_aggregation` (`aggregation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_TO_TAG_TAG` FOREIGN KEY (`tag_id`) REFERENCES `catalogindex_aggregation_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogindex_aggregation_to_tag`
--

LOCK TABLES `catalogindex_aggregation_to_tag` WRITE;
/*!40000 ALTER TABLE `catalogindex_aggregation_to_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_aggregation_to_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogindex_eav`
--

DROP TABLE IF EXISTS `catalogindex_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_eav` (
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`store_id`,`entity_id`,`attribute_id`,`value`),
  KEY `IDX_VALUE` (`value`),
  KEY `FK_CATALOGINDEX_EAV_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_EAV_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOGINDEX_EAV_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOGINDEX_EAV_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_EAV_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_EAV_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogindex_eav`
--

LOCK TABLES `catalogindex_eav` WRITE;
/*!40000 ALTER TABLE `catalogindex_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogindex_minimal_price`
--

DROP TABLE IF EXISTS `catalogindex_minimal_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_minimal_price` (
  `index_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `qty` decimal(12,4) unsigned NOT NULL DEFAULT '0.0000',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_class_id` smallint(6) NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`index_id`),
  KEY `IDX_VALUE` (`value`),
  KEY `IDX_QTY` (`qty`),
  KEY `FK_CATALOGINDEX_MINIMAL_PRICE_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `FK_CI_MINIMAL_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_FULL` (`entity_id`,`qty`,`customer_group_id`,`value`,`website_id`),
  CONSTRAINT `FK_CATALOGINDEX_MINIMAL_PRICE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_MINIMAL_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CI_MINIMAL_PRICE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogindex_minimal_price`
--

LOCK TABLES `catalogindex_minimal_price` WRITE;
/*!40000 ALTER TABLE `catalogindex_minimal_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_minimal_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogindex_price`
--

DROP TABLE IF EXISTS `catalogindex_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_price` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `qty` decimal(12,4) unsigned NOT NULL DEFAULT '0.0000',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_class_id` smallint(6) NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned DEFAULT NULL,
  KEY `IDX_VALUE` (`value`),
  KEY `IDX_QTY` (`qty`),
  KEY `FK_CATALOGINDEX_PRICE_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_PRICE_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOGINDEX_PRICE_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_RANGE_VALUE` (`entity_id`,`attribute_id`,`customer_group_id`,`value`),
  KEY `FK_CI_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_FULL` (`entity_id`,`attribute_id`,`customer_group_id`,`value`,`website_id`),
  CONSTRAINT `FK_CATALOGINDEX_PRICE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CI_PRICE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogindex_price`
--

LOCK TABLES `catalogindex_price` WRITE;
/*!40000 ALTER TABLE `catalogindex_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock`
--

DROP TABLE IF EXISTS `cataloginventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `stock_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Catalog inventory Stocks list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock`
--

LOCK TABLES `cataloginventory_stock` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock` VALUES (1,'Padrão');
/*!40000 ALTER TABLE `cataloginventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `cataloginventory_stock_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `stock_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `use_config_min_qty` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_qty_decimal` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `backorders` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `use_config_backorders` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `use_config_min_sale_qty` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `use_config_max_sale_qty` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_in_stock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `low_stock_date` datetime DEFAULT NULL,
  `notify_stock_qty` decimal(12,4) DEFAULT NULL,
  `use_config_notify_stock_qty` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `manage_stock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_config_manage_stock` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `stock_status_changed_automatically` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_config_qty_increments` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `use_config_enable_qty_increments` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_qty_increments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `IDX_STOCK_PRODUCT` (`product_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_ITEM_PRODUCT` (`product_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_ITEM_STOCK` (`stock_id`),
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_ITEM_STOCK` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='Inventory Stock Item Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_item`
--

LOCK TABLES `cataloginventory_stock_item` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_item` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock_item` VALUES (1,1,1,'996.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(2,2,1,'797.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(3,3,1,'989.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(4,4,1,'328.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(5,5,1,'361.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(6,6,1,'143.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(7,7,1,'11.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(8,8,1,'595.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(9,9,1,'681.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(10,10,1,'16.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(11,11,1,'719.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(12,12,1,'441.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(13,13,1,'805.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(14,14,1,'386.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(15,15,1,'718.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(16,16,1,'580.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(17,17,1,'79.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,0,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(18,18,1,'722.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(19,19,1,'99.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(20,20,1,'234.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(21,21,1,'339.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(22,22,1,'994.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(23,23,1,'452.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(24,24,1,'120.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(25,25,1,'932.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(26,26,1,'673.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(27,27,1,'872.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(28,28,1,'456.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(29,29,1,'697.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(30,30,1,'724.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(31,31,1,'956.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(32,32,1,'0.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,NULL,NULL,1,0,1,0,1,'0.0000',1,0),(33,33,1,'999.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(34,34,1,'617.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(35,35,1,'797.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(36,36,1,'856.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(37,37,1,'660.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(38,38,1,'321.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(39,39,1,'0.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,NULL,NULL,1,0,1,0,1,'0.0000',1,0),(40,40,1,'859.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(41,41,1,'31.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(42,42,1,'303.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(43,43,1,'621.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(44,44,1,'191.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(45,45,1,'948.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(46,46,1,'533.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(47,47,1,'293.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(48,48,1,'563.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0),(49,49,1,'0.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,NULL,NULL,1,0,1,0,1,'0.0000',1,0),(50,50,1,'480.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,NULL,'0.0000',1,0,1,0,1,'0.0000',1,0);
/*!40000 ALTER TABLE `cataloginventory_stock_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(4) unsigned NOT NULL,
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `stock_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` (`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status`
--

LOCK TABLES `cataloginventory_stock_status` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock_status` VALUES (1,1,1,'996.0000',1),(2,1,1,'797.0000',1),(3,1,1,'989.0000',1),(4,1,1,'328.0000',1),(5,1,1,'361.0000',1),(6,1,1,'143.0000',1),(7,1,1,'11.0000',1),(8,1,1,'595.0000',1),(9,1,1,'681.0000',1),(10,1,1,'16.0000',1),(11,1,1,'719.0000',1),(12,1,1,'441.0000',1),(13,1,1,'805.0000',1),(14,1,1,'386.0000',1),(15,1,1,'718.0000',1),(16,1,1,'580.0000',1),(17,1,1,'79.0000',0),(18,1,1,'722.0000',1),(19,1,1,'99.0000',1),(20,1,1,'234.0000',1),(21,1,1,'339.0000',1),(22,1,1,'994.0000',1),(23,1,1,'452.0000',1),(24,1,1,'120.0000',1),(25,1,1,'932.0000',1),(26,1,1,'673.0000',1),(27,1,1,'872.0000',1),(28,1,1,'456.0000',1),(29,1,1,'697.0000',1),(30,1,1,'724.0000',1),(31,1,1,'956.0000',1),(32,1,1,'0.0000',0),(33,1,1,'999.0000',1),(34,1,1,'617.0000',1),(35,1,1,'797.0000',1),(36,1,1,'856.0000',1),(37,1,1,'660.0000',1),(38,1,1,'321.0000',1),(40,1,1,'859.0000',1),(41,1,1,'31.0000',1),(42,1,1,'303.0000',1),(43,1,1,'621.0000',1),(44,1,1,'191.0000',1),(45,1,1,'948.0000',1),(46,1,1,'533.0000',1),(47,1,1,'293.0000',1),(48,1,1,'563.0000',1),(50,1,1,'480.0000',1);
/*!40000 ALTER TABLE `cataloginventory_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(4) unsigned NOT NULL,
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `stock_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` (`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status_idx`
--

LOCK TABLES `cataloginventory_stock_status_idx` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status_idx` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock_status_idx` VALUES (1,1,1,'996.0000',1),(2,1,1,'797.0000',1),(3,1,1,'989.0000',1),(4,1,1,'328.0000',1),(5,1,1,'361.0000',1),(6,1,1,'143.0000',1),(7,1,1,'11.0000',1),(8,1,1,'595.0000',1),(9,1,1,'681.0000',1),(10,1,1,'16.0000',1),(11,1,1,'719.0000',1),(12,1,1,'441.0000',1),(13,1,1,'805.0000',1),(14,1,1,'386.0000',1),(15,1,1,'718.0000',1),(16,1,1,'580.0000',1),(17,1,1,'79.0000',0),(18,1,1,'722.0000',1),(19,1,1,'99.0000',1),(20,1,1,'234.0000',1),(21,1,1,'339.0000',1),(22,1,1,'994.0000',1),(23,1,1,'452.0000',1),(24,1,1,'120.0000',1),(25,1,1,'932.0000',1),(26,1,1,'673.0000',1),(27,1,1,'872.0000',1),(28,1,1,'456.0000',1),(29,1,1,'697.0000',1),(30,1,1,'724.0000',1),(31,1,1,'956.0000',1),(32,1,1,'0.0000',0),(33,1,1,'999.0000',1),(34,1,1,'617.0000',1),(35,1,1,'797.0000',1),(36,1,1,'856.0000',1),(37,1,1,'660.0000',1),(38,1,1,'321.0000',1),(40,1,1,'859.0000',1),(41,1,1,'31.0000',1),(42,1,1,'303.0000',1),(43,1,1,'621.0000',1),(44,1,1,'191.0000',1),(45,1,1,'948.0000',1),(46,1,1,'533.0000',1),(47,1,1,'293.0000',1),(48,1,1,'563.0000',1),(50,1,1,'480.0000',1);
/*!40000 ALTER TABLE `cataloginventory_stock_status_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(4) unsigned NOT NULL,
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `stock_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` (`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status_tmp`
--

LOCK TABLES `cataloginventory_stock_status_tmp` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_status_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule`
--

DROP TABLE IF EXISTS `catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `customer_group_ids` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `conditions_serialized` mediumtext NOT NULL,
  `actions_serialized` mediumtext NOT NULL,
  `stop_rules_processing` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `simple_action` varchar(32) NOT NULL,
  `discount_amount` decimal(12,4) NOT NULL,
  `website_ids` text,
  PRIMARY KEY (`rule_id`),
  KEY `sort_order` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule`
--

LOCK TABLES `catalogrule` WRITE;
/*!40000 ALTER TABLE `catalogrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_affected_product`
--

DROP TABLE IF EXISTS `catalogrule_affected_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_affected_product` (
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_affected_product`
--

LOCK TABLES `catalogrule_affected_product` WRITE;
/*!40000 ALTER TABLE `catalogrule_affected_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_affected_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_group_website`
--

DROP TABLE IF EXISTS `catalogrule_group_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `rule_id` (`rule_id`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `website_id` (`website_id`),
  CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_RULE` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_group_website`
--

LOCK TABLES `catalogrule_group_website` WRITE;
/*!40000 ALTER TABLE `catalogrule_group_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_group_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product`
--

DROP TABLE IF EXISTS `catalogrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_operator` enum('to_fixed','to_percent','by_fixed','by_percent') NOT NULL DEFAULT 'to_fixed',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `action_stop` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `sort_order` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `FK_catalogrule_product_rule` (`rule_id`),
  KEY `FK_catalogrule_product_customergroup` (`customer_group_id`),
  KEY `FK_catalogrule_product_website` (`website_id`),
  KEY `IDX_FROM_TIME` (`from_time`),
  KEY `IDX_TO_TIME` (`to_time`),
  KEY `FK_CATALOGRULE_PRODUCT_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_customergroup` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_rule` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_website` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product`
--

LOCK TABLES `catalogrule_product` WRITE;
/*!40000 ALTER TABLE `catalogrule_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product_price`
--

DROP TABLE IF EXISTS `catalogrule_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_date` date NOT NULL DEFAULT '0000-00-00',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `website_id` smallint(5) unsigned NOT NULL,
  `latest_start_date` date DEFAULT NULL,
  `earliest_end_date` date DEFAULT NULL,
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `rule_date` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `FK_catalogrule_product_price_customergroup` (`customer_group_id`),
  KEY `FK_catalogrule_product_price_website` (`website_id`),
  KEY `FK_CATALOGRULE_PRODUCT_PRICE_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRICE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_price_customergroup` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_price_website` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product_price`
--

LOCK TABLES `catalogrule_product_price` WRITE;
/*!40000 ALTER TABLE `catalogrule_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogsearch_fulltext`
--

DROP TABLE IF EXISTS `catalogsearch_fulltext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_fulltext` (
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `data_index` longtext NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`),
  FULLTEXT KEY `data_index` (`data_index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogsearch_fulltext`
--

LOCK TABLES `catalogsearch_fulltext` WRITE;
/*!40000 ALTER TABLE `catalogsearch_fulltext` DISABLE KEYS */;
INSERT INTO `catalogsearch_fulltext` VALUES (30,1,'1112|Habilitado|Taxable Goods|Chair|This Magento chair features a fun, futuristic design, with fluid curves and gentle angles that follow the shape of the body to enhance ultimate relaxation. It combines a hint of nostalgia with the up-to-date sensibility and function of modern chairs. It is in soft, velvety microfiber.|Combining a hint of nostalgia with the up-to-date sensibility and function of modern chairs. It is in soft, velvety microfiber.|129.99|1'),(31,1,'1113|Habilitado|Taxable Goods|Couch|Inspired by the classic camelback sofa, Magento offers comfort and style in a low maintenance package. For a sleek, simple and stylish piece, look no further than the Magento sofa - or sofabed!|For a sleek, simple and stylish piece, look no further than the Magento sofa - or sofabed!|599.99|1'),(32,1,'1114|Habilitado|Magento Red Furniture Set|The perfect furniture set for the living room! Love red? You\'ll love these pieces of handmade modern furniture!|Love red? You\'ll love these pieces of handmade modern furniture!|0'),(26,1,'A630|Habilitado|Taxable Goods|Canon PowerShot A630 8MP Digital Camera with 4x Optical Zoom|Replacing the highly popular PowerShot A620, the PowerShot A630 features a rotating 2.5-inch vari-angle LCD, 4x optical zoom lens, and a vast array of creative shooting modes. The PowerShot A630 packs a vast array of advanced features into a remarkably compact space|Replacing the highly popular PowerShot A620, the PowerShot A630 features a rotating 2.5-inch vari-angle LCD, 4x optical zoom lens, and a vast array of creative shooting modes.|329.99|1'),(27,1,'C530|Habilitado|Taxable Goods|Kodak EasyShare C530 5MP Digital Camera|Small on size. Big on value. Kodak\'s newest C-Series digital camera, the C530, sports awesome features--such as 5.0-megapixel CCD resolution, on-camera image cropping, and an on-camera Share button--at a very affordable price.|Small on size. Big on value. Kodak\'s newest C-Series digital camera, the C530, sports awesome features|199.99|1'),(29,1,'1111|Habilitado|Taxable Goods|Ottoman|The Magento ottoman will impress with its style while it delivers on quality. This piece of living room furniture is built to last with durable solid wood framing, generous padding and plush stain-resistant microfiber upholstery.|With durable solid wood framing, generous padding and plush stain-resistant microfiber upholstery.|299.99|1'),(24,1,'QC-2185|Habilitado|Taxable Goods|Argus QC-2185 Quick Click 5MP Digital Camera|The Argus QC-2185 Quick Click 5MP digital camera offers all the basic features you need in a compact and stylish digital camera. This unit is easy to use, and is perfect for those who want a completely portable option for taking good pictures, without having to empty their wallet. The Argus QC-2185 features a clear and bright 1.1-inch CSTN (color super-twist nematic) LCD display that makes it easy to frame the perfect picture. Thanks to its USB 1.1 connection compatibility, this digital camera lets you quickly download pictures to your Mac or PC, and can also function as a handy web camera. The QC-2185 includes eight megabytes of internal SDRAM memory, with the ability to expand camera memory via a built-in SD (secure digital) storage card slot for easy storage and transfer of your pictures. This unit also includes a built-in auto flash with a three to seven foot range, and comes with ArcSoft PhotoImpression\'s photo editing software which makes it easy for you to edit, crop, adjust and improve all your best pictures to make them even better.|The Argus QC-2185 Quick Click 5MP digital camera offers all the basic features you need in a compact and stylish digital camera. This unit is easy to use, and is perfect for those who want a completely portable option for taking good pictures, without having to empty their wallet.|37.49|1'),(25,1,'750|Habilitado|Taxable Goods|Olympus Stylus 750 7.1MP Digital Camera|Olympus continues to innovate with the launch of the Stylus 750 digital camera, a technically sophisticated point-and-shoot camera offering a number of pioneering technologies such as Dual Image Stabilization, Bright Capture Technology, and TruePic Turbo, as well as a powerful 5x optical zoom that tucks away into a streamlined metal, all-weather body design. The camera is distinguished by a number of premium features, including: * An advanced combination of the mechanical CCD-shift Image Stabilization and Digital Image Stabilization work together to ensure the clearest pictures possible in any situation; * A 5x optical zoom lens with a newly developed lens element to maintain a small compact size; * A 2.5-inch LCD and Bright Capture Technology dramatically improve composition, capture and review of images in low-light situations; * Olympus\' exclusive TruePic Turbo Image Processing engine is coupled with a 7.1-megapixel image sensor to produce crisp, high-quality p|A technically sophisticated point-and-shoot camera offering a number of pioneering technologies such as Dual Image Stabilization, Bright Capture Technology, and TruePic Turbo, as well as a powerful 5x optical zoom.|161.94|1'),(23,1,'Rebel XT|Habilitado|Taxable Goods|Canon Digital Rebel XT 8MP Digital SLR Camera|The Canon EOS Digital Rebel camera now has a new, faster, even smaller big brother. Sibling rivalries aside, the 8.0-megapixel Canon EOS Digital Rebel XT SLR adds resolution, speed, extra creative control, and enhanced comfort in the hand to one of the smallest and lightest digital cameras in its class. Even with its advancements in ergonomic design and technology, this easy-to-use EOS digital camera is compatible with all of Canon\'s EF lenses, including the EF-S lenses.|Canon EOS Digital Rebel XT SLR adds resolution, speed, extra creative control, and enhanced comfort in the hand to one of the smallest and lightest digital cameras in its class.|550|1'),(20,1,'4fasd5f5|Habilitado|Taxable Goods|The Get Up Kids: Band Camp Pullover Hoodie|Printed on American Apparel Classic style 5495 California Fleece Pull-Over Hoodies. Sizing info is available here.|Printed on American Apparel Classic style 5495 California Fleece Pull-Over Hoodies.|30|1'),(21,1,'384822|Habilitado|Taxable Goods|Akio Dresser|Features include inset panel sides and for spacious drawers and two wicker baskets. 41\"Wx18\"Dx36\"H.|Our Akio dresser has a solid hardwood frame.|399.99|1'),(22,1,'bar1234|Habilitado|Taxable Goods|Barcelona Bamboo Platform Bed|Entirely handcrafted of solid Bamboo. Designed for use with a mattress alone, it includes a sturdy, padded wood platform for comfort and proper mattress support.|Our Barcelona platform bed captures the spirit and drama of late 20th century design with a variety of subtle details.|2299|1'),(9,1,'M285-E|Habilitado|Taxable Goods|Toshiba M285-E 14\"|Easily mobile at just 6 pounds, the Toshiba Satellite A135-S4527 makes it easy to get your work done with a large, bright 15.4-inch widescreen LCD. The XGA-resolution screen (1280 x 800) permits side-by-side viewing of documents for increased productivity. It\'s also great for using as a media center, with Toshiba\'s unique Express Media Player enabling you to bypass the system and access CDs and DVDs with a touch of button. This affordable notebook PC is powered by Intel\'s 1.73 GHz Core Duo T2080 processor, which provides an optimized, multithreaded architecture for improved gaming and multitasking performance and efficient power consumption. It also offers a 120 GB hard drive, 1 GB of installed RAM (2 GB maximum), dual-layer/multi-format DVD drive that also burns CDs, integrated 54g wireless connectivity, and Intel GMA 950 video card with up to 256 MB of shared video RAM.|Get the competitive edge with the Gateway M285-E. This widescreen Convertible Notebook functions as both a conventional notebook and a tablet.|1599.99|1'),(7,1,'LX.FR206.001|Habilitado|Taxable Goods|Acer Ferrari 3200 Notebook Computer PC|Acer has flawlessly designed the Ferrari 3200, instilling it with exceptional performance, brilliant graphics, and lightning-fast connectivity. This exclusive edition is another striking symbol of cooperation between Acer and Ferrari -- two progressive companies with proud heritages built on passion, innovation, power and success.|This exclusive edition is another striking symbol of cooperation between Acer and Ferrari -- two progressive companies with proud heritages built on passion, innovation, power and success|1799.99|1'),(8,1,'VGN-TXN27N/B|Habilitado|Taxable Goods|Sony VAIO VGN-TXN27N/B 11.1\" Notebook PC|Weighing in at just an amazing 2.84 pounds and offering a sleek, durable carbon-fiber case in charcoal black. And with 4 to 10 hours of standard battery life, it has the stamina to power you through your most demanding applications. With the integrated wireless WAN, you can access the national Sprint Mobile Broadband service to extend your wireless coverage beyond LAN access networks and hotspots, giving you the freedom to go farther, do more, and stay connected.|Take a load off your shoulders when you\'re racing for your plane with the sleekly designed and ultra-portable Sony Vaio VGN-TXN27N/B notebook PC.|2699.99|1'),(6,1,'MA464LL/A|Habilitado|Taxable Goods|Apple MacBook Pro MA464LL/A 15.4\" Notebook PC|This, combined with myriad other engineering leaps, boosts performance up to four times higher than the PowerBook G4. With this awesome power, it\'s a breeze to render complex 3D models, enjoy smooth playback of HD video, or host a four-way video conference.Intel Core Duo is the first chip built using Intel\'s groundbreaking 65-nanometer process - resulting in transistors so small, you could fit a hundred inside a single human cell. With smaller distances for electrons to travel, and two processors designed to share resources and conserve power, Intel Core Duo achieves higher levels of performance as it uses fewer watts. Which is what makes it possible to design a super-powerful MacBook Pro that\'s only one inch thin.When Mac technology makes something easy, it\'s hardly news. So here\'s more non-news for MacBook Pro owners: software just works. If you see the Universal logo on a new application, that means it will run on Intel- and PowerPC-based Mac computers. For most existing applications, you simply do what you\'ve always done: double-click them. Thanks to the Rosetta technology in Mac OS X, they look and feel just like they did before.|You\'ve seen improvements in notebook performance before - but never on this scale. The Intel Core Duo powering MacBook Pro is actually two processors built into a single chip.|2299.99|1'),(5,1,'MM-A900M|Habilitado|Taxable Goods|Samsung MM-A900M Ace|New services supported by both the MM-A900m include the newly announced Sprint Music StoreSM, which allows users to immediately buy and download complete songs directly to their phone; 30 channels of live and on demand video and audio from Sprint TVSM and On Demand, a personalized resource guide to news, traffic, weather, sports and entertainment. The MM-A900m offers great-looking design with the ability to download a rich selection of content directly to the phone. Features like external music-navigation keys make these phones both functional and attractive. These handsets are sure to be at the top of many wish lists.|The MM-A900m offers great-looking design with the ability to download a rich selection of content directly to the phone.|150|1'),(3,1,'sw810i|Habilitado|Taxable Goods|Sony Ericsson W810i|The W810i\'s screen sports 176 x 220 pixel resolution with support for 262,000 colors. Quick access buttons below the screen make it easy to control the phone\'s Walkman music features, while a five-way center button controls most of the phone\'s menus and features.|The W810i follows a long tradition of beautifully designed and crafted phones from Sony Ericsson. The same candy-bar style that graced the W800 is here.|399.99|1'),(4,1,'8525PDA|Habilitado|Taxable Goods|AT&T 8525 PDA|The design of the 8525 is clean and uncluttered, with just a few buttons for mail, Internet Explorer, and contextual menus. Meanwhile, call answer and end buttons surround a five-way toggle that allows you to navigate and control the Windows Mobile interface. As mentioned, a full QWERTY keyboard cleverly slides out from underneath the screen. This allows you to hold the device horizontally, and the screen is automatically placed in landscape mode when you\'re using the keyboard. A side scroll wheel is conveniently tucked away on the side, making navigation when accessing the music player and other various applications a cinch when needed. A mini-SD memory expansion card slot is provided, as is an infrared port and support for a stereo Bluetooth headset. A mini-USB port is also included for wired data transfers and charging.|Under the hood, the 8525 features 128MB of embedded memory and 64MB RAM, running on a 400 MHz Samsung processor. Up front, the 240 x 320 LCD touch-screen supports over 65,000 colors, while the rear of the device houses a 2.0 megapixel camera.|199.99|1'),(2,1,'bb8100|Habilitado|Taxable Goods|BlackBerry 8100 Pearl|Like the BlackBerry 7105t, the BlackBerry 8100 Pearl is The BlackBerry 8100 Pearl sports a large 240 x 260 screen that supports over 65,000 colors-- plenty of real estate to view your e-mails, Web browser content, messaging sessions, and attachments. The venerable BlackBerry trackwheel has been replaced on this model with an innovative four-way trackball placed below the screen. On the rear of the handheld, you\'ll find a 1.3-megapixel camera and a self portrait mirror. The handheld\'s microSD memory card slot is located inside the device, behind the battery. There\'s also a standard 2.5mm headset jack that can be used with the included headset, as well as a mini-USB port for data connectivity.|The BlackBerry 8100 Pearl is a departure from the form factor of previous BlackBerry devices. This BlackBerry handset is far more phone-like, and RIM\'s engineers have managed to fit a QWERTY keyboard onto the handset\'s slim frame.|349.99|1'),(1,1,'n2610|Habilitado|Taxable Goods|Nokia 2610 Phone|The Nokia 2610 is an easy to use device that combines multiple messaging options including email, instant messaging, and more. You can even download MP3 ringtones, graphics, and games straight to the phone, or surf the Internet with Cingular\'s MEdia Net service. It\'s the perfect complement to Cingular service for those even remotely interested in mobile Web capabilities in an affordable handset. Design Compact and stylish, the 2610 features a candybar design sporting a bright 128 x 128 pixel display capable of displaying over 65,000 colors. Most of the phone\'s features and on-screen menus are controlled by a center toggle on the control pad. A standard hands-free headphone jack is provided, as are volume control keys, and there\'s even a \"Go-To\" button that can be assigned by the user for quick access to favorite applications. Lastly, the included speakerphone allows you to talk handsfree, and because the phone sports an internal antenna, there\'s nothing to snag or break off.|The words \"entry level\" no longer mean \"low-end,\" especially when it comes to the Nokia 2610. Offering advanced media and calling features without breaking the bank|149.99|1');
/*!40000 ALTER TABLE `catalogsearch_fulltext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogsearch_query`
--

DROP TABLE IF EXISTS `catalogsearch_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `query_text` varchar(255) NOT NULL DEFAULT '',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0',
  `redirect` varchar(255) NOT NULL DEFAULT '',
  `synonym_for` varchar(255) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `display_in_terms` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '1',
  `is_processed` tinyint(1) DEFAULT '0',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`query_id`),
  KEY `FK_CATALOGSEARCH_QUERY_STORE` (`store_id`),
  KEY `IDX_SEARCH_QUERY` (`query_text`,`store_id`,`popularity`),
  CONSTRAINT `FK_CATALOGSEARCH_QUERY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogsearch_query`
--

LOCK TABLES `catalogsearch_query` WRITE;
/*!40000 ALTER TABLE `catalogsearch_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogsearch_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogsearch_result`
--

DROP TABLE IF EXISTS `catalogsearch_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_result` (
  `query_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `relevance` decimal(6,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`query_id`,`product_id`),
  KEY `IDX_QUERY` (`query_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_RELEVANCE` (`query_id`,`relevance`),
  CONSTRAINT `FK_CATALOGSEARCH_RESULT_QUERY` FOREIGN KEY (`query_id`) REFERENCES `catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGSEARCH_RESULT_CATALOG_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogsearch_result`
--

LOCK TABLES `catalogsearch_result` WRITE;
/*!40000 ALTER TABLE `catalogsearch_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogsearch_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_agreement`
--

DROP TABLE IF EXISTS `checkout_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_height` varchar(25) DEFAULT NULL,
  `checkbox_text` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `is_html` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_agreement`
--

LOCK TABLES `checkout_agreement` WRITE;
/*!40000 ALTER TABLE `checkout_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_agreement_store`
--

DROP TABLE IF EXISTS `checkout_agreement_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `agreement_id` (`agreement_id`,`store_id`),
  KEY `FK_CHECKOUT_AGREEMENT_STORE` (`store_id`),
  CONSTRAINT `FK_CHECKOUT_AGREEMENT` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CHECKOUT_AGREEMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_agreement_store`
--

LOCK TABLES `checkout_agreement_store` WRITE;
/*!40000 ALTER TABLE `checkout_agreement_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_agreement_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext,
  `creation_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS Blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block`
--

LOCK TABLES `cms_block` WRITE;
/*!40000 ALTER TABLE `cms_block` DISABLE KEYS */;
INSERT INTO `cms_block` VALUES (5,'Links de Rodapé','footer_links','<ul>\r\n<li><a href=\"{{store direct_url=\"about-magento-demo-store\"}}\">Sobre Nós</a></li>\r\n<li class=\"last\"><a href=\"{{store direct_url=\"customer-service\"}}\">Central de Atendimento</a></li>\r\n</ul>','2011-06-29 22:20:34','2011-06-29 22:20:34',1);
/*!40000 ALTER TABLE `cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block_store`
--

DROP TABLE IF EXISTS `cms_block_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block_store` (
  `block_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `FK_CMS_BLOCK_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_CMS_BLOCK_STORE_BLOCK` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_BLOCK_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Blocks to Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block_store`
--

LOCK TABLES `cms_block_store` WRITE;
/*!40000 ALTER TABLE `cms_block_store` DISABLE KEYS */;
INSERT INTO `cms_block_store` VALUES (5,0);
/*!40000 ALTER TABLE `cms_block_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `root_template` varchar(255) NOT NULL DEFAULT '',
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `identifier` varchar(100) NOT NULL DEFAULT '',
  `content_heading` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext,
  `creation_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` tinyint(4) NOT NULL DEFAULT '0',
  `layout_update_xml` text,
  `custom_theme` varchar(100) DEFAULT NULL,
  `custom_root_template` varchar(255) NOT NULL DEFAULT '',
  `custom_layout_update_xml` text,
  `custom_theme_from` date DEFAULT NULL,
  `custom_theme_to` date DEFAULT NULL,
  `meta_robots` text NOT NULL,
  PRIMARY KEY (`page_id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (1,'404 Não Encontrado','two_columns_right','Page keywords','Page description','no-route','','<div class=\"page-title\"><h1>Whoops, our bad...</h1></div>\r\n<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n','2007-06-20 18:38:32','2007-08-26 19:11:13',1,0,NULL,NULL,'',NULL,NULL,NULL,''),(2,'Página Inicial','two_columns_left','','','home','','<!-- -->','2007-08-23 10:03:25','2011-06-30 01:53:09',1,0,'<reference name=\"content\">\r\n            <block type=\"catalog/product_list_random\" name=\"homepage\" template=\"catalog/product/homepage.phtml\">\r\n                  <action method=\"setCategoryId\"><category_id>2</category_id></action>\r\n            </block>\r\n</reference>\r\n<reference name=\"banner\">\r\n<block type=\"interaktingslider/interaktingslider\" name=\"interaktingslider\" />\r\n</reference>','','','',NULL,NULL,'INDEX,FOLLOW'),(3,'About  Us','one_column','','','about-magento-demo-store','','<div class=\"page-title\">\r\n<h1>About Magento Store</h1>\r\n</div>\r\n<div class=\"col3-set\">\r\n<div class=\"col-1\"><p><a href=\"http://www.varien.com/\"><img src=\"{{skin url=\'images/media/about_us_img.jpg\'}}\" title=\"Varien\" alt=\"Varien\" /></a></p><p style=\"line-height:1.2em;\"><small>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.</small></p>\r\n<p style=\"color:#888; font:1.2em/1.4em georgia, serif;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta.</p></div>\r\n<div class=\"col-2\">\r\n<p><strong style=\"color:#de036f;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.</strong></p>\r\n<p>Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo. </p>\r\n<p>Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus. Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi. Vestibulum sapien dolor, aliquet nec, porta ac, malesuada a, libero. Praesent feugiat purus eget est. Nulla facilisi. Vestibulum tincidunt sapien eu velit. Mauris purus. Maecenas eget mauris eu orci accumsan feugiat. Pellentesque eget velit. Nunc tincidunt.</p></div>\r\n<div class=\"col-3\">\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper </p>\r\n<p><strong style=\"color:#de036f;\">Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus.</strong></p>\r\n<p>Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi.</p>\r\n<div class=\"divider\"></div>\r\n<p>To all of you, from all of us at Magento Store - Thank you and Happy eCommerce!</p>\r\n<p style=\"line-height:1.2em;\"><strong style=\"font:italic 2em Georgia, serif;\">John Doe</strong><br /><small>Some important guy</small></p></div>\r\n</div>','2007-08-30 14:01:18','2007-08-30 14:01:18',1,0,NULL,NULL,'',NULL,NULL,NULL,''),(4,'Central de Atendimento','three_columns','','','customer-service','','<div class=\"page-title\">\r\n<h1>Central de Atendimento</h1>\r\n</div>\r\n<ul class=\"disc\">\r\n<li><a href=\"#answer1\">Formas de Entrega</a></li>\r\n<li><a href=\"#answer2\">Privacy &amp; Segurança</a></li>\r\n<li><a href=\"#answer3\">Returns &amp; Replacements</a></li>\r\n<li><a href=\"#answer4\">Ordering</a></li>\r\n<li><a href=\"#answer5\">Payment, Pricing &amp; Promotions</a></li>\r\n<li><a href=\"#answer6\">Viewing Orders</a></li>\r\n<li><a href=\"#answer7\">Updating Account Information</a></li>\r\n</ul>\r\n<dl>\r\n<dt id=\"answer1\">Shipping &amp; Delivery</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer2\">Privacy &amp; Security</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer3\">Returns &amp; Replacements</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer4\">Ordering</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer5\">Payment, Pricing &amp; Promotions</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer6\">Viewing Orders</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer7\">Updating Account Information</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n</dl>','2007-08-30 14:02:20','2007-08-30 14:03:37',1,0,NULL,NULL,'',NULL,NULL,NULL,''),(5,'Ativar Cookies','one_column','','','enable-cookies','','<div class=\"std\">\r\n    <ul class=\"messages\">\r\n        <li class=\"notice-msg\">\r\n            <ul>\r\n                <li>Please enable cookies in your web browser to continue.</li>\r\n            </ul>\r\n        </li>\r\n    </ul>\r\n    <div class=\"page-title\">\r\n        <h1><a name=\"top\"></a>What are Cookies?</h1>\r\n    </div>\r\n    <p>Cookies are short pieces of data that are sent to your computer when you visit a website. On later visits, this data is then returned to that website. Cookies allow us to recognize you automatically whenever you visit our site so that we can personalize your experience and provide you with better service. We also use cookies (and similar browser data, such as Flash cookies) for fraud prevention and other purposes. If your web browser is set to refuse cookies from our website, you will not be able to complete a purchase or take advantage of certain features of our website, such as storing items in your Shopping Cart or receiving personalized recommendations. As a result, we strongly encourage you to configure your web browser to accept cookies from our website.</p>\r\n    <h2 class=\"subtitle\">Enabling Cookies</h2>\r\n    <ul class=\"disc\">\r\n        <li><a href=\"#ie7\">Internet Explorer 7.x</a></li>\r\n        <li><a href=\"#ie6\">Internet Explorer 6.x</a></li>\r\n        <li><a href=\"#firefox\">Mozilla/Firefox</a></li>\r\n        <li><a href=\"#opera\">Opera 7.x</a></li>\r\n    </ul>\r\n    <h3><a name=\"ie7\"></a>Internet Explorer 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Start Internet Explorer</p>\r\n        </li>\r\n        <li>\r\n            <p>Under the <strong>Tools</strong> menu, click <strong>Internet Options</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-1.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Privacy</strong> tab</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-2.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Advanced</strong> button</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-3.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Put a check mark in the box for <strong>Override Automatic Cookie Handling</strong>, put another check mark in the <strong>Always accept session cookies </strong>box</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-4.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-5.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-6.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Restart Internet Explore</p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n    <h3><a name=\"ie6\"></a>Internet Explorer 6.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Select <strong>Internet Options</strong> from the Tools menu</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie6-1.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> tab</p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Default</strong> button (or manually slide the bar down to <strong>Medium</strong>) under <strong>Settings</strong>. Click <strong>OK</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie6-2.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n    <h3><a name=\"firefox\"></a>Mozilla/Firefox</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong>-menu in Mozilla</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Options...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection in the left part of the window. (See image below)</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/firefox.png\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Expand the <strong>Cookies</strong> section</p>\r\n        </li>\r\n        <li>\r\n            <p>Check the <strong>Enable cookies</strong> and <strong>Accept cookies normally</strong> checkboxes</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong>.</p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n    <h3><a name=\"opera\"></a>Opera 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong> menu in Opera</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Preferences...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection near the bottom left of the window. (See image below)</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/opera.png\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>The <strong>Enable cookies</strong> checkbox must be checked, and <strong>Accept all cookies</strong> should be selected in the &quot;<strong>Normal cookies</strong>&quot; drop-down</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong></p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n</div>\r\n','2011-06-30 01:20:34','2011-06-30 01:20:34',1,0,NULL,NULL,'',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_store`
--

DROP TABLE IF EXISTS `cms_page_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_store` (
  `page_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `FK_CMS_PAGE_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_CMS_PAGE_STORE_PAGE` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_PAGE_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Pages to Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_store`
--

LOCK TABLES `cms_page_store` WRITE;
/*!40000 ALTER TABLE `cms_page_store` DISABLE KEYS */;
INSERT INTO `cms_page_store` VALUES (1,0),(3,0),(4,0),(5,0),(2,1);
/*!40000 ALTER TABLE `cms_page_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_cache`
--

DROP TABLE IF EXISTS `core_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cache` (
  `id` varchar(255) NOT NULL,
  `data` mediumblob,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `expire_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_cache`
--

LOCK TABLES `core_cache` WRITE;
/*!40000 ALTER TABLE `core_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_cache_option`
--

DROP TABLE IF EXISTS `core_cache_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cache_option` (
  `code` varchar(32) NOT NULL,
  `value` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_cache_option`
--

LOCK TABLES `core_cache_option` WRITE;
/*!40000 ALTER TABLE `core_cache_option` DISABLE KEYS */;
INSERT INTO `core_cache_option` VALUES ('block_html',0),('collections',0),('config',0),('config_api',0),('eav',0),('layout',0),('translate',0);
/*!40000 ALTER TABLE `core_cache_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_cache_tag`
--

DROP TABLE IF EXISTS `core_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cache_tag` (
  `tag` varchar(255) NOT NULL,
  `cache_id` varchar(255) NOT NULL,
  KEY `IDX_TAG` (`tag`),
  KEY `IDX_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_cache_tag`
--

LOCK TABLES `core_cache_tag` WRITE;
/*!40000 ALTER TABLE `core_cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config_data`
--

DROP TABLE IF EXISTS `core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scope` enum('default','websites','stores','config') NOT NULL DEFAULT 'default',
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT 'general',
  `value` text NOT NULL,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `config_scope` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config_data`
--

LOCK TABLES `core_config_data` WRITE;
/*!40000 ALTER TABLE `core_config_data` DISABLE KEYS */;
INSERT INTO `core_config_data` VALUES (1,'default',0,'catalog/category/root_id','2'),(2,'default',0,'web/seo/use_rewrites','1'),(3,'default',0,'admin/dashboard/enable_charts','0'),(4,'default',0,'web/unsecure/base_url','http://pastas.octagonoecommerce.com.br/'),(5,'default',0,'web/secure/base_url','http://pastas.octagonoecommerce.com.br/'),(6,'default',0,'general/locale/code','pt_BR'),(7,'default',0,'general/locale/timezone','America/Sao_Paulo'),(8,'default',0,'currency/options/base','BRL'),(9,'default',0,'currency/options/default','BRL'),(10,'default',0,'currency/options/allow','BRL'),(11,'default',0,'general/country/default','BR'),(12,'default',0,'general/country/allow','BR'),(13,'default',0,'general/country/optional_zip_countries','BR'),(14,'default',0,'general/locale/firstday','0'),(15,'default',0,'general/locale/weekend','0,6'),(16,'default',0,'general/store_information/name',''),(17,'default',0,'general/store_information/phone',''),(18,'default',0,'general/store_information/address',''),(19,'default',0,'design/package/name','default'),(20,'default',0,'design/package/ua_regexp','a:0:{}'),(21,'default',0,'design/theme/locale',''),(22,'default',0,'design/theme/template',''),(23,'default',0,'design/theme/template_ua_regexp','a:0:{}'),(24,'default',0,'design/theme/skin',''),(25,'default',0,'design/theme/skin_ua_regexp','a:0:{}'),(26,'default',0,'design/theme/layout',''),(27,'default',0,'design/theme/layout_ua_regexp','a:0:{}'),(28,'default',0,'design/theme/default','blank_seo'),(29,'default',0,'design/theme/default_ua_regexp','a:0:{}'),(30,'default',0,'design/head/default_title','Super Pastas'),(31,'default',0,'design/head/title_prefix',''),(32,'default',0,'design/head/title_suffix',''),(33,'default',0,'design/head/default_description',''),(34,'default',0,'design/head/default_keywords',''),(35,'default',0,'design/head/default_robots','INDEX,FOLLOW'),(36,'default',0,'design/head/includes',''),(37,'default',0,'design/head/demonotice','0'),(38,'default',0,'design/header/logo_src','images/logo.png'),(39,'default',0,'design/header/logo_alt','Super Pastas'),(40,'default',0,'design/header/welcome','Bem-vindo Visitante!'),(41,'default',0,'design/footer/copyright',''),(42,'default',0,'design/footer/absolute_footer',''),(43,'default',0,'design/watermark/image_size',''),(44,'default',0,'design/watermark/image_imageOpacity',''),(45,'default',0,'design/watermark/image_position','stretch'),(46,'default',0,'design/watermark/small_image_size',''),(47,'default',0,'design/watermark/small_image_imageOpacity',''),(48,'default',0,'design/watermark/small_image_position','stretch'),(49,'default',0,'design/watermark/thumbnail_size',''),(50,'default',0,'design/watermark/thumbnail_imageOpacity',''),(51,'default',0,'design/watermark/thumbnail_position','stretch'),(52,'default',0,'design/pagination/pagination_frame','5'),(53,'default',0,'design/pagination/pagination_frame_skip',''),(54,'default',0,'design/pagination/anchor_text_for_previous',''),(55,'default',0,'design/pagination/anchor_text_for_next',''),(56,'default',0,'trans_email/ident_general/name','Atendimento'),(57,'default',0,'trans_email/ident_general/email','owner@example.com'),(58,'default',0,'trans_email/ident_sales/name','Vendas'),(59,'default',0,'trans_email/ident_sales/email','sales@example.com'),(60,'default',0,'trans_email/ident_support/name','Suporte'),(61,'default',0,'trans_email/ident_support/email','support@example.com'),(62,'default',0,'trans_email/ident_custom1/name','Custom 1'),(63,'default',0,'trans_email/ident_custom1/email','custom1@example.com'),(64,'default',0,'trans_email/ident_custom2/name','Custom 2'),(65,'default',0,'trans_email/ident_custom2/email','custom2@example.com'),(66,'default',0,'contacts/contacts/enabled','1'),(67,'default',0,'contacts/email/recipient_email',''),(68,'default',0,'contacts/email/sender_email_identity','general'),(69,'default',0,'contacts/email/email_template','contacts_email_email_template'),(70,'default',0,'payment/ccsave/active','0'),(71,'default',0,'payment/ccsave/title','Credit Card (saved)'),(72,'default',0,'payment/ccsave/order_status','pending'),(73,'default',0,'payment/ccsave/cctypes','AE,VI,MC,DI'),(74,'default',0,'payment/ccsave/useccv','0'),(75,'default',0,'payment/ccsave/centinel','0'),(76,'default',0,'payment/ccsave/allowspecific','0'),(77,'default',0,'payment/ccsave/specificcountry',''),(78,'default',0,'payment/ccsave/min_order_total',''),(79,'default',0,'payment/ccsave/max_order_total',''),(80,'default',0,'payment/ccsave/sort_order',''),(81,'default',0,'payment/free/title','No Payment Information Required'),(82,'default',0,'payment/free/active','0'),(83,'default',0,'payment/free/order_status','pending'),(84,'default',0,'payment/free/payment_action',''),(85,'default',0,'payment/free/allowspecific','0'),(86,'default',0,'payment/free/specificcountry',''),(87,'default',0,'payment/free/sort_order','1'),(88,'default',0,'payment/checkmo/active','0'),(89,'default',0,'payment/checkmo/title','Check / Money order'),(90,'default',0,'payment/checkmo/order_status','pending'),(91,'default',0,'payment/checkmo/allowspecific','0'),(92,'default',0,'payment/checkmo/specificcountry',''),(93,'default',0,'payment/checkmo/payable_to',''),(94,'default',0,'payment/checkmo/mailing_address',''),(95,'default',0,'payment/checkmo/min_order_total',''),(96,'default',0,'payment/checkmo/max_order_total',''),(97,'default',0,'payment/checkmo/sort_order',''),(98,'default',0,'payment/purchaseorder/active','0'),(99,'default',0,'payment/purchaseorder/title','Purchase Order'),(100,'default',0,'payment/purchaseorder/order_status','pending'),(101,'default',0,'payment/purchaseorder/allowspecific','0'),(102,'default',0,'payment/purchaseorder/specificcountry',''),(103,'default',0,'payment/purchaseorder/min_order_total',''),(104,'default',0,'payment/purchaseorder/max_order_total',''),(105,'default',0,'payment/purchaseorder/sort_order',''),(106,'default',0,'payment/authorizenet/active','0'),(107,'default',0,'payment/authorizenet/payment_action','authorize'),(108,'default',0,'payment/authorizenet/title','Credit Card (Authorize.net)'),(109,'default',0,'payment/authorizenet/login',''),(110,'default',0,'payment/authorizenet/trans_key',''),(111,'default',0,'payment/authorizenet/order_status',''),(112,'default',0,'payment/authorizenet/test','1'),(113,'default',0,'payment/authorizenet/cgi_url','https://secure.authorize.net/gateway/transact.dll'),(114,'default',0,'payment/authorizenet/currency','USD'),(115,'default',0,'payment/authorizenet/debug','0'),(116,'default',0,'payment/authorizenet/email_customer','0'),(117,'default',0,'payment/authorizenet/merchant_email',''),(118,'default',0,'payment/authorizenet/cctypes','AE,VI,MC,DI'),(119,'default',0,'payment/authorizenet/useccv','0'),(120,'default',0,'payment/authorizenet/allowspecific','0'),(121,'default',0,'payment/authorizenet/min_order_total',''),(122,'default',0,'payment/authorizenet/max_order_total',''),(123,'default',0,'payment/authorizenet/sort_order',''),(124,'default',0,'shipping/origin/country_id','BR'),(125,'default',0,'shipping/origin/region_id','509'),(126,'default',0,'shipping/origin/postcode','02142-020'),(127,'default',0,'shipping/origin/city','São Paulo'),(128,'default',0,'shipping/option/checkout_multiple','0'),(129,'default',0,'shipping/option/checkout_multiple_maximum_qty','100'),(130,'default',0,'catalog/frontend/list_mode','grid'),(131,'default',0,'catalog/frontend/grid_per_page_values','6,9,15,30'),(132,'default',0,'catalog/frontend/grid_per_page','6'),(133,'default',0,'catalog/frontend/list_per_page_values','5,10,15,20,25'),(134,'default',0,'catalog/frontend/list_per_page','10'),(135,'default',0,'catalog/frontend/list_allow_all','0'),(136,'default',0,'catalog/frontend/default_sort_by','position'),(137,'default',0,'catalog/frontend/flat_catalog_category','0'),(138,'default',0,'catalog/frontend/flat_catalog_product','0'),(139,'default',0,'catalog/frontend/parse_url_directives','1'),(140,'default',0,'catalog/sitemap/tree_mode','1'),(141,'default',0,'catalog/sitemap/lines_perpage','30'),(142,'default',0,'catalog/review/allow_guest','0'),(143,'default',0,'catalog/productalert/allow_price','0'),(144,'default',0,'catalog/productalert/email_price_template','catalog_productalert_email_price_template'),(145,'default',0,'catalog/productalert/allow_stock','0'),(146,'default',0,'catalog/productalert/email_stock_template','catalog_productalert_email_stock_template'),(147,'default',0,'catalog/productalert/email_identity','general'),(148,'default',0,'catalog/productalert_cron/frequency','D'),(149,'default',0,'crontab/jobs/catalog_product_alert/schedule/cron_expr','0 0 * * *'),(150,'default',0,'crontab/jobs/catalog_product_alert/run/model','productalert/observer::process'),(151,'default',0,'catalog/productalert_cron/time','00,00,00'),(152,'default',0,'catalog/productalert_cron/error_email',''),(153,'default',0,'catalog/productalert_cron/error_email_identity','general'),(154,'default',0,'catalog/productalert_cron/error_email_template','catalog_productalert_cron_error_email_template'),(155,'default',0,'catalog/recently_products/scope','website'),(156,'default',0,'catalog/recently_products/viewed_count','5'),(157,'default',0,'catalog/recently_products/compared_count','5'),(158,'default',0,'catalog/price/scope','0'),(159,'default',0,'catalog/layered_navigation/price_range_calculation','auto'),(160,'default',0,'catalog/navigation/max_depth','0'),(161,'default',0,'catalog/seo/site_map','1'),(162,'default',0,'catalog/seo/search_terms','1'),(163,'default',0,'catalog/seo/product_url_suffix','.html'),(164,'default',0,'catalog/seo/category_url_suffix','.html'),(165,'default',0,'catalog/seo/product_use_categories','0'),(166,'default',0,'catalog/seo/save_rewrites_history','1'),(167,'default',0,'catalog/seo/title_separator','-'),(168,'default',0,'catalog/seo/category_canonical_tag','0'),(169,'default',0,'catalog/seo/product_canonical_tag','0'),(170,'default',0,'catalog/search/min_query_length','1'),(171,'default',0,'catalog/search/max_query_length','128'),(172,'default',0,'catalog/search/max_query_words','10'),(173,'default',0,'catalog/search/search_type','1'),(174,'default',0,'catalog/search/use_layered_navigation_count','2000'),(175,'default',0,'catalog/downloadable/order_item_status','9'),(176,'default',0,'catalog/downloadable/downloads_number','0'),(177,'default',0,'catalog/downloadable/shareable','0'),(178,'default',0,'catalog/downloadable/samples_title','Samples'),(179,'default',0,'catalog/downloadable/links_title','Links'),(180,'default',0,'catalog/downloadable/links_target_new_window','1'),(181,'default',0,'catalog/downloadable/content_disposition','inline'),(182,'default',0,'catalog/downloadable/disable_guest_checkout','1'),(183,'default',0,'catalog/custom_options/use_calendar','0'),(184,'default',0,'catalog/custom_options/date_fields_order','m,d,y'),(185,'default',0,'catalog/custom_options/time_format','12h'),(186,'default',0,'catalog/custom_options/year_range',','),(187,'default',0,'carriers/pedroteixeira_correios/active','0'),(188,'default',0,'carriers/pedroteixeira_correios/title','Correios'),(189,'default',0,'carriers/pedroteixeira_correios/postmethods','40010'),(190,'default',0,'carriers/pedroteixeira_correios/free_method','40010'),(191,'default',0,'carriers/pedroteixeira_correios/weight_type','kg'),(192,'default',0,'carriers/pedroteixeira_correios/urlmethod','0'),(193,'default',0,'carriers/pedroteixeira_correios/prazo_entrega','0'),(194,'default',0,'carriers/pedroteixeira_correios/cod_admin',''),(195,'default',0,'carriers/pedroteixeira_correios/senha_admin',''),(196,'default',0,'carriers/pedroteixeira_correios/mao_propria','0'),(197,'default',0,'carriers/pedroteixeira_correios/aviso_recebimento','0'),(198,'default',0,'carriers/pedroteixeira_correios/valor_declarado','0'),(199,'default',0,'carriers/pedroteixeira_correios/altura_padrao','2'),(200,'default',0,'carriers/pedroteixeira_correios/comprimento_padrao','16'),(201,'default',0,'carriers/pedroteixeira_correios/largura_padrao','11'),(202,'default',0,'carriers/pedroteixeira_correios/min_order_value','0'),(203,'default',0,'carriers/pedroteixeira_correios/max_order_value','10000'),(204,'default',0,'carriers/pedroteixeira_correios/maxweight','30'),(205,'default',0,'carriers/pedroteixeira_correios/handling_fee','0'),(206,'default',0,'carriers/pedroteixeira_correios/add_prazo','0'),(207,'default',0,'carriers/pedroteixeira_correios/correioserror','Houve um erro inesperado, por favor entre em contato. %s'),(208,'default',0,'carriers/pedroteixeira_correios/msgprazo','%s - Em média %d dia(s)'),(209,'default',0,'carriers/pedroteixeira_correios/valueerror','Valor de compra fora do permitido pelos Correios. Por favor entre em contato conosco.'),(210,'default',0,'carriers/pedroteixeira_correios/zipcodeerror','Por favor, corrija o CEP digitado, ele não está correto.'),(211,'default',0,'carriers/pedroteixeira_correios/maxweighterror','Peso dos produtos acima do permitido pelos Correios. Por favor entre em contato conosco.'),(212,'default',0,'carriers/pedroteixeira_correios/weightzeroerror','Lojista: O peso do produto deverá ser maior que zero. Se você está usando a media de peso como gramas, o peso mínimo é de 10 gramas.'),(213,'default',0,'carriers/pedroteixeira_correios/urlerror','Esse método de envio está fora do ar. Por favor entre em contato conosco.'),(214,'default',0,'carriers/pedroteixeira_correios/coderror','Lojista: Para calcular esse serviço você precisa ter contrato com os Correios.'),(215,'default',0,'carriers/pedroteixeira_correios/showmethod','1'),(216,'default',0,'carriers/pedroteixeira_correios/sort_order',''),(217,'default',0,'carriers/flatrate/active','0'),(218,'default',0,'carriers/flatrate/title','entrega'),(219,'default',0,'carriers/flatrate/name','Fixed'),(220,'default',0,'carriers/flatrate/type','I'),(221,'default',0,'carriers/flatrate/price','5.00'),(222,'default',0,'carriers/flatrate/handling_type','F'),(223,'default',0,'carriers/flatrate/handling_fee',''),(224,'default',0,'carriers/flatrate/specificerrmsg','This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),(225,'default',0,'carriers/flatrate/sallowspecific','0'),(226,'default',0,'carriers/flatrate/specificcountry',''),(227,'default',0,'carriers/flatrate/showmethod','0'),(228,'default',0,'carriers/flatrate/sort_order',''),(229,'default',0,'carriers/matrixrate/active','0'),(230,'default',0,'carriers/matrixrate/title','Select Shipping Method'),(231,'default',0,'carriers/matrixrate/condition_name','package_weight'),(232,'default',0,'carriers/matrixrate/zip_range','0'),(233,'default',0,'carriers/matrixrate/allow_free_shipping_promotions','1'),(234,'default',0,'carriers/matrixrate/show_only_free','0'),(235,'default',0,'carriers/matrixrate/free_method_text','Free Shipping'),(236,'default',0,'carriers/matrixrate/free_shipping_threshold',''),(237,'default',0,'carriers/matrixrate/include_virtual_price','1'),(238,'default',0,'carriers/matrixrate/handling_type','F'),(239,'default',0,'carriers/matrixrate/handling_fee',''),(240,'default',0,'carriers/matrixrate/sallowspecific','0'),(241,'default',0,'carriers/matrixrate/showmethod','0'),(242,'default',0,'carriers/matrixrate/specificerrmsg','This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),(243,'default',0,'carriers/matrixrate/sort_order',''),(244,'default',0,'carriers/tablerate/active','0'),(245,'default',0,'carriers/tablerate/title','Best Way'),(246,'default',0,'carriers/tablerate/name','Table Rate'),(247,'default',0,'carriers/tablerate/condition_name','package_weight'),(248,'default',0,'carriers/tablerate/include_virtual_price','1'),(249,'default',0,'carriers/tablerate/handling_type','F'),(250,'default',0,'carriers/tablerate/handling_fee',''),(251,'default',0,'carriers/tablerate/specificerrmsg','This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),(252,'default',0,'carriers/tablerate/sallowspecific','0'),(253,'default',0,'carriers/tablerate/specificcountry',''),(254,'default',0,'carriers/tablerate/showmethod','0'),(255,'default',0,'carriers/tablerate/sort_order',''),(256,'default',0,'carriers/freeshipping/active','1'),(257,'default',0,'carriers/freeshipping/title','Free Shipping'),(258,'default',0,'carriers/freeshipping/name','Free'),(259,'default',0,'carriers/freeshipping/free_shipping_subtotal',''),(260,'default',0,'carriers/freeshipping/specificerrmsg','This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),(261,'default',0,'carriers/freeshipping/sallowspecific','0'),(262,'default',0,'carriers/freeshipping/specificcountry',''),(263,'default',0,'carriers/freeshipping/showmethod','0'),(264,'default',0,'carriers/freeshipping/sort_order',''),(265,'default',0,'carriers/ups/active','0'),(266,'default',0,'carriers/ups/type','UPS'),(267,'default',0,'carriers/ups/password',''),(268,'default',0,'carriers/ups/access_license_number',''),(269,'default',0,'carriers/ups/username',''),(270,'default',0,'carriers/ups/mode_xml','1'),(271,'default',0,'carriers/ups/gateway_xml_url','https://onlinetools.ups.com/ups.app/xml/Rate'),(272,'default',0,'carriers/ups/origin_shipment','United States Domestic Shipments'),(273,'default',0,'carriers/ups/negotiated_active','0'),(274,'default',0,'carriers/ups/gateway_url','http://www.ups.com/using/services/rave/qcostcgi.cgi'),(275,'default',0,'carriers/ups/title','United Parcel Service'),(276,'default',0,'carriers/ups/shipper_number',''),(277,'default',0,'carriers/ups/container','CP'),(278,'default',0,'carriers/ups/dest_type','RES'),(279,'default',0,'carriers/ups/unit_of_measure','LBS'),(280,'default',0,'carriers/ups/tracking_xml_url','https://www.ups.com/ups.app/xml/Track'),(281,'default',0,'carriers/ups/pickup','CC'),(282,'default',0,'carriers/ups/max_package_weight','150'),(283,'default',0,'carriers/ups/min_package_weight','0.1'),(284,'default',0,'carriers/ups/handling_type','F'),(285,'default',0,'carriers/ups/handling_action','O'),(286,'default',0,'carriers/ups/handling_fee',''),(287,'default',0,'carriers/ups/allowed_methods','1DM,1DML,1DA,1DAL,1DAPI,1DP,1DPL,2DM,2DML,2DA,2DAL,3DS,GND,GNDCOM,GNDRES,STD,XPR,WXS,XPRL,XDM,XDML,XPD'),(288,'default',0,'carriers/ups/free_method','GND'),(289,'default',0,'carriers/ups/free_shipping_enable','0'),(290,'default',0,'carriers/ups/free_shipping_subtotal',''),(291,'default',0,'carriers/ups/specificerrmsg','This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),(292,'default',0,'carriers/ups/sallowspecific','0'),(293,'default',0,'carriers/ups/specificcountry',''),(294,'default',0,'carriers/ups/debug','0'),(295,'default',0,'carriers/ups/showmethod','0'),(296,'default',0,'carriers/ups/sort_order',''),(297,'default',0,'carriers/usps/active','0'),(298,'default',0,'carriers/usps/gateway_url','http://production.shippingapis.com/ShippingAPI.dll'),(299,'default',0,'carriers/usps/title','United States Postal Service'),(300,'default',0,'carriers/usps/userid',''),(301,'default',0,'carriers/usps/container','VARIABLE'),(302,'default',0,'carriers/usps/size','REGULAR'),(303,'default',0,'carriers/usps/machinable','true'),(304,'default',0,'carriers/usps/max_package_weight','70'),(305,'default',0,'carriers/usps/handling_type','F'),(306,'default',0,'carriers/usps/handling_action','O'),(307,'default',0,'carriers/usps/handling_fee',''),(308,'default',0,'carriers/usps/allowed_methods','Bound Printed Matter,Express Mail,Express Mail Flat Rate Envelope,Express Mail Flat Rate Envelope Hold For Pickup,Express Mail Flat-Rate Envelope Sunday/Holiday Guarantee,Express Mail Hold For Pickup,Express Mail International,Express Mail International Flat Rate Envelope,Express Mail PO to PO,Express Mail Sunday/Holiday Guarantee,First-Class Mail International Large Envelope,First-Class Mail International Letters,First-Class Mail International Package,First-Class,First-Class Mail,First-Class Mail Flat,First-Class Mail International,First-Class Mail Letter,First-Class Mail Parcel,Global Express Guaranteed (GXG),Global Express Guaranteed Non-Document Non-Rectangular,Global Express Guaranteed Non-Document Rectangular,Library Mail,Media Mail,Parcel Post,Priority Mail,Priority Mail Small Flat Rate Box,Priority Mail Medium Flat Rate Box,Priority Mail Large Flat Rate Box,Priority Mail Flat Rate Box,Priority Mail Flat Rate Envelope,Priority Mail International,Priority Mail International Flat Rate Box,Priority Mail International Flat Rate Envelope,Priority Mail International Small Flat Rate Box,Priority Mail International Medium Flat Rate Box,Priority Mail International Large Flat Rate Box,USPS GXG Envelopes'),(309,'default',0,'carriers/usps/free_method',''),(310,'default',0,'carriers/usps/free_shipping_enable','0'),(311,'default',0,'carriers/usps/free_shipping_subtotal',''),(312,'default',0,'carriers/usps/specificerrmsg','This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),(313,'default',0,'carriers/usps/sallowspecific','0'),(314,'default',0,'carriers/usps/specificcountry',''),(315,'default',0,'carriers/usps/showmethod','0'),(316,'default',0,'carriers/usps/debug','0'),(317,'default',0,'carriers/usps/sort_order',''),(318,'default',0,'carriers/fedex/active','0'),(319,'default',0,'carriers/fedex/title','Federal Express'),(320,'default',0,'carriers/fedex/gateway_url','https://gateway.fedex.com/GatewayDC'),(321,'default',0,'carriers/fedex/account',''),(322,'default',0,'carriers/fedex/packaging','YOURPACKAGING'),(323,'default',0,'carriers/fedex/dropoff','REGULARPICKUP'),(324,'default',0,'carriers/fedex/max_package_weight','150'),(325,'default',0,'carriers/fedex/handling_type','F'),(326,'default',0,'carriers/fedex/handling_action','O'),(327,'default',0,'carriers/fedex/residence_delivery','0'),(328,'default',0,'carriers/fedex/handling_fee',''),(329,'default',0,'carriers/fedex/allowed_methods','PRIORITYOVERNIGHT,STANDARDOVERNIGHT,FIRSTOVERNIGHT,FEDEX2DAY,FEDEXEXPRESSSAVER,INTERNATIONALPRIORITY,INTERNATIONALECONOMY,INTERNATIONALFIRST,FEDEX1DAYFREIGHT,FEDEX2DAYFREIGHT,FEDEX3DAYFREIGHT,FEDEXGROUND,GROUNDHOMEDELIVERY,INTERNATIONALPRIORITY FREIGHT,INTERNATIONALECONOMY FREIGHT,EUROPEFIRSTINTERNATIONALPRIORITY'),(330,'default',0,'carriers/fedex/free_method','FEDEXGROUND'),(331,'default',0,'carriers/fedex/free_shipping_enable','0'),(332,'default',0,'carriers/fedex/free_shipping_subtotal',''),(333,'default',0,'carriers/fedex/specificerrmsg','This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),(334,'default',0,'carriers/fedex/sallowspecific','0'),(335,'default',0,'carriers/fedex/specificcountry',''),(336,'default',0,'carriers/fedex/debug','0'),(337,'default',0,'carriers/fedex/showmethod','0'),(338,'default',0,'carriers/fedex/sort_order',''),(339,'default',0,'carriers/dhl/active','0'),(340,'default',0,'carriers/dhl/gateway_url','https://eCommerce.airborne.com/ApiLandingTest.asp'),(341,'default',0,'carriers/dhl/title','DHL'),(342,'default',0,'carriers/dhl/id',''),(343,'default',0,'carriers/dhl/password',''),(344,'default',0,'carriers/dhl/account',''),(345,'default',0,'carriers/dhl/shipping_intlkey',''),(346,'default',0,'carriers/dhl/shipping_key',''),(347,'default',0,'carriers/dhl/shipment_type','P'),(348,'default',0,'carriers/dhl/handling_type','F'),(349,'default',0,'carriers/dhl/handling_action','O'),(350,'default',0,'carriers/dhl/contentdesc','Big Box'),(351,'default',0,'carriers/dhl/handling_fee',''),(352,'default',0,'carriers/dhl/dutiable','0'),(353,'default',0,'carriers/dhl/max_package_weight','150'),(354,'default',0,'carriers/dhl/dutypaymenttype','R'),(355,'default',0,'carriers/dhl/allowed_methods','IE,E SAT,E 10:30AM,E,N,S,G'),(356,'default',0,'carriers/dhl/specificerrmsg','This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),(357,'default',0,'carriers/dhl/free_method','G'),(358,'default',0,'carriers/dhl/free_shipping_enable','0'),(359,'default',0,'carriers/dhl/free_shipping_subtotal',''),(360,'default',0,'carriers/dhl/additional_protection_enabled','0'),(361,'default',0,'carriers/dhl/additional_protection_min_value',''),(362,'default',0,'carriers/dhl/additional_protection_use_subtotal','0'),(363,'default',0,'carriers/dhl/additional_protection_value',''),(364,'default',0,'carriers/dhl/additional_protection_rounding','0'),(365,'default',0,'carriers/dhl/hazardous_materials','0'),(366,'default',0,'carriers/dhl/default_length',''),(367,'default',0,'carriers/dhl/default_width',''),(368,'default',0,'carriers/dhl/default_height',''),(369,'default',0,'carriers/dhl/shipment_days','1,2,3,4,5,6'),(370,'default',0,'carriers/dhl/intl_shipment_days','1,2,3,4,5'),(371,'default',0,'carriers/dhl/sallowspecific','0'),(372,'default',0,'carriers/dhl/specificcountry',''),(373,'default',0,'carriers/dhl/showmethod','0'),(374,'default',0,'carriers/dhl/debug','0'),(375,'default',0,'carriers/dhl/sort_order','');
/*!40000 ALTER TABLE `core_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_email_template`
--

DROP TABLE IF EXISTS `core_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_email_template` (
  `template_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `template_code` varchar(150) DEFAULT NULL,
  `template_text` text,
  `template_styles` text,
  `template_type` int(3) unsigned DEFAULT NULL,
  `template_subject` varchar(200) DEFAULT NULL,
  `template_sender_name` varchar(200) DEFAULT NULL,
  `template_sender_email` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `added_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `orig_template_code` varchar(200) DEFAULT NULL,
  `orig_template_variables` text NOT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `template_code` (`template_code`),
  KEY `added_at` (`added_at`),
  KEY `modified_at` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_email_template`
--

LOCK TABLES `core_email_template` WRITE;
/*!40000 ALTER TABLE `core_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_flag`
--

DROP TABLE IF EXISTS `core_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flag_code` varchar(255) NOT NULL,
  `state` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flag_data` text,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`flag_id`),
  KEY `last_update` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_flag`
--

LOCK TABLES `core_flag` WRITE;
/*!40000 ALTER TABLE `core_flag` DISABLE KEYS */;
INSERT INTO `core_flag` VALUES (1,'catalog_product_flat',0,'a:1:{s:8:\"is_built\";b:1;}','2011-06-30 01:51:26');
/*!40000 ALTER TABLE `core_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_layout_link`
--

DROP TABLE IF EXISTS `core_layout_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area` varchar(64) NOT NULL DEFAULT '',
  `package` varchar(64) NOT NULL DEFAULT '',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_link_id`),
  UNIQUE KEY `store_id` (`store_id`,`package`,`theme`,`layout_update_id`),
  KEY `FK_core_layout_link_update` (`layout_update_id`),
  CONSTRAINT `FK_CORE_LAYOUT_LINK_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_LAYOUT_LINK_UPDATE` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_layout_link`
--

LOCK TABLES `core_layout_link` WRITE;
/*!40000 ALTER TABLE `core_layout_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_layout_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_layout_update`
--

DROP TABLE IF EXISTS `core_layout_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) DEFAULT NULL,
  `xml` text,
  `sort_order` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_update_id`),
  KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_layout_update`
--

LOCK TABLES `core_layout_update` WRITE;
/*!40000 ALTER TABLE `core_layout_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_layout_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_resource`
--

DROP TABLE IF EXISTS `core_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_resource` (
  `code` varchar(50) NOT NULL DEFAULT '',
  `version` varchar(50) NOT NULL DEFAULT '',
  `data_version` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource version registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_resource`
--

LOCK TABLES `core_resource` WRITE;
/*!40000 ALTER TABLE `core_resource` DISABLE KEYS */;
INSERT INTO `core_resource` VALUES ('adminnotification_setup','1.0.0','1.0.0'),('admin_setup','0.7.2','0.7.2'),('api_setup','0.8.1','0.8.1'),('backup_setup','0.7.0','0.7.0'),('banner_setup','0.2.0','0.2.0'),('brazilianregions_setup','0.1.0','0.1.0'),('brunoassarisse_pagseguro_setup','1.1.5','1.1.5'),('bundle_setup','0.1.13','0.1.13'),('canonicalurl_setup','0.1.0','0.1.0'),('catalogindex_setup','0.7.10','0.7.10'),('cataloginventory_setup','0.7.8','0.7.8'),('catalogrule_setup','0.7.10','0.7.10'),('catalogsearch_setup','0.7.7','0.7.7'),('catalog_setup','1.4.0.0.38','1.4.0.0.38'),('checkout_setup','0.9.5','0.9.5'),('cms_setup','0.7.13','0.7.13'),('compiler_setup','0.1.0','0.1.0'),('contacts_setup','0.8.0','0.8.0'),('core_setup','0.8.27','0.8.27'),('cron_setup','0.7.1','0.7.1'),('customer_setup','1.4.0.0.13','1.4.0.0.13'),('dataflow_setup','0.7.4','0.7.4'),('directory_setup','0.8.11','0.8.11'),('downloadable_setup','1.4.0.1','1.4.0.1'),('eav_setup','0.7.15','0.7.15'),('find_feed_setup','0.0.2','0.0.2'),('giftmessage_setup','0.7.2','0.7.2'),('googlebase_setup','0.1.2','0.1.2'),('googlecheckout_setup','0.7.4','0.7.4'),('googleoptimizer_setup','0.1.2','0.1.2'),('index_setup','1.4.0.2','1.4.0.2'),('interaktingslider_setup','1.0.6','1.0.6'),('log_setup','0.7.7','0.7.7'),('matrixrate_setup','2.0.2','2.0.2'),('metarobots_setup','0.1.0','0.1.0'),('moneybookers_setup','1.2.0.1','1.2.0.1'),('newsletter_setup','0.8.3','0.8.3'),('paygate_setup','0.7.1','0.7.1'),('payment_setup','0.7.0','0.7.0'),('paypaluk_setup','0.7.0','0.7.0'),('paypal_setup','1.4.0.1','1.4.0.1'),('pedroteixeira_correios_setup','4.1.0','4.1.0'),('poll_setup','0.7.2','0.7.2'),('productalert_setup','0.7.2','0.7.2'),('rating_setup','0.7.2','0.7.2'),('reports_setup','0.7.10','0.7.10'),('review_setup','0.7.6','0.7.6'),('salesrule_setup','1.4.0.0.6','1.4.0.0.6'),('sales_setup','1.4.0.21','1.4.0.21'),('sendfriend_setup','0.7.4','0.7.4'),('shipping_setup','0.7.0','0.7.0'),('sitemap_setup','0.7.2','0.7.2'),('tag_setup','0.7.7','0.7.7'),('tax_setup','1.4.0.0','1.4.0.0'),('usa_setup','0.7.1','0.7.1'),('weee_setup','0.13','0.13'),('widget_setup','1.4.0.0.0','1.4.0.0.0'),('wishlist_setup','0.7.8','0.7.8');
/*!40000 ALTER TABLE `core_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_session`
--

DROP TABLE IF EXISTS `core_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_session` (
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `website_id` smallint(5) unsigned DEFAULT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` mediumblob NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `FK_SESSION_WEBSITE` (`website_id`),
  CONSTRAINT `FK_SESSION_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Session data store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_session`
--

LOCK TABLES `core_session` WRITE;
/*!40000 ALTER TABLE `core_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_store`
--

DROP TABLE IF EXISTS `core_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '',
  `website_id` smallint(5) unsigned DEFAULT '0',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_STORE_WEBSITE` (`website_id`),
  KEY `is_active` (`is_active`,`sort_order`),
  KEY `FK_STORE_GROUP` (`group_id`),
  CONSTRAINT `FK_STORE_GROUP_STORE` FOREIGN KEY (`group_id`) REFERENCES `core_store_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_STORE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store`
--

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` VALUES (0,'admin',0,0,'Admin',0,1),(1,'default',1,1,'Português (Brasil)',0,1);
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_store_group`
--

DROP TABLE IF EXISTS `core_store_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `FK_STORE_GROUP_WEBSITE` (`website_id`),
  KEY `default_store_id` (`default_store_id`),
  CONSTRAINT `FK_STORE_GROUP_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store_group`
--

LOCK TABLES `core_store_group` WRITE;
/*!40000 ALTER TABLE `core_store_group` DISABLE KEYS */;
INSERT INTO `core_store_group` VALUES (0,0,'Default',0,0),(1,1,'Loja Principal',2,1);
/*!40000 ALTER TABLE `core_store_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_translate`
--

DROP TABLE IF EXISTS `core_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_translate` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `string` varchar(255) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `translate` varchar(255) NOT NULL DEFAULT '',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `IDX_CODE` (`store_id`,`locale`,`string`),
  KEY `FK_CORE_TRANSLATE_STORE` (`store_id`),
  CONSTRAINT `FK_CORE_TRANSLATE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translation data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_translate`
--

LOCK TABLES `core_translate` WRITE;
/*!40000 ALTER TABLE `core_translate` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_url_rewrite`
--

DROP TABLE IF EXISTS `core_url_rewrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `id_path` varchar(255) NOT NULL DEFAULT '',
  `request_path` varchar(255) NOT NULL DEFAULT '',
  `target_path` varchar(255) NOT NULL DEFAULT '',
  `is_system` tinyint(1) unsigned DEFAULT '1',
  `options` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `UNQ_REQUEST_PATH` (`request_path`,`store_id`),
  UNIQUE KEY `UNQ_PATH` (`id_path`,`is_system`,`store_id`),
  KEY `FK_CORE_URL_REWRITE_STORE` (`store_id`),
  KEY `IDX_ID_PATH` (`id_path`),
  KEY `IDX_TARGET_PATH` (`target_path`,`store_id`),
  KEY `FK_CORE_URL_REWRITE_PRODUCT` (`product_id`),
  KEY `IDX_CATEGORY_REWRITE` (`category_id`,`is_system`,`product_id`,`store_id`,`id_path`),
  CONSTRAINT `FK_CORE_URL_REWRITE_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_URL_REWRITE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_URL_REWRITE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_url_rewrite`
--

LOCK TABLES `core_url_rewrite` WRITE;
/*!40000 ALTER TABLE `core_url_rewrite` DISABLE KEYS */;
INSERT INTO `core_url_rewrite` VALUES (1,1,NULL,1,'product/1','nokia-2610-phone.html','catalog/product/view/id/1',1,'',NULL),(2,1,NULL,2,'product/2','blackberry-8100-pearl.html','catalog/product/view/id/2',1,'',NULL),(3,1,NULL,3,'product/3','sony-ericsson-w810i.html','catalog/product/view/id/3',1,'',NULL),(4,1,NULL,4,'product/4','atandt-8525-pda.html','catalog/product/view/id/4',1,'',NULL),(5,1,NULL,5,'product/5','samsung-mm-a900m-ace.html','catalog/product/view/id/5',1,'',NULL),(6,1,NULL,6,'product/6','apple-macbook-pro-ma464ll-a-15-4-notebook-pc-2-0-ghz-intel-core-duo-1-gb-ram-100-gb-hard-drive-superdrive.html','catalog/product/view/id/6',1,'',NULL),(7,1,NULL,7,'product/7','acer-ferrari-3200-notebook-computer-pc.html','catalog/product/view/id/7',1,'',NULL),(8,1,NULL,8,'product/8','sony-vaio-vgn-txn27n-b-11-1-notebook-pc.html','catalog/product/view/id/8',1,'',NULL),(9,1,NULL,9,'product/9','toshiba-satellite-a135-s4527-155-4-notebook-pc-intel-pentium-dual-core-processor-t2080-1-gb-ram-120-gb-hard-drive-supermulti-dvd-drive-vista-premium.html','catalog/product/view/id/9',1,'',NULL),(10,1,NULL,10,'product/10','cn-clogs-beach-garden-clog-3.html','catalog/product/view/id/10',1,'',NULL),(11,1,NULL,11,'product/11','asics-men-s-gel-kayano-xii-8.html','catalog/product/view/id/11',1,'',NULL),(12,1,NULL,12,'product/12','steven-by-steve-madden-pryme-pump-4.html','catalog/product/view/id/12',1,'',NULL),(13,1,NULL,13,'product/13','nine-west-women-s-lucero-pump-3.html','catalog/product/view/id/13',1,'',NULL),(14,1,NULL,14,'product/14','ecco-womens-golf-flexor-golf-shoe-3.html','catalog/product/view/id/14',1,'',NULL),(15,1,NULL,15,'product/15','kenneth-cole-new-york-men-s-con-verge-slip-on-8.html','catalog/product/view/id/15',1,'',NULL),(16,1,NULL,16,'product/16','coalesce-functioning-on-impatience-t-shirt-small.html','catalog/product/view/id/16',1,'',NULL),(17,1,NULL,17,'product/17','ink-eater-krylon-bombear-destroyed-tee-sm.html','catalog/product/view/id/17',1,'',NULL),(18,1,NULL,18,'product/18','the-only-children-paisley-t-shirt-sm.html','catalog/product/view/id/18',1,'',NULL),(19,1,NULL,19,'product/19','zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-r-sm.html','catalog/product/view/id/19',1,'',NULL),(20,1,NULL,20,'product/20','the-get-up-kids-band-camp-pullover-hoodie.html','catalog/product/view/id/20',1,'',NULL),(21,1,NULL,21,'product/21','akio-dresser.html','catalog/product/view/id/21',1,'',NULL),(22,1,NULL,22,'product/22','barcelona-bamboo-platform-bed.html','catalog/product/view/id/22',1,'',NULL),(23,1,NULL,23,'product/23','canon-digital-rebel-xt-8mp-digital-slr-camera-with-ef-s-18-55mm-f3-5-5-6-lens-black.html','catalog/product/view/id/23',1,'',NULL),(24,1,NULL,24,'product/24','argus-qc-2185-quick-click-5mp-digital-camera.html','catalog/product/view/id/24',1,'',NULL),(25,1,NULL,25,'product/25','olympus-stylus-750-7-1mp-digital-camera.html','catalog/product/view/id/25',1,'',NULL),(26,1,NULL,26,'product/26','canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom.html','catalog/product/view/id/26',1,'',NULL),(27,1,NULL,27,'product/27','kodak-easyshare-c530-5mp-digital-camera.html','catalog/product/view/id/27',1,'',NULL),(28,1,NULL,28,'product/28','anashria-womens-premier-leather-sandal-9.html','catalog/product/view/id/28',1,'',NULL),(29,1,NULL,29,'product/29','ottoman.html','catalog/product/view/id/29',1,'',NULL),(30,1,NULL,30,'product/30','chair.html','catalog/product/view/id/30',1,'',NULL),(31,1,NULL,31,'product/31','couch.html','catalog/product/view/id/31',1,'',NULL),(32,1,NULL,32,'product/32','magento-red-furniture-set.html','catalog/product/view/id/32',1,'',NULL),(33,1,NULL,33,'product/33','anashria-womens-premier-leather-sandal-3.html','catalog/product/view/id/33',1,'',NULL),(34,1,NULL,34,'product/34','anashria-womens-premier-leather-sandal-4.html','catalog/product/view/id/34',1,'',NULL),(35,1,NULL,35,'product/35','anashria-womens-premier-leather-sandal-5.html','catalog/product/view/id/35',1,'',NULL),(36,1,NULL,36,'product/36','anashria-womens-premier-leather-sandal-6.html','catalog/product/view/id/36',1,'',NULL),(37,1,NULL,37,'product/37','anashria-womens-premier-leather-sandal-7.html','catalog/product/view/id/37',1,'',NULL),(38,1,NULL,38,'product/38','anashria-womens-premier-leather-sandal-8.html','catalog/product/view/id/38',1,'',NULL),(39,1,NULL,39,'product/39','cn-clogs-beach-garden-clog.html','catalog/product/view/id/39',1,'',NULL),(40,1,NULL,40,'product/40','cn-clogs-beach-garden-clog-4.html','catalog/product/view/id/40',1,'',NULL),(41,1,NULL,41,'product/41','cn-clogs-beach-garden-clog-5.html','catalog/product/view/id/41',1,'',NULL),(42,1,NULL,42,'product/42','cn-clogs-beach-garden-clog-6.html','catalog/product/view/id/42',1,'',NULL),(43,1,NULL,43,'product/43','cn-clogs-beach-garden-clog-7.html','catalog/product/view/id/43',1,'',NULL),(44,1,NULL,44,'product/44','cn-clogs-beach-garden-clog-8.html','catalog/product/view/id/44',1,'',NULL),(45,1,NULL,45,'product/45','cn-clogs-beach-garden-clog-9.html','catalog/product/view/id/45',1,'',NULL),(46,1,NULL,46,'product/46','cn-clogs-beach-garden-clog-10.html','catalog/product/view/id/46',1,'',NULL),(47,1,NULL,47,'product/47','cn-clogs-beach-garden-clog-11.html','catalog/product/view/id/47',1,'',NULL),(48,1,NULL,48,'product/48','cn-clogs-beach-garden-clog-12.html','catalog/product/view/id/48',1,'',NULL),(49,1,NULL,49,'product/49','asics-men-s-gel-kayano-xii.html','catalog/product/view/id/49',1,'',NULL),(50,1,NULL,50,'product/50','asics-men-s-gel-kayano-xii-9.html','catalog/product/view/id/50',1,'',NULL);
/*!40000 ALTER TABLE `core_url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_variable`
--

DROP TABLE IF EXISTS `core_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_variable` (
  `variable_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `IDX_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_variable`
--

LOCK TABLES `core_variable` WRITE;
/*!40000 ALTER TABLE `core_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_variable_value`
--

DROP TABLE IF EXISTS `core_variable_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_variable_value` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `variable_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `plain_value` text NOT NULL,
  `html_value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_VARIABLE_STORE` (`variable_id`,`store_id`),
  KEY `IDX_VARIABLE_ID` (`variable_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CORE_VARIABLE_VALUE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_VARIABLE_VALUE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `core_variable` (`variable_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_variable_value`
--

LOCK TABLES `core_variable_value` WRITE;
/*!40000 ALTER TABLE `core_variable_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_variable_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_website`
--

DROP TABLE IF EXISTS `core_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `code` (`code`),
  KEY `sort_order` (`sort_order`),
  KEY `default_group_id` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Websites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_website`
--

LOCK TABLES `core_website` WRITE;
/*!40000 ALTER TABLE `core_website` DISABLE KEYS */;
INSERT INTO `core_website` VALUES (0,'admin','Admin',0,0,0),(1,'base','Website Principal',0,1,1);
/*!40000 ALTER TABLE `core_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_aggregated`
--

DROP TABLE IF EXISTS `coupon_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_aggregated` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `coupon_code` varchar(50) NOT NULL DEFAULT '',
  `coupon_uses` int(11) NOT NULL DEFAULT '0',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGREGATED_PSOC` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALESTRULE_COUPON_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_aggregated`
--

LOCK TABLES `coupon_aggregated` WRITE;
/*!40000 ALTER TABLE `coupon_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_aggregated_order`
--

DROP TABLE IF EXISTS `coupon_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_aggregated_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `coupon_code` varchar(50) NOT NULL DEFAULT '',
  `coupon_uses` int(11) NOT NULL DEFAULT '0',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGREGATED_ORDER_PSOC` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALESTRULE_COUPON_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_aggregated_order`
--

LOCK TABLES `coupon_aggregated_order` WRITE;
/*!40000 ALTER TABLE `coupon_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_schedule`
--

DROP TABLE IF EXISTS `cron_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_code` varchar(255) NOT NULL DEFAULT '0',
  `status` enum('pending','running','success','missed','error') NOT NULL DEFAULT 'pending',
  `messages` text,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `executed_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `finished_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`schedule_id`),
  KEY `task_name` (`job_code`),
  KEY `scheduled_at` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_schedule`
--

LOCK TABLES `cron_schedule` WRITE;
/*!40000 ALTER TABLE `cron_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity`
--

DROP TABLE IF EXISTS `customer_address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_id` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  KEY `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` (`parent_id`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Customer Address Entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity`
--

LOCK TABLES `customer_address_entity` WRITE;
/*!40000 ALTER TABLE `customer_address_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `customer_address_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_datetime`
--

LOCK TABLES `customer_address_entity_datetime` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `customer_address_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_decimal`
--

LOCK TABLES `customer_address_entity_decimal` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_int`
--

DROP TABLE IF EXISTS `customer_address_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_int`
--

LOCK TABLES `customer_address_entity_int` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_text`
--

DROP TABLE IF EXISTS `customer_address_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_text`
--

LOCK TABLES `customer_address_entity_text` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_varchar`
--

LOCK TABLES `customer_address_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_eav_attribute`
--

DROP TABLE IF EXISTS `customer_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `input_filter` varchar(255) DEFAULT NULL,
  `multiline_count` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `validate_rules` text,
  `is_system` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `data_model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`),
  CONSTRAINT `FK_CUSTOMER_EAV_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_eav_attribute`
--

LOCK TABLES `customer_eav_attribute` WRITE;
/*!40000 ALTER TABLE `customer_eav_attribute` DISABLE KEYS */;
INSERT INTO `customer_eav_attribute` VALUES (1,1,'',0,NULL,1,10,NULL),(2,0,'',0,NULL,1,0,NULL),(3,1,'',0,NULL,1,20,NULL),(4,0,'',0,NULL,0,30,NULL),(5,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,40,NULL),(6,0,'',0,NULL,0,50,NULL),(7,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,60,NULL),(8,0,'',0,NULL,0,70,NULL),(9,1,'',0,'a:1:{s:16:\"input_validation\";s:5:\"email\";}',1,80,NULL),(10,1,'',0,NULL,1,25,NULL),(11,0,'date',0,'a:1:{s:16:\"input_validation\";s:4:\"date\";}',0,90,NULL),(12,0,'',0,NULL,1,0,NULL),(13,0,'',0,NULL,1,0,NULL),(14,0,'',0,NULL,1,0,NULL),(15,0,'',0,'a:1:{s:15:\"max_text_length\";i:255;}',0,100,NULL),(16,0,'',0,NULL,1,0,NULL),(17,0,'',0,NULL,0,0,NULL),(18,0,'',0,NULL,0,10,NULL),(19,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,20,NULL),(20,0,'',0,NULL,0,30,NULL),(21,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,40,NULL),(22,0,'',0,NULL,0,50,NULL),(23,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,60,NULL),(24,1,'',2,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,70,NULL),(25,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,80,NULL),(26,1,'',0,NULL,1,90,NULL),(27,1,'',0,NULL,1,100,NULL),(28,1,'',0,NULL,1,100,NULL),(29,1,'',0,'a:0:{}',1,110,'customer/attribute_data_postcode'),(30,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,120,NULL),(31,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,130,NULL),(32,0,'',0,'a:0:{}',0,110,NULL);
/*!40000 ALTER TABLE `customer_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `customer_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `is_visible` tinyint(1) unsigned DEFAULT NULL,
  `is_required` tinyint(1) unsigned DEFAULT NULL,
  `default_value` text,
  `multiline_count` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CUST_EAV_ATTR_WEBST_WEBST_CORE_WEBST` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUST_EAV_ATTR_WEBST_ATTR_EAV_ATTR` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_eav_attribute_website`
--

LOCK TABLES `customer_eav_attribute_website` WRITE;
/*!40000 ALTER TABLE `customer_eav_attribute_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_eav_attribute_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity`
--

DROP TABLE IF EXISTS `customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `group_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `increment_id` varchar(50) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  KEY `FK_CUSTOMER_ENTITY_STORE` (`store_id`),
  KEY `IDX_ENTITY_TYPE` (`entity_type_id`),
  KEY `IDX_AUTH` (`email`,`website_id`),
  KEY `FK_CUSTOMER_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CUSTOMER_ENTITY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Customer Entityies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity`
--

LOCK TABLES `customer_entity` WRITE;
/*!40000 ALTER TABLE `customer_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_datetime`
--

DROP TABLE IF EXISTS `customer_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_datetime`
--

LOCK TABLES `customer_entity_datetime` WRITE;
/*!40000 ALTER TABLE `customer_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_decimal`
--

DROP TABLE IF EXISTS `customer_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_decimal`
--

LOCK TABLES `customer_entity_decimal` WRITE;
/*!40000 ALTER TABLE `customer_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_int`
--

DROP TABLE IF EXISTS `customer_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_int`
--

LOCK TABLES `customer_entity_int` WRITE;
/*!40000 ALTER TABLE `customer_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_text`
--

DROP TABLE IF EXISTS `customer_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CUSTOMER_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_text`
--

LOCK TABLES `customer_entity_text` WRITE;
/*!40000 ALTER TABLE `customer_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_varchar`
--

DROP TABLE IF EXISTS `customer_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_varchar`
--

LOCK TABLES `customer_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_form_attribute`
--

DROP TABLE IF EXISTS `customer_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_form_attribute` (
  `form_code` char(32) NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `IDX_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer attributes/forms relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_form_attribute`
--

LOCK TABLES `customer_form_attribute` WRITE;
/*!40000 ALTER TABLE `customer_form_attribute` DISABLE KEYS */;
INSERT INTO `customer_form_attribute` VALUES ('adminhtml_customer',1),('adminhtml_customer',3),('adminhtml_customer',4),('checkout_register',4),('customer_account_create',4),('customer_account_edit',4),('adminhtml_customer',5),('checkout_register',5),('customer_account_create',5),('customer_account_edit',5),('adminhtml_customer',6),('checkout_register',6),('customer_account_create',6),('customer_account_edit',6),('adminhtml_customer',7),('checkout_register',7),('customer_account_create',7),('customer_account_edit',7),('adminhtml_customer',8),('checkout_register',8),('customer_account_create',8),('customer_account_edit',8),('adminhtml_checkout',9),('adminhtml_customer',9),('checkout_register',9),('customer_account_create',9),('customer_account_edit',9),('adminhtml_checkout',10),('adminhtml_customer',10),('adminhtml_checkout',11),('adminhtml_customer',11),('checkout_register',11),('customer_account_create',11),('customer_account_edit',11),('adminhtml_checkout',15),('adminhtml_customer',15),('checkout_register',15),('customer_account_create',15),('customer_account_edit',15),('adminhtml_customer_address',18),('customer_address_edit',18),('customer_register_address',18),('adminhtml_customer_address',19),('customer_address_edit',19),('customer_register_address',19),('adminhtml_customer_address',20),('customer_address_edit',20),('customer_register_address',20),('adminhtml_customer_address',21),('customer_address_edit',21),('customer_register_address',21),('adminhtml_customer_address',22),('customer_address_edit',22),('customer_register_address',22),('adminhtml_customer_address',23),('customer_address_edit',23),('customer_register_address',23),('adminhtml_customer_address',24),('customer_address_edit',24),('customer_register_address',24),('adminhtml_customer_address',25),('customer_address_edit',25),('customer_register_address',25),('adminhtml_customer_address',26),('customer_address_edit',26),('customer_register_address',26),('adminhtml_customer_address',27),('customer_address_edit',27),('customer_register_address',27),('adminhtml_customer_address',28),('customer_address_edit',28),('customer_register_address',28),('adminhtml_customer_address',29),('customer_address_edit',29),('customer_register_address',29),('adminhtml_customer_address',30),('customer_address_edit',30),('customer_register_address',30),('adminhtml_customer_address',31),('customer_address_edit',31),('customer_register_address',31),('adminhtml_checkout',32),('adminhtml_customer',32),('checkout_register',32),('customer_account_create',32),('customer_account_edit',32);
/*!40000 ALTER TABLE `customer_form_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_group` (
  `customer_group_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_code` varchar(32) NOT NULL DEFAULT '',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Customer groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group`
--

LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;
INSERT INTO `customer_group` VALUES (0,'Visitante',3),(1,'Comum',3),(2,'Atacado',3),(3,'Revenda',3);
/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_batch`
--

DROP TABLE IF EXISTS `dataflow_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_batch` (
  `batch_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `adapter` varchar(128) DEFAULT NULL,
  `params` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `FK_DATAFLOW_BATCH_PROFILE` (`profile_id`),
  KEY `FK_DATAFLOW_BATCH_STORE` (`store_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_DATAFLOW_BATCH_PROFILE` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DATAFLOW_BATCH_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_batch`
--

LOCK TABLES `dataflow_batch` WRITE;
/*!40000 ALTER TABLE `dataflow_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_batch_export`
--

DROP TABLE IF EXISTS `dataflow_batch_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_batch_export` (
  `batch_export_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `batch_data` longtext,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`batch_export_id`),
  KEY `FK_DATAFLOW_BATCH_EXPORT_BATCH` (`batch_id`),
  CONSTRAINT `FK_DATAFLOW_BATCH_EXPORT_BATCH` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_batch_export`
--

LOCK TABLES `dataflow_batch_export` WRITE;
/*!40000 ALTER TABLE `dataflow_batch_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_batch_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_batch_import`
--

DROP TABLE IF EXISTS `dataflow_batch_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_batch_import` (
  `batch_import_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `batch_data` longtext,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`batch_import_id`),
  KEY `FK_DATAFLOW_BATCH_IMPORT_BATCH` (`batch_id`),
  CONSTRAINT `FK_DATAFLOW_BATCH_IMPORT_BATCH` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_batch_import`
--

LOCK TABLES `dataflow_batch_import` WRITE;
/*!40000 ALTER TABLE `dataflow_batch_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_batch_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_import_data`
--

DROP TABLE IF EXISTS `dataflow_import_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_import_data` (
  `import_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  `value` text,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`import_id`),
  KEY `FK_dataflow_import_data` (`session_id`),
  CONSTRAINT `FK_dataflow_import_data` FOREIGN KEY (`session_id`) REFERENCES `dataflow_session` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_import_data`
--

LOCK TABLES `dataflow_import_data` WRITE;
/*!40000 ALTER TABLE `dataflow_import_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_import_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_profile`
--

DROP TABLE IF EXISTS `dataflow_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actions_xml` text,
  `gui_data` text,
  `direction` enum('import','export') DEFAULT NULL,
  `entity_type` varchar(64) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `data_transfer` enum('file','interactive') DEFAULT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_profile`
--

LOCK TABLES `dataflow_profile` WRITE;
/*!40000 ALTER TABLE `dataflow_profile` DISABLE KEYS */;
INSERT INTO `dataflow_profile` VALUES (1,'Exportar Todos Produtos','2011-06-29 22:20:34','2011-06-29 22:20:34','<action type=\"catalog/convert_adapter_product\" method=\"load\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\r\n</action>\r\n\r\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\r\n    <var name=\"type\">file</var>\r\n    <var name=\"path\">var/export</var>\r\n    <var name=\"filename\"><![CDATA[export_all_products.csv]]></var>\r\n</action>\r\n\r\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','product',0,'file'),(2,'Exportar Estoque Produtos','2011-06-29 22:20:34','2011-06-29 22:20:34','<action type=\"catalog/convert_adapter_product\" method=\"load\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\r\n    <var name=\"map\">\r\n        <map name=\"store\"><![CDATA[store]]></map>\r\n        <map name=\"sku\"><![CDATA[sku]]></map>\r\n        <map name=\"qty\"><![CDATA[qty]]></map>\r\n        <map name=\"is_in_stock\"><![CDATA[is_in_stock]]></map>\r\n    </var>\r\n    <var name=\"_only_specified\">true</var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\r\n    <var name=\"type\">file</var>\r\n    <var name=\"path\">var/export</var>\r\n    <var name=\"filename\"><![CDATA[export_product_stocks.csv]]></var>\r\n</action>\r\n\r\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:25:\"export_product_stocks.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:4:\"true\";s:7:\"product\";a:2:{s:2:\"db\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}s:4:\"file\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','product',0,'file'),(3,'Importar Todos Produtos','2011-06-29 22:20:34','2011-06-29 22:20:34','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\r\n    <var name=\"method\">parse</var>\r\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','product',0,'interactive'),(4,'Importar Estoque Produtos','2011-06-29 22:20:34','2011-06-29 22:20:34','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\r\n    <var name=\"method\">parse</var>\r\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:18:\"export_product.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','product',0,'interactive'),(5,'Exportar Clientes','2011-06-29 22:20:34','2011-06-29 22:20:34','<action type=\"customer/convert_adapter_customer\" method=\"load\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n    <var name=\"filter/adressType\"><![CDATA[default_billing]]></var>\r\n</action>\r\n\r\n<action type=\"customer/convert_parser_customer\" method=\"unparse\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\r\n</action>\r\n\r\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\r\n    <var name=\"type\">file</var>\r\n    <var name=\"path\">var/export</var>\r\n    <var name=\"filename\"><![CDATA[export_customers.csv]]></var>\r\n</action>\r\n\r\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:20:\"export_customers.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','customer',0,'file'),(6,'Importar Clientes','2011-06-29 22:20:34','2011-06-29 22:20:34','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n    <var name=\"adapter\">customer/convert_adapter_customer</var>\r\n    <var name=\"method\">parse</var>\r\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:19:\"export_customer.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','customer',0,'interactive');
/*!40000 ALTER TABLE `dataflow_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_profile_history`
--

DROP TABLE IF EXISTS `dataflow_profile_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_profile_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_code` varchar(64) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `performed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `FK_dataflow_profile_history` (`profile_id`),
  CONSTRAINT `FK_dataflow_profile_history` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_profile_history`
--

LOCK TABLES `dataflow_profile_history` WRITE;
/*!40000 ALTER TABLE `dataflow_profile_history` DISABLE KEYS */;
INSERT INTO `dataflow_profile_history` VALUES (1,3,'run',1,'2011-06-30 01:41:25');
/*!40000 ALTER TABLE `dataflow_profile_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_session`
--

DROP TABLE IF EXISTS `dataflow_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_session` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `direction` varchar(32) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_session`
--

LOCK TABLES `dataflow_session` WRITE;
/*!40000 ALTER TABLE `dataflow_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design_change`
--

DROP TABLE IF EXISTS `design_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `design` varchar(255) NOT NULL DEFAULT '',
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`design_change_id`),
  KEY `FK_DESIGN_CHANGE_STORE` (`store_id`),
  CONSTRAINT `FK_DESIGN_CHANGE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design_change`
--

LOCK TABLES `design_change` WRITE;
/*!40000 ALTER TABLE `design_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `design_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country`
--

DROP TABLE IF EXISTS `directory_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL DEFAULT '',
  `iso2_code` varchar(2) NOT NULL DEFAULT '',
  `iso3_code` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country`
--

LOCK TABLES `directory_country` WRITE;
/*!40000 ALTER TABLE `directory_country` DISABLE KEYS */;
INSERT INTO `directory_country` VALUES ('AD','AD','AND'),('AE','AE','ARE'),('AF','AF','AFG'),('AG','AG','ATG'),('AI','AI','AIA'),('AL','AL','ALB'),('AM','AM','ARM'),('AN','AN','ANT'),('AO','AO','AGO'),('AQ','AQ','ATA'),('AR','AR','ARG'),('AS','AS','ASM'),('AT','AT','AUT'),('AU','AU','AUS'),('AW','AW','ABW'),('AX','AX','ALA'),('AZ','AZ','AZE'),('BA','BA','BIH'),('BB','BB','BRB'),('BD','BD','BGD'),('BE','BE','BEL'),('BF','BF','BFA'),('BG','BG','BGR'),('BH','BH','BHR'),('BI','BI','BDI'),('BJ','BJ','BEN'),('BL','BL','BLM'),('BM','BM','BMU'),('BN','BN','BRN'),('BO','BO','BOL'),('BR','BR','BRA'),('BS','BS','BHS'),('BT','BT','BTN'),('BV','BV','BVT'),('BW','BW','BWA'),('BY','BY','BLR'),('BZ','BZ','BLZ'),('CA','CA','CAN'),('CC','CC','CCK'),('CD','CD','COD'),('CF','CF','CAF'),('CG','CG','COG'),('CH','CH','CHE'),('CI','CI','CIV'),('CK','CK','COK'),('CL','CL','CHL'),('CM','CM','CMR'),('CN','CN','CHN'),('CO','CO','COL'),('CR','CR','CRI'),('CU','CU','CUB'),('CV','CV','CPV'),('CX','CX','CXR'),('CY','CY','CYP'),('CZ','CZ','CZE'),('DE','DE','DEU'),('DJ','DJ','DJI'),('DK','DK','DNK'),('DM','DM','DMA'),('DO','DO','DOM'),('DZ','DZ','DZA'),('EC','EC','ECU'),('EE','EE','EST'),('EG','EG','EGY'),('EH','EH','ESH'),('ER','ER','ERI'),('ES','ES','ESP'),('ET','ET','ETH'),('FI','FI','FIN'),('FJ','FJ','FJI'),('FK','FK','FLK'),('FM','FM','FSM'),('FO','FO','FRO'),('FR','FR','FRA'),('GA','GA','GAB'),('GB','GB','GBR'),('GD','GD','GRD'),('GE','GE','GEO'),('GF','GF','GUF'),('GG','GG','GGY'),('GH','GH','GHA'),('GI','GI','GIB'),('GL','GL','GRL'),('GM','GM','GMB'),('GN','GN','GIN'),('GP','GP','GLP'),('GQ','GQ','GNQ'),('GR','GR','GRC'),('GS','GS','SGS'),('GT','GT','GTM'),('GU','GU','GUM'),('GW','GW','GNB'),('GY','GY','GUY'),('HK','HK','HKG'),('HM','HM','HMD'),('HN','HN','HND'),('HR','HR','HRV'),('HT','HT','HTI'),('HU','HU','HUN'),('ID','ID','IDN'),('IE','IE','IRL'),('IL','IL','ISR'),('IM','IM','IMN'),('IN','IN','IND'),('IO','IO','IOT'),('IQ','IQ','IRQ'),('IR','IR','IRN'),('IS','IS','ISL'),('IT','IT','ITA'),('JE','JE','JEY'),('JM','JM','JAM'),('JO','JO','JOR'),('JP','JP','JPN'),('KE','KE','KEN'),('KG','KG','KGZ'),('KH','KH','KHM'),('KI','KI','KIR'),('KM','KM','COM'),('KN','KN','KNA'),('KP','KP','PRK'),('KR','KR','KOR'),('KW','KW','KWT'),('KY','KY','CYM'),('KZ','KZ','KAZ'),('LA','LA','LAO'),('LB','LB','LBN'),('LC','LC','LCA'),('LI','LI','LIE'),('LK','LK','LKA'),('LR','LR','LBR'),('LS','LS','LSO'),('LT','LT','LTU'),('LU','LU','LUX'),('LV','LV','LVA'),('LY','LY','LBY'),('MA','MA','MAR'),('MC','MC','MCO'),('MD','MD','MDA'),('ME','ME','MNE'),('MF','MF','MAF'),('MG','MG','MDG'),('MH','MH','MHL'),('MK','MK','MKD'),('ML','ML','MLI'),('MM','MM','MMR'),('MN','MN','MNG'),('MO','MO','MAC'),('MP','MP','MNP'),('MQ','MQ','MTQ'),('MR','MR','MRT'),('MS','MS','MSR'),('MT','MT','MLT'),('MU','MU','MUS'),('MV','MV','MDV'),('MW','MW','MWI'),('MX','MX','MEX'),('MY','MY','MYS'),('MZ','MZ','MOZ'),('NA','NA','NAM'),('NC','NC','NCL'),('NE','NE','NER'),('NF','NF','NFK'),('NG','NG','NGA'),('NI','NI','NIC'),('NL','NL','NLD'),('NO','NO','NOR'),('NP','NP','NPL'),('NR','NR','NRU'),('NU','NU','NIU'),('NZ','NZ','NZL'),('OM','OM','OMN'),('PA','PA','PAN'),('PE','PE','PER'),('PF','PF','PYF'),('PG','PG','PNG'),('PH','PH','PHL'),('PK','PK','PAK'),('PL','PL','POL'),('PM','PM','SPM'),('PN','PN','PCN'),('PR','PR','PRI'),('PS','PS','PSE'),('PT','PT','PRT'),('PW','PW','PLW'),('PY','PY','PRY'),('QA','QA','QAT'),('RE','RE','REU'),('RO','RO','ROU'),('RS','RS','SRB'),('RU','RU','RUS'),('RW','RW','RWA'),('SA','SA','SAU'),('SB','SB','SLB'),('SC','SC','SYC'),('SD','SD','SDN'),('SE','SE','SWE'),('SG','SG','SGP'),('SH','SH','SHN'),('SI','SI','SVN'),('SJ','SJ','SJM'),('SK','SK','SVK'),('SL','SL','SLE'),('SM','SM','SMR'),('SN','SN','SEN'),('SO','SO','SOM'),('SR','SR','SUR'),('ST','ST','STP'),('SV','SV','SLV'),('SY','SY','SYR'),('SZ','SZ','SWZ'),('TC','TC','TCA'),('TD','TD','TCD'),('TF','TF','ATF'),('TG','TG','TGO'),('TH','TH','THA'),('TJ','TJ','TJK'),('TK','TK','TKL'),('TL','TL','TLS'),('TM','TM','TKM'),('TN','TN','TUN'),('TO','TO','TON'),('TR','TR','TUR'),('TT','TT','TTO'),('TV','TV','TUV'),('TW','TW','TWN'),('TZ','TZ','TZA'),('UA','UA','UKR'),('UG','UG','UGA'),('UM','UM','UMI'),('US','US','USA'),('UY','UY','URY'),('UZ','UZ','UZB'),('VA','VA','VAT'),('VC','VC','VCT'),('VE','VE','VEN'),('VG','VG','VGB'),('VI','VI','VIR'),('VN','VN','VNM'),('VU','VU','VUT'),('WF','WF','WLF'),('WS','WS','WSM'),('YE','YE','YEM'),('YT','YT','MYT'),('ZA','ZA','ZAF'),('ZM','ZM','ZMB'),('ZW','ZW','ZWE');
/*!40000 ALTER TABLE `directory_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_format`
--

DROP TABLE IF EXISTS `directory_country_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` varchar(2) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `format` text NOT NULL,
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `country_type` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries format';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_format`
--

LOCK TABLES `directory_country_format` WRITE;
/*!40000 ALTER TABLE `directory_country_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `directory_country_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_region`
--

DROP TABLE IF EXISTS `directory_country_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_region` (
  `region_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` varchar(4) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL DEFAULT '',
  `default_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`region_id`),
  KEY `FK_REGION_COUNTRY` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8 COMMENT='Country regions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_region`
--

LOCK TABLES `directory_country_region` WRITE;
/*!40000 ALTER TABLE `directory_country_region` DISABLE KEYS */;
INSERT INTO `directory_country_region` VALUES (1,'US','AL','Alabama'),(2,'US','AK','Alaska'),(3,'US','AS','American Samoa'),(4,'US','AZ','Arizona'),(5,'US','AR','Arkansas'),(6,'US','AF','Armed Forces Africa'),(7,'US','AA','Armed Forces Americas'),(8,'US','AC','Armed Forces Canada'),(9,'US','AE','Armed Forces Europe'),(10,'US','AM','Armed Forces Middle East'),(11,'US','AP','Armed Forces Pacific'),(12,'US','CA','California'),(13,'US','CO','Colorado'),(14,'US','CT','Connecticut'),(15,'US','DE','Delaware'),(16,'US','DC','District of Columbia'),(17,'US','FM','Federated States Of Micronesia'),(18,'US','FL','Florida'),(19,'US','GA','Georgia'),(20,'US','GU','Guam'),(21,'US','HI','Hawaii'),(22,'US','ID','Idaho'),(23,'US','IL','Illinois'),(24,'US','IN','Indiana'),(25,'US','IA','Iowa'),(26,'US','KS','Kansas'),(27,'US','KY','Kentucky'),(28,'US','LA','Louisiana'),(29,'US','ME','Maine'),(30,'US','MH','Marshall Islands'),(31,'US','MD','Maryland'),(32,'US','MA','Massachusetts'),(33,'US','MI','Michigan'),(34,'US','MN','Minnesota'),(35,'US','MS','Mississippi'),(36,'US','MO','Missouri'),(37,'US','MT','Montana'),(38,'US','NE','Nebraska'),(39,'US','NV','Nevada'),(40,'US','NH','New Hampshire'),(41,'US','NJ','New Jersey'),(42,'US','NM','New Mexico'),(43,'US','NY','New York'),(44,'US','NC','North Carolina'),(45,'US','ND','North Dakota'),(46,'US','MP','Northern Mariana Islands'),(47,'US','OH','Ohio'),(48,'US','OK','Oklahoma'),(49,'US','OR','Oregon'),(50,'US','PW','Palau'),(51,'US','PA','Pennsylvania'),(52,'US','PR','Puerto Rico'),(53,'US','RI','Rhode Island'),(54,'US','SC','South Carolina'),(55,'US','SD','South Dakota'),(56,'US','TN','Tennessee'),(57,'US','TX','Texas'),(58,'US','UT','Utah'),(59,'US','VT','Vermont'),(60,'US','VI','Virgin Islands'),(61,'US','VA','Virginia'),(62,'US','WA','Washington'),(63,'US','WV','West Virginia'),(64,'US','WI','Wisconsin'),(65,'US','WY','Wyoming'),(66,'CA','AB','Alberta'),(67,'CA','BC','British Columbia'),(68,'CA','MB','Manitoba'),(69,'CA','NL','Newfoundland and Labrador'),(70,'CA','NB','New Brunswick'),(71,'CA','NS','Nova Scotia'),(72,'CA','NT','Northwest Territories'),(73,'CA','NU','Nunavut'),(74,'CA','ON','Ontario'),(75,'CA','PE','Prince Edward Island'),(76,'CA','QC','Quebec'),(77,'CA','SK','Saskatchewan'),(78,'CA','YT','Yukon Territory'),(79,'DE','NDS','Niedersachsen'),(80,'DE','BAW','Baden-Württemberg'),(81,'DE','BAY','Bayern'),(82,'DE','BER','Berlin'),(83,'DE','BRG','Brandenburg'),(84,'DE','BRE','Bremen'),(85,'DE','HAM','Hamburg'),(86,'DE','HES','Hessen'),(87,'DE','MEC','Mecklenburg-Vorpommern'),(88,'DE','NRW','Nordrhein-Westfalen'),(89,'DE','RHE','Rheinland-Pfalz'),(90,'DE','SAR','Saarland'),(91,'DE','SAS','Sachsen'),(92,'DE','SAC','Sachsen-Anhalt'),(93,'DE','SCN','Schleswig-Holstein'),(94,'DE','THE','Thüringen'),(95,'AT','WI','Wien'),(96,'AT','NO','Niederösterreich'),(97,'AT','OO','Oberösterreich'),(98,'AT','SB','Salzburg'),(99,'AT','KN','Kärnten'),(100,'AT','ST','Steiermark'),(101,'AT','TI','Tirol'),(102,'AT','BL','Burgenland'),(103,'AT','VB','Voralberg'),(104,'CH','AG','Aargau'),(105,'CH','AI','Appenzell Innerrhoden'),(106,'CH','AR','Appenzell Ausserrhoden'),(107,'CH','BE','Bern'),(108,'CH','BL','Basel-Landschaft'),(109,'CH','BS','Basel-Stadt'),(110,'CH','FR','Freiburg'),(111,'CH','GE','Genf'),(112,'CH','GL','Glarus'),(113,'CH','GR','Graubünden'),(114,'CH','JU','Jura'),(115,'CH','LU','Luzern'),(116,'CH','NE','Neuenburg'),(117,'CH','NW','Nidwalden'),(118,'CH','OW','Obwalden'),(119,'CH','SG','St. Gallen'),(120,'CH','SH','Schaffhausen'),(121,'CH','SO','Solothurn'),(122,'CH','SZ','Schwyz'),(123,'CH','TG','Thurgau'),(124,'CH','TI','Tessin'),(125,'CH','UR','Uri'),(126,'CH','VD','Waadt'),(127,'CH','VS','Wallis'),(128,'CH','ZG','Zug'),(129,'CH','ZH','Zürich'),(130,'ES','A Coruсa','A Coruña'),(131,'ES','Alava','Alava'),(132,'ES','Albacete','Albacete'),(133,'ES','Alicante','Alicante'),(134,'ES','Almeria','Almeria'),(135,'ES','Asturias','Asturias'),(136,'ES','Avila','Avila'),(137,'ES','Badajoz','Badajoz'),(138,'ES','Baleares','Baleares'),(139,'ES','Barcelona','Barcelona'),(140,'ES','Burgos','Burgos'),(141,'ES','Caceres','Caceres'),(142,'ES','Cadiz','Cadiz'),(143,'ES','Cantabria','Cantabria'),(144,'ES','Castellon','Castellon'),(145,'ES','Ceuta','Ceuta'),(146,'ES','Ciudad Real','Ciudad Real'),(147,'ES','Cordoba','Cordoba'),(148,'ES','Cuenca','Cuenca'),(149,'ES','Girona','Girona'),(150,'ES','Granada','Granada'),(151,'ES','Guadalajara','Guadalajara'),(152,'ES','Guipuzcoa','Guipuzcoa'),(153,'ES','Huelva','Huelva'),(154,'ES','Huesca','Huesca'),(155,'ES','Jaen','Jaen'),(156,'ES','La Rioja','La Rioja'),(157,'ES','Las Palmas','Las Palmas'),(158,'ES','Leon','Leon'),(159,'ES','Lleida','Lleida'),(160,'ES','Lugo','Lugo'),(161,'ES','Madrid','Madrid'),(162,'ES','Malaga','Malaga'),(163,'ES','Melilla','Melilla'),(164,'ES','Murcia','Murcia'),(165,'ES','Navarra','Navarra'),(166,'ES','Ourense','Ourense'),(167,'ES','Palencia','Palencia'),(168,'ES','Pontevedra','Pontevedra'),(169,'ES','Salamanca','Salamanca'),(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,'ES','Segovia','Segovia'),(172,'ES','Sevilla','Sevilla'),(173,'ES','Soria','Soria'),(174,'ES','Tarragona','Tarragona'),(175,'ES','Teruel','Teruel'),(176,'ES','Toledo','Toledo'),(177,'ES','Valencia','Valencia'),(178,'ES','Valladolid','Valladolid'),(179,'ES','Vizcaya','Vizcaya'),(180,'ES','Zamora','Zamora'),(181,'ES','Zaragoza','Zaragoza'),(182,'FR','01','Ain'),(183,'FR','02','Aisne'),(184,'FR','03','Allier'),(185,'FR','04','Alpes-de-Haute-Provence'),(186,'FR','05','Hautes-Alpes'),(187,'FR','06','Alpes-Maritimes'),(188,'FR','07','Ardèche'),(189,'FR','08','Ardennes'),(190,'FR','09','Ariège'),(191,'FR','10','Aube'),(192,'FR','11','Aude'),(193,'FR','12','Aveyron'),(194,'FR','13','Bouches-du-Rhône'),(195,'FR','14','Calvados'),(196,'FR','15','Cantal'),(197,'FR','16','Charente'),(198,'FR','17','Charente-Maritime'),(199,'FR','18','Cher'),(200,'FR','19','Corrèze'),(201,'FR','2A','Corse-du-Sud'),(202,'FR','2B','Haute-Corse'),(203,'FR','21','Côte-d\'Or'),(204,'FR','22','Côtes-d\'Armor'),(205,'FR','23','Creuse'),(206,'FR','24','Dordogne'),(207,'FR','25','Doubs'),(208,'FR','26','Drôme'),(209,'FR','27','Eure'),(210,'FR','28','Eure-et-Loir'),(211,'FR','29','Finistère'),(212,'FR','30','Gard'),(213,'FR','31','Haute-Garonne'),(214,'FR','32','Gers'),(215,'FR','33','Gironde'),(216,'FR','34','Hérault'),(217,'FR','35','Ille-et-Vilaine'),(218,'FR','36','Indre'),(219,'FR','37','Indre-et-Loire'),(220,'FR','38','Isère'),(221,'FR','39','Jura'),(222,'FR','40','Landes'),(223,'FR','41','Loir-et-Cher'),(224,'FR','42','Loire'),(225,'FR','43','Haute-Loire'),(226,'FR','44','Loire-Atlantique'),(227,'FR','45','Loiret'),(228,'FR','46','Lot'),(229,'FR','47','Lot-et-Garonne'),(230,'FR','48','Lozère'),(231,'FR','49','Maine-et-Loire'),(232,'FR','50','Manche'),(233,'FR','51','Marne'),(234,'FR','52','Haute-Marne'),(235,'FR','53','Mayenne'),(236,'FR','54','Meurthe-et-Moselle'),(237,'FR','55','Meuse'),(238,'FR','56','Morbihan'),(239,'FR','57','Moselle'),(240,'FR','58','Nièvre'),(241,'FR','59','Nord'),(242,'FR','60','Oise'),(243,'FR','61','Orne'),(244,'FR','62','Pas-de-Calais'),(245,'FR','63','Puy-de-Dôme'),(246,'FR','64','Pyrénées-Atlantiques'),(247,'FR','65','Hautes-Pyrénées'),(248,'FR','66','Pyrénées-Orientales'),(249,'FR','67','Bas-Rhin'),(250,'FR','68','Haut-Rhin'),(251,'FR','69','Rhône'),(252,'FR','70','Haute-Saône'),(253,'FR','71','Saône-et-Loire'),(254,'FR','72','Sarthe'),(255,'FR','73','Savoie'),(256,'FR','74','Haute-Savoie'),(257,'FR','75','Paris'),(258,'FR','76','Seine-Maritime'),(259,'FR','77','Seine-et-Marne'),(260,'FR','78','Yvelines'),(261,'FR','79','Deux-Sèvres'),(262,'FR','80','Somme'),(263,'FR','81','Tarn'),(264,'FR','82','Tarn-et-Garonne'),(265,'FR','83','Var'),(266,'FR','84','Vaucluse'),(267,'FR','85','Vendée'),(268,'FR','86','Vienne'),(269,'FR','87','Haute-Vienne'),(270,'FR','88','Vosges'),(271,'FR','89','Yonne'),(272,'FR','90','Territoire-de-Belfort'),(273,'FR','91','Essonne'),(274,'FR','92','Hauts-de-Seine'),(275,'FR','93','Seine-Saint-Denis'),(276,'FR','94','Val-de-Marne'),(277,'FR','95','Val-d\'Oise'),(278,'RO','AB','Alba'),(279,'RO','AR','Arad'),(280,'RO','AG','Argeş'),(281,'RO','BC','Bacău'),(282,'RO','BH','Bihor'),(283,'RO','BN','Bistriţa-Năsăud'),(284,'RO','BT','Botoşani'),(285,'RO','BV','Braşov'),(286,'RO','BR','Brăila'),(287,'RO','B','Bucureşti'),(288,'RO','BZ','Buzău'),(289,'RO','CS','Caraş-Severin'),(290,'RO','CL','Călăraşi'),(291,'RO','CJ','Cluj'),(292,'RO','CT','Constanţa'),(293,'RO','CV','Covasna'),(294,'RO','DB','Dâmboviţa'),(295,'RO','DJ','Dolj'),(296,'RO','GL','Galaţi'),(297,'RO','GR','Giurgiu'),(298,'RO','GJ','Gorj'),(299,'RO','HR','Harghita'),(300,'RO','HD','Hunedoara'),(301,'RO','IL','Ialomiţa'),(302,'RO','IS','Iaşi'),(303,'RO','IF','Ilfov'),(304,'RO','MM','Maramureş'),(305,'RO','MH','Mehedinţi'),(306,'RO','MS','Mureş'),(307,'RO','NT','Neamţ'),(308,'RO','OT','Olt'),(309,'RO','PH','Prahova'),(310,'RO','SM','Satu-Mare'),(311,'RO','SJ','Sălaj'),(312,'RO','SB','Sibiu'),(313,'RO','SV','Suceava'),(314,'RO','TR','Teleorman'),(315,'RO','TM','Timiş'),(316,'RO','TL','Tulcea'),(317,'RO','VS','Vaslui'),(318,'RO','VL','Vâlcea'),(319,'RO','VN','Vrancea'),(320,'FI','Lappi','Lappi'),(321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),(322,'FI','Kainuu','Kainuu'),(323,'FI','Pohjois-Karjala','Pohjois-Karjala'),(324,'FI','Pohjois-Savo','Pohjois-Savo'),(325,'FI','Etelä-Savo','Etelä-Savo'),(326,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa'),(327,'FI','Pohjanmaa','Pohjanmaa'),(328,'FI','Pirkanmaa','Pirkanmaa'),(329,'FI','Satakunta','Satakunta'),(330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),(331,'FI','Keski-Suomi','Keski-Suomi'),(332,'FI','Varsinais-Suomi','Varsinais-Suomi'),(333,'FI','Etelä-Karjala','Etelä-Karjala'),(334,'FI','Päijät-Häme','Päijät-Häme'),(335,'FI','Kanta-Häme','Kanta-Häme'),(336,'FI','Uusimaa','Uusimaa'),(337,'FI','Itä-Uusimaa','Itä-Uusimaa'),(338,'FI','Kymenlaakso','Kymenlaakso'),(339,'FI','Ahvenanmaa','Ahvenanmaa'),(340,'EE','EE-37','Harjumaa'),(341,'EE','EE-39','Hiiumaa'),(342,'EE','EE-44','Ida-Virumaa'),(343,'EE','EE-49','Jõgevamaa'),(344,'EE','EE-51','Järvamaa'),(345,'EE','EE-57','Läänemaa'),(346,'EE','EE-59','Lääne-Virumaa'),(347,'EE','EE-65','Põlvamaa'),(348,'EE','EE-67','Pärnumaa'),(349,'EE','EE-70','Raplamaa'),(350,'EE','EE-74','Saaremaa'),(351,'EE','EE-78','Tartumaa'),(352,'EE','EE-82','Valgamaa'),(353,'EE','EE-84','Viljandimaa'),(354,'EE','EE-86','Võrumaa'),(355,'LV','LV-DGV','Daugavpils'),(356,'LV','LV-JEL','Jelgava'),(357,'LV','Jēkabpils','Jēkabpils'),(358,'LV','LV-JUR','Jūrmala'),(359,'LV','LV-LPX','Liepāja'),(360,'LV','LV-LE','Liepājas novads'),(361,'LV','LV-REZ','Rēzekne'),(362,'LV','LV-RIX','Rīga'),(363,'LV','LV-RI','Rīgas novads'),(364,'LV','Valmiera','Valmiera'),(365,'LV','LV-VEN','Ventspils'),(366,'LV','Aglonas novads','Aglonas novads'),(367,'LV','LV-AI','Aizkraukles novads'),(368,'LV','Aizputes novads','Aizputes novads'),(369,'LV','Aknīstes novads','Aknīstes novads'),(370,'LV','Alojas novads','Alojas novads'),(371,'LV','Alsungas novads','Alsungas novads'),(372,'LV','LV-AL','Alūksnes novads'),(373,'LV','Amatas novads','Amatas novads'),(374,'LV','Apes novads','Apes novads'),(375,'LV','Auces novads','Auces novads'),(376,'LV','Babītes novads','Babītes novads'),(377,'LV','Baldones novads','Baldones novads'),(378,'LV','Baltinavas novads','Baltinavas novads'),(379,'LV','LV-BL','Balvu novads'),(380,'LV','LV-BU','Bauskas novads'),(381,'LV','Beverīnas novads','Beverīnas novads'),(382,'LV','Brocēnu novads','Brocēnu novads'),(383,'LV','Burtnieku novads','Burtnieku novads'),(384,'LV','Carnikavas novads','Carnikavas novads'),(385,'LV','Cesvaines novads','Cesvaines novads'),(386,'LV','Ciblas novads','Ciblas novads'),(387,'LV','LV-CE','Cēsu novads'),(388,'LV','Dagdas novads','Dagdas novads'),(389,'LV','LV-DA','Daugavpils novads'),(390,'LV','LV-DO','Dobeles novads'),(391,'LV','Dundagas novads','Dundagas novads'),(392,'LV','Durbes novads','Durbes novads'),(393,'LV','Engures novads','Engures novads'),(394,'LV','Garkalnes novads','Garkalnes novads'),(395,'LV','Grobiņas novads','Grobiņas novads'),(396,'LV','LV-GU','Gulbenes novads'),(397,'LV','Iecavas novads','Iecavas novads'),(398,'LV','Ikšķiles novads','Ikšķiles novads'),(399,'LV','Ilūkstes novads','Ilūkstes novads'),(400,'LV','Inčukalna novads','Inčukalna novads'),(401,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),(402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),(403,'LV','Jaunpils novads','Jaunpils novads'),(404,'LV','LV-JL','Jelgavas novads'),(405,'LV','LV-JK','Jēkabpils novads'),(406,'LV','Kandavas novads','Kandavas novads'),(407,'LV','Kokneses novads','Kokneses novads'),(408,'LV','Krimuldas novads','Krimuldas novads'),(409,'LV','Krustpils novads','Krustpils novads'),(410,'LV','LV-KR','Krāslavas novads'),(411,'LV','LV-KU','Kuldīgas novads'),(412,'LV','Kārsavas novads','Kārsavas novads'),(413,'LV','Lielvārdes novads','Lielvārdes novads'),(414,'LV','LV-LM','Limbažu novads'),(415,'LV','Lubānas novads','Lubānas novads'),(416,'LV','LV-LU','Ludzas novads'),(417,'LV','Līgatnes novads','Līgatnes novads'),(418,'LV','Līvānu novads','Līvānu novads'),(419,'LV','LV-MA','Madonas novads'),(420,'LV','Mazsalacas novads','Mazsalacas novads'),(421,'LV','Mālpils novads','Mālpils novads'),(422,'LV','Mārupes novads','Mārupes novads'),(423,'LV','Naukšēnu novads','Naukšēnu novads'),(424,'LV','Neretas novads','Neretas novads'),(425,'LV','Nīcas novads','Nīcas novads'),(426,'LV','LV-OG','Ogres novads'),(427,'LV','Olaines novads','Olaines novads'),(428,'LV','Ozolnieku novads','Ozolnieku novads'),(429,'LV','LV-PR','Preiļu novads'),(430,'LV','Priekules novads','Priekules novads'),(431,'LV','Priekuļu novads','Priekuļu novads'),(432,'LV','Pārgaujas novads','Pārgaujas novads'),(433,'LV','Pāvilostas novads','Pāvilostas novads'),(434,'LV','Pļaviņu novads','Pļaviņu novads'),(435,'LV','Raunas novads','Raunas novads'),(436,'LV','Riebiņu novads','Riebiņu novads'),(437,'LV','Rojas novads','Rojas novads'),(438,'LV','Ropažu novads','Ropažu novads'),(439,'LV','Rucavas novads','Rucavas novads'),(440,'LV','Rugāju novads','Rugāju novads'),(441,'LV','Rundāles novads','Rundāles novads'),(442,'LV','LV-RE','Rēzeknes novads'),(443,'LV','Rūjienas novads','Rūjienas novads'),(444,'LV','Salacgrīvas novads','Salacgrīvas novads'),(445,'LV','Salas novads','Salas novads'),(446,'LV','Salaspils novads','Salaspils novads'),(447,'LV','LV-SA','Saldus novads'),(448,'LV','Saulkrastu novads','Saulkrastu novads'),(449,'LV','Siguldas novads','Siguldas novads'),(450,'LV','Skrundas novads','Skrundas novads'),(451,'LV','Skrīveru novads','Skrīveru novads'),(452,'LV','Smiltenes novads','Smiltenes novads'),(453,'LV','Stopiņu novads','Stopiņu novads'),(454,'LV','Strenču novads','Strenču novads'),(455,'LV','Sējas novads','Sējas novads'),(456,'LV','LV-TA','Talsu novads'),(457,'LV','LV-TU','Tukuma novads'),(458,'LV','Tērvetes novads','Tērvetes novads'),(459,'LV','Vaiņodes novads','Vaiņodes novads'),(460,'LV','LV-VK','Valkas novads'),(461,'LV','LV-VM','Valmieras novads'),(462,'LV','Varakļānu novads','Varakļānu novads'),(463,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),(464,'LV','Vecumnieku novads','Vecumnieku novads'),(465,'LV','LV-VE','Ventspils novads'),(466,'LV','Viesītes novads','Viesītes novads'),(467,'LV','Viļakas novads','Viļakas novads'),(468,'LV','Viļānu novads','Viļānu novads'),(469,'LV','Vārkavas novads','Vārkavas novads'),(470,'LV','Zilupes novads','Zilupes novads'),(471,'LV','Ādažu novads','Ādažu novads'),(472,'LV','Ērgļu novads','Ērgļu novads'),(473,'LV','Ķeguma novads','Ķeguma novads'),(474,'LV','Ķekavas novads','Ķekavas novads'),(475,'LT','LT-AL','Alytaus Apskritis'),(476,'LT','LT-KU','Kauno Apskritis'),(477,'LT','LT-KL','Klaipėdos Apskritis'),(478,'LT','LT-MR','Marijampolės Apskritis'),(479,'LT','LT-PN','Panevėžio Apskritis'),(480,'LT','LT-SA','Šiaulių Apskritis'),(481,'LT','LT-TA','Tauragės Apskritis'),(482,'LT','LT-TE','Telšių Apskritis'),(483,'LT','LT-UT','Utenos Apskritis'),(484,'LT','LT-VL','Vilniaus Apskritis'),(485,'BR','AC','Acre'),(486,'BR','AL','Alagoas'),(487,'BR','AP','Amapá'),(488,'BR','AM','Amazonas'),(489,'BR','BA','Bahia'),(490,'BR','CE','Ceará'),(491,'BR','DF','Distrito Federal'),(492,'BR','ES','Espírito Santo'),(493,'BR','GO','Goiás'),(494,'BR','MA','Maranhão'),(495,'BR','MT','Mato Grosso'),(496,'BR','MS','Mato Grosso do Sul'),(497,'BR','MG','Minas Gerais'),(498,'BR','PA','Pará'),(499,'BR','PB','Paraíba'),(500,'BR','PR','Paraná'),(501,'BR','PE','Pernambuco'),(502,'BR','PI','Piauí'),(503,'BR','RJ','Rio de Janeiro'),(504,'BR','RN','Rio Grande do Norte'),(505,'BR','RS','Rio Grande do Sul'),(506,'BR','RO','Rondônia'),(507,'BR','RR','Roraima'),(508,'BR','SC','Santa Catarina'),(509,'BR','SP','São Paulo'),(510,'BR','SE','Sergipe'),(511,'BR','TO','Tocantins');
/*!40000 ALTER TABLE `directory_country_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_region_name`
--

DROP TABLE IF EXISTS `directory_country_region_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_region_name` (
  `locale` varchar(8) NOT NULL DEFAULT '',
  `region_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `FK_DIRECTORY_REGION_NAME_REGION` (`region_id`),
  CONSTRAINT `FK_DIRECTORY_REGION_NAME_REGION` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Regions names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_region_name`
--

LOCK TABLES `directory_country_region_name` WRITE;
/*!40000 ALTER TABLE `directory_country_region_name` DISABLE KEYS */;
INSERT INTO `directory_country_region_name` VALUES ('en_US',1,'Alabama'),('en_US',2,'Alaska'),('en_US',3,'American Samoa'),('en_US',4,'Arizona'),('en_US',5,'Arkansas'),('en_US',6,'Armed Forces Africa'),('en_US',7,'Armed Forces Americas'),('en_US',8,'Armed Forces Canada'),('en_US',9,'Armed Forces Europe'),('en_US',10,'Armed Forces Middle East'),('en_US',11,'Armed Forces Pacific'),('en_US',12,'California'),('en_US',13,'Colorado'),('en_US',14,'Connecticut'),('en_US',15,'Delaware'),('en_US',16,'District of Columbia'),('en_US',17,'Federated States Of Micronesia'),('en_US',18,'Florida'),('en_US',19,'Georgia'),('en_US',20,'Guam'),('en_US',21,'Hawaii'),('en_US',22,'Idaho'),('en_US',23,'Illinois'),('en_US',24,'Indiana'),('en_US',25,'Iowa'),('en_US',26,'Kansas'),('en_US',27,'Kentucky'),('en_US',28,'Louisiana'),('en_US',29,'Maine'),('en_US',30,'Marshall Islands'),('en_US',31,'Maryland'),('en_US',32,'Massachusetts'),('en_US',33,'Michigan'),('en_US',34,'Minnesota'),('en_US',35,'Mississippi'),('en_US',36,'Missouri'),('en_US',37,'Montana'),('en_US',38,'Nebraska'),('en_US',39,'Nevada'),('en_US',40,'New Hampshire'),('en_US',41,'New Jersey'),('en_US',42,'New Mexico'),('en_US',43,'New York'),('en_US',44,'North Carolina'),('en_US',45,'North Dakota'),('en_US',46,'Northern Mariana Islands'),('en_US',47,'Ohio'),('en_US',48,'Oklahoma'),('en_US',49,'Oregon'),('en_US',50,'Palau'),('en_US',51,'Pennsylvania'),('en_US',52,'Puerto Rico'),('en_US',53,'Rhode Island'),('en_US',54,'South Carolina'),('en_US',55,'South Dakota'),('en_US',56,'Tennessee'),('en_US',57,'Texas'),('en_US',58,'Utah'),('en_US',59,'Vermont'),('en_US',60,'Virgin Islands'),('en_US',61,'Virginia'),('en_US',62,'Washington'),('en_US',63,'West Virginia'),('en_US',64,'Wisconsin'),('en_US',65,'Wyoming'),('en_US',66,'Alberta'),('en_US',67,'British Columbia'),('en_US',68,'Manitoba'),('en_US',69,'Newfoundland and Labrador'),('en_US',70,'New Brunswick'),('en_US',71,'Nova Scotia'),('en_US',72,'Northwest Territories'),('en_US',73,'Nunavut'),('en_US',74,'Ontario'),('en_US',75,'Prince Edward Island'),('en_US',76,'Quebec'),('en_US',77,'Saskatchewan'),('en_US',78,'Yukon Territory'),('en_US',79,'Niedersachsen'),('en_US',80,'Baden-Württemberg'),('en_US',81,'Bayern'),('en_US',82,'Berlin'),('en_US',83,'Brandenburg'),('en_US',84,'Bremen'),('en_US',85,'Hamburg'),('en_US',86,'Hessen'),('en_US',87,'Mecklenburg-Vorpommern'),('en_US',88,'Nordrhein-Westfalen'),('en_US',89,'Rheinland-Pfalz'),('en_US',90,'Saarland'),('en_US',91,'Sachsen'),('en_US',92,'Sachsen-Anhalt'),('en_US',93,'Schleswig-Holstein'),('en_US',94,'Thüringen'),('en_US',95,'Wien'),('en_US',96,'Niederösterreich'),('en_US',97,'Oberösterreich'),('en_US',98,'Salzburg'),('en_US',99,'Kärnten'),('en_US',100,'Steiermark'),('en_US',101,'Tirol'),('en_US',102,'Burgenland'),('en_US',103,'Voralberg'),('en_US',104,'Aargau'),('en_US',105,'Appenzell Innerrhoden'),('en_US',106,'Appenzell Ausserrhoden'),('en_US',107,'Bern'),('en_US',108,'Basel-Landschaft'),('en_US',109,'Basel-Stadt'),('en_US',110,'Freiburg'),('en_US',111,'Genf'),('en_US',112,'Glarus'),('en_US',113,'Graubünden'),('en_US',114,'Jura'),('en_US',115,'Luzern'),('en_US',116,'Neuenburg'),('en_US',117,'Nidwalden'),('en_US',118,'Obwalden'),('en_US',119,'St. Gallen'),('en_US',120,'Schaffhausen'),('en_US',121,'Solothurn'),('en_US',122,'Schwyz'),('en_US',123,'Thurgau'),('en_US',124,'Tessin'),('en_US',125,'Uri'),('en_US',126,'Waadt'),('en_US',127,'Wallis'),('en_US',128,'Zug'),('en_US',129,'Zürich'),('en_US',130,'A Coruña'),('en_US',131,'Alava'),('en_US',132,'Albacete'),('en_US',133,'Alicante'),('en_US',134,'Almeria'),('en_US',135,'Asturias'),('en_US',136,'Avila'),('en_US',137,'Badajoz'),('en_US',138,'Baleares'),('en_US',139,'Barcelona'),('en_US',140,'Burgos'),('en_US',141,'Caceres'),('en_US',142,'Cadiz'),('en_US',143,'Cantabria'),('en_US',144,'Castellon'),('en_US',145,'Ceuta'),('en_US',146,'Ciudad Real'),('en_US',147,'Cordoba'),('en_US',148,'Cuenca'),('en_US',149,'Girona'),('en_US',150,'Granada'),('en_US',151,'Guadalajara'),('en_US',152,'Guipuzcoa'),('en_US',153,'Huelva'),('en_US',154,'Huesca'),('en_US',155,'Jaen'),('en_US',156,'La Rioja'),('en_US',157,'Las Palmas'),('en_US',158,'Leon'),('en_US',159,'Lleida'),('en_US',160,'Lugo'),('en_US',161,'Madrid'),('en_US',162,'Malaga'),('en_US',163,'Melilla'),('en_US',164,'Murcia'),('en_US',165,'Navarra'),('en_US',166,'Ourense'),('en_US',167,'Palencia'),('en_US',168,'Pontevedra'),('en_US',169,'Salamanca'),('en_US',170,'Santa Cruz de Tenerife'),('en_US',171,'Segovia'),('en_US',172,'Sevilla'),('en_US',173,'Soria'),('en_US',174,'Tarragona'),('en_US',175,'Teruel'),('en_US',176,'Toledo'),('en_US',177,'Valencia'),('en_US',178,'Valladolid'),('en_US',179,'Vizcaya'),('en_US',180,'Zamora'),('en_US',181,'Zaragoza'),('en_US',182,'Ain'),('en_US',183,'Aisne'),('en_US',184,'Allier'),('en_US',185,'Alpes-de-Haute-Provence'),('en_US',186,'Hautes-Alpes'),('en_US',187,'Alpes-Maritimes'),('en_US',188,'Ardèche'),('en_US',189,'Ardennes'),('en_US',190,'Ariège'),('en_US',191,'Aube'),('en_US',192,'Aude'),('en_US',193,'Aveyron'),('en_US',194,'Bouches-du-Rhône'),('en_US',195,'Calvados'),('en_US',196,'Cantal'),('en_US',197,'Charente'),('en_US',198,'Charente-Maritime'),('en_US',199,'Cher'),('en_US',200,'Corrèze'),('en_US',201,'Corse-du-Sud'),('en_US',202,'Haute-Corse'),('en_US',203,'Côte-d\'Or'),('en_US',204,'Côtes-d\'Armor'),('en_US',205,'Creuse'),('en_US',206,'Dordogne'),('en_US',207,'Doubs'),('en_US',208,'Drôme'),('en_US',209,'Eure'),('en_US',210,'Eure-et-Loir'),('en_US',211,'Finistère'),('en_US',212,'Gard'),('en_US',213,'Haute-Garonne'),('en_US',214,'Gers'),('en_US',215,'Gironde'),('en_US',216,'Hérault'),('en_US',217,'Ille-et-Vilaine'),('en_US',218,'Indre'),('en_US',219,'Indre-et-Loire'),('en_US',220,'Isère'),('en_US',221,'Jura'),('en_US',222,'Landes'),('en_US',223,'Loir-et-Cher'),('en_US',224,'Loire'),('en_US',225,'Haute-Loire'),('en_US',226,'Loire-Atlantique'),('en_US',227,'Loiret'),('en_US',228,'Lot'),('en_US',229,'Lot-et-Garonne'),('en_US',230,'Lozère'),('en_US',231,'Maine-et-Loire'),('en_US',232,'Manche'),('en_US',233,'Marne'),('en_US',234,'Haute-Marne'),('en_US',235,'Mayenne'),('en_US',236,'Meurthe-et-Moselle'),('en_US',237,'Meuse'),('en_US',238,'Morbihan'),('en_US',239,'Moselle'),('en_US',240,'Nièvre'),('en_US',241,'Nord'),('en_US',242,'Oise'),('en_US',243,'Orne'),('en_US',244,'Pas-de-Calais'),('en_US',245,'Puy-de-Dôme'),('en_US',246,'Pyrénées-Atlantiques'),('en_US',247,'Hautes-Pyrénées'),('en_US',248,'Pyrénées-Orientales'),('en_US',249,'Bas-Rhin'),('en_US',250,'Haut-Rhin'),('en_US',251,'Rhône'),('en_US',252,'Haute-Saône'),('en_US',253,'Saône-et-Loire'),('en_US',254,'Sarthe'),('en_US',255,'Savoie'),('en_US',256,'Haute-Savoie'),('en_US',257,'Paris'),('en_US',258,'Seine-Maritime'),('en_US',259,'Seine-et-Marne'),('en_US',260,'Yvelines'),('en_US',261,'Deux-Sèvres'),('en_US',262,'Somme'),('en_US',263,'Tarn'),('en_US',264,'Tarn-et-Garonne'),('en_US',265,'Var'),('en_US',266,'Vaucluse'),('en_US',267,'Vendée'),('en_US',268,'Vienne'),('en_US',269,'Haute-Vienne'),('en_US',270,'Vosges'),('en_US',271,'Yonne'),('en_US',272,'Territoire-de-Belfort'),('en_US',273,'Essonne'),('en_US',274,'Hauts-de-Seine'),('en_US',275,'Seine-Saint-Denis'),('en_US',276,'Val-de-Marne'),('en_US',277,'Val-d\'Oise'),('en_US',278,'Alba'),('en_US',279,'Arad'),('en_US',280,'Argeş'),('en_US',281,'Bacău'),('en_US',282,'Bihor'),('en_US',283,'Bistriţa-Năsăud'),('en_US',284,'Botoşani'),('en_US',285,'Braşov'),('en_US',286,'Brăila'),('en_US',287,'Bucureşti'),('en_US',288,'Buzău'),('en_US',289,'Caraş-Severin'),('en_US',290,'Călăraşi'),('en_US',291,'Cluj'),('en_US',292,'Constanţa'),('en_US',293,'Covasna'),('en_US',294,'Dâmboviţa'),('en_US',295,'Dolj'),('en_US',296,'Galaţi'),('en_US',297,'Giurgiu'),('en_US',298,'Gorj'),('en_US',299,'Harghita'),('en_US',300,'Hunedoara'),('en_US',301,'Ialomiţa'),('en_US',302,'Iaşi'),('en_US',303,'Ilfov'),('en_US',304,'Maramureş'),('en_US',305,'Mehedinţi'),('en_US',306,'Mureş'),('en_US',307,'Neamţ'),('en_US',308,'Olt'),('en_US',309,'Prahova'),('en_US',310,'Satu-Mare'),('en_US',311,'Sălaj'),('en_US',312,'Sibiu'),('en_US',313,'Suceava'),('en_US',314,'Teleorman'),('en_US',315,'Timiş'),('en_US',316,'Tulcea'),('en_US',317,'Vaslui'),('en_US',318,'Vâlcea'),('en_US',319,'Vrancea'),('en_US',485,'Acre'),('en_US',486,'Alagoas'),('en_US',487,'Amapá'),('en_US',488,'Amazonas'),('en_US',489,'Bahia'),('en_US',490,'Ceará'),('en_US',491,'Distrito Federal'),('en_US',492,'Espírito Santo'),('en_US',493,'Goiás'),('en_US',494,'Maranhão'),('en_US',495,'Mato Grosso'),('en_US',496,'Mato Grosso do Sul'),('en_US',497,'Minas Gerais'),('en_US',498,'Pará'),('en_US',499,'Paraíba'),('en_US',500,'Paraná'),('en_US',501,'Pernambuco'),('en_US',502,'Piauí'),('en_US',503,'Rio de Janeiro'),('en_US',504,'Rio Grande do Norte'),('en_US',505,'Rio Grande do Sul'),('en_US',506,'Rondônia'),('en_US',507,'Roraima'),('en_US',508,'Santa Catarina'),('en_US',509,'São Paulo'),('en_US',510,'Sergipe'),('en_US',511,'Tocantins'),('pt_BR',485,'Acre'),('pt_BR',486,'Alagoas'),('pt_BR',487,'Amapá'),('pt_BR',488,'Amazonas'),('pt_BR',489,'Bahia'),('pt_BR',490,'Ceará'),('pt_BR',491,'Distrito Federal'),('pt_BR',492,'Espírito Santo'),('pt_BR',493,'Goiás'),('pt_BR',494,'Maranhão'),('pt_BR',495,'Mato Grosso'),('pt_BR',496,'Mato Grosso do Sul'),('pt_BR',497,'Minas Gerais'),('pt_BR',498,'Pará'),('pt_BR',499,'Paraíba'),('pt_BR',500,'Paraná'),('pt_BR',501,'Pernambuco'),('pt_BR',502,'Piauí'),('pt_BR',503,'Rio de Janeiro'),('pt_BR',504,'Rio Grande do Norte'),('pt_BR',505,'Rio Grande do Sul'),('pt_BR',506,'Rondônia'),('pt_BR',507,'Roraima'),('pt_BR',508,'Santa Catarina'),('pt_BR',509,'São Paulo'),('pt_BR',510,'Sergipe'),('pt_BR',511,'Tocantins');
/*!40000 ALTER TABLE `directory_country_region_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_currency_rate`
--

DROP TABLE IF EXISTS `directory_currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_currency_rate` (
  `currency_from` char(3) NOT NULL DEFAULT '',
  `currency_to` char(3) NOT NULL DEFAULT '',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `FK_CURRENCY_RATE_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_currency_rate`
--

LOCK TABLES `directory_currency_rate` WRITE;
/*!40000 ALTER TABLE `directory_currency_rate` DISABLE KEYS */;
INSERT INTO `directory_currency_rate` VALUES ('EUR','EUR','1.000000000000'),('EUR','USD','1.415000000000'),('USD','EUR','0.706700000000'),('USD','USD','1.000000000000');
/*!40000 ALTER TABLE `directory_currency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link`
--

DROP TABLE IF EXISTS `downloadable_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `number_of_downloads` int(10) unsigned DEFAULT NULL,
  `is_shareable` smallint(1) unsigned NOT NULL DEFAULT '0',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_file` varchar(255) NOT NULL DEFAULT '',
  `link_type` varchar(20) NOT NULL DEFAULT '',
  `sample_url` varchar(255) NOT NULL DEFAULT '',
  `sample_file` varchar(255) NOT NULL DEFAULT '',
  `sample_type` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `DOWNLODABLE_LINK_PRODUCT` (`product_id`),
  KEY `DOWNLODABLE_LINK_PRODUCT_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `FK_DOWNLODABLE_LINK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link`
--

LOCK TABLES `downloadable_link` WRITE;
/*!40000 ALTER TABLE `downloadable_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_price`
--

DROP TABLE IF EXISTS `downloadable_link_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` int(10) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_LINK` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_price`
--

LOCK TABLES `downloadable_link_price` WRITE;
/*!40000 ALTER TABLE `downloadable_link_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_increment_id` varchar(50) NOT NULL DEFAULT '',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_sku` varchar(255) NOT NULL DEFAULT '',
  `link_section_title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`purchased_id`),
  KEY `DOWNLOADABLE_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_CUSTOMER_ID` (`customer_id`),
  KEY `KEY_DOWNLOADABLE_ORDER_ITEM_ID` (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `downloadable_link_purchased_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned DEFAULT '0',
  `link_hash` varchar(255) NOT NULL DEFAULT '',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0',
  `link_id` int(20) unsigned NOT NULL DEFAULT '0',
  `link_title` varchar(255) NOT NULL DEFAULT '',
  `is_shareable` smallint(1) unsigned NOT NULL DEFAULT '0',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_file` varchar(255) NOT NULL DEFAULT '',
  `link_type` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(50) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ID` (`purchased_id`),
  KEY `DOWNLOADABLE_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADALBE_LINK_HASH` (`link_hash`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased_item`
--

LOCK TABLES `downloadable_link_purchased_item` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_title`
--

DROP TABLE IF EXISTS `downloadable_link_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_LINK_TITLE_STORE` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_LINK` (`link_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_LINK` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_title`
--

LOCK TABLES `downloadable_link_title` WRITE;
/*!40000 ALTER TABLE `downloadable_link_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_sample`
--

DROP TABLE IF EXISTS `downloadable_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sample_url` varchar(255) NOT NULL DEFAULT '',
  `sample_file` varchar(255) NOT NULL DEFAULT '',
  `sample_type` varchar(20) NOT NULL DEFAULT '',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sample_id`),
  KEY `DOWNLODABLE_SAMPLE_PRODUCT` (`product_id`),
  CONSTRAINT `FK_DOWNLODABLE_SAMPLE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_sample`
--

LOCK TABLES `downloadable_sample` WRITE;
/*!40000 ALTER TABLE `downloadable_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_sample_title`
--

DROP TABLE IF EXISTS `downloadable_sample_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_SAMPLE_TITLE_STORE` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE` (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_sample_title`
--

LOCK TABLES `downloadable_sample_title` WRITE;
/*!40000 ALTER TABLE `downloadable_sample_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_sample_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute`
--

DROP TABLE IF EXISTS `eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_code` varchar(255) NOT NULL DEFAULT '',
  `attribute_model` varchar(255) DEFAULT NULL,
  `backend_model` varchar(255) DEFAULT NULL,
  `backend_type` enum('static','datetime','decimal','int','text','varchar') NOT NULL DEFAULT 'static',
  `backend_table` varchar(255) DEFAULT NULL,
  `frontend_model` varchar(255) DEFAULT NULL,
  `frontend_input` varchar(50) DEFAULT NULL,
  `frontend_label` varchar(255) DEFAULT NULL,
  `frontend_class` varchar(255) DEFAULT NULL,
  `source_model` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_value` text,
  `is_unique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `entity_type_id` (`entity_type_id`,`attribute_code`),
  KEY `IDX_USED_FOR_SORT_BY` (`entity_type_id`),
  KEY `IDX_USED_IN_PRODUCT_LISTING` (`entity_type_id`),
  CONSTRAINT `FK_eav_attribute` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute`
--

LOCK TABLES `eav_attribute` WRITE;
/*!40000 ALTER TABLE `eav_attribute` DISABLE KEYS */;
INSERT INTO `eav_attribute` VALUES (1,1,'website_id',NULL,'customer/customer_attribute_backend_website','static','','','select','Associar ao Website','','customer/customer_attribute_source_website',1,0,'',0,''),(2,1,'store_id',NULL,'customer/customer_attribute_backend_store','static','','','select','Criado Em','','customer/customer_attribute_source_store',1,0,'',0,''),(3,1,'created_in',NULL,'','varchar','','','text','Criado na Loja','','',0,0,'',0,''),(4,1,'prefix',NULL,'','varchar','','','text','Prefixo','','',0,0,'',0,''),(5,1,'firstname',NULL,'','varchar','','','text','Nome','','',1,0,'',0,''),(6,1,'middlename',NULL,'','varchar','','','text','Assinatura','','',0,0,'',0,''),(7,1,'lastname',NULL,'','varchar','','','text','Sobrenome','','',1,0,'',0,''),(8,1,'suffix',NULL,'','varchar','','','text','Sufixo','','',0,0,'',0,''),(9,1,'email',NULL,'','static','','','text','E-Mail','','',1,0,'',0,''),(10,1,'group_id',NULL,'','static','','','select','Grupo','','customer/customer_attribute_source_group',1,0,'',0,''),(11,1,'dob',NULL,'eav/entity_attribute_backend_datetime','datetime','','eav/entity_attribute_frontend_datetime','date','Data de Nascimento','','',0,0,'',0,''),(12,1,'password_hash',NULL,'customer/customer_attribute_backend_password','varchar','','','hidden','','','',0,0,'',0,''),(13,1,'default_billing',NULL,'customer/customer_attribute_backend_billing','int','','','text','Endereço de Cobrança Padrão','','',0,0,'',0,''),(14,1,'default_shipping',NULL,'customer/customer_attribute_backend_shipping','int','','','text','Endereço de Entrega Padrão','','',0,0,'',0,''),(15,1,'taxvat',NULL,'','varchar','','','text','CPF/CNPJ','','',0,0,'',0,''),(16,1,'confirmation',NULL,'','varchar','','','text','Confirmado','','',0,0,'',0,''),(17,1,'created_at',NULL,'','static','','','date','Criado Na','','',0,0,'',0,''),(18,2,'prefix',NULL,'','varchar','','','text','Prefixo','','',0,0,'',0,''),(19,2,'firstname',NULL,'','varchar','','','text','Nome','','',1,0,'',0,''),(20,2,'middlename',NULL,'','varchar','','','text','Assinatura','','',0,0,'',0,''),(21,2,'lastname',NULL,'','varchar','','','text','Sobrenome','','',1,0,'',0,''),(22,2,'suffix',NULL,'','varchar','','','text','Sufixo','','',0,0,'',0,''),(23,2,'company',NULL,'','varchar','','','text','Razão Social','','',0,0,'',0,''),(24,2,'street',NULL,'customer_entity/address_attribute_backend_street','text','','','multiline','Endereço','','',1,0,'',0,''),(25,2,'city',NULL,'','varchar','','','text','Cidade','','',1,0,'',0,''),(26,2,'country_id',NULL,'','varchar','','','select','País','','customer_entity/address_attribute_source_country',1,0,'',0,''),(27,2,'region',NULL,'customer_entity/address_attribute_backend_region','varchar','','','text','Estado','','',0,0,'',0,''),(28,2,'region_id',NULL,'','int','','','hidden','Estado','','customer_entity/address_attribute_source_region',0,0,'',0,''),(29,2,'postcode',NULL,'','varchar','','','text','CEP','','',1,0,'',0,''),(30,2,'telephone',NULL,'','varchar','','','text','Telefone','','',1,0,'',0,''),(31,2,'fax',NULL,'','varchar','','','text','Celular','','',0,0,'',0,''),(32,1,'gender',NULL,'','int','','','select','Sexo','','eav/entity_attribute_source_table',0,0,'',0,''),(33,3,'name',NULL,'','varchar','','','text','Nome','','',1,0,'',0,''),(34,3,'is_active',NULL,'','int','','','select','Ativar','','eav/entity_attribute_source_boolean',1,0,'',0,''),(35,3,'url_key',NULL,'catalog/category_attribute_backend_urlkey','varchar','','','text','Nome na URL','','',0,0,'',0,''),(36,3,'description',NULL,'','text','','','textarea','Descrição','','',0,0,'',0,''),(37,3,'image',NULL,'catalog/category_attribute_backend_image','varchar','','','image','Imagem','','',0,0,'',0,''),(38,3,'meta_title',NULL,'','varchar','','','text','Título da Página','','',0,0,'',0,''),(39,3,'meta_keywords',NULL,'','text','','','textarea','Palavras-Chave','','',0,0,'',0,''),(40,3,'meta_description',NULL,'','text','','','textarea','Descrição da Página','','',0,0,'',0,''),(41,3,'display_mode',NULL,'','varchar','','','select','Modo de Exibição','','catalog/category_attribute_source_mode',0,0,'',0,''),(42,3,'landing_page',NULL,'','int','','','select','Bloco CMS','','catalog/category_attribute_source_page',0,0,'',0,''),(43,3,'is_anchor',NULL,'','int','','','select','Navegável','','eav/entity_attribute_source_boolean',0,0,'',0,''),(44,3,'path',NULL,'','static','','','','Caminho','','',0,0,'',0,''),(45,3,'position',NULL,'','static','','','','Situação','','',0,0,'',0,''),(46,3,'all_children',NULL,'','text','','','','','','',0,0,'',0,''),(47,3,'path_in_store',NULL,'','text','','','','','','',0,0,'',0,''),(48,3,'children',NULL,'','text','','','','','','',0,0,'',0,''),(49,3,'url_path',NULL,'','varchar','','','','','','',0,0,'',0,''),(50,3,'custom_design',NULL,'','varchar','','','select','Leiaute Personalizado','','core/design_source_design',0,0,'',0,''),(52,3,'custom_design_from',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Ativar Em','','',0,0,'',0,''),(53,3,'custom_design_to',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Ativar Até','','',0,0,'',0,''),(54,3,'page_layout',NULL,'','varchar','','','select','Formato da Página','','catalog/category_attribute_source_layout',0,0,'',0,''),(55,3,'custom_layout_update',NULL,'','text','','','textarea','Atualização de Leiaute','','',0,0,'',0,''),(56,3,'level',NULL,'','static','','','','Nível','','',0,0,'',0,''),(57,3,'children_count',NULL,'','static','','','','Contagem','','',0,0,'',0,''),(58,3,'available_sort_by',NULL,'catalog/category_attribute_backend_sortby','text','','','multiselect','Ordem de Listagem dos Produtos Disponíveis','','catalog/category_attribute_source_sortby',1,0,'',0,''),(59,3,'default_sort_by',NULL,'catalog/category_attribute_backend_sortby','varchar','','','select','Ordem de Listagem Padrão dos Produtos','','catalog/category_attribute_source_sortby',1,0,'',0,''),(60,4,'name',NULL,'','varchar','','','text','Nome','','',1,0,'',0,''),(61,4,'description',NULL,'','text','','','textarea','Descrição','','',1,0,'',0,''),(62,4,'short_description',NULL,'','text','','','textarea','Descrição Resumida','','',1,0,'',0,''),(63,4,'sku',NULL,'','static','','','text','Código Identificador (SKU)','','',1,0,'',1,''),(64,4,'price',NULL,'catalog/product_attribute_backend_price','decimal','','','price','Preço','','',1,0,'',0,''),(65,4,'special_price',NULL,'catalog/product_attribute_backend_price','decimal','','','price','Preço Promocional','','',0,0,'',0,''),(66,4,'special_from_date',NULL,'catalog/product_attribute_backend_startdate','datetime','','','date','Preço Promocional em','','',0,0,'',0,''),(67,4,'special_to_date',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Preço Promocional até','','',0,0,'',0,''),(68,4,'cost',NULL,'catalog/product_attribute_backend_price','decimal','','','price','Custo','','',0,1,'',0,''),(69,4,'weight',NULL,'','decimal','','','text','Peso','','',1,0,'',0,''),(70,4,'manufacturer',NULL,'','int','','','select','Fabricante','','',0,1,'',0,''),(71,4,'meta_title',NULL,'','varchar','','','text','Título da Página','','',0,0,'',0,''),(72,4,'meta_keyword',NULL,'','text','','','textarea','Palavras-Chave','','',0,0,'',0,''),(73,4,'meta_description',NULL,'','varchar','','','textarea','Descrição da Página','','',0,0,'',0,'Maximum 255 chars'),(74,4,'image',NULL,'','varchar','','catalog/product_attribute_frontend_image','media_image','Imagem Base','','',0,0,'',0,''),(75,4,'small_image',NULL,'','varchar','','catalog/product_attribute_frontend_image','media_image','Imagem Reduzida','','',0,0,'',0,''),(76,4,'thumbnail',NULL,'','varchar','','catalog/product_attribute_frontend_image','media_image','Miniatura','','',0,0,'',0,''),(77,4,'media_gallery',NULL,'catalog/product_attribute_backend_media','varchar','','','gallery','Galeria de Mídia','','',0,0,'',0,''),(78,4,'old_id',NULL,'','int','','','','','','',0,0,'',0,''),(79,4,'tier_price',NULL,'catalog/product_attribute_backend_tierprice','decimal','','','text','Faixa de Preços','','',0,0,'',0,''),(80,4,'color',NULL,'','int','','','select','Cor','','',0,1,'',0,''),(81,4,'news_from_date',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Novo Produto em','','',0,0,'',0,''),(82,4,'news_to_date',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Novo Produto até','','',0,0,'',0,''),(83,4,'gallery',NULL,'','varchar','','','gallery','Galeria de Imagens','','',0,0,'',0,''),(84,4,'status',NULL,'','int','','','select','Situação','','catalog/product_status',1,0,'',0,''),(85,4,'tax_class_id',NULL,'','int','','','select','Classe de Impostos','','tax/class_source_product',1,0,'',0,''),(86,4,'url_key',NULL,'catalog/product_attribute_backend_urlkey','varchar','','','text','Nome na URL','','',0,0,'',0,''),(87,4,'url_path',NULL,'','varchar','','','','','','',0,0,'',0,''),(88,4,'minimal_price',NULL,'','decimal','','','price','Preço Mínimo','','',0,0,'',0,''),(89,4,'is_recurring',NULL,'','int','','','select','Enable Recurring Profile','','eav/entity_attribute_source_boolean',0,0,'',0,'Products with recurring profile participate in catalog as nominal items.'),(90,4,'recurring_profile',NULL,'catalog/product_attribute_backend_recurring','text','','','text','Recurring Payment Profile','','',0,0,'',0,''),(91,4,'visibility',NULL,'','int','','','select','Visibilidade','','catalog/product_visibility',1,0,'4',0,''),(92,4,'custom_design',NULL,'','varchar','','','select','Leiaute Personalizado','','core/design_source_design',0,0,'',0,''),(93,4,'custom_design_from',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Ativar Em','','',0,0,'',0,''),(94,4,'custom_design_to',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Ativar Até','','',0,0,'',0,''),(95,4,'custom_layout_update',NULL,'','text','','','textarea','Atualização de Leiaute','','',0,0,'',0,''),(96,4,'page_layout',NULL,'','varchar','','','select','Formato da Página','','catalog/product_attribute_source_layout',0,0,'',0,''),(97,4,'options_container',NULL,'','varchar','','','select','Exibir opções do produto em','','catalog/entity_product_attribute_design_options_container',0,0,'container2',0,''),(98,4,'required_options',NULL,'','static','','','text','','','',0,0,'',0,''),(99,4,'has_options',NULL,'','static','','','text','','','',0,0,'',0,''),(100,4,'image_label',NULL,'','varchar','','','text','Descrição da Imagem','','',0,0,'',0,''),(101,4,'small_image_label',NULL,'','varchar','','','text','Descrição Imagem Reduzida','','',0,0,'',0,''),(102,4,'thumbnail_label',NULL,'','varchar','','','text','Descrição Miniatura','','',0,0,'',0,''),(103,4,'created_at',NULL,'eav/entity_attribute_backend_time_created','static','','','text','','','',1,0,'',0,''),(104,4,'updated_at',NULL,'eav/entity_attribute_backend_time_updated','static','','','text','','','',1,0,'',0,''),(105,3,'include_in_menu',NULL,'','int','','','select','Include in Navigation Menu','','eav/entity_attribute_source_boolean',1,0,'1',0,''),(106,3,'custom_use_parent_settings',NULL,'','int','','','select','Use Parent Category Settings','','eav/entity_attribute_source_boolean',0,0,'',0,''),(107,3,'custom_apply_to_products',NULL,'','int','','','select','Apply To Products','','eav/entity_attribute_source_boolean',0,0,'',0,''),(108,3,'filter_price_range',NULL,'','int','','','text','Layered Navigation Price Step','','',0,0,'',0,''),(109,4,'enable_googlecheckout',NULL,'','int','','','select','Permitir comprar usando Google Checkout','','eav/entity_attribute_source_boolean',0,0,'1',0,''),(110,4,'gift_message_available',NULL,'giftmessage/entity_attribute_backend_boolean_config','varchar','','','select','Permitir Mensagem de Presente','','giftmessage/entity_attribute_source_boolean_config',0,0,'2',0,''),(111,4,'price_type',NULL,'','int','','','','','','',1,0,'',0,''),(112,4,'sku_type',NULL,'','int','','','','','','',1,0,'',0,''),(113,4,'weight_type',NULL,'','int','','','','','','',1,0,'',0,''),(114,4,'price_view',NULL,'','int','','','select','Preço a Vista','','bundle/product_attribute_source_price_view',1,0,'',0,''),(115,4,'shipment_type',NULL,'','int','','','','Entrega','','',1,0,'',0,''),(116,4,'links_purchased_separately',NULL,'','int','','','','Links podem ser adquiridos separadamente','','',1,0,'',0,''),(117,4,'samples_title',NULL,'','varchar','','','','Título Amostra','','',1,0,'',0,''),(118,4,'links_title',NULL,'','varchar','','','','Título do Link','','',1,0,'',0,''),(119,4,'links_exist',NULL,'','int','','','','','','',0,0,'0',0,''),(120,4,'is_imported',NULL,'','int','','','select','In feed','','eav/entity_attribute_source_boolean',0,0,'',0,''),(121,4,'volume_comprimento',NULL,'','int','','','text','Comprimento (cm)','','',0,0,'',0,'Comprimento da embalagem do produto (Para cálculo de PAC, mínimo de 16)'),(122,4,'volume_altura',NULL,'','int','','','text','Altura (cm)','','',0,0,'',0,'Altura da embalagem do produto (Para cálculo de PAC, mínimo de 2)'),(123,4,'volume_largura',NULL,'','int','','','text','Largura (cm)','','',0,0,'',0,'Largura da embalagem do produto (Para cálculo de PAC, mínimo de 11)'),(124,4,'meta_robots',NULL,'','text','','','select','Meta Robots','','metarobots/product_attribute_source_unit',0,0,'',0,'');
/*!40000 ALTER TABLE `eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_group`
--

DROP TABLE IF EXISTS `eav_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_group_name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` smallint(6) NOT NULL DEFAULT '0',
  `default_id` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `attribute_set_id` (`attribute_set_id`,`attribute_group_name`),
  KEY `attribute_set_id_2` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `FK_eav_attribute_group` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_group`
--

LOCK TABLES `eav_attribute_group` WRITE;
/*!40000 ALTER TABLE `eav_attribute_group` DISABLE KEYS */;
INSERT INTO `eav_attribute_group` VALUES (1,1,'General',1,1),(2,2,'General',1,1),(3,3,'General Information',10,1),(4,4,'General',1,1),(5,4,'Prices',2,0),(6,4,'Meta Information',3,0),(7,4,'Images',4,0),(8,4,'Recurring Profile',5,0),(9,4,'Design',6,0),(10,3,'Display Settings',20,0),(11,3,'Custom Design',30,0),(12,5,'General',1,1),(13,6,'General',1,1),(14,7,'General',1,1),(15,8,'General',1,1);
/*!40000 ALTER TABLE `eav_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_label`
--

DROP TABLE IF EXISTS `eav_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`attribute_label_id`),
  KEY `IDX_ATTRIBUTE_LABEL_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_ATTRIBUTE_LABEL_STORE` (`store_id`),
  KEY `IDX_ATTRIBUTE_LABEL_ATTRIBUTE_STORE` (`attribute_id`,`store_id`),
  CONSTRAINT `FK_ATTRIBUTE_LABEL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ATTRIBUTE_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_label`
--

LOCK TABLES `eav_attribute_label` WRITE;
/*!40000 ALTER TABLE `eav_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option`
--

DROP TABLE IF EXISTS `eav_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `FK_ATTRIBUTE_OPTION_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_ATTRIBUTE_OPTION_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Attributes option (for source model)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option`
--

LOCK TABLES `eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option` DISABLE KEYS */;
INSERT INTO `eav_attribute_option` VALUES (1,32,0),(2,32,1);
/*!40000 ALTER TABLE `eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option_value`
--

DROP TABLE IF EXISTS `eav_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_OPTION_VALUE_OPTION` (`option_id`),
  KEY `FK_ATTRIBUTE_OPTION_VALUE_STORE` (`store_id`),
  CONSTRAINT `FK_ATTRIBUTE_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ATTRIBUTE_OPTION_VALUE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Attribute option values per store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option_value`
--

LOCK TABLES `eav_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option_value` DISABLE KEYS */;
INSERT INTO `eav_attribute_option_value` VALUES (1,1,0,'Male'),(2,2,0,'Female');
/*!40000 ALTER TABLE `eav_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_set`
--

DROP TABLE IF EXISTS `eav_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_set_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT '',
  `sort_order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `entity_type_id` (`entity_type_id`,`attribute_set_name`),
  KEY `entity_type_id_2` (`entity_type_id`,`sort_order`),
  CONSTRAINT `FK_eav_attribute_set` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_set`
--

LOCK TABLES `eav_attribute_set` WRITE;
/*!40000 ALTER TABLE `eav_attribute_set` DISABLE KEYS */;
INSERT INTO `eav_attribute_set` VALUES (1,1,'Default',1),(2,2,'Default',1),(3,3,'Default',1),(4,4,'Default',2),(5,5,'Default',1),(6,6,'Default',1),(7,7,'Default',1),(8,8,'Default',1);
/*!40000 ALTER TABLE `eav_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity`
--

DROP TABLE IF EXISTS `eav_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_id` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  KEY `FK_ENTITY_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ENTITY_STORE` (`store_id`),
  CONSTRAINT `FK_eav_entity` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_eav_entity_store` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Entityies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity`
--

LOCK TABLES `eav_entity` WRITE;
/*!40000 ALTER TABLE `eav_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_attribute`
--

DROP TABLE IF EXISTS `eav_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `attribute_set_id_2` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `attribute_group_id` (`attribute_group_id`,`attribute_id`),
  KEY `attribute_set_id_3` (`attribute_set_id`,`sort_order`),
  KEY `FK_EAV_ENTITY_ATTRIVUTE_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_GROUP` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_attribute`
--

LOCK TABLES `eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `eav_entity_attribute` DISABLE KEYS */;
INSERT INTO `eav_entity_attribute` VALUES (1,1,1,1,1,10),(2,1,1,1,2,20),(3,1,1,1,3,20),(4,1,1,1,4,30),(5,1,1,1,5,40),(6,1,1,1,6,50),(7,1,1,1,7,60),(8,1,1,1,8,70),(9,1,1,1,9,80),(10,1,1,1,10,25),(11,1,1,1,11,90),(12,1,1,1,12,81),(13,1,1,1,13,82),(14,1,1,1,14,83),(15,1,1,1,15,100),(16,1,1,1,16,85),(17,1,1,1,17,86),(18,2,2,2,18,10),(19,2,2,2,19,20),(20,2,2,2,20,30),(21,2,2,2,21,40),(22,2,2,2,22,50),(23,2,2,2,23,60),(24,2,2,2,24,70),(25,2,2,2,25,80),(26,2,2,2,26,90),(27,2,2,2,27,100),(28,2,2,2,28,100),(29,2,2,2,29,110),(30,2,2,2,30,120),(31,2,2,2,31,130),(32,1,1,1,32,110),(33,3,3,3,33,1),(34,3,3,3,34,2),(35,3,3,3,35,3),(36,3,3,3,36,4),(37,3,3,3,37,5),(38,3,3,3,38,6),(39,3,3,3,39,7),(40,3,3,3,40,8),(41,3,3,10,41,10),(42,3,3,10,42,20),(43,3,3,10,43,30),(44,3,3,3,44,12),(45,3,3,3,45,13),(46,3,3,3,46,14),(47,3,3,3,47,15),(48,3,3,3,48,16),(49,3,3,3,49,17),(50,3,3,11,50,10),(51,3,3,11,51,20),(52,3,3,11,52,30),(53,3,3,11,53,40),(54,3,3,11,54,50),(55,3,3,11,55,60),(56,3,3,3,56,24),(57,3,3,3,57,25),(58,3,3,10,58,40),(59,3,3,10,59,50),(60,4,4,4,60,1),(61,4,4,4,61,2),(62,4,4,4,62,3),(63,4,4,4,63,4),(64,4,4,5,64,1),(65,4,4,5,65,2),(66,4,4,5,66,3),(67,4,4,5,67,4),(68,4,4,5,68,5),(69,4,4,4,69,5),(70,4,4,6,71,1),(71,4,4,6,72,2),(72,4,4,6,73,3),(73,4,4,7,74,1),(74,4,4,7,75,2),(75,4,4,7,76,3),(76,4,4,7,77,4),(77,4,4,4,78,6),(78,4,4,5,79,6),(79,4,4,4,81,7),(80,4,4,4,82,8),(81,4,4,7,83,5),(82,4,4,4,84,9),(83,4,4,5,85,7),(84,4,4,4,86,10),(85,4,4,4,87,11),(86,4,4,5,88,8),(87,4,4,8,89,1),(88,4,4,8,90,2),(89,4,4,4,91,12),(90,4,4,9,92,1),(91,4,4,9,93,2),(92,4,4,9,94,3),(93,4,4,9,95,4),(94,4,4,9,96,5),(95,4,4,9,97,6),(96,4,4,4,98,13),(97,4,4,4,99,14),(98,4,4,4,100,15),(99,4,4,4,101,16),(100,4,4,4,102,17),(101,4,4,4,103,18),(102,4,4,4,104,19),(103,3,3,3,105,10),(104,3,3,11,106,5),(105,3,3,11,107,6),(106,3,3,10,108,51),(107,4,4,5,109,20),(108,4,4,4,110,20),(109,4,4,4,111,21),(110,4,4,4,112,22),(111,4,4,4,113,23),(112,4,4,5,114,21),(113,4,4,4,115,24),(114,4,4,4,116,25),(115,4,4,4,117,26),(116,4,4,4,118,27),(117,4,4,4,119,28),(118,4,4,4,120,29),(119,4,4,4,121,30),(120,4,4,4,122,31),(121,4,4,4,123,32),(122,4,4,6,124,4);
/*!40000 ALTER TABLE `eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_datetime`
--

DROP TABLE IF EXISTS `eav_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_DATETIME_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datetime values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_datetime`
--

LOCK TABLES `eav_entity_datetime` WRITE;
/*!40000 ALTER TABLE `eav_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_decimal`
--

DROP TABLE IF EXISTS `eav_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Decimal values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_decimal`
--

LOCK TABLES `eav_entity_decimal` WRITE;
/*!40000 ALTER TABLE `eav_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_int`
--

DROP TABLE IF EXISTS `eav_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_INT_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Integer values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_int`
--

LOCK TABLES `eav_entity_int` WRITE;
/*!40000 ALTER TABLE `eav_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_store`
--

DROP TABLE IF EXISTS `eav_entity_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_prefix` varchar(20) NOT NULL DEFAULT '',
  `increment_last_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_store_id`),
  KEY `FK_eav_entity_store_entity_type` (`entity_type_id`),
  KEY `FK_eav_entity_store_store` (`store_id`),
  CONSTRAINT `FK_eav_entity_store_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_eav_entity_store_store` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_store`
--

LOCK TABLES `eav_entity_store` WRITE;
/*!40000 ALTER TABLE `eav_entity_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_text`
--

DROP TABLE IF EXISTS `eav_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_TEXT_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_text`
--

LOCK TABLES `eav_entity_text` WRITE;
/*!40000 ALTER TABLE `eav_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_type`
--

DROP TABLE IF EXISTS `eav_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_code` varchar(50) NOT NULL DEFAULT '',
  `entity_model` varchar(255) NOT NULL,
  `attribute_model` varchar(255) NOT NULL,
  `entity_table` varchar(255) NOT NULL DEFAULT '',
  `value_table_prefix` varchar(255) NOT NULL DEFAULT '',
  `entity_id_field` varchar(255) NOT NULL DEFAULT '',
  `is_data_sharing` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `data_sharing_key` varchar(100) DEFAULT 'default',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_model` varchar(255) NOT NULL DEFAULT '',
  `increment_per_store` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `increment_pad_length` tinyint(8) unsigned NOT NULL DEFAULT '8',
  `increment_pad_char` char(1) NOT NULL DEFAULT '0',
  `additional_attribute_table` varchar(255) NOT NULL DEFAULT '',
  `entity_attribute_collection` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_type_id`),
  KEY `entity_name` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_type`
--

LOCK TABLES `eav_entity_type` WRITE;
/*!40000 ALTER TABLE `eav_entity_type` DISABLE KEYS */;
INSERT INTO `eav_entity_type` VALUES (1,'customer','customer/customer','customer/attribute','customer/entity','','',1,'default',1,'eav/entity_increment_numeric',0,8,'0','customer/eav_attribute','customer/attribute_collection'),(2,'customer_address','customer/address','customer/attribute','customer/address_entity','','',1,'default',2,'',0,8,'0','customer/eav_attribute','customer/address_attribute_collection'),(3,'catalog_category','catalog/category','catalog/resource_eav_attribute','catalog/category','','',1,'default',3,'',0,8,'0','catalog/eav_attribute','catalog/category_attribute_collection'),(4,'catalog_product','catalog/product','catalog/resource_eav_attribute','catalog/product','','',1,'default',4,'',0,8,'0','catalog/eav_attribute','catalog/product_attribute_collection'),(5,'order','sales/order','','sales/order','','',1,'default',0,'eav/entity_increment_numeric',1,8,'0','',''),(6,'invoice','sales/order_invoice','','sales/invoice','','',1,'default',0,'eav/entity_increment_numeric',1,8,'0','',''),(7,'creditmemo','sales/order_creditmemo','','sales/creditmemo','','',1,'default',0,'eav/entity_increment_numeric',1,8,'0','',''),(8,'shipment','sales/order_shipment','','sales/shipment','','',1,'default',0,'eav/entity_increment_numeric',1,8,'0','','');
/*!40000 ALTER TABLE `eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_varchar`
--

DROP TABLE IF EXISTS `eav_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varchar values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_varchar`
--

LOCK TABLES `eav_entity_varchar` WRITE;
/*!40000 ALTER TABLE `eav_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_element`
--

DROP TABLE IF EXISTS `eav_form_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(5) unsigned NOT NULL,
  `fieldset_id` smallint(5) unsigned DEFAULT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `UNQ_FORM_ATTRIBUTE` (`type_id`,`attribute_id`),
  KEY `IDX_FORM_TYPE` (`type_id`),
  KEY `IDX_FORM_FIELDSET` (`fieldset_id`),
  KEY `IDX_FORM_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_EAV_FORM_ELEMENT_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_ELEMENT_FORM_FIELDSET` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_ELEMENT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_element`
--

LOCK TABLES `eav_form_element` WRITE;
/*!40000 ALTER TABLE `eav_form_element` DISABLE KEYS */;
INSERT INTO `eav_form_element` VALUES (1,1,1,5,0),(2,1,1,7,1),(3,1,1,9,2),(4,2,2,5,0),(5,2,2,7,1),(6,2,2,9,2),(7,3,3,19,0),(8,3,3,21,1),(9,3,3,23,2),(10,3,3,30,3),(11,3,3,31,4),(12,3,4,24,0),(13,3,4,25,1),(14,3,4,27,2),(15,3,4,29,3),(16,3,4,26,4),(17,4,NULL,19,0),(18,4,NULL,21,1),(19,4,NULL,23,2),(20,4,NULL,9,3),(21,4,NULL,24,4),(22,4,NULL,25,5),(23,4,NULL,27,6),(24,4,NULL,29,7),(25,4,NULL,26,8),(26,4,NULL,30,9),(27,4,NULL,31,10),(28,5,NULL,19,0),(29,5,NULL,21,1),(30,5,NULL,23,2),(31,5,NULL,9,3),(32,5,NULL,24,4),(33,5,NULL,25,5),(34,5,NULL,27,6),(35,5,NULL,29,7),(36,5,NULL,26,8),(37,5,NULL,30,9),(38,5,NULL,31,10),(39,6,NULL,19,0),(40,6,NULL,21,1),(41,6,NULL,23,2),(42,6,NULL,24,3),(43,6,NULL,25,4),(44,6,NULL,27,5),(45,6,NULL,29,6),(46,6,NULL,26,7),(47,6,NULL,30,8),(48,6,NULL,31,9),(49,7,NULL,19,0),(50,7,NULL,21,1),(51,7,NULL,23,2),(52,7,NULL,24,3),(53,7,NULL,25,4),(54,7,NULL,27,5),(55,7,NULL,29,6),(56,7,NULL,26,7),(57,7,NULL,30,8),(58,7,NULL,31,9),(59,8,5,5,0),(60,8,5,7,1),(61,8,5,9,2),(62,8,6,23,0),(63,8,6,30,1),(64,8,6,24,2),(65,8,6,25,3),(66,8,6,27,4),(67,8,6,29,5),(68,8,6,26,6);
/*!40000 ALTER TABLE `eav_form_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_fieldset`
--

DROP TABLE IF EXISTS `eav_form_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(5) unsigned NOT NULL,
  `code` char(64) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `UNQ_FORM_FIELDSET_CODE` (`type_id`,`code`),
  KEY `IDX_FORM_TYPE` (`type_id`),
  CONSTRAINT `FK_EAV_FORM_FIELDSET_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_fieldset`
--

LOCK TABLES `eav_form_fieldset` WRITE;
/*!40000 ALTER TABLE `eav_form_fieldset` DISABLE KEYS */;
INSERT INTO `eav_form_fieldset` VALUES (1,1,'general',1),(2,2,'general',1),(3,3,'contact',1),(4,3,'address',2),(5,8,'general',1),(6,8,'address',2);
/*!40000 ALTER TABLE `eav_form_fieldset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `eav_form_fieldset_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `IDX_FORM_FIELDSET` (`fieldset_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_FORM_FIELDSET` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_fieldset_label`
--

LOCK TABLES `eav_form_fieldset_label` WRITE;
/*!40000 ALTER TABLE `eav_form_fieldset_label` DISABLE KEYS */;
INSERT INTO `eav_form_fieldset_label` VALUES (1,0,'Informações Pessoais'),(2,0,'Informações de Conta'),(3,0,'Informações de Contato'),(4,0,'Endereços'),(5,0,'Informações Pessoais'),(6,0,'Informações de Endereços');
/*!40000 ALTER TABLE `eav_form_fieldset_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_type`
--

DROP TABLE IF EXISTS `eav_form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(64) NOT NULL,
  `label` varchar(255) NOT NULL,
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `UNQ_FORM_TYPE_CODE` (`code`,`theme`,`store_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_EAV_FORM_TYPE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_type`
--

LOCK TABLES `eav_form_type` WRITE;
/*!40000 ALTER TABLE `eav_form_type` DISABLE KEYS */;
INSERT INTO `eav_form_type` VALUES (1,'customer_account_create','customer_account_create',1,'',0),(2,'customer_account_edit','customer_account_edit',1,'',0),(3,'customer_address_edit','customer_address_edit',1,'',0),(4,'checkout_onepage_register','checkout_onepage_register',1,'',0),(5,'checkout_onepage_register_guest','checkout_onepage_register_guest',1,'',0),(6,'checkout_onepage_billing_address','checkout_onepage_billing_address',1,'',0),(7,'checkout_onepage_shipping_address','checkout_onepage_shipping_address',1,'',0),(8,'checkout_multishipping_register','checkout_multishipping_register',1,'',0);
/*!40000 ALTER TABLE `eav_form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_type_entity`
--

DROP TABLE IF EXISTS `eav_form_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL,
  `entity_type_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `IDX_EAV_ENTITY_TYPE` (`entity_type_id`),
  CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_type_entity`
--

LOCK TABLES `eav_form_type_entity` WRITE;
/*!40000 ALTER TABLE `eav_form_type_entity` DISABLE KEYS */;
INSERT INTO `eav_form_type_entity` VALUES (1,1),(2,1),(4,1),(5,1),(8,1),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2);
/*!40000 ALTER TABLE `eav_form_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `find_feed_import_codes`
--

DROP TABLE IF EXISTS `find_feed_import_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `find_feed_import_codes` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `import_code` varchar(255) NOT NULL,
  `eav_code` varchar(255) NOT NULL,
  `is_imported` int(10) unsigned NOT NULL,
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `find_feed_import_codes`
--

LOCK TABLES `find_feed_import_codes` WRITE;
/*!40000 ALTER TABLE `find_feed_import_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `find_feed_import_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_message`
--

DROP TABLE IF EXISTS `gift_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_message` (
  `gift_message_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(7) unsigned NOT NULL DEFAULT '0',
  `sender` varchar(255) NOT NULL DEFAULT '',
  `recipient` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_message`
--

LOCK TABLES `gift_message` WRITE;
/*!40000 ALTER TABLE `gift_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googlebase_attributes`
--

DROP TABLE IF EXISTS `googlebase_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlebase_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `gbase_attribute` varchar(255) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` (`attribute_id`),
  KEY `GOOGLEBASE_ATTRIBUTES_TYPE_ID` (`type_id`),
  CONSTRAINT `GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `GOOGLEBASE_ATTRIBUTES_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `googlebase_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Attributes link Product Attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googlebase_attributes`
--

LOCK TABLES `googlebase_attributes` WRITE;
/*!40000 ALTER TABLE `googlebase_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlebase_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googlebase_items`
--

DROP TABLE IF EXISTS `googlebase_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlebase_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `gbase_item_id` varchar(255) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `published` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `impr` smallint(5) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `GOOGLEBASE_ITEMS_PRODUCT_ID` (`product_id`),
  KEY `GOOGLEBASE_ITEMS_STORE_ID` (`store_id`),
  CONSTRAINT `GOOGLEBASE_ITEMS_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `GOOGLEBASE_ITEMS_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Items Products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googlebase_items`
--

LOCK TABLES `googlebase_items` WRITE;
/*!40000 ALTER TABLE `googlebase_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlebase_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googlebase_types`
--

DROP TABLE IF EXISTS `googlebase_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlebase_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` smallint(5) unsigned NOT NULL,
  `gbase_itemtype` varchar(255) NOT NULL,
  `target_country` varchar(2) NOT NULL DEFAULT 'US',
  PRIMARY KEY (`type_id`),
  KEY `GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  CONSTRAINT `GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Item Types link Attribute Sets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googlebase_types`
--

LOCK TABLES `googlebase_types` WRITE;
/*!40000 ALTER TABLE `googlebase_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlebase_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googlecheckout_api_debug`
--

DROP TABLE IF EXISTS `googlecheckout_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlecheckout_api_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dir` enum('in','out') DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY (`debug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googlecheckout_api_debug`
--

LOCK TABLES `googlecheckout_api_debug` WRITE;
/*!40000 ALTER TABLE `googlecheckout_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlecheckout_api_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googlecheckout_notification`
--

DROP TABLE IF EXISTS `googlecheckout_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlecheckout_notification` (
  `serial_number` varchar(30) NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `status` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googlecheckout_notification`
--

LOCK TABLES `googlecheckout_notification` WRITE;
/*!40000 ALTER TABLE `googlecheckout_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlecheckout_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googleoptimizer_code`
--

DROP TABLE IF EXISTS `googleoptimizer_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(50) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned NOT NULL,
  `control_script` text,
  `tracking_script` text,
  `conversion_script` text,
  `conversion_page` varchar(255) NOT NULL DEFAULT '',
  `additional_data` text,
  PRIMARY KEY (`code_id`),
  KEY `GOOGLEOPTIMIZER_CODE_STORE` (`store_id`),
  CONSTRAINT `FK_GOOGLEOPTIMIZER_CODE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googleoptimizer_code`
--

LOCK TABLES `googleoptimizer_code` WRITE;
/*!40000 ALTER TABLE `googleoptimizer_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `googleoptimizer_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_event`
--

DROP TABLE IF EXISTS `index_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) NOT NULL,
  `entity` varchar(64) NOT NULL,
  `entity_pk` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `old_data` mediumtext,
  `new_data` mediumtext,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `IDX_UNIQUE_EVENT` (`type`,`entity`,`entity_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_event`
--

LOCK TABLES `index_event` WRITE;
/*!40000 ALTER TABLE `index_event` DISABLE KEYS */;
INSERT INTO `index_event` VALUES (1,'save','catalog_category',1,'2011-06-30 01:20:38','a:3:{s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}','a:8:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}'),(2,'save','catalog_category',2,'2011-06-30 01:20:38','a:3:{s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}','a:8:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}'),(3,'mass_action','catalog_product',NULL,'2011-06-30 01:41:28','a:7:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:13:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(4,'save','cataloginventory_stock_item',1,'2011-06-30 01:41:28','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(5,'save','catalog_product',1,'2011-06-30 01:41:28','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(6,'save','cataloginventory_stock_item',2,'2011-06-30 01:41:29','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(7,'save','catalog_product',2,'2011-06-30 01:41:29','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(8,'save','cataloginventory_stock_item',3,'2011-06-30 01:41:32','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(9,'save','catalog_product',3,'2011-06-30 01:41:32','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(10,'save','cataloginventory_stock_item',4,'2011-06-30 01:41:33','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(11,'save','catalog_product',4,'2011-06-30 01:41:33','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(12,'save','cataloginventory_stock_item',5,'2011-06-30 01:41:34','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(13,'save','catalog_product',5,'2011-06-30 01:41:34','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(14,'save','cataloginventory_stock_item',6,'2011-06-30 01:41:35','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(15,'save','catalog_product',6,'2011-06-30 01:41:35','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(16,'save','cataloginventory_stock_item',7,'2011-06-30 01:41:37','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(17,'save','catalog_product',7,'2011-06-30 01:41:37','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(18,'save','cataloginventory_stock_item',8,'2011-06-30 01:41:39','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(19,'save','catalog_product',8,'2011-06-30 01:41:39','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(20,'save','cataloginventory_stock_item',9,'2011-06-30 01:41:42','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(21,'save','catalog_product',9,'2011-06-30 01:41:42','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(22,'save','cataloginventory_stock_item',10,'2011-06-30 01:41:43','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(23,'save','catalog_product',10,'2011-06-30 01:41:43','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(24,'save','cataloginventory_stock_item',11,'2011-06-30 01:41:46','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(25,'save','catalog_product',11,'2011-06-30 01:41:47','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(26,'save','cataloginventory_stock_item',12,'2011-06-30 01:41:49','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(27,'save','catalog_product',12,'2011-06-30 01:41:49','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(28,'save','cataloginventory_stock_item',13,'2011-06-30 01:41:50','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(29,'save','catalog_product',13,'2011-06-30 01:41:50','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(30,'save','cataloginventory_stock_item',14,'2011-06-30 01:41:51','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(31,'save','catalog_product',14,'2011-06-30 01:41:52','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(32,'save','cataloginventory_stock_item',15,'2011-06-30 01:41:52','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(33,'save','catalog_product',15,'2011-06-30 01:41:52','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(34,'save','cataloginventory_stock_item',16,'2011-06-30 01:41:53','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(35,'save','catalog_product',16,'2011-06-30 01:41:53','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(36,'save','cataloginventory_stock_item',17,'2011-06-30 01:41:54','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(37,'save','catalog_product',17,'2011-06-30 01:41:54','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(38,'save','cataloginventory_stock_item',18,'2011-06-30 01:41:55','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(39,'save','catalog_product',18,'2011-06-30 01:41:55','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(40,'save','cataloginventory_stock_item',19,'2011-06-30 01:41:56','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(41,'save','catalog_product',19,'2011-06-30 01:41:56','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(42,'save','cataloginventory_stock_item',20,'2011-06-30 01:41:57','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(43,'save','catalog_product',20,'2011-06-30 01:41:57','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(44,'save','cataloginventory_stock_item',21,'2011-06-30 01:41:58','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(45,'save','catalog_product',21,'2011-06-30 01:41:59','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(46,'save','cataloginventory_stock_item',22,'2011-06-30 01:41:59','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(47,'save','catalog_product',22,'2011-06-30 01:41:59','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(48,'save','cataloginventory_stock_item',23,'2011-06-30 01:42:00','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(49,'save','catalog_product',23,'2011-06-30 01:42:00','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(50,'save','cataloginventory_stock_item',24,'2011-06-30 01:42:02','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(51,'save','catalog_product',24,'2011-06-30 01:42:02','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(52,'save','cataloginventory_stock_item',25,'2011-06-30 01:42:03','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(53,'save','catalog_product',25,'2011-06-30 01:42:03','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(54,'save','cataloginventory_stock_item',26,'2011-06-30 01:42:04','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(55,'save','catalog_product',26,'2011-06-30 01:42:04','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(56,'save','cataloginventory_stock_item',27,'2011-06-30 01:42:05','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(57,'save','catalog_product',27,'2011-06-30 01:42:05','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(58,'save','cataloginventory_stock_item',28,'2011-06-30 01:42:06','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(59,'save','catalog_product',28,'2011-06-30 01:42:06','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(60,'save','cataloginventory_stock_item',29,'2011-06-30 01:42:07','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(61,'save','catalog_product',29,'2011-06-30 01:42:07','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(62,'save','cataloginventory_stock_item',30,'2011-06-30 01:42:08','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(63,'save','catalog_product',30,'2011-06-30 01:42:08','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(64,'save','cataloginventory_stock_item',31,'2011-06-30 01:42:09','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(65,'save','catalog_product',31,'2011-06-30 01:42:09','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(66,'save','cataloginventory_stock_item',32,'2011-06-30 01:42:10','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(67,'save','catalog_product',32,'2011-06-30 01:42:10','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(68,'save','cataloginventory_stock_item',33,'2011-06-30 01:42:11','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(69,'save','catalog_product',33,'2011-06-30 01:42:11','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(70,'save','cataloginventory_stock_item',34,'2011-06-30 01:42:12','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(71,'save','catalog_product',34,'2011-06-30 01:42:12','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(72,'save','cataloginventory_stock_item',35,'2011-06-30 01:42:13','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(73,'save','catalog_product',35,'2011-06-30 01:42:13','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(74,'save','cataloginventory_stock_item',36,'2011-06-30 01:42:14','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(75,'save','catalog_product',36,'2011-06-30 01:42:14','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(76,'save','cataloginventory_stock_item',37,'2011-06-30 01:42:15','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(77,'save','catalog_product',37,'2011-06-30 01:42:15','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(78,'save','cataloginventory_stock_item',38,'2011-06-30 01:42:16','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(79,'save','catalog_product',38,'2011-06-30 01:42:16','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(80,'save','cataloginventory_stock_item',39,'2011-06-30 01:42:17','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(81,'save','catalog_product',39,'2011-06-30 01:42:17','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(82,'save','cataloginventory_stock_item',40,'2011-06-30 01:42:18','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(83,'save','catalog_product',40,'2011-06-30 01:42:18','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(84,'save','cataloginventory_stock_item',41,'2011-06-30 01:42:19','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(85,'save','catalog_product',41,'2011-06-30 01:42:19','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(86,'save','cataloginventory_stock_item',42,'2011-06-30 01:42:20','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(87,'save','catalog_product',42,'2011-06-30 01:42:20','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(88,'save','cataloginventory_stock_item',43,'2011-06-30 01:42:21','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(89,'save','catalog_product',43,'2011-06-30 01:42:21','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(90,'save','cataloginventory_stock_item',44,'2011-06-30 01:42:22','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(91,'save','catalog_product',44,'2011-06-30 01:42:23','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(92,'save','cataloginventory_stock_item',45,'2011-06-30 01:42:23','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(93,'save','catalog_product',45,'2011-06-30 01:42:23','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(94,'save','cataloginventory_stock_item',46,'2011-06-30 01:42:24','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(95,'save','catalog_product',46,'2011-06-30 01:42:25','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(96,'save','cataloginventory_stock_item',47,'2011-06-30 01:42:26','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(97,'save','catalog_product',47,'2011-06-30 01:42:26','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(98,'save','cataloginventory_stock_item',48,'2011-06-30 01:42:27','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(99,'save','catalog_product',48,'2011-06-30 01:42:27','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(100,'save','cataloginventory_stock_item',49,'2011-06-30 01:42:28','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(101,'save','catalog_product',49,'2011-06-30 01:42:28','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(102,'save','cataloginventory_stock_item',50,'2011-06-30 01:42:28','a:1:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(103,'save','catalog_product',50,'2011-06-30 01:42:29','a:8:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}','a:14:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;s:30:\"Mage_Tag_Model_Indexer_Summary\";N;}'),(104,'save','catalog_product_import',NULL,'2011-06-30 01:42:30','a:7:{s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}','a:13:{s:35:\"cataloginventory_stock_match_result\";b:1;s:41:\"Mage_CatalogInventory_Model_Indexer_Stock\";N;s:38:\"Mage_Catalog_Model_Product_Indexer_Eav\";N;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:1;s:39:\"Mage_Catalog_Model_Product_Indexer_Flat\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}'),(105,'save','core_config_data',158,'2011-06-30 01:48:49','a:1:{s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:40:\"Mage_Catalog_Model_Product_Indexer_Price\";N;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(106,'save','core_config_data',165,'2011-06-30 01:48:49','a:1:{s:30:\"Mage_Catalog_Model_Indexer_Url\";N;}','a:7:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}');
/*!40000 ALTER TABLE `index_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_process`
--

DROP TABLE IF EXISTS `index_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_process` (
  `process_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `indexer_code` varchar(32) NOT NULL,
  `status` enum('pending','working','require_reindex') NOT NULL DEFAULT 'pending',
  `started_at` datetime DEFAULT NULL,
  `ended_at` datetime DEFAULT NULL,
  `mode` enum('real_time','manual') NOT NULL DEFAULT 'real_time',
  PRIMARY KEY (`process_id`),
  UNIQUE KEY `IDX_CODE` (`indexer_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_process`
--

LOCK TABLES `index_process` WRITE;
/*!40000 ALTER TABLE `index_process` DISABLE KEYS */;
INSERT INTO `index_process` VALUES (1,'catalog_product_attribute','pending','2011-06-30 01:51:26','2011-06-30 01:51:26','real_time'),(2,'catalog_product_price','pending','2011-06-30 01:51:26','2011-06-30 01:51:27','real_time'),(3,'catalog_url','pending','2011-06-30 01:51:27','2011-06-30 01:51:27','real_time'),(4,'catalog_product_flat','pending','2011-06-30 01:51:26','2011-06-30 01:51:26','real_time'),(5,'catalog_category_flat','pending','2011-06-30 01:51:26','2011-06-30 01:51:26','real_time'),(6,'catalog_category_product','pending','2011-06-30 01:51:26','2011-06-30 01:51:26','real_time'),(7,'catalogsearch_fulltext','pending','2011-06-30 01:51:26','2011-06-30 01:51:26','real_time'),(8,'cataloginventory_stock','pending','2011-06-30 01:51:26','2011-06-30 01:51:26','real_time'),(9,'tag_summary','pending','2011-06-30 01:51:27','2011-06-30 01:51:27','real_time');
/*!40000 ALTER TABLE `index_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_process_event`
--

DROP TABLE IF EXISTS `index_process_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_process_event` (
  `process_id` int(10) unsigned NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `status` enum('new','working','done','error') NOT NULL DEFAULT 'new',
  PRIMARY KEY (`process_id`,`event_id`),
  KEY `FK_INDEX_EVNT_PROCESS` (`event_id`),
  CONSTRAINT `FK_INDEX_EVNT_PROCESS` FOREIGN KEY (`event_id`) REFERENCES `index_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_INDEX_PROCESS_EVENT` FOREIGN KEY (`process_id`) REFERENCES `index_process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_process_event`
--

LOCK TABLES `index_process_event` WRITE;
/*!40000 ALTER TABLE `index_process_event` DISABLE KEYS */;
INSERT INTO `index_process_event` VALUES (1,3,'done'),(1,5,'done'),(1,7,'done'),(1,9,'done'),(1,11,'done'),(1,13,'done'),(1,15,'done'),(1,17,'done'),(1,19,'done'),(1,21,'done'),(1,23,'done'),(1,25,'done'),(1,27,'done'),(1,29,'done'),(1,31,'done'),(1,33,'done'),(1,35,'done'),(1,37,'done'),(1,39,'done'),(1,41,'done'),(1,43,'done'),(1,45,'done'),(1,47,'done'),(1,49,'done'),(1,51,'done'),(1,53,'done'),(1,55,'done'),(1,57,'done'),(1,59,'done'),(1,61,'done'),(1,63,'done'),(1,65,'done'),(1,67,'done'),(1,69,'done'),(1,71,'done'),(1,73,'done'),(1,75,'done'),(1,77,'done'),(1,79,'done'),(1,81,'done'),(1,83,'done'),(1,85,'done'),(1,87,'done'),(1,89,'done'),(1,91,'done'),(1,93,'done'),(1,95,'done'),(1,97,'done'),(1,99,'done'),(1,101,'done'),(1,103,'done'),(1,104,'done'),(2,3,'done'),(2,5,'done'),(2,7,'done'),(2,9,'done'),(2,11,'done'),(2,13,'done'),(2,15,'done'),(2,17,'done'),(2,19,'done'),(2,21,'done'),(2,23,'done'),(2,25,'done'),(2,27,'done'),(2,29,'done'),(2,31,'done'),(2,33,'done'),(2,35,'done'),(2,37,'done'),(2,39,'done'),(2,41,'done'),(2,43,'done'),(2,45,'done'),(2,47,'done'),(2,49,'done'),(2,51,'done'),(2,53,'done'),(2,55,'done'),(2,57,'done'),(2,59,'done'),(2,61,'done'),(2,63,'done'),(2,65,'done'),(2,67,'done'),(2,69,'done'),(2,71,'done'),(2,73,'done'),(2,75,'done'),(2,77,'done'),(2,79,'done'),(2,81,'done'),(2,83,'done'),(2,85,'done'),(2,87,'done'),(2,89,'done'),(2,91,'done'),(2,93,'done'),(2,95,'done'),(2,97,'done'),(2,99,'done'),(2,101,'done'),(2,103,'done'),(2,104,'done'),(2,105,'done'),(3,1,'done'),(3,2,'done'),(3,5,'done'),(3,7,'done'),(3,9,'done'),(3,11,'done'),(3,13,'done'),(3,15,'done'),(3,17,'done'),(3,19,'done'),(3,21,'done'),(3,23,'done'),(3,25,'done'),(3,27,'done'),(3,29,'done'),(3,31,'done'),(3,33,'done'),(3,35,'done'),(3,37,'done'),(3,39,'done'),(3,41,'done'),(3,43,'done'),(3,45,'done'),(3,47,'done'),(3,49,'done'),(3,51,'done'),(3,53,'done'),(3,55,'done'),(3,57,'done'),(3,59,'done'),(3,61,'done'),(3,63,'done'),(3,65,'done'),(3,67,'done'),(3,69,'done'),(3,71,'done'),(3,73,'done'),(3,75,'done'),(3,77,'done'),(3,79,'done'),(3,81,'done'),(3,83,'done'),(3,85,'done'),(3,87,'done'),(3,89,'done'),(3,91,'done'),(3,93,'done'),(3,95,'done'),(3,97,'done'),(3,99,'done'),(3,101,'done'),(3,103,'done'),(3,104,'done'),(3,106,'done'),(4,3,'done'),(4,5,'done'),(4,7,'done'),(4,9,'done'),(4,11,'done'),(4,13,'done'),(4,15,'done'),(4,17,'done'),(4,19,'done'),(4,21,'done'),(4,23,'done'),(4,25,'done'),(4,27,'done'),(4,29,'done'),(4,31,'done'),(4,33,'done'),(4,35,'done'),(4,37,'done'),(4,39,'done'),(4,41,'done'),(4,43,'done'),(4,45,'done'),(4,47,'done'),(4,49,'done'),(4,51,'done'),(4,53,'done'),(4,55,'done'),(4,57,'done'),(4,59,'done'),(4,61,'done'),(4,63,'done'),(4,65,'done'),(4,67,'done'),(4,69,'done'),(4,71,'done'),(4,73,'done'),(4,75,'done'),(4,77,'done'),(4,79,'done'),(4,81,'done'),(4,83,'done'),(4,85,'done'),(4,87,'done'),(4,89,'done'),(4,91,'done'),(4,93,'done'),(4,95,'done'),(4,97,'done'),(4,99,'done'),(4,101,'done'),(4,103,'done'),(4,104,'done'),(6,1,'done'),(6,2,'done'),(6,3,'done'),(6,5,'done'),(6,7,'done'),(6,9,'done'),(6,11,'done'),(6,13,'done'),(6,15,'done'),(6,17,'done'),(6,19,'done'),(6,21,'done'),(6,23,'done'),(6,25,'done'),(6,27,'done'),(6,29,'done'),(6,31,'done'),(6,33,'done'),(6,35,'done'),(6,37,'done'),(6,39,'done'),(6,41,'done'),(6,43,'done'),(6,45,'done'),(6,47,'done'),(6,49,'done'),(6,51,'done'),(6,53,'done'),(6,55,'done'),(6,57,'done'),(6,59,'done'),(6,61,'done'),(6,63,'done'),(6,65,'done'),(6,67,'done'),(6,69,'done'),(6,71,'done'),(6,73,'done'),(6,75,'done'),(6,77,'done'),(6,79,'done'),(6,81,'done'),(6,83,'done'),(6,85,'done'),(6,87,'done'),(6,89,'done'),(6,91,'done'),(6,93,'done'),(6,95,'done'),(6,97,'done'),(6,99,'done'),(6,101,'done'),(6,103,'done'),(6,104,'done'),(7,1,'done'),(7,2,'done'),(7,3,'done'),(7,5,'done'),(7,7,'done'),(7,9,'done'),(7,11,'done'),(7,13,'done'),(7,15,'done'),(7,17,'done'),(7,19,'done'),(7,21,'done'),(7,23,'done'),(7,25,'done'),(7,27,'done'),(7,29,'done'),(7,31,'done'),(7,33,'done'),(7,35,'done'),(7,37,'done'),(7,39,'done'),(7,41,'done'),(7,43,'done'),(7,45,'done'),(7,47,'done'),(7,49,'done'),(7,51,'done'),(7,53,'done'),(7,55,'done'),(7,57,'done'),(7,59,'done'),(7,61,'done'),(7,63,'done'),(7,65,'done'),(7,67,'done'),(7,69,'done'),(7,71,'done'),(7,73,'done'),(7,75,'done'),(7,77,'done'),(7,79,'done'),(7,81,'done'),(7,83,'done'),(7,85,'done'),(7,87,'done'),(7,89,'done'),(7,91,'done'),(7,93,'done'),(7,95,'done'),(7,97,'done'),(7,99,'done'),(7,101,'done'),(7,103,'done'),(7,104,'done'),(8,3,'done'),(8,4,'done'),(8,5,'done'),(8,6,'done'),(8,7,'done'),(8,8,'done'),(8,9,'done'),(8,10,'done'),(8,11,'done'),(8,12,'done'),(8,13,'done'),(8,14,'done'),(8,15,'done'),(8,16,'done'),(8,17,'done'),(8,18,'done'),(8,19,'done'),(8,20,'done'),(8,21,'done'),(8,22,'done'),(8,23,'done'),(8,24,'done'),(8,25,'done'),(8,26,'done'),(8,27,'done'),(8,28,'done'),(8,29,'done'),(8,30,'done'),(8,31,'done'),(8,32,'done'),(8,33,'done'),(8,34,'done'),(8,35,'done'),(8,36,'done'),(8,37,'done'),(8,38,'done'),(8,39,'done'),(8,40,'done'),(8,41,'done'),(8,42,'done'),(8,43,'done'),(8,44,'done'),(8,45,'done'),(8,46,'done'),(8,47,'done'),(8,48,'done'),(8,49,'done'),(8,50,'done'),(8,51,'done'),(8,52,'done'),(8,53,'done'),(8,54,'done'),(8,55,'done'),(8,56,'done'),(8,57,'done'),(8,58,'done'),(8,59,'done'),(8,60,'done'),(8,61,'done'),(8,62,'done'),(8,63,'done'),(8,64,'done'),(8,65,'done'),(8,66,'done'),(8,67,'done'),(8,68,'done'),(8,69,'done'),(8,70,'done'),(8,71,'done'),(8,72,'done'),(8,73,'done'),(8,74,'done'),(8,75,'done'),(8,76,'done'),(8,77,'done'),(8,78,'done'),(8,79,'done'),(8,80,'done'),(8,81,'done'),(8,82,'done'),(8,83,'done'),(8,84,'done'),(8,85,'done'),(8,86,'done'),(8,87,'done'),(8,88,'done'),(8,89,'done'),(8,90,'done'),(8,91,'done'),(8,92,'done'),(8,93,'done'),(8,94,'done'),(8,95,'done'),(8,96,'done'),(8,97,'done'),(8,98,'done'),(8,99,'done'),(8,100,'done'),(8,101,'done'),(8,102,'done'),(8,103,'done'),(8,104,'done'),(9,3,'done'),(9,5,'done'),(9,7,'done'),(9,9,'done'),(9,11,'done'),(9,13,'done'),(9,15,'done'),(9,17,'done'),(9,19,'done'),(9,21,'done'),(9,23,'done'),(9,25,'done'),(9,27,'done'),(9,29,'done'),(9,31,'done'),(9,33,'done'),(9,35,'done'),(9,37,'done'),(9,39,'done'),(9,41,'done'),(9,43,'done'),(9,45,'done'),(9,47,'done'),(9,49,'done'),(9,51,'done'),(9,53,'done'),(9,55,'done'),(9,57,'done'),(9,59,'done'),(9,61,'done'),(9,63,'done'),(9,65,'done'),(9,67,'done'),(9,69,'done'),(9,71,'done'),(9,73,'done'),(9,75,'done'),(9,77,'done'),(9,79,'done'),(9,81,'done'),(9,83,'done'),(9,85,'done'),(9,87,'done'),(9,89,'done'),(9,91,'done'),(9,93,'done'),(9,95,'done'),(9,97,'done'),(9,99,'done'),(9,101,'done'),(9,103,'done');
/*!40000 ALTER TABLE `index_process_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interaktingslider_slide`
--

DROP TABLE IF EXISTS `interaktingslider_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interaktingslider_slide` (
  `slide_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text,
  `from_time` datetime DEFAULT NULL,
  `to_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`slide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Interaktingslider Slides';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaktingslider_slide`
--

LOCK TABLES `interaktingslider_slide` WRITE;
/*!40000 ALTER TABLE `interaktingslider_slide` DISABLE KEYS */;
INSERT INTO `interaktingslider_slide` VALUES (1,'Diapo 1','<p style=\"text-align: center; width: 100%; height: 220px; background-color: rgb(255, 255, 255); margin-top: 10px;\"><img height=\"54\" border=\"0\" align=\"middle\" width=\"200\" src=\"/media/upload/image/is_logo_interakting.png\" /><span style=\"font-size: large;\"><span style=\"font-family: Verdana;\"><br /><br />Interakting slider</span></span><span style=\"font-family: Arial;\"><br /><br />Ce module magento vous permettra de faire défiler des contenus simplement éditables en back office.</span><br /><br />Si vous avez besoin de renseignements ou de développements spécifiques magento, n\'hésitez pas:<a href=\"mailto:contact.magento-fr@interakting.com?subject=Interakting%20Slider\"><br /><br />contact.magento-fr@interakting.com</a></p>','2009-11-06 04:46:36',NULL,1),(2,'Diapo 2','<p style=\"text-align: center; width: 100%; height: 220px; background-color: rgb(255, 255, 255); margin-top: 10px;\"><img height=\"54\" width=\"200\" src=\"/media/upload/image/is_logo_interakting.png\" alt=\"\" /><span style=\"font-size: large;\"><span style=\"font-family: Verdana;\"><br /><br />Interakting slider</span></span><span style=\"font-family: Arial;\"><br /><br />This extension of Magento will give you the ability to display some contents that can be skinned in the back office</span><br /><br />If you need some informations or a specific development on Magento don\'t wait more time:<br /><br /><a href=\"mailto:contact.magento-fr@interakting.com?subject=Interakting%20Slider\">contact.magento-fr@interakting.com</a></p>','2009-11-06 06:46:36',NULL,1),(3,'Diapo 3','<p style=\"text-align: center; margin-top: 20px;\">Personnalisez moi dans votre panel d\'administration!! <br /><br /><img height=\"134\" width=\"600\" src=\"/media/upload/image/is_back_fr.png\" alt=\"\" /></p>','2009-11-06 10:46:36',NULL,1),(4,'Diapo 4','<p style=\"text-align: center; margin-top: 20px;\">Skinned me in your back office !!<br /><br /><img height=\"144\" width=\"600\" src=\"/media/upload/image/is_back_eng.png\" alt=\"\" /></p>','2009-11-06 10:46:36',NULL,1);
/*!40000 ALTER TABLE `interaktingslider_slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interaktingslider_slide_position`
--

DROP TABLE IF EXISTS `interaktingslider_slide_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interaktingslider_slide_position` (
  `slide_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `position` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`slide_id`,`store_id`),
  KEY `FK_CAROUSEL_SLIDE_POSITION_STORE` (`store_id`),
  CONSTRAINT `interaktingslider_slide_position_ibfk_1` FOREIGN KEY (`slide_id`) REFERENCES `interaktingslider_slide` (`slide_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `interaktingslider_slide_position_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Interaktingslider Slides Position';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaktingslider_slide_position`
--

LOCK TABLES `interaktingslider_slide_position` WRITE;
/*!40000 ALTER TABLE `interaktingslider_slide_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `interaktingslider_slide_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interaktingslider_slide_store`
--

DROP TABLE IF EXISTS `interaktingslider_slide_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interaktingslider_slide_store` (
  `slide_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`slide_id`,`store_id`),
  KEY `FK_CAROUSEL_SLIDE_STORE_STORE` (`store_id`),
  CONSTRAINT `interaktingslider_slide_store_ibfk_1` FOREIGN KEY (`slide_id`) REFERENCES `interaktingslider_slide` (`slide_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `interaktingslider_slide_store_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Interaktingslider Slides to Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaktingslider_slide_store`
--

LOCK TABLES `interaktingslider_slide_store` WRITE;
/*!40000 ALTER TABLE `interaktingslider_slide_store` DISABLE KEYS */;
INSERT INTO `interaktingslider_slide_store` VALUES (1,0),(2,0),(3,0),(4,0);
/*!40000 ALTER TABLE `interaktingslider_slide_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_customer`
--

DROP TABLE IF EXISTS `log_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_customer` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` bigint(20) unsigned DEFAULT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `login_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logout_at` datetime DEFAULT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `IDX_VISITOR` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customers log information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_customer`
--

LOCK TABLES `log_customer` WRITE;
/*!40000 ALTER TABLE `log_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_quote`
--

DROP TABLE IF EXISTS `log_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_quote` (
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `visitor_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote log data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_quote`
--

LOCK TABLES `log_quote` WRITE;
/*!40000 ALTER TABLE `log_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_summary`
--

DROP TABLE IF EXISTS `log_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_summary` (
  `summary_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL,
  `type_id` smallint(5) unsigned DEFAULT NULL,
  `visitor_count` int(11) NOT NULL DEFAULT '0',
  `customer_count` int(11) NOT NULL DEFAULT '0',
  `add_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Summary log information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_summary`
--

LOCK TABLES `log_summary` WRITE;
/*!40000 ALTER TABLE `log_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_summary_type`
--

DROP TABLE IF EXISTS `log_summary_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_summary_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_code` varchar(64) NOT NULL DEFAULT '',
  `period` smallint(5) unsigned NOT NULL DEFAULT '0',
  `period_type` enum('MINUTE','HOUR','DAY','WEEK','MONTH') NOT NULL DEFAULT 'MINUTE',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Type of summary information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_summary_type`
--

LOCK TABLES `log_summary_type` WRITE;
/*!40000 ALTER TABLE `log_summary_type` DISABLE KEYS */;
INSERT INTO `log_summary_type` VALUES (1,'hour',1,'HOUR'),(2,'day',1,'DAY');
/*!40000 ALTER TABLE `log_summary_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_url`
--

DROP TABLE IF EXISTS `log_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_url` (
  `url_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `visitor_id` bigint(20) unsigned DEFAULT NULL,
  `visit_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`url_id`),
  KEY `IDX_VISITOR` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='URL visiting history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_url`
--

LOCK TABLES `log_url` WRITE;
/*!40000 ALTER TABLE `log_url` DISABLE KEYS */;
INSERT INTO `log_url` VALUES (1,1,'2011-06-30 01:28:09'),(2,1,'2011-06-30 01:28:10'),(3,1,'2011-06-30 01:28:14'),(4,1,'2011-06-30 01:29:16'),(5,1,'2011-06-30 01:29:16'),(6,1,'2011-06-30 01:29:17'),(7,1,'2011-06-30 01:29:33'),(8,2,'2011-06-30 01:29:34'),(9,3,'2011-06-30 01:30:25'),(10,4,'2011-06-30 01:30:27'),(11,5,'2011-06-30 01:30:29'),(12,1,'2011-06-30 01:30:30'),(13,6,'2011-06-30 01:31:02'),(14,7,'2011-06-30 01:31:11'),(15,8,'2011-06-30 01:31:40'),(16,9,'2011-06-30 01:31:57'),(17,10,'2011-06-30 01:32:49'),(18,11,'2011-06-30 01:32:59'),(19,12,'2011-06-30 01:33:05'),(20,13,'2011-06-30 01:33:19'),(21,14,'2011-06-30 01:33:25'),(22,15,'2011-06-30 01:33:57'),(23,1,'2011-06-30 01:33:58'),(24,1,'2011-06-30 01:33:58'),(25,1,'2011-06-30 01:33:59'),(26,16,'2011-06-30 01:34:13'),(27,17,'2011-06-30 01:34:18'),(28,18,'2011-06-30 01:40:04'),(29,19,'2011-06-30 01:40:06'),(30,20,'2011-06-30 01:40:07'),(31,21,'2011-06-30 01:40:08'),(32,22,'2011-06-30 01:40:57'),(33,23,'2011-06-30 01:41:01'),(34,24,'2011-06-30 01:41:02'),(35,25,'2011-06-30 01:41:13'),(36,26,'2011-06-30 01:41:37'),(37,27,'2011-06-30 01:41:39'),(38,28,'2011-06-30 01:41:41'),(39,29,'2011-06-30 01:41:44'),(40,30,'2011-06-30 01:41:46'),(41,31,'2011-06-30 01:41:48'),(42,32,'2011-06-30 01:45:13'),(43,33,'2011-06-30 01:48:11'),(44,34,'2011-06-30 01:48:14'),(45,35,'2011-06-30 01:48:51'),(46,36,'2011-06-30 01:49:41'),(47,1,'2011-06-30 01:49:46'),(48,1,'2011-06-30 01:49:48'),(49,37,'2011-06-30 01:49:49'),(50,1,'2011-06-30 01:51:29'),(51,1,'2011-06-30 01:51:29'),(52,38,'2011-06-30 01:51:30'),(53,39,'2011-06-30 01:51:37'),(54,40,'2011-06-30 01:51:40'),(55,41,'2011-06-30 01:53:12'),(56,1,'2011-06-30 01:53:14'),(57,1,'2011-06-30 01:53:16'),(58,1,'2011-06-30 01:54:09'),(59,1,'2011-06-30 01:54:10'),(60,42,'2011-06-30 01:54:51'),(61,43,'2011-06-30 01:58:47'),(62,44,'2011-06-30 01:59:07');
/*!40000 ALTER TABLE `log_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_url_info`
--

DROP TABLE IF EXISTS `log_url_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_url_info` (
  `url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `referer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='Detale information about url visit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_url_info`
--

LOCK TABLES `log_url_info` WRITE;
/*!40000 ALTER TABLE `log_url_info` DISABLE KEYS */;
INSERT INTO `log_url_info` VALUES (1,'http://pastas.octagonoecommerce.com.br/',''),(2,'http://pastas.octagonoecommerce.com.br/',''),(3,'http://pastas.octagonoecommerce.com.br/',''),(4,'http://pastas.octagonoecommerce.com.br/',''),(5,'http://pastas.octagonoecommerce.com.br/',''),(6,'http://pastas.octagonoecommerce.com.br/',''),(7,'http://pastas.octagonoecommerce.com.br/',''),(8,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(9,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(10,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(11,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(12,'http://pastas.octagonoecommerce.com.br/',''),(13,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(14,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(15,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(16,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(17,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(18,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(19,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(20,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(21,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(22,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(23,'http://pastas.octagonoecommerce.com.br/',''),(24,'http://pastas.octagonoecommerce.com.br/',''),(25,'http://pastas.octagonoecommerce.com.br/skin/frontend/base/default/images/logo.png','http://pastas.octagonoecommerce.com.br/'),(26,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(27,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(28,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(29,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(30,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(31,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(32,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(33,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(34,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(35,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(36,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(37,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(38,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(39,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(40,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(41,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(42,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(43,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(44,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(45,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(46,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(47,'http://pastas.octagonoecommerce.com.br/',''),(48,'http://pastas.octagonoecommerce.com.br/skin/frontend/base/default/images/logo.png','http://pastas.octagonoecommerce.com.br/'),(49,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(50,'http://pastas.octagonoecommerce.com.br/',''),(51,'http://pastas.octagonoecommerce.com.br/skin/frontend/base/default/images/logo.png','http://pastas.octagonoecommerce.com.br/'),(52,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(53,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(54,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(55,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(56,'http://pastas.octagonoecommerce.com.br/',''),(57,'http://pastas.octagonoecommerce.com.br/skin/frontend/base/default/images/logo.png','http://pastas.octagonoecommerce.com.br/'),(58,'http://pastas.octagonoecommerce.com.br/',''),(59,'http://pastas.octagonoecommerce.com.br/skin/frontend/base/default/images/logo.png','http://pastas.octagonoecommerce.com.br/'),(60,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(61,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml',''),(62,'http://pastas.octagonoecommerce.com.br/app/etc/local.xml','');
/*!40000 ALTER TABLE `log_url_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_visitor`
--

DROP TABLE IF EXISTS `log_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` char(64) NOT NULL DEFAULT '',
  `first_visit_at` datetime DEFAULT NULL,
  `last_visit_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_url_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='System visitors log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_visitor`
--

LOCK TABLES `log_visitor` WRITE;
/*!40000 ALTER TABLE `log_visitor` DISABLE KEYS */;
INSERT INTO `log_visitor` VALUES (1,'ba18c096711e6d67007f168fc5fe97c3','2011-06-30 01:28:09','2011-06-30 01:54:10',59,1),(2,'4b19e5bc241b95789d74971df3115c5a','2011-06-30 01:29:33','2011-06-30 01:29:34',8,1),(3,'9b46c4896e4c9441399b3875e267df87','2011-06-30 01:30:25','2011-06-30 01:30:25',9,1),(4,'db993069298c81fabbc0eab2c59cdcf8','2011-06-30 01:30:27','2011-06-30 01:30:27',10,1),(5,'e20752d969e08f970d404d043a1c8166','2011-06-30 01:30:29','2011-06-30 01:30:29',11,1),(6,'f322989b6c64d50d2f76a47123a593c2','2011-06-30 01:31:02','2011-06-30 01:31:02',13,1),(7,'334628f41d8d6fee18c25fd2d25d0af9','2011-06-30 01:31:11','2011-06-30 01:31:11',14,1),(8,'20d3544439f238ba8943f3541e697fff','2011-06-30 01:31:40','2011-06-30 01:31:40',15,1),(9,'e55c7b9024ef972d7d037f74aa02d902','2011-06-30 01:31:57','2011-06-30 01:31:57',16,1),(10,'34b67544974c85a5c5b4af33cc290f05','2011-06-30 01:32:49','2011-06-30 01:32:49',17,1),(11,'2fa0ba2fd827122b69bc7315f7d6554a','2011-06-30 01:32:59','2011-06-30 01:32:59',18,1),(12,'5c615999143286d3bd8e6acc34eb4922','2011-06-30 01:33:05','2011-06-30 01:33:05',19,1),(13,'d31e1b32fa28b96aea1f84921d2376dd','2011-06-30 01:33:18','2011-06-30 01:33:19',20,1),(14,'923810db1bbb9d1cd8aac6648dc2ce1c','2011-06-30 01:33:25','2011-06-30 01:33:25',21,1),(15,'5e68bac32a5f752eceeb6567deb855af','2011-06-30 01:33:56','2011-06-30 01:33:57',22,1),(16,'91e546fdf4f81d8d02abaca10144cc79','2011-06-30 01:34:13','2011-06-30 01:34:13',26,1),(17,'6771b69c86a8c076bd136795bda62360','2011-06-30 01:34:18','2011-06-30 01:34:18',27,1),(18,'848aaf85a931ef1ef82d59e7a0aa96f5','2011-06-30 01:40:04','2011-06-30 01:40:04',28,1),(19,'8eacf0a0dbe7a7d70cdc746d01517116','2011-06-30 01:40:05','2011-06-30 01:40:06',29,1),(20,'d694281278b272d008168b498d8f9b43','2011-06-30 01:40:07','2011-06-30 01:40:07',30,1),(21,'bbdfa35884b36a42e133ff7de4447a61','2011-06-30 01:40:08','2011-06-30 01:40:08',31,1),(22,'041931b3bbb3c41d9668320b94d82ce3','2011-06-30 01:40:57','2011-06-30 01:40:57',32,1),(23,'3b1e70bc2fa7578ecf7b95333a465457','2011-06-30 01:41:01','2011-06-30 01:41:01',33,1),(24,'268584f3ff405f03434362391ad26977','2011-06-30 01:41:02','2011-06-30 01:41:02',34,1),(25,'bb77f8af18a51a6710a61aacfa8032ea','2011-06-30 01:41:13','2011-06-30 01:41:13',35,1),(26,'f24edc50096a3757cafc8a3b7197ab53','2011-06-30 01:41:37','2011-06-30 01:41:37',36,1),(27,'16ea68e3d2d437a1e1a014e3867eca18','2011-06-30 01:41:39','2011-06-30 01:41:39',37,1),(28,'69e03ae96d7586205435e422c3ed82d1','2011-06-30 01:41:41','2011-06-30 01:41:41',38,1),(29,'577c2f04d2e0d2dc5666f3c57ebb43dd','2011-06-30 01:41:44','2011-06-30 01:41:44',39,1),(30,'cd96048f652936d4d04187e9ac19ba0b','2011-06-30 01:41:46','2011-06-30 01:41:46',40,1),(31,'24547ec758f5a4952227fbc56f8656bb','2011-06-30 01:41:48','2011-06-30 01:41:48',41,1),(32,'2a33ea10d0a2c2dbe3fd92a2c93faa0f','2011-06-30 01:45:13','2011-06-30 01:45:13',42,1),(33,'42c37c20e79c56d1602cc458cc58a801','2011-06-30 01:48:11','2011-06-30 01:48:11',43,1),(34,'14ea625c2fcc03a30db404d278d435d7','2011-06-30 01:48:14','2011-06-30 01:48:14',44,1),(35,'7c4c9824ce2de11073fd83c07c1c02d2','2011-06-30 01:48:51','2011-06-30 01:48:51',45,1),(36,'3a5aea24e0b2e92c97486e1a910e2f02','2011-06-30 01:49:40','2011-06-30 01:49:41',46,1),(37,'c2f35f47c171dc50ce922878ed24b061','2011-06-30 01:49:49','2011-06-30 01:49:49',49,1),(38,'0e534c0916ee1038ee32afbe3a1cfd9b','2011-06-30 01:51:30','2011-06-30 01:51:30',52,1),(39,'01b345a9b5944e90fe8905806035f529','2011-06-30 01:51:36','2011-06-30 01:51:37',53,1),(40,'078218bdf8d0d44b9c968365071f5e42','2011-06-30 01:51:40','2011-06-30 01:51:40',54,1),(41,'6ca92b3be1752fcef9a346f5121efd91','2011-06-30 01:53:12','2011-06-30 01:53:12',55,1),(42,'4d157a308c0cf462c02add233ed530f7','2011-06-30 01:54:51','2011-06-30 01:54:51',60,1),(43,'bc4bf42a5a820435e09236a4f42b120c','2011-06-30 01:58:47','2011-06-30 01:58:47',61,1),(44,'a60e1f7e62c00fe1b701bf65a9652762','2011-06-30 01:59:07','2011-06-30 01:59:07',62,1);
/*!40000 ALTER TABLE `log_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_visitor_info`
--

DROP TABLE IF EXISTS `log_visitor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_visitor_info` (
  `visitor_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `http_referer` varchar(255) DEFAULT NULL,
  `http_user_agent` varchar(255) DEFAULT NULL,
  `http_accept_charset` varchar(255) DEFAULT NULL,
  `http_accept_language` varchar(255) DEFAULT NULL,
  `server_addr` bigint(20) DEFAULT NULL,
  `remote_addr` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional information by visitor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_visitor_info`
--

LOCK TABLES `log_visitor_info` WRITE;
/*!40000 ALTER TABLE `log_visitor_info` DISABLE KEYS */;
INSERT INTO `log_visitor_info` VALUES (1,'','Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0','ISO-8859-1,utf-8;q=0.7,*;q=0.7','pt-br,pt;q=0.8,en-us;q=0.5,en;q=0.3',3178300098,3171170734),(2,'','','','',3178300098,3178300098),(3,'','','','',3178300098,3178300098),(4,'','','','',3178300098,3178300098),(5,'','','','',3178300098,3178300098),(6,'','','','',3178300098,3178300098),(7,'','','','',3178300098,3178300098),(8,'','','','',3178300098,3178300098),(9,'','','','',3178300098,3178300098),(10,'','','','',3178300098,3178300098),(11,'','','','',3178300098,3178300098),(12,'','','','',3178300098,3178300098),(13,'','','','',3178300098,3178300098),(14,'','','','',3178300098,3178300098),(15,'','','','',3178300098,3178300098),(16,'','','','',3178300098,3178300098),(17,'','','','',3178300098,3178300098),(18,'','','','',3178300098,3178300098),(19,'','','','',3178300098,3178300098),(20,'','','','',3178300098,3178300098),(21,'','','','',3178300098,3178300098),(22,'','','','',3178300098,3178300098),(23,'','','','',3178300098,3178300098),(24,'','','','',3178300098,3178300098),(25,'','','','',3178300098,3178300098),(26,'','','','',3178300098,3178300098),(27,'','','','',3178300098,3178300098),(28,'','','','',3178300098,3178300098),(29,'','','','',3178300098,3178300098),(30,'','','','',3178300098,3178300098),(31,'','','','',3178300098,3178300098),(32,'','','','',3178300098,3178300098),(33,'','','','',3178300098,3178300098),(34,'','','','',3178300098,3178300098),(35,'','','','',3178300098,3178300098),(36,'','','','',3178300098,3178300098),(37,'','','','',3178300098,3178300098),(38,'','','','',3178300098,3178300098),(39,'','','','',3178300098,3178300098),(40,'','','','',3178300098,3178300098),(41,'','','','',3178300098,3178300098),(42,'','','','',3178300098,3178300098),(43,'','','','',3178300098,3178300098),(44,'','','','',3178300098,3178300098);
/*!40000 ALTER TABLE `log_visitor_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_visitor_online`
--

DROP TABLE IF EXISTS `log_visitor_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_visitor_online` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_type` char(1) NOT NULL,
  `remote_addr` bigint(20) NOT NULL,
  `first_visit_at` datetime DEFAULT NULL,
  `last_visit_at` datetime DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `last_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`),
  KEY `IDX_VISITOR_TYPE` (`visitor_type`),
  KEY `IDX_VISIT_TIME` (`first_visit_at`,`last_visit_at`),
  KEY `IDX_CUSTOMER` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_visitor_online`
--

LOCK TABLES `log_visitor_online` WRITE;
/*!40000 ALTER TABLE `log_visitor_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_visitor_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_problem`
--

DROP TABLE IF EXISTS `newsletter_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_problem` (
  `problem_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(7) unsigned DEFAULT NULL,
  `queue_id` int(7) unsigned NOT NULL DEFAULT '0',
  `problem_error_code` int(3) unsigned DEFAULT '0',
  `problem_error_text` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`problem_id`),
  KEY `FK_PROBLEM_SUBSCRIBER` (`subscriber_id`),
  KEY `FK_PROBLEM_QUEUE` (`queue_id`),
  CONSTRAINT `FK_PROBLEM_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`),
  CONSTRAINT `FK_PROBLEM_SUBSCRIBER` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter problems';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_problem`
--

LOCK TABLES `newsletter_problem` WRITE;
/*!40000 ALTER TABLE `newsletter_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue`
--

DROP TABLE IF EXISTS `newsletter_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue` (
  `queue_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(7) unsigned NOT NULL DEFAULT '0',
  `newsletter_type` int(3) DEFAULT NULL,
  `newsletter_text` text,
  `newsletter_styles` text,
  `newsletter_subject` varchar(200) DEFAULT NULL,
  `newsletter_sender_name` varchar(200) DEFAULT NULL,
  `newsletter_sender_email` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `queue_status` int(3) unsigned NOT NULL DEFAULT '0',
  `queue_start_at` datetime DEFAULT NULL,
  `queue_finish_at` datetime DEFAULT NULL,
  PRIMARY KEY (`queue_id`),
  KEY `FK_QUEUE_TEMPLATE` (`template_id`),
  CONSTRAINT `FK_QUEUE_TEMPLATE` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue`
--

LOCK TABLES `newsletter_queue` WRITE;
/*!40000 ALTER TABLE `newsletter_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue_link`
--

DROP TABLE IF EXISTS `newsletter_queue_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue_link` (
  `queue_link_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(7) unsigned NOT NULL DEFAULT '0',
  `subscriber_id` int(7) unsigned NOT NULL DEFAULT '0',
  `letter_sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`queue_link_id`),
  KEY `FK_QUEUE_LINK_SUBSCRIBER` (`subscriber_id`),
  KEY `FK_QUEUE_LINK_QUEUE` (`queue_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_SEND_AT` (`queue_id`,`letter_sent_at`),
  CONSTRAINT `FK_QUEUE_LINK_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_QUEUE_LINK_SUBSCRIBER` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter queue to subscriber link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue_link`
--

LOCK TABLES `newsletter_queue_link` WRITE;
/*!40000 ALTER TABLE `newsletter_queue_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `newsletter_queue_store_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue_store_link` (
  `queue_id` int(7) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE` (`store_id`),
  CONSTRAINT `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_LINK_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue_store_link`
--

LOCK TABLES `newsletter_queue_store_link` WRITE;
/*!40000 ALTER TABLE `newsletter_queue_store_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue_store_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_subscriber`
--

DROP TABLE IF EXISTS `newsletter_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_subscriber` (
  `subscriber_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT '0',
  `change_status_at` datetime DEFAULT NULL,
  `customer_id` int(11) unsigned NOT NULL DEFAULT '0',
  `subscriber_email` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `subscriber_status` int(3) NOT NULL DEFAULT '0',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL',
  PRIMARY KEY (`subscriber_id`),
  KEY `FK_SUBSCRIBER_CUSTOMER` (`customer_id`),
  KEY `FK_NEWSLETTER_SUBSCRIBER_STORE` (`store_id`),
  CONSTRAINT `FK_NEWSLETTER_SUBSCRIBER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter subscribers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscriber`
--

LOCK TABLES `newsletter_subscriber` WRITE;
/*!40000 ALTER TABLE `newsletter_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_template`
--

DROP TABLE IF EXISTS `newsletter_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_template` (
  `template_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `template_code` varchar(150) DEFAULT NULL,
  `template_text` text,
  `template_text_preprocessed` text COMMENT 'deprecated since 1.4.0.1',
  `template_styles` text,
  `template_type` int(3) unsigned DEFAULT NULL,
  `template_subject` varchar(200) DEFAULT NULL,
  `template_sender_name` varchar(200) DEFAULT NULL,
  `template_sender_email` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `template_actual` tinyint(1) unsigned DEFAULT '1',
  `added_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_actual` (`template_actual`),
  KEY `added_at` (`added_at`),
  KEY `modified_at` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_template`
--

LOCK TABLES `newsletter_template` WRITE;
/*!40000 ALTER TABLE `newsletter_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paygate_authorizenet_debug`
--

DROP TABLE IF EXISTS `paygate_authorizenet_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paygate_authorizenet_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_body` text,
  `response_body` text,
  `request_serialized` text,
  `result_serialized` text,
  `request_dump` text,
  `result_dump` text,
  PRIMARY KEY (`debug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paygate_authorizenet_debug`
--

LOCK TABLES `paygate_authorizenet_debug` WRITE;
/*!40000 ALTER TABLE `paygate_authorizenet_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `paygate_authorizenet_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_api_debug`
--

DROP TABLE IF EXISTS `paypal_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_api_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `debug_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_api_debug`
--

LOCK TABLES `paypal_api_debug` WRITE;
/*!40000 ALTER TABLE `paypal_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_api_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_settlement_report`
--

DROP TABLE IF EXISTS `paypal_settlement_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_date` date NOT NULL,
  `account_id` varchar(64) NOT NULL,
  `filename` varchar(24) NOT NULL,
  `last_modified` datetime NOT NULL,
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `UNQ_REPORT_DATE_ACCOUNT` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_settlement_report`
--

LOCK TABLES `paypal_settlement_report` WRITE;
/*!40000 ALTER TABLE `paypal_settlement_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_settlement_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_settlement_report_row`
--

DROP TABLE IF EXISTS `paypal_settlement_report_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(10) unsigned NOT NULL,
  `transaction_id` varchar(19) NOT NULL,
  `invoice_id` varchar(127) DEFAULT NULL,
  `paypal_reference_id` varchar(19) NOT NULL,
  `paypal_reference_id_type` enum('ODR','TXN','SUB','PAP','') NOT NULL,
  `transaction_event_code` char(5) NOT NULL DEFAULT '',
  `transaction_initiation_date` datetime DEFAULT NULL,
  `transaction_completion_date` datetime DEFAULT NULL,
  `transaction_debit_or_credit` enum('CR','DR') NOT NULL DEFAULT 'CR',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `gross_transaction_currency` char(3) NOT NULL DEFAULT '',
  `fee_debit_or_credit` enum('CR','DR') NOT NULL,
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `fee_currency` char(3) NOT NULL,
  `custom_field` varchar(255) DEFAULT NULL,
  `consumer_id` varchar(127) NOT NULL DEFAULT '',
  PRIMARY KEY (`row_id`),
  KEY `IDX_REPORT_ID` (`report_id`),
  CONSTRAINT `FK_PAYPAL_SETTLEMENT_ROW_REPORT` FOREIGN KEY (`report_id`) REFERENCES `paypal_settlement_report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_settlement_report_row`
--

LOCK TABLES `paypal_settlement_report_row` WRITE;
/*!40000 ALTER TABLE `paypal_settlement_report_row` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_settlement_report_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypaluk_api_debug`
--

DROP TABLE IF EXISTS `paypaluk_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypaluk_api_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `debug_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypaluk_api_debug`
--

LOCK TABLES `paypaluk_api_debug` WRITE;
/*!40000 ALTER TABLE `paypaluk_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypaluk_api_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll`
--

DROP TABLE IF EXISTS `poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll` (
  `poll_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_title` varchar(255) NOT NULL DEFAULT '',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT '0',
  `date_posted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_closed` datetime DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `answers_display` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`poll_id`),
  KEY `FK_POLL_STORE` (`store_id`),
  CONSTRAINT `FK_POLL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll`
--

LOCK TABLES `poll` WRITE;
/*!40000 ALTER TABLE `poll` DISABLE KEYS */;
INSERT INTO `poll` VALUES (1,'Qual sua cor favorita',5,1,'2011-06-29 22:20:46',NULL,1,0,NULL);
/*!40000 ALTER TABLE `poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answer`
--

DROP TABLE IF EXISTS `poll_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answer` (
  `answer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0',
  `answer_title` varchar(255) NOT NULL DEFAULT '',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0',
  `answer_order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`answer_id`),
  KEY `FK_POLL_PARENT` (`poll_id`),
  CONSTRAINT `FK_POLL_PARENT` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answer`
--

LOCK TABLES `poll_answer` WRITE;
/*!40000 ALTER TABLE `poll_answer` DISABLE KEYS */;
INSERT INTO `poll_answer` VALUES (1,1,'Verde',4,0),(2,1,'Vermelho',1,0),(3,1,'Preto',0,0),(4,1,'Magenta',0,0);
/*!40000 ALTER TABLE `poll_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_store`
--

DROP TABLE IF EXISTS `poll_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_store` (
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`poll_id`,`store_id`),
  KEY `FK_POLL_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_POLL_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_POLL_STORE_POLL` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_store`
--

LOCK TABLES `poll_store` WRITE;
/*!40000 ALTER TABLE `poll_store` DISABLE KEYS */;
INSERT INTO `poll_store` VALUES (1,1);
/*!40000 ALTER TABLE `poll_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_vote`
--

DROP TABLE IF EXISTS `poll_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_vote` (
  `vote_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poll_answer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` bigint(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `vote_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vote_id`),
  KEY `FK_POLL_ANSWER` (`poll_answer_id`),
  CONSTRAINT `FK_POLL_ANSWER` FOREIGN KEY (`poll_answer_id`) REFERENCES `poll_answer` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_vote`
--

LOCK TABLES `poll_vote` WRITE;
/*!40000 ALTER TABLE `poll_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_alert_price`
--

DROP TABLE IF EXISTS `product_alert_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `add_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_send_date` datetime DEFAULT NULL,
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`alert_price_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_CUSTOMER` (`customer_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_PRODUCT` (`product_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_alert_price`
--

LOCK TABLES `product_alert_price` WRITE;
/*!40000 ALTER TABLE `product_alert_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_alert_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_alert_stock`
--

DROP TABLE IF EXISTS `product_alert_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `add_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `send_date` datetime DEFAULT NULL,
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`alert_stock_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_CUSTOMER` (`customer_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_PRODUCT` (`product_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_WEBSITE` (`website_id`),
  CONSTRAINT `FK_PRODUCT_ALERT_STOCK_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_STOCK_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_STOCK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_alert_stock`
--

LOCK TABLES `product_alert_stock` WRITE;
/*!40000 ALTER TABLE `product_alert_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_alert_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `rating_code` varchar(64) NOT NULL DEFAULT '',
  `position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `IDX_CODE` (`rating_code`),
  KEY `FK_RATING_ENTITY` (`entity_id`),
  CONSTRAINT `FK_RATING_ENTITY_KEY` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,'Qualidade',0),(2,1,'Pontuação',0),(3,1,'Preço',0);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_entity`
--

DROP TABLE IF EXISTS `rating_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_entity` (
  `entity_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `IDX_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Rating entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_entity`
--

LOCK TABLES `rating_entity` WRITE;
/*!40000 ALTER TABLE `rating_entity` DISABLE KEYS */;
INSERT INTO `rating_entity` VALUES (1,'product'),(2,'product_review'),(3,'review');
/*!40000 ALTER TABLE `rating_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option`
--

DROP TABLE IF EXISTS `rating_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL DEFAULT '',
  `value` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `FK_RATING_OPTION_RATING` (`rating_id`),
  CONSTRAINT `FK_RATING_OPTION_RATING` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Rating options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option`
--

LOCK TABLES `rating_option` WRITE;
/*!40000 ALTER TABLE `rating_option` DISABLE KEYS */;
INSERT INTO `rating_option` VALUES (1,1,'1',1,1),(2,1,'2',2,2),(3,1,'3',3,3),(4,1,'4',4,4),(5,1,'5',5,5),(6,2,'1',1,1),(7,2,'2',2,2),(8,2,'3',3,3),(9,2,'4',4,4),(10,2,'5',5,5),(11,3,'1',1,1),(12,3,'2',2,2),(13,3,'3',3,3),(14,3,'4',4,4),(15,3,'5',5,5);
/*!40000 ALTER TABLE `rating_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option_vote`
--

DROP TABLE IF EXISTS `rating_option_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remote_ip` varchar(16) NOT NULL DEFAULT '',
  `remote_ip_long` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) unsigned DEFAULT '0',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `review_id` bigint(20) unsigned DEFAULT NULL,
  `percent` tinyint(3) NOT NULL DEFAULT '0',
  `value` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`),
  KEY `FK_RATING_OPTION_VALUE_OPTION` (`option_id`),
  KEY `FK_RATING_OPTION_REVIEW_ID` (`review_id`),
  CONSTRAINT `FK_RATING_OPTION_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option_vote`
--

LOCK TABLES `rating_option_vote` WRITE;
/*!40000 ALTER TABLE `rating_option_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_option_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `rating_option_vote_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `percent` tinyint(3) NOT NULL DEFAULT '0',
  `percent_approved` tinyint(3) DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`primary_id`),
  KEY `FK_RATING_OPTION_VALUE_AGGREGATE` (`rating_id`),
  KEY `FK_RATING_OPTION_VOTE_AGGREGATED_STORE` (`store_id`),
  CONSTRAINT `FK_RATING_OPTION_VALUE_AGGREGATE` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option_vote_aggregated`
--

LOCK TABLES `rating_option_vote_aggregated` WRITE;
/*!40000 ALTER TABLE `rating_option_vote_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_option_vote_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_store`
--

DROP TABLE IF EXISTS `rating_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_store` (
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `FK_RATING_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_RATING_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_STORE_RATING` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_store`
--

LOCK TABLES `rating_store` WRITE;
/*!40000 ALTER TABLE `rating_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_title`
--

DROP TABLE IF EXISTS `rating_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_title` (
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `FK_RATING_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_RATING_TITLE` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_title`
--

LOCK TABLES `rating_title` WRITE;
/*!40000 ALTER TABLE `rating_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_compared_product_index`
--

DROP TABLE IF EXISTS `report_compared_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_BY_VISITOR` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_BY_CUSTOMER` (`customer_id`,`product_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_SORT_ADDED_AT` (`added_at`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_compared_product_index`
--

LOCK TABLES `report_compared_product_index` WRITE;
/*!40000 ALTER TABLE `report_compared_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_compared_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_event`
--

DROP TABLE IF EXISTS `report_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logged_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `event_type_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0',
  `subtype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `IDX_EVENT_TYPE` (`event_type_id`),
  KEY `IDX_SUBJECT` (`subject_id`),
  KEY `IDX_OBJECT` (`object_id`),
  KEY `IDX_SUBTYPE` (`subtype`),
  KEY `FK_REPORT_EVENT_STORE` (`store_id`),
  CONSTRAINT `FK_REPORT_EVENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_EVENT_TYPE` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_event`
--

LOCK TABLES `report_event` WRITE;
/*!40000 ALTER TABLE `report_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_event_types`
--

DROP TABLE IF EXISTS `report_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_event_types` (
  `event_type_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `event_name` varchar(64) NOT NULL,
  `customer_login` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_event_types`
--

LOCK TABLES `report_event_types` WRITE;
/*!40000 ALTER TABLE `report_event_types` DISABLE KEYS */;
INSERT INTO `report_event_types` VALUES (1,'catalog_product_view',1),(2,'sendfriend_product',1),(3,'catalog_product_compare_add_product',1),(4,'checkout_cart_add_product',1),(5,'wishlist_add_product',1),(6,'wishlist_share',1);
/*!40000 ALTER TABLE `report_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_index`
--

DROP TABLE IF EXISTS `report_viewed_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_BY_VISITOR` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_BY_CUSTOMER` (`customer_id`,`product_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_SORT_ADDED_AT` (`added_at`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_index`
--

LOCK TABLES `report_viewed_product_index` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`),
  KEY `FK_REVIEW_ENTITY` (`entity_id`),
  KEY `FK_REVIEW_STATUS` (`status_id`),
  KEY `FK_REVIEW_PARENT_PRODUCT` (`entity_pk_value`),
  CONSTRAINT `FK_REVIEW_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_STATUS` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_detail`
--

DROP TABLE IF EXISTS `review_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  `nickname` varchar(128) NOT NULL DEFAULT '',
  `customer_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `FK_REVIEW_DETAIL_REVIEW` (`review_id`),
  KEY `FK_REVIEW_DETAIL_STORE` (`store_id`),
  KEY `FK_REVIEW_DETAIL_CUSTOMER` (`customer_id`),
  CONSTRAINT `FK_REVIEW_DETAIL_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_DETAIL_REVIEW` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_DETAIL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_detail`
--

LOCK TABLES `review_detail` WRITE;
/*!40000 ALTER TABLE `review_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_entity`
--

DROP TABLE IF EXISTS `review_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_entity`
--

LOCK TABLES `review_entity` WRITE;
/*!40000 ALTER TABLE `review_entity` DISABLE KEYS */;
INSERT INTO `review_entity` VALUES (1,'product'),(2,'customer'),(3,'category');
/*!40000 ALTER TABLE `review_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_entity_summary`
--

DROP TABLE IF EXISTS `review_entity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0',
  `entity_type` tinyint(4) NOT NULL DEFAULT '0',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0',
  `rating_summary` tinyint(4) NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`primary_id`),
  KEY `FK_REVIEW_ENTITY_SUMMARY_STORE` (`store_id`),
  CONSTRAINT `FK_REVIEW_ENTITY_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_entity_summary`
--

LOCK TABLES `review_entity_summary` WRITE;
/*!40000 ALTER TABLE `review_entity_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_entity_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_status`
--

DROP TABLE IF EXISTS `review_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_status` (
  `status_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_status`
--

LOCK TABLES `review_status` WRITE;
/*!40000 ALTER TABLE `review_status` DISABLE KEYS */;
INSERT INTO `review_status` VALUES (1,'Approved'),(2,'Pending'),(3,'Not Approved');
/*!40000 ALTER TABLE `review_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_store`
--

DROP TABLE IF EXISTS `review_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_store` (
  `review_id` bigint(20) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `FK_REVIEW_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_REVIEW_STORE_REVIEW` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_store`
--

LOCK TABLES `review_store` WRITE;
/*!40000 ALTER TABLE `review_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_daily` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_PRODUCT` (`period`,`store_id`,`product_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_DAILY_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_DAILY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_daily`
--

LOCK TABLES `sales_bestsellers_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_monthly` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_PRODUCT` (`period`,`store_id`,`product_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_MONTHLY_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_MONTHLY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_monthly`
--

LOCK TABLES `sales_bestsellers_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_yearly` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_PRODUCT` (`period`,`store_id`,`product_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_YEARLY_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_YEARLY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_yearly`
--

LOCK TABLES `sales_bestsellers_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_billing_agreement`
--

DROP TABLE IF EXISTS `sales_billing_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `method_code` varchar(32) NOT NULL,
  `reference_id` varchar(32) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `agreement_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`agreement_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `FK_BILLING_AGREEMENT_STORE` (`store_id`),
  CONSTRAINT `FK_BILLING_AGREEMENT_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BILLING_AGREEMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_billing_agreement`
--

LOCK TABLES `sales_billing_agreement` WRITE;
/*!40000 ALTER TABLE `sales_billing_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_billing_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_billing_agreement_order`
--

DROP TABLE IF EXISTS `sales_billing_agreement_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `UNQ_BILLING_AGREEMENT_ORDER` (`agreement_id`,`order_id`),
  KEY `FK_BILLING_AGREEMENT_ORDER_ORDER` (`order_id`),
  CONSTRAINT `FK_BILLING_AGREEMENT_ORDER_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BILLING_AGREEMENT_ORDER_AGREEMENT` FOREIGN KEY (`agreement_id`) REFERENCES `sales_billing_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_billing_agreement_order`
--

LOCK TABLES `sales_billing_agreement_order` WRITE;
/*!40000 ALTER TABLE `sales_billing_agreement_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_billing_agreement_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_creditmemo`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `adjustment_positive` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `store_to_order_rate` decimal(12,4) DEFAULT NULL,
  `base_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_to_order_rate` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL,
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `shipping_amount` decimal(12,4) DEFAULT NULL,
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `adjustment_negative` decimal(12,4) DEFAULT NULL,
  `base_shipping_amount` decimal(12,4) DEFAULT NULL,
  `store_to_base_rate` decimal(12,4) DEFAULT NULL,
  `base_to_global_rate` decimal(12,4) DEFAULT NULL,
  `base_adjustment` decimal(12,4) DEFAULT NULL,
  `base_subtotal` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `subtotal` decimal(12,4) DEFAULT NULL,
  `adjustment` decimal(12,4) DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT NULL,
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL,
  `base_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `email_sent` tinyint(1) unsigned DEFAULT NULL,
  `creditmemo_status` int(10) DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `shipping_address_id` int(10) DEFAULT NULL,
  `billing_address_id` int(10) DEFAULT NULL,
  `invoice_id` int(10) DEFAULT NULL,
  `cybersource_token` varchar(255) DEFAULT NULL,
  `store_currency_code` char(3) DEFAULT NULL,
  `order_currency_code` char(3) DEFAULT NULL,
  `base_currency_code` char(3) DEFAULT NULL,
  `global_currency_code` char(3) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_creditmemo`
--

LOCK TABLES `sales_flat_creditmemo` WRITE;
/*!40000 ALTER TABLE `sales_flat_creditmemo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_creditmemo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_creditmemo_comment`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` int(10) DEFAULT NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_COMMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_creditmemo_comment`
--

LOCK TABLES `sales_flat_creditmemo_comment` WRITE;
/*!40000 ALTER TABLE `sales_flat_creditmemo_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_creditmemo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_creditmemo_grid`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `store_to_order_rate` decimal(12,4) DEFAULT NULL,
  `base_to_order_rate` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `store_to_base_rate` decimal(12,4) DEFAULT NULL,
  `base_to_global_rate` decimal(12,4) DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `creditmemo_status` int(10) DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `invoice_id` int(10) DEFAULT NULL,
  `store_currency_code` char(3) DEFAULT NULL,
  `order_currency_code` char(3) DEFAULT NULL,
  `base_currency_code` char(3) DEFAULT NULL,
  `global_currency_code` char(3) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `order_increment_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `order_created_at` datetime DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_creditmemo_grid`
--

LOCK TABLES `sales_flat_creditmemo_grid` WRITE;
/*!40000 ALTER TABLE `sales_flat_creditmemo_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_creditmemo_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_creditmemo_item`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `base_price` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `base_row_total` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `row_total` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `base_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_tax_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `qty` decimal(12,4) DEFAULT NULL,
  `base_cost` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `order_item_id` int(10) DEFAULT NULL,
  `additional_data` text,
  `description` text,
  `weee_tax_applied` text,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_ITEM_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_creditmemo_item`
--

LOCK TABLES `sales_flat_creditmemo_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_creditmemo_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_creditmemo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_invoice`
--

DROP TABLE IF EXISTS `sales_flat_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT NULL,
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `base_tax_amount` decimal(12,4) DEFAULT NULL,
  `store_to_order_rate` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_to_order_rate` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `shipping_amount` decimal(12,4) DEFAULT NULL,
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `store_to_base_rate` decimal(12,4) DEFAULT NULL,
  `base_shipping_amount` decimal(12,4) DEFAULT NULL,
  `total_qty` decimal(12,4) DEFAULT NULL,
  `base_to_global_rate` decimal(12,4) DEFAULT NULL,
  `subtotal` decimal(12,4) DEFAULT NULL,
  `base_subtotal` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `billing_address_id` int(10) DEFAULT NULL,
  `is_used_for_refund` tinyint(1) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `email_sent` tinyint(1) unsigned DEFAULT NULL,
  `can_void_flag` tinyint(1) unsigned DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `shipping_address_id` int(10) DEFAULT NULL,
  `cybersource_token` varchar(255) DEFAULT NULL,
  `store_currency_code` char(3) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `order_currency_code` char(3) DEFAULT NULL,
  `base_currency_code` char(3) DEFAULT NULL,
  `global_currency_code` char(3) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_INVOICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_invoice`
--

LOCK TABLES `sales_flat_invoice` WRITE;
/*!40000 ALTER TABLE `sales_flat_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_invoice_comment`
--

DROP TABLE IF EXISTS `sales_flat_invoice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` tinyint(1) unsigned DEFAULT NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_COMMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_invoice_comment`
--

LOCK TABLES `sales_flat_invoice_comment` WRITE;
/*!40000 ALTER TABLE `sales_flat_invoice_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_invoice_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_invoice_grid`
--

DROP TABLE IF EXISTS `sales_flat_invoice_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `state` int(10) DEFAULT NULL,
  `store_currency_code` char(3) DEFAULT NULL,
  `order_currency_code` char(3) DEFAULT NULL,
  `base_currency_code` char(3) DEFAULT NULL,
  `global_currency_code` char(3) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `order_increment_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `order_created_at` datetime DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_invoice_grid`
--

LOCK TABLES `sales_flat_invoice_grid` WRITE;
/*!40000 ALTER TABLE `sales_flat_invoice_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_invoice_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_invoice_item`
--

DROP TABLE IF EXISTS `sales_flat_invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `base_price` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `base_row_total` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `row_total` decimal(12,4) DEFAULT NULL,
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `base_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `base_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `qty` decimal(12,4) DEFAULT NULL,
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `base_cost` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `order_item_id` int(10) DEFAULT NULL,
  `additional_data` text,
  `description` text,
  `weee_tax_applied` text,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_ITEM_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_invoice_item`
--

LOCK TABLES `sales_flat_invoice_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_invoice_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order`
--

DROP TABLE IF EXISTS `sales_flat_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(32) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `protect_code` varchar(255) DEFAULT NULL,
  `shipping_description` varchar(255) DEFAULT NULL,
  `is_virtual` tinyint(1) unsigned DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `base_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_discount_canceled` decimal(12,4) DEFAULT NULL,
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL,
  `base_discount_refunded` decimal(12,4) DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT NULL,
  `base_shipping_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL,
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL,
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL,
  `base_subtotal` decimal(12,4) DEFAULT NULL,
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL,
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL,
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL,
  `base_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_tax_canceled` decimal(12,4) DEFAULT NULL,
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL,
  `base_tax_refunded` decimal(12,4) DEFAULT NULL,
  `base_to_global_rate` decimal(12,4) DEFAULT NULL,
  `base_to_order_rate` decimal(12,4) DEFAULT NULL,
  `base_total_canceled` decimal(12,4) DEFAULT NULL,
  `base_total_invoiced` decimal(12,4) DEFAULT NULL,
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL,
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL,
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL,
  `base_total_paid` decimal(12,4) DEFAULT NULL,
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL,
  `base_total_refunded` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `discount_canceled` decimal(12,4) DEFAULT NULL,
  `discount_invoiced` decimal(12,4) DEFAULT NULL,
  `discount_refunded` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `shipping_amount` decimal(12,4) DEFAULT NULL,
  `shipping_canceled` decimal(12,4) DEFAULT NULL,
  `shipping_invoiced` decimal(12,4) DEFAULT NULL,
  `shipping_refunded` decimal(12,4) DEFAULT NULL,
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL,
  `store_to_base_rate` decimal(12,4) DEFAULT NULL,
  `store_to_order_rate` decimal(12,4) DEFAULT NULL,
  `subtotal` decimal(12,4) DEFAULT NULL,
  `subtotal_canceled` decimal(12,4) DEFAULT NULL,
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL,
  `subtotal_refunded` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `tax_canceled` decimal(12,4) DEFAULT NULL,
  `tax_invoiced` decimal(12,4) DEFAULT NULL,
  `tax_refunded` decimal(12,4) DEFAULT NULL,
  `total_canceled` decimal(12,4) DEFAULT NULL,
  `total_invoiced` decimal(12,4) DEFAULT NULL,
  `total_offline_refunded` decimal(12,4) DEFAULT NULL,
  `total_online_refunded` decimal(12,4) DEFAULT NULL,
  `total_paid` decimal(12,4) DEFAULT NULL,
  `total_qty_ordered` decimal(12,4) DEFAULT NULL,
  `total_refunded` decimal(12,4) DEFAULT NULL,
  `can_ship_partially` tinyint(1) unsigned DEFAULT NULL,
  `can_ship_partially_item` tinyint(1) unsigned DEFAULT NULL,
  `customer_is_guest` tinyint(1) unsigned DEFAULT NULL,
  `customer_note_notify` tinyint(1) unsigned DEFAULT NULL,
  `billing_address_id` int(10) DEFAULT NULL,
  `customer_group_id` smallint(5) DEFAULT NULL,
  `edit_increment` int(10) DEFAULT NULL,
  `email_sent` tinyint(1) unsigned DEFAULT NULL,
  `forced_do_shipment_with_invoice` tinyint(1) unsigned DEFAULT NULL,
  `gift_message_id` int(10) DEFAULT NULL,
  `payment_authorization_expiration` int(10) DEFAULT NULL,
  `paypal_ipn_customer_notified` int(10) DEFAULT NULL,
  `quote_address_id` int(10) DEFAULT NULL,
  `quote_id` int(10) DEFAULT NULL,
  `shipping_address_id` int(10) DEFAULT NULL,
  `adjustment_negative` decimal(12,4) DEFAULT NULL,
  `adjustment_positive` decimal(12,4) DEFAULT NULL,
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL,
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL,
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_total_due` decimal(12,4) DEFAULT NULL,
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL,
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL,
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `total_due` decimal(12,4) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `customer_dob` datetime DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `applied_rule_ids` varchar(255) DEFAULT NULL,
  `base_currency_code` char(3) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_firstname` varchar(255) DEFAULT NULL,
  `customer_lastname` varchar(255) DEFAULT NULL,
  `customer_middlename` varchar(255) DEFAULT NULL,
  `customer_prefix` varchar(255) DEFAULT NULL,
  `customer_suffix` varchar(255) DEFAULT NULL,
  `customer_taxvat` varchar(255) DEFAULT NULL,
  `discount_description` varchar(255) DEFAULT NULL,
  `ext_customer_id` varchar(255) DEFAULT NULL,
  `ext_order_id` varchar(255) DEFAULT NULL,
  `global_currency_code` char(3) DEFAULT NULL,
  `hold_before_state` varchar(255) DEFAULT NULL,
  `hold_before_status` varchar(255) DEFAULT NULL,
  `order_currency_code` varchar(255) DEFAULT NULL,
  `original_increment_id` varchar(50) DEFAULT NULL,
  `relation_child_id` varchar(32) DEFAULT NULL,
  `relation_child_real_id` varchar(32) DEFAULT NULL,
  `relation_parent_id` varchar(32) DEFAULT NULL,
  `relation_parent_real_id` varchar(32) DEFAULT NULL,
  `remote_ip` varchar(255) DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `store_currency_code` char(3) DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `x_forwarded_for` varchar(255) DEFAULT NULL,
  `customer_note` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `total_item_count` smallint(5) unsigned DEFAULT '0',
  `customer_gender` int(11) DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL,
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL,
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STATUS` (`status`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_EXT_ORDER_ID` (`ext_order_id`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order`
--

LOCK TABLES `sales_flat_order` WRITE;
/*!40000 ALTER TABLE `sales_flat_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_address`
--

DROP TABLE IF EXISTS `sales_flat_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `customer_address_id` int(10) DEFAULT NULL,
  `quote_address_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `country_id` char(2) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_ADDRESS_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_address`
--

LOCK TABLES `sales_flat_order_address` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_grid`
--

DROP TABLE IF EXISTS `sales_flat_order_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_grid` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(32) DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT NULL,
  `base_total_paid` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `total_paid` decimal(12,4) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `base_currency_code` char(3) DEFAULT NULL,
  `order_currency_code` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STATUS` (`status`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_TOTAL_PAID` (`total_paid`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SHIPPING_NAME` (`shipping_name`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_grid`
--

LOCK TABLES `sales_flat_order_grid` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_item`
--

DROP TABLE IF EXISTS `sales_flat_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_item_id` int(10) unsigned DEFAULT NULL,
  `quote_item_id` int(10) unsigned DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `product_options` text,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `is_virtual` tinyint(1) unsigned DEFAULT NULL,
  `sku` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_qty_decimal` tinyint(1) unsigned DEFAULT NULL,
  `no_discount` tinyint(1) unsigned DEFAULT '0',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000',
  `base_cost` decimal(12,4) DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `original_price` decimal(12,4) DEFAULT NULL,
  `base_original_price` decimal(12,4) DEFAULT NULL,
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `row_weight` decimal(12,4) DEFAULT '0.0000',
  `gift_message_id` int(10) DEFAULT NULL,
  `gift_message_available` int(10) DEFAULT NULL,
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL,
  `tax_before_discount` decimal(12,4) DEFAULT NULL,
  `ext_order_item_id` varchar(255) DEFAULT NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `locked_do_invoice` tinyint(1) unsigned DEFAULT NULL,
  `locked_do_ship` tinyint(1) unsigned DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL,
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL,
  `is_nominal` int(11) NOT NULL DEFAULT '0',
  `tax_canceled` decimal(12,4) DEFAULT NULL,
  `hidden_tax_canceled` decimal(12,4) DEFAULT NULL,
  `tax_refunded` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `IDX_ORDER` (`order_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_ITEM_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_item`
--

LOCK TABLES `sales_flat_order_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_payment`
--

DROP TABLE IF EXISTS `sales_flat_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `base_shipping_captured` decimal(12,4) DEFAULT NULL,
  `shipping_captured` decimal(12,4) DEFAULT NULL,
  `amount_refunded` decimal(12,4) DEFAULT NULL,
  `base_amount_paid` decimal(12,4) DEFAULT NULL,
  `amount_canceled` decimal(12,4) DEFAULT NULL,
  `base_amount_authorized` decimal(12,4) DEFAULT NULL,
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL,
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL,
  `base_shipping_amount` decimal(12,4) DEFAULT NULL,
  `shipping_amount` decimal(12,4) DEFAULT NULL,
  `amount_paid` decimal(12,4) DEFAULT NULL,
  `amount_authorized` decimal(12,4) DEFAULT NULL,
  `base_amount_ordered` decimal(12,4) DEFAULT NULL,
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL,
  `shipping_refunded` decimal(12,4) DEFAULT NULL,
  `base_amount_refunded` decimal(12,4) DEFAULT NULL,
  `amount_ordered` decimal(12,4) DEFAULT NULL,
  `base_amount_canceled` decimal(12,4) DEFAULT NULL,
  `ideal_transaction_checked` tinyint(1) unsigned DEFAULT NULL,
  `quote_payment_id` int(10) DEFAULT NULL,
  `additional_data` text,
  `cc_exp_month` varchar(255) DEFAULT NULL,
  `cc_ss_start_year` varchar(255) DEFAULT NULL,
  `echeck_bank_name` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `cc_debug_request_body` varchar(255) DEFAULT NULL,
  `cc_secure_verify` varchar(255) DEFAULT NULL,
  `cybersource_token` varchar(255) DEFAULT NULL,
  `ideal_issuer_title` varchar(255) DEFAULT NULL,
  `protection_eligibility` varchar(255) DEFAULT NULL,
  `cc_approval` varchar(255) DEFAULT NULL,
  `cc_last4` varchar(255) DEFAULT NULL,
  `cc_status_description` varchar(255) DEFAULT NULL,
  `echeck_type` varchar(255) DEFAULT NULL,
  `paybox_question_number` varchar(255) DEFAULT NULL,
  `cc_debug_response_serialized` varchar(255) DEFAULT NULL,
  `cc_ss_start_month` varchar(255) DEFAULT NULL,
  `echeck_account_type` varchar(255) DEFAULT NULL,
  `last_trans_id` varchar(255) DEFAULT NULL,
  `cc_cid_status` varchar(255) DEFAULT NULL,
  `cc_owner` varchar(255) DEFAULT NULL,
  `cc_type` varchar(255) DEFAULT NULL,
  `ideal_issuer_id` varchar(255) DEFAULT NULL,
  `po_number` varchar(255) DEFAULT NULL,
  `cc_exp_year` varchar(255) DEFAULT NULL,
  `cc_status` varchar(255) DEFAULT NULL,
  `echeck_routing_number` varchar(255) DEFAULT NULL,
  `account_status` varchar(255) DEFAULT NULL,
  `anet_trans_method` varchar(255) DEFAULT NULL,
  `cc_debug_response_body` varchar(255) DEFAULT NULL,
  `cc_ss_issue` varchar(255) DEFAULT NULL,
  `echeck_account_name` varchar(255) DEFAULT NULL,
  `cc_avs_status` varchar(255) DEFAULT NULL,
  `cc_number_enc` varchar(255) DEFAULT NULL,
  `cc_trans_id` varchar(255) DEFAULT NULL,
  `flo2cash_account_id` varchar(255) DEFAULT NULL,
  `paybox_request_number` varchar(255) DEFAULT NULL,
  `address_status` varchar(255) DEFAULT NULL,
  `additional_information` text,
  `pagseguro_transaction_id` varchar(255) DEFAULT NULL,
  `pagseguro_payment_method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_PAYMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_payment`
--

LOCK TABLES `sales_flat_order_payment` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_status_history`
--

DROP TABLE IF EXISTS `sales_flat_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` int(10) DEFAULT NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `status` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_STATUS_HISTORY_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_status_history`
--

LOCK TABLES `sales_flat_order_status_history` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote`
--

DROP TABLE IF EXISTS `sales_flat_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `converted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned DEFAULT '1',
  `is_virtual` tinyint(1) unsigned DEFAULT '0',
  `is_multi_shipping` tinyint(1) unsigned DEFAULT '0',
  `items_count` int(10) unsigned DEFAULT '0',
  `items_qty` decimal(12,4) DEFAULT '0.0000',
  `orig_order_id` int(10) unsigned DEFAULT '0',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000',
  `base_currency_code` varchar(255) DEFAULT NULL,
  `store_currency_code` varchar(255) DEFAULT NULL,
  `quote_currency_code` varchar(255) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `checkout_method` varchar(255) DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT '0',
  `customer_tax_class_id` int(10) unsigned DEFAULT '0',
  `customer_group_id` int(10) unsigned DEFAULT '0',
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_prefix` varchar(40) DEFAULT NULL,
  `customer_firstname` varchar(255) DEFAULT NULL,
  `customer_middlename` varchar(40) DEFAULT NULL,
  `customer_lastname` varchar(255) DEFAULT NULL,
  `customer_suffix` varchar(40) DEFAULT NULL,
  `customer_dob` datetime DEFAULT NULL,
  `customer_note` varchar(255) DEFAULT NULL,
  `customer_note_notify` tinyint(1) unsigned DEFAULT '1',
  `customer_is_guest` tinyint(1) unsigned DEFAULT '0',
  `remote_ip` varchar(32) DEFAULT NULL,
  `applied_rule_ids` varchar(255) DEFAULT NULL,
  `reserved_order_id` varchar(64) DEFAULT '',
  `password_hash` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `global_currency_code` varchar(255) DEFAULT NULL,
  `base_to_global_rate` decimal(12,4) DEFAULT NULL,
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL,
  `customer_taxvat` varchar(255) DEFAULT NULL,
  `customer_gender` varchar(255) DEFAULT NULL,
  `subtotal` decimal(12,4) DEFAULT NULL,
  `base_subtotal` decimal(12,4) DEFAULT NULL,
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL,
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL,
  `is_changed` int(10) unsigned DEFAULT NULL,
  `trigger_recollect` tinyint(1) NOT NULL DEFAULT '0',
  `ext_shipping_info` text,
  `gift_message_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CUSTOMER` (`customer_id`,`store_id`,`is_active`),
  KEY `FK_SALES_QUOTE_STORE` (`store_id`),
  KEY `IDX_IS_ACTIVE` (`is_active`),
  CONSTRAINT `FK_SALES_QUOTE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote`
--

LOCK TABLES `sales_flat_quote` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_address`
--

DROP TABLE IF EXISTS `sales_flat_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `save_in_address_book` tinyint(1) DEFAULT '0',
  `customer_address_id` int(10) unsigned DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `prefix` varchar(40) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `country_id` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `same_as_billing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `collect_shipping_rates` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_method` varchar(255) NOT NULL DEFAULT '',
  `shipping_description` varchar(255) NOT NULL DEFAULT '',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `customer_notes` text,
  `applied_taxes` text,
  `discount_description` varchar(255) DEFAULT NULL,
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL,
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `gift_message_id` int(10) unsigned DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` (`quote_id`),
  CONSTRAINT `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_address`
--

LOCK TABLES `sales_flat_quote_address` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_address_item`
--

DROP TABLE IF EXISTS `sales_flat_quote_address_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_item_id` int(10) unsigned DEFAULT NULL,
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `applied_rule_ids` text,
  `additional_data` text,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `row_weight` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `super_product_id` int(10) unsigned DEFAULT NULL,
  `parent_product_id` int(10) unsigned DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `free_shipping` int(10) unsigned DEFAULT NULL,
  `is_qty_decimal` int(10) unsigned DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT NULL,
  `no_discount` int(10) unsigned DEFAULT NULL,
  `tax_percent` decimal(12,4) DEFAULT NULL,
  `base_price` decimal(12,4) DEFAULT NULL,
  `base_cost` decimal(12,4) DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `gift_message_id` int(10) unsigned DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`address_item_id`),
  KEY `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` (`quote_address_id`),
  KEY `FK_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT` (`parent_item_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` (`quote_item_id`),
  CONSTRAINT `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` FOREIGN KEY (`quote_address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` FOREIGN KEY (`quote_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_address_item`
--

LOCK TABLES `sales_flat_quote_address_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_address_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_address_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_item`
--

DROP TABLE IF EXISTS `sales_flat_quote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_id` int(10) unsigned DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `parent_item_id` int(10) unsigned DEFAULT NULL,
  `is_virtual` tinyint(1) unsigned DEFAULT NULL,
  `sku` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_qty_decimal` tinyint(1) unsigned DEFAULT NULL,
  `no_discount` tinyint(1) unsigned DEFAULT '0',
  `weight` decimal(12,4) DEFAULT '0.0000',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `custom_price` decimal(12,4) DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000',
  `row_weight` decimal(12,4) DEFAULT '0.0000',
  `product_type` varchar(255) DEFAULT NULL,
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL,
  `tax_before_discount` decimal(12,4) DEFAULT NULL,
  `original_custom_price` decimal(12,4) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `base_cost` decimal(12,4) DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `gift_message_id` int(10) unsigned DEFAULT NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` (`parent_item_id`),
  KEY `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` (`product_id`),
  KEY `FK_SALES_QUOTE_ITEM_SALES_QUOTE` (`quote_id`),
  KEY `FK_SALES_QUOTE_ITEM_STORE` (`store_id`),
  CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ITEM_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_item`
--

LOCK TABLES `sales_flat_quote_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_item_option`
--

DROP TABLE IF EXISTS `sales_flat_quote_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`option_id`),
  KEY `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional options for quote item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_item_option`
--

LOCK TABLES `sales_flat_quote_item_option` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_payment`
--

DROP TABLE IF EXISTS `sales_flat_quote_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `method` varchar(255) DEFAULT '',
  `cc_type` varchar(255) DEFAULT '',
  `cc_number_enc` varchar(255) DEFAULT '',
  `cc_last4` varchar(255) DEFAULT '',
  `cc_cid_enc` varchar(255) DEFAULT '',
  `cc_owner` varchar(255) DEFAULT '',
  `cc_exp_month` tinyint(2) unsigned DEFAULT '0',
  `cc_exp_year` smallint(4) unsigned DEFAULT '0',
  `cc_ss_owner` varchar(255) DEFAULT '',
  `cc_ss_start_month` tinyint(2) unsigned DEFAULT '0',
  `cc_ss_start_year` smallint(4) unsigned DEFAULT '0',
  `cybersource_token` varchar(255) DEFAULT '',
  `paypal_correlation_id` varchar(255) DEFAULT '',
  `paypal_payer_id` varchar(255) DEFAULT '',
  `paypal_payer_status` varchar(255) DEFAULT '',
  `po_number` varchar(255) DEFAULT '',
  `additional_data` text,
  `cc_ss_issue` varchar(255) DEFAULT NULL,
  `additional_information` text,
  `ideal_issuer_id` varchar(255) DEFAULT NULL,
  `ideal_issuer_list` text,
  PRIMARY KEY (`payment_id`),
  KEY `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` (`quote_id`),
  CONSTRAINT `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_payment`
--

LOCK TABLES `sales_flat_quote_payment` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_shipping_rate`
--

DROP TABLE IF EXISTS `sales_flat_quote_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `carrier` varchar(255) DEFAULT NULL,
  `carrier_title` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `method_description` text,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `error_message` text,
  `method_title` text,
  PRIMARY KEY (`rate_id`),
  KEY `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` (`address_id`),
  CONSTRAINT `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` FOREIGN KEY (`address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_shipping_rate`
--

LOCK TABLES `sales_flat_quote_shipping_rate` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_shipping_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment`
--

DROP TABLE IF EXISTS `sales_flat_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `total_weight` decimal(12,4) DEFAULT NULL,
  `total_qty` decimal(12,4) DEFAULT NULL,
  `email_sent` tinyint(1) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `shipping_address_id` int(10) DEFAULT NULL,
  `billing_address_id` int(10) DEFAULT NULL,
  `shipment_status` int(10) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_TOTAL_QTY` (`total_qty`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment`
--

LOCK TABLES `sales_flat_shipment` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment_comment`
--

DROP TABLE IF EXISTS `sales_flat_shipment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` int(10) DEFAULT NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_COMMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment_comment`
--

LOCK TABLES `sales_flat_shipment_comment` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment_grid`
--

DROP TABLE IF EXISTS `sales_flat_shipment_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `total_qty` decimal(12,4) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `shipment_status` int(10) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `order_increment_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `order_created_at` datetime DEFAULT NULL,
  `shipping_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_TOTAL_QTY` (`total_qty`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_SHIPMENT_STATUS` (`shipment_status`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SHIPPING_NAME` (`shipping_name`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment_grid`
--

LOCK TABLES `sales_flat_shipment_grid` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment_item`
--

DROP TABLE IF EXISTS `sales_flat_shipment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `row_total` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `qty` decimal(12,4) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `order_item_id` int(10) DEFAULT NULL,
  `additional_data` text,
  `description` text,
  `name` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_ITEM_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment_item`
--

LOCK TABLES `sales_flat_shipment_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment_track`
--

DROP TABLE IF EXISTS `sales_flat_shipment_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `qty` decimal(12,4) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `number` text,
  `description` text,
  `title` varchar(255) DEFAULT NULL,
  `carrier_code` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_TRACK_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment_track`
--

LOCK TABLES `sales_flat_shipment_track` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoiced_aggregated` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `orders_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced_captured` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced_not_captured` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoiced_aggregated`
--

LOCK TABLES `sales_invoiced_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_invoiced_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoiced_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoiced_aggregated_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `orders_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced_captured` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced_not_captured` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoiced_aggregated_order`
--

LOCK TABLES `sales_invoiced_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_invoiced_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoiced_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `sales_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_aggregated_created` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_ORDER_AGGREGATED_CREATED` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_aggregated_created`
--

LOCK TABLES `sales_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `sales_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_tax`
--

DROP TABLE IF EXISTS `sales_order_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `percent` decimal(12,4) NOT NULL,
  `amount` decimal(12,4) NOT NULL,
  `priority` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `base_amount` decimal(12,4) NOT NULL,
  `process` smallint(6) NOT NULL,
  `base_real_amount` decimal(12,4) NOT NULL,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tax_id`),
  KEY `IDX_ORDER_TAX` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_tax`
--

LOCK TABLES `sales_order_tax` WRITE;
/*!40000 ALTER TABLE `sales_order_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_payment_transaction`
--

DROP TABLE IF EXISTS `sales_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `txn_id` varchar(100) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(100) DEFAULT NULL,
  `txn_type` varchar(15) NOT NULL DEFAULT '',
  `is_closed` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `additional_information` blob,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `UNQ_ORDER_PAYMENT_TXN` (`order_id`,`payment_id`,`txn_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_PAYMENT` FOREIGN KEY (`payment_id`) REFERENCES `sales_flat_order_payment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_payment_transaction`
--

LOCK TABLES `sales_payment_transaction` WRITE;
/*!40000 ALTER TABLE `sales_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_recurring_profile`
--

DROP TABLE IF EXISTS `sales_recurring_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_recurring_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(20) NOT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `method_code` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reference_id` varchar(32) DEFAULT NULL,
  `subscriber_name` varchar(150) DEFAULT NULL,
  `start_datetime` datetime NOT NULL,
  `internal_reference_id` varchar(42) NOT NULL,
  `schedule_description` varchar(255) NOT NULL,
  `suspension_threshold` smallint(6) unsigned DEFAULT NULL,
  `bill_failed_later` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `period_unit` varchar(20) NOT NULL,
  `period_frequency` tinyint(3) unsigned DEFAULT NULL,
  `period_max_cycles` tinyint(3) unsigned DEFAULT NULL,
  `billing_amount` double(12,4) unsigned NOT NULL DEFAULT '0.0000',
  `trial_period_unit` varchar(20) DEFAULT NULL,
  `trial_period_frequency` tinyint(3) unsigned DEFAULT NULL,
  `trial_period_max_cycles` tinyint(3) unsigned DEFAULT NULL,
  `trial_billing_amount` double(12,4) unsigned DEFAULT NULL,
  `currency_code` char(3) NOT NULL,
  `shipping_amount` decimal(12,4) unsigned DEFAULT NULL,
  `tax_amount` decimal(12,4) unsigned DEFAULT NULL,
  `init_amount` decimal(12,4) unsigned DEFAULT NULL,
  `init_may_fail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order_info` text NOT NULL,
  `order_item_info` text NOT NULL,
  `billing_address_info` text NOT NULL,
  `shipping_address_info` text,
  `profile_vendor_info` text,
  `additional_info` text,
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `UNQ_INTERNAL_REF_ID` (`internal_reference_id`),
  KEY `IDX_RECURRING_PROFILE_CUSTOMER` (`customer_id`),
  KEY `IDX_RECURRING_PROFILE_STORE` (`store_id`),
  CONSTRAINT `FK_RECURRING_PROFILE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_RECURRING_PROFILE_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_recurring_profile`
--

LOCK TABLES `sales_recurring_profile` WRITE;
/*!40000 ALTER TABLE `sales_recurring_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_recurring_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_recurring_profile_order`
--

DROP TABLE IF EXISTS `sales_recurring_profile_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_recurring_profile_order` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_PROFILE_ORDER` (`profile_id`,`order_id`),
  KEY `IDX_ORDER` (`order_id`),
  CONSTRAINT `FK_RECURRING_PROFILE_ORDER_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RECURRING_PROFILE_ORDER_PROFILE` FOREIGN KEY (`profile_id`) REFERENCES `sales_recurring_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_recurring_profile_order`
--

LOCK TABLES `sales_recurring_profile_order` WRITE;
/*!40000 ALTER TABLE `sales_recurring_profile_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_recurring_profile_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_refunded_aggregated` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `online_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `offline_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_refunded_aggregated`
--

LOCK TABLES `sales_refunded_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_refunded_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_refunded_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_refunded_aggregated_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `online_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `offline_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_refunded_aggregated_order`
--

LOCK TABLES `sales_refunded_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_refunded_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_refunded_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipping_aggregated` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `shipping_description` varchar(255) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `total_shipping` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_shipping_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipping_aggregated`
--

LOCK TABLES `sales_shipping_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_shipping_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipping_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipping_aggregated_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `shipping_description` varchar(255) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `total_shipping` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_shipping_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipping_aggregated_order`
--

LOCK TABLES `sales_shipping_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_shipping_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipping_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule`
--

DROP TABLE IF EXISTS `salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `from_date` date DEFAULT '0000-00-00',
  `to_date` date DEFAULT '0000-00-00',
  `uses_per_customer` int(11) NOT NULL DEFAULT '0',
  `customer_group_ids` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `conditions_serialized` mediumtext NOT NULL,
  `actions_serialized` mediumtext NOT NULL,
  `stop_rules_processing` tinyint(1) NOT NULL DEFAULT '1',
  `is_advanced` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `product_ids` text,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `simple_action` varchar(32) NOT NULL DEFAULT '',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_qty` decimal(12,4) unsigned DEFAULT NULL,
  `discount_step` int(10) unsigned NOT NULL,
  `simple_free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `apply_to_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `times_used` int(11) unsigned NOT NULL DEFAULT '0',
  `is_rss` tinyint(4) NOT NULL DEFAULT '0',
  `website_ids` text,
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`rule_id`),
  KEY `sort_order` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule`
--

LOCK TABLES `salesrule` WRITE;
/*!40000 ALTER TABLE `salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon`
--

DROP TABLE IF EXISTS `salesrule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `usage_limit` int(10) unsigned DEFAULT NULL,
  `usage_per_customer` int(10) unsigned DEFAULT NULL,
  `times_used` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration_date` datetime DEFAULT NULL,
  `is_primary` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `UNQ_COUPON_CODE` (`code`),
  UNIQUE KEY `UNQ_RULE_MAIN_COUPON` (`rule_id`,`is_primary`),
  KEY `FK_SALESRULE_COUPON_RULE_ID_SALESRULE` (`rule_id`),
  CONSTRAINT `FK_SALESRULE_COUPON_RULE_ID_SALESRULE` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon`
--

LOCK TABLES `salesrule_coupon` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `salesrule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `times_used` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `FK_SALESRULE_COUPON_CUSTOMER_COUPON_ID_CUSTOMER_ENTITY` (`coupon_id`),
  KEY `FK_SALESRULE_COUPON_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY` (`customer_id`),
  CONSTRAINT `FK_SALESRULE_CPN_CUST_CUST_ID_CUST_ENTITY` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALESRULE_CPN_CUST_CPN_ID_CUST_ENTITY` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon_usage`
--

LOCK TABLES `salesrule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_customer`
--

DROP TABLE IF EXISTS `salesrule_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `times_used` smallint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_customer_id`),
  KEY `rule_id` (`rule_id`,`customer_id`),
  KEY `customer_id` (`customer_id`,`rule_id`),
  CONSTRAINT `FK_salesrule_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_salesrule_customer_rule` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_customer`
--

LOCK TABLES `salesrule_customer` WRITE;
/*!40000 ALTER TABLE `salesrule_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_label`
--

DROP TABLE IF EXISTS `salesrule_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `IDX_RULE_STORE` (`rule_id`,`store_id`),
  KEY `FK_SALESRULE_LABEL_STORE` (`store_id`),
  KEY `FK_SALESRULE_LABEL_RULE` (`rule_id`),
  CONSTRAINT `FK_SALESRULE_LABEL_RULE` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALESRULE_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_label`
--

LOCK TABLES `salesrule_label` WRITE;
/*!40000 ALTER TABLE `salesrule_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_product_attribute`
--

DROP TABLE IF EXISTS `salesrule_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_RULE` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_product_attribute`
--

LOCK TABLES `salesrule_product_attribute` WRITE;
/*!40000 ALTER TABLE `salesrule_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendfriend_log`
--

DROP TABLE IF EXISTS `sendfriend_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` bigint(20) NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL,
  `website_id` smallint(5) NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `IDX_REMOTE_ADDR` (`ip`),
  KEY `IDX_LOG_TIME` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendfriend_log`
--

LOCK TABLES `sendfriend_log` WRITE;
/*!40000 ALTER TABLE `sendfriend_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendfriend_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_matrixrate`
--

DROP TABLE IF EXISTS `shipping_matrixrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_matrixrate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL DEFAULT '0',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0',
  `dest_region_id` int(10) NOT NULL DEFAULT '0',
  `dest_city` varchar(30) NOT NULL DEFAULT '',
  `dest_zip` varchar(10) NOT NULL DEFAULT '',
  `dest_zip_to` varchar(10) NOT NULL DEFAULT '',
  `condition_name` varchar(20) NOT NULL DEFAULT '',
  `condition_from_value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `condition_to_value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `delivery_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `dest_country` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_city`,`dest_zip`,`dest_zip_to`,`condition_name`,`condition_from_value`,`condition_to_value`,`delivery_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_matrixrate`
--

LOCK TABLES `shipping_matrixrate` WRITE;
/*!40000 ALTER TABLE `shipping_matrixrate` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_matrixrate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_tablerate`
--

DROP TABLE IF EXISTS `shipping_tablerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL DEFAULT '0',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0',
  `dest_region_id` int(10) NOT NULL DEFAULT '0',
  `dest_zip` varchar(10) NOT NULL DEFAULT '',
  `condition_name` varchar(20) NOT NULL DEFAULT '',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `dest_country` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_tablerate`
--

LOCK TABLES `shipping_tablerate` WRITE;
/*!40000 ALTER TABLE `shipping_tablerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_tablerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemap`
--

DROP TABLE IF EXISTS `sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemap` (
  `sitemap_id` int(11) NOT NULL AUTO_INCREMENT,
  `sitemap_type` varchar(32) DEFAULT NULL,
  `sitemap_filename` varchar(32) DEFAULT NULL,
  `sitemap_path` tinytext,
  `sitemap_time` timestamp NULL DEFAULT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`sitemap_id`),
  KEY `FK_SITEMAP_STORE` (`store_id`),
  CONSTRAINT `FK_SITEMAP_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemap`
--

LOCK TABLES `sitemap` WRITE;
/*!40000 ALTER TABLE `sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `first_customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `first_store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_properties`
--

DROP TABLE IF EXISTS `tag_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_properties` (
  `tag_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `base_popularity` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_id`,`store_id`),
  KEY `FK_TAG_PROPERTIES_STORE` (`store_id`),
  CONSTRAINT `FK_TAG_PROPERTIES_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_PROPERTIES_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_properties`
--

LOCK TABLES `tag_properties` WRITE;
/*!40000 ALTER TABLE `tag_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_relation`
--

DROP TABLE IF EXISTS `tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_relation` (
  `tag_relation_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) unsigned NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(6) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`tag_relation_id`),
  UNIQUE KEY `UNQ_TAG_CUSTOMER_PRODUCT_STORE` (`tag_id`,`customer_id`,`product_id`,`store_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_TAG` (`tag_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_TAG_RELATION_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_RELATION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_RELATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_RELATION_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_relation`
--

LOCK TABLES `tag_relation` WRITE;
/*!40000 ALTER TABLE `tag_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_summary`
--

DROP TABLE IF EXISTS `tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_summary` (
  `tag_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `customers` int(11) unsigned NOT NULL DEFAULT '0',
  `products` int(11) unsigned NOT NULL DEFAULT '0',
  `uses` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'deprecated since 1.4.0.1',
  `historical_uses` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'deprecated since 1.4.0.1',
  `popularity` int(11) unsigned NOT NULL DEFAULT '0',
  `base_popularity` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'deprecated since 1.4.0.1',
  PRIMARY KEY (`tag_id`,`store_id`),
  KEY `FK_TAG_SUMMARY_STORE` (`store_id`),
  KEY `IDX_TAG` (`tag_id`),
  CONSTRAINT `FK_TAG_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_SUMMARY_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_summary`
--

LOCK TABLES `tag_summary` WRITE;
/*!40000 ALTER TABLE `tag_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation`
--

DROP TABLE IF EXISTS `tax_calculation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation` (
  `tax_calculation_rate_id` int(11) NOT NULL,
  `tax_calculation_rule_id` int(11) NOT NULL,
  `customer_tax_class_id` smallint(6) NOT NULL,
  `product_tax_class_id` smallint(6) NOT NULL,
  KEY `FK_TAX_CALCULATION_RULE` (`tax_calculation_rule_id`),
  KEY `FK_TAX_CALCULATION_RATE` (`tax_calculation_rate_id`),
  KEY `FK_TAX_CALCULATION_CTC` (`customer_tax_class_id`),
  KEY `FK_TAX_CALCULATION_PTC` (`product_tax_class_id`),
  KEY `IDX_TAX_CALCULATION` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `FK_TAX_CALCULATION_PTC` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_CTC` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RATE` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RULE` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation`
--

LOCK TABLES `tax_calculation` WRITE;
/*!40000 ALTER TABLE `tax_calculation` DISABLE KEYS */;
INSERT INTO `tax_calculation` VALUES (1,1,3,2),(2,1,3,2);
/*!40000 ALTER TABLE `tax_calculation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rate`
--

DROP TABLE IF EXISTS `tax_calculation_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_country_id` char(2) NOT NULL,
  `tax_region_id` mediumint(9) NOT NULL,
  `tax_postcode` varchar(21) NOT NULL,
  `code` varchar(255) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `zip_is_range` tinyint(1) DEFAULT NULL,
  `zip_from` int(11) unsigned DEFAULT NULL,
  `zip_to` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALCULATION_RATE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `IDX_TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_TAX_CALCULATION_RATE_RANGE` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rate`
--

LOCK TABLES `tax_calculation_rate` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate` DISABLE KEYS */;
INSERT INTO `tax_calculation_rate` VALUES (1,'US',12,'*','US-CA-*-Rate 1','8.2500',NULL,NULL,NULL),(2,'US',43,'*','US-NY-*-Rate 1','8.3750',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tax_calculation_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `tax_calculation_rate_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_calculation_rate_id` int(11) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE` (`tax_calculation_rate_id`,`store_id`),
  KEY `FK_TAX_CALCULATION_RATE_TITLE_RATE` (`tax_calculation_rate_id`),
  KEY `FK_TAX_CALCULATION_RATE_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_RATE` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rate_title`
--

LOCK TABLES `tax_calculation_rate_title` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_calculation_rate_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rule`
--

DROP TABLE IF EXISTS `tax_calculation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `priority` mediumint(9) NOT NULL,
  `position` mediumint(9) NOT NULL,
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE` (`priority`,`position`,`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rule`
--

LOCK TABLES `tax_calculation_rule` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rule` DISABLE KEYS */;
INSERT INTO `tax_calculation_rule` VALUES (1,'Retail Customer-Taxable Goods-Rate 1',1,1);
/*!40000 ALTER TABLE `tax_calculation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL DEFAULT '',
  `class_type` enum('CUSTOMER','PRODUCT') NOT NULL DEFAULT 'CUSTOMER',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (2,'Taxable Goods','PRODUCT'),(3,'Retail Customer','CUSTOMER'),(4,'Shipping','PRODUCT');
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `tax_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_order_aggregated_created` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `code` varchar(255) NOT NULL DEFAULT '',
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `percent` float(12,4) NOT NULL DEFAULT '0.0000',
  `orders_count` int(11) unsigned NOT NULL DEFAULT '0',
  `tax_base_amount_sum` float(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_CODE_ORDER_STATUS` (`period`,`store_id`,`code`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_TAX_ORDER_AGGREGATED_CREATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_order_aggregated_created`
--

LOCK TABLES `tax_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `tax_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uni_banner`
--

DROP TABLE IF EXISTS `uni_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uni_banner` (
  `banner_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `banner_content` text NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `banner_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=>Image, 1=>HTML',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uni_banner`
--

LOCK TABLES `uni_banner` WRITE;
/*!40000 ALTER TABLE `uni_banner` DISABLE KEYS */;
INSERT INTO `uni_banner` VALUES (1,'Banner 1','custom/banners/File-1300256573.jpg','','',1,0,0,'2011-03-16 06:22:53','2011-03-16 06:22:53'),(2,'Banner 2','custom/banners/File-1300256584.jpg','','',1,0,0,'2011-03-16 06:23:04','2011-03-16 06:23:04'),(3,'Banner 3','custom/banners/File-1300256596.jpg','','',1,0,0,'2011-03-16 06:23:16','2011-03-16 06:23:16'),(4,'Banner 4','custom/banners/File-1300256608.jpg','','',1,0,0,'2011-03-16 06:23:28','2011-03-16 06:23:28');
/*!40000 ALTER TABLE `uni_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uni_bannergroup`
--

DROP TABLE IF EXISTS `uni_bannergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uni_bannergroup` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL DEFAULT '',
  `group_code` varchar(255) NOT NULL DEFAULT '',
  `banner_width` smallint(4) NOT NULL DEFAULT '0',
  `banner_height` smallint(4) NOT NULL DEFAULT '0',
  `animation_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=>Pre-defined, 1=> Custom Animation',
  `banner_effects` varchar(255) NOT NULL DEFAULT '',
  `pre_banner_effects` varchar(255) NOT NULL DEFAULT '',
  `banner_ids` varchar(255) NOT NULL DEFAULT '',
  `show_title` tinyint(4) NOT NULL DEFAULT '0',
  `show_content` tinyint(4) NOT NULL DEFAULT '0',
  `link_target` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=>New Window, 1=> Self',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uni_bannergroup`
--

LOCK TABLES `uni_bannergroup` WRITE;
/*!40000 ALTER TABLE `uni_bannergroup` DISABLE KEYS */;
INSERT INTO `uni_bannergroup` VALUES (1,'Home Banner','home_banner',480,400,0,'','Numbered Banner','1,2,3,4',0,0,0,1,'2011-03-16 06:25:57','2011-03-16 06:25:57'),(2,'Left Banner','left_banner',195,200,0,'','Square Transition Banner','2,3,4',0,0,0,1,'2011-03-16 07:11:12','2011-03-16 07:11:12');
/*!40000 ALTER TABLE `uni_bannergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weee_discount`
--

DROP TABLE IF EXISTS `weee_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weee_discount` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_WEBSITE` (`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_GROUP` (`customer_group_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weee_discount`
--

LOCK TABLES `weee_discount` WRITE;
/*!40000 ALTER TABLE `weee_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `weee_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weee_tax`
--

DROP TABLE IF EXISTS `weee_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `country` varchar(2) NOT NULL DEFAULT '',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `state` varchar(255) NOT NULL DEFAULT '*',
  `attribute_id` smallint(5) unsigned NOT NULL,
  `entity_type_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`value_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_WEBSITE` (`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_COUNTRY` (`country`),
  KEY `FK_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_COUNTRY` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WEEE_TAX_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weee_tax`
--

LOCK TABLES `weee_tax` WRITE;
/*!40000 ALTER TABLE `weee_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `weee_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `parameters` text,
  PRIMARY KEY (`widget_id`),
  KEY `IDX_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance`
--

DROP TABLE IF EXISTS `widget_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance` (
  `instance_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `package_theme` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `store_ids` varchar(255) NOT NULL DEFAULT '0',
  `widget_parameters` text,
  `sort_order` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance`
--

LOCK TABLES `widget_instance` WRITE;
/*!40000 ALTER TABLE `widget_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance_page`
--

DROP TABLE IF EXISTS `widget_instance_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance_page` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) unsigned NOT NULL DEFAULT '0',
  `group` varchar(25) NOT NULL DEFAULT '',
  `layout_handle` varchar(255) NOT NULL DEFAULT '',
  `block_reference` varchar(255) NOT NULL DEFAULT '',
  `for` varchar(25) NOT NULL DEFAULT '',
  `entities` text,
  `template` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`page_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_ID` (`instance_id`),
  CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance_page`
--

LOCK TABLES `widget_instance_page` WRITE;
/*!40000 ALTER TABLE `widget_instance_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance_page_layout`
--

DROP TABLE IF EXISTS `widget_instance_page_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance_page_layout` (
  `page_id` int(11) unsigned NOT NULL DEFAULT '0',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `page_id` (`page_id`,`layout_update_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_PAGE_ID` (`page_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_LAYOUT_UPDATE_ID` (`layout_update_id`),
  CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance_page_layout`
--

LOCK TABLES `widget_instance_page_layout` WRITE;
/*!40000 ALTER TABLE `widget_instance_page_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance_page_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shared` tinyint(1) unsigned DEFAULT '0',
  `sharing_code` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `UNQ_CUSTOMER` (`customer_id`),
  KEY `IDX_IS_SHARED` (`shared`),
  CONSTRAINT `FK_WISHLIST_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Wishlist main';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_item`
--

DROP TABLE IF EXISTS `wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `added_at` datetime DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`wishlist_item_id`),
  KEY `IDX_WISHLIST` (`wishlist_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_WISHLIST_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WISHLIST_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_WISHLIST_ITEM_WISHLIST` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_item`
--

LOCK TABLES `wishlist_item` WRITE;
/*!40000 ALTER TABLE `wishlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-06-29 22:59:49
