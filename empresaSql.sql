





create database t_plaza;
use t_plaza;

-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2018 a las 08:22:25
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajadepago`
--

CREATE TABLE IF NOT EXISTS `cajadepago` (
  `cod_sucursal` int(11) NOT NULL,
  `num_de_caja` int(11) NOT NULL,
  `monto_recaudado` float(10,2) NOT NULL,
  PRIMARY KEY (`cod_sucursal`,`num_de_caja`),
  KEY `FK_ Caja Tienda` (`cod_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `dni` char(8) NOT NULL,
  `monto_a_pagar` float(10,2) NOT NULL,
  `cod_sucursal` int(11) NOT NULL,
  `num_de_caja` int(11) NOT NULL,

  PRIMARY KEY (`dni`),
  KEY `FK_Caja_Cliente` (`num_de_caja`,`cod_sucursal`),
  KEY `CajaTiendaId` (`cod_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE IF NOT EXISTS `tienda` (
  `cod_sucursal` int(11) NOT NULL,
  `distrito` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cod_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajadepago`
--
ALTER TABLE `cajadepago`
  ADD CONSTRAINT `FK_ Caja_Tienda` FOREIGN KEY (`cod_sucursal`) REFERENCES `tienda` (`cod_sucursal`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
--  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`cod_sucursal`) REFERENCES `cajadepago` (`cod_sucursal`),
--  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`num_de_caja`) REFERENCES `cajadepago` (`num_de_caja`),
  ADD CONSTRAINT `FK_Caja_Cliente_2` FOREIGN KEY (`cod_sucursal`, `num_de_caja`) REFERENCES `cajadepago` (`cod_sucursal`,`num_de_caja`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
