-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 06-10-2020 a las 07:14:45
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbnadadores`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Nadador`
--

CREATE TABLE `Nadador` (
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `estilo` varchar(20) NOT NULL,
  `distancia` int(11) NOT NULL,
  `tiempo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Nadador`
--

INSERT INTO `Nadador` (`nombre`, `apellido`, `estilo`, `distancia`, `tiempo`) VALUES
('Caeleb', 'Dressel', 'Mariposa', 100, 49.5),
('Chad', 'LeClos', 'Mariposa', 100, 50.23),
('Joseph', 'Schooling', 'Mariposa', 100, 50.39),
('Laszlo', 'CSEH', 'Mariposa', 100, 51.14),
('Michael', 'Phelps', 'Mariposa', 100, 49.82),
('Milorad', 'Cavic', 'Mariposa', 100, 50.01);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Nadador`
--
ALTER TABLE `Nadador`
  ADD PRIMARY KEY (`nombre`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
