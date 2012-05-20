ALTER TABLE `phase` ADD COLUMN `parentPhase` INT(11) NULL DEFAULT -1  AFTER `valid` , ADD COLUMN `childPhase` INT(11) NULL DEFAULT -1  AFTER `parentPhase` ;
CREATE  TABLE `task_attachement` (  `ID` INT(11) NOT NULL ,  `taskId` INT(11) NOT NULL ,  `fileId` INT(11) NOT NULL ,  PRIMARY KEY (`ID`) )   ENGINE = MyISAM;
ALTER TABLE `task_attachement` CHANGE COLUMN `ID` `ID` INT(11) NOT NULL AUTO_INCREMENT  ;

drop table `quality`;
CREATE  TABLE `quality` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `action_no` VARCHAR(255) NOT NULL ,
  `issue_date` DATETIME NOT NULL ,
  `product_no` VARCHAR(255) NULL ,
  `product_desc` LONGTEXT NULL ,
  `ship_no` VARCHAR(255) NULL ,
  `lot_quantity` INT(10) NULL ,
  `Sample_size` INT(10) NULL ,
  `defects` INT NULL ,
  `reject_rate` DOUBLE NULL DEFAULT 0 ,
  `quantity_in_inventory` VARCHAR(255) NULL ,
  `quantity_in_process` VARCHAR(255) NULL ,
  `containment_desc` LONGTEXT NULL ,
  `acknowledge_by` VARCHAR(255) NULL ,
  `acknowledge_date` DATETIME NULL ,
  `verified_for_closure_by` VARCHAR(255) NULL ,
  `verification_date` DATETIME NULL ,
  PRIMARY KEY (`ID`) );
ALTER TABLE `quality` ADD COLUMN `valid` TINYINT(1) NULL  AFTER `verification_date` ;
ALTER TABLE `quality` CHANGE COLUMN `valid` `valid` TINYINT(1) NOT NULL DEFAULT 1  ;
ALTER TABLE `quality` ADD COLUMN `project` INT(11) NOT NULL  AFTER `valid` ;

