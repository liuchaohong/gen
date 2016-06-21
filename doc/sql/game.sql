CREATE TABLE `game` (
  `gameId` varchar(10) NOT NULL COMMENT '游戏ID',
  `gameName` varchar(20) DEFAULT NULL COMMENT '游戏名',
  PRIMARY KEY (`gameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏表'