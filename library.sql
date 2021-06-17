/*
 Navicat Premium Data Transfer

 Source Server         : xiezhibin
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 47.105.181.146:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 17/06/2021 16:52:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) NOT NULL,
  `operator` int(11) NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `BID_UNIQUE` (`book_id`),
  KEY `op2_idx` (`operator`),
  KEY `bo_idx` (`ISBN`),
  CONSTRAINT `bo` FOREIGN KEY (`ISBN`) REFERENCES `booklist` (`ISBN`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `op2` FOREIGN KEY (`operator`) REFERENCES `manager` (`manager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of book
-- ----------------------------
BEGIN;
INSERT INTO `book` VALUES (151, '0000000000001', '流通室', 2, 6);
INSERT INTO `book` VALUES (152, '0000000000001', '流通室', 0, 6);
INSERT INTO `book` VALUES (153, '0000000000001', '流通室', 0, 6);
INSERT INTO `book` VALUES (154, '9787100000000', '流通室', 2, 6);
INSERT INTO `book` VALUES (155, '9787100000000', '流通室', 0, 6);
INSERT INTO `book` VALUES (156, '9787100000000', '流通室', 0, 6);
INSERT INTO `book` VALUES (157, '9787100000000', '流通室', 0, 6);
INSERT INTO `book` VALUES (158, '9787100000000', '流通室', 0, 6);
INSERT INTO `book` VALUES (159, '9787100000000', '流通室', 0, 6);
INSERT INTO `book` VALUES (160, '9787100000000', '流通室', 0, 6);
INSERT INTO `book` VALUES (161, '9787100000000', '流通室', 0, 6);
INSERT INTO `book` VALUES (162, '9787111421900', '流通室', 0, 6);
INSERT INTO `book` VALUES (163, '9787111421900', '流通室', 0, 6);
INSERT INTO `book` VALUES (164, '9787115417305', '流通室', 0, 6);
INSERT INTO `book` VALUES (165, '9787115417305', '流通室', 0, 6);
INSERT INTO `book` VALUES (166, '9787115417305', '流通室', 0, 6);
INSERT INTO `book` VALUES (167, '9787115417305', '流通室', 0, 6);
INSERT INTO `book` VALUES (168, '9787115417305', '流通室', 0, 6);
INSERT INTO `book` VALUES (169, '9787115417305', '流通室', 0, 6);
INSERT INTO `book` VALUES (170, '9787121254437', '流通室', 0, 6);
INSERT INTO `book` VALUES (171, '9787121254437', '流通室', 0, 6);
INSERT INTO `book` VALUES (172, '9787121254437', '流通室', 0, 6);
INSERT INTO `book` VALUES (173, '9787121254437', '流通室', 0, 6);
INSERT INTO `book` VALUES (174, '9787121254437', '流通室', 0, 6);
INSERT INTO `book` VALUES (175, '9787121254437', '流通室', 0, 6);
COMMIT;

-- ----------------------------
-- Table structure for booklist
-- ----------------------------
DROP TABLE IF EXISTS `booklist`;
CREATE TABLE `booklist` (
  `ISBN` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `bname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `publisher` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `writer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptime` date DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL,
  `is_popular` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ISBN`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`),
  KEY `op_idx` (`operator`),
  CONSTRAINT `op` FOREIGN KEY (`operator`) REFERENCES `manager` (`manager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of booklist
-- ----------------------------
BEGIN;
INSERT INTO `booklist` VALUES ('0000000000001', 'SQL必知必会', '芳文社', '陈之豪', '8102-05-20', 3, 6, 0);
INSERT INTO `booklist` VALUES ('9787100000000', 'Qian\'s C Compiler——The speed of the art', '路边社', '钱晨', '2018-05-14', 8, 6, 0);
INSERT INTO `booklist` VALUES ('9787111421900', '深入理解Java虚拟机', '机械工业出版社', '周志明', '2013-06-01', 2, 6, 1);
INSERT INTO `booklist` VALUES ('9787115417305', 'spring实战', '人民邮电出版社', 'Adrian Mouat', '2017-04-01', 6, 6, 1);
INSERT INTO `booklist` VALUES ('9787121254437', '集体智慧编程', '人民邮电出版社', 'Toby Segaran', '2015-03-01', 6, 6, 0);
COMMIT;

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `btime` datetime NOT NULL,
  `deadline` datetime NOT NULL,
  `rtime` datetime DEFAULT NULL,
  `operator` int(11) DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  UNIQUE KEY `BWID_UNIQUE` (`borrow_id`),
  KEY `boo_idx` (`book_id`),
  KEY `re_idx` (`user_id`),
  KEY `op3_idx` (`operator`),
  CONSTRAINT `boo` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `op3` FOREIGN KEY (`operator`) REFERENCES `manager` (`manager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `re` FOREIGN KEY (`user_id`) REFERENCES `reader` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of borrow
-- ----------------------------
BEGIN;
INSERT INTO `borrow` VALUES (89, 162, 26, '2018-05-31 10:32:13', '2018-07-30 10:32:13', '2018-05-31 10:32:19', 6);
INSERT INTO `borrow` VALUES (90, 151, 26, '2021-06-13 07:19:19', '2021-08-12 07:19:19', NULL, 6);
INSERT INTO `borrow` VALUES (91, 154, 26, '2021-06-13 07:19:20', '2021-08-12 07:19:20', NULL, 6);
COMMIT;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `pass_wd` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `mname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`manager_id`),
  UNIQUE KEY `MID_UNIQUE` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of manager
-- ----------------------------
BEGIN;
INSERT INTO `manager` VALUES (5, '123456', 'admin_czh');
INSERT INTO `manager` VALUES (6, '123456', 'admin_czc');
INSERT INTO `manager` VALUES (7, '123456', 'admin_qc');
COMMIT;

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pass_wd` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `rname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `RID_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of reader
-- ----------------------------
BEGIN;
INSERT INTO `reader` VALUES (26, 'czc_reader', '123456', '陈至成', '13800138000', '1966557473@qq.com');
INSERT INTO `reader` VALUES (27, 'czh_reader', '123456', 'czh', '00000000000', '1797079433@qq.com');
COMMIT;

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  UNIQUE KEY `REID_UNIQUE` (`reservation_id`),
  UNIQUE KEY `BID_UNIQUE` (`book_id`),
  KEY `re2_idx` (`user_id`),
  KEY `book_idx` (`book_id`),
  CONSTRAINT `book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `re2` FOREIGN KEY (`user_id`) REFERENCES `reader` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for reservation_arrived
-- ----------------------------
DROP TABLE IF EXISTS `reservation_arrived`;
CREATE TABLE `reservation_arrived` (
  `reservation_arrived_id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) NOT NULL,
  PRIMARY KEY (`reservation_arrived_id`),
  KEY `res_id_fk_idx` (`reservation_id`),
  CONSTRAINT `res_id_fk` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- View structure for arrive_reminder
-- ----------------------------
DROP VIEW IF EXISTS `arrive_reminder`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `arrive_reminder` AS select `reader`.`user_name` AS `user_name`,`booklist`.`bname` AS `bname`,`reader`.`email` AS `email` from ((((`reservation_arrived` join `reservation`) join `reader`) join `book`) join `booklist`) where ((`reservation_arrived`.`reservation_id` = `reservation`.`reservation_id`) and (`reservation`.`user_id` = `reader`.`user_id`) and (`reservation`.`book_id` = `book`.`book_id`) and (`book`.`ISBN` = `booklist`.`ISBN`));

-- ----------------------------
-- View structure for borrow_detail
-- ----------------------------
DROP VIEW IF EXISTS `borrow_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `borrow_detail` AS select `borrow`.`borrow_id` AS `borrow_id`,`borrow`.`btime` AS `btime`,`borrow`.`rtime` AS `rtime`,`borrow`.`deadline` AS `deadline`,`borrow`.`book_id` AS `book_id`,`booklist`.`bname` AS `bname`,`borrow`.`user_id` AS `user_id`,`reader`.`user_name` AS `user_name` from (((`borrow` join `book`) join `booklist`) join `reader`) where ((`borrow`.`book_id` = `book`.`book_id`) and (`booklist`.`ISBN` = `book`.`ISBN`) and (`borrow`.`user_id` = `reader`.`user_id`));

-- ----------------------------
-- View structure for reservation_detail
-- ----------------------------
DROP VIEW IF EXISTS `reservation_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `reservation_detail` AS select `reader`.`user_id` AS `user_id`,`reader`.`user_name` AS `user_name`,`reservation`.`reservation_id` AS `reservation_id`,`book`.`book_id` AS `book_id`,`booklist`.`bname` AS `bname`,`reservation`.`deadline` AS `deadline` from (((`booklist` join `book`) join `reader`) join `reservation`) where ((`reservation`.`user_id` = `reader`.`user_id`) and (`reservation`.`book_id` = `book`.`book_id`) and (`book`.`ISBN` = `booklist`.`ISBN`));

-- ----------------------------
-- View structure for return_reminder
-- ----------------------------
DROP VIEW IF EXISTS `return_reminder`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `return_reminder` AS select `reader`.`user_name` AS `user_name`,`borrow`.`btime` AS `btime`,`booklist`.`bname` AS `bname`,`reader`.`email` AS `email` from (((`borrow` join `reader`) join `book`) join `booklist`) where ((`reader`.`user_id` = `borrow`.`user_id`) and (`borrow`.`book_id` = `book`.`book_id`) and (`book`.`ISBN` = `booklist`.`ISBN`) and isnull(`borrow`.`rtime`));

-- ----------------------------
-- View structure for sec_kill
-- ----------------------------
DROP VIEW IF EXISTS `sec_kill`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `sec_kill` AS select `booklist`.`ISBN` AS `ISBN`,`booklist`.`bname` AS `bname`,`booklist`.`publisher` AS `publisher`,`booklist`.`writer` AS `writer`,`booklist`.`ptime` AS `ptime`,(select count(0) from `book` where ((`book`.`ISBN` = `booklist`.`ISBN`) and (`book`.`state` = 0))) AS `number` from `booklist` where (`booklist`.`is_popular` = 1);

-- ----------------------------
-- Procedure structure for borrow_from_res
-- ----------------------------
DROP PROCEDURE IF EXISTS `borrow_from_res`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `borrow_from_res`(in res_id int, in op int)
BEGIN
	declare bid int;
    declare uid int;
    declare num int;
    declare t_error integer default 0;
    declare continue handler for sqlexception set t_error=1;
    start transaction;
    
    select count(*) into num from reservation where reservation_id=res_id;
    if num > 0 then
		select book_id, user_id into bid, uid from reservation where reservation_id=res_id;
		insert into borrow(book_id, user_id, btime, deadline, operator) values (bid, uid, now(), date_add(now(), interval 60 day), op); 
		DELETE from reservation where book_id=bid;
		UPDATE book SET state=2 where book_id=bid;
	end if;
    
    if t_error=1 then
		rollback;
	else
		commit;
	end if;
END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for do_sec_kill
-- ----------------------------
DROP PROCEDURE IF EXISTS `do_sec_kill`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `do_sec_kill`(IN bn varchar(30), IN uid int, OUT st int)
BEGIN
	declare num int;
    declare bid int;
    declare t_error integer default 0;
    declare continue handler for sqlexception set t_error=1;
    start transaction;
    
    select count(*) into num from book where ISBN=bn and state=0;
    select book_id into bid from book where ISBN=bn and state=0 order by book_id limit 0, 1;
	if num > 0 then
		insert into reservation(user_id, book_id, deadline) values(uid, bid, date_add(now(), interval 10 day));
		update book set state=1 where book_id=bid;
		set st = 1;
	else
		set st=0;
	end if;
    
    if t_error=1 then
		rollback;
        set st=-4;
	else
		commit;
	end if;
END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for make_reservation
-- ----------------------------
DROP PROCEDURE IF EXISTS `make_reservation`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `make_reservation`(IN bn varchar(30), IN uid int, OUT  st int)
BEGIN
	declare num int;
    declare ispop int;
    declare bid int;
	declare stat int;
    declare t_error integer default 0;
    declare continue handler for sqlexception set t_error=1;
    start transaction;
    
    select count(*) into num from book where ISBN=bn and (state=0 or (state=2 and book_id not in (select reservation.book_id from reservation))) order by state;
	select is_popular into ispop from booklist where booklist.ISBN=bn;
    if ispop > 0 then
		set st=-1;
	else
		if num > 0 then
			select state, book_id into stat, bid from book where ISBN=bn  and (state=0 or (state=2 and book_id not in (select reservation.book_id from reservation))) order by state limit 0, 1;
			if stat > 0 then
				insert into reservation(user_id, book_id) values(uid, bid);
				set st = 2;
			else
				insert into reservation(user_id, book_id, deadline) values(uid, bid, date_add(now(), interval 10 day));
				update book set state=1 where book_id=bid;
				set st = 1;
			end if;
		else
			set st=0;
		end if;
	end if;
    
    if t_error=1 then
		rollback;
        set st=-4;
	else
		commit;
	end if;
END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for new_book
-- ----------------------------
DROP PROCEDURE IF EXISTS `new_book`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `new_book`(IN ISBN varchar(30),IN bname varchar(45), IN publisher varchar(45), IN writer varchar(45), IN ptime date, IN num int, IN operator int,IN location varchar(45),IN state int)
BEGIN
	DECLARE i int;
	declare t_error integer default 0;
    declare continue handler for sqlexception set t_error=1;
    start transaction;
    
	insert into booklist(ISBN,bname, publisher, writer, ptime, number, operator)values (ISBN, bname, publisher, writer, ptime, num, operator);
	SET i=0;
	while i<num DO
		insert into book(ISBN,location,state,operator) values(ISBN,location,state,operator);
		SET i=i+1;
	end while;
    
    if t_error=1 then
		rollback;
	else
		commit;
	end if;
END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for return_book
-- ----------------------------
DROP PROCEDURE IF EXISTS `return_book`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `return_book`(in bor_id int)
BEGIN
	declare num int;
    declare bid int;
	declare n int;
    declare resid int;
    declare t_error integer default 0;
    declare continue handler for sqlexception set t_error=1;
    start transaction;
    
    select count(*) into n from borrow where borrow_id=bor_id and rtime is null;
    if n > 0 then
		select book_id into bid from borrow where borrow_id=bor_id;
		select count(*) into num from reservation where book_id=bid;
		if num > 0 then
			update borrow set rtime=now() where borrow_id=bor_id;
			update book set state=1 where book_id=bid;
            update reservation set deadline=now() where book_id=bid;
            select reservation_id into resid from reservation where book_id=bid;
            insert into reservation_arrived (reservation_id) values (resid);
		else
			update borrow set rtime=now() where borrow_id=bor_id;
			update book set state=0 where book_id=bid;
		end if;
	end if;
    
    if t_error=1 then
		rollback;
	else
		commit;
	end if;
END;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table book
-- ----------------------------
DROP TRIGGER IF EXISTS `book_AFTER_DELETE`;
delimiter ;;
CREATE TRIGGER `book_AFTER_DELETE` AFTER DELETE ON `book` FOR EACH ROW BEGIN
	UPDATE booklist SET number=number-1 WHERE ISBN=old.ISBN;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
