-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2022 a las 23:26:58
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apprender`
--
CREATE DATABASE IF NOT EXISTS `apprender` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `apprender`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `actualizaradministrador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizaradministrador` (IN `pnombre` VARCHAR(20), IN `pusuario` VARCHAR(20), IN `pcontraseña` INT(30), IN `pcodadministrador` INT(30))   begin
UPDATE tbladministrador
set nombre=pnombre,usuario=pusuario,contraseña=pcontraseña,codadministrador=pcodadministrador;
END$$

DROP PROCEDURE IF EXISTS `actualizarciudad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarciudad` (IN `pcodCiudad` VARCHAR(5), IN `pnombre` VARCHAR(40), IN `pdepartamento` VARCHAR(2))   begin
UPDATE tblciudad
set codCiudad=pcodciudad,nombre=pnombre,departamento=pdepartamento;
END$$

DROP PROCEDURE IF EXISTS `actualizarContrato`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarContrato` (IN `PcodContrato` INT, IN `Pprofesor` VARCHAR(11))   begin
UPDATE tblcontrati
set codContrato=PcodContrato,profesor=Pprofesor;
END$$

DROP PROCEDURE IF EXISTS `actualizarDepartamento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarDepartamento` (IN `pcodDepartamento` VARCHAR(2), IN `pnombre` VARCHAR(40))   begin
UPDATE tbldepartamento
SET codDepartametp=pcodDepartamento,nombre=pnombre;
END$$

DROP PROCEDURE IF EXISTS `actualizarfacturaservicio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarfacturaservicio` (IN `pnumero` INT, IN `pcodservicio` INT, IN `pcodhorario` INT, IN `pcliente` VARCHAR(11), IN `pfecha` DATETIME, IN `pformapago` INT, IN `pvalor` INT)   begin
UPDATE tblfacturaservicio
SET numero=pnumero, codservicio=pcodservicio, codhorario=pcodhorario, cliente=pcliente, fecha=pfecha, formaPago=pformapago, valor=pvalor;
END$$

DROP PROCEDURE IF EXISTS `actualizarFormapago`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarFormapago` (IN `codFormapago` INT, IN `pnombre` VARCHAR(20))   begin
UPDATE tblformapago
set codformapago=pcodFormapago,nombre=pnombre;
END$$

DROP PROCEDURE IF EXISTS `actualizarGenero`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarGenero` (IN `codGenero` INT, IN `pnombre` VARCHAR(15))   begin
UPDATE tblgenero
set codGenero=pcodgenero,nombre=pnombre;
END$$

DROP PROCEDURE IF EXISTS `actualizarhorarioprofesor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarhorarioprofesor` (IN `pcodhorario` INT, IN `pfechaInicio` DATETIME, IN `pfechaFinal` DATETIME, `pprofesor` VARCHAR(11))   begin
UPDATE tblhorarioprofesor
set codhorario=pcodhorario,fechaInicio=pfechaInicio,fechaFinal=pfechaFinal,profesor=pprofesor;
END$$

DROP PROCEDURE IF EXISTS `actualizarmateria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarmateria` (IN `pcodMateria` INT, IN `pnombre` VARCHAR(11), IN `pprofesor` VARCHAR(11))   begin
UPDATE tblmateria
set codMateria=pcodMateria,nombre=pnombre,profesor=pprofesor;
END$$

DROP PROCEDURE IF EXISTS `actualizarPerfil`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarPerfil` (IN `codPerfil` INT, IN `pnombre` VARCHAR(30))   begin
UPDATE tblperfil
set codPerfil=pcodperfil,nombre=pnombre;
END$$

DROP PROCEDURE IF EXISTS `actualizarservicio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarservicio` (IN `pcodSrvicio` INT, IN `pvalor` INT, IN `pnombre` VARCHAR(40))   BEGIN
UPDATE tblservicio
set codServicio=pcodServicio,valor=pvalor,nombre=pnombre;
END$$

DROP PROCEDURE IF EXISTS `actualizartipodoc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizartipodoc` (IN `pcodTipodoc` INT, `pnombre` VARCHAR(22))   begin
UPDATE tbltipodoc
set codTipodoc=pcodTipodoc,nombre=pnombre;
END$$

DROP PROCEDURE IF EXISTS `actualizarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarUsuario` (IN `pnumDoc` VARCHAR(11), IN `ptipoDoc` INT, IN `pnombre` VARCHAR(40), IN `papellidos` VARCHAR(40), IN `pperfil` INT, IN `pgenero` INT, IN `pdireccion` VARCHAR(100), IN `pciudad` VARCHAR(5), IN `ptelefono` VARCHAR(10), IN `pcorreo` VARCHAR(70), IN `pclave` VARCHAR(72))   begin
update tblusuario
set numdoc=pnumDoc,tipodoc=ptipoDoc,nombre=pnombre,apellidos=papellidos,
      perfil=pperfil,genero=pgenero,direccion=pdireccion,
       ciudad=pciudad,telefono=ptelefono,correo=pcorreo,clave=pclave;
END$$

DROP PROCEDURE IF EXISTS `consultageneraladministrador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneraladministrador` ()   BEGIN
SELECT*from tbladministrador;
END$$

DROP PROCEDURE IF EXISTS `consultageneralciudad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneralciudad` ()   BEGIN
SELECT*from tblciudad;
END$$

DROP PROCEDURE IF EXISTS `consultageneralcontrato`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneralcontrato` (IN `pcodContrato` INT, IN `pprofesor` VARCHAR(11))   begin
UPDATE tblcontrati
SET codContrato=pcodContrato, profesor=pprofesor;
END$$

DROP PROCEDURE IF EXISTS `consultageneralDepartamento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneralDepartamento` ()   BEGIN
SELECT*
from tbldepartamento;
END$$

DROP PROCEDURE IF EXISTS `consultageneralFacturaServicio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneralFacturaServicio` ()   BEGIN
SELECT*
from tblfacturaservicio;
END$$

DROP PROCEDURE IF EXISTS `consultageneralformapago`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneralformapago` ()   BEGIN
SELECT*from tblformapago;
END$$

DROP PROCEDURE IF EXISTS `consultageneralgenero`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneralgenero` ()   BEGIN
SELECT*from tblgenero;
END$$

DROP PROCEDURE IF EXISTS `consultageneralhorarioprofesor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneralhorarioprofesor` ()   BEGIN
SELECT*from tblhorarioprofesor;
END$$

DROP PROCEDURE IF EXISTS `consultageneralmateria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneralmateria` (IN `pcodMateria` INT, IN `pnombre` VARCHAR(40), IN `pprofesor` VARCHAR(11))   BEGIN
DELETE FROM tblmateria
WHERE tblmateria.codMateria=pcodmateria;
END$$

DROP PROCEDURE IF EXISTS `consultageneralperfil`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneralperfil` ()   BEGIN
SELECT*from tblperfil;
END$$

DROP PROCEDURE IF EXISTS `consultageneralservicio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneralservicio` ()   begin
SELECT* FROM tblservicio;
END$$

DROP PROCEDURE IF EXISTS `consultageneraltipodoc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneraltipodoc` ()   begin
DELETE  from tbltipodoc
WHERE tbltipodoc.codTipodoc=pcodTipodoc;
END$$

DROP PROCEDURE IF EXISTS `consultageneralUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultageneralUsuario` ()   BEGIN
SELECT*from tblusuario;
END$$

DROP PROCEDURE IF EXISTS `eliminarAdministrador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarAdministrador` (IN `pnombre` VARCHAR(15), IN `psuario` VARCHAR(20), IN `pontraseña` INT, IN `podadministrador` INT)   BEGIN
DELETE FROM tbladnimistrador
WHERE tbladministrador.codadministrador=pcodadministrador;
END$$

DROP PROCEDURE IF EXISTS `eliminarciudad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarciudad` (IN `pcodCiudad` VARCHAR(5))   BEGIN
DELETE FROM tblciudad
WHERE codciudad=pcodciudad;
end$$

DROP PROCEDURE IF EXISTS `eliminarDepartamento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarDepartamento` (IN `pcodDepartamento` VARCHAR(2))   BEGIN
delete from tbldepartamento
WHERE codDepartamento=pcodDepartamento;
END$$

DROP PROCEDURE IF EXISTS `eliminarfacturaservicio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarfacturaservicio` (IN `pnumero` INT)   BEGIN
DELETE from tblfacturaservicio
WHERE numero=pnumero;
END$$

DROP PROCEDURE IF EXISTS `eliminarformapago`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarformapago` (IN `pcodformapago` INT, IN `pnombre` VARCHAR(20))   BEGIN
DELETE FROM tblformapago
WHERE tblformapago.codformapago=pcodformapago;
END$$

DROP PROCEDURE IF EXISTS `eliminarGenero`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarGenero` (IN `pcodgenero` INT, IN `pnombre` VARCHAR(15))   BEGIN
DELETE FROM tblgenero
WHERE tblgenero.codGenero=pcodgenero;
END$$

DROP PROCEDURE IF EXISTS `eliminarhorarioprofesor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarhorarioprofesor` (IN `pcodhorario` INT, IN `pfechaInicio` DATETIME, IN `pfechaFinal` DATETIME, IN `pprofesor` VARCHAR(11))   BEGIN
DELETE FROM tblhorarioprofesor
WHERE tblhorarioprofesor.codhorario=pcodhorario;
END$$

DROP PROCEDURE IF EXISTS `eliminarmateria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarmateria` (IN `pcodMateria` INT, IN `pnombre` VARCHAR(40), IN `pprofesor` VARCHAR(11))   begin
DELETE  from tblmateria
WHERE tblmateria.codMateria=pcodMateria;
END$$

DROP PROCEDURE IF EXISTS `eliminarPerfil`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarPerfil` (IN `pcodperfil` INT, IN `pnombre` VARCHAR(30))   BEGIN
DELETE FROM tblperfil
WHERE tblperfil.codPerfil=pcodperfil;
END$$

DROP PROCEDURE IF EXISTS `eliminarservicio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarservicio` (IN `pcodServicio` INT, IN `pvalor` INT, `pnombre` VARCHAR(40))   begin
UPDATE tblservicio
set codServicio=pcodServicio,nombre=pnombre;
END$$

DROP PROCEDURE IF EXISTS `eliminartipodoc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminartipodoc` (IN `pcodTipodoc` INT, IN `pnombre` VARCHAR(22))   begin
DELETE  from tbltipodoc
WHERE tbltipodoc.codTipodoc=pcodTipodoc;
END$$

DROP PROCEDURE IF EXISTS `eliminarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarUsuario` (IN `pnumDoc` VARCHAR(11), IN `ptipoDoc` INT, IN `pnombre` VARCHAR(40), IN `papellidos` VARCHAR(40), IN `pperfil` INT, IN `pgenero` INT, IN `pdireccion` VARCHAR(100), IN `pciudad` VARCHAR(5), IN `ptelefono` VARCHAR(11), IN `pcorreo` VARCHAR(70), IN `clave` VARCHAR(72))   begin
DELETE  from tblusuario
WHERE tblusuario.tipoDoc=pnumDoc;
END$$

DROP PROCEDURE IF EXISTS `insertaperfil`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertaperfil` (IN `pnombre` VARCHAR(30), IN `pcodPerfil` INT)   begin
INSERT INTO tblperfil
values(pnombre,pcodPerfil);
END$$

DROP PROCEDURE IF EXISTS `insertarAdministrador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarAdministrador` (IN `pnombre` VARCHAR(20), IN `pusuario` VARCHAR(20), IN `pcontraseña` INT(30), IN `pcodAdministrador` INT(30))   begin
INSERT INTO tbladministrador
values(pnombre , pusuario, pcontraseña ,pcodAdministrador);
END$$

DROP PROCEDURE IF EXISTS `insertarciudad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarciudad` (IN `pcodCiudad` VARCHAR(5), IN `pnombre` VARCHAR(40), IN `pdepartamento` VARCHAR(2))   begin
INSERT INTO tblciudad
values(pcodCiudad,pnombre,pdepartamento);
END$$

DROP PROCEDURE IF EXISTS `insertarcontrato`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarcontrato` (IN `pcodContrato` INT, IN `pprofesor` VARCHAR(11))   BEGIN
DELETE FROM tblcontrati
WHERE tblcontrati.codContrato=pcodContrato;
END$$

DROP PROCEDURE IF EXISTS `insertarDepartamento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDepartamento` (IN `pcodDepartamento` VARCHAR(2), IN `pnombre` VARCHAR(40))   begin
INSERT INTO tbldepartamento
values(pcodDepartamento,pnombre);
END$$

DROP PROCEDURE IF EXISTS `insertarfacturaservicio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarfacturaservicio` (IN `pnumero` INT, IN `pcodservicio` INT, IN `pcodhorario` INT, IN `pcliente` VARCHAR(11), IN `pfecha` DATETIME, IN `pformapago` INT, IN `pvalor` INT)   begin
INSERT INTO tblfacturaservicio
VALUES ( pnumero,pcodservicio,pcodhorario,pcliente,pfecha,pformapago,pvalor);
END$$

DROP PROCEDURE IF EXISTS `insertarformapago`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarformapago` (IN `ptransferencia` VARCHAR(20), IN `pcodformapago` INT)   begin
INSERT INTO tblformapago
values(ptransferencia,pcodformapago);
END$$

DROP PROCEDURE IF EXISTS `insertargenero`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertargenero` (IN `pnombre` VARCHAR(15), IN `pcodGenero` INT)   begin
INSERT INTO tblgenero
values(pnombre,pcodGenero);
END$$

DROP PROCEDURE IF EXISTS `insertarhorarioprofesor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarhorarioprofesor` (IN `pcodhoraio` INT, IN `pfechaInicio` DATETIME, IN `fechaFinal` DATETIME, IN `pprofesor` VARCHAR(11))   begin
INSERT INTO tblhorarioprofesor
values(pcodhorario,pfechaInicio,pfechaFinal,pprofesor);
END$$

DROP PROCEDURE IF EXISTS `insertarmateria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarmateria` (IN `pcodMateria` INT, IN `pnombre` VARCHAR(40), IN `pprofesor` VARCHAR(11))   begin
INSERT INTO tblmateria
values(pcodMateri,pnombre,pprofesor);
END$$

DROP PROCEDURE IF EXISTS `insertarservicio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarservicio` (IN `pcodServicio` INT, IN `pvalor` INT, `pnombre` VARCHAR(40))   begin
INSERT INTO tblservicio
values(pcodServicio,pvalor,pnombre);
END$$

DROP PROCEDURE IF EXISTS `insertartipodoc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertartipodoc` (IN `pcodTipodoc` INT, IN `pnombre` VARCHAR(22))   BEGIN
INSERT INTO tbltipodoc
VALUES ( pcodTipodoc,pnombre);
END$$

DROP PROCEDURE IF EXISTS `insertarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario` (IN `pnumDoc` VARCHAR(11), IN `ptipoDoc` INT, IN `pnombre` VARCHAR(40), IN `papellidos` VARCHAR(40), IN `pperfil` INT, IN `pgenero` INT, IN `pdireccion` VARCHAR(100), IN `pciudad` VARCHAR(5), IN `ptelefono` VARCHAR(10), IN `pcorreo` VARCHAR(70), IN `pclave` VARCHAR(72))   begin
INSERT INTO tblusuario
values(numdoc=pnumDoc,tipodoc=ptipoDoc,nombre=pnombre,apellidos=papellidos,
      perfil=pperfil,genero=pgenero,direccion=pdireccion,
       ciudad=pciudad,telefono=ptelefono,correo=pcorreo,clave=pclave);
END$$

DROP PROCEDURE IF EXISTS `SPtblcontratiinsertar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPtblcontratiinsertar` (IN `PcodContrato` INT(30), IN `profesor` VARCHAR(11))   BEGIN
INSERT INTO tblcontrati
values('1','asd');
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbladministrador`
--

DROP TABLE IF EXISTS `tbladministrador`;
CREATE TABLE `tbladministrador` (
  `nombre` varchar(20) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `contraseña` int(30) DEFAULT NULL,
  `codadministrador` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tbladministrador`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblciudad`
--

DROP TABLE IF EXISTS `tblciudad`;
CREATE TABLE `tblciudad` (
  `codCiudad` varchar(5) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `departamento` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tblciudad`:
--   `departamento`
--       `tbldepartamento` -> `codDepartamento`
--

--
-- Volcado de datos para la tabla `tblciudad`
--

INSERT INTO `tblciudad` (`codCiudad`, `nombre`, `departamento`) VALUES
('05001', 'medellin', '01'),
('05002', 'abejorral', '01'),
('05604', 'remedios', '01'),
('05607', 'retiro', '01'),
('05615', 'rionegro', '01'),
('91001', 'leticia', '02'),
('91263', 'el encanto', '02'),
('91405', 'la chorrera', '02'),
('91407', 'la pedrera', '02'),
('91430', 'la victoria', '02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcontrato`
--

DROP TABLE IF EXISTS `tblcontrato`;
CREATE TABLE `tblcontrato` (
  `codContrato` int(30) NOT NULL,
  `profesor` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tblcontrato`:
--   `profesor`
--       `tblusuario` -> `numDoc`
--   `codContrato`
--       `tbladministrador` -> `codadministrador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldepartamento`
--

DROP TABLE IF EXISTS `tbldepartamento`;
CREATE TABLE `tbldepartamento` (
  `codDepartamento` varchar(2) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tbldepartamento`:
--

--
-- Volcado de datos para la tabla `tbldepartamento`
--

INSERT INTO `tbldepartamento` (`codDepartamento`, `nombre`) VALUES
('01', 'Antioquia'),
('02', 'Amazonas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblfacturaservicio`
--

DROP TABLE IF EXISTS `tblfacturaservicio`;
CREATE TABLE `tblfacturaservicio` (
  `numero` int(11) NOT NULL,
  `codservicio` int(1) NOT NULL,
  `codhorario` int(1) NOT NULL,
  `profesor` varchar(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `formaPago` int(1) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tblfacturaservicio`:
--   `formaPago`
--       `tblformapago` -> `codformapago`
--   `codhorario`
--       `tblhorarioprofesor` -> `codhorario`
--   `codservicio`
--       `tblservicio` -> `codservicio`
--   `profesor`
--       `tblusuario` -> `numDoc`
--

--
-- Volcado de datos para la tabla `tblfacturaservicio`
--

INSERT INTO `tblfacturaservicio` (`numero`, `codservicio`, `codhorario`, `profesor`, `fecha`, `formaPago`, `valor`) VALUES
(565, 5, 1, '1457163111', '2003-06-01 00:00:00', 1, 300500),
(3725, 3, 1, '1375193223', '1993-06-01 00:00:00', 1, 3005000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblformapago`
--

DROP TABLE IF EXISTS `tblformapago`;
CREATE TABLE `tblformapago` (
  `codformapago` int(1) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tblformapago`:
--

--
-- Volcado de datos para la tabla `tblformapago`
--

INSERT INTO `tblformapago` (`codformapago`, `nombre`) VALUES
(1, 'transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblgenero`
--

DROP TABLE IF EXISTS `tblgenero`;
CREATE TABLE `tblgenero` (
  `codGenero` int(1) NOT NULL,
  `nombre` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tblgenero`:
--

--
-- Volcado de datos para la tabla `tblgenero`
--

INSERT INTO `tblgenero` (`codGenero`, `nombre`) VALUES
(1, 'masculino'),
(2, 'femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblhorarioprofesor`
--

DROP TABLE IF EXISTS `tblhorarioprofesor`;
CREATE TABLE `tblhorarioprofesor` (
  `codhorario` int(1) NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFinal` datetime NOT NULL,
  `profesor` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tblhorarioprofesor`:
--   `profesor`
--       `tblusuario` -> `numDoc`
--

--
-- Volcado de datos para la tabla `tblhorarioprofesor`
--

INSERT INTO `tblhorarioprofesor` (`codhorario`, `fechaInicio`, `fechaFinal`, `profesor`) VALUES
(1, '1993-01-01 00:00:00', '2000-01-01 00:00:00', '1001123234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmateria`
--

DROP TABLE IF EXISTS `tblmateria`;
CREATE TABLE `tblmateria` (
  `codMateria` int(5) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `profesor` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tblmateria`:
--   `profesor`
--       `tblusuario` -> `numDoc`
--

--
-- Volcado de datos para la tabla `tblmateria`
--

INSERT INTO `tblmateria` (`codMateria`, `nombre`, `profesor`) VALUES
(1, 'matematicas', '1092173029'),
(3, 'sociales', '1212183345'),
(4, 'naturales', '1323193567'),
(1234, 'alfred', '1193103923');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblperfil`
--

DROP TABLE IF EXISTS `tblperfil`;
CREATE TABLE `tblperfil` (
  `codPerfil` int(1) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tblperfil`:
--

--
-- Volcado de datos para la tabla `tblperfil`
--

INSERT INTO `tblperfil` (`codPerfil`, `nombre`) VALUES
(1, 'cliente'),
(2, 'educador'),
(3, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblservicio`
--

DROP TABLE IF EXISTS `tblservicio`;
CREATE TABLE `tblservicio` (
  `codservicio` int(3) NOT NULL,
  `valor` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tblservicio`:
--

--
-- Volcado de datos para la tabla `tblservicio`
--

INSERT INTO `tblservicio` (`codservicio`, `valor`, `nombre`) VALUES
(1, 30000, 'matematicas'),
(2, 25000, 'ingles'),
(3, 55000, 'español'),
(4, 15000, 'biologia'),
(5, 20000, 'sociales'),
(6, 14000, 'matematicas'),
(7, 23000, 'ingles'),
(8, 28000, 'español'),
(9, 19000, 'biologia'),
(10, 55000, 'sociales'),
(11, 34000, 'matematicas'),
(12, 10000, 'ingles'),
(13, 12000, 'español'),
(14, 14000, 'biologia'),
(15, 18000, 'sociales'),
(16, 22000, 'matematicas'),
(17, 23000, 'ingles'),
(18, 24000, 'español'),
(19, 29000, 'biologia'),
(20, 37000, 'sociales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipodoc`
--

DROP TABLE IF EXISTS `tbltipodoc`;
CREATE TABLE `tbltipodoc` (
  `codTipodoc` int(2) NOT NULL,
  `nombre` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tbltipodoc`:
--

--
-- Volcado de datos para la tabla `tbltipodoc`
--

INSERT INTO `tbltipodoc` (`codTipodoc`, `nombre`) VALUES
(1, 'cedula'),
(2, 'documento de identidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuario`
--

DROP TABLE IF EXISTS `tblusuario`;
CREATE TABLE `tblusuario` (
  `numDoc` varchar(11) NOT NULL,
  `tipoDoc` int(1) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `perfil` int(1) NOT NULL,
  `genero` int(1) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `ciudad` varchar(5) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(70) NOT NULL,
  `clave` varchar(72) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tblusuario`:
--   `genero`
--       `tblgenero` -> `codGenero`
--   `perfil`
--       `tblperfil` -> `codPerfil`
--   `tipoDoc`
--       `tbltipodoc` -> `codTipodoc`
--   `ciudad`
--       `tblciudad` -> `codCiudad`
--

--
-- Volcado de datos para la tabla `tblusuario`
--

INSERT INTO `tblusuario` (`numDoc`, `tipoDoc`, `nombre`, `apellidos`, `perfil`, `genero`, `direccion`, `ciudad`, `telefono`, `correo`, `clave`) VALUES
('1001123234', 1, 'alberto', 'mejia sanchez', 2, 1, 'vereda el tablazo', '05615', '3214567890', 'albertoM30@gmail.com', 'AlbertoM30'),
('1092173029', 1, 'ernesto', 'tobon', 2, 1, 'carrera 6 #01-09', '05001', '313345809', '@gmail.com', 'ernestoT29'),
('1193103923', 2, 'alfred', 'castro', 1, 1, 'calle 7 #10-16', '05001', '3130984356', '@gmail.com', 'alfredC23'),
('1212183345', 1, 'juan', 'guillermo', 2, 1, 'carrera 3 #18-22', '05001', '3125673242', 'JuanG09@gmail.com', 'JuanG09'),
('1284103049', 1, 'dante', 'saenz', 3, 1, 'carrera 7 #11-21', '05607', '3210981212', '@gmail.com', 'danteS49'),
('1323193567', 2, 'maria', 'de las nieves', 2, 1, 'calle 3 #02-21', '05001', '3121234576', 'MariaNieves89@gmail.com', 'MariaNieves89'),
('1375193223', 2, 'camilo', 'gutierrez', 1, 1, 'calle 8 #08-11', '05607', '3216479087', '@gmail.com', 'camiloG23'),
('1434103789', 1, 'jhon', 'ribera', 2, 1, 'carrera 3 #18-23', '05001', '3129031245', 'jhonR23@gmail.com', 'jhonR23'),
('1457163111', 2, 'alex', 'ortega', 1, 1, 'calle 9 #03-14', '05607', '3212341567', '@gmail.com', 'alexO11'),
('1466183231', 1, 'pablo', 'suarez', 3, 1, 'carrera 8 #02-11', '05607', '3214368767', '@gmail.com', 'pabloS31'),
('1545133978', 2, 'lucia', 'sanchez', 1, 2, 'calle 4 #17-21', '05001', '3124032109', 'luciaS45@gmail.com', 'luciaS45'),
('1548173000', 1, 'antonio', 'castro', 3, 1, 'carrera 9 #04-14', '05607', '3210926734', '@gmail.com', 'antonioC00'),
('1649157120', 2, 'cristian', 'saenz', 1, 1, 'calle 10 #05-11', '05615', '3001937890', '@gmail.com', 'cristianS20'),
('1656113078', 1, 'camila', 'jimenez', 2, 2, 'carrera 4 #14-22', '05001', '3128901234', '@gmail.com', 'camilaJ165'),
('1730143987', 1, 'cristina', 'tobon', 3, 2, 'carrera 10 #06-09', '05615', '3008765434', '@gmail.com', 'cristinaT87'),
('1767123123', 2, 'alejandra', 'tobon', 1, 2, 'calle 5 #17-21', '05001', '3133542176', '@gmail.com', 'alejandraT176'),
('1822113345', 2, 'lucia', 'del carmen', 1, 2, 'calle 11 #07-11', '05615', '3002102345', '@gmail.com', 'luciaC45'),
('1878153546', 1, 'luz', 'del carmen', 2, 2, 'carrera 5 #15-18', '05001', '3136091452', '@gmail.com', 'luzC187'),
('1904133000', 2, 'johana', 'mejia gutierres', 3, 2, 'calle 13 #09-16', '05615', '3002346578', '@gmail.com', 'johanaM00'),
('1913123123', 1, 'lucy', 'tabarez', 3, 2, 'carrera 11 #08-12', '05615', '3001890980', '@gmail.com', 'lucyT23'),
('1989163923', 2, 'edgar', 'mejia', 1, 1, 'calle 6 #09-14', '05001', '3135678989', '@gmail.com', 'edgarM23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbladministrador`
--
ALTER TABLE `tbladministrador`
  ADD PRIMARY KEY (`codadministrador`);

--
-- Indices de la tabla `tblciudad`
--
ALTER TABLE `tblciudad`
  ADD PRIMARY KEY (`codCiudad`),
  ADD KEY `fk_tblciudad_tbldepartamento` (`departamento`);

--
-- Indices de la tabla `tblcontrato`
--
ALTER TABLE `tblcontrato`
  ADD PRIMARY KEY (`codContrato`,`profesor`),
  ADD KEY `FK_tblcontrato_profesor_tblusuario` (`profesor`);

--
-- Indices de la tabla `tbldepartamento`
--
ALTER TABLE `tbldepartamento`
  ADD PRIMARY KEY (`codDepartamento`);

--
-- Indices de la tabla `tblfacturaservicio`
--
ALTER TABLE `tblfacturaservicio`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `fk_tblservicio_tblfacturaservicio` (`codservicio`),
  ADD KEY `fk_tblhorarioprofesor_tblfacturaservicio` (`codhorario`),
  ADD KEY `fk_tblformapago_tblfacturaservicio` (`formaPago`),
  ADD KEY `fk_tblusuario_tblfacturaservicio` (`profesor`);

--
-- Indices de la tabla `tblformapago`
--
ALTER TABLE `tblformapago`
  ADD PRIMARY KEY (`codformapago`);

--
-- Indices de la tabla `tblgenero`
--
ALTER TABLE `tblgenero`
  ADD PRIMARY KEY (`codGenero`);

--
-- Indices de la tabla `tblhorarioprofesor`
--
ALTER TABLE `tblhorarioprofesor`
  ADD PRIMARY KEY (`codhorario`),
  ADD KEY `fk_tblhorarioprofesor_tblusuario` (`profesor`);

--
-- Indices de la tabla `tblmateria`
--
ALTER TABLE `tblmateria`
  ADD PRIMARY KEY (`codMateria`),
  ADD KEY `fk_tblmateria_tblusuario` (`profesor`);

--
-- Indices de la tabla `tblperfil`
--
ALTER TABLE `tblperfil`
  ADD PRIMARY KEY (`codPerfil`);

--
-- Indices de la tabla `tblservicio`
--
ALTER TABLE `tblservicio`
  ADD PRIMARY KEY (`codservicio`);

--
-- Indices de la tabla `tbltipodoc`
--
ALTER TABLE `tbltipodoc`
  ADD PRIMARY KEY (`codTipodoc`);

--
-- Indices de la tabla `tblusuario`
--
ALTER TABLE `tblusuario`
  ADD PRIMARY KEY (`numDoc`),
  ADD KEY `fk_tblusuario_tblperfil` (`perfil`),
  ADD KEY `fk_tblusuario_tblgenero` (`genero`),
  ADD KEY `tipoDoc` (`tipoDoc`),
  ADD KEY `ciudad` (`ciudad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblhorarioprofesor`
--
ALTER TABLE `tblhorarioprofesor`
  MODIFY `codhorario` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tblmateria`
--
ALTER TABLE `tblmateria`
  MODIFY `codMateria` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1235;

--
-- AUTO_INCREMENT de la tabla `tblperfil`
--
ALTER TABLE `tblperfil`
  MODIFY `codPerfil` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbltipodoc`
--
ALTER TABLE `tbltipodoc`
  MODIFY `codTipodoc` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblciudad`
--
ALTER TABLE `tblciudad`
  ADD CONSTRAINT `fk_tblciudad_tbldepartamento` FOREIGN KEY (`departamento`) REFERENCES `tbldepartamento` (`codDepartamento`);

--
-- Filtros para la tabla `tblcontrato`
--
ALTER TABLE `tblcontrato`
  ADD CONSTRAINT `FK_tblcontrato_profesor_tblusuario` FOREIGN KEY (`profesor`) REFERENCES `tblusuario` (`numDoc`),
  ADD CONSTRAINT `fk_tblcontrati_codcontrato` FOREIGN KEY (`codContrato`) REFERENCES `tbladministrador` (`codadministrador`);

--
-- Filtros para la tabla `tblfacturaservicio`
--
ALTER TABLE `tblfacturaservicio`
  ADD CONSTRAINT `fk_tblformapago_tblfacturaservicio` FOREIGN KEY (`formaPago`) REFERENCES `tblformapago` (`codformapago`),
  ADD CONSTRAINT `fk_tblhorarioprofesor_tblfacturaservicio` FOREIGN KEY (`codhorario`) REFERENCES `tblhorarioprofesor` (`codhorario`),
  ADD CONSTRAINT `fk_tblservicio_tblfacturaservicio` FOREIGN KEY (`codservicio`) REFERENCES `tblservicio` (`codservicio`),
  ADD CONSTRAINT `fk_tblusuario_tblfacturaservicio` FOREIGN KEY (`profesor`) REFERENCES `tblusuario` (`numDoc`);

--
-- Filtros para la tabla `tblhorarioprofesor`
--
ALTER TABLE `tblhorarioprofesor`
  ADD CONSTRAINT `fk_tblhorarioprofesor_tblusuario` FOREIGN KEY (`profesor`) REFERENCES `tblusuario` (`numDoc`);

--
-- Filtros para la tabla `tblmateria`
--
ALTER TABLE `tblmateria`
  ADD CONSTRAINT `fk_tblmateria_tblusuario` FOREIGN KEY (`profesor`) REFERENCES `tblusuario` (`numDoc`);

--
-- Filtros para la tabla `tblusuario`
--
ALTER TABLE `tblusuario`
  ADD CONSTRAINT `fk_tblusuario_tblgenero` FOREIGN KEY (`genero`) REFERENCES `tblgenero` (`codGenero`),
  ADD CONSTRAINT `fk_tblusuario_tblperfil` FOREIGN KEY (`perfil`) REFERENCES `tblperfil` (`codPerfil`),
  ADD CONSTRAINT `tblusuario_ibfk_1` FOREIGN KEY (`tipoDoc`) REFERENCES `tbltipodoc` (`codTipodoc`),
  ADD CONSTRAINT `tblusuario_ibfk_2` FOREIGN KEY (`ciudad`) REFERENCES `tblciudad` (`codCiudad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
