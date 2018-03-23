CREATE DATABASE  IF NOT EXISTS `exam` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `exam`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: exam
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `tb_admin`
--

DROP TABLE IF EXISTS `tb_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_admin` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` varchar(45) NOT NULL,
  `ad_pw` varchar(45) NOT NULL,
  `ad_name` varchar(45) NOT NULL,
  `ad_sex` varchar(45) NOT NULL,
  `ad_phone` varchar(45) NOT NULL,
  `ad_card` varchar(45) NOT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `ad_id_UNIQUE` (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admin`
--

LOCK TABLES `tb_admin` WRITE;
/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blank`
--

DROP TABLE IF EXISTS `tb_blank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_blank` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `bl_tch_id` int(11) NOT NULL,
  `bl_question` varchar(255) NOT NULL,
  `bl_answer` varchar(255) NOT NULL,
  `bl_analyse` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK_blank_tch_idx` (`bl_tch_id`),
  CONSTRAINT `FK_blank_tch` FOREIGN KEY (`bl_tch_id`) REFERENCES `tb_teacher` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blank`
--

LOCK TABLES `tb_blank` WRITE;
/*!40000 ALTER TABLE `tb_blank` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_blank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_choice`
--

DROP TABLE IF EXISTS `tb_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_choice` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `ch_tch_id` int(11) NOT NULL,
  `ch_question` varchar(255) NOT NULL,
  `ch_a` varchar(255) NOT NULL,
  `ch_b` varchar(255) NOT NULL,
  `ch_c` varchar(255) NOT NULL,
  `ch_d` varchar(255) NOT NULL,
  `ch_answer` varchar(45) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK_choice_tch_idx` (`ch_tch_id`),
  CONSTRAINT `FK_choice_tch` FOREIGN KEY (`ch_tch_id`) REFERENCES `tb_teacher` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_choice`
--

LOCK TABLES `tb_choice` WRITE;
/*!40000 ALTER TABLE `tb_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_course`
--

DROP TABLE IF EXISTS `tb_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_course` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `coz_name` varchar(45) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_course`
--

LOCK TABLES `tb_course` WRITE;
/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_grades`
--

DROP TABLE IF EXISTS `tb_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_grades` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `gr_stp_id` int(11) NOT NULL,
  `gr_grade` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK_gr_stp_idx` (`gr_stp_id`),
  CONSTRAINT `FK_gr_stp` FOREIGN KEY (`gr_stp_id`) REFERENCES `tb_studenttp` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_grades`
--

LOCK TABLES `tb_grades` WRITE;
/*!40000 ALTER TABLE `tb_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_student`
--

DROP TABLE IF EXISTS `tb_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_student` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` varchar(45) NOT NULL,
  `stu_pw` varchar(45) NOT NULL,
  `stu_name` varchar(45) NOT NULL,
  `stu_sex` int(11) NOT NULL,
  `stu_phone` varchar(45) NOT NULL,
  `stu_card` varchar(45) NOT NULL,
  `stu_class` varchar(45) NOT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `stu_id_UNIQUE` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_student`
--

LOCK TABLES `tb_student` WRITE;
/*!40000 ALTER TABLE `tb_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_studenttp`
--

DROP TABLE IF EXISTS `tb_studenttp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_studenttp` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `stp_stu_id` int(11) NOT NULL,
  `stp_tp_id` int(11) NOT NULL,
  `stp_answer` varchar(255) NOT NULL,
  `stp_time` datetime NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK_stp_student_idx` (`stp_stu_id`),
  KEY `FK_stp_testpaper_idx` (`stp_tp_id`),
  CONSTRAINT `FK_stp_student` FOREIGN KEY (`stp_stu_id`) REFERENCES `tb_student` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_stp_testpaper` FOREIGN KEY (`stp_tp_id`) REFERENCES `tb_testpaper` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_studenttp`
--

LOCK TABLES `tb_studenttp` WRITE;
/*!40000 ALTER TABLE `tb_studenttp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_studenttp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_teacher`
--

DROP TABLE IF EXISTS `tb_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_teacher` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `tch_id` varchar(45) NOT NULL,
  `tch_pw` varchar(45) NOT NULL,
  `tch_name` varchar(45) NOT NULL,
  `tch_sex` int(11) NOT NULL,
  `tch_phone` varchar(45) NOT NULL,
  `tch_card` varchar(45) NOT NULL,
  `tch_title` varchar(45) NOT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `tch_id_UNIQUE` (`tch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_teacher`
--

LOCK TABLES `tb_teacher` WRITE;
/*!40000 ALTER TABLE `tb_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_testpaper`
--

DROP TABLE IF EXISTS `tb_testpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_testpaper` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `tp_coz_id` int(11) NOT NULL,
  `tp_time` int(11) NOT NULL DEFAULT '0' COMMENT 'exam time',
  `tp_tg` int(11) NOT NULL DEFAULT '0' COMMENT 'total grade',
  `tb_choice` int(11) NOT NULL DEFAULT '0' COMMENT 'choice num',
  `tb_blank` int(11) NOT NULL DEFAULT '0' COMMENT 'blank num',
  PRIMARY KEY (`uuid`),
  KEY `FK_testpaper_course_idx` (`tp_coz_id`),
  CONSTRAINT `FK_testpaper_course` FOREIGN KEY (`tp_coz_id`) REFERENCES `tb_course` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_testpaper`
--

LOCK TABLES `tb_testpaper` WRITE;
/*!40000 ALTER TABLE `tb_testpaper` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_testpaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tpblank`
--

DROP TABLE IF EXISTS `tb_tpblank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tpblank` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `tbk_tp_id` int(11) NOT NULL,
  `tbk_bl_id` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK_testpaper_idx` (`tbk_tp_id`),
  KEY `FK_blank_idx` (`tbk_bl_id`),
  CONSTRAINT `FK_tbk_blank` FOREIGN KEY (`tbk_bl_id`) REFERENCES `tb_blank` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbk_testpaper` FOREIGN KEY (`tbk_tp_id`) REFERENCES `tb_testpaper` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tpblank`
--

LOCK TABLES `tb_tpblank` WRITE;
/*!40000 ALTER TABLE `tb_tpblank` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tpblank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tpchoice`
--

DROP TABLE IF EXISTS `tb_tpchoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tpchoice` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `tpc_tp_id` int(11) NOT NULL,
  `tpc_ch_id` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK_testpaper_idx` (`tpc_tp_id`),
  KEY `FK_choice_idx` (`tpc_ch_id`),
  CONSTRAINT `FK_tpc_choice` FOREIGN KEY (`tpc_ch_id`) REFERENCES `tb_choice` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tpc_testpaper` FOREIGN KEY (`tpc_tp_id`) REFERENCES `tb_testpaper` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tpchoice`
--

LOCK TABLES `tb_tpchoice` WRITE;
/*!40000 ALTER TABLE `tb_tpchoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tpchoice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-23 17:08:42
