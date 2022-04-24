-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-04-2022 a las 20:23:25
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbrma`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_rma`
--

CREATE TABLE `estado_rma` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rma`
--

CREATE TABLE `rma` (
  `id_rma` int(11) NOT NULL,
  `facha_solicitud` datetime DEFAULT NULL,
  `informe_tecnico` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_estado_rma` int(11) DEFAULT NULL,
  `id_solucion_rma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(1, 'administrador'),
(2, 'tecnico'),
(3, 'vendedor'),
(4, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solucion_rma`
--

CREATE TABLE `solucion_rma` (
  `id_solucion_rma` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ci` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clave` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activo` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellidos`, `ci`, `direccion`, `telefono`, `email`, `clave`, `activo`, `id_rol`) VALUES
(1, 'jhonatan', 'rojas', '12556193', 'calle monseñor', 76935491, 'jhonatanrojasmercado@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '1', 1),
(2, 'ramiro', 'mendoza', '1234567', 'av america', 72347557, 'ramiromendoza@gmail.com', '75f33e6eebce7012b8c74a889fa8a7ed', '1', 2),
(3, 'alain', 'rojas', '7654321', 'av blaco galindo', 74336816, 'alainrojas@gmail.com', '0407e8c8285ab85509ac2884025dcf42', '1', 3),
(4, 'sandro', 'massi', '12345678', 'calle padilla', 76562214, 'sandromassi@gmail.com', '4983a0ab83ed86e0e7213c8783940193', '1', 4),
(5, 'khkh', 'kjbk', '31456132.OR', 'hfckhb', 54654132, 'jose@gmail.com', '202cb962ac59075b964b07152d234b70', '1', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `num_serie` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  `fecha garantia` datetime DEFAULT NULL,
  `codigo_producto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_rma` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado_rma`
--
ALTER TABLE `estado_rma`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `rma`
--
ALTER TABLE `rma`
  ADD PRIMARY KEY (`id_rma`),
  ADD KEY `id_estado_rma` (`id_estado_rma`),
  ADD KEY `id_solucion_rma` (`id_solucion_rma`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `solucion_rma`
--
ALTER TABLE `solucion_rma`
  ADD PRIMARY KEY (`id_solucion_rma`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_rma` (`id_rma`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado_rma`
--
ALTER TABLE `estado_rma`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rma`
--
ALTER TABLE `rma`
  MODIFY `id_rma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `solucion_rma`
--
ALTER TABLE `solucion_rma`
  MODIFY `id_solucion_rma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rma`
--
ALTER TABLE `rma`
  ADD CONSTRAINT `rma_ibfk_1` FOREIGN KEY (`id_estado_rma`) REFERENCES `estado_rma` (`id_estado`),
  ADD CONSTRAINT `rma_ibfk_2` FOREIGN KEY (`id_solucion_rma`) REFERENCES `solucion_rma` (`id_solucion_rma`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_rma`) REFERENCES `rma` (`id_rma`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;