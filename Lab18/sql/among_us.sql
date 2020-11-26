-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2020 a las 20:44:37
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `among_us`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acusa`
--

DROP TABLE IF EXISTS `acusa`;
CREATE TABLE `acusa` (
  `acusador_id` int(11) NOT NULL,
  `acusado_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `acusa`
--

INSERT INTO `acusa` (`acusador_id`, `acusado_id`, `created_at`) VALUES
(1, 7, '2020-09-25 18:41:25'),
(7, 1, '2020-09-25 18:41:25'),
(5, 8, '2020-09-25 18:41:48'),
(8, 2, '2020-09-25 18:41:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tripulante`
--

DROP TABLE IF EXISTS `tripulante`;
CREATE TABLE `tripulante` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `traidor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tripulante`
--

INSERT INTO `tripulante` (`id`, `nombre`, `traidor`) VALUES
(1, 'EEE', 1),
(2, 'Valeria', 0),
(5, 'Royer', 0),
(6, 'Guillermo', 0),
(7, 'Emilio', 0),
(8, 'Lalo', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acusa`
--
ALTER TABLE `acusa`
  ADD KEY `acusador_index` (`acusador_id`,`acusado_id`),
  ADD KEY `acusado_id` (`acusado_id`);

--
-- Indices de la tabla `tripulante`
--
ALTER TABLE `tripulante`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tripulante`
--
ALTER TABLE `tripulante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acusa`
--
ALTER TABLE `acusa`
  ADD CONSTRAINT `acusa_ibfk_1` FOREIGN KEY (`acusador_id`) REFERENCES `tripulante` (`id`),
  ADD CONSTRAINT `acusa_ibfk_2` FOREIGN KEY (`acusado_id`) REFERENCES `tripulante` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
