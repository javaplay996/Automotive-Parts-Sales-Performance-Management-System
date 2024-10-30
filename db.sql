/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - pj-ssmj
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pj-ssmj` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pj-ssmj`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssm1z8hn/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/ssm1z8hn/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssm1z8hn/upload/picture3.jpg'),(4,'homepage',NULL);

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别',1,'男',NULL,'2021-01-25 11:41:54'),(2,'sex_types','性别',2,'女',NULL,'2021-01-25 11:41:54');

/*Table structure for table `gongyingshangxinxi` */

DROP TABLE IF EXISTS `gongyingshangxinxi`;

CREATE TABLE `gongyingshangxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `gysname` varchar(255) DEFAULT NULL COMMENT '供应商名称 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='供应商信息';

/*Data for the table `gongyingshangxinxi` */

insert  into `gongyingshangxinxi`(`id`,`gysname`) values (1,'供应商1'),(2,'供应商2'),(3,'供应商3'),(5,'供应商4');

/*Table structure for table `jinhuoxinxi` */

DROP TABLE IF EXISTS `jinhuoxinxi`;

CREATE TABLE `jinhuoxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `numbered` varchar(255) DEFAULT NULL COMMENT '单号',
  `name` varchar(255) DEFAULT NULL COMMENT '配件名称 Search',
  `pj_types` int(255) DEFAULT NULL COMMENT '配件类型 Search',
  `replenish` int(11) DEFAULT NULL COMMENT '进货数量',
  `gy_types` int(255) DEFAULT NULL COMMENT '供应商 Search',
  `notice_content` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `yg_types` int(11) DEFAULT NULL COMMENT '经手员工 Search',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '进货时间',
  `maxmoney` decimal(10,0) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='进货信息';

/*Data for the table `jinhuoxinxi` */

insert  into `jinhuoxinxi`(`id`,`numbered`,`name`,`pj_types`,`replenish`,`gy_types`,`notice_content`,`yg_types`,`create_time`,`maxmoney`) values (4,'1612250250707','配件1',1,1000,3,'备注\r\n',4,'2021-02-02 15:20:17','100000'),(5,'1612314375599','配件2',4,10000,2,'备注\r\n',1,'2021-02-03 09:06:16','2000000'),(7,'1612317325950','配件4',4,100,5,'备注\r\n',12,'2021-02-03 09:55:26','12300');

/*Table structure for table `kehuxixni` */

DROP TABLE IF EXISTS `kehuxixni`;

CREATE TABLE `kehuxixni` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `khname` varchar(255) DEFAULT NULL COMMENT '客户名称 Search',
  `sex_types` int(11) DEFAULT NULL COMMENT '客户性别 Search',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `location` varchar(255) DEFAULT NULL COMMENT '联系地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='客户信息';

/*Data for the table `kehuxixni` */

insert  into `kehuxixni`(`id`,`khname`,`sex_types`,`contact`,`location`) values (1,'客户1',1,'111','111'),(2,'客户2',2,'222','222'),(3,'客户3',2,'333','333');

/*Table structure for table `peijianleixing` */

DROP TABLE IF EXISTS `peijianleixing`;

CREATE TABLE `peijianleixing` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pjname` varchar(255) DEFAULT NULL COMMENT '配件类型 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='配件类型';

/*Data for the table `peijianleixing` */

insert  into `peijianleixing`(`id`,`pjname`) values (1,'车轴'),(2,'车轮'),(3,'窗户'),(4,'发动机');

/*Table structure for table `peijianxinxi` */

DROP TABLE IF EXISTS `peijianxinxi`;

CREATE TABLE `peijianxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '配件名称 Search',
  `pj_types` int(255) DEFAULT NULL COMMENT '配件类型 Search',
  `money` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `replenish` int(11) DEFAULT NULL COMMENT '进货数量',
  `sell` int(11) DEFAULT NULL COMMENT '出售数量',
  `repertory` int(11) DEFAULT NULL COMMENT '库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='配件信息';

/*Data for the table `peijianxinxi` */

insert  into `peijianxinxi`(`id`,`name`,`pj_types`,`money`,`replenish`,`sell`,`repertory`) values (2,'配件2',4,'200',10000,123,9877),(3,'配件3',2,'300',999999,123,999876),(4,'配件1',1,'100',1000,200,700),(5,'配件4',4,'123',100,50,50);

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','neblhq2sxceddvu5qkli435ku4kamoa7','2021-01-28 18:04:51','2021-02-03 10:53:53'),(2,1,'小札','users','用户','569iqscjgmga1xihldzb6mrobqijpdax','2021-02-02 16:10:08','2021-02-02 17:10:09'),(3,1,'小札','users','员工','2mmlqx16d8s2gl4i3iu1djp5y620zwqz','2021-02-02 16:20:10','2021-02-03 10:56:34'),(4,2,'小站','users','员工','abnya3h963wfqb2vluckg138z3pnwqnt','2021-02-02 16:48:23','2021-02-02 18:27:14'),(5,4,'小夏','users','员工','rgei89c1m1i5ndnws5r15tiaaw16phdx','2021-02-02 16:51:56','2021-02-03 10:57:10'),(6,12,'员工2','users','员工','62jmrjqq1zf319mq1d7021sudn93f4zs','2021-02-03 09:56:47','2021-02-03 10:56:48');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) NOT NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-01-28 18:04:51');

/*Table structure for table `xiaoshouxinxi` */

DROP TABLE IF EXISTS `xiaoshouxinxi`;

CREATE TABLE `xiaoshouxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `numbered` varchar(255) DEFAULT NULL COMMENT '出售单号',
  `name` varchar(255) DEFAULT NULL COMMENT '配件名称 Search',
  `pj_types` int(255) DEFAULT NULL COMMENT '配件类型 Search',
  `sell` int(11) DEFAULT NULL COMMENT '出售数量',
  `kh_types` int(11) DEFAULT NULL COMMENT '提供客户 Search',
  `yg_types` int(11) DEFAULT NULL COMMENT '负责员工',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '出售时间',
  `maxmoney` decimal(10,0) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='销售信息';

/*Data for the table `xiaoshouxinxi` */

insert  into `xiaoshouxinxi`(`id`,`numbered`,`name`,`pj_types`,`sell`,`kh_types`,`yg_types`,`create_time`,`maxmoney`) values (4,'1612249353681','配件1',1,123,3,4,'2021-02-02 15:02:34','12300'),(6,'1612252028255','配件1',1,100,3,3,'2021-02-02 15:47:08','10000'),(7,'1612252042453','配件1',1,200,2,2,'2021-02-02 15:47:22','20000'),(8,'1612314397546','配件2',4,123,2,1,'2021-02-03 09:06:38','24600'),(10,'1612317355894','配件4',4,50,3,12,'2021-02-03 09:55:56','6150');

/*Table structure for table `yonghuxinxi` */

DROP TABLE IF EXISTS `yonghuxinxi`;

CREATE TABLE `yonghuxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '员工名称 Search',
  `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `sex_types` int(10) DEFAULT NULL COMMENT '性别',
  `img_photo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='员工信息';

/*Data for the table `yonghuxinxi` */

insert  into `yonghuxinxi`(`id`,`name`,`account`,`password`,`sex_types`,`img_photo`,`role`) values (1,'小札','111','111',1,'http://localhost:8080/pj-ssmj/upload/yonghu_touxiang5.jpg','员工'),(2,'小站','222','222',2,'http://localhost:8080/pj-ssmj/upload/yonghu_touxiang3.jpg','员工'),(3,'汪汪','333','333',1,'http://localhost:8080/pj-ssmj/upload/yonghu_touxiang1.jpg','员工'),(4,'小夏','123','123',2,'http://localhost:8080/pj-ssmj/upload/yonghu_touxiang5.jpg','员工'),(12,'员工2','444','123',2,'http://localhost:8080/pj-ssmj/file/download?fileName=1612317255155.JPG','员工');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
