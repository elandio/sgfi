SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `sgfidb` DEFAULT CHARACTER SET latin1 ;
USE `sgfidb` ;

-- -----------------------------------------------------
-- Table `sgfidb`.`comunidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgfidb`.`comunidade` ;

CREATE  TABLE IF NOT EXISTS `sgfidb`.`comunidade` (
  `codComunidade` INT(11) NOT NULL AUTO_INCREMENT ,
  `nomeComunidade` VARCHAR(80) NOT NULL ,
  `cnpj` VARCHAR(19) NULL DEFAULT NULL ,
  `insc_Estadual` VARCHAR(20) NULL DEFAULT NULL ,
  `endereco` VARCHAR(80) NULL DEFAULT NULL ,
  `bairro` VARCHAR(30) NULL DEFAULT NULL ,
  `cidade` VARCHAR(15) NULL DEFAULT NULL ,
  `cep` VARCHAR(10) NULL DEFAULT NULL ,
  `uf` CHAR(2) NULL DEFAULT NULL ,
  `telefone1` VARCHAR(14) NULL DEFAULT NULL ,
  `telefone2` VARCHAR(14) NULL DEFAULT NULL ,
  `email` VARCHAR(60) NULL DEFAULT NULL ,
  `observacao` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`codComunidade`) )
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sgfidb`.`contas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgfidb`.`contas` ;

CREATE  TABLE IF NOT EXISTS `sgfidb`.`contas` (
  `codConta` INT(11) NOT NULL AUTO_INCREMENT ,
  `codComunidade` INT(11) NOT NULL ,
  `banco` VARCHAR(50) NULL DEFAULT NULL ,
  `agencia` INT(15) NULL DEFAULT NULL ,
  `digitoAgencia` INT(4) NULL DEFAULT NULL ,
  `numeroConta` INT(11) NULL DEFAULT NULL ,
  `digitoConta` VARCHAR(4) NULL DEFAULT NULL ,
  `ativo` VARCHAR(3) NULL DEFAULT NULL ,
  `conta` VARCHAR(50) NULL DEFAULT NULL ,
  `numeroBanco` INT(15) NULL DEFAULT NULL ,
  `observacao` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`codConta`) ,
  INDEX `FK_contas_comunidade_idx` (`codComunidade` ASC) ,
  CONSTRAINT `FK_contas_comunidade`
    FOREIGN KEY (`codComunidade` )
    REFERENCES `sgfidb`.`comunidade` (`codComunidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sgfidb`.`pessoas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgfidb`.`pessoas` ;

CREATE  TABLE IF NOT EXISTS `sgfidb`.`pessoas` (
  `codPessoa` INT(11) NOT NULL AUTO_INCREMENT ,
  `codComunidade` INT(11) NOT NULL ,
  `pessoa` VARCHAR(40) NOT NULL ,
  `dataCadastro` DATE NULL DEFAULT NULL ,
  `endereco` VARCHAR(80) NULL DEFAULT NULL ,
  `numero` VARCHAR(5) NULL DEFAULT NULL ,
  `bairro` VARCHAR(30) NULL DEFAULT NULL ,
  `tipoDizimo` VARCHAR(20) NULL DEFAULT NULL ,
  `observacao` TEXT NULL DEFAULT NULL ,
  `cidade` VARCHAR(15) NULL DEFAULT NULL ,
  `uf` CHAR(2) NULL DEFAULT NULL ,
  `telefone` VARCHAR(14) NULL DEFAULT NULL ,
  `email` VARCHAR(60) NULL DEFAULT NULL ,
  PRIMARY KEY (`codPessoa`) ,
  INDEX `FK_pessoas_comunidade1_idx` (`codComunidade` ASC) ,
  CONSTRAINT `FK_pessoas_comunidade1`
    FOREIGN KEY (`codComunidade` )
    REFERENCES `sgfidb`.`comunidade` (`codComunidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 48
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sgfidb`.`livro_caixa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgfidb`.`livro_caixa` ;

CREATE  TABLE IF NOT EXISTS `sgfidb`.`livro_caixa` (
  `codLanc` INT(11) NOT NULL AUTO_INCREMENT ,
  `codConta` INT(11) NOT NULL ,
  `codPessoa` INT(11) NOT NULL ,
  `codComunidade` INT(11) NOT NULL ,
  `numDoc` INT(11) NULL ,
  `tipoDoc` VARCHAR(50) NULL DEFAULT NULL ,
  `historico` VARCHAR(100) NULL DEFAULT NULL ,
  `dataLanc` DATE NULL DEFAULT NULL ,
  `anoRef` INT(11) NULL DEFAULT NULL ,
  `valor` DOUBLE(10,2) NULL DEFAULT NULL ,
  `mesRef` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`codLanc`) ,
  INDEX `FK_livro_caixa_contas1_idx` (`codConta` ASC) ,
  INDEX `FK_livro_caixa_pessoas1_idx` (`codPessoa` ASC) ,
  INDEX `FK_livro_caixa_comunidade1_idx` (`codComunidade` ASC) ,
  CONSTRAINT `FK_livro_caixa_contas1`
    FOREIGN KEY (`codConta` )
    REFERENCES `sgfidb`.`contas` (`codConta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_livro_caixa_pessoas1`
    FOREIGN KEY (`codPessoa` )
    REFERENCES `sgfidb`.`pessoas` (`codPessoa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_livro_caixa_comunidade1`
    FOREIGN KEY (`codComunidade` )
    REFERENCES `sgfidb`.`comunidade` (`codComunidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 68
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sgfidb`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgfidb`.`usuarios` ;

CREATE  TABLE IF NOT EXISTS `sgfidb`.`usuarios` (
  `codUsuario` INT(11) NOT NULL AUTO_INCREMENT ,
  `usuario` VARCHAR(100) NULL DEFAULT NULL ,
  `senha` VARCHAR(30) NULL DEFAULT NULL ,
  PRIMARY KEY (`codUsuario`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `sgfidb`.`comunidade`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgfidb`;
INSERT INTO `sgfidb`.`comunidade` (`codComunidade`, `nomeComunidade`, `cnpj`, `insc_Estadual`, `endereco`, `bairro`, `cidade`, `cep`, `uf`, `telefone1`, `telefone2`, `email`, `observacao`) VALUES (1, 'Igreja Presbiterian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sgfidb`.`comunidade` (`codComunidade`, `nomeComunidade`, `cnpj`, `insc_Estadual`, `endereco`, `bairro`, `cidade`, `cep`, `uf`, `telefone1`, `telefone2`, `email`, `observacao`) VALUES (2, 'Nossa Senhora de Fátima', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgfidb`.`contas`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgfidb`;
INSERT INTO `sgfidb`.`contas` (`codConta`, `codComunidade`, `banco`, `agencia`, `digitoAgencia`, `numeroConta`, `digitoConta`, `ativo`, `conta`, `numeroBanco`, `observacao`) VALUES (1, 1, 'Banco do Brasil', 2.451, 0, 5645, '6', 'Sim', '6545', 1, NULL);
INSERT INTO `sgfidb`.`contas` (`codConta`, `codComunidade`, `banco`, `agencia`, `digitoAgencia`, `numeroConta`, `digitoConta`, `ativo`, `conta`, `numeroBanco`, `observacao`) VALUES (2, 1, 'Caixa I', NULL, NULL, NULL, NULL, 'Sim', NULL, NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgfidb`.`pessoas`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgfidb`;
INSERT INTO `sgfidb`.`pessoas` (`codPessoa`, `codComunidade`, `pessoa`, `dataCadastro`, `endereco`, `numero`, `bairro`, `tipoDizimo`, `observacao`, `cidade`, `uf`, `telefone`, `email`) VALUES (1, 1, 'Douglas Tybel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sgfidb`.`pessoas` (`codPessoa`, `codComunidade`, `pessoa`, `dataCadastro`, `endereco`, `numero`, `bairro`, `tipoDizimo`, `observacao`, `cidade`, `uf`, `telefone`, `email`) VALUES (2, 1, 'Léo Fracalossi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgfidb`.`usuarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgfidb`;
INSERT INTO `sgfidb`.`usuarios` (`codUsuario`, `usuario`, `senha`) VALUES (1, 'adm', 'adm');

COMMIT;
