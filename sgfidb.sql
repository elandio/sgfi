/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


DROP DATABASE IF EXISTS `sgfidb`;
CREATE DATABASE `sgfidb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sgfidb`;
DROP TABLE IF EXISTS `comunidade`;
CREATE TABLE `comunidade` (
  `codComunidade` int(11) NOT NULL AUTO_INCREMENT,
  `nomeComunidade` varchar(80) DEFAULT NULL,
  `cnpj` varchar(19) DEFAULT NULL,
  `insc_Estadual` varchar(20) DEFAULT NULL,
  `endereco` varchar(80) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cidade` varchar(15) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `telefone1` varchar(14) DEFAULT NULL,
  `telefone2` varchar(14) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `observacao` text,
  PRIMARY KEY (`codComunidade`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `comunidade` VALUES (9,'Igreja Presbiterian','111.111.111/1111-11','1111111111','Rua Dr° Lobato, 469','centro','Pinheiros','29.980-000','ES','(27) 3765-1234','(27) 9876-5432','igreja@email.com.br','Todos esses dados são ficticios, foram usados aqui apenas para teste');
INSERT INTO `comunidade` VALUES (10,'Nossa Senhora de Fátima','829.374.098/7234-78','12837176','Rua 16','Guriri','São Mateus','29.930-000','ES','(21) 8347-2837','(89) 7234-8972','nossasenhoradefatima@hotmail.com','Cadastro de teste.');
DROP TABLE IF EXISTS `contas`;
CREATE TABLE `contas` (
  `codConta` int(11) NOT NULL AUTO_INCREMENT,
  `codComunidade` int(11) DEFAULT NULL,
  `banco` varchar(50) DEFAULT NULL,
  `agencia` int(15) DEFAULT NULL,
  `digitoAgencia` int(4) DEFAULT NULL,
  `numeroConta` int(11) DEFAULT NULL,
  `digitoConta` varchar(4) DEFAULT NULL,
  `ativo` varchar(3) DEFAULT NULL,
  `conta` varchar(50) DEFAULT NULL,
  `numeroBanco` int(15) DEFAULT NULL,
  `observacao` text,
  PRIMARY KEY (`codConta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `contas` VALUES (7,9,'Banco do Brasil',2451,1,12835,'1','Sim','Conta Poupança',154,'Conta bancária');
INSERT INTO `contas` VALUES (8,9,'Caixa I',0,0,0,'','Sim','Dizimo',0,'Caixa urna, onde fica o dinheiro antes deir para o banco');
INSERT INTO `contas` VALUES (9,9,'Banco Sicoob I',3009,1,13508,'8','Não','Conta Corrente',1004,'segunda conta bancária\nteste setAlterar');
INSERT INTO `contas` VALUES (10,10,'Campanha Missionaria',0,0,0,'','Sim','Campanha Missionaria',0,'');
DROP TABLE IF EXISTS `livro_caixa`;
CREATE TABLE `livro_caixa` (
  `codLanc` int(11) NOT NULL AUTO_INCREMENT,
  `codConta` int(11) DEFAULT NULL,
  `codPessoa` int(11) DEFAULT NULL,
  `codComunidade` int(11) DEFAULT NULL,
  `numDoc` int(11) DEFAULT NULL,
  `tipoDoc` varchar(50) DEFAULT NULL,
  `historico` varchar(100) DEFAULT NULL,
  `dataLanc` date DEFAULT NULL,
  `anoRef` int(11) DEFAULT NULL,
  `valor` double(10,2) DEFAULT NULL,
  `mesRef` int(11) DEFAULT NULL,
  PRIMARY KEY (`codLanc`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

INSERT INTO `livro_caixa` VALUES (1,7,41,0,0,'Deposito','Deposito ','2011-05-08',NULL,100,NULL);
INSERT INTO `livro_caixa` VALUES (2,7,42,0,0,'Deposito','Deposito Testando deposito','2011-05-08',NULL,100,NULL);
INSERT INTO `livro_caixa` VALUES (3,7,42,0,0,'Deposito','Deposito testando centavos','2011-05-08',NULL,100.52,NULL);
INSERT INTO `livro_caixa` VALUES (4,8,43,0,0,'Deposito','Deposito Dizimo','2011-05-08',NULL,450,NULL);
INSERT INTO `livro_caixa` VALUES (5,8,41,0,0,'Deposito','Deposito ','2011-05-08',NULL,100,NULL);
INSERT INTO `livro_caixa` VALUES (6,7,41,9,0,'Deposito','Deposito Dizimo','2011-05-10',NULL,2000,NULL);
INSERT INTO `livro_caixa` VALUES (7,7,42,9,0,'Deposito','Deposito Teste','2011-05-10',NULL,1500,NULL);
INSERT INTO `livro_caixa` VALUES (8,7,41,9,0,'Deposito','Deposito teste numDoc','2011-05-10',NULL,100,NULL);
INSERT INTO `livro_caixa` VALUES (9,7,41,9,0,'Deposito','Deposito ','2011-05-10',NULL,0.5,NULL);
INSERT INTO `livro_caixa` VALUES (10,7,41,9,0,'Deposito','Deposito teste numDoc','2011-05-10',NULL,5,NULL);
INSERT INTO `livro_caixa` VALUES (11,7,41,9,0,'Deposito','Deposito ','2011-05-10',NULL,1,NULL);
INSERT INTO `livro_caixa` VALUES (12,7,41,9,0,'Deposito','Deposito ','2011-05-10',NULL,1,NULL);
INSERT INTO `livro_caixa` VALUES (13,7,41,9,0,'Deposito','Deposito ','2011-05-10',NULL,5000,NULL);
INSERT INTO `livro_caixa` VALUES (14,7,41,9,0,'Deposito','Deposito ','2011-05-10',NULL,1,NULL);
INSERT INTO `livro_caixa` VALUES (15,7,41,9,0,'Deposito','Deposito ','2011-05-10',NULL,1,NULL);
INSERT INTO `livro_caixa` VALUES (16,7,41,9,0,'Deposito','Deposito ','2011-05-10',NULL,14,NULL);
INSERT INTO `livro_caixa` VALUES (17,7,41,9,0,'Deposito','Deposito ','2011-05-12',NULL,55,NULL);
INSERT INTO `livro_caixa` VALUES (18,7,41,9,145874,'Deposito','Deposito ','2011-05-12',NULL,1,NULL);
INSERT INTO `livro_caixa` VALUES (19,7,41,9,1458,'Nota Fiscal','Deposito ','2011-05-12',NULL,1,NULL);
INSERT INTO `livro_caixa` VALUES (20,8,41,9,12544,'Recibo','Deposito teste','2011-05-12',NULL,500,NULL);
INSERT INTO `livro_caixa` VALUES (21,8,42,9,1455,'Prolabore','Deposito ','2011-05-12',NULL,500,NULL);
INSERT INTO `livro_caixa` VALUES (22,8,44,10,234234234,'Recibo','Deposito Dízimo','2011-05-14',NULL,110,NULL);
INSERT INTO `livro_caixa` VALUES (23,8,44,10,52362,'Nota Fiscal','Deposito Dízimo','2011-05-17',NULL,190,NULL);
INSERT INTO `livro_caixa` VALUES (24,8,41,9,325345,'Nota Fiscal','Deposito Dízimo','2011-05-17',NULL,214,NULL);
INSERT INTO `livro_caixa` VALUES (25,8,42,10,1235,'Nota Fiscal','Deposito Dízimo','2011-05-18',NULL,120,NULL);
INSERT INTO `livro_caixa` VALUES (26,8,43,10,7364,'Nota Fiscal','Deposito Depósito','2011-05-18',NULL,150,NULL);
INSERT INTO `livro_caixa` VALUES (27,7,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-05-18',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (28,7,42,9,0,'saque','Saque saque','2011-05-18',NULL,-1000,NULL);
INSERT INTO `livro_caixa` VALUES (29,7,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-05-18',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (30,7,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-05-18',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (31,8,42,10,12345,'','Saque Conta de água','2011-05-19',NULL,-30,NULL);
INSERT INTO `livro_caixa` VALUES (32,7,41,9,1234,'Recibo','Deposito Teste','2011-05-19',NULL,30,NULL);
INSERT INTO `livro_caixa` VALUES (33,7,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-05-24',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (34,7,41,9,387467,'Recibo','Deposito Dizimo','2011-05-24',NULL,120,NULL);
INSERT INTO `livro_caixa` VALUES (35,7,10,10,0,'Abertura Caixa','Abertura de Caixa','2011-05-24',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (36,7,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-05-27',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (37,8,41,9,34234,'Recibo','Deposito dizimo','2011-05-27',NULL,110,NULL);
INSERT INTO `livro_caixa` VALUES (38,8,42,10,23423,'Nota Fiscal','Deposito dizimo','2011-05-27',NULL,130,NULL);
INSERT INTO `livro_caixa` VALUES (39,8,43,9,242342,' ','Deposito dizimo','2011-05-27',NULL,127,NULL);
INSERT INTO `livro_caixa` VALUES (40,7,43,9,23423,'Recibo','Deposito dizimo','2011-05-27',NULL,120,NULL);
INSERT INTO `livro_caixa` VALUES (41,7,41,9,2434,'Nota Fiscal','Deposito dizimo','2011-05-27',NULL,135,NULL);
INSERT INTO `livro_caixa` VALUES (42,7,44,9,1245,'Nota Fiscal','Deposito modal','2011-05-27',NULL,120,NULL);
INSERT INTO `livro_caixa` VALUES (43,8,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-05-28',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (44,8,42,9,1234,'Nota Fiscal','Deposito teste','2011-05-28',NULL,110,NULL);
INSERT INTO `livro_caixa` VALUES (45,7,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-05-30',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (46,7,41,9,100,' ','Deposito Dizimo','2011-05-30',NULL,110,NULL);
INSERT INTO `livro_caixa` VALUES (47,9,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-05-31',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (48,7,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-06-04',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (49,7,41,9,0,' ','Deposito teste','2011-06-04',NULL,120,NULL);
INSERT INTO `livro_caixa` VALUES (50,7,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-06-05',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (51,7,41,9,0,' ','Deposito Teste','2011-06-05',NULL,135,NULL);
INSERT INTO `livro_caixa` VALUES (52,7,41,9,1234,'Saque','Saque Conta de agua(teste)','2011-06-05',NULL,-35,NULL);
INSERT INTO `livro_caixa` VALUES (53,10,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-06-05',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (54,10,10,10,0,'Abertura Caixa','Abertura de Caixa','2011-06-05',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (55,10,41,9,0,' ','Deposito Dinheiro da Campanha','2011-06-05',NULL,2000,NULL);
INSERT INTO `livro_caixa` VALUES (56,10,41,NULL,0,' ','Estorno de Deposito Dinheiro da Campanha','2011-06-05',NULL,-2000,NULL);
INSERT INTO `livro_caixa` VALUES (57,10,41,10,0,' ','Deposito Dinheiro da Campanha','2011-06-05',NULL,2000,NULL);
INSERT INTO `livro_caixa` VALUES (58,10,41,10,0,'Saque','Saque Dinheiro enviado para paroquia','2011-06-05',NULL,-2000,NULL);
INSERT INTO `livro_caixa` VALUES (59,7,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-06-11',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (60,7,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-06-22',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (61,7,41,9,0,' ','Deposito Teste','2011-06-22',NULL,150,NULL);
INSERT INTO `livro_caixa` VALUES (62,8,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-06-22',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (63,7,42,9,0,' ','Deposito Teste','2011-06-22',NULL,239.7,NULL);
INSERT INTO `livro_caixa` VALUES (64,8,44,9,0,' ','Deposito teste','2011-06-22',NULL,430.89,NULL);
INSERT INTO `livro_caixa` VALUES (65,7,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-06-23',NULL,0,NULL);
INSERT INTO `livro_caixa` VALUES (66,7,41,9,0,' ','Deposito Dizimo','2011-06-23',NULL,120,NULL);
INSERT INTO `livro_caixa` VALUES (67,7,9,9,0,'Abertura Caixa','Abertura de Caixa','2011-06-26',NULL,0,NULL);
DROP TABLE IF EXISTS `pessoas`;
CREATE TABLE `pessoas` (
  `codPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa` varchar(40) DEFAULT NULL,
  `codComunidade` int(11) DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `endereco` varchar(80) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `tipoDizimo` varchar(20) DEFAULT NULL,
  `observacao` text,
  `cidade` varchar(15) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`codPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

INSERT INTO `pessoas` VALUES (41,'Luciano Carrafa Benfica',9,'2011-05-06','Rua henrique Ayres','469','Centro','Individual','teste','pinheiros','ES','(27) 9278-6473','vitiazze@gmail.com');
INSERT INTO `pessoas` VALUES (43,'Jessica batista martins',10,'2011-05-06','Rua dr lobato','765','Centro','Individual','cadastro jessica','Pinheiros','ES','(27) 9988-5566','jessica@jessica.com.br');
INSERT INTO `pessoas` VALUES (44,'Cristiano Carrafa Benfica',9,'2011-05-06','Rua Monte alverner','469','Galileia','Individual','a','Pinheiros','ES','(27) 9966-8855','cristiano@hotmail.com');
INSERT INTO `pessoas` VALUES (45,'Geucinéia Carrafa',9,'2011-05-07','Rua Monte alverner ','165','Centro','Individual','teste setAlterar','pinheiros','ES','(27) 9632-5874','sem e-mail');
INSERT INTO `pessoas` VALUES (47,'Leonardo Fracalossi Lucas',10,'2011-06-26','AV: Raphael Barbosa Brahim','1033','Guriri','Individual','Os dados contidos aqui são ficticios.','São Mateus','ES','(27) 9805-4022','leo_fracalossi@hotmail.com');
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `codUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) DEFAULT NULL,
  `senha` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `usuarios` VALUES (1,'leo','1234');
INSERT INTO `usuarios` VALUES (2,'teste','teste');

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
