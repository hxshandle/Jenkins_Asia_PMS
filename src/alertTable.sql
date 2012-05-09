ALTER TABLE `phase` ADD COLUMN `parentPhase` INT(11) NULL DEFAULT -1  AFTER `valid` , ADD COLUMN `childPhase` INT(11) NULL DEFAULT -1  AFTER `parentPhase` ;
CREATE  TABLE `task_attachement` (  `ID` INT(11) NOT NULL ,  `taskId` INT(11) NOT NULL ,  `fileId` INT(11) NOT NULL ,  PRIMARY KEY (`ID`) )   ENGINE = MyISAM;
ALTER TABLE `task_attachement` CHANGE COLUMN `ID` `ID` INT(11) NOT NULL AUTO_INCREMENT  ;

