/*
-- Query: SELECT * FROM jenkins_asia_prod.status
LIMIT 0, 1000

-- Date: 2012-05-27 14:03
*/
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (26,'sampleRequest','approved');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (25,'sampleRequest','need_approve');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (24,'quality','closed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (23,'quality','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (22,'quality','not_start');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (21,'phase','closed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (20,'phase','completed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (19,'phase','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (18,'phase','not_start');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (17,'order','rejected');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (16,'order','accepted');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (15,'order','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (14,'order','submitted');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (13,'deliverable','closed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (12,'deliverable','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (11,'deliverable','not_start');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (10,'project','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (9,'project','planning');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (8,'project','closed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (7,'project','padding');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (6,'project','rejected');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (5,'project','approved');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (4,'project','need_approve');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (3,'ECN','rejected');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (2,'ECN','approved');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (1,'ECN','need_approve');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (27,'sampleRequest','rejected');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (28,'task','not_start');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (29,'task','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (30,'task','completed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (31,'task','closed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (32,'purchase','submitted');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (33,'purchase','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (34,'purchase','accepted');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (35,'purchase','rejected');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (36,'order1','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (37,'order1','delayed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (38,'order1','late');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (39,'order1','canceled');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (40,'order1','on_hold');
