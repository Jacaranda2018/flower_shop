/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.56 : Database - shop1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shop1`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cuid` int(11) DEFAULT NULL,
  `cbid` int(11) DEFAULT NULL,
  `cnum` int(11) DEFAULT NULL,
  `cmoney` double DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `cart` */

insert  into `cart`(`cid`,`cuid`,`cbid`,`cnum`,`cmoney`) values (10,1,1002,1,200);

/*Table structure for table `classify` */

DROP TABLE IF EXISTS `classify`;

CREATE TABLE `classify` (
  `id` int(11) NOT NULL,
  `name` char(200) CHARACTER SET gb2312 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `classify` */

insert  into `classify`(`id`,`name`) values (1,'玫瑰花'),(2,'百合花'),(3,'牡丹'),(4,'菊花'),(5,'配花');

/*Table structure for table `custom` */

DROP TABLE IF EXISTS `custom`;

CREATE TABLE `custom` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cuid` int(11) DEFAULT NULL,
  `cfid` varchar(30) DEFAULT NULL,
  `cnum` varchar(30) DEFAULT NULL,
  `cmoney` double DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `custom` */

/*Table structure for table `customorders` */

DROP TABLE IF EXISTS `customorders`;

CREATE TABLE `customorders` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tuid` int(11) DEFAULT NULL,
  `tfids` varchar(30) DEFAULT NULL,
  `tnums` varchar(30) DEFAULT NULL,
  `tmoney` double DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `customorders` */

insert  into `customorders`(`tid`,`tuid`,`tfids`,`tnums`,`tmoney`) values (2,1,'1003,3002,2001','4,1,1',1200);

/*Table structure for table `flower` */

DROP TABLE IF EXISTS `flower`;

CREATE TABLE `flower` (
  `f_number` char(255) NOT NULL,
  `f_name` char(255) NOT NULL,
  `f_color` char(255) CHARACTER SET gb2312 NOT NULL DEFAULT '',
  `f_place` char(255) CHARACTER SET gb2312 NOT NULL DEFAULT '',
  `f_stock` int(255) NOT NULL,
  `f_price` float(20,0) NOT NULL,
  `f_message` char(255) CHARACTER SET gb2312 NOT NULL,
  `f_picture` char(255) CHARACTER SET gb2312 NOT NULL DEFAULT '',
  `cid` int(11) DEFAULT NULL,
  `recommend` int(11) DEFAULT '0',
  PRIMARY KEY (`f_number`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `flower` */

insert  into `flower`(`f_number`,`f_name`,`f_color`,`f_place`,`f_stock`,`f_price`,`f_message`,`f_picture`,`cid`,`recommend`) values ('1001','红玫瑰','红色','花场',99,200,'啦啦啦啦啦啦啦啦啦啦','image/show12.jpg',1,0),('1002','粉玫瑰','粉丝','花场',99,200,'啊啦啦啦啦','image/show10.jpg',2,0),('1003','白玫瑰','白色','花场',99,200,'啊啦啦啦啦','image/show6.jpg',3,0),('1004','冷美人','紫色','花场',99,200,'啊啦啦啦啦','image/show3.jpg',4,0),('1005','黄玫瑰','黄色','花场',99,200,'啦啦啦拉拉','image/show2.jpg',5,0),('2001','白百合','白色','花场',99,200,'啦啦啦','image/show4.jpg',1,0),('2002','粉白合','粉色','花场',99,200,'啊啦啦啦啦','image/show9.jpg',2,0),('2003','黄百合','黄色','花场',99,200,'啦啦啦','image/show4.jpg',3,0),('2004','黑白合','黑色','花场',99,200,'啦啦啦啦','image/show11.jpg',4,0),('3001','迟兰','紫色','花场',99,200,'啊啦啦啦','image/show7.jpg',4,0),('3002','豆绿','绿色','花场',99,200,'啦啦啦','image/show8.jpg',5,0),('3003','迎日红','红色','花场',99,200,'啊拉拉','image/good5.jpg',2,0),('4001','天鹅舞','黄色','花场',99,200,'啊啦啦啦','image/good3.jpg',4,0),('4002','雪海','白色','花场',99,200,'啊啦啦啦','image/good1.jpg',2,0),('4003','墨菊','红紫色','花场',99,200,'啊拉拉','image/show4.jpg',1,0),('5001','配花1','红色','花场',99,200,'啊啦啦啦','image/show5.jpg',5,0),('5002','配花2','白色','花场',99,200,'啦啦啦','image/show6.jpg',5,0),('5003','配花3','粉色','花场',99,200,'啦啦啦','image/good4.jpg',4,0),('5004','配花4','蓝色','花场',99,200,'啊拉拉','image/good2.jpg',5,0);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` bigint(8) NOT NULL AUTO_INCREMENT,
  `o_uid` bigint(8) DEFAULT NULL,
  `o_dids` varchar(100) DEFAULT NULL,
  `o_nums` varchar(100) DEFAULT NULL,
  `o_money` double DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`oid`,`o_uid`,`o_dids`,`o_nums`,`o_money`) values (3,1,'1001,2003','1,1',400),(4,1,'1002','1',200);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logname` char(255) NOT NULL,
  `password` char(255) NOT NULL,
  `phone` char(255) NOT NULL,
  `address` char(255) CHARACTER SET gb2312 NOT NULL DEFAULT '',
  `realname` char(255) CHARACTER SET gb2312 NOT NULL,
  PRIMARY KEY (`id`,`logname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

/*Data for the table `user` */

insert  into `user`(`id`,`logname`,`password`,`phone`,`address`,`realname`) values (1,'想远方','123456','123456','广州','张三');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
