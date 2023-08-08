# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_toc
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    02-08-2023 19:09:01
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_toc'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_toc" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_toc";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(11) NOT NULL auto_increment,
  "admin_name" varchar(50) NOT NULL,
  "admin_email" varchar(50) NOT NULL,
  "admin_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	(1,'ADMIN','admin@gmail.com','admin');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(11) NOT NULL auto_increment,
  "complaint_title" varchar(50) NOT NULL,
  "complaint_content" varchar(300) NOT NULL,
  "complaint_date" varchar(50) NOT NULL,
  "customer_id" int(11) NOT NULL,
  "complaint_status" int(50) NOT NULL default '0',
  "complaint_reply" varchar(300) NOT NULL default 'not replied',
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=12;



#
# Dumping data for table 'tbl_complaint'
#

LOCK TABLES "tbl_complaint" WRITE;
/*!40000 ALTER TABLE "tbl_complaint" DISABLE KEYS;*/
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_title", "complaint_content", "complaint_date", "customer_id", "complaint_status", "complaint_reply") VALUES
	(3,'hello','JHGFDTXYIUOPO','2023-06-05',1,0,'ok
');
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_title", "complaint_content", "complaint_date", "customer_id", "complaint_status", "complaint_reply") VALUES
	(4,'ajp','jkjcsdi','2023-06-05',1,0,'ok
');
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_title", "complaint_content", "complaint_date", "customer_id", "complaint_status", "complaint_reply") VALUES
	(5,'good','jhgfdghjhkj','2023-06-05',1,0,'ok
');
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_title", "complaint_content", "complaint_date", "customer_id", "complaint_status", "complaint_reply") VALUES
	(6,'kjjn','kjbij','2023-06-05',1,0,'ok
');
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_title", "complaint_content", "complaint_date", "customer_id", "complaint_status", "complaint_reply") VALUES
	(7,'fgxgjhk','cvvc','2023-06-05',1,0,'mhc');
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_title", "complaint_content", "complaint_date", "customer_id", "complaint_status", "complaint_reply") VALUES
	(8,'REJECTED','REQUEST REJECTED','2023-06-09',1,0,'WILL RESOLVE');
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_title", "complaint_content", "complaint_date", "customer_id", "complaint_status", "complaint_reply") VALUES
	(9,'fgxjkhcgh','fgjhvhjh','2023-06-20',1,0,'ghkjhjk');
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_title", "complaint_content", "complaint_date", "customer_id", "complaint_status", "complaint_reply") VALUES
	(10,'jfiutdty','ikikki','2023-06-20',1,0,'not replied');
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_title", "complaint_content", "complaint_date", "customer_id", "complaint_status", "complaint_reply") VALUES
	(11,'ufufuf','vifific','2023-07-27',1,0,'not replied');
/*!40000 ALTER TABLE "tbl_complaint" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_customer'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_customer" (
  "customer_id" int(50) NOT NULL auto_increment,
  "customer_name" varchar(50) NOT NULL,
  "customer_contact" varchar(500) NOT NULL,
  "customer_email" varchar(50) NOT NULL,
  "customer_address" varchar(250) NOT NULL,
  "localPlace_id" varchar(50) default NULL,
  "customer_password" varchar(50) NOT NULL,
  "customer_reg_date" varchar(50) NOT NULL,
  PRIMARY KEY  ("customer_id")
) AUTO_INCREMENT=28;



#
# Dumping data for table 'tbl_customer'
#

LOCK TABLES "tbl_customer" WRITE;
/*!40000 ALTER TABLE "tbl_customer" DISABLE KEYS;*/
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(1,'Aleena  Mathew ','9526485516','aleenamathewur@gmail.com','URUMBIL (H) SOUTH MARADY P.O, MUVATTUPUZHA','4','all','2023-05-01');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(2,'Densy Sunny','6738294510','densy@gmail.com','Mappilamattel House
Aavoly P.O
Muvattupuzha','8','densy','2023-05-01');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(3,'Shefy Augustine','6774839261','shefy@gmail.com','Naduthottathil House
Muvattupuzha P.O
Muvattupuzha','8','shefy','2023-05-04');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(4,'Eaby Varghese','8756201462','eby@gmail.com','Rose Villa
Muvattupuzha','5','eby123','2023-05-06');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(5,'Johnson Mathay','7234567891','jm@gmail.com','THOTAKKATTU
Kizhakkekkara','9','2','2023-05-08');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(6,'Mathew Scaria','9885673345','mathew@123.com','Muvattupuzha','1','mathew','2023-05-13');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(9,'Basima','7907370125','basima@gmail.com ','thdpz','4','basima ','2023-07-18');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(19,'Ammu','77777777777','hl@gmail.com','Ernakulam ','1','123A','2023-07-20');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(20,'Akshara VS','7754682103','hlo@gmail.com','Muvattupuzha','8','kollam','2023-07-21');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(21,'Ajaka','63728','analmak','skamn@','4','ajakakna','2023-07-26');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(24,'hwnwjq','ahabs','bbzns','bzns','8','msh','2023-07-26');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(25,'Akshara','8978564320','akshara123@gmail.com','Kakkanatt ','5','123','2023-07-26');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(26,'Mithra Rajesh','9867543290','mithra@gmail.com','Vadekkekudyil','10','mithra123A@','2023-07-30');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "localPlace_id", "customer_password", "customer_reg_date") VALUES
	(27,'Kiran S','7859451234','kiran199@gmail.com','Velliyachaallil','1','Kiran@1999','2023-07-31');
/*!40000 ALTER TABLE "tbl_customer" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "fb_id" int(50) NOT NULL auto_increment,
  "fb_content" varchar(300) NOT NULL,
  "fb_date" varchar(50) NOT NULL,
  "customer_id" int(11) NOT NULL,
  PRIMARY KEY  ("fb_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_feedback'
#

LOCK TABLES "tbl_feedback" WRITE;
/*!40000 ALTER TABLE "tbl_feedback" DISABLE KEYS;*/
REPLACE INTO "tbl_feedback" ("fb_id", "fb_content", "fb_date", "customer_id") VALUES
	(2,'Good Service','2023-06-07',1);
REPLACE INTO "tbl_feedback" ("fb_id", "fb_content", "fb_date", "customer_id") VALUES
	(4,'ghgdfhj','2023-06-05',1);
REPLACE INTO "tbl_feedback" ("fb_id", "fb_content", "fb_date", "customer_id") VALUES
	(5,'ncickvv','2023-07-27',1);
/*!40000 ALTER TABLE "tbl_feedback" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_localplace'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_localplace" (
  "localPlace_id" int(11) NOT NULL auto_increment,
  "localPlace_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("localPlace_id")
) AUTO_INCREMENT=11;



#
# Dumping data for table 'tbl_localplace'
#

LOCK TABLES "tbl_localplace" WRITE;
/*!40000 ALTER TABLE "tbl_localplace" DISABLE KEYS;*/
REPLACE INTO "tbl_localplace" ("localPlace_id", "localPlace_name") VALUES
	(1,'Marady');
REPLACE INTO "tbl_localplace" ("localPlace_id", "localPlace_name") VALUES
	(3,'Pezhakkappilli');
REPLACE INTO "tbl_localplace" ("localPlace_id", "localPlace_name") VALUES
	(4,'Vazhappilli');
REPLACE INTO "tbl_localplace" ("localPlace_id", "localPlace_name") VALUES
	(5,'Kaarakkunnam');
REPLACE INTO "tbl_localplace" ("localPlace_id", "localPlace_name") VALUES
	(8,'Aavoly');
REPLACE INTO "tbl_localplace" ("localPlace_id", "localPlace_name") VALUES
	(9,'Kizhakkekkara');
REPLACE INTO "tbl_localplace" ("localPlace_id", "localPlace_name") VALUES
	(10,'Aanikkad');
/*!40000 ALTER TABLE "tbl_localplace" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_notification'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_notification" (
  "notification_id" int(10) unsigned NOT NULL auto_increment,
  "notification_date" varchar(50) default NULL,
  "notification_title" varchar(50) default NULL,
  "notification_content" varchar(500) default NULL,
  "user_id" int(50) default NULL,
  PRIMARY KEY  ("notification_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_notification'
#

LOCK TABLES "tbl_notification" WRITE;
/*!40000 ALTER TABLE "tbl_notification" DISABLE KEYS;*/
REPLACE INTO "tbl_notification" ("notification_id", "notification_date", "notification_title", "notification_content", "user_id") VALUES
	('1','2023-07-28','Booking Accepted','Your Booking is  accepted by the tradie.Pay the advance and confirm the booking now.',1);
REPLACE INTO "tbl_notification" ("notification_id", "notification_date", "notification_title", "notification_content", "user_id") VALUES
	('2','2023-07-31','Booking Rejected','Your Booking is  rejected by the tradie.Please try for another tradie.',1);
REPLACE INTO "tbl_notification" ("notification_id", "notification_date", "notification_title", "notification_content", "user_id") VALUES
	('3','2023-07-31','Booking Rejected','Your Booking is  rejected by the tradie.Please try for another tradie.',1);
REPLACE INTO "tbl_notification" ("notification_id", "notification_date", "notification_title", "notification_content", "user_id") VALUES
	('4','2023-07-31','Booking Accepted','Your Booking is  accepted by the tradie.Pay the advance and confirm the booking now.',1);
REPLACE INTO "tbl_notification" ("notification_id", "notification_date", "notification_title", "notification_content", "user_id") VALUES
	('5','2023-07-31','Booking Accepted','Your Booking is  accepted by the tradie.Pay the advance and confirm the booking now.',1);
REPLACE INTO "tbl_notification" ("notification_id", "notification_date", "notification_title", "notification_content", "user_id") VALUES
	('6','2023-07-31','Work Completed!','How was the work?Rate the work and tradie now',1);
REPLACE INTO "tbl_notification" ("notification_id", "notification_date", "notification_title", "notification_content", "user_id") VALUES
	('7','2023-07-31','Booking Accepted','Your Booking is  accepted by the tradie.Pay the advance and confirm the booking now.',1);
/*!40000 ALTER TABLE "tbl_notification" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_review'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_review" (
  "review_id" int(11) NOT NULL auto_increment,
  "tm_id" int(10) unsigned NOT NULL default '0',
  "customer_id" int(10) unsigned NOT NULL default '0',
  "user_name" varchar(50) NOT NULL default '0',
  "user_rating" varchar(50) NOT NULL default '0',
  "user_review" varchar(50) NOT NULL default '0',
  "review_datetime" varchar(50) NOT NULL default '0',
  PRIMARY KEY  ("review_id")
) AUTO_INCREMENT=24;



#
# Dumping data for table 'tbl_review'
#

LOCK TABLES "tbl_review" WRITE;
/*!40000 ALTER TABLE "tbl_review" DISABLE KEYS;*/
REPLACE INTO "tbl_review" ("review_id", "tm_id", "customer_id", "user_name", "user_rating", "user_review", "review_datetime") VALUES
	(1,'3','1','jytgfuytf','5','hg','2023-06-09 14:41:27');
REPLACE INTO "tbl_review" ("review_id", "tm_id", "customer_id", "user_name", "user_rating", "user_review", "review_datetime") VALUES
	(23,'1','1','gsj','3','bdjs','2023-07-31 11:48:37');
/*!40000 ALTER TABLE "tbl_review" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_servicebooking'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_servicebooking" (
  "sb_id" int(11) NOT NULL auto_increment,
  "sb_date" varchar(50) NOT NULL,
  "sb_fordate" varchar(50) NOT NULL,
  "sb_todate" varchar(50) default NULL,
  "sb_starttime" varchar(50) default NULL,
  "sb_detail" varchar(50) default NULL,
  "customer_id" int(11) NOT NULL,
  "sdetails_id" int(11) NOT NULL,
  "sb_status" int(50) NOT NULL default '0',
  "sb_advanceamount" varchar(50) NOT NULL,
  "payment_status" int(50) NOT NULL default '0',
  "work_stat" int(11) NOT NULL default '0',
  PRIMARY KEY  ("sb_id")
) AUTO_INCREMENT=31;



#
# Dumping data for table 'tbl_servicebooking'
#

LOCK TABLES "tbl_servicebooking" WRITE;
/*!40000 ALTER TABLE "tbl_servicebooking" DISABLE KEYS;*/
REPLACE INTO "tbl_servicebooking" ("sb_id", "sb_date", "sb_fordate", "sb_todate", "sb_starttime", "sb_detail", "customer_id", "sdetails_id", "sb_status", "sb_advanceamount", "payment_status", "work_stat") VALUES
	(17,'2023-07-27','27/7/2023',NULL,NULL,'jrjrhdn
',1,6,1,'250',1,1);
REPLACE INTO "tbl_servicebooking" ("sb_id", "sb_date", "sb_fordate", "sb_todate", "sb_starttime", "sb_detail", "customer_id", "sdetails_id", "sb_status", "sb_advanceamount", "payment_status", "work_stat") VALUES
	(18,'2023-07-27','29/7/2023',NULL,NULL,'One Day Work',1,7,1,'350',1,1);
REPLACE INTO "tbl_servicebooking" ("sb_id", "sb_date", "sb_fordate", "sb_todate", "sb_starttime", "sb_detail", "customer_id", "sdetails_id", "sb_status", "sb_advanceamount", "payment_status", "work_stat") VALUES
	(19,'2023-07-27','29/7/2023',NULL,NULL,'adghj',1,8,2,'500',0,0);
REPLACE INTO "tbl_servicebooking" ("sb_id", "sb_date", "sb_fordate", "sb_todate", "sb_starttime", "sb_detail", "customer_id", "sdetails_id", "sb_status", "sb_advanceamount", "payment_status", "work_stat") VALUES
	(25,'2023-07-28','19/7/2023',NULL,NULL,'f',1,6,2,'250',0,0);
REPLACE INTO "tbl_servicebooking" ("sb_id", "sb_date", "sb_fordate", "sb_todate", "sb_starttime", "sb_detail", "customer_id", "sdetails_id", "sb_status", "sb_advanceamount", "payment_status", "work_stat") VALUES
	(26,'2023-07-29','30/7/2023',NULL,NULL,'all ',1,6,1,'250',1,1);
REPLACE INTO "tbl_servicebooking" ("sb_id", "sb_date", "sb_fordate", "sb_todate", "sb_starttime", "sb_detail", "customer_id", "sdetails_id", "sb_status", "sb_advanceamount", "payment_status", "work_stat") VALUES
	(27,'2023-07-29','31/7/2023','','10Am','a',1,6,2,'250',0,0);
REPLACE INTO "tbl_servicebooking" ("sb_id", "sb_date", "sb_fordate", "sb_todate", "sb_starttime", "sb_detail", "customer_id", "sdetails_id", "sb_status", "sb_advanceamount", "payment_status", "work_stat") VALUES
	(29,'2023-07-31','2023-08-06',NULL,NULL,'1 DAY WORK',1,7,1,'350',1,1);
REPLACE INTO "tbl_servicebooking" ("sb_id", "sb_date", "sb_fordate", "sb_todate", "sb_starttime", "sb_detail", "customer_id", "sdetails_id", "sb_status", "sb_advanceamount", "payment_status", "work_stat") VALUES
	(30,'2023-07-31','31/7/2023','31/7/2023','10 AM','Plumbing ',1,6,1,'250',0,0);
/*!40000 ALTER TABLE "tbl_servicebooking" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_servicedetails'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_servicedetails" (
  "sdetails_id" int(11) NOT NULL auto_increment,
  "sdetails_content" varchar(300) NOT NULL,
  "sdetails_rate" varchar(50) NOT NULL,
  "tm_id" int(11) NOT NULL,
  PRIMARY KEY  ("sdetails_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_servicedetails'
#

LOCK TABLES "tbl_servicedetails" WRITE;
/*!40000 ALTER TABLE "tbl_servicedetails" DISABLE KEYS;*/
REPLACE INTO "tbl_servicedetails" ("sdetails_id", "sdetails_content", "sdetails_rate", "tm_id") VALUES
	(6,'Skilled plumber with experience over 15 years. Works are completed time-bounded.Resides in Karakkunnam.','500',1);
REPLACE INTO "tbl_servicedetails" ("sdetails_id", "sdetails_content", "sdetails_rate", "tm_id") VALUES
	(7,'  welder with 10 year experience','700',3);
REPLACE INTO "tbl_servicedetails" ("sdetails_id", "sdetails_content", "sdetails_rate", "tm_id") VALUES
	(8,'  PLUMBER','1000',4);
/*!40000 ALTER TABLE "tbl_servicedetails" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_servicetype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_servicetype" (
  "serviceType_id" int(11) NOT NULL auto_increment,
  "serviceType" varchar(50) NOT NULL,
  PRIMARY KEY  ("serviceType_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_servicetype'
#

LOCK TABLES "tbl_servicetype" WRITE;
/*!40000 ALTER TABLE "tbl_servicetype" DISABLE KEYS;*/
REPLACE INTO "tbl_servicetype" ("serviceType_id", "serviceType") VALUES
	(1,'Plumber');
REPLACE INTO "tbl_servicetype" ("serviceType_id", "serviceType") VALUES
	(2,'Welder');
REPLACE INTO "tbl_servicetype" ("serviceType_id", "serviceType") VALUES
	(3,'Electrician');
REPLACE INTO "tbl_servicetype" ("serviceType_id", "serviceType") VALUES
	(4,'HousePainter');
REPLACE INTO "tbl_servicetype" ("serviceType_id", "serviceType") VALUES
	(5,'HouseCleaner');
/*!40000 ALTER TABLE "tbl_servicetype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_tradesmen'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_tradesmen" (
  "tm_id" int(11) NOT NULL auto_increment,
  "tm_name" varchar(50) NOT NULL,
  "tm_address" varchar(250) NOT NULL,
  "tm_contact" varchar(50) NOT NULL,
  "tm_email" varchar(50) NOT NULL,
  "tm_photo" varchar(50) NOT NULL,
  "localPlace_id" int(11) NOT NULL,
  "tm_proof" varchar(50) NOT NULL,
  "serviceType_id" int(11) NOT NULL,
  "tm_password" varchar(50) NOT NULL,
  "tm_vstatus" int(50) default '0',
  "tm_reg_date" varchar(50) NOT NULL,
  "avg_rating" tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  ("tm_id","tm_photo")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_tradesmen'
#

LOCK TABLES "tbl_tradesmen" WRITE;
/*!40000 ALTER TABLE "tbl_tradesmen" DISABLE KEYS;*/
REPLACE INTO "tbl_tradesmen" ("tm_id", "tm_name", "tm_address", "tm_contact", "tm_email", "tm_photo", "localPlace_id", "tm_proof", "serviceType_id", "tm_password", "tm_vstatus", "tm_reg_date", "avg_rating") VALUES
	(1,'Xavier Andrews','Melemuriyil
','7627863759','xavy123@gmail.com','photo1876.png',1,'proof1417.png',2,'xavy',1,'2023-06-01',3);
REPLACE INTO "tbl_tradesmen" ("tm_id", "tm_name", "tm_address", "tm_contact", "tm_email", "tm_photo", "localPlace_id", "tm_proof", "serviceType_id", "tm_password", "tm_vstatus", "tm_reg_date", "avg_rating") VALUES
	(3,'Binoy John','Karmuathinkal House
','6738291346','binoy@gmail.com','photo1238.jpg',1,'proof1205.jpg',2,'BINOY',1,'2023-06-01',0);
REPLACE INTO "tbl_tradesmen" ("tm_id", "tm_name", "tm_address", "tm_contact", "tm_email", "tm_photo", "localPlace_id", "tm_proof", "serviceType_id", "tm_password", "tm_vstatus", "tm_reg_date", "avg_rating") VALUES
	(4,'Sibin Mathay','Elamakkarayil <br> House
Pezhakkappilli <br>p.o
Muvattupuzha
','7123474261','sibinme@gmail.com','photo1234.png',3,'proof1632.png',1,'sibin',1,'2023-06-01',0);
REPLACE INTO "tbl_tradesmen" ("tm_id", "tm_name", "tm_address", "tm_contact", "tm_email", "tm_photo", "localPlace_id", "tm_proof", "serviceType_id", "tm_password", "tm_vstatus", "tm_reg_date", "avg_rating") VALUES
	(5,'Johnson Mathay','Thottakatt
Kizhakkekkara','7123456891','jm@gmail.com','photo1391.png',9,'proof1154.png',1,'john',2,'2023-06-01',0);
REPLACE INTO "tbl_tradesmen" ("tm_id", "tm_name", "tm_address", "tm_contact", "tm_email", "tm_photo", "localPlace_id", "tm_proof", "serviceType_id", "tm_password", "tm_vstatus", "tm_reg_date", "avg_rating") VALUES
	(6,'Raghavan KP','Thekkekara House
Pezhakkappilli
','7564829145','raghavankp@gmail.com','photo1361.png',3,'proof1712.png',3,'raghavan',1,'2023-06-01',0);
REPLACE INTO "tbl_tradesmen" ("tm_id", "tm_name", "tm_address", "tm_contact", "tm_email", "tm_photo", "localPlace_id", "tm_proof", "serviceType_id", "tm_password", "tm_vstatus", "tm_reg_date", "avg_rating") VALUES
	(7,'Rekha Sebastian','wertyuilmnbvcftyuk','7891233410','dfghjj@gmail.com','photo1276.jpg',4,'proof1291.jpg',4,'qwerty',2,'2023-06-01',0);
REPLACE INTO "tbl_tradesmen" ("tm_id", "tm_name", "tm_address", "tm_contact", "tm_email", "tm_photo", "localPlace_id", "tm_proof", "serviceType_id", "tm_password", "tm_vstatus", "tm_reg_date", "avg_rating") VALUES
	(8,'Jeswin Paul Jacob','THEENAMBELIL HOUSE,KKLM','9447997304','jeswinpauljacob@gmail.com','photo1363.png',1,'proof1386.png',3,'densyappu',0,'2023-07-27',0);
REPLACE INTO "tbl_tradesmen" ("tm_id", "tm_name", "tm_address", "tm_contact", "tm_email", "tm_photo", "localPlace_id", "tm_proof", "serviceType_id", "tm_password", "tm_vstatus", "tm_reg_date", "avg_rating") VALUES
	(9,'Maya Adrash','Kollammattam','7123423690','mayaad1@gmil.com','photo1354.jpg',9,'proof1500.jpg',5,'mayaM@123',0,'2023-07-30',0);
/*!40000 ALTER TABLE "tbl_tradesmen" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
