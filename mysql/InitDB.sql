CREATE DATABASE  IF NOT EXISTS `educaenfam` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `educaenfam`;
-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: educaenfam
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aeroportos`
--

DROP TABLE IF EXISTS `aeroportos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeroportos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sigla` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uf` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `aeroporto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `andamentos`
--

DROP TABLE IF EXISTS `andamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `andamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `credenciamento_id` int unsigned DEFAULT NULL,
  `tipo_andamento_id` int unsigned NOT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `data` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mensagem` varchar(6000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Mensagem redigida pelo usuário que gerou o andamento',
  `projeto_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `andamentos_credenciamento_id_foreign` (`credenciamento_id`),
  KEY `andamentos_tipo_andamento_id_foreign` (`tipo_andamento_id`),
  KEY `andamentos_usuario_id_foreign` (`usuario_id`),
  KEY `andamentos_projeto_id_foreign` (`projeto_id`),
  CONSTRAINT `andamentos_credenciamento_id_foreign` FOREIGN KEY (`credenciamento_id`) REFERENCES `credenciamentos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `andamentos_projeto_id_foreign` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `andamentos_tipo_andamento_id_foreign` FOREIGN KEY (`tipo_andamento_id`) REFERENCES `tipos_andamento` (`id`) ON DELETE CASCADE,
  CONSTRAINT `andamentos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48686 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anexos_credenciamento`
--

DROP TABLE IF EXISTS `anexos_credenciamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anexos_credenciamento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `credenciamento_id` int unsigned NOT NULL,
  `tipo_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data_publicacao` datetime DEFAULT NULL COMMENT 'Data em que o anexo foi publicado.',
  `visibilidade` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P' COMMENT 'Visibilidade Restrita/apenas ENFAM, ou Publica',
  `anexo_fluxo_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `anexos_credenciamento_credenciamento_id_foreign` (`credenciamento_id`),
  KEY `anexos_credenciamento_tipo_id_foreign` (`tipo_id`),
  KEY `anexos_credenciamento_anexo_fluxo_id_foreign` (`anexo_fluxo_id`),
  CONSTRAINT `anexos_credenciamento_anexo_fluxo_id_foreign` FOREIGN KEY (`anexo_fluxo_id`) REFERENCES `anexos_fluxos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_credenciamento_credenciamento_id_foreign` FOREIGN KEY (`credenciamento_id`) REFERENCES `credenciamentos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_credenciamento_tipo_id_foreign` FOREIGN KEY (`tipo_id`) REFERENCES `tipos_anexo_credenciamento` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25026 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anexos_demandas_projetos`
--

DROP TABLE IF EXISTS `anexos_demandas_projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anexos_demandas_projetos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `demanda_projeto_id` int unsigned NOT NULL,
  `tipo_anexo_projeto_id` int unsigned NOT NULL,
  `anexado_por` int unsigned NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `anexos_demandas_projetos_url_unique` (`url`),
  KEY `anexos_demandas_projetos_demanda_projeto_id_foreign` (`demanda_projeto_id`),
  KEY `anexos_demandas_projetos_tipo_anexo_projeto_id_foreign` (`tipo_anexo_projeto_id`),
  KEY `anexos_demandas_projetos_anexado_por_foreign` (`anexado_por`),
  CONSTRAINT `anexos_demandas_projetos_anexado_por_foreign` FOREIGN KEY (`anexado_por`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_demandas_projetos_demanda_projeto_id_foreign` FOREIGN KEY (`demanda_projeto_id`) REFERENCES `demandas_projetos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_demandas_projetos_tipo_anexo_projeto_id_foreign` FOREIGN KEY (`tipo_anexo_projeto_id`) REFERENCES `tipos_anexos_projetos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anexos_docentes`
--

DROP TABLE IF EXISTS `anexos_docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anexos_docentes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo_id` int unsigned NOT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `anexado_por` int unsigned NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `evento_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `anexos_docentes_url_unique` (`url`),
  KEY `anexos_docentes_tipo_id_foreign` (`tipo_id`),
  KEY `anexos_docentes_usuario_id_foreign` (`usuario_id`),
  KEY `anexos_docentes_anexado_por_foreign` (`anexado_por`),
  KEY `anexos_docentes_evento_id_foreign` (`evento_id`),
  CONSTRAINT `anexos_docentes_anexado_por_foreign` FOREIGN KEY (`anexado_por`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_docentes_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`),
  CONSTRAINT `anexos_docentes_tipo_id_foreign` FOREIGN KEY (`tipo_id`) REFERENCES `tipos_anexo_docente` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_docentes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3858 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anexos_evento`
--

DROP TABLE IF EXISTS `anexos_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anexos_evento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `evento_id` int unsigned NOT NULL,
  `tipo_id` int unsigned NOT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `anexado_por` int unsigned NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `visibilidade` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `anexos_evento_url_unique` (`url`),
  KEY `anexos_evento_evento_id_foreign` (`evento_id`),
  KEY `anexos_evento_tipo_id_foreign` (`tipo_id`),
  KEY `anexos_evento_usuario_id_foreign` (`usuario_id`),
  KEY `anexos_evento_anexado_por_foreign` (`anexado_por`),
  CONSTRAINT `anexos_evento_anexado_por_foreign` FOREIGN KEY (`anexado_por`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_evento_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_evento_tipo_id_foreign` FOREIGN KEY (`tipo_id`) REFERENCES `tipos_anexo_evento` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_evento_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anexos_fluxos`
--

DROP TABLE IF EXISTS `anexos_fluxos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anexos_fluxos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fluxo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'C',
  `anexado_por` int unsigned NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ativo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `anexos_fluxos_url_unique` (`url`),
  KEY `anexos_fluxos_anexado_por_foreign` (`anexado_por`),
  CONSTRAINT `anexos_fluxos_anexado_por_foreign` FOREIGN KEY (`anexado_por`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32576 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anexos_projetos`
--

DROP TABLE IF EXISTS `anexos_projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anexos_projetos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projeto_id` int unsigned NOT NULL,
  `tipo_anexo_projeto_id` int unsigned NOT NULL,
  `anexo_fluxo_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `anexos_projetos_projeto_id_foreign` (`projeto_id`),
  KEY `anexos_projetos_tipo_anexo_projeto_id_foreign` (`tipo_anexo_projeto_id`),
  KEY `anexos_projetos_anexo_fluxo_id_foreign` (`anexo_fluxo_id`),
  CONSTRAINT `anexos_projetos_anexo_fluxo_id_foreign` FOREIGN KEY (`anexo_fluxo_id`) REFERENCES `anexos_fluxos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_projetos_projeto_id_foreign` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_projetos_tipo_anexo_projeto_id_foreign` FOREIGN KEY (`tipo_anexo_projeto_id`) REFERENCES `tipos_anexos_projetos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7547 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anexos_proposta`
--

DROP TABLE IF EXISTS `anexos_proposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anexos_proposta` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `proposta_id` int unsigned NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `anexos_proposta_proposta_id_foreign` (`proposta_id`),
  CONSTRAINT `anexos_proposta_proposta_id_foreign` FOREIGN KEY (`proposta_id`) REFERENCES `propostas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anexos_reconhecimento`
--

DROP TABLE IF EXISTS `anexos_reconhecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anexos_reconhecimento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reconhecimento_id` int unsigned NOT NULL,
  `tipo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Programação e Outros',
  `anexado_por` int unsigned NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `anexos_reconhecimento_url_unique` (`url`),
  KEY `anexos_reconhecimento_reconhecimento_id_foreign` (`reconhecimento_id`),
  KEY `anexos_reconhecimento_anexado_por_foreign` (`anexado_por`),
  CONSTRAINT `anexos_reconhecimento_anexado_por_foreign` FOREIGN KEY (`anexado_por`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_reconhecimento_reconhecimento_id_foreign` FOREIGN KEY (`reconhecimento_id`) REFERENCES `reconhecimentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assinaturas_anexos_fluxos`
--

DROP TABLE IF EXISTS `assinaturas_anexos_fluxos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assinaturas_anexos_fluxos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `anexo_id` int unsigned NOT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cargo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assinaturas_anexo_credenciamento_usuario_id_foreign` (`usuario_id`),
  KEY `assinaturas_anexo_credenciamento_anexo_id_foreign` (`anexo_id`),
  CONSTRAINT `assinaturas_anexo_credenciamento_anexo_id_foreign` FOREIGN KEY (`anexo_id`) REFERENCES `anexos_fluxos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assinaturas_anexo_credenciamento_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10684 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assinaturas_anexos_reconhecimentos`
--

DROP TABLE IF EXISTS `assinaturas_anexos_reconhecimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assinaturas_anexos_reconhecimentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `anexo_id` int unsigned NOT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `cargo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assinaturas_anexos_reconhecimentos_anexo_id_foreign` (`anexo_id`),
  KEY `assinaturas_anexos_reconhecimentos_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `assinaturas_anexos_reconhecimentos_anexo_id_foreign` FOREIGN KEY (`anexo_id`) REFERENCES `anexos_reconhecimento` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assinaturas_anexos_reconhecimentos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `atuacao_escola_eventos`
--

DROP TABLE IF EXISTS `atuacao_escola_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atuacao_escola_eventos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `escola_id` int unsigned NOT NULL,
  `formulario_inscricao_escola_id` int unsigned NOT NULL,
  `vagas` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `atuacao_escola_eventos_escola_id_foreign` (`escola_id`),
  KEY `atuacao_escola_eventos_formulario_inscricao_escola_id_foreign` (`formulario_inscricao_escola_id`),
  CONSTRAINT `atuacao_escola_eventos_escola_id_foreign` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `atuacao_escola_eventos_formulario_inscricao_escola_id_foreign` FOREIGN KEY (`formulario_inscricao_escola_id`) REFERENCES `formulario_inscricao_escolas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bancos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bancos_codigo_index` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bloqueios_inscricao`
--

DROP TABLE IF EXISTS `bloqueios_inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloqueios_inscricao` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_bloqueado_id` int unsigned NOT NULL,
  `bloqueado_por_usuario_id` int unsigned NOT NULL,
  `justificativa` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `desbloqueado_por_usuario_id` int unsigned DEFAULT NULL,
  `data_desbloqueio` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `justificativa_desbloqueio` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_bloqueado_fk` (`usuario_bloqueado_id`),
  KEY `bloqueado_por_fk` (`bloqueado_por_usuario_id`),
  KEY `bloqueios_inscricao_desbloqueado_por_usuario_id_foreign` (`desbloqueado_por_usuario_id`),
  CONSTRAINT `bloqueado_por_fk` FOREIGN KEY (`bloqueado_por_usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bloqueios_inscricao_desbloqueado_por_usuario_id_foreign` FOREIGN KEY (`desbloqueado_por_usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `usuario_bloqueado_fk` FOREIGN KEY (`usuario_bloqueado_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=942 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorias_profissionais`
--

DROP TABLE IF EXISTS `categorias_profissionais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_profissionais` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `exige_tribunal` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidades` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `uf` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `codigo` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `estado_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tem_aeroporto` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `cidades_tem_aeroporto_index` (`tem_aeroporto`)
) ENGINE=InnoDB AUTO_INCREMENT=5610 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compartilhamentos_ead`
--

DROP TABLE IF EXISTS `compartilhamentos_ead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compartilhamentos_ead` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `escola_id` int unsigned NOT NULL,
  `cursos_ead_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `compartilhado` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data_compartilhamento` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compartilhamentos_ead_escola_id_foreign` (`escola_id`),
  KEY `compartilhamentos_ead_cursos_ead_id_foreign` (`cursos_ead_id`),
  KEY `compartilhamentos_ead_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `compartilhamentos_ead_cursos_ead_id_foreign` FOREIGN KEY (`cursos_ead_id`) REFERENCES `cursos_ead` (`id`) ON DELETE CASCADE,
  CONSTRAINT `compartilhamentos_ead_escola_id_foreign` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `compartilhamentos_ead_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `convites`
--

DROP TABLE IF EXISTS `convites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `situacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data_validade` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2707 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credenciamentos`
--

DROP TABLE IF EXISTS `credenciamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credenciamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `natureza` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Formacao inicial, continuada, etc.',
  `modalidade` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Presencial, Semipresencial e EaD',
  `carga_horaria` int unsigned DEFAULT NULL,
  `vagas_por_turma` int unsigned DEFAULT NULL,
  `inscricao_de` date DEFAULT NULL,
  `inscricao_ate` date DEFAULT NULL,
  `realizacao_de` date DEFAULT NULL,
  `realizacao_ate` date DEFAULT NULL,
  `numero_protocolo` int unsigned DEFAULT NULL,
  `ano_protocolo` int unsigned DEFAULT NULL,
  `data_protocolo` datetime DEFAULT NULL,
  `data_prazo_legal` datetime DEFAULT NULL,
  `uf` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cidade_id` int unsigned DEFAULT NULL,
  `escola_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `justificativa` varchar(6000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `intempestivo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `situacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P' COMMENT 'Indica o posicionamento do parecerista em relação ao Credenciamento: Pendente, Deferido, Indeferido',
  `data_primeira_publicacao` datetime DEFAULT NULL COMMENT 'Data em que a primeira portaria foi publicada.',
  `credenciamento_original_id` int unsigned DEFAULT NULL,
  `inicio_fiscalizacao` date DEFAULT NULL,
  `fim_fiscalizacao` date DEFAULT NULL,
  `resultado_fiscalizacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `usuario_fiscalizacao_id` int unsigned DEFAULT NULL,
  `nivel` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `qtd_docentes` int unsigned DEFAULT NULL,
  `alteracoes` varchar(6000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credenciamentos_cidade_id_foreign` (`cidade_id`),
  KEY `credenciamentos_escola_id_foreign` (`escola_id`),
  KEY `credenciamentos_usuario_fiscalizacao_id_foreign` (`usuario_fiscalizacao_id`),
  CONSTRAINT `credenciamentos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `credenciamentos_escola_id_foreign` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `credenciamentos_usuario_fiscalizacao_id_foreign` FOREIGN KEY (`usuario_fiscalizacao_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4663 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cursos_ead`
--

DROP TABLE IF EXISTS `cursos_ead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos_ead` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `carga_horaria` int NOT NULL,
  `active` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categoria` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nivel` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cursos_ead_nome_unique` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demandas_projetos`
--

DROP TABLE IF EXISTS `demandas_projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demandas_projetos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `escola_id` int unsigned DEFAULT NULL,
  `criado_por` int unsigned NOT NULL,
  `situacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tipo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Curso, oficina, etc',
  `categoria` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'formacao Inicial, formacao Continuada, formacao de Formadores',
  `nivel` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Nivel/equivalencia',
  `modalidade` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Presencial, Semi presencial ou Ead',
  `uf` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cidade_id` int unsigned DEFAULT NULL,
  `objetivo_geral` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `justificativa` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `parcerias` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `observacoes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `data_finalizacao` datetime DEFAULT NULL COMMENT 'Data em que a demanda foi finalizada e encaminhada',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vagas` int unsigned DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `demanda_projeto_escola_fk` (`escola_id`),
  KEY `projeto_criadopor_fk` (`criado_por`),
  KEY `cidade_demanda_fk` (`cidade_id`),
  CONSTRAINT `cidade_demanda_fk` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `demanda_projeto_escola_fk` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projeto_criadopor_fk` FOREIGN KEY (`criado_por`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deslocamentos`
--

DROP TABLE IF EXISTS `deslocamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deslocamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `evento_id` int unsigned NOT NULL,
  `aeroporto_origem_id` int unsigned DEFAULT NULL COMMENT 'Nullable pois nao necessariamente ha emissao de passagem',
  `aeroporto_retorno_id` int unsigned DEFAULT NULL COMMENT 'Nullable pois nao necessariamente ha emissao de passagem',
  `data_origem` date NOT NULL,
  `data_retorno` date DEFAULT NULL COMMENT 'A data de retorno atualmente é informada pela área de passagens, não é o usuário que informa ao preencher a inscrição',
  `bagagem` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'M  - De mão, D - Despachada. Nullable pois nao necessariamente ha emissao de passagem',
  `justificativa` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Utilizado para compor a RPD enviada ao SEI',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `emite_passagem` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y' COMMENT 'Indica se este deslocamento tera emissao de passagens',
  `banco_id` int unsigned DEFAULT NULL,
  `agencia` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `conta_corrente` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cargo` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'M' COMMENT 'Ministro, Desembargador, Juiz, Servidor - Analista ou CJ(A), Servidor - Técnico ou FC(T), Outros',
  `equivalencia` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'J' COMMENT 'Apenas utilizado para o cargo Outros',
  `cargo_outro` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Texto livre para informar o cargo no caso de ser Outros',
  PRIMARY KEY (`id`),
  KEY `fk_usuario` (`usuario_id`),
  KEY `fk_eventos` (`evento_id`),
  KEY `fk_aeroporto_origem_id` (`aeroporto_origem_id`),
  KEY `fk_aeroporto_retorno_id` (`aeroporto_retorno_id`),
  KEY `deslocamentos_banco_id_foreign` (`banco_id`),
  CONSTRAINT `deslocamentos_banco_id_foreign` FOREIGN KEY (`banco_id`) REFERENCES `bancos` (`id`),
  CONSTRAINT `fk_aeroporto_origem_id` FOREIGN KEY (`aeroporto_origem_id`) REFERENCES `aeroportos` (`id`),
  CONSTRAINT `fk_aeroporto_retorno_id` FOREIGN KEY (`aeroporto_retorno_id`) REFERENCES `aeroportos` (`id`),
  CONSTRAINT `fk_eventos` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=989 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `titulacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mini_curriculo` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `escola_id` int unsigned DEFAULT NULL,
  `formador` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `formador_enfam` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `complementado` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `autoriza_divulgacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Autoriza participar do banco nacional de formadores',
  `autoriza_presencial` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Só pode autorizar se tiver competencia para ser formador presencial',
  `autoriza_tutoria` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Só pode autorizar se tiver competencia de tutoria',
  `autoriza_conteudista` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Só pode autorizar se tiver competencia de conteudista',
  `competencia_presencial` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Calculado pelo sistema. Indica se tem competencia para ser formador presencial',
  `competencia_tutoria` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Calculado pelo sistema. Indica se tem competencia para ser tutor',
  `competencia_conteudista` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Calculado pelo sistema. Indica se tem competencia para ser conteudista',
  `competencia_gestor` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Indica se o formador tem competencia para atuar como gestor',
  `autoriza_gestor` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Indica se o formador autorizou sua participacao como gestor no BNF',
  `valido_ate` date DEFAULT NULL COMMENT 'Indica a data limite em que o registro de formador constará no BNF',
  `url_foto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `especialista_fofo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE KEY `docentes_url_unique` (`url`),
  UNIQUE KEY `docentes_url_foto_unique` (`url_foto`),
  KEY `docentes_usuario_id_foreign` (`usuario_id`),
  KEY `fk_escola_docente` (`escola_id`),
  CONSTRAINT `docentes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_escola_docente` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9478 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes_credenciamento`
--

DROP TABLE IF EXISTS `docentes_credenciamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_credenciamento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `credenciamento_id` int unsigned NOT NULL,
  `docente_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `participacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'D' COMMENT 'Indica se é um Docente ou Coordenador pedagógico',
  PRIMARY KEY (`id`),
  KEY `docentes_credenciamento_credenciamento_id_foreign` (`credenciamento_id`),
  KEY `docentes_credenciamento_docente_id_foreign` (`docente_id`),
  CONSTRAINT `docentes_credenciamento_credenciamento_id_foreign` FOREIGN KEY (`credenciamento_id`) REFERENCES `credenciamentos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `docentes_credenciamento_docente_id_foreign` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47520 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes_projetos`
--

DROP TABLE IF EXISTS `docentes_projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_projetos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projeto_id` int unsigned NOT NULL,
  `docente_id` int unsigned NOT NULL,
  `participacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Coordenador pedagogico, Docente',
  `carga_horaria` decimal(6,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `orientado` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `avaliado` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `perfil_pedagogico_id` int unsigned DEFAULT NULL COMMENT 'Nullable para ter compatibilidade com projetos de curso já criados',
  `voluntario` tinyint(1) NOT NULL DEFAULT '0',
  `convite_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_docente_projeto` (`projeto_id`,`docente_id`,`perfil_pedagogico_id`,`ativo`),
  KEY `docentes_projetos_docente_id_foreign` (`docente_id`),
  KEY `docentes_projetos_perfil_pedagogico_id_foreign` (`perfil_pedagogico_id`),
  KEY `fk_convite` (`convite_id`),
  CONSTRAINT `docentes_projetos_docente_id_foreign` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `docentes_projetos_perfil_pedagogico_id_foreign` FOREIGN KEY (`perfil_pedagogico_id`) REFERENCES `perfis_pedagogicos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `docentes_projetos_projeto_id_foreign` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_convite` FOREIGN KEY (`convite_id`) REFERENCES `convites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59509 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes_reconhecimento`
--

DROP TABLE IF EXISTS `docentes_reconhecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_reconhecimento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reconhecimento_id` int unsigned NOT NULL,
  `docente_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `docentes_reconhecimento_reconhecimento_id_foreign` (`reconhecimento_id`),
  KEY `docentes_reconhecimento_docente_id_foreign` (`docente_id`),
  CONSTRAINT `docentes_reconhecimento_docente_id_foreign` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `docentes_reconhecimento_reconhecimento_id_foreign` FOREIGN KEY (`reconhecimento_id`) REFERENCES `reconhecimentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes_temas`
--

DROP TABLE IF EXISTS `docentes_temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_temas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `docente_id` int unsigned NOT NULL,
  `tema_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `docentes_temas_docente_id_foreign` (`docente_id`),
  KEY `docentes_temas_tema_id_foreign` (`tema_id`),
  CONSTRAINT `docentes_temas_docente_id_foreign` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`),
  CONSTRAINT `docentes_temas_tema_id_foreign` FOREIGN KEY (`tema_id`) REFERENCES `temas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29864 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipes_eventos`
--

DROP TABLE IF EXISTS `equipes_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipes_eventos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `evento_id` int unsigned NOT NULL,
  `funcao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `de` date DEFAULT NULL,
  `ate` date DEFAULT NULL,
  `carga_horaria` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `designacao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `emite_certificado` tinyint(1) DEFAULT NULL,
  `avaliado` tinyint(1) DEFAULT NULL,
  `orientado` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Indica se o participante deve ser orientado, o que possibilita o envio de um arquivo com orientacoes ao membro da equipe',
  `voluntario` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipes_eventos_usuario_id_evento_id_funcao_unique` (`usuario_id`,`evento_id`,`funcao`),
  KEY `equipe_evento_fk` (`evento_id`),
  CONSTRAINT `equipe_evento_fk` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `equipe_usuario_fk` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8214 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `escolas`
--

DROP TABLE IF EXISTS `escolas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escolas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sigla` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tipo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'V',
  `cep` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `uf` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `endereco` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `emails` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `telefones` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nome_diretor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cargo_diretor` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sexo_diretor` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mandato_de` date DEFAULT NULL,
  `mandato_ate` date DEFAULT NULL,
  `ativa` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `tribunal_id` int unsigned DEFAULT NULL,
  `nome_responsavel_tecnico` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `telefones_responsavel_tecnico` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `imagem_bg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Imagem de fundo da Escola para permitir customizacao do educa enfam',
  `url_logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `escolas_sigla_unique` (`sigla`),
  UNIQUE KEY `escolas_url_logo_unique` (`url_logo`),
  KEY `cidade_escola_fk` (`cidade_id`),
  KEY `escola_tribunal_fk` (`tribunal_id`),
  CONSTRAINT `cidade_escola_fk` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `escola_tribunal_fk` FOREIGN KEY (`tribunal_id`) REFERENCES `tribunais` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `carga_horaria` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `frequencia_minima` int NOT NULL,
  `uf` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cidade_id` int unsigned DEFAULT NULL,
  `template_id` int unsigned DEFAULT NULL,
  `descricao_atividade` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `exige_atividade` tinyint(1) DEFAULT '0',
  `escola_id` int unsigned DEFAULT NULL,
  `docente_template_id` int unsigned DEFAULT NULL,
  `categoria` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `avaliacao_reacao_id` int unsigned DEFAULT NULL,
  `avaliacao_docente_id` int unsigned DEFAULT NULL,
  `legado` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Indica se o evento ocorreu em datas anteriores à entrada do sistema em produção',
  `nivel` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modalidade` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P',
  `docente_convidado_template_id` int unsigned DEFAULT NULL,
  `computa_meta_fisica` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `credenciamento_id` int unsigned DEFAULT NULL,
  `template_email_confirmacao_inscricao_id` int unsigned DEFAULT NULL,
  `tolerancia_cancelamento` date NOT NULL,
  `template_email_lembrete_inscricao_id` int unsigned DEFAULT NULL,
  `template_email_cancel_inscricao_id` int unsigned DEFAULT NULL,
  `emissao_passagem_alunos` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `template_email_notificacao_conclusao_id` int unsigned DEFAULT NULL,
  `atendimento_diferenciado` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `novo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `projeto_id` int unsigned DEFAULT NULL,
  `inicio_registro_atividade` date DEFAULT NULL,
  `controle_aprovacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'A  - Automático (Moodle), M - Manual. Nullable para Modalidades diferentes de EaD',
  `template_email_inclusao_fila_espera_id` int unsigned DEFAULT NULL,
  `cursos_ead_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade_evento_fk` (`cidade_id`),
  KEY `eventos_template_id_foreign` (`template_id`),
  KEY `evento_escola_fk` (`escola_id`),
  KEY `fk_template_docente` (`docente_template_id`),
  KEY `eventos_avaliacao_reacao_id_foreign` (`avaliacao_reacao_id`),
  KEY `eventos_avaliacao_docente_id_foreign` (`avaliacao_docente_id`),
  KEY `fk_template_docente_convidado` (`docente_convidado_template_id`),
  KEY `fk_credenciamento` (`credenciamento_id`),
  KEY `fk_template_confirmacao_inscricao` (`template_email_confirmacao_inscricao_id`),
  KEY `fk_template_lembrete_inscricao` (`template_email_lembrete_inscricao_id`),
  KEY `fk_template_cancel_inscricao` (`template_email_cancel_inscricao_id`),
  KEY `fk_template_notificacao_conclusao` (`template_email_notificacao_conclusao_id`),
  KEY `eventos_projeto_id_foreign` (`projeto_id`),
  KEY `fk_template_inclusao_fila_espera` (`template_email_inclusao_fila_espera_id`),
  KEY `fk_compartilhamento_cursos_ead` (`cursos_ead_id`),
  CONSTRAINT `cidade_evento_fk` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `evento_escola_fk` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `eventos_avaliacao_docente_id_foreign` FOREIGN KEY (`avaliacao_docente_id`) REFERENCES `questionarios` (`id`) ON DELETE SET NULL,
  CONSTRAINT `eventos_avaliacao_reacao_id_foreign` FOREIGN KEY (`avaliacao_reacao_id`) REFERENCES `questionarios` (`id`) ON DELETE SET NULL,
  CONSTRAINT `eventos_projeto_id_foreign` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`) ON DELETE SET NULL,
  CONSTRAINT `eventos_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates_certificado` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_compartilhamento_cursos_ead` FOREIGN KEY (`cursos_ead_id`) REFERENCES `cursos_ead` (`id`),
  CONSTRAINT `fk_credenciamento` FOREIGN KEY (`credenciamento_id`) REFERENCES `credenciamentos` (`id`),
  CONSTRAINT `fk_template_cancel_inscricao` FOREIGN KEY (`template_email_cancel_inscricao_id`) REFERENCES `templates_email` (`id`),
  CONSTRAINT `fk_template_confirmacao_inscricao` FOREIGN KEY (`template_email_confirmacao_inscricao_id`) REFERENCES `templates_email` (`id`),
  CONSTRAINT `fk_template_docente` FOREIGN KEY (`docente_template_id`) REFERENCES `templates_certificado` (`id`),
  CONSTRAINT `fk_template_docente_convidado` FOREIGN KEY (`docente_convidado_template_id`) REFERENCES `templates_certificado` (`id`),
  CONSTRAINT `fk_template_inclusao_fila_espera` FOREIGN KEY (`template_email_inclusao_fila_espera_id`) REFERENCES `templates_email` (`id`),
  CONSTRAINT `fk_template_lembrete_inscricao` FOREIGN KEY (`template_email_lembrete_inscricao_id`) REFERENCES `templates_email` (`id`),
  CONSTRAINT `fk_template_notificacao_conclusao` FOREIGN KEY (`template_email_notificacao_conclusao_id`) REFERENCES `templates_email` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6247 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4473 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formulario_inscricao`
--

DROP TABLE IF EXISTS `formulario_inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulario_inscricao` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `evento_id` int unsigned NOT NULL,
  `ativo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `vagas` int unsigned DEFAULT NULL,
  `disponivel_de` date DEFAULT NULL,
  `disponivel_ate` date DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `descricao` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cor_fundo` char(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '#ffffff',
  `lista_espera` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `somente_magistrados` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `emissao_passagens` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Indica se o formulario disponibiliza campos para emissao de passagens',
  PRIMARY KEY (`id`),
  UNIQUE KEY `formulario_inscricao_url_unique` (`url`),
  KEY `formulario_inscricao_evento_id_foreign` (`evento_id`),
  CONSTRAINT `formulario_inscricao_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3127 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formulario_inscricao_escolas`
--

DROP TABLE IF EXISTS `formulario_inscricao_escolas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulario_inscricao_escolas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `evento_id` int unsigned NOT NULL,
  `ativo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `disponivel_de` date DEFAULT NULL,
  `disponivel_ate` date DEFAULT NULL,
  `orientacoes` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `formulario_inscricao_escolas_evento_id_foreign` (`evento_id`),
  CONSTRAINT `formulario_inscricao_escolas_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frequencias`
--

DROP TABLE IF EXISTS `frequencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frequencias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `inscricao_id` int unsigned NOT NULL,
  `periodo_evento_id` int unsigned NOT NULL,
  `registrado_por` int unsigned NOT NULL,
  `registrado_em` datetime NOT NULL,
  `situacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `motivo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `justificativa` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_inscricao_evento` (`inscricao_id`,`periodo_evento_id`),
  KEY `frequencias_periodo_evento_id_foreign` (`periodo_evento_id`),
  KEY `frequencias_registrado_por_foreign` (`registrado_por`),
  CONSTRAINT `frequencias_inscricao_id_foreign` FOREIGN KEY (`inscricao_id`) REFERENCES `inscricoes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `frequencias_periodo_evento_id_foreign` FOREIGN KEY (`periodo_evento_id`) REFERENCES `periodos_evento` (`id`) ON DELETE CASCADE,
  CONSTRAINT `frequencias_registrado_por_foreign` FOREIGN KEY (`registrado_por`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=484277 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historicos_anexos_fluxos`
--

DROP TABLE IF EXISTS `historicos_anexos_fluxos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historicos_anexos_fluxos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `justificativa` varchar(6000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `operacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `anexo_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `anexos_credenciamento_historico_usuario_id_foreign` (`usuario_id`),
  KEY `anexos_credenciamento_historico_anexo_id_foreign` (`anexo_id`),
  CONSTRAINT `anexos_credenciamento_historico_anexo_id_foreign` FOREIGN KEY (`anexo_id`) REFERENCES `anexos_fluxos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `anexos_credenciamento_historico_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inscricao_avaliacao_resposta`
--

DROP TABLE IF EXISTS `inscricao_avaliacao_resposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscricao_avaliacao_resposta` (
  `id` int unsigned NOT NULL,
  `resposta` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `inscricao_avaliacao_resposta_id_foreign` FOREIGN KEY (`id`) REFERENCES `inscricoes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inscricao_motivos_cancelamento`
--

DROP TABLE IF EXISTS `inscricao_motivos_cancelamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscricao_motivos_cancelamento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `outro_motivo` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `inscricao_id` int unsigned DEFAULT NULL,
  `motivo_id` int unsigned DEFAULT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inscricao` (`inscricao_id`),
  KEY `fk_motivo` (`motivo_id`),
  KEY `fk_inscricao_motivos_cancelmaento_usuario` (`usuario_id`),
  CONSTRAINT `fk_inscricao` FOREIGN KEY (`inscricao_id`) REFERENCES `inscricoes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_inscricao_motivos_cancelmaento_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_motivo` FOREIGN KEY (`motivo_id`) REFERENCES `motivos_cancelamento` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17897 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inscricoes`
--

DROP TABLE IF EXISTS `inscricoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscricoes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `evento_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `situacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'I',
  `criado_por` int unsigned NOT NULL,
  `origem` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `escola_id` int unsigned DEFAULT NULL,
  `email_enviado` tinyint(1) NOT NULL DEFAULT '0',
  `evento_escola_id` int unsigned DEFAULT NULL,
  `tipo_participacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'A',
  `avaliacao_respondida` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `lead_id` int unsigned DEFAULT NULL,
  `ativo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `atendimento_diferenciado` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cota_acao_afirmativa` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `forma_participacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ano_certificado` int DEFAULT NULL,
  `numero_certificado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_participacao_usuario` (`usuario_id`,`evento_id`,`tipo_participacao`),
  KEY `inscricoes_evento_id_foreign` (`evento_id`),
  KEY `fk_criador_inscricao` (`criado_por`),
  KEY `fk_escola_inscricao` (`escola_id`),
  KEY `inscricoes_escola_fk` (`evento_escola_id`),
  CONSTRAINT `fk_criador_inscricao` FOREIGN KEY (`criado_por`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_escola_inscricao` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `inscricoes_escola_fk` FOREIGN KEY (`evento_escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `inscricoes_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=386544 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB AUTO_INCREMENT=24767 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lista_espera_publica`
--

DROP TABLE IF EXISTS `lista_espera_publica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_espera_publica` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `formulario_inscricao_id` int unsigned NOT NULL,
  `categoria_id` int unsigned DEFAULT NULL,
  `tribunal_id` int unsigned DEFAULT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cpf` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `telefone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `situacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'E',
  `data_situacao` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipo_deficiencia` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Informação vinculada ao usuário',
  `atendimento_diferenciado` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Vinculada à inscrição',
  `autodeclarado` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Informação vinculada ao usuário',
  `cota_acao_afirmativa` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Vinculada à inscrição',
  `forma_participacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lista_espera_publica_categoria_id_foreign` (`categoria_id`),
  KEY `lista_espera_publica_tribunal_id_foreign` (`tribunal_id`),
  KEY `lista_espera_publica_formulario_inscricao_id_foreign` (`formulario_inscricao_id`),
  CONSTRAINT `lista_espera_publica_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias_profissionais` (`id`),
  CONSTRAINT `lista_espera_publica_formulario_inscricao_id_foreign` FOREIGN KEY (`formulario_inscricao_id`) REFERENCES `formulario_inscricao` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lista_espera_publica_tribunal_id_foreign` FOREIGN KEY (`tribunal_id`) REFERENCES `tribunais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33204 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_acessos_usuarios`
--

DROP TABLE IF EXISTS `log_acessos_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_acessos_usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_acessos_usuarios_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `log_acessos_usuarios_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2864426 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_certificados`
--

DROP TABLE IF EXISTS `log_certificados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_certificados` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `inscricao_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_certificados_inscricao_id_foreign` (`inscricao_id`),
  CONSTRAINT `log_certificados_inscricao_id_foreign` FOREIGN KEY (`inscricao_id`) REFERENCES `inscricoes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=196075 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_finalizacao_eventos`
--

DROP TABLE IF EXISTS `log_finalizacao_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_finalizacao_eventos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `evento_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_finalizacao_eventos_usuario_id_foreign` (`usuario_id`),
  KEY `log_finalizacao_eventos_evento_id_foreign` (`evento_id`),
  CONSTRAINT `log_finalizacao_eventos_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `log_finalizacao_eventos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8544 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_frequencias`
--

DROP TABLE IF EXISTS `log_frequencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_frequencias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `erro` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `json_frequencia` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9844 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lote_documentos_sei`
--

DROP TABLE IF EXISTS `lote_documentos_sei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote_documentos_sei` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `evento_id` int unsigned NOT NULL,
  `numero_processo_sei` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_processo_sei` int NOT NULL,
  `iniciado_em` datetime DEFAULT NULL,
  `finalizado_em` datetime DEFAULT NULL,
  `qtd_itens_total` int NOT NULL DEFAULT '0',
  `qtd_itens_enviados` int NOT NULL DEFAULT '0',
  `tipo_documento_sei` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `situacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mensagens` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci COMMENT 'Guarda as mensagens de erro dos itens do lote',
  `proponente` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_evento` (`evento_id`),
  CONSTRAINT `fk_evento` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `magistrados_receita`
--

DROP TABLE IF EXISTS `magistrados_receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magistrados_receita` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `nome_mae` text,
  `natureza_ocupacao_id` int DEFAULT NULL,
  `ocupacao_principal_id` int DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mandato_escolas`
--

DROP TABLE IF EXISTS `mandato_escolas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mandato_escolas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome_diretor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cargo_diretor` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sexo_diretor` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mandato_de` date NOT NULL,
  `mandato_ate` date NOT NULL,
  `escola_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mandato_escolas_escola_id_foreign` (`escola_id`),
  CONSTRAINT `mandato_escolas_escola_id_foreign` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=590 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mensagens_replicacao`
--

DROP TABLE IF EXISTS `mensagens_replicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensagens_replicacao` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `remetente_id` int unsigned DEFAULT NULL,
  `replicacao_id` int unsigned NOT NULL,
  `mensagem` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mensagens_replicacao_remetente_id_foreign` (`remetente_id`),
  KEY `mensagens_replicacao_replicacao_id_foreign` (`replicacao_id`),
  CONSTRAINT `mensagens_replicacao_remetente_id_foreign` FOREIGN KEY (`remetente_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mensagens_replicacao_replicacao_id_foreign` FOREIGN KEY (`replicacao_id`) REFERENCES `replicacoes_credenciamento` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1131 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `model_history`
--

DROP TABLE IF EXISTS `model_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int unsigned NOT NULL,
  `tabela` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `alteracao` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `alterado_por` int unsigned NOT NULL,
  `rota` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip_usuario` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `action` enum('C','U','D') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'C',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3537720 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motivos_cancelamento`
--

DROP TABLE IF EXISTS `motivos_cancelamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motivos_cancelamento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `texto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `padrao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lote` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notificacoes_andamentos`
--

DROP TABLE IF EXISTS `notificacoes_andamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacoes_andamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `destinatario` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enviado_em` datetime DEFAULT NULL,
  `lido_em` datetime DEFAULT NULL,
  `andamento_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notificacoes_credenciamento_andamento_id_foreign` (`andamento_id`),
  CONSTRAINT `notificacoes_credenciamento_andamento_id_foreign` FOREIGN KEY (`andamento_id`) REFERENCES `andamentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38384 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notificacoes_inscricao`
--

DROP TABLE IF EXISTS `notificacoes_inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacoes_inscricao` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `destinatario` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tipo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P',
  `enviado_em` datetime DEFAULT NULL,
  `lido_em` datetime DEFAULT NULL,
  `inscricao_id` int unsigned DEFAULT NULL,
  `enviar_em` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notificacoes_inscricao_inscricao_id_foreign` (`inscricao_id`),
  CONSTRAINT `notificacoes_inscricao_inscricao_id_foreign` FOREIGN KEY (`inscricao_id`) REFERENCES `inscricoes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=436324 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `numeros_portaria`
--

DROP TABLE IF EXISTS `numeros_portaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numeros_portaria` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `credenciamento_id` int unsigned DEFAULT NULL,
  `anexo_id` int unsigned DEFAULT NULL,
  `numero` int unsigned NOT NULL,
  `ano` int unsigned NOT NULL,
  `situacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numeros_portaria_ano_numero_unique` (`ano`,`numero`),
  KEY `numeros_portaria_credenciamento_id_foreign` (`credenciamento_id`),
  KEY `numeros_portaria_anexo_id_foreign` (`anexo_id`),
  CONSTRAINT `numeros_portaria_anexo_id_foreign` FOREIGN KEY (`anexo_id`) REFERENCES `anexos_credenciamento` (`id`) ON DELETE CASCADE,
  CONSTRAINT `numeros_portaria_credenciamento_id_foreign` FOREIGN KEY (`credenciamento_id`) REFERENCES `credenciamentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2434 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `numeros_portaria_reconhecimento`
--

DROP TABLE IF EXISTS `numeros_portaria_reconhecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numeros_portaria_reconhecimento` (
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reconhecimento_id` int unsigned DEFAULT NULL,
  `anexo_id` int unsigned DEFAULT NULL,
  `numero` int unsigned NOT NULL,
  `ano` int unsigned NOT NULL,
  `situacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P',
  PRIMARY KEY (`id`),
  UNIQUE KEY `numeros_portaria_reconhecimento_ano_numero_unique` (`ano`,`numero`),
  KEY `numeros_portaria_reconhecimento_reconhecimento_id_foreign` (`reconhecimento_id`),
  KEY `numeros_portaria_reconhecimento_anexo_id_foreign` (`anexo_id`),
  CONSTRAINT `numeros_portaria_reconhecimento_anexo_id_foreign` FOREIGN KEY (`anexo_id`) REFERENCES `anexos_reconhecimento` (`id`) ON DELETE CASCADE,
  CONSTRAINT `numeros_portaria_reconhecimento_reconhecimento_id_foreign` FOREIGN KEY (`reconhecimento_id`) REFERENCES `reconhecimentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opcoes_publico_alvo`
--

DROP TABLE IF EXISTS `opcoes_publico_alvo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcoes_publico_alvo` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametros` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `chave` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `valor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parametros_chave_unique` (`chave`),
  KEY `parametros_chave_index` (`chave`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perfis_pedagogicos`
--

DROP TABLE IF EXISTS `perfis_pedagogicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfis_pedagogicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodo_evento_docentes`
--

DROP TABLE IF EXISTS `periodo_evento_docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo_evento_docentes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `periodo_evento_id` int unsigned NOT NULL,
  `evento_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `periodo_evento_docentes_usuario_id_foreign` (`usuario_id`),
  KEY `periodo_evento_docentes_periodo_evento_id_foreign` (`periodo_evento_id`),
  KEY `periodo_evento_docentes_evento_id_foreign` (`evento_id`),
  CONSTRAINT `periodo_evento_docentes_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `periodo_evento_docentes_periodo_evento_id_foreign` FOREIGN KEY (`periodo_evento_id`) REFERENCES `periodos_evento` (`id`) ON DELETE CASCADE,
  CONSTRAINT `periodo_evento_docentes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18428 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `descricao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `disponivel_de` datetime NOT NULL,
  `disponivel_ate` datetime DEFAULT NULL,
  `execucao_de` date NOT NULL,
  `execucao_ate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodos_evento`
--

DROP TABLE IF EXISTS `periodos_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodos_evento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `evento_id` int unsigned NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  `tolerancia_minima` int NOT NULL DEFAULT '15',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tolerancia_maxima` int NOT NULL DEFAULT '15',
  `nome` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `periodos_evento_evento_id_foreign` (`evento_id`),
  CONSTRAINT `periodos_evento_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40723 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `label` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portarias_compartilhamento_ead`
--

DROP TABLE IF EXISTS `portarias_compartilhamento_ead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portarias_compartilhamento_ead` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `compartilhamento_ead_id` int unsigned NOT NULL,
  `data_portaria_publicacao` date NOT NULL,
  `data_portaria_validade` date DEFAULT NULL,
  `data_solicitacao_revalidacao` date DEFAULT NULL,
  `data_atendimento_revalidacao` date DEFAULT NULL,
  `portaria_compartilhamento` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url_portaria` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_portarias_compartilhamento_ead_compartilhamentos_ead` (`compartilhamento_ead_id`),
  CONSTRAINT `fk_portarias_compartilhamento_ead_compartilhamentos_ead` FOREIGN KEY (`compartilhamento_ead_id`) REFERENCES `compartilhamentos_ead` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `previsoes_orcamentarias_projetos`
--

DROP TABLE IF EXISTS `previsoes_orcamentarias_projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `previsoes_orcamentarias_projetos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projeto_id` int unsigned NOT NULL,
  `tipo_id` int unsigned NOT NULL,
  `quantidade` double(10,2) NOT NULL,
  `valor_unitario` double(10,2) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `descricao_outro` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Para o usuario especificar o tipo quando selecionar Outro',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `docente_projeto_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `previsoes_orcamentarias_projetos_projeto_id_foreign` (`projeto_id`),
  KEY `previsoes_orcamentarias_projetos_tipo_id_foreign` (`tipo_id`),
  KEY `fk_dp_po` (`docente_projeto_id`),
  CONSTRAINT `fk_dp_po` FOREIGN KEY (`docente_projeto_id`) REFERENCES `docentes_projetos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `previsoes_orcamentarias_projetos_projeto_id_foreign` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `previsoes_orcamentarias_projetos_tipo_id_foreign` FOREIGN KEY (`tipo_id`) REFERENCES `tipos_previsao_orcamentaria` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2727 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projetos`
--

DROP TABLE IF EXISTS `projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projetos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `escola_id` int unsigned DEFAULT NULL,
  `demanda_projeto_id` int unsigned NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `vagas` smallint unsigned DEFAULT NULL COMMENT 'Quantidade de vagas',
  `carga_horaria` decimal(6,2) DEFAULT NULL,
  `frequencia_minima` tinyint unsigned DEFAULT NULL,
  `tipo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Curso, oficina, etc',
  `categoria` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'formacao Inicial, formacao Continuada, formacao de Formadores',
  `nivel` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Nivel/equivalencia',
  `modalidade` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Presencial, Semi presencial ou Ead',
  `uf` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cidade_id` int unsigned DEFAULT NULL,
  `endereco` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `objetivo_geral` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `objetivo_especifico` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `metodologia` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `justificativa` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `atribuicoes_formador` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sistema_avaliacao` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `parcerias` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `observacoes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ultimo_andamento` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Para facilitar a exibicao da situacao atual do projeto',
  `computa_meta_fisica` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `curso_novo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Utilizado no indicador 14 - cursos novos',
  `emissao_passagem_alunos` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `tolerancia_cancelamento` date DEFAULT NULL,
  `inicio_inscricoes` date DEFAULT NULL,
  `fim_inscricoes` date DEFAULT NULL,
  `ementa` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `conteudo_programatico` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `bibliografia` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `bloqueado_ate` timestamp NULL DEFAULT NULL,
  `bloqueado_por` int unsigned DEFAULT NULL,
  `numero_sei` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Número do processo no SEI, obrigatório na assinatura',
  `orientacoes_elaboracao` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `projeto_escola_fk` (`escola_id`),
  KEY `projetos_demanda_projeto_id_foreign` (`demanda_projeto_id`),
  KEY `cidade_projeto_fk` (`cidade_id`),
  KEY `fk_projeto_bloqueado_por` (`bloqueado_por`),
  CONSTRAINT `cidade_projeto_fk` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_projeto_bloqueado_por` FOREIGN KEY (`bloqueado_por`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projeto_escola_fk` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projetos_demanda_projeto_id_foreign` FOREIGN KEY (`demanda_projeto_id`) REFERENCES `demandas_projetos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propostas`
--

DROP TABLE IF EXISTS `propostas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propostas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `escola_id` int unsigned NOT NULL,
  `periodo_id` int unsigned DEFAULT NULL,
  `tipo_curso_id` int unsigned NOT NULL,
  `nome` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `previsao_inicio` date NOT NULL,
  `carga_horaria` int NOT NULL,
  `finalidade` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modalidade` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P',
  `vagas` int NOT NULL,
  `cessao_vagas` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `vagas_cedidas` int DEFAULT NULL,
  `descricao` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propostas_escola_id_foreign` (`escola_id`),
  KEY `propostas_periodo_id_foreign` (`periodo_id`),
  KEY `propostas_tipo_curso_id_foreign` (`tipo_curso_id`),
  CONSTRAINT `propostas_escola_id_foreign` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `propostas_periodo_id_foreign` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `propostas_tipo_curso_id_foreign` FOREIGN KEY (`tipo_curso_id`) REFERENCES `temas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publico_alvo_demanda`
--

DROP TABLE IF EXISTS `publico_alvo_demanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publico_alvo_demanda` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `demanda_id` int unsigned NOT NULL,
  `opcao_id` tinyint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `publico_alvo_demanda_demanda_id_foreign` (`demanda_id`),
  KEY `publico_alvo_demanda_opcao_id_foreign` (`opcao_id`),
  CONSTRAINT `publico_alvo_demanda_demanda_id_foreign` FOREIGN KEY (`demanda_id`) REFERENCES `demandas_projetos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `publico_alvo_demanda_opcao_id_foreign` FOREIGN KEY (`opcao_id`) REFERENCES `opcoes_publico_alvo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=747 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publico_alvo_projeto`
--

DROP TABLE IF EXISTS `publico_alvo_projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publico_alvo_projeto` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projeto_id` int unsigned NOT NULL,
  `opcao_id` tinyint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `publico_alvo_projeto_projeto_id_foreign` (`projeto_id`),
  KEY `publico_alvo_projeto_opcao_id_foreign` (`opcao_id`),
  CONSTRAINT `publico_alvo_projeto_opcao_id_foreign` FOREIGN KEY (`opcao_id`) REFERENCES `opcoes_publico_alvo` (`id`) ON DELETE CASCADE,
  CONSTRAINT `publico_alvo_projeto_projeto_id_foreign` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1060 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionario_grupos`
--

DROP TABLE IF EXISTS `questionario_grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionario_grupos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ordem` tinyint NOT NULL,
  `questionario_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionario_grupos_questionario_id_foreign` (`questionario_id`),
  CONSTRAINT `questionario_grupos_questionario_id_foreign` FOREIGN KEY (`questionario_id`) REFERENCES `questionarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionario_questoes`
--

DROP TABLE IF EXISTS `questionario_questoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionario_questoes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ordem` tinyint NOT NULL,
  `enunciado` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `grupo_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `obrigatorio` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionario_questoes_grupo_id_foreign` (`grupo_id`),
  CONSTRAINT `questionario_questoes_grupo_id_foreign` FOREIGN KEY (`grupo_id`) REFERENCES `questionario_grupos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1810 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionario_respostas`
--

DROP TABLE IF EXISTS `questionario_respostas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionario_respostas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `resposta_string` varchar(6000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `resposta_int` tinyint DEFAULT NULL,
  `questao_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `evento_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `questionario_id` int unsigned DEFAULT NULL,
  `docente_id` int unsigned DEFAULT NULL,
  `diario` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `questionario_respostas_questao_id_foreign` (`questao_id`),
  KEY `questionario_respostas_usuario_id_foreign` (`usuario_id`),
  KEY `questionario_respostas_evento_id_foreign` (`evento_id`),
  KEY `questionario_respostas_questionario_id_foreign` (`questionario_id`),
  KEY `questionario_respostas_docente_id_foreign` (`docente_id`),
  CONSTRAINT `questionario_respostas_docente_id_foreign` FOREIGN KEY (`docente_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  CONSTRAINT `questionario_respostas_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `questionario_respostas_questao_id_foreign` FOREIGN KEY (`questao_id`) REFERENCES `questionario_questoes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `questionario_respostas_questionario_id_foreign` FOREIGN KEY (`questionario_id`) REFERENCES `questionarios` (`id`) ON DELETE SET NULL,
  CONSTRAINT `questionario_respostas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=842927 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionarios`
--

DROP TABLE IF EXISTS `questionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipo` tinyint NOT NULL,
  `escola_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionarios_escola_id_foreign` (`escola_id`),
  CONSTRAINT `questionarios_escola_id_foreign` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reconhecimentos`
--

DROP TABLE IF EXISTS `reconhecimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reconhecimentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `natureza` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Formacao inicial, continuada, etc.',
  `modalidade` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Presencial, Semipresencial e EaD',
  `carga_horaria` int unsigned DEFAULT NULL,
  `vagas_por_turma` int unsigned DEFAULT NULL,
  `inscricao_de` date DEFAULT NULL,
  `inscricao_ate` date DEFAULT NULL,
  `realizacao_de` date DEFAULT NULL,
  `realizacao_ate` date DEFAULT NULL,
  `numero_protocolo` int unsigned DEFAULT NULL,
  `ano_protocolo` int unsigned DEFAULT NULL,
  `uf` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cidade_id` int unsigned DEFAULT NULL,
  `escola_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `situacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`),
  KEY `reconhecimentos_cidade_id_foreign` (`cidade_id`),
  KEY `reconhecimentos_escola_id_foreign` (`escola_id`),
  CONSTRAINT `reconhecimentos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reconhecimentos_escola_id_foreign` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regras_remuneracao_docentes`
--

DROP TABLE IF EXISTS `regras_remuneracao_docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regras_remuneracao_docentes` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `titulacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `perfil_pedagogico_id` int unsigned NOT NULL,
  `remuneracao` int NOT NULL COMMENT 'Valor da remuneracao, em centavos',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `regra_unq` (`titulacao`,`perfil_pedagogico_id`),
  KEY `regras_remuneracao_docentes_perfil_pedagogico_id_foreign` (`perfil_pedagogico_id`),
  CONSTRAINT `regras_remuneracao_docentes_perfil_pedagogico_id_foreign` FOREIGN KEY (`perfil_pedagogico_id`) REFERENCES `perfis_pedagogicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replicacoes_credenciamento`
--

DROP TABLE IF EXISTS `replicacoes_credenciamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replicacoes_credenciamento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `credenciamento_id` int unsigned NOT NULL,
  `anexo_id` int unsigned DEFAULT NULL,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `observacao` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nova_replicacao` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `aprovacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `replicacoes_credenciamento_credenciamento_id_foreign` (`credenciamento_id`),
  KEY `replicacoes_credenciamento_anexo_id_foreign` (`anexo_id`),
  CONSTRAINT `replicacoes_credenciamento_anexo_id_foreign` FOREIGN KEY (`anexo_id`) REFERENCES `anexos_credenciamento` (`id`) ON DELETE CASCADE,
  CONSTRAINT `replicacoes_credenciamento_credenciamento_id_foreign` FOREIGN KEY (`credenciamento_id`) REFERENCES `credenciamentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=778 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `responsaveis_credenciamento`
--

DROP TABLE IF EXISTS `responsaveis_credenciamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsaveis_credenciamento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `credenciamento_id` int unsigned NOT NULL,
  `tarefa_id` int unsigned NOT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `responsaveis_credenciamento_credenciamento_id_foreign` (`credenciamento_id`),
  KEY `responsaveis_credenciamento_tarefa_id_foreign` (`tarefa_id`),
  KEY `responsaveis_credenciamento_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `responsaveis_credenciamento_credenciamento_id_foreign` FOREIGN KEY (`credenciamento_id`) REFERENCES `credenciamentos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `responsaveis_credenciamento_tarefa_id_foreign` FOREIGN KEY (`tarefa_id`) REFERENCES `tarefas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `responsaveis_credenciamento_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2690 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `responsaveis_projeto`
--

DROP TABLE IF EXISTS `responsaveis_projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsaveis_projeto` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projeto_id` int unsigned NOT NULL,
  `tarefa_id` int unsigned NOT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `responsaveis_projeto_projeto_id_foreign` (`projeto_id`),
  KEY `responsaveis_projeto_tarefa_id_foreign` (`tarefa_id`),
  KEY `responsaveis_projeto_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `responsaveis_projeto_projeto_id_foreign` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `responsaveis_projeto_tarefa_id_foreign` FOREIGN KEY (`tarefa_id`) REFERENCES `tarefas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `responsaveis_projeto_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_permissions_permission_id_foreign` (`permission_id`),
  KEY `role_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `label` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `left` int DEFAULT NULL,
  `right` int DEFAULT NULL,
  `depth` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpds`
--

DROP TABLE IF EXISTS `rpds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lote_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `situacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `id_documento_sei` int DEFAULT NULL,
  `url_documento_sei` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mensagem_retorno` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `processado_em` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deslocamento_id` int unsigned DEFAULT NULL,
  `funcao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lote_item` (`lote_id`),
  KEY `fk_usuario_lote` (`usuario_id`),
  KEY `fk_deslocamento_lote` (`deslocamento_id`),
  CONSTRAINT `fk_deslocamento_lote` FOREIGN KEY (`deslocamento_id`) REFERENCES `deslocamentos` (`id`),
  CONSTRAINT `fk_lote_item` FOREIGN KEY (`lote_id`) REFERENCES `lote_documentos_sei` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_usuario_lote` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1081 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tarefas`
--

DROP TABLE IF EXISTS `tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Nome único da tarefa',
  `rota` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Local do arquivo que implementa a tarefa',
  `ordem` int NOT NULL DEFAULT '1' COMMENT 'Utilizado para ordenar a tarefa em listas',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P',
  `fluxo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'C',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fluxo_nome_unq` (`fluxo`,`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tarefas_credenciamento`
--

DROP TABLE IF EXISTS `tarefas_credenciamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas_credenciamento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `credenciamento_id` int unsigned NOT NULL,
  `tarefa_id` int unsigned NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data_transicao` datetime DEFAULT NULL COMMENT 'Data em que a tarefa executará transição automática para a próxima tarefa.',
  `anotacao` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci COMMENT 'Anotações para uma determinada tarefa',
  PRIMARY KEY (`id`),
  KEY `tarefas_credenciamento_credenciamento_id_foreign` (`credenciamento_id`),
  KEY `tarefas_credenciamento_tarefa_id_foreign` (`tarefa_id`),
  CONSTRAINT `tarefas_credenciamento_credenciamento_id_foreign` FOREIGN KEY (`credenciamento_id`) REFERENCES `credenciamentos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tarefas_credenciamento_tarefa_id_foreign` FOREIGN KEY (`tarefa_id`) REFERENCES `tarefas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32589 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tarefas_projetos`
--

DROP TABLE IF EXISTS `tarefas_projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas_projetos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projeto_id` int unsigned NOT NULL,
  `tarefa_id` int unsigned NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tarefas_projetos_projeto_id_foreign` (`projeto_id`),
  KEY `tarefas_projetos_tarefa_id_foreign` (`tarefa_id`),
  CONSTRAINT `tarefas_projetos_projeto_id_foreign` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tarefas_projetos_tarefa_id_foreign` FOREIGN KEY (`tarefa_id`) REFERENCES `tarefas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3596 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temas`
--

DROP TABLE IF EXISTS `temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tema_pai_id` int unsigned DEFAULT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `aceita_outros` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `temas_tema_pai_id_foreign` (`tema_pai_id`),
  CONSTRAINT `temas_tema_pai_id_foreign` FOREIGN KEY (`tema_pai_id`) REFERENCES `temas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templates_certificado`
--

DROP TABLE IF EXISTS `templates_certificado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templates_certificado` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cor` char(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `altura_footer` int NOT NULL,
  `altura_texto` int NOT NULL,
  `altura_local` int NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `texto` varchar(6000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `escola_id` int unsigned DEFAULT NULL,
  `margem_esquerda` int unsigned NOT NULL DEFAULT '20',
  `margem_direita` int unsigned NOT NULL DEFAULT '20',
  `ativo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `template_escola_fk` (`escola_id`),
  CONSTRAINT `template_escola_fk` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=873 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templates_email`
--

DROP TABLE IF EXISTS `templates_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templates_email` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `assunto` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `texto` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `assinatura` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tipo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `envia_credenciais` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `escola_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `de` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Nome que aparece como remetente da mensagem',
  `responder_para` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'E-mail que receberá as respostas às mensagens enviadas',
  PRIMARY KEY (`id`),
  KEY `template_email_escola_fk` (`escola_id`),
  CONSTRAINT `template_email_escola_fk` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=667 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipos_andamento`
--

DROP TABLE IF EXISTS `tipos_andamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_andamento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `visibilidade` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'E' COMMENT 'Externa/Interna. Andamentos internos só são visíveis para pessoas da ENFAM',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fluxo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipos_anexo_credenciamento`
--

DROP TABLE IF EXISTS `tipos_anexo_credenciamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_anexo_credenciamento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `extensoes_aceitas` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ordem` int unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipos_anexo_docente`
--

DROP TABLE IF EXISTS `tipos_anexo_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_anexo_docente` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `extensoes_aceitas` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exige_evento` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Indica se, ao anexar um documento deste tipo, é obrigatório selecionar um evento',
  `permissao` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Permissão necessária para anexar documentos deste tipo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipos_anexo_evento`
--

DROP TABLE IF EXISTS `tipos_anexo_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_anexo_evento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `extensoes_aceitas` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `visibilidade` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipos_anexos_projetos`
--

DROP TABLE IF EXISTS `tipos_anexos_projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_anexos_projetos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `extensoes_aceitas` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ordem` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipos_previsao_orcamentaria`
--

DROP TABLE IF EXISTS `tipos_previsao_orcamentaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_previsao_orcamentaria` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `valor_padrao` int DEFAULT NULL COMMENT 'Valor padrão para o tipo, em centavos',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transicoes`
--

DROP TABLE IF EXISTS `transicoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transicoes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tarefa_origem_id` int unsigned DEFAULT NULL,
  `tarefa_destino_id` int unsigned NOT NULL,
  `tipo_andamento_id` int unsigned NOT NULL,
  `titulo` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `regras` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Regras para que a transição ocorra. São nomes de métodos da classe FluxoCredenciamentoManager, separados por virgula. Estes métodos serão chamados quando o usuário efetuar a transição.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notificacoes` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rota` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Local do arquivo que implementa a tela da transição.',
  `tipos_anexos` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Lista de ids de tipos de anexos de credenciamento, separados por vírgula. Ex: 1,2,3',
  `automatica` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Indica se é uma transicao automática, executada somente pelo sistema após alguma condição',
  `prazo` int DEFAULT NULL COMMENT 'Prazo para transição automática da próxima tarefa.',
  `condicao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transicoes_tarefa_origem_id_foreign` (`tarefa_origem_id`),
  KEY `transicoes_tarefa_destino_id_foreign` (`tarefa_destino_id`),
  KEY `transicoes_tipo_andamento_id_foreign` (`tipo_andamento_id`),
  CONSTRAINT `transicoes_tarefa_destino_id_foreign` FOREIGN KEY (`tarefa_destino_id`) REFERENCES `tarefas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transicoes_tarefa_origem_id_foreign` FOREIGN KEY (`tarefa_origem_id`) REFERENCES `tarefas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transicoes_tipo_andamento_id_foreign` FOREIGN KEY (`tipo_andamento_id`) REFERENCES `tipos_andamento` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tribunais`
--

DROP TABLE IF EXISTS `tribunais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tribunais` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ramo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nome` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uf` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `regiao` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sigla` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario_roles`
--

DROP TABLE IF EXISTS `usuario_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `escola_id` int unsigned DEFAULT NULL,
  `padrao` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_roles_usuario_id_foreign` (`usuario_id`),
  KEY `usuario_roles_role_id_foreign` (`role_id`),
  KEY `usuario_roles_escola_fk` (`escola_id`),
  CONSTRAINT `usuario_roles_escola_fk` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usuario_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usuario_roles_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5702 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cpf` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `senha` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `telefone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `categoria_id` int unsigned DEFAULT NULL,
  `tribunal_id` int unsigned DEFAULT NULL,
  `cadastro_completo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `magistrado_confirmado` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `magistrado_confirmado_por` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `estrangeiro` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `tipo_deficiencia` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cargo_equivalente` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `aposentado` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `cargo` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Ministro, Desembargador, Juiz, Analista, Tecnico, Outros',
  `titulacao` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `autodeclarado` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `emailenfam` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `redefinir_senha` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `data_senha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_cpf_unique` (`cpf`),
  UNIQUE KEY `usuarios_email_unique` (`email`),
  KEY `categoria_usuario_fk` (`categoria_id`),
  KEY `categoria_tribunal_fk` (`tribunal_id`),
  CONSTRAINT `categoria_tribunal_fk` FOREIGN KEY (`tribunal_id`) REFERENCES `tribunais` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categoria_usuario_fk` FOREIGN KEY (`categoria_id`) REFERENCES `categorias_profissionais` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=143391 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `versoes_anexos_fluxos`
--

DROP TABLE IF EXISTS `versoes_anexos_fluxos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versoes_anexos_fluxos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `anexo_id` int unsigned NOT NULL,
  `anexado_por` int unsigned NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `versoes_anexo_credenciamento_anexado_por_foreign` (`anexado_por`),
  KEY `versoes_anexo_credenciamento_anexo_id_foreign` (`anexo_id`),
  CONSTRAINT `versoes_anexo_credenciamento_anexado_por_foreign` FOREIGN KEY (`anexado_por`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `versoes_anexo_credenciamento_anexo_id_foreign` FOREIGN KEY (`anexo_id`) REFERENCES `anexos_fluxos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15592 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vwUsuarios`
--

DROP TABLE IF EXISTS `vwUsuarios`;
/*!50001 DROP VIEW IF EXISTS `vwUsuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwUsuarios` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `email`,
 1 AS `cpf`,
 1 AS `telefone`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'educaenfam'
--

--
-- Dumping routines for database 'educaenfam'
--

--
-- Final view structure for view `vwUsuarios`
--

/*!50001 DROP VIEW IF EXISTS `vwUsuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vwUsuarios` AS select `usuarios`.`id` AS `id`,`usuarios`.`nome` AS `nome`,`usuarios`.`email` AS `email`,`usuarios`.`cpf` AS `cpf`,`usuarios`.`telefone` AS `telefone` from `usuarios` limit 100 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-14 16:15:10
