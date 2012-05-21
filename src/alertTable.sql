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

CREATE  TABLE `quality_details` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `quality` INT(11) NOT NULL ,
  `reject_desc` LONGTEXT NULL ,
  `quantity` VARCHAR(255) NULL ,
  `required_desc` LONGTEXT NULL ,
  `root_cause` LONGTEXT NULL ,
  `containment_action` VARCHAR(255) NULL ,
  `supplier_short_term_corrective_act` LONGTEXT NULL ,
  `shot_term_implementation_date` DATETIME NULL ,
  `short_term_verified` INT(1) NULL ,
  `supplier_long_term_corrective_act` LONGTEXT NULL ,
  `long_term_implementation_date` DATETIME NULL ,
  `vendor_process_audit_plan_revision` VARCHAR(255) NULL ,
  `long_term_verified` INT(1) NULL ,
  PRIMARY KEY (`ID`) )
ENGINE = MyISAM;

