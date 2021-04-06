-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema NBA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema NBA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `NBA` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema nba
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema nba
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nba` DEFAULT CHARACTER SET utf8 ;
USE `NBA` ;

-- -----------------------------------------------------
-- Table `NBA`.`arenas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NBA`.`arenas` (
  `name` VARCHAR(30) NOT NULL,
  `location` VARCHAR(30) NOT NULL,
  `capacity` INT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NBA`.`teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NBA`.`teams` (
  `team_name` VARCHAR(30) NOT NULL,
  `division` VARCHAR(30) NOT NULL,
  `championships` INT(3) NULL,
  `team_color` VARCHAR(30) NULL,
  `arena_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`team_name`),
  INDEX `fk_teams_arena1_idx` (`arena_name` ASC) VISIBLE,
  CONSTRAINT `fk_teams_arena1`
    FOREIGN KEY (`arena_name`)
    REFERENCES `NBA`.`arenas` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NBA`.`coaches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NBA`.`coaches` (
  `coach_id` INT NOT NULL COMMENT 'Social security number of last 4 digits(-XXXX-)',
  `name` VARCHAR(25) NOT NULL,
  `birth_year` INT(5) NOT NULL,
  `coaching_since` INT(5) NULL COMMENT 'In years, in NBA.',
  `team_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`coach_id`),
  INDEX `fk_coach_teams1_idx` (`team_name` ASC) VISIBLE,
  CONSTRAINT `fk_coach_teams1`
    FOREIGN KEY (`team_name`)
    REFERENCES `NBA`.`teams` (`team_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NBA`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NBA`.`players` (
  `player_number` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `height` DOUBLE NOT NULL COMMENT 'Height in feet',
  `birth_year` INT(5) NOT NULL,
  `salary` INT NULL,
  `team_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`player_number`, `name`),
  INDEX `fk_players_teams1_idx` (`team_name` ASC) VISIBLE,
  CONSTRAINT `fk_players_teams1`
    FOREIGN KEY (`team_name`)
    REFERENCES `NBA`.`teams` (`team_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `nba` ;

-- -----------------------------------------------------
-- Table `nba`.`arenas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nba`.`arenas` (
  `name` VARCHAR(30) NOT NULL,
  `location` VARCHAR(30) NOT NULL,
  `capacity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nba`.`teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nba`.`teams` (
  `team_name` VARCHAR(30) NOT NULL,
  `division` VARCHAR(30) NOT NULL,
  `championships` INT NULL DEFAULT NULL,
  `team_color` VARCHAR(30) NULL DEFAULT NULL,
  `arenas_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`team_name`),
  INDEX `fk_teams_arenas1_idx` (`arenas_name` ASC) VISIBLE,
  CONSTRAINT `fk_teams_arenas1`
    FOREIGN KEY (`arenas_name`)
    REFERENCES `nba`.`arenas` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nba`.`coaches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nba`.`coaches` (
  `coach_id` INT NOT NULL COMMENT 'Social security number of last 4 digits(-XXXX-)',
  `name` VARCHAR(155) NOT NULL,
  `birth_year` INT NOT NULL,
  `coaching_since` INT NULL DEFAULT NULL COMMENT 'In years, in NBA.',
  `team_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`coach_id`),
  INDEX `fk_coach_teams1_idx` (`team_name` ASC) VISIBLE,
  CONSTRAINT `fk_coach_teams1`
    FOREIGN KEY (`team_name`)
    REFERENCES `nba`.`teams` (`team_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nba`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nba`.`players` (
  `player_number` INT NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  `height` DOUBLE NOT NULL COMMENT 'Height in feet',
  `birth_year` INT NOT NULL,
  `salary` INT NULL DEFAULT NULL,
  `team_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`player_number`, `name`),
  INDEX `fk_players_teams1_idx` (`team_name` ASC) VISIBLE,
  CONSTRAINT `fk_players_teams1`
    FOREIGN KEY (`team_name`)
    REFERENCES `nba`.`teams` (`team_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `nba` ;

-- -----------------------------------------------------
-- Placeholder table for view `nba`.`m`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nba`.`m` (`player_number` INT, `name` INT, `team_name` INT, `division` INT);

-- -----------------------------------------------------
-- View `nba`.`m`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nba`.`m`;
USE `nba`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nba`.`m` AS select `nba`.`players`.`player_number` AS `player_number`,`nba`.`players`.`name` AS `name`,`nba`.`teams`.`team_name` AS `team_name`,`nba`.`teams`.`division` AS `division` from (`nba`.`teams` join `nba`.`players` on((`nba`.`players`.`team_name` = `nba`.`teams`.`team_name`))) order by `nba`.`teams`.`division`,`nba`.`teams`.`team_name`,`nba`.`players`.`name`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
