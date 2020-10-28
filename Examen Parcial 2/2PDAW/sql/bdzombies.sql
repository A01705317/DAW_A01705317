-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-10-2020 a las 21:45:50
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdzombies`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre_estado` varchar(40) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre_estado`) VALUES
(1, 'Infeccion'),
(2, 'Desorientacion'),
(3, 'Violencia'),
(4, 'Desmayo'),
(5, 'Transformacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_zombie`
--

CREATE TABLE `estado_zombie` (
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_zombie` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zombie`
--

CREATE TABLE `zombie` (
  `id_zombie` int(11) NOT NULL,
  `nombre_zombie` varchar(40) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `zombie`
--

INSERT INTO `zombie` (`id_zombie`, `nombre_zombie`) VALUES
(1, 'Miroslav Klose'),
(2, 'Thomas Muller'),
(3, 'Marco Reus'),
(4, 'Matt Humels'),
(5, 'Manuel Neuer'),
(6, 'Jerom Boateng'),
(7, 'Petter Mertesacken');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_zombie`
--
ALTER TABLE `estado_zombie`
  ADD PRIMARY KEY (`fecha_hora`),
  ADD KEY `index_zombie` (`id_zombie`),
  ADD KEY `index_estado` (`id_estado`);

--
-- Indices de la tabla `zombie`
--
ALTER TABLE `zombie`
  ADD PRIMARY KEY (`id_zombie`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estado_zombie`
--
ALTER TABLE `estado_zombie`
  ADD CONSTRAINT `estado_zombie_ibfk_1` FOREIGN KEY (`id_zombie`) REFERENCES `zombie` (`id_zombie`),
  ADD CONSTRAINT `estado_zombie_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
