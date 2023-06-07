-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema grocery_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema grocery_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `grocery_store` DEFAULT CHARACTER SET utf8 ;
USE `grocery_store` ;

-- -----------------------------------------------------
-- Table `grocery_store`.`Retail_store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grocery_store`.`Retail_store` (
  `item_id` VARCHAR(45) NOT NULL,
  `product_id` VARCHAR(45) NOT NULL,
  `product_type` VARCHAR(45) NOT NULL,
  `product_description` VARCHAR(45) NOT NULL,
  `product_unit` INT NOT NULL,
  `stock_available` INT NOT NULL,
  `newest_cost` INT NOT NULL,
  `newest_sellprice` INT NOT NULL,
  `last_update` DATETIME NOT NULL,
  PRIMARY KEY (`item_id`),
  INDEX `sell_price_indx` (`newest_sellprice` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grocery_store`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grocery_store`.`Employee` (
  `employee_id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone_number` INT NOT NULL,
  `account` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `privilege` TINYINT NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grocery_store`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grocery_store`.`Supplier` (
  `sup_id` VARCHAR(45) NOT NULL,
  `sup_name` VARCHAR(45) NULL,
  `sup_location` VARCHAR(45) NULL,
  `sup_hotline` INT NULL,
  PRIMARY KEY (`sup_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grocery_store`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grocery_store`.`Order` (
  `order_id` VARCHAR(45) NOT NULL,
  `total_price` INT NOT NULL,
  `supplier` VARCHAR(45) NOT NULL,
  `buyer_id` VARCHAR(45) NOT NULL,
  `receiver_id` VARCHAR(45) NOT NULL,
  `order_date` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `supplier_indx_idx` (`supplier` ASC) VISIBLE,
  INDEX `buyer_idx` (`buyer_id` ASC) INVISIBLE,
  INDEX `receiver_idx` (`receiver_id` ASC) INVISIBLE,
  CONSTRAINT `supplier_indx`
    FOREIGN KEY (`supplier`)
    REFERENCES `grocery_store`.`Supplier` (`sup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `buyer`
    FOREIGN KEY (`buyer_id`)
    REFERENCES `grocery_store`.`Employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `receiver`
    FOREIGN KEY (`receiver_id`)
    REFERENCES `grocery_store`.`Employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grocery_store`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grocery_store`.`Customer` (
  `customer_id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `member_rank` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grocery_store`.`Receipt_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grocery_store`.`Receipt_detail` (
  `receipt_id` VARCHAR(45) NOT NULL,
  `item_id` VARCHAR(45) NOT NULL,
  `item_price` INT NOT NULL,
  `item_quantity` INT NOT NULL,
  PRIMARY KEY (`receipt_id`, `item_id`),
  INDEX `item_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `item`
    FOREIGN KEY (`item_id`)
    REFERENCES `grocery_store`.`Retail_store` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grocery_store`.`Receipt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grocery_store`.`Receipt` (
  `receipt_id` VARCHAR(45) NOT NULL,
  `customer` VARCHAR(45) NOT NULL,
  `total_payment` INT NOT NULL,
  `cashier` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`receipt_id`),
  INDEX `customer_idx` (`customer` ASC) VISIBLE,
  INDEX `cashier_idx` (`cashier` ASC) VISIBLE,
  CONSTRAINT `customer`
    FOREIGN KEY (`customer`)
    REFERENCES `grocery_store`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cashier`
    FOREIGN KEY (`cashier`)
    REFERENCES `grocery_store`.`Employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `receipt_item`
    FOREIGN KEY (`receipt_id`)
    REFERENCES `grocery_store`.`Receipt_detail` (`receipt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grocery_store`.`Order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grocery_store`.`Order_detail` (
  `order_id` VARCHAR(45) NOT NULL,
  `item_id` VARCHAR(45) NOT NULL,
  `item_price` INT NOT NULL,
  `item_quantity` INT NOT NULL,
  PRIMARY KEY (`order_id`, `item_id`),
  INDEX `item_avail_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `item_avail`
    FOREIGN KEY (`item_id`)
    REFERENCES `grocery_store`.`Retail_store` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_detail`
    FOREIGN KEY (`order_id`)
    REFERENCES `grocery_store`.`Order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
