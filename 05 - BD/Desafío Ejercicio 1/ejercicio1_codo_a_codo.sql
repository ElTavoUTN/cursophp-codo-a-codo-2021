-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2021 a las 21:21:44
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercicio1_codo_a_codo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(10) NOT NULL,
  `numero_departamento` int(10) NOT NULL,
  `nombre_departamento` varchar(40) NOT NULL,
  `presupuesto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `numero_departamento`, `nombre_departamento`, `presupuesto`) VALUES
(11, 11, 'Calidad', 40000),
(14, 14, 'Informática ', 80000),
(15, 15, 'Gestión ', 95000),
(16, 16, 'Comunicación ', 75000),
(37, 37, 'Desarrollo ', 65000),
(77, 77, 'Investigación ', 40000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(10) NOT NULL,
  `dni` int(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `departamento_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `dni`, `nombre`, `apellidos`, `departamento_id`) VALUES
(1, 31096678, 'Juan', 'Lopez', 14),
(2, 31096675, 'Martin', 'Zarabia', 77),
(3, 34269854, 'Jose', 'velez', 77),
(4, 41369852, 'Paula', 'Madariaga', 77),
(5, 33698521, 'Pedro', 'Perez', 14),
(6, 32698547, 'Mariana', 'Lopez', 15),
(7, 42369854, 'Abril', 'Sanchez', 37),
(8, 36125896, 'Marti', 'Julia', 14),
(9, 36985471, 'Omar', 'Diaz', 15),
(10, 32145698, 'Guadalupe', 'Perez', 77),
(11, 32369854, 'Bernardo', 'pantera', 37),
(12, 36125965, 'Lucia', 'Pesaro', 14),
(13, 31236985, 'Maria', 'diamante', 14),
(14, 32698547, 'Carmen', 'barbieri', 16),
(15, 89267109, 'Esther', 'Vazquez', 11);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departamento_fk` (`departamento_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `departamento_fk` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
