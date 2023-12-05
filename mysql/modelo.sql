CREATE SCHEMA `educaenfam` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci ;

CREATE TABLE `usuarios` (
  `idusuarios` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `contatos` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

USE `educaenfam`;
CREATE OR REPLACE VIEW `vwUsuarios` AS
SELECT * FROM usuarios;


INSERT INTO educaenfam.usuarios (nome, email, contatos) VALUES ('Anderson', 'amourao@gmail.com', '1');


SELECT * FROM vwUsuarios;
