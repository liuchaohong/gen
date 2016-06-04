/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/4/27 11:39:28                           */
/*==============================================================*/
-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `adId` varchar(60) NOT NULL COMMENT '广告单ID',
  `adName` varchar(30) DEFAULT NULL COMMENT '广告单名称',
  `gameId` varchar(10) DEFAULT NULL COMMENT '游戏id',
  `adStartDate` date DEFAULT NULL COMMENT '投放时间',
  `channelName` varchar(20) DEFAULT NULL COMMENT '渠道名',
  `adServerId` varchar(20) DEFAULT NULL COMMENT '广告商ID',
  `adPosition` varchar(20) DEFAULT NULL COMMENT '广告位置',
  `officalWebSite` varchar(50) DEFAULT NULL COMMENT '官网地址',
  `localPath` varchar(200) DEFAULT NULL COMMENT '本地地址',
  `cdnURL` varchar(500) DEFAULT NULL COMMENT 'CDN地址',
  `srcAPKName` varchar(65) DEFAULT NULL COMMENT '源包名',
  `createTime` datetime DEFAULT NULL COMMENT '记录创建时间',
  `cpsAPKName` varchar(65) DEFAULT NULL,
  `cpsAPKPath` varchar(255) DEFAULT NULL,
  `cpsOperLogId` int(11) DEFAULT NULL,
  `cpsCreateTime` datetime DEFAULT NULL COMMENT 'CPS创建时间',
  `cpsAPKStatus` tinyint(4) DEFAULT '0' COMMENT '0:未生成 1:已生成未上传2:已经上传并本地已删除',
  `operLogId` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`adId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告单表';

-- ----------------------------
-- Table structure for ad_event
-- ----------------------------
DROP TABLE IF EXISTS `ad_event`;
CREATE TABLE `ad_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` varchar(10) DEFAULT NULL COMMENT '游戏',
  `ad_id` varchar(50) DEFAULT NULL COMMENT '广告ID',
  `type` varchar(50) DEFAULT NULL COMMENT '事件类型',
  `ip` varchar(50) DEFAULT NULL COMMENT 'ip地址',
  `cookie` varchar(100) DEFAULT NULL COMMENT 'cookie',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `count` int(11) DEFAULT NULL COMMENT '数量',
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
  `game_id` varchar(10) DEFAULT NULL COMMENT '游戏',
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告组表';

-- ----------------------------
-- Table structure for ad_list_grp
-- ----------------------------
DROP TABLE IF EXISTS `ad_list_grp`;
CREATE TABLE `ad_list_grp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `adId` varchar(60) DEFAULT NULL COMMENT '广告单ID',
  PRIMARY KEY (`id`),
  KEY `ad_list_grp_ibfk_1` (`groupId`),
  KEY `ad_list_grp_ibfk_2` (`adId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告单与广告组关系表';

-- ----------------------------
-- Table structure for ad_price
-- ----------------------------
DROP TABLE IF EXISTS `ad_price`;
CREATE TABLE `ad_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` varchar(60) DEFAULT NULL COMMENT '广告单ID',
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='广告成本表';

-- ----------------------------
-- Table structure for ad_version
-- ----------------------------
DROP TABLE IF EXISTS `ad_version`;
CREATE TABLE `ad_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adStartDate` date DEFAULT NULL,
  `gameId` varchar(10) DEFAULT NULL COMMENT '游戏id',
  `srcAPKName` varchar(65) DEFAULT NULL COMMENT '源包名',
  `srcAPKPath` varchar(200) DEFAULT NULL COMMENT '源包路径',
  `hasSyncCDN` tinyint(4) DEFAULT '0' COMMENT '是否已经同步CDN，0：否 1:是',
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
  `create_cps_status` tinyint(4) DEFAULT '0' COMMENT '0:失败 1:成功',
  `push_ftp_status` tinyint(4) DEFAULT '0' COMMENT '0:未开始 1:正在上传 2:上传成功 3:上传失败',
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
  `gameId` varchar(10) NOT NULL COMMENT '游戏ID',
  `gameName` varchar(20) DEFAULT NULL COMMENT '游戏名',
  PRIMARY KEY (`gameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏表';

-- ----------------------------
-- Table structure for oper_log
-- ----------------------------
DROP TABLE IF EXISTS `oper_log`;
CREATE TABLE `oper_log` (
  `id` varchar(25) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL COMMENT '操作人',
  `gameId` varchar(10) DEFAULT NULL,
  `create_cps_status` tinyint(4) DEFAULT '0' COMMENT '0:正在进行，1：完成,2:登陆异常',
  `query_end_date` datetime DEFAULT NULL COMMENT '0:未开始，1：正在进行 2：已结束',
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