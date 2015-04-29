-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema final_proj
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `Item_Types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Item_Types` (
  `type_id` INT NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `type_id_UNIQUE` ON `Item_Types` (`type_id` ASC);


-- -----------------------------------------------------
-- Table `Parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Parts` (
  `part_id` INT NOT NULL AUTO_INCREMENT,
  `type_id` INT NOT NULL,
  `name_modifier` VARCHAR(45) NOT NULL,
  `name_position` INT NOT NULL,
  `stat_modified` VARCHAR(45) NOT NULL,
  `stat_modifier` INT NOT NULL,
  `rarity` INT NOT NULL,
  `level_required` INT NOT NULL,
  PRIMARY KEY (`part_id`),
  CONSTRAINT `fk_Parts_Item_Types1`
    FOREIGN KEY (`type_id`)
    REFERENCES `Item_Types` (`type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `part_id_UNIQUE` ON `Parts` (`part_id` ASC);

CREATE INDEX `fk_Parts_Item_Types1_idx` ON `Parts` (`type_id` ASC);


-- -----------------------------------------------------
-- Table `Equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipment` (
  `equipment_id` INT NOT NULL,
  `part_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `used_by_player` TINYINT(1) NOT NULL,
  PRIMARY KEY (`equipment_id`, `part_id`),
  CONSTRAINT `fk_Equipment_Parts1`
    FOREIGN KEY (`part_id`)
    REFERENCES `Parts` (`part_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipment_Item_Types1`
    FOREIGN KEY (`type_id`)
    REFERENCES `Item_Types` (`type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `equipment_id_UNIQUE` ON `Equipment` (`equipment_id` ASC);

CREATE INDEX `fk_Equipment_Parts1_idx` ON `Equipment` (`part_id` ASC);

CREATE INDEX `fk_Equipment_Item_Types1_idx` ON `Equipment` (`type_id` ASC);


-- -----------------------------------------------------
-- Table `Players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Players` (
  `player_id` INT NOT NULL,
  `equipped_item_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `exp_until_lvlup` INT NOT NULL,
  `battles_left` INT NOT NULL,
  PRIMARY KEY (`player_id`, `equipped_item_id`),
  CONSTRAINT `fk_Players_Equipment`
    FOREIGN KEY (`equipped_item_id`)
    REFERENCES `Equipment` (`equipment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Players_Equipment_idx` ON `Players` (`equipped_item_id` ASC);


-- -----------------------------------------------------
-- Table `Monsters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Monsters` (
  `monster_id` INT NOT NULL AUTO_INCREMENT,
  `monster_modifier` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`monster_id`, `monster_modifier`),
  CONSTRAINT `fk_Monsters_Parts1`
    FOREIGN KEY (`monster_modifier`)
    REFERENCES `Parts` (`part_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Monsters_Parts1_idx` ON `Monsters` (`monster_modifier` ASC);


-- -----------------------------------------------------
-- Table `Battleground`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Battleground` (
  `player_id` INT NOT NULL,
  `monster_id` INT NOT NULL,
  `equipment_reward_1` INT NULL,
  `equipment_reward_2` INT NULL,
  `exp_reward` INT NOT NULL,
  `battle_won` TINYINT(1) NOT NULL,
  PRIMARY KEY (`player_id`, `monster_id`),
  CONSTRAINT `fk_Battleground_Players1`
    FOREIGN KEY (`player_id`)
    REFERENCES `Players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Battleground_Monsters1`
    FOREIGN KEY (`monster_id`)
    REFERENCES `Monsters` (`monster_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Battleground_Equipment1`
    FOREIGN KEY (`equipment_reward_1`)
    REFERENCES `Equipment` (`equipment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Battleground_Equipment2`
    FOREIGN KEY (`equipment_reward_2`)
    REFERENCES `Equipment` (`equipment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Battleground_Monsters1_idx` ON `Battleground` (`monster_id` ASC);

CREATE INDEX `fk_Battleground_Equipment1_idx` ON `Battleground` (`equipment_reward_1` ASC);

CREATE INDEX `fk_Battleground_Equipment2_idx` ON `Battleground` (`equipment_reward_2` ASC);


-- -----------------------------------------------------
-- Table `Attribute_Sets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Attribute_Sets` (
  `attributes_id` INT NOT NULL AUTO_INCREMENT,
  `player_id` INT NULL,
  `monster_id` INT NULL,
  `hit_points` INT NOT NULL,
  `defense_points` INT NOT NULL,
  `strength` INT NOT NULL,
  `dodge_chance` INT NOT NULL,
  `level` INT NOT NULL,
  PRIMARY KEY (`attributes_id`),
  CONSTRAINT `fk_Attribute_Sets_Players1`
    FOREIGN KEY (`player_id`)
    REFERENCES `Players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attribute_Sets_Monsters1`
    FOREIGN KEY (`monster_id`)
    REFERENCES `Monsters` (`monster_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Attribute_Sets_Players1_idx` ON `Attribute_Sets` (`player_id` ASC);

CREATE INDEX `fk_Attribute_Sets_Monsters1_idx` ON `Attribute_Sets` (`monster_id` ASC);

CREATE UNIQUE INDEX `attributes_id_UNIQUE` ON `Attribute_Sets` (`attributes_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
