-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: faculdade
-- ------------------------------------------------------
-- Server version	8.4.2

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `nome` varchar(255) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `matricula` varchar(10) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES ('Alysson Faria','1999-01-30','93672','Rua José Lucas Gontijo');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disciplina`
--

DROP TABLE IF EXISTS `aluno_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_disciplina` (
  `aluno_matricula` varchar(10) NOT NULL,
  `nome_disciplina` varchar(255) NOT NULL,
  PRIMARY KEY (`aluno_matricula`,`nome_disciplina`),
  KEY `nome_disciplina` (`nome_disciplina`),
  CONSTRAINT `aluno_disciplina_ibfk_1` FOREIGN KEY (`aluno_matricula`) REFERENCES `aluno` (`matricula`),
  CONSTRAINT `aluno_disciplina_ibfk_2` FOREIGN KEY (`aluno_matricula`) REFERENCES `aluno` (`matricula`),
  CONSTRAINT `aluno_disciplina_ibfk_3` FOREIGN KEY (`nome_disciplina`) REFERENCES `disciplina` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disciplina`
--

LOCK TABLES `aluno_disciplina` WRITE;
/*!40000 ALTER TABLE `aluno_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `data_hora` datetime NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `nota` int DEFAULT NULL,
  `prof_cpf` varchar(11) NOT NULL,
  PRIMARY KEY (`data_hora`,`prof_cpf`),
  KEY `prof_cpf` (`prof_cpf`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`prof_cpf`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `local` varchar(255) DEFAULT NULL,
  `cpf_prof_chefe` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  KEY `cpf_prof_chefe` (`cpf_prof_chefe`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`cpf_prof_chefe`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `nome` varchar(255) NOT NULL,
  `carga_horaria` int NOT NULL DEFAULT '30',
  `ementa` text,
  `disc_pre_requisito` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nome`),
  KEY `disc_pre_requisito` (`disc_pre_requisito`),
  CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`disc_pre_requisito`) REFERENCES `disciplina` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES ('Cinética de Reatores',40,'Taxa de reação, CSTR, PFR',NULL);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prof_disciplina`
--

DROP TABLE IF EXISTS `prof_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prof_disciplina` (
  `prof_cpf` varchar(11) NOT NULL,
  `nome_disciplina` varchar(255) NOT NULL,
  PRIMARY KEY (`prof_cpf`,`nome_disciplina`),
  KEY `nome_disciplina` (`nome_disciplina`),
  CONSTRAINT `prof_disciplina_ibfk_1` FOREIGN KEY (`prof_cpf`) REFERENCES `professor` (`cpf`),
  CONSTRAINT `prof_disciplina_ibfk_2` FOREIGN KEY (`prof_cpf`) REFERENCES `professor` (`cpf`),
  CONSTRAINT `prof_disciplina_ibfk_3` FOREIGN KEY (`nome_disciplina`) REFERENCES `disciplina` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_disciplina`
--

LOCK TABLES `prof_disciplina` WRITE;
/*!40000 ALTER TABLE `prof_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `prof_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `inicio_contrato` date NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `depto_id` int DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `depto_id` (`depto_id`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`depto_id`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('2010-01-01','André Gustavo Sato','10987667854',NULL);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_contato`
--

DROP TABLE IF EXISTS `professor_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_contato` (
  `prof_cpf` varchar(11) NOT NULL,
  `contato` varchar(14) NOT NULL,
  PRIMARY KEY (`prof_cpf`,`contato`),
  CONSTRAINT `professor_contato_ibfk_1` FOREIGN KEY (`prof_cpf`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_contato`
--

LOCK TABLES `professor_contato` WRITE;
/*!40000 ALTER TABLE `professor_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor_contato` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27 17:17:36
