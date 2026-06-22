-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2026 a las 02:28:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_agenda`
--
CREATE DATABASE IF NOT EXISTS `db_agenda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_agenda`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `id` bigint(20) NOT NULL,
  `cita_id` bigint(20) DEFAULT NULL,
  `fin` datetime(6) DEFAULT NULL,
  `inicio` datetime(6) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agenda`
--

INSERT INTO `agenda` (`id`, `cita_id`, `fin`, `inicio`, `tipo`, `titulo`) VALUES
(1, 1, '2026-06-26 18:00:00.000000', '2026-06-26 15:00:00.000000', 'TATUAJE', 'Tatuaje: Camila Rojas'),
(2, NULL, '2026-06-26 13:00:00.000000', '2026-06-26 10:00:00.000000', 'PERSONAL', 'Bloque Disponible Tatuador 1'),
(3, 0, '2026-06-26 13:00:00.000000', '2026-06-26 10:00:00.000000', 'PERSONAL', 'Bloque Disponible Tatuador 1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Base de datos: `db_calificaciones`
--
CREATE DATABASE IF NOT EXISTS `db_calificaciones` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_calificaciones`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` bigint(20) NOT NULL,
  `cita_id` bigint(20) NOT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `fecha_calificacion` datetime(6) DEFAULT NULL,
  `puntuacion` int(11) NOT NULL,
  `tatuador_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id`, `cita_id`, `comentario`, `fecha_calificacion`, `puntuacion`, `tatuador_id`) VALUES
(1, 1, 'Excelente experiencia. El estudio estaba impecable y las líneas del tatuaje son perfectas.', '2026-06-21 20:20:53.000000', 5, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Base de datos: `db_cartera`
--
CREATE DATABASE IF NOT EXISTS `db_cartera` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_cartera`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartera`
--

CREATE TABLE `cartera` (
  `id_cartera` bigint(20) NOT NULL,
  `mes_referencia` varbinary(255) DEFAULT NULL,
  `run_tatuador` bigint(20) NOT NULL,
  `saldo_total` int(11) DEFAULT NULL,
  `ultima_actualizacion` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cartera`
--

INSERT INTO `cartera` (`id_cartera`, `mes_referencia`, `run_tatuador`, `saldo_total`, `ultima_actualizacion`) VALUES
(1, NULL, 12345678, 0, '2026-05-25 03:09:20.000000'),
(3, NULL, 12345679, 20000, '2026-05-25 03:17:00.000000'),
(4, NULL, 210516689, 54000, '2026-06-21 20:18:40.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id_gasto` bigint(20) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_gasto` datetime(6) NOT NULL,
  `monto_gasto` int(11) NOT NULL,
  `id_cartera` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`id_gasto`, `categoria`, `descripcion`, `fecha_gasto`, `monto_gasto`, `id_cartera`) VALUES
(1, 'Insumos', 'tips', '2026-05-25 03:17:00.000000', 10000, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id_ingreso` bigint(20) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `id_cita` bigint(20) DEFAULT NULL,
  `metodo_pago` varchar(255) NOT NULL,
  `monto` int(11) NOT NULL,
  `id_cartera` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id_ingreso`, `descripcion`, `fecha`, `id_cita`, `metodo_pago`, `monto`, `id_cartera`) VALUES
(1, 'Tatuaje de una rosa pequeña', '2026-05-25 03:13:17.000000', 123, 'TRANSFERENCIA/EFECTIVO', 30000, 3),
(2, 'Tatuaje finalizado: Camila Rojas', '2026-06-21 20:18:39.000000', 1, 'TRANSFERENCIA/EFECTIVO', 54000, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cartera`
--
ALTER TABLE `cartera`
  ADD PRIMARY KEY (`id_cartera`),
  ADD UNIQUE KEY `UKrceffke6xi7fssbrdeyf7iibd` (`run_tatuador`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id_gasto`),
  ADD KEY `FKmrxt892fqn62lppomtgxejdtf` (`id_cartera`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id_ingreso`),
  ADD KEY `FKasllw90r459wdnb0lu3ock0s3` (`id_cartera`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cartera`
--
ALTER TABLE `cartera`
  MODIFY `id_cartera` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id_gasto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id_ingreso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `FKmrxt892fqn62lppomtgxejdtf` FOREIGN KEY (`id_cartera`) REFERENCES `cartera` (`id_cartera`);

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `FKasllw90r459wdnb0lu3ock0s3` FOREIGN KEY (`id_cartera`) REFERENCES `cartera` (`id_cartera`);
--
-- Base de datos: `db_citas`
--
CREATE DATABASE IF NOT EXISTS `db_citas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_citas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` bigint(20) NOT NULL,
  `abono` int(11) DEFAULT NULL,
  `contacto_cliente` varchar(255) DEFAULT NULL,
  `descripcion_diseno` varchar(1000) DEFAULT NULL,
  `estado` enum('CANCELADA','CONFIRMADA','FINALIZADA','NOSHOW','PENDIENTE') DEFAULT NULL,
  `fecha_hora_fin` datetime(6) NOT NULL,
  `fecha_hora_inicio` datetime(6) NOT NULL,
  `fecha_registro` datetime(6) DEFAULT NULL,
  `nombre_cliente` varchar(255) DEFAULT NULL,
  `precio_total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `abono`, `contacto_cliente`, `descripcion_diseno`, `estado`, `fecha_hora_fin`, `fecha_hora_inicio`, `fecha_registro`, `nombre_cliente`, `precio_total`) VALUES
(1, 30000, '+56987654321', 'Máscara Hannya en la pantorrilla derecha.', 'CONFIRMADA', '2026-06-26 18:00:00.000000', '2026-06-26 15:00:00.000000', '2026-06-21 20:16:07.000000', 'Camila Rojas', 120000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tatuadores`
--

CREATE TABLE `tatuadores` (
  `id_usuario` bigint(20) NOT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tatuadores`
--
ALTER TABLE `tatuadores`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Base de datos: `db_disenos`
--
CREATE DATABASE IF NOT EXISTS `db_disenos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_disenos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disenos`
--

CREATE TABLE `disenos` (
  `id` bigint(20) NOT NULL,
  `descripcion_detallada` varchar(1000) NOT NULL,
  `disponible` bit(1) NOT NULL,
  `estilo` enum('ACUARELA','BLACKWORK','FLASH_EXCLUSIVO','REALISMO','TRADICIONAL') DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio_base` int(11) NOT NULL,
  `tatuador_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `disenos`
--

INSERT INTO `disenos` (`id`, `descripcion_detallada`, `disponible`, `estilo`, `fecha_creacion`, `nombre`, `precio_base`, `tatuador_id`) VALUES
(1, 'Diseño a full color, tamaño 15x15cm ideal para brazo o pierna.', b'1', 'TRADICIONAL', '2026-06-21 19:03:10.000000', 'Cráneo Neotradicional', 80000, 1),
(2, 'Diseño tradicional a 3 colores (Rojo, Negro, Amarillo). Tamaño 10x20cm.', b'1', 'TRADICIONAL', '2026-06-21 19:46:18.000000', 'Daga con Rosa', 65000, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `disenos`
--
ALTER TABLE `disenos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `disenos`
--
ALTER TABLE `disenos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Base de datos: `db_fichas`
--
CREATE DATABASE IF NOT EXISTS `db_fichas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_fichas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consentimientos`
--

CREATE TABLE `consentimientos` (
  `id` bigint(20) NOT NULL,
  `alergias` varchar(255) DEFAULT NULL,
  `cita_id` bigint(20) NOT NULL,
  `enfermedades_cronicas` varchar(255) DEFAULT NULL,
  `fecha_firma` datetime(6) DEFAULT NULL,
  `firma_aceptada` bit(1) NOT NULL,
  `observaciones_medicas` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consentimientos`
--

INSERT INTO `consentimientos` (`id`, `alergias`, `cita_id`, `enfermedades_cronicas`, `fecha_firma`, `firma_aceptada`, `observaciones_medicas`) VALUES
(1, 'Ninguna', 1, 'Ninguna', '2026-06-21 20:11:13.000000', b'1', 'Cliente asiste sin contraindicaciones.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consentimientos`
--
ALTER TABLE `consentimientos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consentimientos`
--
ALTER TABLE `consentimientos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Base de datos: `db_fidelidad`
--
CREATE DATABASE IF NOT EXISTS `db_fidelidad` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_fidelidad`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_fidelidad`
--

CREATE TABLE `cuentas_fidelidad` (
  `id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `nivel` varchar(255) DEFAULT NULL,
  `puntos_acumulados` int(11) DEFAULT NULL,
  `ultima_actualizacion` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuentas_fidelidad`
--

INSERT INTO `cuentas_fidelidad` (`id`, `cliente_id`, `nivel`, `puntos_acumulados`, `ultima_actualizacion`) VALUES
(1, 1, 'BRONCE', 120, '2026-06-21 20:19:56.000000');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuentas_fidelidad`
--
ALTER TABLE `cuentas_fidelidad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKrv8j3h6gt7em9vjfu72doq5f4` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuentas_fidelidad`
--
ALTER TABLE `cuentas_fidelidad`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Base de datos: `db_notificaciones`
--
CREATE DATABASE IF NOT EXISTS `db_notificaciones` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_notificaciones`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alertas_notificaciones`
--

CREATE TABLE `alertas_notificaciones` (
  `id` bigint(20) NOT NULL,
  `cita_id` bigint(20) NOT NULL,
  `contacto_cliente` varchar(255) NOT NULL,
  `estado` enum('ENVIADO','FALLIDO','PENDIENTE') DEFAULT NULL,
  `fecha_registro` datetime(6) DEFAULT NULL,
  `mensaje` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alertas_notificaciones`
--

INSERT INTO `alertas_notificaciones` (`id`, `cita_id`, `contacto_cliente`, `estado`, `fecha_registro`, `mensaje`) VALUES
(1, 1, '+56987654321', 'ENVIADO', '2026-06-21 19:59:56.000000', '¡Hola Camila! Te recordamos tu cita en BlackOut Studio para el 26 de Junio a las 10:00 hrs. Recuerda venir bien alimentada.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alertas_notificaciones`
--
ALTER TABLE `alertas_notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alertas_notificaciones`
--
ALTER TABLE `alertas_notificaciones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Base de datos: `db_productos`
--
CREATE DATABASE IF NOT EXISTS `db_productos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_productos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id` bigint(20) NOT NULL,
  `cantidad_actual` int(11) DEFAULT NULL,
  `costo_unitario_base` int(11) DEFAULT NULL,
  `fecha_registro` datetime(6) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_stock`
--

CREATE TABLE `movimiento_stock` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo_calculadopf` int(11) DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `insumo_id` bigint(20) DEFAULT NULL,
  `tipo` enum('AJUSTE','COMPRA','PERDIDA','USO_SESION') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimiento_stock`
--
ALTER TABLE `movimiento_stock`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimiento_stock`
--
ALTER TABLE `movimiento_stock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `db_seguridad`
--
CREATE DATABASE IF NOT EXISTS `db_seguridad` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_seguridad`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `nombre_rol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre_rol`) VALUES
(1, 'ADMIN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `nombre_usuario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `contrasena`, `correo`, `nombre_usuario`) VALUES
(4, '$2a$10$H5YOBNCr0bT54EQVPCu2F.HXSw.SQWS4knL7T.HiZmxOI7pgvvwCe', 'vicente@blackout.com', 'vicente_tattoo'),
(7, '$2a$10$Xrq3uTPXIJf4pDoFWsyBTeZ4w2B9QGzGhwJzslfedGYtsU598I5Qy', 'vicente@blackout.com', 'vicente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_roles`
--

CREATE TABLE `usuario_roles` (
  `usuario_id` bigint(20) NOT NULL,
  `rol_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_roles`
--

INSERT INTO `usuario_roles` (`usuario_id`, `rol_id`) VALUES
(4, 1),
(7, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKof5vabgukahdwmgxk4kjrbu98` (`nombre_usuario`);

--
-- Indices de la tabla `usuario_roles`
--
ALTER TABLE `usuario_roles`
  ADD PRIMARY KEY (`usuario_id`,`rol_id`),
  ADD KEY `FKbt9i9yrb9ug88xnh82n9m60pr` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario_roles`
--
ALTER TABLE `usuario_roles`
  ADD CONSTRAINT `FKbt9i9yrb9ug88xnh82n9m60pr` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `FKuu9tea04xb29m2km5lwe46ua` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
--
-- Base de datos: `db_usuarios`
--
CREATE DATABASE IF NOT EXISTS `db_usuarios` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_usuarios`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipo_usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKkfsp0s1tflm1cwlj8idhqsad0` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
