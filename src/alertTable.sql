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
  `delivery_status_one` int(10) DEFAULT -1,
  `delivery_status_two` int(10) DEFAULT -1,
  PRIMARY KEY (`ID`) )
ENGINE = MyISAM;


INSERT INTO `status` (`ID`,`type`,`value`) VALUES (36,'order1','in_progress');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (37,'order1','delayed');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (38,'order1','late');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (39,'order1','canceled');
INSERT INTO `status` (`ID`,`type`,`value`) VALUES (40,'order1','on_hold');



CREATE  TABLE `quality_details_attached` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `details_id` INT(11) NOT NULL ,
  `file_id` INT(11) NOT NULL ,
  PRIMARY KEY (`ID`) )
ENGINE = MyISAM;


ALTER TABLE `projekte` ADD COLUMN `project_no` VARCHAR(255) NULL  AFTER `name` , ADD COLUMN `real_end_date` DATETIME NULL  AFTER `end_date` ;

ALTER TABLE `tasks` ADD COLUMN `status_update` LONGTEXT NULL  AFTER `status` ;



CREATE  TABLE `task_distribution` (
  `ID` INT(10) NOT NULL AUTO_INCREMENT ,
  `task_id` INT(10) NOT NULL ,
  `user_id` INT(10) NOT NULL ,
  PRIMARY KEY (`ID`) ,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = MyISAM;;



CREATE TABLE `document_info` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `description` text,
  `file` int(10) NOT NULL,
  `project` int(10) DEFAULT NULL,
  `task` int(10) DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `visibility` varchar(45) DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM;


----------for order ------------

CREATE  TABLE `order_attached` (
  `ID` INT(10) NOT NULL AUTO_INCREMENT ,
  `orderId` INT(10) NOT NULL ,
  `fileId` INT(10) NOT NULL ,
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`) )ENGINE=MyISAM;



ALTER TABLE `quality` ADD COLUMN `order` INT(10) NULL DEFAULT -1  AFTER `project` ;

ALTER TABLE `engineering_change_note` ADD COLUMN `order` INT(10) NULL  AFTER `deliverable` , ADD COLUMN `quality` INT(10) NULL  AFTER `order` ;

ALTER TABLE `document_info` ADD COLUMN `ecn` INT(10) NULL DEFAULT -1  AFTER `insert_date` ;


CREATE  TABLE `order_qualitys` (
  `ID` INT(10) NOT NULL AUTO_INCREMENT ,
  `orderId` INT(10) NOT NULL ,
  `qualityId` INT(10) NOT NULL ,
  `isFinish` INT(1) NOT NULL DEFAULT -1 ,
  PRIMARY KEY (`ID`) )ENGINE=MyISAM;


CREATE  TABLE `order_ecn` (
  `ID` INT(10) NOT NULL AUTO_INCREMENT ,
  `orderId` INT(10) NOT NULL ,
  `ecnId` INT(10) NOT NULL ,
  `isFinished` INT(1) NOT NULL DEFAULT -1 ,
  PRIMARY KEY (`ID`) )ENGINE=MyISAM;


ALTER TABLE `order` ADD COLUMN `waiverDesc` LONGTEXT NULL  AFTER `delivery_status_two` , ADD COLUMN `isFulfilled` INT(1) NULL DEFAULT -1  AFTER `waiverDesc` ;


CREATE  TABLE `order_compliance` (
  `ID` INT(10) NOT NULL AUTO_INCREMENT ,
  `orderId` VARCHAR(45) NOT NULL ,
  `complianceType` VARCHAR(255) NOT NULL ,
  `complianceField` LONGTEXT NULL ,
  PRIMARY KEY (`ID`) )ENGINE=MyISAM;


CREATE  TABLE `quality_notify` (
  `ID` INT(10) NOT NULL AUTO_INCREMENT ,
  `qualityId` INT(10) NOT NULL ,
  `userId` INT(10) NOT NULL ,
  PRIMARY KEY (`ID`) )ENGINE=MyISAM;


ALTER TABLE `order_compliance` ADD COLUMN `isFinished` INT(1) NOT NULL DEFAULT -1  AFTER `complianceField` ;

ALTER TABLE `document_info` ADD COLUMN `document_no` VARCHAR(255) NULL  AFTER `name` ;


CREATE  TABLE `finance2` (
  `ID` INT(10) NOT NULL AUTO_INCREMENT ,
  `project` INT(10) NOT NULL ,
  `incoming_payment_amount` INT(11) NULL ,
  `incoming_payment_amount_currency` VARCHAR(3) NULL DEFAULT 'RMB' ,
  `customer_source` VARCHAR(255) NULL ,
  `outgoing_payment_amount` INT(11) NULL ,
  `outgoing_payment_amount_currency` VARCHAR(3) NULL DEFAULT 'RMB' ,
  `beneficiary` LONGTEXT NULL ,
  `project_number` VARCHAR(255) NULL ,
  `PO_number` VARCHAR(255) NULL ,
  `invoice_number` VARCHAR(255) NULL ,
  `reason` LONGTEXT NULL ,
  `planned_incoming_payment_date` DATETIME NULL ,
  `actual_incoming_payment_date` DATETIME NULL ,
  `difference1` VARCHAR(255) NULL ,
  `incoming_payment_status` INT(10) NULL ,
  `actual_incoming_payment_amount_received` INT(11) NULL ,
  `planned_outgoing_payment_date` DATETIME NULL ,
  `actual_outgoing_payment_date` DATETIME NULL ,
  `difference2` VARCHAR(255) NULL ,
  `outgoing_payment_status` INT(10) NULL ,
  `actual_outgoing_payment_amount_paid` INT(11) NULL ,
  PRIMARY KEY (`ID`) );


ALTER TABLE `quality` ADD COLUMN `quality_no` VARCHAR(255) NULL  AFTER `action_no` ;

INSERT INTO `status` (`type`,`value`) VALUES ('finance','deplay');
INSERT INTO `status` (`type`,`value`) VALUES ('finance','paied');
INSERT INTO `status` (`type`,`value`) VALUES ('finance','not_paied');

ALTER TABLE `quality` ADD COLUMN `status_update` LONGTEXT NULL  AFTER `ship_no` ;



INSERT INTO `status`( `type`, `value`) VALUES ('qualityDetails','New');

INSERT INTO `status`( `type`, `value`) VALUES ('qualityDetails','Open');

INSERT INTO `status`( `type`, `value`) VALUES ('qualityDetails','Closed');

ALTER TABLE `quality_details` ADD COLUMN `status` INT NOT NULL DEFAULT -1  AFTER `quality` ;


CREATE  TABLE `cost` (
  `ID` INT(10) NOT NULL AUTO_INCREMENT ,
  `project` int(11) not null,
  `project_no` VARCHAR(255) NOT NULL ,
  `customer_model_number` VARCHAR(255) NULL ,
  `jenkins_model_number` INT(11) NULL ,
  `customer_assembly_number` VARCHAR(255) NULL ,
  `customer_parent_assembly_number` VARCHAR(255) NULL ,
  `jenkins_assembly_number` VARCHAR(255) NULL ,
  `jenkins_parent_assembly_number` VARCHAR(255) NULL ,
  `customer_part_number` VARCHAR(255) NULL ,
  `jenkins_part_number` VARCHAR(255) NULL ,
  `customer_drawing_number` VARCHAR(255) NULL ,
  `revision1` VARCHAR(255) NULL ,
  `jenkins_drawing_number` INT(11) NULL ,
  `revision2` VARCHAR(255) NULL ,
  `internal_budgetary_price` DOUBLE NULL ,
  `external_budgetary_price` DOUBLE NULL ,
  `internal_alpha_price` DOUBLE NULL ,
  `external_alpha_price` DOUBLE NULL ,
  `internal_beta_price` DOUBLE NULL ,
  `external_beta_price` DOUBLE NULL ,
  `internal_final_price` DOUBLE NULL ,
  `quantity_per_product` DOUBLE NULL ,
  `currency` VARCHAR(3) NULL DEFAULT 'RMB',
  `valid` INT(1) NULL DEFAULT '1',
  PRIMARY KEY (`ID`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;



CREATE  TABLE `internal_price_breakdown` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `cost` INT(11) NOT NULL,
  `project_no` VARCHAR(255) NULL ,
  `customer_model_number` VARCHAR(255) NULL ,
  `jenkins_model_number` INT(11) NULL ,
  `customer_assembly_number` VARCHAR(255) NULL ,
  `jenkins_assembly_number` VARCHAR(255) NULL ,
  `customer_part_number` VARCHAR(255) NULL ,
  `jenkins_part_number` VARCHAR(255) NULL ,
  `customer_drawing_number` VARCHAR(255) NULL ,
  `revision1` VARCHAR(255) NULL ,
  `jenkins_drawing_number` INT(11) NULL ,
  `revision2` VARCHAR(255) NULL ,
  `material` DOUBLE NULL ,
  `additional_material_specification` VARCHAR(45) NULL ,
  `finish` TIMESTAMP NULL ,
  `material_cost` DOUBLE NULL ,
  `assembly_cost` DOUBLE NULL ,
  `overhead` DOUBLE NULL ,
  `factory_profit` DOUBLE NULL ,
  `tax` DOUBLE NULL ,
  `customs` DOUBLE NULL ,
  `freight` DOUBLE NULL ,
  `handling` DOUBLE NULL ,
  `internal_budgetary_price` DOUBLE NULL ,
  `currency` VARCHAR(3) NULL DEFAULT 'RMB' ,
  `valid` INT(1) NULL DEFAULT '1',
  PRIMARY KEY (`ID`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


CREATE  TABLE `external_price_breakdown` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `cost` INT(11) NOT NULL,
  `project_no` VARCHAR(255) NULL ,
  `customer_model_number` VARCHAR(255) NULL ,
  `jenkins_model_number` INT(11) NULL ,
  `customer_assembly_number` VARCHAR(255) NULL ,
  `jenkins_assembly_number` VARCHAR(255) NULL ,
  `customer_part_number` VARCHAR(255) NULL ,
  `jenkins_part_number` VARCHAR(255) NULL ,
  `customer_drawing_number` VARCHAR(255) NULL ,
  `revision1` VARCHAR(255) NULL ,
  `jenkins_drawing_number` INT(11) NULL ,
  `revision2` VARCHAR(255) NULL ,
  `material` DOUBLE NULL ,
  `additional_material_specification` VARCHAR(45) NULL ,
  `finish` TIMESTAMP NULL ,
  `material_cost` DOUBLE NULL ,
  `assembly_cost` DOUBLE NULL ,
  `overhead` DOUBLE NULL ,
  `factory_profit` DOUBLE NULL ,
  `tax` DOUBLE NULL ,
  `customs` DOUBLE NULL ,
  `freight` DOUBLE NULL ,
  `handling` DOUBLE NULL ,
  `internal_budgetary_price` DOUBLE NULL ,
  `currency` VARCHAR(3) NULL DEFAULT 'RMB' ,
  `approved` INT(1) NULL DEFAULT '0',
  `Published` INT(1) NULL DEFAULT '0',
  `valid` INT(1) NULL DEFAULT '1',
  PRIMARY KEY (`ID`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


ALTER TABLE `cost` 
  ADD COLUMN `internal_budgetary_price_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `internal_budgetary_price` ,
  ADD COLUMN `external_budgetary_price_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `external_budgetary_price` ,  
  ADD COLUMN `internal_alpha_price_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `internal_alpha_price` , 
  ADD COLUMN `external_alpha_price_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `external_alpha_price` , 
  ADD COLUMN `internal_beta_price_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `internal_beta_price` , 
  ADD COLUMN `external_beta_price_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `external_beta_price` , 
  ADD COLUMN `internal_final_price_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `internal_final_price` , 
  ADD COLUMN `external_final_price_currency` VARCHAR(3) NULL DEFAULT 'RMB'   AFTER `internal_final_price` , 
  ADD COLUMN `external_final_price` DOUBLE NULL  AFTER `internal_final_price` ;


ALTER TABLE `internal_price_breakdown` 
  ADD COLUMN `assembly_cost_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `assembly_cost`,
  ADD COLUMN `overhead_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `overhead`,
  ADD COLUMN `factory_profit_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `factory_profit`,
  ADD COLUMN `tax_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `tax`,
  ADD COLUMN `customs_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `customs`,
  ADD COLUMN `freight_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `freight`,
  ADD COLUMN `handling_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `handling`,
  ADD COLUMN `internal_budgetary_price_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `internal_budgetary_price`,

  CHANGE COLUMN `material` `material` TEXT NULL DEFAULT NULL, 
  ADD COLUMN `material_cost_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `material_cost` ;


ALTER TABLE `external_price_breakdown` 
  ADD COLUMN `assembly_cost_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `assembly_cost`,
  ADD COLUMN `overhead_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `overhead`,
  ADD COLUMN `factory_profit_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `factory_profit`,
  ADD COLUMN `tax_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `tax`,
  ADD COLUMN `customs_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `customs`,
  ADD COLUMN `freight_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `freight`,
  ADD COLUMN `handling_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `handling`,
  ADD COLUMN `internal_budgetary_price_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `internal_budgetary_price`,
  ADD COLUMN `material_cost_currency` VARCHAR(3) NULL DEFAULT 'RMB'  AFTER `material_cost` ;


  ALTER TABLE `cost` ADD COLUMN `description` LONGTEXT NULL  AFTER `project_no` ;

  ALTER TABLE `sample` ADD COLUMN `document_info_id` INT(10) NULL  AFTER `valid` ;

  ALTER TABLE  `sample` CHANGE  `document_info_id`  `datei` TEXT NULL DEFAULT NULL;

  ALTER TABLE `tasks` ADD COLUMN `created_by` INT(10);


  CREATE TABLE document_info_notify
(
    ID INT(11) AUTO_INCREMENT NOT NULL,
    document_info_id INT(11) NOT NULL,
    user_id INT(11) NOT NULL,
    PRIMARY KEY (`ID`)
)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;



  CREATE TABLE audit_trail
(
    `ID` INT(11) AUTO_INCREMENT NOT NULL,
    `table_name` varchar(255) NOT NULL,
    `ref_id` INT(11) NOT NULL,
    `user_id` INT(11) NOT NULL,
    `action` varchar(255) NOT NULL,
    `comments` longtext,
    `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`ID`)
)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

INSERT INTO `status`( `type`, `value`) VALUES ('task','delayed');
