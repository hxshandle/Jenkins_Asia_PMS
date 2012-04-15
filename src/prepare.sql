/*
-- Query: select * from user
LIMIT 0, 1000

-- Date: 2012-04-07 12:29
*/

INSERT INTO `status` (`ID`,`type`,`value`) VALUES (1,'ECN','need_approve');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (2,'ECN','approved');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (3,'ECN','rejected');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (4,'project','need_approve');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (5,'project','approved');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (6,'project','rejected');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (7,'project','padding');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (8,'project','closed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (9,'project','planning');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (10,'project','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (11,'deliverable','not_start');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (12,'deliverable','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (13,'deliverable','closed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (14,'order','submitted');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (15,'order','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (16,'order','accepted');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (17,'order','rejected');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (18,'phase','not_start');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (19,'phase','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (20,'phase','completed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (21,'phase','closed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (22,'quality','not_start');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (23,'quality','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (24,'quality','closed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (25,'sampleRequest','need_approve');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (26,'sampleRequest','approved');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (27,'sampleRequest','rejected');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (28,'task','not_start');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (29,'task','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (30,'task','completed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (31,'task','closed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (32,'purchase','submitted');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (33,'purchase','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (34,'purchase','accepted');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (35,'purchase','rejected');

INSERT INTO `user` (`ID`,`name`,`full_name`,`title`,`role_type`,`email`,`tel1`,`tel2`,`pass`,`company`,`lastlogin`,`zip`,`gender`,`url`,`adress`,`adress2`,`state`,`country`,`tags`,`locale`,`avatar`,`rate`) VALUES (1,'sys_admin','','',1,'0','','','7656e41a7c6e7d9ea19740e1326389f0bff91441','','1333775848','','','','','','en','','0','','','0');
INSERT INTO `user` (`ID`,`name`,`full_name`,`title`,`role_type`,`email`,`tel1`,`tel2`,`pass`,`company`,`lastlogin`,`zip`,`gender`,`url`,`adress`,`adress2`,`state`,`country`,`tags`,`locale`,`avatar`,`rate`) VALUES (2,'mgrLv1','Manage Lv1','1@126.com',3,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','1333775227','','','','','','en','','','','','0');
INSERT INTO `user` (`ID`,`name`,`full_name`,`title`,`role_type`,`email`,`tel1`,`tel2`,`pass`,`company`,`lastlogin`,`zip`,`gender`,`url`,`adress`,`adress2`,`state`,`country`,`tags`,`locale`,`avatar`,`rate`) VALUES (3,'mgrLv2','Supplier LV2','2@126.com',4,'21@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','1333775249','','','','','','en','','','','','0');
INSERT INTO `user` (`ID`,`name`,`full_name`,`title`,`role_type`,`email`,`tel1`,`tel2`,`pass`,`company`,`lastlogin`,`zip`,`gender`,`url`,`adress`,`adress2`,`state`,`country`,`tags`,`locale`,`avatar`,`rate`) VALUES (4,'customerLv1','Customer Lv 1','1@126.com',6,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','','','','','','','en','','','','','0');
INSERT INTO `user` (`ID`,`name`,`full_name`,`title`,`role_type`,`email`,`tel1`,`tel2`,`pass`,`company`,`lastlogin`,`zip`,`gender`,`url`,`adress`,`adress2`,`state`,`country`,`tags`,`locale`,`avatar`,`rate`) VALUES (5,'customerLv2','Customer Lv 2','1@126.com',7,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','','','','','','','en','','','','','0');
INSERT INTO `user` (`ID`,`name`,`full_name`,`title`,`role_type`,`email`,`tel1`,`tel2`,`pass`,`company`,`lastlogin`,`zip`,`gender`,`url`,`adress`,`adress2`,`state`,`country`,`tags`,`locale`,`avatar`,`rate`) VALUES (6,'supplierLv1','Supplier LV1','1@126.com',8,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','','','','','','','en','','','','','0');
INSERT INTO `user` (`ID`,`name`,`full_name`,`title`,`role_type`,`email`,`tel1`,`tel2`,`pass`,`company`,`lastlogin`,`zip`,`gender`,`url`,`adress`,`adress2`,`state`,`country`,`tags`,`locale`,`avatar`,`rate`) VALUES (7,'supplierLv2','Supplier LV2','1@126.com',9,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','','','','','','','en','','','','','0');
INSERT INTO `user` (`ID`,`name`,`full_name`,`title`,`role_type`,`email`,`tel1`,`tel2`,`pass`,`company`,`lastlogin`,`zip`,`gender`,`url`,`adress`,`adress2`,`state`,`country`,`tags`,`locale`,`avatar`,`rate`) VALUES (8,'admin','Administrator','1@126.com',2,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','','','','','','','en','','','','','0');
INSERT INTO `user` (`ID`,`name`,`full_name`,`title`,`role_type`,`email`,`tel1`,`tel2`,`pass`,`company`,`lastlogin`,`zip`,`gender`,`url`,`adress`,`adress2`,`state`,`country`,`tags`,`locale`,`avatar`,`rate`) VALUES (9,'emp1','Employee 1','1@126.com',5,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','','','','','','','en','','','','','0');
INSERT INTO `user` (`ID`,`name`,`full_name`,`title`,`role_type`,`email`,`tel1`,`tel2`,`pass`,`company`,`lastlogin`,`zip`,`gender`,`url`,`adress`,`adress2`,`state`,`country`,`tags`,`locale`,`avatar`,`rate`) VALUES (10,'emp2','Employee 2','1@126.com',5,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','','','','','','','en','','','','','0');
INSERT INTO `user` (`ID`,`name`,`full_name`,`title`,`role_type`,`email`,`tel1`,`tel2`,`pass`,`company`,`lastlogin`,`zip`,`gender`,`url`,`adress`,`adress2`,`state`,`country`,`tags`,`locale`,`avatar`,`rate`) VALUES (11,'emp3','Employee 3','1@126.com',5,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','','','','','','','en','','','','','0');
INSERT INTO `roles` (`ID`,`name`,`projects`,`tasks`,`milestones`,`messages`,`files`,`chat`,`timetracker`,`admin`) VALUES (1,'Admin','a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}','a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}','a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}','a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}','a:3:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;}','a:1:{s:3:"add";i:1;}','a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:4:"read";i:1;}','a:1:{s:3:"add";i:1;}');


INSERT INTO `roles_assigned` (`ID`,`user`,`role`) VALUES (1,1,1);
INSERT INTO `roles_assigned` (`ID`,`user`,`role`) VALUES (2,2,1);
INSERT INTO `roles_assigned` (`ID`,`user`,`role`) VALUES (3,3,1);
INSERT INTO `roles_assigned` (`ID`,`user`,`role`) VALUES (4,4,1);
INSERT INTO `roles_assigned` (`ID`,`user`,`role`) VALUES (5,5,1);
INSERT INTO `roles_assigned` (`ID`,`user`,`role`) VALUES (6,6,1);
INSERT INTO `roles_assigned` (`ID`,`user`,`role`) VALUES (7,7,1);
INSERT INTO `roles_assigned` (`ID`,`user`,`role`) VALUES (8,8,1);
INSERT INTO `roles_assigned` (`ID`,`user`,`role`) VALUES (9,9,1);
INSERT INTO `roles_assigned` (`ID`,`user`,`role`) VALUES (10,10,1);
INSERT INTO `roles_assigned` (`ID`,`user`,`role`) VALUES (11,11,1);

