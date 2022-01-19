-- MySQL Script generated by MySQL Workbench
-- Wed Jan 19 22:40:36 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hermestravel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hermestravel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hermestravel` DEFAULT CHARACTER SET utf8 ;
USE `hermestravel` ;

-- -----------------------------------------------------
-- Table `hermestravel`.`Utilizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hermestravel`.`Utilizador` (
  `email` VARCHAR(25) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nivel` INT NOT NULL,
  `login` TINYINT NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hermestravel`.`Rota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hermestravel`.`Rota` (
  `nome` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hermestravel`.`PontoInteresse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hermestravel`.`PontoInteresse` (
  `nome` VARCHAR(25) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `coordenadas` VARCHAR(45) NULL,
  PRIMARY KEY (`nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hermestravel`.`Rota_has_PontoInteresse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hermestravel`.`Rota_has_PontoInteresse` (
  `Rota_nome` VARCHAR(25) NOT NULL,
  `PontoInteresse_nome` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Rota_nome`, `PontoInteresse_nome`),
  INDEX `fk_Rota_has_PontoInteresse_PontoInteresse1_idx` (`PontoInteresse_nome` ASC) VISIBLE,
  INDEX `fk_Rota_has_PontoInteresse_Rota_idx` (`Rota_nome` ASC) VISIBLE,
  CONSTRAINT `fk_Rota_has_PontoInteresse_Rota`
    FOREIGN KEY (`Rota_nome`)
    REFERENCES `hermestravel`.`Rota` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rota_has_PontoInteresse_PontoInteresse1`
    FOREIGN KEY (`PontoInteresse_nome`)
    REFERENCES `hermestravel`.`PontoInteresse` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hermestravel`.`Avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hermestravel`.`Avaliacao` (
  `idAvaliacao` INT NOT NULL,
  `avaliacao` INT NULL,
  `descricao` VARCHAR(45) NULL,
  `PontoInteresse_nome` VARCHAR(25) NOT NULL,
  `Utilizador_email` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idAvaliacao`),
  INDEX `fk_Avaliacao_PontoInteresse1_idx` (`PontoInteresse_nome` ASC) VISIBLE,
  INDEX `fk_Avaliacao_Utilizador1_idx` (`Utilizador_email` ASC) VISIBLE,
  CONSTRAINT `fk_Avaliacao_PontoInteresse1`
    FOREIGN KEY (`PontoInteresse_nome`)
    REFERENCES `hermestravel`.`PontoInteresse` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliacao_Utilizador1`
    FOREIGN KEY (`Utilizador_email`)
    REFERENCES `hermestravel`.`Utilizador` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hermestravel`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hermestravel`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `Descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hermestravel`.`PontoInteresse_has_Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hermestravel`.`PontoInteresse_has_Categoria` (
  `PontoInteresse_nome` VARCHAR(25) NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`PontoInteresse_nome`, `Categoria_idCategoria`),
  INDEX `fk_PontoInteresse_has_Categoria_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  INDEX `fk_PontoInteresse_has_Categoria_PontoInteresse1_idx` (`PontoInteresse_nome` ASC) VISIBLE,
  CONSTRAINT `fk_PontoInteresse_has_Categoria_PontoInteresse1`
    FOREIGN KEY (`PontoInteresse_nome`)
    REFERENCES `hermestravel`.`PontoInteresse` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PontoInteresse_has_Categoria_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `hermestravel`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hermestravel`.`Utilizador_hasfavorite_PontoInteresse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hermestravel`.`Utilizador_hasfavorite_PontoInteresse` (
  `Utilizador_email` VARCHAR(25) NOT NULL,
  `PontoInteresse_nome` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Utilizador_email`, `PontoInteresse_nome`),
  INDEX `fk_Utilizador_has_PontoInteresse_PontoInteresse1_idx` (`PontoInteresse_nome` ASC) VISIBLE,
  INDEX `fk_Utilizador_has_PontoInteresse_Utilizador1_idx` (`Utilizador_email` ASC) VISIBLE,
  CONSTRAINT `fk_Utilizador_has_PontoInteresse_Utilizador1`
    FOREIGN KEY (`Utilizador_email`)
    REFERENCES `hermestravel`.`Utilizador` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilizador_has_PontoInteresse_PontoInteresse1`
    FOREIGN KEY (`PontoInteresse_nome`)
    REFERENCES `hermestravel`.`PontoInteresse` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hermestravel`.`Utilizador_hashistorico_Rota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hermestravel`.`Utilizador_hashistorico_Rota` (
  `Utilizador_email` VARCHAR(25) NOT NULL,
  `Rota_nome` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Utilizador_email`, `Rota_nome`),
  INDEX `fk_Utilizador_has_Rota_Rota1_idx` (`Rota_nome` ASC) VISIBLE,
  INDEX `fk_Utilizador_has_Rota_Utilizador1_idx` (`Utilizador_email` ASC) VISIBLE,
  CONSTRAINT `fk_Utilizador_has_Rota_Utilizador1`
    FOREIGN KEY (`Utilizador_email`)
    REFERENCES `hermestravel`.`Utilizador` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilizador_has_Rota_Rota1`
    FOREIGN KEY (`Rota_nome`)
    REFERENCES `hermestravel`.`Rota` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hermestravel`.`Utilizador_has_Utilizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hermestravel`.`Utilizador_has_Utilizador` (
  `Utilizador_email` VARCHAR(25) NOT NULL,
  `Utilizador_email1` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Utilizador_email`, `Utilizador_email1`),
  INDEX `fk_Utilizador_has_Utilizador_Utilizador2_idx` (`Utilizador_email1` ASC) VISIBLE,
  INDEX `fk_Utilizador_has_Utilizador_Utilizador1_idx` (`Utilizador_email` ASC) VISIBLE,
  CONSTRAINT `fk_Utilizador_has_Utilizador_Utilizador1`
    FOREIGN KEY (`Utilizador_email`)
    REFERENCES `hermestravel`.`Utilizador` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilizador_has_Utilizador_Utilizador2`
    FOREIGN KEY (`Utilizador_email1`)
    REFERENCES `hermestravel`.`Utilizador` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
