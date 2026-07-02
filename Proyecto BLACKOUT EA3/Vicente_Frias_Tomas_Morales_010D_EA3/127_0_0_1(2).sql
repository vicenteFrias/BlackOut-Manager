-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2026 a las 03:49:38
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
(1, 1, '2026-05-20 13:00:00.000000', '2026-05-20 10:00:00.000000', 'TATUAJE', 'Tatuaje: Juan Pérez'),
(2, 2, '2026-05-30 13:50:00.000000', '2026-05-30 10:50:00.000000', 'TATUAJE', 'Tatuaje: Juan Pérez');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
(1, 1, 'Muy bueno', '2026-06-21 03:21:32.000000', 5, 1),
(2, 2, 'Excelente', '2026-07-01 13:29:45.000000', 5, 2);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id_cartera` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id_gasto` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id_ingreso` bigint(20) NOT NULL AUTO_INCREMENT;

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
(1, 20000, '+56912345678', 'Manga completa estilo tradicional, tinta negra', 'PENDIENTE', '2026-05-20 13:00:00.000000', '2026-05-20 10:00:00.000000', '2026-05-14 15:00:13.000000', 'Juan Pérez', 150000),
(2, 20000, '+56912345678', 'Manga completa estilo tradicional, tinta negra', 'PENDIENTE', '2026-05-30 13:50:00.000000', '2026-05-30 10:50:00.000000', '2026-05-14 15:09:48.000000', 'Juan Pérez', 150000);

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
-- Volcado de datos para la tabla `tatuadores`
--

INSERT INTO `tatuadores` (`id_usuario`, `especialidad`, `nombre`) VALUES
(1, 'Por definir', 'Vicente'),
(2, 'Por definir', 'Franco');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
(1, 'dragon con rayos', b'1', 'REALISMO', '2026-07-01 13:23:01.000000', 'tomas', 1000, 1),
(2, 'mascara con katana', b'1', 'FLASH_EXCLUSIVO', '2026-07-01 13:26:30.000000', 'tomas', 3000, 1);

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
(1, 'ninguna', 1, 'ninguna', '2026-07-01 13:19:04.000000', b'1', 'ninguna'),
(3, 'alergia al sol', 2, 'ninguna', '2026-07-01 13:21:28.000000', b'1', 'ninguna');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
(1, 1, 'BRONCE', 1, '2026-07-01 13:15:26.000000'),
(2, 2, 'BRONCE', 10, '2026-07-01 13:15:46.000000'),
(3, 3, 'BRONCE', 100, '2026-07-01 13:15:58.000000'),
(4, 4, 'VIP', 8000, '2026-07-01 13:17:22.000000');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
(1, 1, '965894689', 'ENVIADO', '2026-07-01 13:28:06.000000', 'Cita a las 16:00');

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

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`id`, `cantidad_actual`, `costo_unitario_base`, `fecha_registro`, `marca`, `nombre`, `stock_minimo`) VALUES
(1, 60, NULL, '2026-05-14 14:11:12.000000', NULL, 'Agujas', 15),
(2, 50, NULL, '2026-05-14 14:11:36.000000', NULL, 'Agujas 3RL', 10),
(3, 80, 20000, '2026-05-14 14:45:39.000000', 'Magnum 7', 'Agujas', 10);

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
-- Volcado de datos para la tabla `movimiento_stock`
--

INSERT INTO `movimiento_stock` (`id`, `cantidad`, `costo_calculadopf`, `fecha`, `insumo_id`, `tipo`) VALUES
(1, 10, NULL, '2026-05-14 14:20:03.000000', 1, 'AJUSTE');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `movimiento_stock`
--
ALTER TABLE `movimiento_stock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
(3, 'ADMINISTRADOR'),
(4, 'ADMINISTRATIVO'),
(1, 'CLIENTE'),
(2, 'TATUADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `nombre_usuario` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) NOT NULL,
  `correo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `contrasena`, `correo`) VALUES
(1, 'carlos', '$2a$10$xEd6z2M3Mjtyhc9heUegVu4mtCg6kYnEEQ2wSaaLm7BHU.FsMFCLi', 'carlos@gmail.com'),
(7, 'tomas', '$2a$10$u2vD0hVqPkeWbvg4RBRAJehD7JFzOuR8dNbjHOjx.WViLIW8x7ieW', 'tomas@gmail.com'),
(8, 'martin', '$2a$10$BfqRGCrHd8iIGJwSknd/YO9DNIJzBcBUyM1X3n9eTvDkvdF1CecPi', 'martin@gmail.com'),
(9, 'juan', '$2a$10$krYhpOX.usVrQ3Tnfgw11O74m9/E2W906AFpForbSdwWTqFyUP6w.', 'juan@gmail.com'),
(13, 'antonio', '$2a$10$615dcQ55J4QvCey/ZzTcrOUn.rKI4R1rV96YwLCKAeEM6K5bimPi2', 'antonio@gmail.com'),
(14, 'Daniel', '$2a$10$jlUJHzBQiAQ0RkQrT2xHpOeEWyhgo8N8oXtGLfL24fTMKFxkeo12.', 'daniel@gmail.com'),
(16, 'Martina', '$2a$10$bjs5Ae4wEMUwwMwfezLiFugAzjU5t3Dc38kAFXw9Sd64Muk/cXqdO', 'martina@gmail.com');

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
(1, 1),
(7, 3),
(8, 2),
(9, 2),
(13, 3),
(14, 3),
(16, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `usuario_roles`
--
ALTER TABLE `usuario_roles`
  ADD PRIMARY KEY (`usuario_id`,`rol_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario_roles`
--
ALTER TABLE `usuario_roles`
  ADD CONSTRAINT `usuario_roles_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `usuario_roles_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);
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
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `nombre`, `password`, `tipo_usuario`) VALUES
(1, 'blackout@gmail.com', 'Vicente', 'Blackout2', 'Tatuador'),
(2, 'franco@ejemplo.com', 'Franco', 'password123', 'TATUADOR'),
(5, 'dani@gmail.com', 'Daniela', 'dn123', 'Tatuador');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
