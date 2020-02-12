-- MySQL dump 10.13  Distrib 5.5.45, for Win64 (x86)
--
-- Host: localhost    Database: mozart_integration
-- ------------------------------------------------------
-- Server version	5.5.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_aconselhamento`
--

DROP TABLE IF EXISTS `t_aconselhamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_aconselhamento` (
  `idaconselhamento` int(11) NOT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `criteriosmedicos` varchar(50) DEFAULT NULL,
  `conceitos` tinyint(1) DEFAULT NULL,
  `interessado` tinyint(1) DEFAULT NULL,
  `confidente` tinyint(1) DEFAULT NULL,
  `apareceregularmente` tinyint(1) DEFAULT NULL,
  `riscopobreaderencia` tinyint(1) DEFAULT NULL,
  `regimetratamento` tinyint(1) DEFAULT NULL,
  `prontotarv` tinyint(1) DEFAULT NULL,
  `datapronto` datetime DEFAULT NULL,
  `obs` text,
  `encounter_id` int(11) DEFAULT NULL,
  `hdd` varchar(20) NOT NULL,
  PRIMARY KEY (`idaconselhamento`,`hdd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_aconselhamento`
--

LOCK TABLES `t_aconselhamento` WRITE;
/*!40000 ALTER TABLE `t_aconselhamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_aconselhamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_actividadeaconselhamento`
--

DROP TABLE IF EXISTS `t_actividadeaconselhamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_actividadeaconselhamento` (
  `idaconselhamento` int(11) DEFAULT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `nrsessao` int(11) DEFAULT NULL,
  `tipoactividade` varchar(50) DEFAULT NULL,
  `apresentouconfidente` tinyint(1) DEFAULT NULL,
  `hdd` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_actividadeaconselhamento`
--

LOCK TABLES `t_actividadeaconselhamento` WRITE;
/*!40000 ALTER TABLE `t_actividadeaconselhamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_actividadeaconselhamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_adulto`
--

DROP TABLE IF EXISTS `t_adulto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_adulto` (
  `nid` varchar(50) NOT NULL,
  `codprofissao` varchar(50) DEFAULT NULL,
  `codnivel` varchar(50) DEFAULT NULL,
  `nrconviventes` varchar(50) DEFAULT NULL,
  `codestadocivil` varchar(50) DEFAULT NULL,
  `nrconjuges` varchar(50) DEFAULT NULL,
  `serologiaHivconjuge` varchar(50) DEFAULT NULL,
  `Nrprocesso` varchar(50) DEFAULT NULL,
  `outrosparceiros` varchar(50) DEFAULT NULL,
  `nrfilhos` int(11) DEFAULT NULL,
  `nrfilhostestados` int(11) DEFAULT NULL,
  `nrfilhoshiv` int(11) DEFAULT NULL,
  `tabaco` tinyint(4) DEFAULT NULL,
  `alcool` tinyint(4) DEFAULT NULL,
  `droga` tinyint(4) DEFAULT NULL,
  `nrparceiros` int(11) DEFAULT NULL,
  `antecedentesgenelogicos` longtext,
  `datamestruacao` datetime DEFAULT NULL,
  `aborto` tinyint(4) DEFAULT NULL,
  `ptv` tinyint(4) DEFAULT NULL,
  `ptvquais` varchar(50) DEFAULT NULL,
  `gravida` tinyint(4) DEFAULT NULL,
  `semanagravidez` int(11) DEFAULT NULL,
  `dataprevistoparto` datetime DEFAULT NULL,
  `puerpera` tinyint(4) DEFAULT NULL,
  `dataparto` varchar(50) DEFAULT NULL,
  `tipoaleitamento` varchar(50) DEFAULT NULL,
  `Alergiamedicamentos` varchar(50) DEFAULT NULL,
  `Alergiasquais` longtext,
  `Antecedentestarv` tinyint(4) DEFAULT NULL,
  `antecedentesquais` longtext,
  `exposicaoacidental` varchar(30) DEFAULT NULL,
  `tipoacidente` longtext,
  `historiaactual` longtext,
  `hipotesedediagnostico` longtext,
  `codkarnosfsky` int(11) DEFAULT NULL,
  `geleira` tinyint(4) DEFAULT NULL,
  `electricidade` tinyint(4) DEFAULT NULL,
  `sexualidade` varchar(50) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `hdd` varchar(20) NOT NULL,
  PRIMARY KEY (`nid`,`hdd`),
  KEY `codestadocivil` (`codestadocivil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_adulto`
--

LOCK TABLES `t_adulto` WRITE;
/*!40000 ALTER TABLE `t_adulto` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_adulto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_afinidade`
--

DROP TABLE IF EXISTS `t_afinidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_afinidade` (
  `afinidade` varchar(255) NOT NULL,
  PRIMARY KEY (`afinidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_afinidade`
--

LOCK TABLES `t_afinidade` WRITE;
/*!40000 ALTER TABLE `t_afinidade` DISABLE KEYS */;
INSERT INTO `t_afinidade` VALUES ('Amizade'),('Familiar'),('Igreja'),('Mesquita'),('Outro'),('Residencia'),('Trabalho');
/*!40000 ALTER TABLE `t_afinidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_antecedentesclinicospaciente`
--

DROP TABLE IF EXISTS `t_antecedentesclinicospaciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_antecedentesclinicospaciente` (
  `codantecendentes` varchar(50) NOT NULL,
  `nid` varchar(50) NOT NULL,
  `datadiagnostico` datetime DEFAULT NULL,
  `observacao` varchar(50) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  `hdd` varchar(20) NOT NULL,
  PRIMARY KEY (`codantecendentes`,`nid`,`hdd`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_antecedentesclinicospaciente`
--

LOCK TABLES `t_antecedentesclinicospaciente` WRITE;
/*!40000 ALTER TABLE `t_antecedentesclinicospaciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_antecedentesclinicospaciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_buscaactiva`
--

DROP TABLE IF EXISTS `t_buscaactiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_buscaactiva` (
  `nid` varchar(50) NOT NULL,
  `datacomecoufaltar` datetime NOT NULL,
  `dataentregaactivista` datetime DEFAULT NULL,
  `pacientelocalizado` varchar(50) DEFAULT NULL,
  `datalocalizacao` datetime DEFAULT NULL,
  `codmotivoabandono` varchar(50) DEFAULT NULL,
  `codreferencia` varchar(50) DEFAULT NULL,
  `entregueconvite` varchar(50) DEFAULT NULL,
  `parceiroenvolvido` varchar(50) DEFAULT NULL,
  `familiaenvolvida` varchar(50) DEFAULT NULL,
  `parceiroemtratamento` varchar(50) DEFAULT NULL,
  `confidenteidentificado` varchar(50) DEFAULT NULL,
  `Codinformacaodadapor` varchar(50) DEFAULT NULL,
  `Codservicoquerefere` varchar(50) DEFAULT NULL,
  `dataprimeiratentativa` datetime DEFAULT NULL,
  `datasegundatentativa` datetime DEFAULT NULL,
  `dataterceiratentativa` datetime DEFAULT NULL,
  `Observacao` longtext,
  `codprofissional` int(11) DEFAULT NULL,
  `tipovisita` varchar(255) DEFAULT NULL,
  `esqueceudata` tinyint(4) DEFAULT NULL,
  `estadecama` tinyint(4) DEFAULT NULL,
  `problemadetransporte` tinyint(4) DEFAULT NULL,
  `faltaalimentacao` tinyint(4) DEFAULT NULL,
  `ausenciadoprofissional` tinyint(4) DEFAULT NULL,
  `mauatendimento` tinyint(4) DEFAULT NULL,
  `busca_efeitossecundarios` tinyint(4) DEFAULT NULL,
  `tratamentotradicional` tinyint(4) DEFAULT NULL,
  `desistiu` tinyint(4) DEFAULT NULL,
  `outromotivo` varchar(255) DEFAULT NULL,
  `estabem` tinyint(4) DEFAULT NULL,
  `dificulades` tinyint(4) DEFAULT NULL,
  `dificuldadefamilia` tinyint(4) DEFAULT NULL,
  `dificuldadeefeitossecundarios` tinyint(4) DEFAULT NULL,
  `faltadeapoio` tinyint(4) DEFAULT NULL,
  `dificuldadetomamedicamento` tinyint(4) DEFAULT NULL,
  `naoreveloudiagnostico` tinyint(4) DEFAULT NULL,
  `naoencontradopor` varchar(255) DEFAULT NULL,
  `outromotivonaoencontrado` varchar(255) DEFAULT NULL,
  `outroencaminhamento` varchar(255) DEFAULT NULL,
  `dataentregacartao` datetime DEFAULT NULL,
  `dataentregaconvite` datetime DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `location_id` varchar(20) NOT NULL,
  PRIMARY KEY (`nid`,`datacomecoufaltar`,`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_buscaactiva`
--

LOCK TABLES `t_buscaactiva` WRITE;
/*!40000 ALTER TABLE `t_buscaactiva` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_buscaactiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_contacto`
--

DROP TABLE IF EXISTS `t_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_contacto` (
  `idcontacto` int(11) NOT NULL AUTO_INCREMENT,
  `nid` varchar(50) DEFAULT NULL,
  `hdd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idcontacto`),
  KEY `idcontacto` (`idcontacto`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_contacto`
--

LOCK TABLES `t_contacto` WRITE;
/*!40000 ALTER TABLE `t_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_crianca`
--

DROP TABLE IF EXISTS `t_crianca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_crianca` (
  `nid` varchar(50) NOT NULL,
  `tipoparto` varchar(50) DEFAULT NULL,
  `local` varchar(50) DEFAULT NULL,
  `termo` varchar(30) DEFAULT NULL,
  `pesonascimento` varchar(50) DEFAULT NULL,
  `exposicaotarvmae` varchar(30) DEFAULT NULL,
  `exposicaotarvnascenca` varchar(30) DEFAULT NULL,
  `patologianeonatal` varchar(50) DEFAULT NULL,
  `injeccoes` varchar(30) DEFAULT NULL,
  `escarificacoes` varchar(30) DEFAULT NULL,
  `extracoesdentarias` varchar(30) DEFAULT NULL,
  `aleitamentomaterno` varchar(30) DEFAULT NULL,
  `aleitamentoexclusivo` varchar(30) DEFAULT NULL,
  `idadedesmame` int(11) DEFAULT NULL,
  `pavcompleto` varchar(30) DEFAULT NULL,
  `idadecronologica` varchar(50) DEFAULT NULL,
  `bailey` varchar(50) DEFAULT NULL,
  `idmae` int(11) DEFAULT NULL,
  `idpai` int(11) DEFAULT NULL,
  `observacao` longtext,
  `patient_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `hdd` varchar(20) NOT NULL,
  PRIMARY KEY (`nid`,`hdd`),
  KEY `idadecronologica` (`idadecronologica`),
  KEY `idadedesmame` (`idadedesmame`),
  KEY `idmae` (`idmae`),
  KEY `idpai` (`idpai`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_crianca`
--

LOCK TABLES `t_crianca` WRITE;
/*!40000 ALTER TABLE `t_crianca` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_crianca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_diagnosticoseguimento`
--

DROP TABLE IF EXISTS `t_diagnosticoseguimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_diagnosticoseguimento` (
  `idseguimento` int(11) NOT NULL,
  `coddiagnostico` varchar(50) NOT NULL,
  `observacao` longtext,
  `Nid` varchar(255) DEFAULT NULL,
  `Data` datetime DEFAULT NULL,
  `hdd` varchar(20) NOT NULL,
  PRIMARY KEY (`idseguimento`,`coddiagnostico`,`hdd`),
  KEY `coddiagnostico` (`coddiagnostico`),
  KEY `data` (`Data`),
  KEY `idseguimento` (`idseguimento`),
  KEY `t_diagnosticoseguimentonid` (`Nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_diagnosticoseguimento`
--

LOCK TABLES `t_diagnosticoseguimento` WRITE;
/*!40000 ALTER TABLE `t_diagnosticoseguimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_diagnosticoseguimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_esposicaotarvmae`
--

DROP TABLE IF EXISTS `t_esposicaotarvmae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_esposicaotarvmae` (
  `nid` varchar(50) DEFAULT NULL,
  `tarv` varchar(50) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_esposicaotarvmae`
--

LOCK TABLES `t_esposicaotarvmae` WRITE;
/*!40000 ALTER TABLE `t_esposicaotarvmae` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_esposicaotarvmae` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_esposicaotarvnascenca`
--

DROP TABLE IF EXISTS `t_esposicaotarvnascenca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_esposicaotarvnascenca` (
  `nid` varchar(50) DEFAULT NULL,
  `tarv` varchar(50) DEFAULT NULL,
  `hdd` varchar(20) DEFAULT NULL,
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_esposicaotarvnascenca`
--

LOCK TABLES `t_esposicaotarvnascenca` WRITE;
/*!40000 ALTER TABLE `t_esposicaotarvnascenca` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_esposicaotarvnascenca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_estadopaciente`
--

DROP TABLE IF EXISTS `t_estadopaciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_estadopaciente` (
  `codestado` varchar(50) NOT NULL,
  `designacao` varchar(50) DEFAULT NULL,
  `Activo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`codestado`),
  KEY `codestado` (`codestado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_estadopaciente`
--

LOCK TABLES `t_estadopaciente` WRITE;
/*!40000 ALTER TABLE `t_estadopaciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_estadopaciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_gaac`
--

DROP TABLE IF EXISTS `t_gaac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_gaac` (
  `hdd` varchar(50) NOT NULL,
  `numGAAC` int(11) NOT NULL,
  `datainicio` datetime DEFAULT NULL,
  `afinidade` varchar(255) DEFAULT NULL,
  `dataDesintegracao` datetime DEFAULT NULL,
  `nidPontoFocal` varchar(255) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`numGAAC`,`hdd`),
  KEY `{74AD1F0E-011B-482D-A4CC-8F3380B3CC13}` (`afinidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_gaac`
--

LOCK TABLES `t_gaac` WRITE;
/*!40000 ALTER TABLE `t_gaac` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_gaac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_gaac_actividades`
--

DROP TABLE IF EXISTS `t_gaac_actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_gaac_actividades` (
  `ID` int(11) NOT NULL,
  `nid` varchar(255) DEFAULT NULL,
  `dataInscricao` datetime DEFAULT NULL,
  `dataSaida` datetime DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `numGAAC` int(11) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `hdd` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`,`hdd`),
  KEY `{4EDA4D29-DD1B-47BA-9B79-C3D8F8FEDC29}` (`numGAAC`),
  KEY `nid` (`nid`),
  KEY `numGAAC` (`numGAAC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_gaac_actividades`
--

LOCK TABLES `t_gaac_actividades` WRITE;
/*!40000 ALTER TABLE `t_gaac_actividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_gaac_actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hdd`
--

DROP TABLE IF EXISTS `t_hdd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_hdd` (
  `HdD` varchar(50) NOT NULL,
  `designacao` varchar(50) DEFAULT NULL,
  `local` varchar(50) DEFAULT NULL,
  `Provincia` varchar(50) DEFAULT NULL,
  `Distrito` varchar(50) DEFAULT NULL,
  `dataabertura` datetime DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`HdD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hdd`
--

LOCK TABLES `t_hdd` WRITE;
/*!40000 ALTER TABLE `t_hdd` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_hdd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_histestadopaciente`
--

DROP TABLE IF EXISTS `t_histestadopaciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_histestadopaciente` (
  `ID` int(11) NOT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `codestado` varchar(50) DEFAULT NULL,
  `dataestado` datetime DEFAULT NULL,
  `destinopaciente` varchar(100) DEFAULT NULL,
  `hdd` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`,`hdd`),
  KEY `codestado` (`codestado`),
  KEY `dataestado` (`dataestado`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_histestadopaciente`
--

LOCK TABLES `t_histestadopaciente` WRITE;
/*!40000 ALTER TABLE `t_histestadopaciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_histestadopaciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_infeccoesoportunisticaseguimento`
--

DROP TABLE IF EXISTS `t_infeccoesoportunisticaseguimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_infeccoesoportunisticaseguimento` (
  `idseguimento` int(11) NOT NULL,
  `estadiooms` varchar(50) NOT NULL,
  `codigoio` varchar(50) NOT NULL,
  `Nid` varchar(255) DEFAULT NULL,
  `Data` datetime DEFAULT NULL,
  `hdd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idseguimento`,`estadiooms`,`codigoio`),
  KEY `idseguimento` (`idseguimento`),
  KEY `Nid` (`Nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_infeccoesoportunisticaseguimento`
--

LOCK TABLES `t_infeccoesoportunisticaseguimento` WRITE;
/*!40000 ALTER TABLE `t_infeccoesoportunisticaseguimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_infeccoesoportunisticaseguimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_mae`
--

DROP TABLE IF EXISTS `t_mae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_mae` (
  `idmae` int(11) NOT NULL,
  `idade` varchar(50) DEFAULT NULL,
  `vivo` varchar(50) DEFAULT NULL,
  `doente` varchar(50) DEFAULT NULL,
  `doenca` varchar(50) DEFAULT NULL,
  `codprofissao` varchar(50) DEFAULT NULL,
  `emtarv` varchar(50) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `hdd` varchar(20) NOT NULL,
  `resultadohiv` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmae`,`hdd`),
  KEY `idade` (`idade`),
  KEY `nid` (`idmae`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_mae`
--

LOCK TABLES `t_mae` WRITE;
/*!40000 ALTER TABLE `t_mae` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_mae` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_observacaopaciente`
--

DROP TABLE IF EXISTS `t_observacaopaciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_observacaopaciente` (
  `idobservacao` int(11) NOT NULL,
  `codobservacao` varchar(50) DEFAULT NULL,
  `codestado` varchar(50) DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `medico` int(11) DEFAULT NULL,
  `Observacao` longtext,
  `hdd` varchar(20) NOT NULL,
  PRIMARY KEY (`idobservacao`,`hdd`),
  KEY `codestado` (`codestado`),
  KEY `codobservacao` (`codobservacao`),
  KEY `data` (`data`),
  KEY `medico` (`medico`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_observacaopaciente`
--

LOCK TABLES `t_observacaopaciente` WRITE;
/*!40000 ALTER TABLE `t_observacaopaciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_observacaopaciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_paciente`
--

DROP TABLE IF EXISTS `t_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_paciente` (
  `hdd` varchar(50) NOT NULL,
  `dataabertura` datetime DEFAULT NULL,
  `nid` varchar(50) NOT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  `datanasc` datetime DEFAULT NULL,
  `idade` double DEFAULT NULL,
  `meses` int(11) DEFAULT NULL,
  `coddistrito` varchar(50) DEFAULT NULL,
  `codproveniencia` varchar(50) DEFAULT NULL,
  `designacaoprov` varchar(50) DEFAULT NULL,
  `Codigoproveniencia` varchar(255) DEFAULT NULL,
  `emtarv` tinyint(4) DEFAULT NULL,
  `datainiciotarv` datetime DEFAULT NULL,
  `codregime` varchar(50) DEFAULT NULL,
  `codestado` varchar(50) DEFAULT NULL,
  `destinopaciente` varchar(100) DEFAULT NULL,
  `datasaidatarv` datetime DEFAULT NULL,
  `datadiagnostico` datetime DEFAULT NULL,
  `aconselhado` tinyint(4) DEFAULT NULL,
  `referidocd` tinyint(4) DEFAULT NULL,
  `estadiooms` varchar(255) DEFAULT NULL,
  `emtratamentotb` tinyint(4) DEFAULT NULL,
  `DataCD` datetime DEFAULT NULL,
  `referidohdd` varchar(255) DEFAULT NULL,
  `datareferidohdd` datetime DEFAULT NULL,
  `aceitabuscaactiva` varchar(50) DEFAULT NULL,
  `dataaceitabuscaactiva` datetime DEFAULT NULL,
  `referidobuscaactiva` varchar(50) DEFAULT NULL,
  `datareferenciabuscaactiva` datetime DEFAULT NULL,
  `situacaohiv` varchar(50) DEFAULT NULL,
  `observacao` longtext,
  `Educacaoprevencao` varchar(255) DEFAULT NULL,
  `transfOutraUs` varchar(255) DEFAULT NULL,
  `dataElegibilidadeInicioTarv` datetime DEFAULT NULL,
  `apssDisponivel` varchar(255) DEFAULT NULL,
  `apssFormaContacto` varchar(255) DEFAULT NULL,
  `apssQuemInformouSeroestado` varchar(255) DEFAULT NULL,
  `apssconheceestadoparceiro` varchar(255) DEFAULT NULL,
  `PatientID` varchar(255) DEFAULT NULL,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `tipopaciente` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`hdd`,`nid`),
  KEY `codestado` (`codestado`),
  KEY `dataabertura` (`dataabertura`),
  KEY `datainiciotarv` (`datainiciotarv`),
  KEY `idade` (`idade`),
  KEY `PatientID` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_paciente`
--

LOCK TABLES `t_paciente` WRITE;
/*!40000 ALTER TABLE `t_paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pai`
--

DROP TABLE IF EXISTS `t_pai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pai` (
  `idpai` int(11) NOT NULL,
  `idade` varchar(50) DEFAULT NULL,
  `vivo` varchar(50) DEFAULT NULL,
  `doente` varchar(50) DEFAULT NULL,
  `doenca` varchar(50) DEFAULT NULL,
  `codprofissao` varchar(50) DEFAULT NULL,
  `resultadohiv` varchar(50) DEFAULT NULL,
  `emtarv` varchar(50) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) NOT NULL,
  `hdd` varchar(20) NOT NULL,
  PRIMARY KEY (`idpai`,`encounter_id`,`hdd`),
  KEY `idade` (`idade`),
  KEY `nid` (`idpai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pai`
--

LOCK TABLES `t_pai` WRITE;
/*!40000 ALTER TABLE `t_pai` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_pai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_questionariotb`
--

DROP TABLE IF EXISTS `t_questionariotb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_questionariotb` (
  `codopcao` varchar(255) NOT NULL,
  `estadoopcao` tinyint(4) DEFAULT NULL,
  `nid` varchar(255) NOT NULL,
  `data` datetime NOT NULL,
  `Observacao` longtext,
  `hdd` varchar(45) NOT NULL,
  PRIMARY KEY (`codopcao`,`nid`,`data`,`hdd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_questionariotb`
--

LOCK TABLES `t_questionariotb` WRITE;
/*!40000 ALTER TABLE `t_questionariotb` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_questionariotb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_resultadoslaboratorio`
--

DROP TABLE IF EXISTS `t_resultadoslaboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_resultadoslaboratorio` (
  `idresultado` int(11) NOT NULL,
  `codexame` varchar(50) DEFAULT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `dataresultado` datetime DEFAULT NULL,
  `codparametro` varchar(50) DEFAULT NULL,
  `resultado` double DEFAULT NULL,
  `obs` longtext,
  `datapedido` datetime DEFAULT NULL,
  `notificoufamilia` varchar(255) DEFAULT NULL,
  `dataProximoControlCd4` datetime DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `hdd` varchar(45) NOT NULL,
  PRIMARY KEY (`idresultado`,`hdd`),
  KEY `codexame` (`codexame`),
  KEY `dataresultado` (`dataresultado`),
  KEY `idresultado` (`idresultado`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_resultadoslaboratorio`
--

LOCK TABLES `t_resultadoslaboratorio` WRITE;
/*!40000 ALTER TABLE `t_resultadoslaboratorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_resultadoslaboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_seguimento`
--

DROP TABLE IF EXISTS `t_seguimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_seguimento` (
  `idseguimento` int(11) NOT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `idade` double DEFAULT NULL,
  `meses` double DEFAULT NULL,
  `estadohiv` varchar(50) DEFAULT NULL,
  `dataseguimento` datetime DEFAULT NULL,
  `estadiooms` varchar(50) DEFAULT NULL,
  `dataproximaconsulta` datetime DEFAULT NULL,
  `aleitamentomaterno` varchar(255) DEFAULT NULL,
  `idadedesmame` int(11) DEFAULT NULL,
  `Gravidez` int(11) DEFAULT NULL,
  `screeningtb` varchar(30) DEFAULT NULL,
  `Observacao` longtext,
  `screeningIts` varchar(255) DEFAULT NULL,
  `aconselhado` varchar(255) DEFAULT NULL,
  `referidoSectorClinico` varchar(255) DEFAULT NULL,
  `gravida` varchar(255) DEFAULT NULL,
  `dum` varchar(255) DEFAULT NULL,
  `dpp` varchar(255) DEFAULT NULL,
  `PTV_TARV` varchar(255) DEFAULT NULL,
  `sintomasTb` varchar(255) DEFAULT NULL,
  `dataParto` datetime DEFAULT NULL,
  `sexoseguimento` varchar(255) DEFAULT NULL,
  `apssdatavisita` datetime DEFAULT NULL,
  `pp1` tinyint(4) DEFAULT NULL,
  `pp2` tinyint(4) DEFAULT NULL,
  `pp3` tinyint(4) DEFAULT NULL,
  `pp4` tinyint(4) DEFAULT NULL,
  `pp5` tinyint(4) DEFAULT NULL,
  `pp6` tinyint(4) DEFAULT NULL,
  `pp7` tinyint(4) DEFAULT NULL,
  `apssTipovisita` varchar(255) DEFAULT NULL,
  `apssAdesao` varchar(255) DEFAULT NULL,
  `apssActividade` varchar(255) DEFAULT NULL,
  `apssproximavisita` datetime DEFAULT NULL,
  `lactante` tinyint(4) DEFAULT NULL,
  `localSeguimento` varchar(255) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `hdd` varchar(20) NOT NULL,
  PRIMARY KEY (`idseguimento`,`hdd`),
  KEY `dataproximaconsulta` (`dataproximaconsulta`),
  KEY `dataseguimento` (`dataseguimento`),
  KEY `estadohiv` (`estadohiv`),
  KEY `idade` (`idade`),
  KEY `idadedesmame` (`idadedesmame`),
  KEY `idseguimento` (`idseguimento`),
  KEY `nid` (`nid`),
  KEY `screeningtb` (`screeningtb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_seguimento`
--

LOCK TABLES `t_seguimento` WRITE;
/*!40000 ALTER TABLE `t_seguimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_seguimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_table`
--

DROP TABLE IF EXISTS `t_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_table` (
  `id_table` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `nr_sites` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_table`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_table`
--

LOCK TABLES `t_table` WRITE;
/*!40000 ALTER TABLE `t_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_table_site`
--

DROP TABLE IF EXISTS `t_table_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_table_site` (
  `id_table_site` int(11) NOT NULL AUTO_INCREMENT,
  `id_table` int(11) DEFAULT NULL,
  `site_location_id` int(11) DEFAULT NULL,
  `us_code` varchar(45) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_table_site`),
  UNIQUE KEY `us_code_UNIQUE` (`us_code`),
  KEY `fk_t_table_site_1_idx` (`id_table`),
  CONSTRAINT `fk_t_table_site_1` FOREIGN KEY (`id_table`) REFERENCES `t_table` (`id_table`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_table_site`
--

LOCK TABLES `t_table_site` WRITE;
/*!40000 ALTER TABLE `t_table_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_table_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tarv`
--

DROP TABLE IF EXISTS `t_tarv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tarv` (
  `idtarv` int(11) NOT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `datatarv` datetime DEFAULT NULL,
  `codregime` varchar(50) DEFAULT NULL,
  `dias` int(11) DEFAULT NULL,
  `tipotarv` varchar(50) DEFAULT NULL,
  `codmudanca` varchar(50) DEFAULT NULL,
  `dataproxima` datetime DEFAULT NULL,
  `observacao` longtext,
  `QtdComp` int(11) DEFAULT NULL,
  `QtdSaldo` int(11) DEFAULT NULL,
  `dataoutroservico` datetime DEFAULT NULL,
  `embalageensaviadas` int(11) DEFAULT NULL,
  `saldoembalagens` int(11) DEFAULT NULL,
  `efeitosSecundarios` varchar(255) DEFAULT NULL,
  `dataexpirareceita` varchar(255) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `compromido` varchar(255) DEFAULT NULL,
  `compromido1` varchar(255) DEFAULT NULL,
  `compromido2` varchar(255) DEFAULT NULL,
  `dose` varchar(255) DEFAULT NULL,
  `dose1` varchar(255) DEFAULT NULL,
  `dose2` varchar(255) DEFAULT NULL,
  `motivoInicioTarv` varchar(255) DEFAULT NULL,
  `linhaTerapeutica` varchar(255) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `hdd` varchar(20) NOT NULL,
  PRIMARY KEY (`idtarv`,`hdd`),
  UNIQUE KEY `unique_key` (`nid`,`datatarv`,`codregime`,`hdd`),
  KEY `codregime` (`codregime`),
  KEY `datatarv` (`datatarv`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tarv`
--

LOCK TABLES `t_tarv` WRITE;
/*!40000 ALTER TABLE `t_tarv` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tarv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tratamentoseguimento`
--

DROP TABLE IF EXISTS `t_tratamentoseguimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tratamentoseguimento` (
  `idseguimento` int(11) DEFAULT NULL,
  `codtratamento` varchar(50) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `observacao` longtext,
  `datafimtratamento` datetime DEFAULT NULL,
  `servico` varchar(255) DEFAULT NULL,
  `hdd` varchar(45) DEFAULT NULL,
  KEY `codtratamento` (`codtratamento`),
  KEY `data` (`data`),
  KEY `datafimtratamento` (`datafimtratamento`),
  KEY `idseguimento` (`idseguimento`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tratamentoseguimento`
--

LOCK TABLES `t_tratamentoseguimento` WRITE;
/*!40000 ALTER TABLE `t_tratamentoseguimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tratamentoseguimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tratamentotb`
--

DROP TABLE IF EXISTS `t_tratamentotb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tratamentotb` (
  `nid` varchar(50) NOT NULL,
  `data` datetime NOT NULL,
  `Observacao` longtext,
  `datafim` datetime DEFAULT NULL,
  `servico` varchar(255) DEFAULT NULL,
  `hdd` varchar(20) NOT NULL,
  PRIMARY KEY (`nid`,`data`,`hdd`),
  KEY `data` (`data`),
  KEY `datafim` (`datafim`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tratamentotb`
--

LOCK TABLES `t_tratamentotb` WRITE;
/*!40000 ALTER TABLE `t_tratamentotb` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tratamentotb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_void_duplo`
--

DROP TABLE IF EXISTS `t_void_duplo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_void_duplo` (
  `encounter_id` int(11) NOT NULL,
  PRIMARY KEY (`encounter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_void_duplo`
--

LOCK TABLES `t_void_duplo` WRITE;
/*!40000 ALTER TABLE `t_void_duplo` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_void_duplo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mozart_integration'
--
/*!50003 DROP PROCEDURE IF EXISTS `import` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `import`()
    READS SQL DATA
BEGIN
 
 
  DECLARE dUsCode  varchar(50);     
  DECLARE dIdTable int;    
  DECLARE dNome varchar(200); 
  DECLARE dsexo int;
  DECLARE dlocation_id int;
  


  DECLARE loop_cntr INT DEFAULT 0;
  DECLARE num_rows INT DEFAULT 0;
  declare dHdd varchar(50);
  declare dPaciente varchar(50);
  declare dOutrasTBL varchar(200);
 
 


DECLARE cursor_1 CURSOR FOR

 
select t.nome,t.id_table,ts.site_location_id,us_code 
from t_table t, t_table_site ts
where t.id_table=ts.id_table order by  ts.site_location_id;

truncate table t_hdd;
truncate table t_paciente;
truncate table t_adulto;
truncate table t_crianca;
truncate table t_pai;
truncate table t_mae;
truncate table t_contacto;
truncate table t_seguimento;
truncate table t_infeccoesoportunisticaseguimento;
truncate table t_diagnosticoseguimento;
truncate table t_tratamentoseguimento;
truncate table t_resultadoslaboratorio;
truncate table t_tarv;
truncate table t_questionariotb;
truncate table t_observacaopaciente;
truncate table t_histestadopaciente;
truncate table t_gaac;
truncate table t_gaac_actividades;
truncate table t_buscaactiva;
truncate table t_esposicaotarvmae;
truncate table t_esposicaotarvnascenca;
truncate table t_aconselhamento;
truncate table t_actividadeaconselhamento;
truncate table t_antecedentesclinicospaciente;
truncate table t_tratamentotb;
  
  
OPEN cursor_1;
 
  select FOUND_ROWS() into num_rows;

  the_loop: LOOP

      SET loop_cntr = loop_cntr + 1;

    IF loop_cntr > num_rows THEN
        CLOSE cursor_1;
        LEAVE the_loop;
    END IF;

    FETCH  cursor_1
 
 INTO   
    dNome,dIdTable,dlocation_id,dUsCode;
 
 
  set dHdd = concat(dNome,'.t_hdd');
 
  
   SET @temp1 = CONCAT(' insert into mozart_integration.t_hdd select ',dUsCode,',h.designacao,h.local,h.Provincia,h.Distrito, h.dataabertura, h.location_id from ', dHdd, ' h WHERE h.location_id=', dlocation_id, '');

  PREPARE stmt1 FROM @temp1;
  EXECUTE stmt1;
  DEALLOCATE PREPARE stmt1;
  
 
  
  set dPaciente = concat(dNome,'.t_paciente');
 
   SET @temp2 = CONCAT(' insert into mozart_integration.t_paciente ( hdd , dataabertura , nid , sexo , datanasc , idade , meses , coddistrito ,
 codproveniencia , designacaoprov , Codigoproveniencia , emtarv , datainiciotarv , codregime , codestado , destinopaciente , datasaidatarv ,
 datadiagnostico , aconselhado , referidocd , estadiooms , emtratamentotb , DataCD , referidohdd , datareferidohdd , aceitabuscaactiva ,
 dataaceitabuscaactiva , referidobuscaactiva , datareferenciabuscaactiva , situacaohiv , observacao , Educacaoprevencao , transfOutraUs ,
 dataElegibilidadeInicioTarv , apssDisponivel , apssFormaContacto , apssQuemInformouSeroestado , apssconheceestadoparceiro , PatientID ,
 patient_id ,  location_id , tipopaciente )
 select    ',dUsCode,' , p.dataabertura , p.nid , p.sexo , p.datanasc , p.idade , p.meses , p.coddistrito , p.codproveniencia , p.designacaoprov , p.Codigoproveniencia ,
 p.emtarv , p.datainiciotarv , p.codregime , p.codestado , p.destinopaciente , p.datasaidatarv , p.datadiagnostico , p.aconselhado , referidocd , p.estadiooms ,
 p.emtratamentotb , p.DataCD , p.referidohdd , p.datareferidohdd ,p.aceitabuscaactiva , p.dataaceitabuscaactiva , p.referidobuscaactiva , p.datareferenciabuscaactiva ,
 p.situacaohiv , p.observacao , p.Educacaoprevencao , p.transfOutraUs , p.dataElegibilidadeInicioTarv , p.apssDisponivel , p.apssFormaContacto , p.apssQuemInformouSeroestado ,
 p.apssconheceestadoparceiro , p.PatientID , patient_id ,  p.location_id , p.tipopaciente from ', dPaciente, ' p,', dHdd, ' h  WHERE  h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
select dOutrasTBL;
  PREPARE stmt2 FROM @temp2;
  EXECUTE stmt2;
  DEALLOCATE PREPARE stmt2;
 
 
 
 
 
   set dOutrasTBL = concat(dNome,'.t_adulto');
 
   SET @temp3 = CONCAT(' insert into mozart_integration.t_adulto ( nid,codprofissao ,codnivel ,nrconviventes ,codestadocivil ,nrconjuges ,
        serologiaHivconjuge ,Nrprocesso ,outrosparceiros ,nrfilhos ,nrfilhostestados ,nrfilhoshiv ,tabaco ,alcool ,droga ,nrparceiros ,
        antecedentesgenelogicos ,datamestruacao ,aborto ,ptv ,ptvquais ,gravida ,semanagravidez ,dataprevistoparto ,puerpera ,
        dataparto ,tipoaleitamento ,Alergiamedicamentos ,Alergiasquais ,Antecedentestarv ,antecedentesquais ,exposicaoacidental ,
        tipoacidente ,historiaactual ,hipotesedediagnostico , codkarnosfsky , geleira ,electricidade ,sexualidade ,patient_id ,
        encounter_id ,hdd)
 select    a.nid ,a.codprofissao ,a.codnivel , a.nrconviventes ,a.codestadocivil ,a.nrconjuges ,a.serologiaHivconjuge ,a.Nrprocesso ,
      a.outrosparceiros , a.nrfilhos ,a.nrfilhostestados ,a.nrfilhoshiv ,a.tabaco ,a.alcool ,a.droga ,a.nrparceiros ,a.antecedentesgenelogicos ,
      a.datamestruacao ,a.aborto , a.ptv ,a.ptvquais ,a.gravida ,a.semanagravidez ,a.dataprevistoparto ,a.puerpera ,a.dataparto ,
      a.tipoaleitamento ,a.Alergiamedicamentos ,a.Alergiasquais ,a.Antecedentestarv ,a.antecedentesquais , a.exposicaoacidental , a.tipoacidente ,
      a.historiaactual ,a.hipotesedediagnostico ,a.codkarnosfsky ,a.geleira ,a.electricidade ,a.sexualidade ,a.patient_id ,a.encounter_id ,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' a WHERE a.nid=p.nid and h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
select dOutrasTBL;
  PREPARE stmt3 FROM @temp3;
  EXECUTE stmt3;
  DEALLOCATE PREPARE stmt3;
  
  
  
  
  
   
 
 
   set dOutrasTBL = concat(dNome,'.t_crianca');
 
   SET @temp4 = CONCAT(' insert into mozart_integration.t_crianca (  nid ,tipoparto , local , termo , pesonascimento ,exposicaotarvmae ,
     exposicaotarvnascenca ,  patologianeonatal ,injeccoes , escarificacoes , extracoesdentarias , aleitamentomaterno ,aleitamentoexclusivo ,
     idadedesmame , pavcompleto , idadecronologica , bailey ,idmae ,idpai , observacao , patient_id , encounter_id , hdd)
 select    c.nid ,c.tipoparto , c.local , c.termo ,c.pesonascimento ,c.exposicaotarvmae ,c.exposicaotarvnascenca ,c.patologianeonatal ,
     c.injeccoes , c.escarificacoes ,c.extracoesdentarias ,c.aleitamentomaterno ,c.aleitamentoexclusivo ,c.idadedesmame ,c.pavcompleto ,
     c.idadecronologica ,c.bailey ,c.idmae ,c.idpai ,c.observacao ,c.patient_id , c.encounter_id ,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' c WHERE c.nid=p.nid and h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
select dOutrasTBL;
  PREPARE stmt4 FROM @temp4;
  EXECUTE stmt4;
  DEALLOCATE PREPARE stmt4;
  
   
 
   set dOutrasTBL = concat(dNome,'.t_pai');
 
   SET @temp5 = CONCAT(' insert into mozart_integration.t_pai (  idpai ,idade , vivo , doente , doenca , codprofissao , resultadohiv , emtarv , patient_id , encounter_id , hdd)
 select    pa.idpai ,pa.idade , pa.vivo , pa.doente , pa.doenca , pa.codprofissao , pa.resultadohiv , pa.emtarv , pa.patient_id , pa.encounter_id ,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' pa WHERE   pa.patient_id=p.patient_id and h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
select dOutrasTBL;
  PREPARE stmt5 FROM @temp5;
  EXECUTE stmt5;
  DEALLOCATE PREPARE stmt5;
  
  
  
     
 
   set dOutrasTBL = concat(dNome,'.t_mae');
 
   SET @temp6= CONCAT(' insert into mozart_integration.t_mae (  idmae ,idade , vivo , doente , doenca , codprofissao , resultadohiv , emtarv , patient_id , encounter_id , hdd)
 select    m.idmae ,m.idade , m.vivo , m.doente , m.doenca , m.codprofissao , m.resultadohiv ,m.emtarv , m.patient_id , m.encounter_id ,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' m WHERE  m.patient_id=p.patient_id and h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
select dOutrasTBL;
  PREPARE stmt6 FROM @temp6;
  EXECUTE stmt6;
  DEALLOCATE PREPARE stmt6;
  
  
       
 
   set dOutrasTBL = concat(dNome,'.t_contacto');
 
   SET @temp7 = CONCAT(' insert into mozart_integration.t_contacto ( nid ,   hdd)
 select   c.nid,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' c  WHERE c.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
select dOutrasTBL;
  PREPARE stmt7 FROM @temp7;
  EXECUTE stmt7;
  DEALLOCATE PREPARE stmt7;
  
         
 
   set dOutrasTBL = concat(dNome,'.t_seguimento');
 
   SET @temp8 = CONCAT(' insert into mozart_integration.t_seguimento  
 select   t.idseguimento ,t.nid ,t.idade ,t.meses ,t.estadohiv ,t.dataseguimento ,t.estadiooms , t.dataproximaconsulta ,t.aleitamentomaterno ,
     t.idadedesmame ,t.Gravidez , t.screeningtb ,t.Observacao , t.screeningIts ,t.aconselhado ,t.referidoSectorClinico ,t.gravida ,t.dum ,
     t.dpp ,t.PTV_TARV ,t.sintomasTb ,t.dataParto ,t.sexoseguimento ,t.apssdatavisita , t.pp1 ,t.pp2 ,t.pp3 , t.pp4 , t.pp5 ,t.pp6 ,t.pp7 ,
     t.apssTipovisita , t.apssAdesao , t.apssActividade ,t.apssproximavisita ,t.lactante ,t.localSeguimento ,t.encounter_id , t.patient_id,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' t  WHERE t.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
select dOutrasTBL;
  PREPARE stmt8 FROM @temp8;
  EXECUTE stmt8;
  DEALLOCATE PREPARE stmt8;
  
  
  
    
         
 
   set dOutrasTBL = concat(dNome,'.t_infeccoesoportunisticaseguimento');
 
   SET @temp9 = CONCAT(' insert into mozart_integration.t_infeccoesoportunisticaseguimento  
 select   t.idseguimento ,t.estadiooms ,t.codigoio ,t.Nid ,t.Data,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' t  WHERE t.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
select dOutrasTBL;
  PREPARE stmt9 FROM @temp9;
  EXECUTE stmt9;
  DEALLOCATE PREPARE stmt9;
  
  
  
          
 
   set dOutrasTBL = concat(dNome,'.t_diagnosticoseguimento');
 
   SET @temp10 = CONCAT(' insert into mozart_integration.t_diagnosticoseguimento  
 select   t.idseguimento ,t.coddiagnostico ,t.observacao ,t.Nid ,t.Data,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' t  WHERE t.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
select dOutrasTBL;
  PREPARE stmt10 FROM @temp10;
  EXECUTE stmt10;
  DEALLOCATE PREPARE stmt10;
  
  
            
 
   set dOutrasTBL = concat(dNome,'.t_tratamentoseguimento');
 
   SET @temp11 = CONCAT(' insert into mozart_integration.t_tratamentoseguimento  
 select   t.idseguimento ,t.codtratamento ,t.data ,t.Nid ,t.observacao,t.datafimtratamento,t.servico,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' t  WHERE t.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
select dOutrasTBL;
  PREPARE stmt11 FROM @temp11;
  EXECUTE stmt11;
  DEALLOCATE PREPARE stmt11;
  
  
  
              
 
   set dOutrasTBL = concat(dNome,'.t_resultadoslaboratorio');
 
   SET @temp12 = CONCAT(' insert into mozart_integration.t_resultadoslaboratorio  
 select    r.idresultado ,  r.codexame , r.nid , r.dataresultado ,r.codparametro , r.resultado ,r.obs , r.datapedido , r.notificoufamilia ,
      r.dataProximoControlCd4 , r.patient_id , r.encounter_id ,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' r  WHERE r.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
select dOutrasTBL;
  PREPARE stmt12 FROM @temp12;
  EXECUTE stmt12;
  DEALLOCATE PREPARE stmt12;
  
  
    
              
 
   set dOutrasTBL = concat(dNome,'.t_tarv');
 
   SET @temp13 = CONCAT(' insert into mozart_integration.t_tarv  
 select     t.idtarv , t.nid , t.datatarv ,t.codregime ,t.dias , t.tipotarv ,t.codmudanca ,t.dataproxima ,t.observacao ,
      t.QtdComp ,t.QtdSaldo ,t.dataoutroservico , t.embalageensaviadas ,t.saldoembalagens ,t.efeitosSecundarios ,t.dataexpirareceita ,t.idade ,
      t.compromido ,t.compromido1 ,t.compromido2 ,t.dose ,t.dose1 ,t.dose2 ,t.motivoInicioTarv , t.linhaTerapeutica ,t.encounter_id ,t.patient_id ,
      
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' t  WHERE t.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt13 FROM @temp13;
  EXECUTE stmt13;
  DEALLOCATE PREPARE stmt13;
  
  
                
 
   set dOutrasTBL = concat(dNome,'.t_questionariotb');
 
   SET @temp14 = CONCAT(' insert into mozart_integration.t_questionariotb  
 select    q.codopcao,q.estadoopcao,q.nid,q.data, q.Observacao,
      
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' q  WHERE q.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt14 FROM @temp14;
  EXECUTE stmt14;
  DEALLOCATE PREPARE stmt14;
  
  
                
 
   set dOutrasTBL = concat(dNome,'.t_observacaopaciente');
 
   SET @temp15 = CONCAT(' insert into mozart_integration.t_observacaopaciente  
 select     o.idobservacao,  o.codobservacao, o.codestado, o.valor,o.nid,o.data,o.medico,o.Observacao,
      
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' o  WHERE o.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt15 FROM @temp15;
  EXECUTE stmt15;
  DEALLOCATE PREPARE stmt15;
  
  
                
 
   set dOutrasTBL = concat(dNome,'.t_histestadopaciente');
 
   SET @temp16 = CONCAT(' insert into mozart_integration.t_histestadopaciente  
 select      hp.ID, hp.nid,hp.codestado, hp.dataestado, hp.destinopaciente,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' hp  WHERE hp.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt16 FROM @temp16;
  EXECUTE stmt16;
  DEALLOCATE PREPARE stmt16;
  
  
                
 
   set dOutrasTBL = concat(dNome,'.t_gaac');
 
   SET @temp17 = CONCAT(' insert into mozart_integration.t_gaac  
 select   ',dUsCode,', g.numGAAC, g.datainicio, g.afinidade, g.dataDesintegracao,g.nidPontoFocal,g.observacao
      
       from      ', dHdd, ' h ,',dOutrasTBL,' g  WHERE     h.hdd=g.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt17 FROM @temp17;
  EXECUTE stmt17;
  DEALLOCATE PREPARE stmt17;
  
  
                
 
   set dOutrasTBL = concat(dNome,'.t_gaac_actividades');
 
   SET @temp18 = CONCAT(' insert into mozart_integration.t_gaac_actividades  
 select    ga.ID,ga.nid, ga.dataInscricao, ga.dataSaida,ga.motivo, ga.numGAAC, ga.observacao,
      
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' ga  WHERE ga.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt18 FROM @temp18;
  EXECUTE stmt18;
  DEALLOCATE PREPARE stmt18;
  
  
                
 
   set dOutrasTBL = concat(dNome,'.t_buscaactiva');
 
   SET @temp19 = CONCAT(' insert into mozart_integration.t_buscaactiva  
 select  b.nid,b.datacomecoufaltar, b.dataentregaactivista, b.pacientelocalizado, b.datalocalizacao, b.codmotivoabandono,b.codreferencia,
    b.entregueconvite,b.parceiroenvolvido,b.familiaenvolvida,b.parceiroemtratamento, b.confidenteidentificado,b.Codinformacaodadapor,
    b.Codservicoquerefere,b.dataprimeiratentativa, b.datasegundatentativa,b.dataterceiratentativa,b.Observacao,b.codprofissional,b.tipovisita,
    b.esqueceudata,b.estadecama,b.problemadetransporte,b.faltaalimentacao,b.ausenciadoprofissional,b.mauatendimento,b.busca_efeitossecundarios,
    b.tratamentotradicional,b.desistiu,b.outromotivo,b.estabem,b.dificulades,b.dificuldadefamilia,b.dificuldadeefeitossecundarios,b.faltadeapoio,
    b.dificuldadetomamedicamento,b.naoreveloudiagnostico,b.naoencontradopor,b.outromotivonaoencontrado,b.outroencaminhamento,b.dataentregacartao,
    b.dataentregaconvite,b.encounter_id,b.patient_id,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' b  WHERE b.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt19 FROM @temp19;
  EXECUTE stmt19;
  DEALLOCATE PREPARE stmt19;
  
  
                
 
   set dOutrasTBL = concat(dNome,'.t_esposicaotarvmae');
 
   SET @temp20= CONCAT(' insert into mozart_integration.t_esposicaotarvmae  
 select   e.nid,e.tarv,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' e  WHERE e.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt20 FROM @temp20;
  EXECUTE stmt20;
  DEALLOCATE PREPARE stmt20;
  
  
  
  
                
 
   set dOutrasTBL = concat(dNome,'.t_esposicaotarvnascenca');
 
   SET @temp21= CONCAT(' insert into mozart_integration.t_esposicaotarvnascenca  
 select   e.nid,e.tarv,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' e  WHERE e.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt21 FROM @temp21;
  EXECUTE stmt21;
  DEALLOCATE PREPARE stmt21;
  
  
                  
 
   set dOutrasTBL = concat(dNome,'.t_aconselhamento');
 
   SET @temp22= CONCAT(' insert into mozart_integration.t_aconselhamento  
 select   c.idaconselhamento,c.nid, c.criteriosmedicos,c.conceitos,c.interessado,c.confidente,c.apareceregularmente,c.riscopobreaderencia,
    c.regimetratamento,c.prontotarv,c.datapronto,c.obs,c.encounter_id,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' c  WHERE c.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt22 FROM @temp22;
  EXECUTE stmt22;
  DEALLOCATE PREPARE stmt22;
  
  
  
  
                  
 
   set dOutrasTBL = concat(dNome,'.t_actividadeaconselhamento');
 
   SET @temp23= CONCAT(' insert into mozart_integration.t_actividadeaconselhamento  
 select   a.idaconselhamento,a.nid,a.data,a.nrsessao,a.tipoactividade,a.apresentouconfidente,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' a  WHERE a.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt23 FROM @temp23;
  EXECUTE stmt23;
  DEALLOCATE PREPARE stmt23;
  
  
  
  
                    
 
   set dOutrasTBL = concat(dNome,'.t_antecedentesclinicospaciente');
 
   SET @temp24= CONCAT(' insert into mozart_integration.t_antecedentesclinicospaciente  
 select    a.codantecendentes,a.nid,a.datadiagnostico,a.observacao, a.Estado,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' a  WHERE a.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt24 FROM @temp24;
  EXECUTE stmt24;
  DEALLOCATE PREPARE stmt24;



  
                    
 
   set dOutrasTBL = concat(dNome,'.t_tratamentotb');
 
   SET @temp25= CONCAT(' insert into mozart_integration.t_tratamentotb  
 select    t.nid,t.data, t.Observacao,t.datafim,t.servico,
      ',dUsCode,' from ', dPaciente , ' p,    ', dHdd, ' h ,',dOutrasTBL,' t  WHERE t.nid=p.nid and     h.hdd=p.hdd and   h.location_id=', dlocation_id, '');
    select dOutrasTBL;


  PREPARE stmt25 FROM @temp25;
  EXECUTE stmt25;
  DEALLOCATE PREPARE stmt25;  

END LOOP the_loop;

 select count(p.nid), h.designacao from t_paciente p, t_hdd h where h.hdd=p.hdd  group by p.hdd;

 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-02 18:12:19
