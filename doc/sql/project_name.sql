/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/4/27 11:39:28                           */
/*==============================================================*/
-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `adId` varchar(60) NOT NULL COMMENT '��浥ID',
  `adName` varchar(30) DEFAULT NULL COMMENT '��浥����',
  `gameId` varchar(10) DEFAULT NULL COMMENT '��Ϸid',
  `adStartDate` date DEFAULT NULL COMMENT 'Ͷ��ʱ��',
  `channelName` varchar(20) DEFAULT NULL COMMENT '������',
  `adServerId` varchar(20) DEFAULT NULL COMMENT '�����ID',
  `adPosition` varchar(20) DEFAULT NULL COMMENT '���λ��',
  `officalWebSite` varchar(50) DEFAULT NULL COMMENT '������ַ',
  `localPath` varchar(200) DEFAULT NULL COMMENT '���ص�ַ',
  `cdnURL` varchar(500) DEFAULT NULL COMMENT 'CDN��ַ',
  `srcAPKName` varchar(65) DEFAULT NULL COMMENT 'Դ����',
  `createTime` datetime DEFAULT NULL COMMENT '��¼����ʱ��',
  `cpsAPKName` varchar(65) DEFAULT NULL,
  `cpsAPKPath` varchar(255) DEFAULT NULL,
  `cpsOperLogId` int(11) DEFAULT NULL,
  `cpsCreateTime` datetime DEFAULT NULL COMMENT 'CPS����ʱ��',
  `cpsAPKStatus` tinyint(4) DEFAULT '0' COMMENT '0:δ���� 1:������δ�ϴ�2:�Ѿ��ϴ���������ɾ��',
  `operLogId` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`adId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��浥��';

-- ----------------------------
-- Table structure for ad_event
-- ----------------------------
DROP TABLE IF EXISTS `ad_event`;
CREATE TABLE `ad_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` varchar(10) DEFAULT NULL COMMENT '��Ϸ',
  `ad_id` varchar(50) DEFAULT NULL COMMENT '���ID',
  `type` varchar(50) DEFAULT NULL COMMENT '�¼�����',
  `ip` varchar(50) DEFAULT NULL COMMENT 'ip��ַ',
  `cookie` varchar(100) DEFAULT NULL COMMENT 'cookie',
  `date` datetime DEFAULT NULL COMMENT 'ʱ��',
  `count` int(11) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ad_grp
-- ----------------------------
DROP TABLE IF EXISTS `ad_grp`;
CREATE TABLE `ad_grp` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `game_id` varchar(10) DEFAULT NULL COMMENT '��Ϸ',
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

-- ----------------------------
-- Table structure for ad_list_grp
-- ----------------------------
DROP TABLE IF EXISTS `ad_list_grp`;
CREATE TABLE `ad_list_grp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `adId` varchar(60) DEFAULT NULL COMMENT '��浥ID',
  PRIMARY KEY (`id`),
  KEY `ad_list_grp_ibfk_1` (`groupId`),
  KEY `ad_list_grp_ibfk_2` (`adId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��浥�������ϵ��';

-- ----------------------------
-- Table structure for ad_price
-- ----------------------------
DROP TABLE IF EXISTS `ad_price`;
CREATE TABLE `ad_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` varchar(60) DEFAULT NULL COMMENT '��浥ID',
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='���ɱ���';

-- ----------------------------
-- Table structure for ad_version
-- ----------------------------
DROP TABLE IF EXISTS `ad_version`;
CREATE TABLE `ad_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adStartDate` date DEFAULT NULL,
  `gameId` varchar(10) DEFAULT NULL COMMENT '��Ϸid',
  `srcAPKName` varchar(65) DEFAULT NULL COMMENT 'Դ����',
  `srcAPKPath` varchar(200) DEFAULT NULL COMMENT 'Դ��·��',
  `hasSyncCDN` tinyint(4) DEFAULT '0' COMMENT '�Ƿ��Ѿ�ͬ��CDN��0���� 1:��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cps_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `cps_oper_log`;
CREATE TABLE `cps_oper_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operLogId` varchar(25) DEFAULT NULL,
  `adId` varchar(60) DEFAULT NULL,
  `create_cps_status` tinyint(4) DEFAULT '0' COMMENT '0:ʧ�� 1:�ɹ�',
  `push_ftp_status` tinyint(4) DEFAULT '0' COMMENT '0:δ��ʼ 1:�����ϴ� 2:�ϴ��ɹ� 3:�ϴ�ʧ��',
  `create_time` datetime DEFAULT NULL,
  `push_time` datetime DEFAULT NULL,
  `cpsAPKPath` varchar(255) DEFAULT NULL,
  `cpsAPKName` varchar(65) DEFAULT NULL,
  `gameId` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `gameId` varchar(10) NOT NULL COMMENT '��ϷID',
  `gameName` varchar(20) DEFAULT NULL COMMENT '��Ϸ��',
  PRIMARY KEY (`gameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ϸ��';

-- ----------------------------
-- Table structure for oper_log
-- ----------------------------
DROP TABLE IF EXISTS `oper_log`;
CREATE TABLE `oper_log` (
  `id` varchar(25) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL COMMENT '������',
  `gameId` varchar(10) DEFAULT NULL,
  `create_cps_status` tinyint(4) DEFAULT '0' COMMENT '0:���ڽ��У�1�����,2:��½�쳣',
  `query_end_date` datetime DEFAULT NULL COMMENT '0:δ��ʼ��1�����ڽ��� 2���ѽ���',
  `query_start_date` datetime DEFAULT NULL,
  `srcAPKName` varchar(65) DEFAULT NULL,
  `cps_user_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `ad_list_grp` add CONSTRAINT `ad_list_grp_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `ad_grp` (`groupId`);
ALTER table `ad_list_grp` add CONSTRAINT `ad_list_grp_ibfk_2` FOREIGN KEY (`adId`) REFERENCES `ad` (`adId`);
ALTER table `ad_price` add CONSTRAINT `ad_price_ibfk_1` FOREIGN KEY (`ad_Id`) REFERENCES `ad` (`adId`);
ALTER table `ad` add CONSTRAINT `ad_ibfk_1` FOREIGN KEY (`gameId`) REFERENCES `game` (`gameId`);
ALTER table `ad_version` add CONSTRAINT `ad_version_ibfk_1` FOREIGN KEY (`gameId`) REFERENCES `game` (`gameId`);