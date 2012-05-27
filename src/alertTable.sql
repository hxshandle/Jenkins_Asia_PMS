ALTER TABLE `phase` ADD COLUMN `parentPhase` INT(11) NULL DEFAULT -1  AFTER `valid` , ADD COLUMN `childPhase` INT(11) NULL DEFAULT -1  AFTER `parentPhase` ;
CREATE  TABLE `task_attachement` (  `ID` INT(11) NOT NULL ,  `taskId` INT(11) NOT NULL ,  `fileId` INT(11) NOT NULL ,  PRIMARY KEY (`ID`) )   ENGINE = MyISAM;
ALTER TABLE `task_attachement` CHANGE COLUMN `ID` `ID` INT(11) NOT NULL AUTO_INCREMENT  ;

drop table `quality`;
CREATE TABLE `quality` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `action_no` varchar(255) NOT NULL,
  `issue_date` datetime NOT NULL,
  `product_no` varchar(255) DEFAULT NULL,
  `product_desc` longtext,
  `ship_no` varchar(255) DEFAULT NULL,
  `lot_quantity` int(10) DEFAULT NULL,
  `Sample_size` int(10) DEFAULT NULL,
  `defects` int(11) DEFAULT NULL,
  `reject_rate` double DEFAULT '0',
  `quantity_in_inventory` varchar(255) DEFAULT NULL,
  `quantity_in_process` varchar(255) DEFAULT NULL,
  `containment_desc` longtext,
  `acknowledge_by` varchar(255) DEFAULT NULL,
  `acknowledge_date` datetime DEFAULT NULL,
  `verified_for_closure_by` varchar(255) DEFAULT NULL,
  `verification_date` datetime DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `project` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM;

CREATE TABLE `quality_details` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `quality` int(11) NOT NULL,
  `reject_desc` longtext,
  `quantity` varchar(255) DEFAULT NULL,
  `required_desc` longtext,
  `root_cause` longtext,
  `containment_action` longtext,
  `supplier_short_term_corrective_act` longtext,
  `shot_term_implementation_date` datetime DEFAULT NULL,
  `short_term_verified` int(1) DEFAULT NULL,
  `supplier_long_term_corrective_act` longtext,
  `long_term_implementation_date` datetime DEFAULT NULL,
  `vendor_process_audit_plan_revision` varchar(255) DEFAULT NULL,
  `long_term_verified` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM


drop table `order`;
 CREATE  TABLE IF NOT EXISTS `order` (
  `ID` INT(10) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `project` INT(10) NOT NULL,
  `customer_po_number` VARCHAR(255) ,
  `attachment1` VARCHAR(255), 
  `jenkins_po_number` VARCHAR(255),
  `attachment2` VARCHAR(255), 
  `factory` VARCHAR(255), 
  `terms` VARCHAR(255), 
  `account_payment` VARCHAR(255), 
  `customer_model_number` VARCHAR(255), 
  `customer_part_number` VARCHAR(255), 
  `jenkins_model_number` VARCHAR(255), 
  `jenkins_part_number` VARCHAR(255), 
  `payment_one_schedule` VARCHAR(255), 
  `payment_one_status` TINYINT(4),
  `payment_one_attachment`  VARCHAR(255),
  `payment_two_schedule` VARCHAR(255), 
  `payment_two_status` TINYINT(4),
  `payment_two_attachment`  VARCHAR(255),
  `payment_three_schedule` VARCHAR(255), 
  `payment_three_status` TINYINT(4),
  `payment_three_attachment`  VARCHAR(255),
  `final_total_amount_received` VARCHAR(255),
  `delivery_date_one` VARCHAR(255),
  `delivery_date_two` VARCHAR(255),
  `desc` TEXT NULL ,
  `submit_time` DATETIME NOT NULL ,
  `end_time` DATETIME NULL ,
  `status` INT(10) NOT NULL ,
  `valid` TINYINT(1) NOT NULL DEFAULT 1 ,
  `quantity` INT(10) NOT NULL DEFAULT 0 ,
  `inner_cost` INT(11)  ,
  `inner_cost_currency` VARCHAR(3) ,
  `external_cost` INT(11)  ,
  `external_cost_currency` VARCHAR(3) ,
  `published` TINYINT(4)  ,
  PRIMARY KEY (`ID`) )
ENGINE = MyISAM;


INSERT INTO `status` (`ID`,`type`,`value`) VALUES (36,'order1','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (37,'order1','delayed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (38,'order1','late');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (39,'order1','canceled');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (40,'order1','on_hold');