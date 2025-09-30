-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `emp_id` INT NOT NULL AUTO_INCREMENT,
  `f_name` VARCHAR(20) NULL,
  `l_name` VARCHAR(20) NULL,
  `role` VARCHAR(20) NULL,
  `email` VARCHAR(50) NULL,
  PRIMARY KEY (`emp_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Finance Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Finance Department` (
  `contract_id` INT NOT NULL AUTO_INCREMENT,
  `cust_score` INT NULL,
  `i_rate` DECIMAL(4,2) NULL,
  `loan_term` INT NULL,
  `mnth_pymt` DECIMAL(7,2) NULL,
  `cust_id` INT NULL,
  `emp_id` INT NULL,
  `sales_ID` INT NULL,
  PRIMARY KEY (`contract_id`),
  INDEX `cust_ID_idx` (`cust_id` ASC) VISIBLE,
  INDEX `emp_ID_idx` (`emp_id` ASC) VISIBLE,
  INDEX `sales_ID_idx` (`sales_ID` ASC) VISIBLE,
  INDEX `cust_score_idx` (`cust_score` ASC) VISIBLE,
  CONSTRAINT `cust_ID`
    FOREIGN KEY (`cust_id`)
    REFERENCES `mydb`.`Customer` (`cust_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `emp_ID`
    FOREIGN KEY (`emp_id`)
    REFERENCES `mydb`.`Staff` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sales_ID`
    FOREIGN KEY (`sales_ID`)
    REFERENCES `mydb`.`Sales` (`sales_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `cust_id` INT NOT NULL AUTO_INCREMENT,
  `cust_fname` VARCHAR(20) NULL,
  `cust_lname` VARCHAR(20) NULL,
  `DOB` DATE NULL,
  `address` VARCHAR(45) NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(45) NULL,
  `cust_id` INT NULL,
  `cust_score` INT NULL,
  PRIMARY KEY (`cust_id`),
  INDEX `contract_ID_idx` (`cust_id` ASC) VISIBLE,
  INDEX `cust_score_idx` (`cust_score` ASC) INVISIBLE,
  CONSTRAINT `contract_ID`
    FOREIGN KEY (`cust_id`)
    REFERENCES `mydb`.`Finance Department` (`contract_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cust_score`
    FOREIGN KEY (`cust_score`)
    REFERENCES `mydb`.`Finance Department` (`cust_score`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehicle` (
  `VIN` CHAR(17) NOT NULL,
  `year` YEAR(4) NULL,
  `make` VARCHAR(20) NULL,
  `model` VARCHAR(20) NULL,
  `color` VARCHAR(10) NULL,
  `mileage` INT NULL,
  `eng_type` VARCHAR(20) NULL,
  `body_style` VARCHAR(20) NULL,
  `sale_price` INT NULL,
  `status` VARCHAR(20) NULL,
  PRIMARY KEY (`VIN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sales` (
  `sales_id` INT NOT NULL AUTO_INCREMENT,
  `sale_date` DATE NULL,
  `sale_type` VARCHAR(10) NULL,
  `cust_id` INT NULL,
  `emp_id` INT NULL,
  `VIN` VARCHAR(17) NULL,
  PRIMARY KEY (`sales_id`),
  INDEX `fk_cust_ID_idx` (`cust_id` ASC) VISIBLE,
  INDEX `emp_ID_idx` (`emp_id` ASC) VISIBLE,
  INDEX `VIN_idx` (`VIN` ASC) VISIBLE,
  CONSTRAINT `cust_ID`
    FOREIGN KEY (`cust_id`)
    REFERENCES `mydb`.`Customer` (`cust_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `emp_ID`
    FOREIGN KEY (`emp_id`)
    REFERENCES `mydb`.`Staff` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VIN`
    FOREIGN KEY (`VIN`)
    REFERENCES `mydb`.`Vehicle` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
