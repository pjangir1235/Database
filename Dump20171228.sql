-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `bill_amount`
--

DROP TABLE IF EXISTS `bill_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_amount` (
  `BILL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int(11) NOT NULL,
  `AMOUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`BILL_ID`),
  KEY `FK_5` (`ORDER_ID`),
  CONSTRAINT `FK_5` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_amount`
--

LOCK TABLES `bill_amount` WRITE;
/*!40000 ALTER TABLE `bill_amount` DISABLE KEYS */;
INSERT INTO `bill_amount` VALUES (1,1,20),(2,1,60),(3,2,30);
/*!40000 ALTER TABLE `bill_amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CUST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUST_NAME` varchar(20) DEFAULT NULL,
  `VISIT` int(11) DEFAULT '0',
  PRIMARY KEY (`CUST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'PIYUSH',9),(2,'TARUN',1),(3,'SATHYA',0),(4,'MOHAN',0),(5,'SUNNY',0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `ITEM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEM_NAME` varchar(20) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `UNIT_SALE` int(11) DEFAULT '0',
  PRIMARY KEY (`ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'TEA',10,5),(2,'COFFEE',10,0),(3,'MILK',10,0),(4,'BISCUIT',10,5),(5,'SAMOSA',10,4),(6,'COLD DRINK',10,0);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_timming`
--

DROP TABLE IF EXISTS `order_timming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_timming` (
  `CUST_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `ORDER_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SERVE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `FK_3` (`CUST_ID`),
  KEY `FK_4` (`ORDER_ID`),
  CONSTRAINT `FK_3` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`),
  CONSTRAINT `FK_4` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_timming`
--

LOCK TABLES `order_timming` WRITE;
/*!40000 ALTER TABLE `order_timming` DISABLE KEYS */;
INSERT INTO `order_timming` VALUES (1,1,'2017-12-27 19:15:04','2017-12-27 19:15:04'),(1,2,'2017-12-27 19:55:01','2017-12-27 19:55:01'),(2,3,'2017-12-27 19:55:28','2017-12-27 19:55:28');
/*!40000 ALTER TABLE `order_timming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ORDER_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  `CUST_ID` int(11) NOT NULL,
  `QTY` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ORDER_ID`,`ITEM_ID`),
  KEY `FK_1` (`ITEM_ID`),
  KEY `FK_2` (`CUST_ID`),
  CONSTRAINT `FK_1` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`),
  CONSTRAINT `FK_2` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,2,20),(1,2,1,2,20),(1,3,1,2,20),(2,1,1,3,30),(3,1,2,1,10),(3,4,2,5,50);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_customersnapshot`
--

DROP TABLE IF EXISTS `vw_customersnapshot`;
/*!50001 DROP VIEW IF EXISTS `vw_customersnapshot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_customersnapshot` AS SELECT 
 1 AS `CUST_ID`,
 1 AS `CUST_NAME`,
 1 AS `VISIT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ordersnapshot`
--

DROP TABLE IF EXISTS `vw_ordersnapshot`;
/*!50001 DROP VIEW IF EXISTS `vw_ordersnapshot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_ordersnapshot` AS SELECT 
 1 AS `ITEM_ID`,
 1 AS `ITEM_NAME`,
 1 AS `PRICE`,
 1 AS `UNIT_SALE`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'restaurant'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_GetOrderTimeElapsed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_GetOrderTimeElapsed`(CustomerID INT) RETURNS datetime
BEGIN
DECLARE DIFF DATETIME;
DECLARE ORDER_TIME DATETIME;
DECLARE SERVE_TIME DATETIME;
SET ORDER_TIME=(SELECT ORDER_TIMMING.ORDER_TIME FROM ORDER_TIMMING WHERE CUST_ID=CustomerID) ;
SET SERVE_TIME=(SELECT ORDER_TIMMING.SERVE_TIME FROM ORDER_TIMMING WHERE CUST_ID=CustomerID);
SET DIFF=TIMEDIFF(SERVE_TIME,ORDER_TIME);
RETURN DIFF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ITEM_PRICE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ITEM_PRICE`(ID INT,QUA INT) RETURNS int(11)
BEGIN
DECLARE PRC INT;
SET PRC=(SELECT PRICE FROM ITEM WHERE ITEM_ID=ID) ;
SET PRC=PRC*QUA;
RETURN PRC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_ORDER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_ORDER`(IN ORDER_ID INT,IN ITEM_ID INT,IN CUST_ID INT, IN QTY INT)
BEGIN
INSERT INTO ORDERS VALUES(ORDER_ID,ITEM_ID,CUST_ID,QTY,ITEM_PRICE(ITEM_ID,QTY));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GenerateBill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GenerateBill`(IN OrderID INT, OUT BillAMT INT)
BEGIN
 DECLARE TOTAL INT;
 SET BillAMT =(SELECT SUM(PRICE) FROM ORDERS WHERE ORDER_ID=OrderID);
INSERT INTO BILL_AMOUNT(ORDER_ID,AMOUNT) VALUES(OrderID,BillAMT);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetOrder`(IN CustomerID INT)
BEGIN
	DECLARE ID INT;
    SELECT ORDER_ID INTO ID FROM ORDERS WHERE CUST_ID=CustomerID LIMIT 1;
    SELECT * FROM ORDERS WHERE ORDER_ID=ID AND CUST_ID=CustomerID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_customersnapshot`
--

/*!50001 DROP VIEW IF EXISTS `vw_customersnapshot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customersnapshot` AS select `customer`.`CUST_ID` AS `CUST_ID`,`customer`.`CUST_NAME` AS `CUST_NAME`,`customer`.`VISIT` AS `VISIT` from `customer` where (`customer`.`VISIT` = (select max(`customer`.`VISIT`) from `customer`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ordersnapshot`
--

/*!50001 DROP VIEW IF EXISTS `vw_ordersnapshot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ordersnapshot` AS select `item`.`ITEM_ID` AS `ITEM_ID`,`item`.`ITEM_NAME` AS `ITEM_NAME`,`item`.`PRICE` AS `PRICE`,`item`.`UNIT_SALE` AS `UNIT_SALE` from `item` where (`item`.`UNIT_SALE` = (select max(`item`.`UNIT_SALE`) from `item`)) */;
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

-- Dump completed on 2017-12-28  1:27:41
