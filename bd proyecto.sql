-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2019 a las 09:55:11
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `medi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `IdCaja` int(100) NOT NULL,
  `Unidades` int(100) NOT NULL,
  `FechaCaducidad` date NOT NULL,
  `IdMedicamentoCaja` int(100) NOT NULL,
  `IdUsuarioCaja` int(100) NOT NULL,
  `FechaAct` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCre` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`IdCaja`, `Unidades`, `FechaCaducidad`, `IdMedicamentoCaja`, `IdUsuarioCaja`, `FechaAct`, `FechaCre`) VALUES
(1, 23, '2019-10-30', 1, 1, '2019-10-27 22:52:36', '2019-10-27 22:52:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `IdCargo` int(100) NOT NULL,
  `NombreCargo` varchar(100) NOT NULL,
  `FechaAct` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCre` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`IdCargo`, `NombreCargo`, `FechaAct`, `FechaCre`) VALUES
(1, 'Usu', '2019-10-27 20:07:57', '2019-10-27 20:07:57'),
(2, 'Adm', '2019-10-27 20:07:57', '2019-10-27 20:07:57'),
(3, 'monitor', '2019-10-27 21:13:34', '2019-10-27 21:13:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carmodulo`
--

CREATE TABLE `carmodulo` (
  `IdCarModulo` int(100) NOT NULL,
  `IdModulo` int(100) NOT NULL,
  `IdCargo` int(100) NOT NULL,
  `FechaCre` timestamp NOT NULL DEFAULT current_timestamp(),
  `FechaAct` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carmodulo`
--

INSERT INTO `carmodulo` (`IdCarModulo`, `IdModulo`, `IdCargo`, `FechaCre`, `FechaAct`) VALUES
(1, 2, 1, '2019-10-20 04:29:41', '2019-10-20 04:35:18'),
(2, 1, 2, '2019-10-20 04:29:41', '2019-10-20 04:34:56'),
(3, 1, 1, '2019-10-20 05:17:15', '2019-10-20 05:17:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha`
--

CREATE TABLE `fecha` (
  `IdFecha` int(100) NOT NULL,
  `fecha` date NOT NULL,
  `IdTomaFecha` int(100) NOT NULL,
  `FechaAct` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCre` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fecha`
--

INSERT INTO `fecha` (`IdFecha`, `fecha`, `IdTomaFecha`, `FechaAct`, `FechaCre`) VALUES
(1, '2019-10-31', 1, '2019-10-27 23:04:51', '2019-10-27 23:04:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `IdMedicamento` int(100) NOT NULL,
  `NombreMedicamento` varchar(100) NOT NULL,
  `IdUsuarioMedicamento` int(100) NOT NULL,
  `FechaAct` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCre` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`IdMedicamento`, `NombreMedicamento`, `IdUsuarioMedicamento`, `FechaAct`, `FechaCre`) VALUES
(1, 'asesato', 1, '2019-10-27 22:45:23', '2019-10-27 22:45:23'),
(2, 'asetamino', 1, '2019-10-28 08:53:01', '2019-10-28 08:53:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `IdModulo` int(100) NOT NULL,
  `NombreModulo` varchar(100) NOT NULL,
  `FechaAct` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCre` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`IdModulo`, `NombreModulo`, `FechaAct`, `FechaCre`) VALUES
(1, 'usuario', '2019-10-27 20:06:02', '2019-10-27 20:06:02'),
(2, 'medicamento', '2019-10-27 20:06:02', '2019-10-27 20:06:02'),
(3, 'monitor', '2019-10-27 20:06:02', '2019-10-27 20:06:02'),
(4, 'calendario', '2019-10-27 21:22:14', '2019-10-27 21:22:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `toma`
--

CREATE TABLE `toma` (
  `IdToma` int(100) NOT NULL,
  `Unidades` int(100) NOT NULL,
  `IdMedicamentoToma` int(100) NOT NULL,
  `IdCajaToma` int(100) NOT NULL,
  `IdUsuarioToma` int(100) NOT NULL,
  `FechaAct` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCre` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `toma`
--

INSERT INTO `toma` (`IdToma`, `Unidades`, `IdMedicamentoToma`, `IdCajaToma`, `IdUsuarioToma`, `FechaAct`, `FechaCre`) VALUES
(1, 23, 1, 1, 1, '2019-10-27 22:57:55', '2019-10-27 22:57:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IdUsuario` int(100) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Clave` varchar(100) NOT NULL,
  `IdCargo` int(100) NOT NULL,
  `FechaAct` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCre` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `Apellido`, `Clave`, `IdCargo`, `FechaAct`, `FechaCre`) VALUES
(1, 'angie', 'uy', '772e0805a6eca4336a3914db0de98adf', 1, '2019-10-20 04:40:17', '2019-10-20 04:40:17'),
(2, 'jessi', 'ma', 'e292b1d68c8b480c49074ff1b6e266b8', 2, '2019-10-20 04:41:30', '2019-10-20 04:41:08'),
(3, 'mary', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, '2019-10-27 19:24:01', '2019-10-27 19:24:01'),
(4, 'monitor', 'sd', '08b5411f848a2581a41672a759c87380', 1, '2019-10-27 19:26:15', '2019-10-27 19:26:15');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`IdCaja`),
  ADD KEY `IdMedicamentoCaja` (`IdMedicamentoCaja`),
  ADD KEY `IdUsuarioCaja` (`IdUsuarioCaja`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`IdCargo`);

--
-- Indices de la tabla `carmodulo`
--
ALTER TABLE `carmodulo`
  ADD PRIMARY KEY (`IdCarModulo`),
  ADD KEY `IdModulo` (`IdModulo`),
  ADD KEY `IdCargo` (`IdCargo`);

--
-- Indices de la tabla `fecha`
--
ALTER TABLE `fecha`
  ADD PRIMARY KEY (`IdFecha`),
  ADD KEY `IdTomaFecha` (`IdTomaFecha`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`IdMedicamento`),
  ADD KEY `IdUsuarioMedicamento` (`IdUsuarioMedicamento`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`IdModulo`);

--
-- Indices de la tabla `toma`
--
ALTER TABLE `toma`
  ADD PRIMARY KEY (`IdToma`),
  ADD KEY `IdUsuarioToma` (`IdUsuarioToma`),
  ADD KEY `IdCajaToma` (`IdCajaToma`),
  ADD KEY `IdMedicamentoToma` (`IdMedicamentoToma`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdUsuario`),
  ADD KEY `IdCargo` (`IdCargo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carmodulo`
--
ALTER TABLE `carmodulo`
  MODIFY `IdCarModulo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`IdUsuarioCaja`) REFERENCES `usuario` (`IdUsuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `caja_ibfk_2` FOREIGN KEY (`IdMedicamentoCaja`) REFERENCES `medicamento` (`IdMedicamento`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `carmodulo`
--
ALTER TABLE `carmodulo`
  ADD CONSTRAINT `carmodulo_ibfk_1` FOREIGN KEY (`IdModulo`) REFERENCES `modulo` (`IdModulo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `carmodulo_ibfk_2` FOREIGN KEY (`IdCargo`) REFERENCES `cargo` (`IdCargo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `fecha`
--
ALTER TABLE `fecha`
  ADD CONSTRAINT `fecha_ibfk_1` FOREIGN KEY (`IdTomaFecha`) REFERENCES `toma` (`IdToma`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD CONSTRAINT `medicamento_ibfk_1` FOREIGN KEY (`IdUsuarioMedicamento`) REFERENCES `usuario` (`IdUsuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `toma`
--
ALTER TABLE `toma`
  ADD CONSTRAINT `toma_ibfk_1` FOREIGN KEY (`IdUsuarioToma`) REFERENCES `usuario` (`IdUsuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `toma_ibfk_2` FOREIGN KEY (`IdMedicamentoToma`) REFERENCES `medicamento` (`IdMedicamento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `toma_ibfk_3` FOREIGN KEY (`IdCajaToma`) REFERENCES `caja` (`IdCaja`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`IdCargo`) REFERENCES `cargo` (`IdCargo`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
