use notafacil;

drop table `lembrete`;
drop table `usuario`;

CREATE TABLE IF NOT EXISTS `usuario` (
  `usu_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_nome` varchar(100) DEFAULT NULL,
  `usu_email` varchar(100) DEFAULT NULL,
  `usu_celular` varchar(100) DEFAULT NULL,
  `usu_login` varchar(30) DEFAULT NULL,
  `usu_senha` varchar(8) DEFAULT NULL,
  `usu_confirmado` int(1) DEFAULT 0,
  PRIMARY KEY (`usu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `lembrete` (
  `lem_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_id` int(11) DEFAULT NULL,
  `lem_dh_insercao` datetime DEFAULT NULL,
  `lem_dh_inicio` datetime DEFAULT NULL,
  `lem_dh_fim` datetime DEFAULT NULL,
  `lem_dh_lembrar` datetime DEFAULT NULL,
  `lem_titulo` varchar(50) DEFAULT NULL,
  `lem_descricao` varchar(300) DEFAULT NULL,
  `lem_local` varchar(100) DEFAULT NULL,
  `lem_enviado` int(1) DEFAULT 0,
  
  PRIMARY KEY (`lem_id`),
  KEY `fk_lembrete_usuario` (`usu_id`),
  CONSTRAINT `fk_lembrete_usuario` FOREIGN KEY (`usu_id`) REFERENCES `usuario` (`usu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;