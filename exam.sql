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
  `ad_sex` int(11) NOT NULL,
  `ad_phone` varchar(45) NOT NULL,
  `ad_card` varchar(45) NOT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `ad_id_UNIQUE` (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admin`
--

LOCK TABLES `tb_admin` WRITE;
/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
INSERT INTO `tb_admin` VALUES (2,'000000','123456','super',1,'123123','21312'),(9,'000001','123456','super',1,'1234567890','1234567890'),(11,'00000000','sadasdasd','fdsfsa',1,'12452875875','4542452452452'),(12,'000002','123456','super',1,'111111111','111111111'),(13,'000003','123456','super',1,'1223121321','12132123123');
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
  `bl_coz_id` int(11) NOT NULL,
  `bl_question` varchar(255) NOT NULL,
  `bl_answer` varchar(255) NOT NULL,
  `bl_analyse` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK_blank_tch_idx` (`bl_tch_id`),
  KEY `FK_blank_coz_idx` (`bl_coz_id`),
  CONSTRAINT `FK_blank_coz` FOREIGN KEY (`bl_coz_id`) REFERENCES `tb_course` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_blank_tch` FOREIGN KEY (`bl_tch_id`) REFERENCES `tb_teacher` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blank`
--

LOCK TABLES `tb_blank` WRITE;
/*!40000 ALTER TABLE `tb_blank` DISABLE KEYS */;
INSERT INTO `tb_blank` VALUES (3,1,1,'常用的虚拟存储器由______两级存储器组成。','主存-辅存 ','虚拟存储器提为了给用户供更大的随机存取空间而采用的一种存储技术。它将内存与外存结合使用，好像有一个容量极大的内存储器，工作速度接近于主存，每位成本又与辅存相近，在整机形成多层次存储系统。所以虚拟存储器有主存和辅存两级存储器组成。'),(4,1,1,'中断向量可提供______','中断服务程序的入口地址','计算机发生中断时各个寄存器和程序计数器所指向的内容，或者其中所存的内容．在发生中断时，可以将这些向量暂时的存储在另一个地方，而当执行完别的程序时，可以从暂存的地方将中断向量取出放入原来的位置，从而可以执行原来中断的程序，即中断向量可描述中断服务程序的入口地址。');
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
  `ch_coz_id` int(11) NOT NULL,
  `ch_question` varchar(255) NOT NULL,
  `ch_a` varchar(255) NOT NULL,
  `ch_b` varchar(255) NOT NULL,
  `ch_c` varchar(255) NOT NULL,
  `ch_d` varchar(255) NOT NULL,
  `ch_answer` varchar(255) NOT NULL,
  `ch_analyse` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK_choice_tch_idx` (`ch_tch_id`),
  KEY `FK_choice_coz_idx` (`ch_coz_id`),
  CONSTRAINT `FK_choice_coz` FOREIGN KEY (`ch_coz_id`) REFERENCES `tb_course` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_choice_tch` FOREIGN KEY (`ch_tch_id`) REFERENCES `tb_teacher` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_choice`
--

LOCK TABLES `tb_choice` WRITE;
/*!40000 ALTER TABLE `tb_choice` DISABLE KEYS */;
INSERT INTO `tb_choice` VALUES (1,1,1,'常用的虚拟存储器由_____两级存储器组成。','主存-辅存','主存-网盘 ','Cache-主存','Cache-硬盘','A','虚拟存储器提为了给用户供更大的随机存取空间而采用的一种存储技术。它将内存与外存结合使用，好像有一个容量极大的内存储器，工作速度接近于主存，每位成本又与辅存相近，在整机形成多层次存储系统。所以虚拟存储器有主存和辅存两级存储器组成。'),(2,2,1,'中断向量可提供______。','I/O设备的端口地址','所传送数据的起始地址','中断服务程序的入口地址','主程序的断电地址','C','计算机发生中断时各个寄存器和程序计数器所指向的内容，或者其中所存的内容．在发生中断时，可以将这些向量暂时的存储在另一个地方，而当执行完别的程序时，可以从暂存的地方将中断向量取出放入原来的位置，从而可以执行原来中断的程序，即中断向量可描述中断服务程序的入口地址。'),(3,1,1,'为了便于实现多级中断嵌套，使用______来保护断电和现场最有效。','ROM','中断向量表','通用寄存器','堆栈','D','多重中断时，每次中断出现的断点都必须保存起来。中断系统对断点的保存都是在中断周期内由中断隐指令实现的，对用户是透明的。断点可以保存在堆栈中，由于堆栈先进后出的特点，依次将程序的断点压入堆栈中。出栈时，按相反顺序便可准确返回到程序间断处。');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_course`
--

LOCK TABLES `tb_course` WRITE;
/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
INSERT INTO `tb_course` VALUES (1,'A'),(3,'C'),(4,'D'),(5,'E'),(6,'testDelete');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_grades`
--

LOCK TABLES `tb_grades` WRITE;
/*!40000 ALTER TABLE `tb_grades` DISABLE KEYS */;
INSERT INTO `tb_grades` VALUES (1,1,50),(2,2,80),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_student`
--

LOCK TABLES `tb_student` WRITE;
/*!40000 ALTER TABLE `tb_student` DISABLE KEYS */;
INSERT INTO `tb_student` VALUES (1,'00000000','123456','Test',1,'12312231123','123456789123456789','班级名称'),(2,'00000001','123456','super',0,'123121321','123123123123123123','class 2');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_studenttp`
--

LOCK TABLES `tb_studenttp` WRITE;
/*!40000 ALTER TABLE `tb_studenttp` DISABLE KEYS */;
INSERT INTO `tb_studenttp` VALUES (1,1,1,'123121213','2018-03-25 14:55:00'),(2,1,1,'123121213','2018-03-26 14:55:00'),(4,1,1,'123121213','2018-03-27 14:55:00'),(5,1,2,'123121213','2018-03-28 14:59:00'),(6,1,2,'123121213','2018-03-31 15:01:00'),(7,1,1,'123121213','2018-03-31 15:02:00'),(8,1,2,'123121213','2018-03-31 15:10:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_teacher`
--

LOCK TABLES `tb_teacher` WRITE;
/*!40000 ALTER TABLE `tb_teacher` DISABLE KEYS */;
INSERT INTO `tb_teacher` VALUES (1,'0000','1234','super',1,'15123344','212132456','教授'),(2,'0001','123456','super',1,'123213213','21321321','教授');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_testpaper`
--

LOCK TABLES `tb_testpaper` WRITE;
/*!40000 ALTER TABLE `tb_testpaper` DISABLE KEYS */;
INSERT INTO `tb_testpaper` VALUES (1,1,120,100,10,10),(2,6,120,100,10,10);
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
  `tpb_tp_id` int(11) NOT NULL,
  `tpb_bl_id` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK_testpaper_idx` (`tpb_tp_id`),
  KEY `FK_blank_idx` (`tpb_bl_id`),
  CONSTRAINT `FK_tbk_blank` FOREIGN KEY (`tpb_bl_id`) REFERENCES `tb_blank` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbk_testpaper` FOREIGN KEY (`tpb_tp_id`) REFERENCES `tb_testpaper` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tpblank`
--

LOCK TABLES `tb_tpblank` WRITE;
/*!40000 ALTER TABLE `tb_tpblank` DISABLE KEYS */;
INSERT INTO `tb_tpblank` VALUES (6,1,3),(7,1,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tpchoice`
--

LOCK TABLES `tb_tpchoice` WRITE;
/*!40000 ALTER TABLE `tb_tpchoice` DISABLE KEYS */;
INSERT INTO `tb_tpchoice` VALUES (5,1,1),(6,1,2),(7,1,3);
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

-- Dump completed on 2018-04-03 15:03:23
