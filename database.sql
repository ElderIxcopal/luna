-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2024 a las 23:57:27
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hr`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ascendencias`
--

CREATE TABLE `ascendencias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ascendencias`
--

INSERT INTO `ascendencias` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'MAYA', '2024-11-11 02:41:23', '2024-11-11 02:41:23'),
(2, '2', 'GARÍFUNA', '2024-11-11 02:41:23', '2024-11-11 02:41:23'),
(3, '3', 'XINKA', '2024-11-11 02:41:23', '2024-11-11 02:41:23'),
(4, '4', 'AFRODESCENDIENTE / CREOLE / AFROMESTIZO', '2024-11-11 02:41:23', '2024-11-11 02:41:23'),
(5, '5', 'LADINO', '2024-11-11 02:41:23', '2024-11-11 02:41:23'),
(6, '6', 'EXTRANJERO', '2024-11-11 02:41:23', '2024-11-11 02:41:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'BAC', '2024-10-09 21:48:25', '2024-10-09 21:48:25'),
(3, '2', 'BI', '2024-10-20 03:34:09', '2024-10-20 03:34:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bonos`
--

CREATE TABLE `bonos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `periodos_id` bigint(20) UNSIGNED NOT NULL,
  `bonos` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisiones`
--

CREATE TABLE `comisiones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `periodos_id` bigint(20) UNSIGNED NOT NULL,
  `comisiones` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `telefono` varchar(75) DEFAULT NULL,
  `calle` varchar(75) DEFAULT NULL,
  `avenida` varchar(50) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `zona` varchar(50) DEFAULT NULL,
  `tipoContacto_id` bigint(20) UNSIGNED NOT NULL,
  `departamento_id` bigint(20) UNSIGNED DEFAULT NULL,
  `municipio_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id`, `empleados_id`, `telefono`, `calle`, `avenida`, `colonia`, `zona`, `tipoContacto_id`, `departamento_id`, `municipio_id`, `created_at`, `updated_at`) VALUES
(60, 81, '4444-5555', '18', 'LAS GALAXIAS', 'REFORMA', '26', 1, 16, 52, '2024-11-12 05:37:53', '2024-11-12 05:37:53'),
(62, 84, '46575986', '1', '2', '3', '4', 1, NULL, NULL, '2024-11-12 20:32:18', '2024-11-12 20:32:18'),
(63, 85, '8987-2356', '4', '5', '6', '7', 1, NULL, NULL, '2024-11-12 21:32:05', '2024-11-12 21:32:05'),
(64, 86, '6666-1245', '8', '9', '1', NULL, 1, NULL, NULL, '2024-11-12 21:39:24', '2024-11-12 21:39:24'),
(65, 87, '6666-1245', '8', '9', '1', NULL, 1, NULL, NULL, '2024-11-12 21:58:14', '2024-11-12 21:58:14'),
(66, 88, '8987-2356', '4', '5', '6', '7', 1, NULL, NULL, '2024-11-12 22:04:00', '2024-11-12 22:04:00'),
(67, 89, '4444-5555', '18', 'LAS GALAXIAS', 'REFORMA', '26', 1, NULL, NULL, '2024-11-14 15:30:29', '2024-11-14 15:30:29'),
(68, 90, '52900809', '18', '2', 'GANADORES', '21', 1, NULL, NULL, '2024-11-14 18:55:08', '2024-11-14 18:55:08'),
(69, 91, '52900809', '18', '2', 'GANADORES', '21', 1, NULL, NULL, '2024-11-14 18:55:28', '2024-11-14 18:55:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `actividadEconomica` varchar(150) DEFAULT NULL,
  `salarioBase` decimal(10,2) DEFAULT NULL,
  `bonoLey` decimal(10,2) DEFAULT NULL,
  `comisionFija` decimal(10,2) DEFAULT NULL,
  `bonoFijo` decimal(10,2) DEFAULT NULL,
  `comisionVariable` decimal(10,2) DEFAULT NULL,
  `bonoVariable` decimal(10,2) DEFAULT NULL,
  `valorHora` decimal(10,2) DEFAULT NULL,
  `periodoPago` varchar(50) DEFAULT NULL,
  `textoContrato` text DEFAULT NULL,
  `tipoContrato_id` bigint(20) UNSIGNED DEFAULT NULL,
  `duracionContrato_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jornadas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `empresas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `puestos_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`id`, `codigo`, `nombre`, `actividadEconomica`, `salarioBase`, `bonoLey`, `comisionFija`, `bonoFijo`, `comisionVariable`, `bonoVariable`, `valorHora`, `periodoPago`, `textoContrato`, `tipoContrato_id`, `duracionContrato_id`, `jornadas_id`, `empresas_id`, `puestos_id`, `created_at`, `updated_at`) VALUES
(1, '1', 'ATENCION AL CLIENTE', 'NO AGRICOLA', 3500.00, 250.00, 0.00, 0.00, 500.00, 500.00, 0.00, '30', NULL, 1, 1, 1, NULL, 0, '2024-11-12 05:37:01', '2024-11-12 05:37:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costos1`
--

CREATE TABLE `costos1` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nombre2` varchar(255) DEFAULT NULL,
  `nombre3` varchar(255) DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `costos1`
--

INSERT INTO `costos1` (`id`, `codigo`, `nombre`, `nombre2`, `nombre3`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 'GT', 'GUATEMALA', NULL, NULL, NULL, NULL, '', '2024-10-08 17:29:40', '2024-10-08 17:29:40'),
(2, 'XE', 'XELA', NULL, NULL, NULL, NULL, '', '2024-10-08 17:29:40', '2024-10-08 17:29:40'),
(3, 'TE', 'TECULUTAN', NULL, NULL, NULL, NULL, '', '2024-10-08 20:51:16', '2024-11-07 23:07:26'),
(4, 'ES', 'ESCUINTLA', NULL, NULL, NULL, NULL, '', '2024-10-09 00:56:04', '2024-11-07 23:06:57'),
(5, 'PE', 'PETEN', NULL, NULL, NULL, NULL, '', '2024-10-09 15:37:03', '2024-11-07 23:07:05'),
(6, 'CO', 'COBAN', 'Lorem', '', '0000-00-00', '0000-00-00', '', '2024-10-09 15:37:23', '2024-11-07 23:07:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costos2`
--

CREATE TABLE `costos2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(5) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nombre2` varchar(255) DEFAULT NULL,
  `nombre3` varchar(255) DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `costos2`
--

INSERT INTO `costos2` (`id`, `codigo`, `nombre`, `nombre2`, `nombre3`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 'ADM', 'ADMINISTRACION - DISTRIBUIDORA', NULL, NULL, NULL, NULL, '', '2024-10-09 21:59:44', '2024-10-09 21:59:44'),
(2, 'EXP', 'EXPORTACIONES', NULL, NULL, NULL, NULL, '', '2024-10-09 22:00:13', '2024-10-09 22:00:13'),
(3, 'INS', 'INSTITUCIONAL', NULL, NULL, NULL, NULL, '', '2024-10-09 22:00:38', '2024-10-09 22:00:38'),
(4, 'LG1', 'LOGISTICA - DISTRIBUCION', NULL, NULL, NULL, NULL, '', '2024-10-09 22:01:04', '2024-10-09 22:01:04'),
(5, 'MA0', 'MERCADO ABIERTO', NULL, NULL, NULL, NULL, '', '2024-10-09 22:01:27', '2024-10-09 22:01:27'),
(6, 'OIG', 'OTROS INGRESOS Y GASTOS', NULL, NULL, NULL, NULL, '', '2024-10-09 22:01:51', '2024-10-09 22:01:51'),
(7, 'PUB', 'PUBLICIDAD', NULL, NULL, NULL, NULL, '', '2024-10-09 22:02:14', '2024-10-09 22:02:14'),
(8, 'TOC', 'TIENDAS OPERADAS CONCESIONARIO', NULL, NULL, NULL, NULL, '', '2024-10-09 22:02:36', '2024-10-09 22:02:36'),
(9, 'TOD', 'TIENDAS OPERADAS DIRECTAMENTE', NULL, NULL, NULL, NULL, '', '2024-10-09 22:02:55', '2024-10-09 22:02:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costos3`
--

CREATE TABLE `costos3` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nombre2` varchar(255) DEFAULT NULL,
  `nombre3` varchar(255) DEFAULT NULL,
  `establecimientos_id` bigint(20) DEFAULT NULL,
  `igss_id` bigint(20) DEFAULT NULL,
  `regiones_id` bigint(20) DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `costos3`
--

INSERT INTO `costos3` (`id`, `codigo`, `nombre`, `nombre2`, `nombre3`, `establecimientos_id`, `igss_id`, `regiones_id`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 'TOD10001', 'ADMINISTRACION TOD', '1', 'T001', NULL, 1, NULL, NULL, NULL, NULL, '2024-11-08 15:17:54', '2024-11-08 15:17:54'),
(2, 'TOD00002', 'C.C. LAS PUERTAS', '2', 'T002', 72, 7, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(3, 'TOD00003', 'KIOSCO GRAN CARCHA', '3', 'T003', 120, 6, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(4, 'TOD00005', 'PRADERA ESCUINTLA', '5', 'T005', 8, 4, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(5, 'TOD00006', 'C.C. MINUTO ESCUINTLA', '6', 'T006', 96, 4, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(6, 'TOD00007', 'PRADERA EXPRESS PALIN', '7', 'T007', 14, 4, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(7, 'TOD00008', 'AMATITLAN', '8', 'T008', 20, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(8, 'TOD00009', 'AMATITLAN 3', '9', 'T009', 54, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(9, 'TOD00010', 'PRADERA EXPRESS LINDA VISTA', '10', 'T010', 13, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(10, 'TOD00011', 'C.C. PLAZA VILLA NUEVA', '11', 'T011', 28, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(11, 'TOD00012', 'C.C. METROCENTRO VILLA NUEVA', '12', 'T012', 90, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(12, 'TOD00013', 'CENTRO COMERCIAL ESPERANCITA VILLA NUEVA', '13', 'T013', 17, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(13, 'TOD00014', 'PLAZA MADERO ROOSEVELT', '14', 'T014', 95, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(14, 'TOD00015', 'MEGACENTRO 2', '15', 'T015', 32, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(15, 'TOD00016', 'C.C. MONTSERRAT PRIMER NIVEL', '16', 'T016', 87, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(16, 'TOD00017', 'C.C. PLAZA SAN NICOLAS', '17', 'T017', 63, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(17, 'TOD00018', 'PERI-ROOSEVELT', '18', 'T018', 102, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(18, 'TOD00019', 'PLAZA JOCOTENANGO', '19', 'T019', 113, 13, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(19, 'TOD00020', 'CENTRO COMERCIAL MEGA SEIS', '20', 'T020', 18, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(20, 'TOD00021', 'MAXI DESPENSA PARROQUIA', '21', 'T021', 26, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(21, 'TOD00022', 'C.C. METRONORTE', '22', 'T022', 41, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(22, 'TOD00023', 'CENTRA NORTE II', '23', 'T023', 69, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(23, 'TOD00024', 'MAXI DESPENSA PLAZA SAN RAFAEL', '24', 'T024', 83, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(24, 'TOD00025', 'PORTALES', '25', 'T025', 88, 1, 0, NULL, NULL, NULL, '2024-11-08 15:18:25', '2024-11-08 15:18:25'),
(25, 'TOD00026', 'BOCA DEL MONTE', '26', 'T026', 73, 1, 1, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(26, 'TOD00027', 'C.C. LOS PROCERES', '27', 'T027', 31, 1, 1, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(27, 'TOD00028', 'ATANASIO TZUL', '28', 'T028', 6, 1, 1, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(28, 'TOD00029', 'ATANASIO TZUL II', '29', 'T029', 38, 1, 1, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(29, 'TOD00030', 'PLAZA LA CONCHA', '30', 'T030', 36, 1, 1, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(30, 'TOD00032', 'KIOSKO PLAZA FRAIJANES', '32', 'T032', 48, 0, 0, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(31, 'TOD00033', 'COMPLEJO COMERCIAL EL FRUTAL', '33', 'T033', 19, 1, 1, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(32, 'TOD00034', 'C.C. PASEO VILLA HERMOSA', '34', 'T034', 58, 1, 1, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(33, 'TOD00036', 'CENTRA SUR', '36', 'T036', 67, 1, 1, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(34, 'TOD00038', 'EL FRUTAL PASILLO', '38', 'T038', 99, 1, 1, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(35, 'TOD00040', 'PLAZA BARBERENA', '40', 'T040', 110, 15, 15, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(36, 'TOD00041', 'MUNDO MAYA PETEN', '41', 'T041', 50, 5, 5, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(37, 'TOD00042', 'MUNDO MAYA INTERNATIONAL MALL', '42', 'T042', 53, 5, 5, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(38, 'TOD00043', 'PUERTO BARRIOS', '43', 'T043', 9, 10, 10, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(39, 'TOD00044', 'PRADERA CHIQUIMULA', '44', 'T044', 12, 8, 8, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(40, 'TOD00045', 'C.C. METRO PLAZA JUTIAPA', '45', 'T045', 71, 11, 11, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(41, 'TOD00046', 'ASUNCION MITA', '46', 'T046', 85, 11, 11, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(42, 'TOD00048', 'PANAJACHEL', '48', 'T048', 34, 16, 16, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(43, 'TOD00049', 'C.C. PLAZA AMERICAS MAZATENANGO', '49', 'T049', 30, 17, 17, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(44, 'TOD00050', 'C C LA TRINIDAD RETALHULEU', '50', 'T050', 39, 12, 12, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(45, 'TOD00051', 'C C PASEO LAS AMERICAS XELA', '51', 'T051', 37, 2, 2, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(46, 'TOD00052', 'C. C. PRADERA XELA', '52', 'T052', 46, 2, 2, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(47, 'TOD00053', 'PASEO CARNAVAL - MAZATENANGO', '53', 'T053', 55, 17, 17, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(48, 'TOD00054', 'LA TRINIDAD COATEPEQUE I', '54', 'T054', 60, 2, 2, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(49, 'TOD00055', 'PLAZA ARBORETO TIQUISATE', '55', 'T055', 98, 4, 4, NULL, NULL, NULL, '2024-11-08 15:21:34', '2024-11-08 15:21:34'),
(50, 'TOD00056', 'PLAZA AMERICAS MILLENIUM MAZATENANGO', '56', 'T056', 111, 17, 17, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(51, 'TOD00057', 'LA TRINIDAD MALACATAN ESQUINA', '57', 'T057', 112, 14, 14, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(52, 'TOD00058', 'SUPER PLAZA LA COMUNIDAD', '58', 'T058', 114, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(53, 'TOD00059', 'CENTRASUR TIENDA', '59', 'T059', 116, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(54, 'TOD00066', 'METROCENTRO TIENDA', '66', 'T066', 122, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(55, 'TOD00068', 'PRADERA CHIMALTENANGO FOODCOURT', '68', 'T068', 124, 7, 7, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(56, 'TOD00069', 'PRADERA ZACAPA', '69', 'T069', 123, 3, 3, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(57, 'TOD00070', 'PRADERA VISTARES', '70', 'T070', 125, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(58, 'TOD00071', 'ZENTRO PLAZA HUEHUETENANGO', '71', 'T071', 126, 9, 9, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(59, 'TOD00072', 'WALMART ROOSEVELT', '72', 'T072', 127, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(60, 'TOD00073', 'NARANJO MALL', '73', 'T073', 128, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(61, 'TOD00074', 'PLAZA EL PARQUE COBAN', '74', 'T074', 129, 6, 6, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(62, 'TOD00075', 'PLAZA MADERO ATANASIO L-29', '75', 'T075', 104, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(63, 'TOD00076', 'PLAZA SANTA AMELIA', '76', 'T076', 130, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(64, 'TOD00078', 'CENTRANORTE E-49', '78', 'T078', 134, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(65, 'TOD00079', 'TIKAL FUTURA FOODCOURT', '79', 'T079', 133, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(66, 'TOD00081', 'SEXTA AVENIDA PARIS PLAZA', '81', 'T081', 132, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(67, 'TOD00084', 'KIOSCO ESKALA ROOSEVELT', '84', 'T084', 137, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(68, 'TOD00085', 'ESKALA ROOSEVELT FOODCOURT', '85', 'T085', 138, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(69, 'TOD00086', 'PLAZA MAGDALENA L-14', '86', 'T086', 140, 6, 6, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(70, 'TOD00087', 'KIOSCO ARBORETO SAN NICOLAS', '87', 'T087', 141, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(71, 'TOD00088', 'PASEO ANDARIA CHIMALTENANGO', '88', 'T088', 143, 7, 7, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(72, 'TOD00089', 'SANTALÚ', '89', 'T089', 144, 4, 4, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(73, 'TOD00091', 'INTERPLAZA ESCUINTLA', '91', 'T091', 146, 4, 4, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(74, 'TOD00092', 'UTZULEW FC', '92', 'T092', 136, 2, 2, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(75, 'TOD00093', 'INTERPLAZA XELA FOODCOURT', '93', 'T093', 147, 2, 2, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(76, 'TOD00095', 'CENTRA SUR 1-PB', '95', 'T095', 149, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(77, 'TOD00096', 'PRADERA Z10 FOODCOURT', '96', 'T096', 150, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(78, 'TOD00097', 'METROPLAZA POPTUN', '97', 'T097', 151, 5, 5, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(79, 'TOD00098', 'METROPLAZA 4 CAMINOS FS9', '98', 'T098', 154, 2, 2, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(80, 'TOD00099', 'INTERPLAZA CHIMALTENANGO', '99', 'T099', 161, 7, 7, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(81, 'TOD00100', 'ATANASIO L-5', '100', 'T100', 158, 1, 1, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(82, 'TOD00102', 'PRADERA HUEHUETENANGO L-140', '102', 'T102', 16, 9, 9, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(83, 'TOD00103', 'PRADERA SANTA LUCIA A6', '103', 'T103', 10, 4, 4, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(84, 'TOD00104', 'SAN ANDRES PETEN', '104', 'T104', 152, 5, 5, NULL, NULL, NULL, '2024-11-08 15:24:07', '2024-11-08 15:24:07'),
(85, 'TOD00106', 'EL ENCUENTRO SAN JOSE PINULA', '106', 'T106', 155, 1, 1, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(86, 'TOD00107', 'EL ENCUENTRO PALIN', '107', 'T107', 156, 4, 4, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(87, 'TOD00109', 'PLAZA VISTA HERMOSA ASUNCION MITA', '109', 'T109', 165, 11, 11, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(88, 'TOD00110', 'PLAZA TECA COATEPEQUE', '110', 'T110', 167, 2, 2, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(89, 'TOD00112', 'PLAZA REFORMADORES', '112', 'T112', 164, 1, 1, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(90, 'TOD00113', 'LOS ALTOS TOTONICAPÁN', '113', 'T113', 163, 2, 2, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(91, 'TOD00115', 'EL ENCUENTRO CIUDAD VIEJA', '115', 'T115', 162, 1, 1, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(92, 'TOD00116', 'EL ENCUENTRO SANTA CRUZ DEL QUICHÉ', '116', 'T116', 169, 2, 2, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(93, 'TOD00118', 'PLAZA FLORIDA', '118', 'T118', 159, 1, 1, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(94, 'TOD00119', 'PLAZA TELARES ANTIGUA', '119', 'T119', 166, 13, 13, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(95, 'TOD00122', 'WALMART VILLA NUEVA', '122', 'T122', 172, 1, 1, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(96, 'TOD00123', 'PLAZA OCTUBRE VILLA NUEVA', '123', 'T123', 173, 1, 1, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(97, 'TOD00174', 'MAXI DESPENSA PRADERA ESCUINTLA', '174', 'T174', 174, 4, 4, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(98, 'TOD00175', 'METROCENTRO L-276', '175', 'T175', 175, 1, 1, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(99, 'TOD00176', 'PAIZ PACIFIC CENTER', '176', 'T176', 176, 1, 1, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(100, 'ADM00001', 'AUDITORIA', 'ADM00001', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(101, 'ADM00002', 'CONTABILIDAD', 'ADM00002', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(102, 'ADM00003', 'RECURSOS HUMANOS', 'ADM00003', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(103, 'ADM00004', 'LIQUIDACIONES', 'ADM00004', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(104, 'EXP00001', 'CLIENTE EXPORTACION', 'EXP00001', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(105, 'INS10001', 'CLIENTE INSTITUCIONAL UNISUPER', 'INS10001', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(106, 'INS10002', 'CLIENTES INSTITUCIONALES', 'INS10002', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(107, 'INS10003', 'CLIENTE INST. DOLLARCITY', 'INS10003', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(108, 'LG100001', 'BODEGA', 'LG100001', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(109, 'LG100002', 'TALLER', 'LG100002', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(110, 'LG100003', 'FACTURACION', 'LG100003', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(111, 'LG100004', 'DESPACHOS/PILOTOS', 'LG100004', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(112, 'MA000001', 'RUTA 1', 'MA000001', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(113, 'MA000002', 'RUTA 2', 'MA000002', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(114, 'MA000003', 'RUTA 3', 'MA000003', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(115, 'MA000004', 'RUTA 4', 'MA000004', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(116, 'MA000005', 'RUTA 5', 'MA000005', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(117, 'MA000006', 'RUTA 6', 'MA000006', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(118, 'MA000007', 'RUTA 7', 'MA000007', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(119, 'MA000008', 'RUTA 8', 'MA000008', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(120, 'MA000009', 'RUTA 9', 'MA000009', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(121, 'MA000010', 'RUTA 10', 'MA000010', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(122, 'MA000011', 'RUTA 11', 'MA000011', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(123, 'MA000012', 'RUTA 12', 'MA000012', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(124, 'MA000013', 'RUTA 13', 'MA000013', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(125, 'MA000014', 'RUTA 14', 'MA000014', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(126, 'MA000015', 'RUTA 15', 'MA000015', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(127, 'MA100001', 'ADMINISTRACION - MA', 'MA100001', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(128, 'MA100002', 'SUPERVISOR MA', 'MA100002', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(129, 'OIG00001', 'OTROS INGRESOS', 'OIG00001', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(130, 'OIG00002', 'OTROS GASTOS', 'OIG00002', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(131, 'PLA00001', 'PLACAS', 'PLA00001', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(132, 'PUB00001', 'MEDIOS', 'PUB00001', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(133, 'PUB00002', 'TIENDAS TOD', 'PUB00002', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(134, 'PUB00003', 'MERCADO ABIERTO', 'PUB00003', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(135, 'PUB00004', 'TIENDAS TOC', 'PUB00004', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(136, 'PUB00005', 'INSTITUCIONALES', 'PUB00005', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20'),
(137, 'TOC00001', 'CLIENTE CONCESIONARIO', 'TOC00001', '', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-08 15:28:20', '2024-11-08 15:28:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costos4`
--

CREATE TABLE `costos4` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nombre2` varchar(255) DEFAULT NULL,
  `nombre3` varchar(255) DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `costos4`
--

INSERT INTO `costos4` (`id`, `codigo`, `nombre`, `nombre2`, `nombre3`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 'MOT99999', 'SIN PLACA', NULL, NULL, NULL, NULL, '', '2024-11-12 05:33:41', '2024-11-12 05:33:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentasbancos`
--

CREATE TABLE `cuentasbancos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `tipoCuenta` enum('MONETARIA','AHORRO') NOT NULL,
  `bancos_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuentasbancos`
--

INSERT INTO `cuentasbancos` (`id`, `codigo`, `nombre`, `tipoCuenta`, `bancos_id`, `created_at`, `updated_at`) VALUES
(1, '45487899', 'JUAN CARLOS VARGAS', 'MONETARIA', 1, '2024-10-09 22:09:07', '2024-10-09 22:09:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `codigo`, `nombre`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, '1', 'GUATEMALA', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(2, '2', 'EL PROGRESO', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(3, '3', 'SACATEPÉQUEZ', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(4, '4', 'CHIMALTENANGO', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(5, '5', 'ESCUINTLA', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(6, '6', 'SANTA ROSA', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(7, '7', 'SOLOLÁ', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(8, '8', 'TOTONICAPÁN', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(9, '9', 'QUETZALTENANGO', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(10, '10', 'SUCHITEPÉQUEZ', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(11, '11', 'RETALHULEU', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(12, '12', 'SAN MARCOS', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(13, '13', 'HUEHUETENANGO', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(14, '14', 'QUICHÉ', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(15, '15', 'BAJA VERAPAZ', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(16, '16', 'ALTA VERAPAZ', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(17, '17', 'PETÉN', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(18, '18', 'IZABAL', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(19, '19', 'ZACAPA', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(20, '20', 'CHIQUIMULA', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(21, '21', 'JALAPA', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28'),
(22, '22', 'JUTIAPA', NULL, NULL, NULL, '2024-11-08 15:45:28', '2024-11-08 15:45:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descansos`
--

CREATE TABLE `descansos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `tipoDescanso_id` bigint(20) UNSIGNED NOT NULL,
  `periodo` varchar(100) NOT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  `tipo` enum('GENERADAS','GOZADAS') NOT NULL,
  `cantidadDias` int(11) NOT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos`
--

CREATE TABLE `descuentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `periodos_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipoDescuento_id` bigint(20) UNSIGNED NOT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `totalDescuento` decimal(10,2) NOT NULL,
  `cantidadAbonos` int(11) DEFAULT NULL,
  `cuotaQuincenal` decimal(10,2) NOT NULL,
  `documentoDescuento` varchar(100) NOT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discapacidades`
--

CREATE TABLE `discapacidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `discapacidades`
--

INSERT INTO `discapacidades` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'NINGUNA', '2024-10-10 02:05:26', '2024-10-10 02:05:26'),
(2, '2', 'DISCAPACIDAD AUDITIVA', '2024-10-10 02:05:41', '2024-10-10 02:05:41'),
(3, '3', 'DISCAPACIDAD VISUAL', '2024-10-10 02:05:57', '2024-10-10 02:05:57'),
(4, '4', 'DISCAPACIDAD MULTIPLE', '2024-10-10 02:06:10', '2024-10-10 02:06:10'),
(5, '5', 'DISCAPACIDAD FISICA O MOTORA', '2024-10-10 02:06:23', '2024-10-10 02:06:23'),
(6, '6', 'DISCAPACIDAD INTELECTUAL', '2024-10-10 02:06:37', '2024-10-10 02:06:37'),
(7, '7', 'OTRA', '2024-10-10 02:06:50', '2024-10-10 02:06:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `duracioncontratos`
--

CREATE TABLE `duracioncontratos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `duracioncontratos`
--

INSERT INTO `duracioncontratos` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'DEFINIDO', '2024-10-09 22:15:30', '2024-10-09 22:15:30'),
(2, '2', 'IDEFINIDO', '2024-10-09 22:15:41', '2024-10-09 22:15:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigoEmpleado` varchar(20) NOT NULL,
  `secuencias_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre1` varchar(75) DEFAULT NULL,
  `nombre2` varchar(75) DEFAULT NULL,
  `nombre3` varchar(75) DEFAULT NULL,
  `apellido1` varchar(75) DEFAULT NULL,
  `apellido2` varchar(75) DEFAULT NULL,
  `apellidoCasada` varchar(75) DEFAULT NULL,
  `correo` varchar(75) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `cantidadHijos` int(11) DEFAULT NULL,
  `cantidadVivenCasa` int(11) DEFAULT NULL,
  `fechaRetiro` date DEFAULT NULL,
  `aPrueba` varchar(10) DEFAULT NULL,
  `estadosEmpleado_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estadosNomina_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jefes_id` bigint(20) UNSIGNED DEFAULT NULL,
  `puestos_id` bigint(20) UNSIGNED DEFAULT NULL,
  `costos1_id` bigint(20) UNSIGNED DEFAULT NULL,
  `costos2_id` bigint(20) UNSIGNED DEFAULT NULL,
  `costos3_id` bigint(20) UNSIGNED DEFAULT NULL,
  `costos4_id` bigint(20) UNSIGNED DEFAULT NULL,
  `regiones_id` bigint(20) UNSIGNED DEFAULT NULL,
  `establecimientos_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nacionalidades_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ocupaciones_id` bigint(20) UNSIGNED DEFAULT NULL,
  `idiomas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `generos_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contratos_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discapacidades_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estadoCivil_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ascendencias_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estudios_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bancos_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipoPago_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vacantes_id` bigint(20) UNSIGNED DEFAULT NULL,
  `codigoAnterior` varchar(25) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `codigoEmpleado`, `secuencias_id`, `nombre1`, `nombre2`, `nombre3`, `apellido1`, `apellido2`, `apellidoCasada`, `correo`, `fechaNacimiento`, `fechaIngreso`, `cantidadHijos`, `cantidadVivenCasa`, `fechaRetiro`, `aPrueba`, `estadosEmpleado_id`, `estadosNomina_id`, `jefes_id`, `puestos_id`, `costos1_id`, `costos2_id`, `costos3_id`, `costos4_id`, `regiones_id`, `establecimientos_id`, `nacionalidades_id`, `ocupaciones_id`, `idiomas_id`, `generos_id`, `contratos_id`, `discapacidades_id`, `estadoCivil_id`, `ascendencias_id`, `estudios_id`, `bancos_id`, `tipoPago_id`, `vacantes_id`, `codigoAnterior`, `created_at`, `updated_at`) VALUES
(81, 'A00029', 1, 'NELSON', '', '', 'MANDELA', '', '', '', '0000-00-00', '0000-00-00', 0, 0, '0000-00-00', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 547, 'C00028', '2024-11-12 05:37:53', '2024-11-14 15:30:29'),
(82, 'A00030', 1, 'INGRID', '', '', 'RIOS', '', '', NULL, '0000-00-00', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, 2, NULL, NULL, 1, NULL, 1, NULL, NULL, 547, NULL, '2024-11-12 17:17:19', '2024-11-12 17:17:19'),
(84, 'A00031', 1, 'ELENA', NULL, NULL, 'TROYANO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, 547, NULL, '2024-11-12 20:32:18', '2024-11-12 20:32:18'),
(85, 'A00032', 1, 'ARMANDO', NULL, NULL, 'CARRANZA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, 549, 'C00027', '2024-11-12 21:32:05', '2024-11-12 22:04:00'),
(86, 'A00033', 1, 'SOCRATES', NULL, NULL, 'MAGNOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, 547, 'C00026', '2024-11-12 21:39:24', '2024-11-12 21:58:14'),
(87, 'C00026', 2, 'SOCRATES', NULL, NULL, 'MAGNOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, 547, NULL, '2024-11-12 21:58:14', '2024-11-12 21:58:14'),
(88, 'C00027', 2, 'ARMANDO', NULL, NULL, 'CARRANZA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, 549, NULL, '2024-11-12 22:04:00', '2024-11-12 22:04:00'),
(89, 'C00028', 2, 'NELSON', '', '', 'MANDELA', '', '', NULL, '0000-00-00', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, 547, NULL, '2024-11-14 15:30:29', '2024-11-14 15:30:29'),
(90, 'A00034', 1, 'MARCO', NULL, NULL, 'SOLIS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 83, 1, NULL, 1, NULL, NULL, 1, NULL, 10, NULL, NULL, 552, 'C00029', '2024-11-14 18:55:08', '2024-11-14 18:55:28'),
(91, 'C00029', 2, 'MARCO', NULL, NULL, 'SOLIS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 83, 1, NULL, 1, NULL, NULL, 1, NULL, 10, NULL, NULL, 552, NULL, '2024-11-14 18:55:28', '2024-11-14 18:55:28');

--
-- Disparadores `empleados`
--
DELIMITER $$
CREATE TRIGGER `trg_before_insert_empleados` BEFORE INSERT ON `empleados` FOR EACH ROW BEGIN
    DECLARE newCodigoEmpleado VARCHAR(20);

    -- Actualizar el campo ultimousado en la tabla secuencias
    UPDATE secuencias
    SET ultimousado = ultimousado + 1
    WHERE id = NEW.secuencias_id;

    -- Obtener el valor de ultimousado actualizado y concatenarlo con la máscara
    SELECT CONCAT(mascara, LPAD(ultimousado, 5, '0'))
    INTO newCodigoEmpleado
    FROM secuencias
    WHERE id = NEW.secuencias_id;

    -- Asignar el código de empleado generado
    SET NEW.codigoEmpleado = newCodigoEmpleado;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `NIT` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `tipoContribuyente` varchar(50) DEFAULT NULL,
  `IVA` int(11) DEFAULT NULL,
  `ISR` int(11) DEFAULT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  `comentarios` text NOT NULL,
  `nombreRepresentante` varchar(150) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `nacionalidades_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estadoCivil_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estudios_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipoIdentificacion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `numeroIdentificacion` varchar(100) DEFAULT NULL,
  `extendidoEn` varchar(100) DEFAULT NULL,
  `nombreEmpresa` varchar(100) DEFAULT NULL,
  `direccionEmpresa` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimientos`
--

CREATE TABLE `establecimientos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `nombre2` varchar(75) DEFAULT NULL,
  `nombre3` varchar(75) DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `establecimientos`
--

INSERT INTO `establecimientos` (`id`, `codigo`, `nombre`, `nombre2`, `nombre3`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, '1', 'SAVONA DE GUATEMALA', NULL, NULL, NULL, NULL, '', '2024-10-09 22:34:41', '2024-10-09 22:34:41'),
(2, '2', 'TIENDAS SAN LUCAS', NULL, NULL, NULL, NULL, '', '2024-10-09 22:34:54', '2024-10-09 22:34:54'),
(3, '3', 'DISTRIBUIDORA XELA', NULL, NULL, NULL, NULL, '', '2024-10-09 22:35:08', '2024-10-09 22:35:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocivil`
--

CREATE TABLE `estadocivil` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` int(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadocivil`
--

INSERT INTO `estadocivil` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 1, 'SOLTERO', '2024-10-09 22:47:39', '2024-10-09 22:47:39'),
(2, 2, 'CASADO', '2024-10-09 22:47:50', '2024-10-09 22:47:50'),
(3, 3, 'VIUDO', '2024-10-09 22:48:02', '2024-10-09 22:48:02'),
(4, 4, 'DIVORCIADO', '2024-10-09 22:48:10', '2024-10-09 22:48:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosempleado`
--

CREATE TABLE `estadosempleado` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estadosempleado`
--

INSERT INTO `estadosempleado` (`id`, `codigo`, `nombre`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 1, 'ACTIVO', '0000-00-00', '0000-00-00', '', '2024-10-09 22:25:47', '2024-10-09 22:25:47'),
(2, 2, 'BAJA', NULL, NULL, '', '2024-10-09 22:27:24', '2024-10-09 22:27:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosestudio`
--

CREATE TABLE `estadosestudio` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosnomina`
--

CREATE TABLE `estadosnomina` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadosnomina`
--

INSERT INTO `estadosnomina` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'ABANDONO', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(2, '2', 'CUBRESUS.', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(3, '3', 'CUBREVAC.', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(4, '4', 'LACTANCIA', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(5, '5', 'SUSTITUCIÓN', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(6, '6', 'DESPIDO', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(7, '7', 'EMBARAZADA', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(8, '8', 'NUEVO INGRESO', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(9, '9', 'NUEVO INGRESO/BECA MT', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(10, '10', 'RENUNCIA', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(11, '11', 'SUS. DICIPLINARIA', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(12, '12', 'SUS. IGSS . ENF.', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(13, '13', 'SUS. IGSS. PRE Y POST', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(14, '14', 'SUS. SIN GOCE SALARIO', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(15, '15', 'SUS.IGSS ACC.', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(16, '16', 'TEMPORAL', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(17, '17', 'TERMINACION CONTRATO', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(18, '18', 'VACACIONES', '2024-11-11 20:43:56', '2024-11-11 20:43:56'),
(19, '19', 'DESPIDO NO PASO PERIODO D', '2024-11-11 20:43:56', '2024-11-11 20:43:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudios`
--

CREATE TABLE `estudios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estudios`
--

INSERT INTO `estudios` (`id`, `codigo`, `nombre`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, '1', 'NINGUNO', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21'),
(2, '2', 'PRIMARIA INCOMPLETA', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21'),
(3, '3', 'PRIMARIA COMPLETA', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21'),
(4, '4', 'BÁSICO INCOMPLETO', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21'),
(5, '5', 'BÁSICO COMPLETO', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21'),
(6, '6', 'DIVERSIFICADO INCOMPLETO', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21'),
(7, '7', 'DIVERSIFICADO COMPLETO', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21'),
(8, '8', 'ESTUDIANTE UNIVERSITARIO', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21'),
(9, '9', 'TÉCNICO UNIVERSITARIO', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21'),
(10, '10', 'LICENCIATURA', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21'),
(11, '11', 'POSTGRADO', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21'),
(12, '12', 'MAESTRÍA', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21'),
(13, '13', 'DOCTORADO', NULL, NULL, '', '2024-11-11 20:40:21', '2024-11-11 20:40:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `tipoEvaluacion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencias`
--

CREATE TABLE `experiencias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `tipoExperiencia_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familiares`
--

CREATE TABLE `familiares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `nombreFamiliar` varchar(100) NOT NULL,
  `profesion` varchar(100) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `direccion` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `tipoFamiliar_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuentecontratacion`
--

CREATE TABLE `fuentecontratacion` (
  `id` bigint(20) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fuentecontratacion`
--

INSERT INTO `fuentecontratacion` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'REDES', '2024-11-10 15:07:50', '2024-11-10 15:07:50'),
(2, '2', 'TRANSDOC', '2024-11-10 15:07:50', '2024-11-10 15:07:50'),
(3, '3', 'TECOLOCO', '2024-11-10 15:08:16', '2024-11-10 15:08:16'),
(4, '4', 'REFERIDOS', '2024-11-10 15:08:16', '2024-11-10 15:08:16'),
(5, '5', 'ANUNCIO OFICINAS/TOD', '2024-11-10 15:09:00', '2024-11-10 15:09:00'),
(6, '6', 'MINTRAB', '2024-11-10 15:09:27', '2024-11-10 15:09:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'HOMBRE', '2024-10-09 22:41:58', '2024-10-09 22:41:58'),
(2, '2', 'MUJER', '2024-10-09 22:42:12', '2024-10-09 22:42:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horasextras`
--

CREATE TABLE `horasextras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `periodos_id` bigint(20) UNSIGNED NOT NULL,
  `simples` int(11) NOT NULL,
  `dobles` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `identificaciones`
--

CREATE TABLE `identificaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `tipoIdentificacion_id` bigint(20) UNSIGNED NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `numeroIdentificacion` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`id`, `codigo`, `nombre`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, '1', 'ESPAÑOL', NULL, NULL, NULL, '2024-10-09 22:40:44', NULL),
(2, '2', 'ACHI´', NULL, NULL, NULL, '2024-10-09 22:40:59', NULL),
(3, '3', 'AKATEKA', NULL, NULL, NULL, '2024-10-09 22:41:12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incrementos`
--

CREATE TABLE `incrementos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empledos_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `fecha` date NOT NULL,
  `sueldo` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indemnizaciones`
--

CREATE TABLE `indemnizaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `indemnizacion` int(11) NOT NULL,
  `bono14` int(11) NOT NULL,
  `vacaciones` int(11) NOT NULL,
  `bonos` int(11) NOT NULL,
  `comisiones` int(11) NOT NULL,
  `horasextras` int(11) NOT NULL,
  `fechabaja` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jefes`
--

CREATE TABLE `jefes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` int(11) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `nombre2` varchar(40) NOT NULL,
  `nombre3` varchar(40) DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `jefes`
--

INSERT INTO `jefes` (`id`, `codigo`, `nombre`, `nombre2`, `nombre3`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 1, 'ALEJANDRA MOLLINEDO', 'LIGIA COJULUN', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(2, 2, 'ALEJANDRO TOC', 'RENE SARAZUA', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(3, 3, 'ANGELICA HERNANDEZ', 'CESAR BLANCO', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(4, 4, 'ANIBAL GODINEZ', 'CARLOS CUSCUL', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(5, 5, 'BYRON PAIZ', 'DORA CHUJ', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(6, 6, 'BYRON SOSA', 'DORA CHUJ', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(7, 7, 'CARLOS RAMAZZINI', 'RENE SARAZUA', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(8, 8, 'CRUZ MUX', 'DORA CHUJ', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(9, 9, 'EDGAR GONZALEZ', 'CARLOS CUSCUL', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(10, 10, 'ELMER RUIZ', 'WALTER NAJERA', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(11, 11, 'GERSON LOPEZ', 'ESTUARDO COY', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(12, 12, 'GRACIELA PEREZ', 'WALTER NAJERA', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(13, 13, 'HEIDI VALDEZ', 'LIGIA COJULUN', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(14, 14, 'HUMBERTO TOC', 'DORA CHUJ', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(15, 15, 'IRMA MURGA', 'LIGIA COJULUN', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(16, 16, 'JOE CHAVEZ', 'DORA CHUJ', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(17, 17, 'JOSE MIGUEL GUERRA', 'DORA CHUJ', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(18, 18, 'KATHERINE SAMAYOA', 'LIGIA COJULUN', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(19, 19, 'LIQUIDACIONES', 'CARLOS CUSCUL', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(20, 20, 'MARTA AGUILAR', 'LIGIA COJULUN', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(21, 21, 'MARVIN LOPEZ', 'ESTUARDO COY', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(22, 22, 'ROLANDO CHALULEU', 'RENE SARAZUA', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(23, 23, 'SELVIN SOLARES', 'ELDER IXCOPAL', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(24, 24, 'SERGIO BARRIOS', 'DORA CHUJ', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(25, 25, 'SILVIA OVALLE', 'LIGIA COJULUN', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(26, 26, 'VICTOR CANCHAN', 'WALTER NAJERA', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(27, 27, 'WILLIAMS AJCIP', 'ESTUARDO COY', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:26:34', '2024-11-08 16:26:34'),
(28, 28, 'LIGIA COJULUN', 'LURDES', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:31:09', '2024-11-08 16:31:09'),
(29, 29, 'RENE SARAZUA', 'LURDES', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:31:09', '2024-11-08 16:31:09'),
(30, 30, 'CESAR BLANCO', 'LURDES', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:31:09', '2024-11-08 16:31:09'),
(31, 31, 'CARLOS CUSCUL', 'LURDES', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:31:09', '2024-11-08 16:31:09'),
(32, 32, 'DORA CHUJ', 'LURDES', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:31:09', '2024-11-08 16:31:09'),
(33, 33, 'WALTER NAJERA', 'LURDES', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:31:09', '2024-11-08 16:31:09'),
(34, 34, 'ESTUARDO COY', 'LURDES', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:31:09', '2024-11-08 16:31:09'),
(35, 35, 'ELDER IXCOPAL', 'LURDES', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:31:09', '2024-11-08 16:31:09'),
(36, 36, 'LURDES', 'LURDES', 'LURDES', NULL, NULL, NULL, '2024-11-08 16:31:09', '2024-11-08 16:31:09'),
(37, 37, 'GABRIELA ALVAREZ', 'LURDES TOBIAS', 'LURDES TOBIAS', NULL, NULL, NULL, '2024-11-08 18:35:48', '2024-11-08 18:35:48'),
(38, 38, 'JORGE AYALA', 'LURDES TOBIAS', 'LURDES TOBIAS', NULL, NULL, NULL, '2024-11-08 18:37:33', '2024-11-08 18:37:33'),
(39, 39, 'MICHAEL ORTIZ', 'LIGIA COJULUM', 'LURDES TOBIAS', NULL, NULL, NULL, '2024-11-08 18:38:13', '2024-11-08 18:38:13'),
(40, 40, 'WENDY ESTRADA', 'LIGIA COJULUM', 'LURDES TOBIAS', NULL, NULL, NULL, '2024-11-08 18:38:41', '2024-11-08 18:38:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE `jornadas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `jornadas`
--

INSERT INTO `jornadas` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'DIURNA', '2024-10-09 22:16:18', '2024-10-09 22:16:18'),
(2, '2', 'MIXTA', '2024-10-09 22:16:26', '2024-10-09 22:16:26'),
(3, '3', 'NOCTURNA', '2024-10-09 22:16:35', '2024-10-09 22:16:35'),
(4, '4', 'NO ESTÁ SUJETO A JORNADA', '2024-10-09 22:16:49', '2024-10-09 22:16:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornalizaciones`
--

CREATE TABLE `jornalizaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `periodos_id` bigint(20) UNSIGNED NOT NULL,
  `costos1_id` bigint(20) UNSIGNED NOT NULL,
  `costos2_id` bigint(20) UNSIGNED NOT NULL,
  `costos3_id` bigint(20) UNSIGNED NOT NULL,
  `costos4_id` bigint(20) UNSIGNED NOT NULL,
  `cuentaContable` varchar(75) NOT NULL,
  `debe` decimal(10,2) NOT NULL,
  `haber` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivoretiro`
--

CREATE TABLE `motivoretiro` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `departamentos_id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id`, `departamentos_id`, `codigo`, `nombre`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 1, '101', 'GUATEMALA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(2, 1, '102', 'SANTA CATARINA PINULA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(3, 1, '103', 'SAN JOSÉ PINULA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(4, 1, '104', 'SAN JOSÉ DEL GOLFO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(5, 1, '105', 'PALENCIA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(6, 1, '106', 'CHINAUTLA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(7, 1, '107', 'SAN PEDRO AYAMPUC', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(8, 1, '108', 'MIXCO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(9, 1, '109', 'SAN PEDRO SACATEPÉQUEZ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(10, 1, '110', 'SAN JUAN SACATEPÉQUEZ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(11, 1, '111', 'SAN RAYMUNDO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(12, 1, '112', 'CHUARRANCHO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(13, 1, '113', 'FRAIJANES', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(14, 1, '114', 'AMATITLÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(15, 1, '115', 'VILLA NUEVA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(16, 1, '116', 'VILLA CANALES', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(17, 1, '117', 'PETAPA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(18, 2, '201', 'GUASTATOYA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(19, 2, '202', 'MORAZÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(20, 2, '203', 'SAN AGUSTÍN ACASAGUASTLÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(21, 2, '204', 'SAN CRISTÓBAL ACASAGUASTLÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(22, 2, '205', 'EL JÍCARO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(23, 2, '206', 'SANSARE', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(24, 2, '207', 'SANARATE', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(25, 2, '208', 'SAN ANTONIO LA PAZ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(26, 3, '301', 'ANTIGUA GUATEMALA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(27, 3, '302', 'JOCOTENANGO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(28, 3, '303', 'PASTORES', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(29, 3, '304', 'SUMPANGO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(30, 3, '305', 'SANTO DOMINGO XENACOJ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(31, 3, '306', 'SANTIAGO SACATEPÉQUEZ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(32, 3, '307', 'SAN BARTOLOMÉ MILPAS ALTAS', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(33, 3, '308', 'SAN LUCAS SACATEPÉQUEZ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(34, 3, '309', 'SANTA LUCÍA MILPAS ALTAS', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(35, 3, '310', 'MAGDALENA MILPAS ALTAS', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(36, 3, '311', 'SANTA MARÍA DE JESÚS', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(37, 3, '312', 'CIUDAD VIEJA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(38, 3, '313', 'SAN MIGUEL DUEÑAS', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(39, 3, '314', 'SAN JUAN ALOTENANGO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(40, 3, '315', 'SAN ANTONIO AGUAS CALIENTES', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(41, 3, '316', 'SANTA CATARINA BARAHONA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(42, 4, '401', 'CHIMALTENANGO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(43, 4, '402', 'SAN JOSÉ POAQUIL', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(44, 4, '403', 'SAN MARTÍN JILOTEPEQUE', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(45, 4, '404', 'COMALAPA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(46, 4, '405', 'SANTA APOLONIA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(47, 4, '406', 'TECPÁN GUATEMALA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(48, 4, '407', 'PATZÚN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(49, 4, '408', 'SAN MIGUEL POCHUTA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(50, 4, '409', 'PATZICÍA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(51, 4, '410', 'SANTA CRUZ BALANYÁ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(52, 4, '411', 'ACATENANGO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(53, 4, '412', 'SAN PEDRO YEPOCAPA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(54, 4, '413', 'SAN ANDRÉS ITZAPA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(55, 4, '414', 'PARRAMOS', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(56, 4, '415', 'ZARAGOZA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(57, 4, '416', 'EL TEJAR', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(58, 5, '501', 'ESCUINTLA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(59, 5, '502', 'SANTA LUCÍA COTZUMALGUAPA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(60, 5, '503', 'LA DEMOCRACIA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(61, 5, '504', 'SIQUINALÁ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(62, 5, '505', 'MASAGUA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(63, 5, '506', 'TIQUISATE', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(64, 5, '507', 'LA GOMERA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(65, 5, '508', 'GUANAGAZAPA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(66, 5, '509', 'SAN JOSÉ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(67, 5, '510', 'IZTAPA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(68, 5, '511', 'PALÍN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(69, 5, '512', 'SAN VICENTE PACAYA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(70, 5, '513', 'NUEVA CONCEPCIÓN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(71, 5, '514', 'SIPACATE', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(72, 6, '601', 'CUILAPA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(73, 6, '602', 'BARBERENA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(74, 6, '603', 'SANTA ROSA DE LIMA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(75, 6, '604', 'CASILLAS', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(76, 6, '605', 'SAN RAFAEL LAS FLORES', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(77, 6, '606', 'ORATORIO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(78, 6, '607', 'SAN JUAN TECUACO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(79, 6, '608', 'CHIQUIMULILLA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(80, 6, '609', 'TAXISCO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(81, 6, '610', 'SANTA MARÍA IXHUATÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(82, 6, '611', 'GUAZACAPÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(83, 6, '612', 'SANTA CRUZ NARANJO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(84, 6, '613', 'PUEBLO NUEVO VIÑAS', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(85, 6, '614', 'NUEVA SANTA ROSA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(86, 7, '701', 'SOLOLÁ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(87, 7, '702', 'SAN JOSÉ CHACAYÁ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(88, 7, '703', 'SANTA MARÍA VISITACIÓN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(89, 7, '704', 'SANTA LUCÍA UTATLÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(90, 7, '705', 'NAHUALÁ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(91, 7, '706', 'SANTA CATARINA IXTAHUACÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(92, 7, '707', 'SANTA CLARA LA LAGUNA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(93, 7, '708', 'CONCEPCIÓN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(94, 7, '709', 'SAN ANDRÉS SEMETABAJ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(95, 7, '710', 'PANAJACHEL', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(96, 7, '711', 'SANTA CATARINA PALOPÓ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(97, 7, '712', 'SAN ANTONIO PALOPÓ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(98, 7, '713', 'SAN LUCAS TOLIMÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(99, 7, '714', 'SANTA CRUZ LA LAGUNA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(100, 7, '715', 'SAN PABLO LA LAGUNA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(101, 7, '716', 'SAN MARCOS LA LAGUNA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(102, 7, '717', 'SAN JUAN LA LAGUNA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(103, 7, '718', 'SAN PEDRO LA LAGUNA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(104, 7, '719', 'SANTIAGO ATITLÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(105, 8, '801', 'TOTONICAPÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(106, 8, '802', 'SAN CRISTÓBAL TOTONICAPÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(107, 8, '803', 'SAN FRANCISCO EL ALTO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(108, 8, '804', 'SAN ANDRÉS XECUL', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(109, 8, '805', 'MOMOSTENANGO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(110, 8, '806', 'SANTA MARÍA CHIQUIMULA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(111, 8, '807', 'SANTA LUCÍA LA REFORMA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(112, 8, '808', 'SAN BARTOLO AGUAS CALIENTES', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(113, 9, '901', 'QUETZALTENANGO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(114, 9, '902', 'SALCAJÁ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(115, 9, '903', 'SAN JUAN OLINTEPEQUE', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(116, 9, '904', 'SAN CARLOS SIJA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(117, 9, '905', 'SIBILIA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(118, 9, '906', 'CABRICÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(119, 9, '907', 'CAJOLÁ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(120, 9, '908', 'SAN MIGUEL SIGUILÁ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(121, 9, '909', 'SAN JUAN OSTUNCALCO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(122, 9, '910', 'SAN MATEO', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(123, 9, '911', 'CONCEPCIÓN CHIQUIRICHAPA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(124, 9, '912', 'SAN MARTÍN SACATEPÉQUEZ', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(125, 9, '913', 'ALMOLONGA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(126, 9, '914', 'CANTEL', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(127, 9, '915', 'HUITÁN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(128, 9, '916', 'ZUNIL', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(129, 9, '917', 'COLOMBA COSTA CUCA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(130, 9, '918', 'SAN FRANCISCO LA UNIÓN', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(131, 9, '919', 'EL PALMAR', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(132, 9, '920', 'COATEPEQUE', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(133, 9, '921', 'GÉNOVA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(134, 9, '922', 'FLORES COSTA CUCA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(135, 9, '923', 'LA ESPERANZA', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(136, 9, '924', 'PALESTINA DE LOS ALTOS', NULL, NULL, '', '2024-11-08 15:54:28', '2024-11-08 15:54:28'),
(137, 10, '1001', 'MAZATENANGO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(138, 10, '1002', 'CUYOTENANGO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(139, 10, '1003', 'SAN FRANCISCO ZAPOTITLÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(140, 10, '1004', 'SAN BERNARDINO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(141, 10, '1005', 'SAN JOSÉ EL ÍDOLO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(142, 10, '1006', 'SANTO DOMINGO SUCHITEPÉQUEZ', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(143, 10, '1007', 'SAN LORENZO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(144, 10, '1008', 'SAMAYAC', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(145, 10, '1009', 'SAN PABLO JOCOPILAS', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(146, 10, '1010', 'SAN ANTONIO SUCHITEPÉQUEZ', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(147, 10, '1011', 'SAN MIGUEL PANÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(148, 10, '1012', 'SAN GABRIEL', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(149, 10, '1013', 'CHICACAO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(150, 10, '1014', 'PATULUL', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(151, 10, '1015', 'SANTA BÁRBARA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(152, 10, '1016', 'SAN JUAN BAUTISTA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(153, 10, '1017', 'SANTO TOMAS LA UNIÓN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(154, 10, '1018', 'ZUNILITO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(155, 10, '1019', 'PUEBLO NUEVO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(156, 10, '1020', 'RÍO BRAVO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(157, 10, '1021', 'SAN JOSÉ LA MÁQUINA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(158, 11, '1101', 'RETALHULEU', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(159, 11, '1102', 'SAN SEBASTIÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(160, 11, '1103', 'SANTA CRUZ MULUÁ', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(161, 11, '1104', 'SAN MARTÍN ZAPOTITLÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(162, 11, '1105', 'SAN FELIPE', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(163, 11, '1106', 'SAN ANDRÉS VILLA SECA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(164, 11, '1107', 'CHAMPERICO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(165, 11, '1108', 'NUEVO SAN CARLOS', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(166, 11, '1109', 'EL ASINTAL', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(167, 12, '1201', 'SAN MARCOS', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(168, 12, '1202', 'SAN PEDRO SACATEPÉQUEZ', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(169, 12, '1203', 'SAN ANTONIO SACATEPÉQUEZ', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(170, 12, '1204', 'COMITANCILLO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(171, 12, '1205', 'SAN MIGUEL IXTAHUACÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(172, 12, '1206', 'CONCEPCIÓN TUTUAPA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(173, 12, '1207', 'TACANÁ', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(174, 12, '1208', 'SIBINAL', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(175, 12, '1209', 'TAJUMULCO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(176, 12, '1210', 'TEJUTLA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(177, 12, '1211', 'SAN RAFAEL PIE DE LA CUESTA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(178, 12, '1212', 'NUEVO PROGRESO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(179, 12, '1213', 'EL TUMBADOR', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(180, 12, '1214', 'SAN JOSÉ EL RODEO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(181, 12, '1215', 'MALACATÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(182, 12, '1216', 'CATARINA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(183, 12, '1217', 'AYUTLA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(184, 12, '1218', 'OCÓS', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(185, 12, '1219', 'SAN PABLO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(186, 12, '1220', 'EL QUETZAL', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(187, 12, '1221', 'LA REFORMA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(188, 12, '1222', 'PAJAPITA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(189, 12, '1223', 'IXCHIGUÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(190, 12, '1224', 'SAN JOSÉ OJETENAM', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(191, 12, '1225', 'SAN CRISTÓBAL CUCHO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(192, 12, '1226', 'SIPACAPA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(193, 12, '1227', 'ESQUIPULAS PALO GORDO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(194, 12, '1228', 'RÍO BLANCO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(195, 12, '1229', 'SAN LORENZO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(196, 12, '1230', 'LA BLANCA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(197, 13, '1301', 'HUEHUETENANGO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(198, 13, '1302', 'CHIANTLA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(199, 13, '1303', 'MALACATANCITO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(200, 13, '1304', 'CUILCO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(201, 13, '1305', 'NENTÓN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(202, 13, '1306', 'SAN PEDRO NECTA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(203, 13, '1307', 'JACALTENANGO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(204, 13, '1308', 'SAN PEDRO SOLOMA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(205, 13, '1309', 'SAN ILDEFONSO IXTAHUACÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(206, 13, '1310', 'SANTA BÁRBARA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(207, 13, '1311', 'LA LIBERTAD', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(208, 13, '1312', 'LA DEMOCRACIA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(209, 13, '1313', 'SAN MIGUEL ACATÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(210, 13, '1314', 'SAN RAFAEL LA INDEPENDENCIA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(211, 13, '1315', 'TODOS SANTOS CUCHUMATÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(212, 13, '1316', 'SAN JUAN ATITÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(213, 13, '1317', 'SANTA EULALIA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(214, 13, '1318', 'SAN MATEO IXTATÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(215, 13, '1319', 'COLOTENANGO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(216, 13, '1320', 'SAN SEBASTIÁN HUEHUETENANGO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(217, 13, '1321', 'TECTITÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(218, 13, '1322', 'CONCEPCIÓN HUISTA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(219, 13, '1323', 'SAN JUAN IXCOY', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(220, 13, '1324', 'SAN ANTONIO HUISTA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(221, 13, '1325', 'SAN SEBASTIÁN COATÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(222, 13, '1326', 'SANTA CRUZ BARRILLAS', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(223, 13, '1327', 'AGUACATÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(224, 13, '1328', 'SAN RAFAEL PETZAL', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(225, 13, '1329', 'SAN GASPAR IXCHIL', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(226, 13, '1330', 'SANTIAGO CHIMALTENANGO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(227, 13, '1331', 'SANTA ANA HUISTA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(228, 13, '1332', 'UNIÓN CANTINIL', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(229, 13, '1333', 'PETATÁN', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(230, 14, '1401', 'SANTA CRUZ DEL QUICHÉ', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(231, 14, '1402', 'CHICHÉ', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(232, 14, '1403', 'CHINIQUE', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(233, 14, '1404', 'ZACUALPA', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(234, 14, '1405', 'CHAJUL', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(235, 14, '1406', 'SANTO TOMÁSCHICHICASTENANGO', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(236, 14, '1407', 'PATZITÉ', NULL, NULL, '', '2024-11-08 15:57:10', '2024-11-08 15:57:10'),
(237, 14, '1408', 'SAN ANTONIO ILOTENANGO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(238, 14, '1409', 'SAN PEDRO JOCOPILAS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(239, 14, '1410', 'CUNÉN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(240, 14, '1411', 'SAN JUAN COTZAL', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(241, 14, '1412', 'JOYABAJ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(242, 14, '1413', 'SANTA MARÍA NEBAJ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(243, 14, '1414', 'SAN ANDRÉS SAJCABAJÁ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(244, 14, '1415', 'SAN MIGUEL USPANTÁN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(245, 14, '1416', 'SACAPULAS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(246, 14, '1417', 'SAN BARTOLOMÉ JOCOTENANGO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(247, 14, '1418', 'CANILLÁ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(248, 14, '1419', 'CHICAMÁN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(249, 14, '1420', 'IXCÁN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(250, 14, '1421', 'PACHALUM', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(251, 15, '1501', 'SALAMÁ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(252, 15, '1502', 'SAN MIGUEL CHICAJ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(253, 15, '1503', 'RABINAL', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(254, 15, '1504', 'CUBULCO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(255, 15, '1505', 'GRANADOS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(256, 15, '1506', 'EL CHOL', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(257, 15, '1507', 'SAN JERÓNIMO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(258, 15, '1508', 'PURULHÁ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(259, 16, '1601', 'COBÁN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(260, 16, '1602', 'SANTA CRUZ VERAPAZ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(261, 16, '1603', 'SAN CRISTÓBAL VERAPAZ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(262, 16, '1604', 'TACTIC', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(263, 16, '1605', 'TAMAHÚ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(264, 16, '1606', 'TUCURÚ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(265, 16, '1607', 'PANZÓS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(266, 16, '1608', 'SENAHÚ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(267, 16, '1609', 'SAN PEDRO CARCHÁ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(268, 16, '1610', 'SAN JUAN CHAMELCO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(269, 16, '1611', 'SAN AGUSTÍN LANQUÍN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(270, 16, '1612', 'SANTA MARÍA CAHABÓN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(271, 16, '1613', 'CHISEC', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(272, 16, '1614', 'CHAHAL', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(273, 16, '1615', 'FRAY BARTOLOMÉ DE LAS CASAS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(274, 16, '1616', 'SANTA CATARINA LA TINTA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(275, 16, '1617', 'RAXRUHÁ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(276, 17, '1701', 'FLORES', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(277, 17, '1702', 'SAN JOSÉ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(278, 17, '1703', 'SAN BENITO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(279, 17, '1704', 'SAN ANDRÉS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(280, 17, '1705', 'LA LIBERTAD', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(281, 17, '1706', 'SAN FRANCISCO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(282, 17, '1707', 'SANTA ANA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(283, 17, '1708', 'DOLORES', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(284, 17, '1709', 'SAN LUIS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(285, 17, '1710', 'SAYAXCHÉ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(286, 17, '1711', 'MELCHOR DE MENCOS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(287, 17, '1712', 'POPTÚN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(288, 17, '1713', 'LAS CRUCES', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(289, 17, '1714', 'EL CHAL', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(290, 18, '1801', 'PUERTO BARRIOS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(291, 18, '1802', 'LIVINGSTON', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(292, 18, '1803', 'EL ESTOR', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(293, 18, '1804', 'MORALES', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(294, 18, '1805', 'LOS AMATES', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(295, 19, '1901', 'ZACAPA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(296, 19, '1902', 'ESTANZUELA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(297, 19, '1903', 'RÍO HONDO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(298, 19, '1904', 'GUALÁN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(299, 19, '1905', 'TECULUTÁN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(300, 19, '1906', 'USUMATLÁN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(301, 19, '1907', 'CABAÑAS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(302, 19, '1908', 'SAN DIEGO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(303, 19, '1909', 'LA UNIÓN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(304, 19, '1910', 'HUITÉ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(305, 19, '1911', 'SAN JORGE', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(306, 20, '2001', 'CHIQUIMULA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(307, 20, '2002', 'SAN JOSÉ LA ARADA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(308, 20, '2003', 'SAN JUAN ERMITA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(309, 20, '2004', 'JOCOTÁN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(310, 20, '2005', 'CAMOTÁN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(311, 20, '2006', 'OLOPA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(312, 20, '2007', 'ESQUIPULAS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(313, 20, '2008', 'CONCEPCIÓN LAS MINAS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(314, 20, '2009', 'QUEZALTEPEQUE', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(315, 20, '2010', 'SAN JACINTO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(316, 20, '2011', 'IPALA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(317, 21, '2101', 'JALAPA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(318, 21, '2102', 'SAN PEDRO PINULA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(319, 21, '2103', 'SAN LUIS JILOTEPEQUE', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(320, 21, '2104', 'SAN MANUEL CHAPARRÓN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(321, 21, '2105', 'SAN CARLOS ALZATATE', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(322, 21, '2106', 'MONJAS', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(323, 21, '2107', 'MATAQUESCUINTLA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(324, 22, '2201', 'JUTIAPA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(325, 22, '2202', 'EL PROGRESO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(326, 22, '2203', 'SANTA CATARINA MITA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(327, 22, '2204', 'AGUA BLANCA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(328, 22, '2205', 'ASUNCIÓN MITA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(329, 22, '2206', 'YUPILTEPEQUE', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(330, 22, '2207', 'ATESCATEMPA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(331, 22, '2208', 'JEREZ', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(332, 22, '2209', 'EL ADELANTO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(333, 22, '2210', 'ZAPOTITLÁN', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(334, 22, '2211', 'COMAPA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(335, 22, '2212', 'JALPATAGUA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(336, 22, '2213', 'CONGUACO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(337, 22, '2214', 'MOYUTA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(338, 22, '2215', 'PASACO', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(339, 22, '2216', 'SAN JOSÉ ACATEMPA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19'),
(340, 22, '2217', 'QUESADA', NULL, NULL, '', '2024-11-08 15:59:19', '2024-11-08 15:59:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidades`
--

CREATE TABLE `nacionalidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `pais` varchar(75) NOT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nacionalidades`
--

INSERT INTO `nacionalidades` (`id`, `codigo`, `nombre`, `pais`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 'AFG', 'AFGANA', 'AFGHANISTAN', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(2, 'ALB', 'ALBANESA', 'ALBANIA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(3, 'DEU', 'ALEMANA', 'ALEMANIA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(4, 'DZA', 'ALGERIANA', 'ALGERIA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(5, 'AND', 'ANDORRANA', 'ANDORRA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(6, 'AGO', 'ANGOLA', 'ANGOLA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(7, 'AIA', 'ANGUILLA', 'ANGUILLA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(8, 'ATA', 'ANTARTICA', 'ANTARTICA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(9, 'ATG', 'ANTIGUA Y BARBUDA', 'ANTIGUA Y BARBUDA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(10, 'ANT', 'HOLANDESA', 'ANTILLAS HOLANDESAS', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(11, 'SAU', 'SAUDI', 'ARABIA SAUDITA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(12, 'ARG', 'ARGENTINA', 'ARGENTINA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(13, 'ARM', 'ARMENIA', 'ARMENIA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(14, 'ABW', 'HOLANDESA', 'ARUBA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(15, 'AUS', 'AUSTRALIANA', 'AUSTRALIA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(16, 'AUT', 'AUSTRIACA', 'AUSTRIA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(17, 'AZE', 'AZERBAIJAN', 'AZERBAIJAN', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(18, 'BHS', 'BAHAMESA', 'BAHAMAS', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(19, 'BHR', 'BAHRAIN', 'BAHRAIN', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(20, 'BGD', 'BANGLADESH', 'BANGLADESH', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(21, 'BRB', 'BARBADENSE', 'BARBADOS', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(22, 'BLR', 'BIELORRUSA', 'BELARUS', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(23, 'BEL', 'BELGA', 'BELGICA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(24, 'BLZ', 'BELICEÑA', 'BELICE', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(25, 'BEN', 'BENIN', 'BENIN', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(26, 'BMU', 'BERMUDESA', 'BERMUDA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(27, 'MMR', 'BIRMANA', 'BIRMANIA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(28, 'BOL', 'BOLIVIANA', 'BOLIVIA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(29, 'BIH', 'BOSNIA AND HERZEGOVINA', 'BOSNIA AND HERZEGOVINA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(30, 'BWA', 'BOTSWANA', 'BOTSWANA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(31, 'BVT', 'BOUVET ISLAND', 'BOUVET ISLAND', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(32, 'BRA', 'BRASILEÑA', 'BRASIL', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(33, 'BRN', 'BRUNEI', 'BRUNEI', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(34, 'BGR', 'BULGARA', 'BULGARIA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(35, 'BFA', 'BURKINA FASO', 'BURKINA FASO', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(36, 'BDI', 'BURUNDI', 'BURUNDI', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(37, 'BTN', 'BUTANA', 'BUTAN', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(38, 'CPV', 'CABOVERDIANA', 'CABO VERDE', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(39, 'KHM', 'CAMBOYANA', 'CAMBOYA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(40, 'CMR', 'CAMERUNES', 'CAMERUN', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(41, 'CAN', 'CANADIENSE', 'CANADA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(42, 'QAT', 'CATARI', 'CATAR', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(43, 'TCD', 'CHADIANA', 'CHAD', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(44, 'CHL', 'CHILENA', 'CHILE', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(45, 'CHN', 'CHINA', 'CHINA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(46, 'TWN', 'CHINA/TAIWAN', 'CHINA/TAIWAN', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(47, 'CYP', 'CHIPRIOTA', 'CHIPRE', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(48, 'VAT', 'VATICANA', 'CIUDAD DEL VATICANO', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(49, 'COL', 'COLOMBIANA', 'COLOMBIA', NULL, NULL, '', '2024-11-11 21:22:49', '2024-11-11 21:22:49'),
(50, 'COM', 'FRANCESA', 'COMOROS', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(51, 'COG', 'CONGOLESA', 'CONGO', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(52, 'PRK', 'COREANA', 'COREA DEL SUR', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(53, 'CIV', 'MARFILEÑA', 'COSTA DE MARFIL', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(54, 'CRI', 'COSTARRICENSE', 'COSTA RICA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(55, 'HRV', 'CROATA', 'CROACIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(56, 'CUB', 'CUBANA', 'CUBA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(57, 'DNK', 'DANESA', 'DINAMARCA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(58, 'DMA', 'DOMINIQUES', 'DOMINICA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(59, 'ECU', 'ECUATORIANA', 'ECUADOR', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(60, 'EGY', 'EGIPCIA', 'EGIPTO', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(61, 'ARE', 'EMIRATENSE', 'EMIRATOS ARABES UNIDOS', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(62, 'ERI', 'ERITREA', 'ERITREA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(63, 'SCT', 'ESCOCESA', 'ESCOCIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(64, 'SVK', 'ESLOVACA', 'ESLOVAQUIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(65, 'SVN', 'ESLOVENA', 'ESLOVENIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(66, 'ESP', 'ESPAÑOLA', 'ESPAÑA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(67, 'USA', 'ESTADOUNIDENSE', 'ESTADOS UNIDOS', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(68, 'EST', 'ESTONIA', 'ESTONIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(69, 'ETH', 'ETIOPE', 'ETIOPIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(70, 'PHL', 'FILIPINA', 'FILIPINAS', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(71, 'FIN', 'FINLANDESA', 'FINLANDIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(72, 'FRA', 'FRANCESA', 'FRANCIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(73, 'GAB', 'GABONA', 'GABON', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(74, 'GMB', 'GAMBIANA', 'GAMBIANA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(75, 'GEO', 'GEORGIANA', 'GEORGIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(76, 'GHA', 'GHANESA', 'GHANA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(77, 'GIB', 'GIBRALTAREÑA', 'GIBRALTAR', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(78, 'GRD', 'GRANADEÑA', 'GRANADA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(79, 'GRC', 'GRIEGA', 'GRECIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(80, 'GRL', 'GROENLANDESA', 'GROENLANDIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(81, 'GLP', 'FRANCESA', 'GUADELOUPE', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(82, 'GUM', 'GUAMESA', 'GUAM', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(83, 'GTM', 'GUATEMALTECA', 'GUATEMALA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(84, 'GIN', 'GUINESA', 'GUINEA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(85, 'GNQ', 'ECUATOGUINEANA', 'GUINEA ECUATORIAL', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(86, 'GNB', 'BISSAUGUINEANA', 'GUINEA-BISSAU', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(87, 'GUY', 'GUYANESA', 'GUYANA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(88, 'GUF', 'FRANCOGUYANESA', 'GUYANA FRANCESA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(89, 'HTI', 'HAITIANA', 'HAITI', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(90, 'HND', 'HONDUREÑA', 'HONDURAS', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(91, 'HKG', 'HONGKONESA', 'HONG KONG', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(92, 'HUN', 'HUNGARA', 'HUNGRIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(93, 'IND', 'INDIA', 'INDIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(94, 'IDN', 'INDONESA', 'INDONESIA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(95, 'IRN', 'IRANI', 'IRAN', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(96, 'IRQ', 'IRAQUI', 'IRAQ', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(97, 'IRL', 'IRLANDESA', 'IRLANDA', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(98, 'CXR', 'ISLA NAVIDAD', 'ISLA NAVIDAD', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(99, 'NFK', 'NORFOLKENSE', 'ISLA NORFOLK', NULL, NULL, NULL, '2024-11-11 21:24:30', '2024-11-11 21:24:30'),
(100, 'ISL', 'ISLANDESA', 'ISLANDIA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(101, 'CYM', 'CAIMANES', 'ISLAS CAIMAN', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(102, 'CCK', 'AUSTRALIANA', 'ISLAS COCOS (KEELING)', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(103, 'COK', 'ISLAS COOK', 'ISLAS COOK', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(104, 'FJI', 'FIJENA', 'ISLAS DE FIJI', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(105, 'FRO', 'FEROESA', 'ISLAS FAROE', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(106, 'FLK', 'KELPERS', 'ISLAS MALVINAS', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(107, 'MNP', 'NORMARIANENSE', 'ISLAS MARIANAS DEL NORTE', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(108, 'MHL', 'MARSHALESA', 'ISLAS MARSHALL', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(109, 'PCN', 'PITCAIRNESA', 'ISLAS PITCAIRN', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(110, 'SLB', 'SALOMONENSE', 'ISLAS SALOMON', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(111, 'TCA', 'TURCOCAINESA', 'ISLAS TURCAS Y CAICOS', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(112, 'VGB', 'VIRGINENSE', 'ISLAS VIRGENES', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(113, 'VIR', 'VIRGINENSE BRITANICA', 'ISLAS VIRGENES', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(114, 'ISR', 'ISRAELITA', 'ISRAEL', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(115, 'ITA', 'ITALIANA', 'ITALIA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(116, 'JAM', 'JAMAIQUINO', 'JAMAICA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(117, 'JPN', 'JAPONESA', 'JAPON', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(118, 'JOR', 'JORDANA', 'JORDANIA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(119, 'KAZ', 'KAZAKO', 'KAZAKSTAN', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(120, 'KEN', 'KENIANA', 'KENIA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(121, 'KGZ', 'KIGUISO', 'KIRGUISTAN', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(122, 'KIR', 'KIRIBATIANA', 'KIRIBATI', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(123, 'RKS', 'KOSOVAR', 'KOSOVO', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(124, 'KWT', 'KUWAITI', 'KUWAIT', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(125, 'LAO', 'LAOSIANA', 'LAOS', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(126, 'LSO', 'LESOTHENSA', 'LESOTHO', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(127, 'LVA', 'LETON', 'LETONIA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(128, 'LBN', 'LIBANESA', 'LIBANO', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(129, 'LBR', 'LIBERIANA', 'LIBERIA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(130, 'LBY', 'LIBICA', 'LIBIA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(131, 'LIE', 'LIECHTENSTEINIANA', 'LIECHTENSTEIN', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(132, 'LTU', 'LITUANA', 'LITUANIA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(133, 'LUX', 'LUXEMBURGUESA', 'LUXEMBURGO', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(134, 'MAC', 'MACAENSE', 'MACAO', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(135, 'MKD', 'MACEDONIA', 'MACEDONIA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(136, 'MDG', 'MALGACHE', 'MADAGASCAR', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(137, 'MYS', 'MALAYA', 'MALASIA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(138, 'MWI', 'MALAWI', 'MALAWI', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(139, 'MDV', 'MALDIVA', 'MALDIVAS', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(140, 'MLI', 'MALI', 'MALI', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(141, 'MLT', 'MALTESA', 'MALTA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(142, 'MAR', 'MARROQUI', 'MARRUECOS', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(143, 'MTQ', 'MARTINIQUEÑA', 'MARTINICA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(144, 'MUS', 'MAURICIANA', 'MAURICIO', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(145, 'MRT', 'MAURITANA', 'MAURITANIA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(146, 'MYT', 'MAYOTESA', 'MAYOTTE', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(147, 'MEX', 'MEXICANA', 'MEXICO', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(148, 'MDA', 'MOLDAVA', 'MOLDAVIA', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(149, 'MCO', 'MONACO', 'MONACO', NULL, NULL, NULL, '2024-11-11 21:25:53', '2024-11-11 21:25:53'),
(150, 'MNG', 'MONGOLESA', 'MONGOLIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(151, 'MSR', 'DE MONTSERRAT', 'MONTSERRAT', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(152, 'MOZ', 'MOZAMBIQUEÑA', 'MOZAMBIQUE', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(153, 'NAM', 'NAMIBIA', 'NAMIBIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(154, 'NRU', 'NAURU', 'NAURU', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(155, 'NPL', 'NEPALESA', 'NEPAL', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(156, 'NIC', 'NICARAGÜENSE', 'NICARAGUA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(157, 'NER', 'NIGERINA', 'NIGER', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(158, 'NGA', 'NIGERIANA', 'NIGERIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(159, 'NIU', 'NIUANA', 'NIUE', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(160, 'NOR', 'NORUEGA', 'NORUEGA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(161, 'NCL', 'NEOCALEDONIA', 'NUEVA CALEDONIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(162, 'NZL', 'NEOZELANDESA', 'NUEVA ZELANDIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(163, 'OMN', 'OMANA', 'OMAN', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(164, 'NLD', 'NEERLANDESA', 'PAISES BAJOS', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(165, 'PAK', 'PAKISTANI', 'PAKISTAN', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(166, 'PLW', 'PALAUANA', 'PALAU', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(167, 'PSE', 'PALESTINA', 'PALESTINA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(168, 'PAN', 'PANAMEÑA', 'PANAMA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(169, 'PNG', 'PAPU NEOGUINEANO', 'PAPUA NUEVA GUINEA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(170, 'PRY', 'PARAGUAYA', 'PARAGUAY', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(171, 'PER', 'PERUANA', 'PERU', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(172, 'PYF', 'FRANCOPOLINESIA', 'POLINESIA FRANCESA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(173, 'POL', 'POLACA', 'POLONIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(174, 'PRT', 'PORTUGUESA', 'PORTUGAL', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(175, 'PRI', 'PUERTORRIQUEÑA', 'PUERTO RICO', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(176, 'GBR', 'BRITANICA', 'REINO UNIDO', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(177, 'CAF', 'AFRICANA', 'REPÚBLICA CENTRAL DE ÁFRICA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(178, 'CZE', 'CHECA', 'REPÚBLICA CHECA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(179, 'KOR', 'COREANA', 'REPÚBLICA DE COREA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(180, 'DOM', 'DOMINICANA', 'REPÚBLICA DOMINICANA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(181, 'RWA', 'RUANDES', 'RUANDA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(182, 'ROM', 'RUMANA', 'RUMANIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(183, 'REU', 'REUNIONESA', 'REUNIÓN', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(184, 'RUS', 'RUSA', 'RUSIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(185, 'ESH', 'SAHAURI', 'SAHARA OCCIDENTAL', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(186, 'SLV', 'SALVADOREÑA', 'SALVADOR', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(187, 'WSM', 'SAMOANA', 'SAMOA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(188, 'ASM', 'NORTE AMERICANA (SAMOA)', 'SAMOA AMERICANA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(189, 'KNA', 'SANCRISTOBALEÑA', 'SAN CRISTÓBAL Y NIEVES', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(190, 'SMR', 'SAN MARINO', 'SAN MARINO', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(191, 'SPM', 'SAN PEDRINA', 'SAN PEDRO Y MIQUELON', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(192, 'VCT', 'SANVICENTINA', 'SAN VICENTE Y GRANADINAS', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(193, 'SHN', 'SANTAHELENA', 'SANTA HELENA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(194, 'LCA', 'SANTALUCIANA', 'SANTA LUCÍA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(195, 'STP', 'SANTOTOMENSE', 'SANTO TOMÉ Y PRÍNCIPE', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(196, 'SEN', 'SEBEGALESA', 'SENEGAL', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(197, 'SRB', 'SERBIA', 'SERBIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(198, 'SYC', 'SEYCHELENSE', 'SEYCHELLES', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(199, 'SLE', 'LEONESA', 'SIERRA LEONA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(200, 'SGP', 'SINGAPURENSE', 'SINGAPUR', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(201, 'SYR', 'SIRIA', 'SIRIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(202, 'SOM', 'SOMALIA', 'SOMALIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(203, 'LKA', 'SRI LANKA', 'SRI LANKA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(204, 'ZAF', 'SUDAFRICANA', 'SUDÁFRICA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(205, 'SDN', 'SUDANESA', 'SUDÁN', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(206, 'SWE', 'SUECA', 'SUECIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(207, 'CHE', 'SUIZA', 'SUIZA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(208, 'SUR', 'SURINAMESA', 'SURINAM', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(209, 'SWZ', 'SUAZI', 'SWAZILANDIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(210, 'THA', 'TAILANDESA', 'TAILANDIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(211, 'TZA', 'TANZANA', 'TANZANIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(212, 'TJK', 'TAYIKA', 'TAYIKISTÁN', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(213, 'IOT', 'CHAGUENSE', 'TERRITORIO BRITÁNICO DEL OCÉANO ÍNDICO', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(214, 'ATF', 'FRANCESA', 'TERRITORIO DEL SUR DE FRANCIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(215, 'TMP', 'TIMORENSE', 'TIMOR LESTE', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(216, 'TGO', 'TOGOLESA', 'TOGO', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(217, 'TKL', 'TOKELAUANA', 'TOKELAU', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(218, 'TON', 'TONGA', 'TONGA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(219, 'TTO', 'TRINITENSE', 'TRINIDAD Y TOBAGO', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(220, 'TUN', 'TUNECINA', 'TUNEC', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(221, 'TKM', 'TURCOMANA', 'TURKMENISTÁN', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(222, 'TUR', 'TURCA', 'TURQUÍA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(223, 'TUV', 'TUVALUANA', 'TUVALU', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(224, 'UKR', 'UCRANIANA', 'UCRANIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(225, 'UGA', 'UGANDESA', 'UGANDA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(226, 'URY', 'URUGUAYA', 'URUGUAY', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(227, 'UZB', 'UZBECA', 'UZBEKISTÁN', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(228, 'VUT', 'VANUATUENENSE', 'VANUATU', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(229, 'VEN', 'VENEZOLANA', 'VENEZUELA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(230, 'VI', 'VICENTINA', 'VICENTINA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(231, 'VNM', 'VIETNAMITA', 'VIETNAM', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(232, 'WLF', 'WALISIANA', 'WALLIS AND FUTUNA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(233, 'YEM', 'YEMEN', 'YEMEN', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(234, 'DJI', 'YIBUTIANA', 'YIBUTI', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(235, 'YUG', 'YUGOSLAVA', 'YUGOSLAVIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(236, 'ZMB', 'ZAMBIO', 'ZAMBIA', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05'),
(237, 'ZWE', 'ZIMBABUENSE', 'ZIMBABUE', NULL, NULL, NULL, '2024-11-11 21:27:05', '2024-11-11 21:27:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nominas`
--

CREATE TABLE `nominas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `periodos_id` bigint(20) UNSIGNED NOT NULL,
  `costo1` varchar(255) DEFAULT NULL,
  `costo2` varchar(255) DEFAULT NULL,
  `costo3` varchar(255) DEFAULT NULL,
  `costo4` decimal(10,2) DEFAULT NULL,
  `aPrueba` varchar(255) DEFAULT NULL,
  `nombreJefe` varchar(255) DEFAULT NULL,
  `nombreRegion` varchar(255) DEFAULT NULL,
  `nombreCosto` varchar(255) DEFAULT NULL,
  `descuentos_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sueldos_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre1` varchar(255) DEFAULT NULL,
  `nombre2` varchar(255) DEFAULT NULL,
  `nombre3` varchar(255) DEFAULT NULL,
  `apellido1` varchar(255) DEFAULT NULL,
  `apellido2` varchar(255) DEFAULT NULL,
  `nombrePuesto1` varchar(255) DEFAULT NULL,
  `nombrePuesto2` varchar(255) DEFAULT NULL,
  `tipoPago` varchar(255) DEFAULT NULL,
  `banco` varchar(255) DEFAULT NULL,
  `grupoCuenta` varchar(255) DEFAULT NULL,
  `diasTrabajados` decimal(10,2) DEFAULT NULL,
  `diasAusencia` decimal(10,2) DEFAULT NULL,
  `horasParciales` decimal(10,2) DEFAULT NULL,
  `fechaBaja` date DEFAULT NULL,
  `estado1` varchar(255) DEFAULT NULL,
  `baseMensual` decimal(10,2) DEFAULT NULL,
  `baseQuincenal` decimal(10,2) DEFAULT NULL,
  `baseSemanal` decimal(10,2) DEFAULT NULL,
  `baseComisiones` decimal(10,2) DEFAULT NULL,
  `comisionesVentas` decimal(10,2) DEFAULT NULL,
  `cantidadCongeladores` int(11) DEFAULT NULL,
  `comisionesCongeladores` decimal(10,2) DEFAULT NULL,
  `totalComisiones` decimal(10,2) DEFAULT NULL,
  `totalOrdinario` decimal(10,2) DEFAULT NULL,
  `cantidadHorasSimples` decimal(10,2) DEFAULT NULL,
  `importeHorasSimples` decimal(10,2) DEFAULT NULL,
  `cantidadHorasDobles` decimal(10,2) DEFAULT NULL,
  `importeHorasDobles` decimal(10,2) DEFAULT NULL,
  `totalHorasExtras` decimal(10,2) DEFAULT NULL,
  `vacaciones` decimal(10,2) DEFAULT NULL,
  `afectoIGSS` decimal(10,2) DEFAULT NULL,
  `bonoLey` decimal(10,2) DEFAULT NULL,
  `bonoCongeladores` decimal(10,2) DEFAULT NULL,
  `bonoCumplimiento` decimal(10,2) DEFAULT NULL,
  `bonoRetornos` decimal(10,2) DEFAULT NULL,
  `otrosBonos` decimal(10,2) DEFAULT NULL,
  `nombreBono` varchar(255) DEFAULT NULL,
  `totalBonificaciones` decimal(10,2) DEFAULT NULL,
  `devolucionISR` decimal(10,2) DEFAULT NULL,
  `Reintegros` decimal(10,2) DEFAULT NULL,
  `totalIngresos` decimal(10,2) DEFAULT NULL,
  `IGSSlaboral` decimal(10,2) DEFAULT NULL,
  `ISRañoAnterior` decimal(10,2) DEFAULT NULL,
  `ISRactual` decimal(10,2) DEFAULT NULL,
  `anticipoSalario` decimal(10,2) DEFAULT NULL,
  `prestamoGYT` decimal(10,2) DEFAULT NULL,
  `prestamoBantrab` decimal(10,2) DEFAULT NULL,
  `uniformes` decimal(10,2) DEFAULT NULL,
  `descuentoInventarios` decimal(10,2) DEFAULT NULL,
  `embargos` decimal(10,2) DEFAULT NULL,
  `boletoOrnato` decimal(10,2) DEFAULT NULL,
  `tarjetaSalud` decimal(10,2) DEFAULT NULL,
  `bazares` decimal(10,2) DEFAULT NULL,
  `ventaProducto` decimal(10,2) DEFAULT NULL,
  `otrosDescuentos` decimal(10,2) DEFAULT NULL,
  `nombreDescuento` varchar(255) DEFAULT NULL,
  `totalDescuentos` decimal(10,2) DEFAULT NULL,
  `totalEgresos` decimal(10,2) DEFAULT NULL,
  `liquidoPagar` decimal(10,2) DEFAULT NULL,
  `bono14Gasto` decimal(10,2) DEFAULT NULL,
  `aguinaldoGasto` decimal(10,2) DEFAULT NULL,
  `IGSSpatronalGasto` decimal(10,2) DEFAULT NULL,
  `indemnizacionGasto` decimal(10,2) DEFAULT NULL,
  `bono14Provision` decimal(10,2) DEFAULT NULL,
  `aguinaldoProvision` decimal(10,2) DEFAULT NULL,
  `IGSSpatronalProvision` decimal(10,2) DEFAULT NULL,
  `indemnizacionProvision` decimal(10,2) DEFAULT NULL,
  `documentoPago` varchar(255) DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupaciones`
--

CREATE TABLE `ocupaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ocupaciones`
--

INSERT INTO `ocupaciones` (`id`, `codigo`, `nombre`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, '2611001', 'ABOGADO', NULL, NULL, '', '2024-10-09 22:39:02', '2024-10-09 22:39:02'),
(2, '2611007', 'ABOGADO CON ESPECIALIDAD DE DERECHO CIVIL O PROCESAL', NULL, NULL, '', '2024-10-09 22:39:22', '2024-10-09 22:39:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` date NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  `diasPeriodo` int(11) DEFAULT NULL,
  `comentarios` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `tablaPermiso` varchar(255) NOT NULL,
  `rutaPermiso` varchar(255) NOT NULL,
  `tipoPermiso` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades`
--

CREATE TABLE `propiedades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `Nombre` int(10) NOT NULL,
  `fechaEntrega` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` enum('ENTREGADO','DEVUELTO') NOT NULL,
  `fechaDevolucion` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `codigoAF` varchar(75) NOT NULL,
  `comentarios` varchar(150) NOT NULL,
  `talla` varchar(50) NOT NULL,
  `montoDescontar` decimal(10,2) NOT NULL,
  `montoTotal` decimal(10,2) NOT NULL,
  `fechaReferido` date DEFAULT NULL,
  `tipoPropiedad_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provisiones`
--

CREATE TABLE `provisiones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `indemnizacion` int(11) NOT NULL,
  `bono14` int(11) NOT NULL,
  `aguinaldo` int(11) NOT NULL,
  `vacaciones` int(11) NOT NULL,
  `cuentaprovision` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `nombre2` varchar(100) DEFAULT NULL,
  `nombre3` varchar(100) DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`id`, `codigo`, `nombre`, `nombre2`, `nombre3`, `desde`, `hasta`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, '4121', 'ACTIVOS FIJOS', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(2, '2131', 'ANÁLISIS DE INFORMACIÓN Y PROYECTOS DE MEJORA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(3, '3439', 'ANALISTA COMERCIAL', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(4, '3439', 'ANALISTA DE FLOTA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(5, '3439', 'ASISTENTE ADMINISTRATIVA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(6, '4131', 'ASISTENTE ADMINISTRATIVO BODEGA FRIA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(7, '4121', 'ASISTENTE CONTABLE', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(8, '4121', 'ASISTENTE CUENTAS POR PAGAR', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(9, '2131', 'ASISTENTE DE ANALIS DE INFORMACION', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(10, '4121', 'ASISTENTE DE CUENTAS POR PAGAR', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(11, '2131', 'ASISTENTE DE INFORMACION Y PROYECTOS', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(12, '3439', 'ASISTENTE DE LOGISTICA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(13, '3439', 'ASISTENTE DE MERCADO ABIERTO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(14, '3439', 'ASISTENTE DE RECLUTAMIENTO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(15, '3439', 'ASISTENTE DE RECURSOS HUMANOS', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(16, '4121', 'ASISTENTE DE TESORERIA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(17, '3439', 'ASISTENTE DE TIENDAS TOC', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(18, '3439', 'ASISTENTE DE TIENDAS TOD', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(19, '3439', 'ASISTENTE DE VENTAS', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(20, '5220', 'ATENCION AL CLIENTE', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(21, '4121', 'AUDITOR JUNIOR', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(22, '2411', 'AUDITOR SENIOR', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(23, '4121', 'AUXILIAR ADMINISTRATIVO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(24, '4121', 'AUXILIAR CONTABLE', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(25, '4131', 'AUXILIAR DE BODEGA FRIA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(26, '4131', 'AUXILIAR DE BODEGA SECA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(27, '3439', 'AUXILIAR DE FACTURACION', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(28, '2131', 'AUXILIAR DE IT', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(29, '4121', 'AUXILIAR DE LIQUIDACIONES', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(30, '7129', 'AUXILIAR DE MANTENIMIENTO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(31, '4229', 'AUXILIAR DE RUTA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(32, '3439', 'AUXILIAR FACTURACION', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(33, '2131', 'COORDINADOR DE IT', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(34, '8324', 'COORDINADOR DE MERCADO ABIERTO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(35, '2131', 'COORDINADOR DE SOPORTE TECNICO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(36, '3439', 'COORDINADORA DE COMPRAS', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(37, '3439', 'COORDINADORA Y ASITENTE DE TODS', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(38, '3415', 'DESARROLLADOR DE MARCA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(39, '3241', 'DOCTORA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(40, '3439', 'ENCARGADA DE CUENTAS POR COBRAR', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(41, '2411', 'ENCARGADO DE AUDITORIA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(42, '4131', 'ENCARGADO DE BODEGA FRIA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(43, '4131', 'ENCARGADO DE BODEGA SECA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(44, '2411', 'ENCARGADO DE CUENTAS POR PAGAR', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(45, '2411', 'ENCARGADO DE IMPUESTOS', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(46, '4121', 'ENCARGADO DE LIQUIDACIONES', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(47, '7129', 'ENCARGADO DE MANTENIMIENTO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(48, '1319', 'GERENTE DE SUPERVISION CONCECIONARIO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(49, '1319', 'GERENTE DE LOGISTICA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(50, '1319', 'GERENTE DE MERCADO ABIERTO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(51, '1319', 'GERENTE DE TOD', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(52, '1319', 'GERENTE GENERAL', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(53, '2419', 'JEFE ADMINISTRATIVO-FINANCIERO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(54, '2419', 'JEFE DE CONTABILIDAD', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(55, '2419', 'JEFE DE DISTRIBUIDORA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(56, '2419', 'JEFE DE RRHH', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(57, '7231', 'MECANICO AUTOMOTRIZ', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(58, '9151', 'MENSAJERO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(59, '8324', 'PILOTO JUNIOR', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(60, '8324', 'PILOTO SENIOR', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(61, '3415', 'PRE VENTA UNISUPER', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(62, '4222', 'RECEPCIONISTA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(63, '2419', 'REPRESENTANTE DE FRANQUICIA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(64, '2419', 'SUPERVISOR MA', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(65, '7129', 'SUPERVISOR (A) DE MANTENIMIENTO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(66, '2419', 'SUPERVISOR (A) TOCS', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(67, '2419', 'SUPERVISOR (A) TODS', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(68, '7129', 'TECNICO DE MANTENIMIENTO', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(69, '7129', 'TECNICO EN REFRIGERACION', '', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(70, '3415', 'VENDEDOR EMERGENTE', 'VENTA DIRECTA', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(71, '3415', 'VENDEDOR EMERGENTE', 'PRE VENDEDOR', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(72, '3415', 'VENDEDOR EMERGENTE', 'PILOTO TRASLADO', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(73, '3415', 'VENDEDOR EMERGENTE', 'PILOTO SENIOR', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(74, '3415', 'VENDEDOR EMERGENTE', 'PILOTO JUNIOR', '', NULL, NULL, '', '2024-11-08 16:07:26', '2024-11-08 16:07:26'),
(75, '2131', 'JEFE DE IT', NULL, NULL, NULL, NULL, NULL, '2024-11-08 16:11:39', '2024-11-08 16:11:39'),
(76, '2131', 'GERENTE DE IT', NULL, NULL, NULL, NULL, NULL, '2024-11-08 16:11:39', '2024-11-08 16:11:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclutadores`
--

CREATE TABLE `reclutadores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reclutadores`
--

INSERT INTO `reclutadores` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'GABRIELA ALVAREZ', '2024-11-08 18:47:00', '2024-11-08 18:47:00'),
(2, '2', 'JUAN CARLOS MUÑOZ', '2024-11-08 18:47:00', '2024-11-08 18:47:00'),
(3, '3', 'OSCAR ALVAREZ', '2024-11-08 18:47:00', '2024-11-08 18:47:00'),
(4, '4', 'ANDREA HERNANDEZ', '2024-11-08 18:47:00', '2024-11-08 18:47:00'),
(5, '5', 'CECILIA ERICASTILLA', '2024-11-08 18:47:00', '2024-11-08 18:47:00'),
(6, '6', 'NANCY SALAZAR', '2024-11-08 18:47:00', '2024-11-08 18:47:00'),
(7, '7', 'ANA ESTEVEZ', '2024-11-08 18:47:00', '2024-11-08 18:47:00'),
(8, '8', 'ANA MARIA', '2024-11-08 18:47:00', '2024-11-08 18:47:00'),
(9, '9', 'ANA PAREDES', '2024-11-08 18:47:00', '2024-11-08 18:47:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencias`
--

CREATE TABLE `referencias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `telefono` varchar(75) NOT NULL,
  `jefeInmediato` varchar(75) NOT NULL,
  `telJefe` varchar(75) NOT NULL,
  `Puesto` varchar(75) NOT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `tipoReferencia_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(25) DEFAULT NULL,
  `nombre` varchar(75) NOT NULL,
  `grupoRegion` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id`, `codigo`, `nombre`, `grupoRegion`, `created_at`, `updated_at`) VALUES
(1, '1', 'NORTE', NULL, '2024-10-09 22:33:13', '2024-10-09 22:33:13'),
(2, '2', 'SUR', NULL, '2024-10-09 22:33:26', '2024-10-09 22:33:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secuencias`
--

CREATE TABLE `secuencias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipoEmpleado` varchar(5) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `iniciaSecuencia` int(11) NOT NULL,
  `mascara` varchar(20) NOT NULL,
  `ultimousado` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `secuencias`
--

INSERT INTO `secuencias` (`id`, `tipoEmpleado`, `nombre`, `iniciaSecuencia`, `mascara`, `ultimousado`, `created_at`, `updated_at`) VALUES
(1, 'A', 'ASPIRANTE', 1, 'A', 34, '2024-10-09 21:08:09', '2024-11-14 18:55:08'),
(2, 'C', 'CANDIDATO', 1, 'C', 29, '2024-10-12 18:28:27', '2024-11-14 18:55:28'),
(3, 'E', 'EMPLEADO', 1, 'E', 9, '2024-10-12 18:28:58', '2024-11-07 04:05:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sueldos`
--

CREATE TABLE `sueldos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id` bigint(20) UNSIGNED NOT NULL,
  `periodos_id` bigint(20) UNSIGNED NOT NULL,
  `diasTrabajados` int(11) NOT NULL,
  `baseComisiones` decimal(10,2) NOT NULL,
  `sueldoQuincenal` decimal(10,2) NOT NULL,
  `cantidadHorasSimples` decimal(10,2) NOT NULL,
  `cantidadHorasDobles` decimal(10,2) NOT NULL,
  `bonificaciones` decimal(10,2) NOT NULL,
  `comisionesVentas` decimal(10,2) NOT NULL,
  `horasParciales` decimal(10,2) DEFAULT NULL,
  `devolucionISR` decimal(10,2) DEFAULT NULL,
  `reintegros` decimal(10,2) DEFAULT NULL,
  `cantidadCongeladores` int(11) NOT NULL,
  `comisionesCongeladores` decimal(10,2) NOT NULL,
  `totalComisiones` decimal(10,2) NOT NULL,
  `totalOrdinario` decimal(10,2) NOT NULL,
  `importeHorasSimples` decimal(10,2) NOT NULL,
  `importeHorasDobles` decimal(10,2) NOT NULL,
  `totalHorasExtras` decimal(10,2) NOT NULL,
  `vacaciones` decimal(10,2) NOT NULL,
  `diasAusencia` decimal(10,2) NOT NULL,
  `bonoCongeladores` decimal(10,2) NOT NULL,
  `bonoCumplimiento` decimal(10,2) NOT NULL,
  `bonoRetornos` decimal(10,2) NOT NULL,
  `otrosBonos` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocontacto`
--

CREATE TABLE `tipocontacto` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipocontacto`
--

INSERT INTO `tipocontacto` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'PERSONAL', '2024-10-09 21:53:24', '2024-11-12 05:27:23'),
(2, '2', 'EMERGENCIA', '2024-10-09 21:53:36', '2024-10-09 21:53:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocontrato`
--

CREATE TABLE `tipocontrato` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipocontrato`
--

INSERT INTO `tipocontrato` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'VERBAL', '2024-10-09 21:51:24', '2024-10-09 21:51:24'),
(2, '2', 'ESCRITO', '2024-10-09 21:51:47', '2024-10-09 21:51:47'),
(3, '3', 'TEMPORAL', '2024-10-09 21:51:58', '2024-10-09 21:51:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodescanso`
--

CREATE TABLE `tipodescanso` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(75) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodescuento`
--

CREATE TABLE `tipodescuento` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cuentaContable` varchar(100) NOT NULL,
  `nombreCuenta` varchar(100) NOT NULL,
  `seFactura` tinyint(1) DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipodescuento`
--

INSERT INTO `tipodescuento` (`id`, `codigo`, `nombre`, `cuentaContable`, `nombreCuenta`, `seFactura`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 1, 'DESCUENTO SIN GOCE DE SALARIO - SALARIOS', '6101001001000-GT-01', 'SUELDOS Y SALARIOS ORDINARIOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(2, 2, 'DESCUENTO SIN GOCE DE SALARIO - CUOTA IGSS', '2108002001000-GT-01', 'CUOTAS LAB. IGSS POR PAGAR', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(3, 3, 'CUOTA PAT. IGSS POR PAGAR', '2108001001000-GT-01', 'CUOTA PAT. IGSS POR PAGAR', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(4, 4, 'CUOTAS LAB. IGSS POR PAGAR', '2108002001000-GT-01', 'CUOTAS LAB. IGSS POR PAGAR', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(5, 5, 'ISR RETENCIONES RENTA DE TRABAJADORES', '2110001005003-GT-01', 'ISR RETENCIONES RENTA DE TRABAJADORES', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(6, 6, 'RETENCIONES PRESTAMO BANCO G&T', '2108002002000-GT-01', 'RETENCIONES PRESTAMO BANCO G&T', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(7, 7, 'DESCUENTOS JUDICIALES', '2108002004000-GT-01', 'DESCUENTOS JUDICIALES', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(8, 8, 'ISR AÑO ANTERIOR', '1102002001005-GT-01', 'ISR ASALARIADOS POR COBRAR', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(9, 9, 'ANTICIPO SOBRE SUELDOS', '1102002001002-GT-01', 'ANTICIPO SOBRE SUELDOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(10, 10, 'ISR EN EXCESO', '2108002005000-GT-01', 'ISR RETENCIONES EN EXCESO', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(11, 11, 'UNIFORMES', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(12, 12, 'INVENTARIO', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(13, 13, 'BOLETO DE ORNATO', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(14, 14, 'ISR ACTUAL', '1102002001004-GT-01', 'ISR ACTUAL', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(15, 15, 'ANTICIPO DE SALARIOS SOBRE SUELDOS', '1102002001002-GT-01', 'ANTICIPO DE SALARIOS SOBRE SUELDOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(16, 16, 'ANTICIPO BONO 14', '2104001005000-GT-01', 'ANTICIPO BONO 14', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(17, 17, 'ANTICIPO AGUINALDO', '2104001004000-GT-01', 'ANTICIPO AGUINALDO', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(18, 18, 'PRESTAMO GYT', '1102002001004-GT-01', 'PRESTAMO GYT', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(19, 19, 'PRESTAMO BANTRAB', '1102002001004-GT-01', 'PRESTAMO BANTRAB', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(20, 20, 'EMBARGOS', '1102002001004-GT-01', 'EMBARGOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(21, 21, 'TARJETA SALUD', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(22, 22, 'TARJETA DE MANIPULACION', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(23, 23, 'ANTICIPO DE SALARIO CAJA CHICA', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(24, 24, 'BILLETES FALSOS', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(25, 25, 'BOTAS INDUSTRIALES', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(26, 26, 'CASCO INDUSTRIAL', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(27, 27, 'CASCO MOTORISTA', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(28, 28, 'CHALECOS TIPO ARNES', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(29, 29, 'COMPRA DE BOTAS DE HULE', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(30, 30, 'COMPRA DE MUEBLES OFICINA', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(31, 31, 'COMPRA DE UNIFORMES ADM.', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(32, 32, 'COMPRA DE UNIFORMES TOD', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(33, 33, 'COMPRA EQUIPO DE CAMION', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(34, 34, 'COMPRA EQUIPO OF.', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(35, 35, 'COMPRA MOTOCICLETA', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(36, 36, 'DAÑO BASCULA TOD', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(37, 37, 'DAÑO CAFETERA', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(38, 38, 'DAÑO DE CAMION', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(39, 39, 'DAÑO DE COMPUTADORA', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(40, 40, 'DAÑO DE MOTOCICLETA', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(41, 41, 'DAÑO DE PRODUCTO', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(42, 42, 'DEDUCIBLE DE CELULAR', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(43, 43, 'DESCUENTO CONGELADORES', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(44, 44, 'EXCEDENTE DE CELULAR', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(45, 45, 'FALTANTE EN LIQUIDACIONES', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(46, 46, 'FALTANTE EN RUTA/PRODUCTO', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(47, 47, 'FALTANTE EN RUTA/EFECTIVO', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(48, 48, 'FALTANTE EN TIENDA/EFECTIVO', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(49, 49, 'GUANTES', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(50, 50, 'IMPERMIABLE MOTORISTA', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(51, 51, 'KIT RODILLERAS Y CODERAS', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(52, 52, 'MULTAS MOTOCICLETAS', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(53, 53, 'MULTAS VEHICULOS', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 0, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(54, 54, 'PERDIDA DE PLACA MOTO O VEHICULO', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(55, 55, 'REPOSICIÓN DE GAFETE', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(56, 56, 'REPOSICION DE CAMBIO DE TALLA', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(57, 57, 'REPOSICION DE LENTES', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(58, 58, 'REPOSICIÓN DE PAPELETA', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(59, 59, 'REPOSICIÓN DE TARJETA', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48'),
(60, 60, 'SALARIO MINIMO', '1102002001004-GT-01', 'CUENTAS POR COBRAR EMPLEADOS', 1, NULL, '2024-11-11 21:19:48', '2024-11-11 21:19:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoevaluacion`
--

CREATE TABLE `tipoevaluacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoexperiencia`
--

CREATE TABLE `tipoexperiencia` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipofamiliar`
--

CREATE TABLE `tipofamiliar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` int(75) NOT NULL,
  `nombre` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoidentificacion`
--

CREATE TABLE `tipoidentificacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipoidentificacion`
--

INSERT INTO `tipoidentificacion` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'DPI', '2024-10-10 01:59:31', '2024-10-10 01:59:31'),
(2, '2', 'CERTIFICADO DE NACIMIENTO', '2024-10-10 01:59:50', '2024-10-10 01:59:50'),
(3, '3', 'PASAPORTE', '2024-10-10 02:00:05', '2024-10-10 02:00:05'),
(4, '4', 'LICENCIA', '2024-10-10 02:01:16', '2024-10-10 02:01:16'),
(5, '5', 'CARNET IRTA', '2024-10-10 02:01:31', '2024-10-10 02:01:31'),
(6, '6', 'CARNET IGSS', '2024-10-10 02:01:47', '2024-10-10 02:01:47'),
(7, '7', 'VISA AMERICANA', '2024-10-10 02:02:01', '2024-10-10 02:02:01'),
(8, '8', 'NIT', '2024-10-10 02:02:21', '2024-10-10 02:02:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'ACREDITAMIENTO', '2024-10-10 02:09:26', '2024-10-10 02:09:26'),
(2, '2', 'CHEQUE', '2024-10-10 02:09:36', '2024-10-10 02:09:36'),
(3, '5', 'FICTICIO', '2024-10-18 16:17:29', '2024-10-18 16:17:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopropiedad`
--

CREATE TABLE `tipopropiedad` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(75) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporeclutamiento`
--

CREATE TABLE `tiporeclutamiento` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` int(75) NOT NULL,
  `nombre` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporeferencia`
--

CREATE TABLE `tiporeferencia` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipovacante`
--

CREATE TABLE `tipovacante` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipovacante`
--

INSERT INTO `tipovacante` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '1', 'NUEVA', '2024-11-08 18:28:54', '2024-11-08 18:28:54'),
(2, '2', 'RENUNCIA', '2024-11-08 18:28:54', '2024-11-08 18:28:54'),
(3, '3', 'DESPIDO', '2024-11-08 18:28:54', '2024-11-08 18:28:54'),
(4, '4', 'ASCENSO LABORAL', '2024-11-08 18:28:54', '2024-11-08 18:28:54'),
(5, '5', 'TRASLADO', '2024-11-08 18:28:54', '2024-11-08 18:28:54'),
(6, '6', 'TEMPORAL', '2024-11-08 18:28:54', '2024-11-08 18:28:54'),
(7, '7', 'FIN DE SEMANA', '2024-11-08 18:28:54', '2024-11-08 18:28:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `nombreUsuario` varchar(255) DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacantes`
--

CREATE TABLE `vacantes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(25) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `puestos_id` bigint(20) UNSIGNED NOT NULL,
  `costos1_id` bigint(20) UNSIGNED NOT NULL,
  `costos2_id` bigint(20) UNSIGNED NOT NULL,
  `costos3_id` bigint(20) UNSIGNED NOT NULL,
  `departamentos_id` bigint(20) UNSIGNED NOT NULL,
  `municipios_id` bigint(20) UNSIGNED NOT NULL,
  `jefes_id` bigint(20) UNSIGNED NOT NULL,
  `tipoVacante_id` bigint(20) UNSIGNED NOT NULL,
  `empleados_id_1` bigint(20) UNSIGNED DEFAULT NULL,
  `empleados_id_2` bigint(20) UNSIGNED DEFAULT NULL,
  `reclutadores_id` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `vigente` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vacantes`
--

INSERT INTO `vacantes` (`id`, `codigo`, `nombre`, `puestos_id`, `costos1_id`, `costos2_id`, `costos3_id`, `departamentos_id`, `municipios_id`, `jefes_id`, `tipoVacante_id`, `empleados_id_1`, `empleados_id_2`, `reclutadores_id`, `fecha`, `cantidad`, `vigente`, `created_at`, `updated_at`) VALUES
(1, '', '', 70, 4, 5, 101, 17, 276, 33, 1, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(2, '', '', 60, 5, 5, 101, 17, 276, 33, 1, NULL, NULL, 4, '2022-12-06', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(3, '', '', 60, 5, 5, 101, 17, 276, 33, 1, NULL, NULL, 4, '2022-12-06', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(4, '', '', 70, 3, 5, 101, 19, 295, 33, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(5, '', '', 70, 5, 5, 101, 17, 276, 33, 1, NULL, NULL, 4, '2023-05-15', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(6, '', '', 70, 5, 5, 101, 17, 276, 33, 1, NULL, NULL, 4, '2023-04-20', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(7, '', '', 60, 5, 5, 101, 17, 276, 33, 2, NULL, NULL, 4, '2023-04-20', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(8, '', '', 60, 5, 5, 101, 17, 276, 33, 2, NULL, NULL, 4, '2023-07-31', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(9, '', '', 60, 5, 5, 101, 17, 276, 33, 1, NULL, NULL, 4, '2023-05-24', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(10, '', '', 60, 5, 5, 101, 17, 276, 33, 1, NULL, NULL, 4, '2023-05-24', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(11, '', '', 60, 3, 5, 101, 19, 295, 33, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(12, 'PRUEBA', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-04-10', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(13, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-04-10', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(14, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-04-10', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(15, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-04-10', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(16, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-04-10', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(17, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-04-10', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(18, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-03-29', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(19, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-05-25', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(20, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-05-26', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(21, '', '', 23, 5, 5, 101, 17, 276, 33, 2, NULL, NULL, 4, '2023-07-31', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(22, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-04-10', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(23, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-07-31', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(24, '', '', 60, 1, 5, 101, 1, 1, 29, 5, NULL, NULL, 4, '2023-07-15', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(25, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-07-25', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(26, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-05-15', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(27, '', '', 60, 1, 5, 101, 1, 1, 29, 5, NULL, NULL, 4, '2023-08-01', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(28, '', '', 70, 1, 5, 101, 5, 58, 29, 2, NULL, NULL, 4, '2023-07-25', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(29, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-05-15', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(30, '', '', 70, 1, 5, 101, 5, 58, 29, 2, NULL, NULL, 4, '2023-05-15', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(31, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-09-15', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(32, '', '', 60, 1, 5, 101, 5, 58, 29, 2, NULL, NULL, 4, '2023-07-25', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(33, '', '', 60, 1, 5, 101, 5, 58, 29, 2, NULL, NULL, 4, '2023-05-15', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(34, '', '', 60, 3, 5, 101, 21, 317, 33, 1, NULL, NULL, 4, '2023-03-09', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(35, '', '', 60, 3, 5, 101, 18, 290, 33, 1, NULL, NULL, 4, '2023-03-09', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(36, '', '', 60, 3, 5, 101, 18, 290, 33, 2, NULL, NULL, 4, '2023-03-09', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(37, '', '', 60, 6, 5, 101, 16, 259, 33, 1, NULL, NULL, 4, '2022-12-06', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(38, '', '', 60, 6, 5, 101, 16, 259, 33, 1, NULL, NULL, 4, '2022-12-06', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(39, '', '', 70, 6, 5, 101, 16, 259, 33, 1, NULL, NULL, 4, '2022-12-18', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(40, '', '', 70, 6, 5, 101, 16, 259, 33, 2, NULL, NULL, 4, '2022-12-18', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(41, '', '', 70, 4, 5, 101, 5, 58, 29, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(42, '', '', 70, 4, 5, 101, 5, 58, 29, 6, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(43, '', '', 60, 3, 5, 101, 21, 317, 33, 1, NULL, NULL, 4, '2023-03-09', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(44, '', '', 60, 3, 5, 101, 19, 295, 33, 1, NULL, NULL, 4, '2023-08-01', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(45, '', '', 60, 3, 5, 101, 19, 295, 33, 2, NULL, NULL, 4, '2023-08-01', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(46, '', '', 70, 3, 5, 101, 19, 295, 33, 1, NULL, NULL, 4, '2023-04-20', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(47, '', '', 60, 4, 5, 101, 5, 58, 29, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(48, '', '', 60, 4, 5, 101, 5, 58, 29, 1, NULL, NULL, 4, '2023-02-01', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(49, '', '', 70, 4, 5, 101, 5, 58, 29, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(50, '', '', 70, 4, 5, 101, 5, 58, 29, 2, NULL, NULL, 4, '2022-12-01', 1, 0, '2024-11-08 20:22:25', '2024-11-08 20:22:25'),
(51, '', '', 60, 6, 5, 101, 19, 295, 33, 2, NULL, NULL, 4, '2023-02-04', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(52, '', '', 60, 3, 5, 101, 19, 295, 33, 2, NULL, NULL, 4, '2023-04-20', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(53, '', '', 70, 3, 5, 101, 19, 295, 33, 2, NULL, NULL, 4, '2023-03-31', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(54, '', '', 70, 4, 5, 101, 5, 58, 29, 2, NULL, NULL, 4, '2023-03-02', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(55, '', '', 60, 6, 5, 101, 16, 259, 33, 2, NULL, NULL, 4, '2023-02-04', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(56, '', '', 70, 4, 5, 101, 5, 58, 29, 2, NULL, NULL, 4, '2023-03-18', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(57, '', '', 60, 4, 5, 101, 5, 58, 29, 2, NULL, NULL, 4, '2023-03-31', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(58, '', '', 60, 4, 5, 101, 5, 58, 29, 2, NULL, NULL, 4, '2023-04-20', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(59, '', '', 60, 6, 5, 101, 16, 259, 33, 1, NULL, NULL, 4, '2023-04-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(60, '', '', 60, 6, 5, 101, 16, 259, 33, 1, NULL, NULL, 4, '2023-04-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(61, '', '', 60, 6, 5, 101, 16, 259, 33, 2, NULL, NULL, 4, '2023-03-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(62, '', '', 60, 6, 5, 101, 16, 259, 33, 2, NULL, NULL, 4, '2023-03-25', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(63, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(64, '', '', 60, 1, 5, 101, 1, 1, 29, 3, NULL, NULL, 4, '2022-12-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(65, '', '', 60, 1, 5, 101, 1, 1, 29, 3, NULL, NULL, 4, '2022-12-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(66, '', '', 60, 1, 5, 101, 1, 1, 29, 1, NULL, NULL, 4, '2022-12-06', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(67, '', '', 60, 1, 5, 101, 1, 1, 29, 3, NULL, NULL, 4, '2022-12-21', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(68, '', '', 35, 1, 5, 101, 1, 1, 29, 3, NULL, NULL, 4, '2022-12-28', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(69, '', '', 35, 1, 5, 101, 1, 1, 29, 1, NULL, NULL, 4, '2022-12-06', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(70, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2022-12-21', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(71, '', '', 67, 1, 9, 101, 1, 1, 28, 2, NULL, NULL, 4, '2022-01-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(72, '', '', 60, 3, 5, 101, 19, 295, 33, 2, NULL, NULL, 4, '2023-07-04', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(73, '', '', 70, 3, 5, 101, 21, 317, 33, 1, NULL, NULL, 4, '2023-05-15', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(74, '', '', 67, 1, 9, 101, 1, 1, 28, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(75, '', '', 60, 3, 5, 101, 19, 295, 33, 2, NULL, NULL, 4, '2023-07-15', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(76, '', '', 60, 3, 5, 101, 19, 295, 33, 1, NULL, NULL, 4, '2023-07-25', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(77, '', '', 70, 3, 5, 101, 16, 259, 33, 2, NULL, NULL, 4, '2023-09-14', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(78, '', '', 60, 3, 5, 101, 17, 276, 33, 2, NULL, NULL, 4, '2023-09-14', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(79, '', '', 70, 3, 5, 101, 17, 276, 33, 1, NULL, NULL, 4, '2023-09-14', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(80, '', '', 70, 3, 5, 101, 17, 276, 33, 2, NULL, NULL, 4, '2023-09-14', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(81, '', '', 20, 1, 9, 101, 1, 1, 28, 2, NULL, NULL, 4, '2023-10-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(82, '', '', 20, 1, 9, 101, 1, 1, 28, 2, NULL, NULL, 4, '2023-10-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(83, '', '', 20, 2, 9, 101, 4, 42, 28, 2, NULL, NULL, 4, '2023-10-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(84, '', '', 20, 1, 9, 101, 1, 1, 28, 2, NULL, NULL, 4, '2023-10-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(85, '', '', 70, 5, 5, 101, 1, 1, 26, 2, NULL, NULL, 4, '2023-12-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(86, '', '', 70, 5, 5, 101, 1, 1, 26, 2, NULL, NULL, 4, '2023-12-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(87, '', '', 60, 5, 5, 101, 1, 1, 26, 2, NULL, NULL, 4, '2023-12-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(88, '', '', 60, 5, 5, 101, 1, 1, 26, 2, NULL, NULL, 4, '2024-02-15', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(89, '', '', 70, 5, 5, 101, 17, 276, 33, 2, NULL, NULL, 4, '2023-11-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(90, '', '', 60, 4, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-11-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(91, '', '', 70, 1, 5, 101, 22, 324, 29, 2, NULL, NULL, 4, '2023-11-15', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(92, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-12-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(93, '', '', 60, 5, 5, 101, 1, 1, 26, 2, NULL, NULL, 4, '2024-02-15', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(94, '', '', 60, 5, 5, 101, 1, 1, 26, 2, NULL, NULL, 4, '2024-02-15', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(95, '', '', 23, 5, 5, 101, 1, 1, 26, 1, NULL, NULL, 4, '2024-06-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(96, '', '', 70, 5, 5, 101, 1, 1, 26, 1, NULL, NULL, 4, '2024-07-15', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(97, '', '', 60, 5, 5, 101, 1, 1, 26, 1, NULL, NULL, 4, '2024-06-01', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(98, '', '', 70, 5, 5, 101, 1, 1, 26, 2, NULL, NULL, 4, '2024-05-05', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(99, '', '', 70, 5, 5, 101, 1, 1, 26, 2, NULL, NULL, 4, '2024-05-05', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(100, '', '', 70, 5, 5, 101, 1, 1, 26, 1, NULL, NULL, 4, '2024-05-05', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(101, '', '', 5, 3, 5, 101, 19, 295, 12, 1, NULL, NULL, 1, '2024-04-25', 1, 0, '2024-11-08 20:23:29', '2024-11-08 20:23:29'),
(102, '', '', 60, 3, 5, 101, 19, 295, 12, 2, NULL, NULL, 2, '2023-12-01', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(103, '', '', 60, 3, 5, 101, 19, 295, 12, 2, NULL, NULL, 2, '2024-03-01', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(104, '', '', 60, 3, 5, 101, 19, 295, 12, 2, NULL, NULL, 2, '2024-03-01', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(105, '', '', 70, 3, 5, 101, 19, 295, 12, 2, NULL, NULL, 2, '2024-03-01', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(106, '', '', 70, 3, 5, 101, 19, 295, 12, 2, NULL, NULL, 4, '2023-12-01', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(107, '', '', 60, 3, 5, 101, 19, 295, 12, 2, NULL, NULL, 2, '2024-10-10', 1, 1, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(108, '', '', 70, 3, 5, 101, 19, 295, 12, 2, NULL, NULL, 2, '2024-05-21', 1, 1, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(109, '', '', 70, 3, 5, 101, 19, 295, 12, 2, NULL, NULL, 2, '2024-06-20', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(110, '', '', 70, 3, 5, 101, 20, 306, 12, 2, NULL, NULL, 2, '2024-03-01', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(111, '', '', 60, 3, 5, 101, 18, 290, 12, 2, NULL, NULL, 2, '2024-05-01', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(112, '', '', 60, 3, 5, 101, 18, 290, 12, 2, NULL, NULL, 2, '2024-05-01', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(113, '', '', 70, 6, 5, 101, 16, 259, 10, 2, NULL, NULL, 4, '2024-06-01', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(114, '', '', 60, 6, 5, 101, 16, 259, 10, 2, NULL, NULL, 4, '2024-06-03', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(115, '', '', 60, 6, 5, 101, 16, 259, 10, 2, NULL, NULL, 4, '2024-06-03', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(116, '', '', 60, 3, 5, 101, 21, 317, 12, 2, NULL, NULL, 2, '2024-06-11', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(117, '', '', 35, 3, 5, 101, 19, 295, 12, 2, NULL, NULL, 2, '2024-07-15', 1, 1, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(118, '', '', 70, 3, 5, 101, 19, 295, 12, 2, NULL, NULL, 2, '2024-07-15', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(119, '', '', 5, 3, 5, 101, 19, 295, 12, 2, NULL, NULL, 1, '2024-10-10', 1, 1, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(120, '', '', 70, 5, 5, 101, 17, 276, 26, 2, NULL, NULL, 4, '2024-07-29', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(121, '', '', 60, 5, 5, 101, 17, 276, 26, 2, NULL, NULL, 4, '2024-08-28', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(122, '', '', 60, 5, 5, 101, 17, 276, 26, 2, NULL, NULL, 4, '2024-08-28', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(123, '', '', 60, 5, 5, 101, 17, 276, 26, 2, NULL, NULL, 4, '2024-08-28', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(124, '', '', 70, 6, 5, 101, 16, 259, 10, 2, NULL, NULL, 4, '2024-08-07', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(125, '', '', 60, 6, 5, 101, 1, 1, 10, 1, NULL, NULL, 4, '2024-05-01', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(126, '', '', 60, 6, 5, 101, 1, 1, 10, 1, NULL, NULL, 4, '2024-03-15', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(127, '', '', 70, 6, 5, 101, 1, 1, 10, 1, NULL, NULL, 2, '2024-03-15', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(128, '', '', 70, 1, 5, 101, 22, 324, 29, 2, NULL, NULL, 2, '2024-03-15', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(129, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-03-15', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(130, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-05-25', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(131, '', '', 70, 1, 5, 101, 1, 1, 29, 1, NULL, NULL, 2, '2024-05-25', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(132, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-07-02', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(133, '', '', 70, 1, 5, 101, 22, 324, 29, 2, NULL, NULL, 2, '2024-07-02', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(134, '', '', 70, 1, 5, 101, 22, 324, 29, 2, NULL, NULL, 2, '2024-07-02', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(135, '', '', 70, 1, 5, 101, 22, 324, 29, 1, NULL, NULL, 2, '2024-07-25', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(136, '', '', 70, 3, 5, 101, 19, 295, 12, 2, NULL, NULL, 2, '2024-10-15', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(137, '', '', 60, 5, 5, 101, 17, 276, 26, 2, NULL, NULL, 3, '2024-10-04', 1, 1, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(138, '', '', 70, 6, 5, 101, 16, 259, 10, 2, NULL, NULL, 5, '2024-09-11', 1, 1, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(139, '', '', 70, 6, 5, 101, 16, 259, 10, 2, NULL, NULL, 5, '2024-09-11', 1, 1, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(140, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-07-02', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(141, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-09-05', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(142, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-08-28', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(143, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-09-19', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(144, '', '', 60, 6, 5, 101, 16, 259, 10, 2, NULL, NULL, 4, '2024-10-10', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(145, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-09-25', 1, 1, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(146, '', '', 70, 1, 3, 101, 1, 1, 38, 1, NULL, NULL, 2, '2024-09-25', 1, 1, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(147, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-09-19', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(148, '', '', 60, 1, 5, 101, 1, 1, 38, 1, NULL, NULL, 2, '2024-10-10', 1, 1, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(149, '', '', 5, 1, 3, 101, 1, 1, 38, 1, NULL, NULL, 1, '2024-10-10', 1, 1, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(150, '', '', 67, 1, 3, 101, 1, 1, 38, 1, NULL, NULL, 8, '2024-10-10', 1, 1, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(151, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-07-08', 1, 0, '2024-11-08 20:24:31', '2024-11-08 20:24:31'),
(152, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-06-02', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(153, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-08-20', 1, 1, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(154, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-08-12', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(155, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-07-29', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(156, '', '', 35, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-06-04', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(157, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-06-04', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(158, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-05-30', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(159, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-05-30', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(160, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-05-30', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(161, '', '', 60, 1, 5, 101, 1, 1, 29, 1, NULL, NULL, 2, '2024-03-15', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(162, '', '', 70, 4, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-11-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(163, '', '', 70, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-09-10', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(164, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-09-04', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(165, '', '', 60, 1, 5, 101, 22, 324, 29, 1, NULL, NULL, 2, '2024-10-05', 1, 1, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(166, '', '', 60, 1, 5, 101, 22, 324, 29, 1, NULL, NULL, 2, '2024-10-05', 1, 1, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(167, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-09-04', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(168, '', '', 70, 6, 5, 101, 16, 259, 10, 2, NULL, NULL, 4, '2024-08-19', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(169, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-10-15', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(170, '', '', 70, 1, 5, 101, 22, 324, 29, 2, NULL, NULL, 2, '2024-10-16', 1, 1, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(171, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-10-15', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(172, '', '', 70, 4, 5, 101, 5, 58, 22, 2, NULL, NULL, 4, '2024-06-19', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(173, '', '', 20, 1, 9, 101, 14, 230, 25, 2, NULL, NULL, 1, '2023-10-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(174, '', '', 20, 1, 9, 101, 16, 259, 20, 2, NULL, NULL, 1, '2023-11-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(175, '', '', 20, 1, 9, 101, 17, 276, 20, 2, NULL, NULL, 1, '2023-11-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(176, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 1, '2023-11-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(177, '', '', 20, 2, 9, 101, 7, 86, 28, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(178, '', '', 20, 2, 9, 101, 13, 197, 28, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(179, '', '', 20, 2, 9, 101, 9, 113, 28, 2, NULL, NULL, 4, '2023-01-19', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(180, '', '', 20, 2, 9, 101, 11, 158, 28, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(181, '', '', 20, 2, 9, 101, 13, 197, 28, 2, NULL, NULL, 4, '2023-02-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(182, '', '', 20, 2, 9, 101, 10, 137, 28, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(183, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2022-11-21', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(184, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(185, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2023-01-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(186, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(187, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2022-12-15', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(188, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2023-02-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(189, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(190, '', '', 20, 1, 9, 101, 1, 1, 1, 1, NULL, NULL, 4, '2023-01-23', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(191, '', '', 20, 1, 9, 101, 1, 1, 28, 2, NULL, NULL, 4, '2023-01-31', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(192, '', '', 20, 1, 9, 101, 1, 1, 1, 1, NULL, NULL, 4, '2023-01-23', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(193, '', '', 20, 1, 9, 101, 16, 259, 28, 2, NULL, NULL, 4, '2023-03-01', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(194, '', '', 20, 1, 9, 101, 17, 276, 28, 2, NULL, NULL, 4, '2022-11-14', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(195, '', '', 20, 1, 9, 101, 17, 276, 28, 2, NULL, NULL, 4, '2022-11-14', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(196, '', '', 20, 1, 9, 101, 17, 276, 28, 2, NULL, NULL, 4, '2022-11-14', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(197, '', '', 20, 1, 9, 101, 18, 290, 28, 2, NULL, NULL, 4, '2023-01-07', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(198, '', '', 20, 1, 9, 101, 16, 259, 28, 2, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(199, '', '', 20, 1, 9, 101, 16, 259, 28, 2, NULL, NULL, 4, '2023-05-25', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(200, '', '', 20, 1, 9, 101, 16, 259, 28, 2, NULL, NULL, 4, '2023-06-03', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(201, '', '', 20, 1, 9, 101, 1, 1, 1, 3, NULL, NULL, 4, '2023-02-22', 1, 0, '2024-11-08 20:25:35', '2024-11-08 20:25:35'),
(202, '', '', 20, 1, 9, 101, 1, 1, 28, 2, NULL, NULL, 4, '2023-02-18', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(203, '', '', 20, 1, 9, 101, 5, 58, 13, 2, NULL, NULL, 4, '2023-02-25', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(204, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2023-05-12', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(205, '', '', 20, 1, 9, 101, 1, 1, 28, 1, NULL, NULL, 4, '2023-03-01', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(206, '', '', 20, 1, 9, 101, 1, 1, 28, 1, NULL, NULL, 4, '2023-03-01', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(207, '', '', 20, 1, 9, 101, 1, 1, 28, 1, NULL, NULL, 4, '2023-05-15', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(208, '', '', 20, 1, 9, 101, 1, 1, 1, 3, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(209, '', '', 20, 1, 9, 101, 1, 1, 13, 1, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(210, '', '', 20, 1, 9, 101, 1, 1, 28, 1, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(211, '', '', 20, 1, 9, 101, 4, 42, 28, 1, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(212, '', '', 20, 1, 9, 101, 4, 42, 28, 1, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(213, '', '', 20, 1, 9, 101, 4, 42, 28, 1, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(214, '', '', 20, 1, 9, 101, 1, 1, 28, 1, NULL, NULL, 4, '2023-06-12', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(215, '', '', 20, 1, 9, 101, 1, 1, 28, 1, NULL, NULL, 4, '2023-06-12', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(216, '', '', 20, 1, 9, 101, 4, 42, 28, 1, NULL, NULL, 4, '2023-06-12', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(217, '', '', 20, 1, 9, 101, 4, 42, 28, 1, NULL, NULL, 4, '2023-06-12', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(218, '', '', 20, 1, 9, 101, 4, 42, 28, 1, NULL, NULL, 4, '2023-06-12', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(219, '', '', 20, 1, 9, 101, 8, 105, 28, 1, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(220, '', '', 20, 1, 9, 101, 8, 105, 28, 1, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(221, '', '', 20, 1, 9, 101, 1, 1, 28, 1, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(222, '', '', 20, 1, 9, 101, 17, 276, 28, 2, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(223, '', '', 20, 1, 9, 101, 17, 276, 28, 2, NULL, NULL, 4, '2023-04-01', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(224, '', '', 20, 1, 9, 101, 17, 276, 28, 2, NULL, NULL, 4, '2023-03-25', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(225, '', '', 20, 1, 9, 101, 17, 276, 28, 2, NULL, NULL, 4, '2023-04-01', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(226, '', '', 20, 1, 9, 101, 17, 276, 28, 1, NULL, NULL, 4, '2023-04-01', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(227, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2023-06-30', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(228, '', '', 20, 2, 9, 101, 9, 113, 28, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(229, '', '', 20, 2, 9, 101, 9, 113, 28, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(230, '', '', 20, 2, 9, 101, 8, 105, 28, 1, NULL, NULL, 4, '2023-07-01', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(231, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(232, '', '', 70, 4, 5, 101, 5, 58, 22, 2, NULL, NULL, 4, '2024-07-17', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(233, '', '', 60, 4, 5, 101, 5, 58, 22, 2, NULL, NULL, 4, '2024-06-12', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(234, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 2, '2024-10-26', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(235, '', '', 70, 5, 5, 101, 17, 276, 26, 2, NULL, NULL, 3, '2024-11-06', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(236, '', '', 70, 4, 5, 101, 5, 58, 22, 2, NULL, NULL, 3, '2024-08-14', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(237, '', '', 70, 4, 5, 101, 5, 58, 22, 2, NULL, NULL, 3, '2024-09-30', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(238, '', '', 70, 4, 5, 101, 5, 58, 22, 2, NULL, NULL, 3, '2024-10-25', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(239, '', '', 60, 4, 5, 101, 5, 58, 22, 2, NULL, NULL, 3, '2024-10-25', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(240, '', '', 60, 4, 5, 101, 5, 58, 22, 2, NULL, NULL, 3, '2024-09-23', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(241, '', '', 60, 4, 5, 101, 5, 58, 22, 2, NULL, NULL, 4, '2024-06-19', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(242, '', '', 20, 1, 9, 101, 1, 1, 15, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(243, '', '', 20, 1, 9, 101, 1, 1, 15, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(244, '', '', 20, 1, 9, 101, 1, 1, 1, 7, NULL, NULL, 9, '2024-07-29', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(245, '', '', 20, 1, 9, 101, 1, 1, 13, 7, NULL, NULL, 6, '2024-10-15', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(246, '', '', 20, 1, 9, 101, 1, 1, 39, 7, NULL, NULL, 9, '2024-09-04', 1, 0, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(247, '', '', 20, 1, 9, 101, 1, 1, 1, 7, NULL, NULL, 6, '2024-10-28', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(248, '', '', 20, 1, 9, 101, 1, 1, 40, 7, NULL, NULL, 3, '2024-10-28', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(249, '', '', 20, 1, 9, 101, 1, 1, 1, 7, NULL, NULL, 6, '2024-11-05', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(250, '', '', 20, 1, 9, 101, 1, 1, 1, 7, NULL, NULL, 6, '2024-10-26', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(251, '', '', 20, 1, 9, 101, 1, 1, 39, 7, NULL, NULL, 2, '2024-10-21', 1, 1, '2024-11-08 20:26:45', '2024-11-08 20:26:45'),
(252, '', '', 20, 1, 9, 101, 1, 1, 39, 7, NULL, NULL, 2, '2024-10-03', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(253, '', '', 20, 1, 9, 101, 1, 1, 39, 7, NULL, NULL, 2, '2024-10-14', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(254, '', '', 20, 1, 9, 101, 1, 1, 39, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(255, '', '', 20, 1, 9, 101, 1, 1, 15, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(256, '', '', 20, 1, 9, 101, 1, 1, 15, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(257, '', '', 20, 1, 9, 101, 1, 1, 13, 7, NULL, NULL, 6, '2024-08-19', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(258, '', '', 20, 2, 9, 101, 1, 1, 25, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(259, '', '', 20, 2, 9, 101, 1, 1, 25, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(260, '', '', 20, 2, 9, 101, 1, 1, 25, 7, NULL, NULL, 5, '2024-06-02', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(261, '', '', 20, 2, 9, 101, 1, 1, 25, 7, NULL, NULL, 5, '2024-09-25', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(262, '', '', 20, 2, 9, 101, 1, 1, 25, 7, NULL, NULL, 5, '2024-06-02', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(263, '', '', 20, 2, 9, 101, 1, 1, 25, 2, NULL, NULL, 9, '2024-08-05', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(264, '', '', 20, 2, 9, 101, 1, 1, 25, 7, NULL, NULL, 5, '2024-06-02', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(265, '', '', 20, 1, 9, 101, 1, 1, 13, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(266, '', '', 20, 1, 9, 101, 1, 1, 13, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(267, '', '', 20, 4, 9, 101, 1, 1, 13, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(268, '', '', 20, 4, 9, 101, 1, 1, 13, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(269, '', '', 20, 4, 9, 101, 1, 1, 13, 7, NULL, NULL, 6, '2024-09-25', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(270, '', '', 20, 1, 9, 101, 1, 1, 1, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(271, '', '', 20, 1, 9, 101, 1, 1, 1, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(272, '', '', 20, 1, 9, 101, 1, 1, 1, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(273, '', '', 20, 1, 9, 101, 1, 1, 1, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(274, '', '', 20, 3, 9, 101, 1, 1, 20, 7, NULL, NULL, 9, '2024-06-02', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(275, '', '', 20, 1, 9, 101, 1, 1, 15, 2, NULL, NULL, 7, '2024-06-01', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(276, '', '', 20, 2, 9, 101, 1, 1, 25, 2, NULL, NULL, 4, '2024-06-01', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(277, '', '', 20, 2, 9, 101, 1, 1, 25, 2, NULL, NULL, 7, '2024-06-01', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(278, '', '', 20, 2, 9, 101, 1, 1, 25, 2, NULL, NULL, 4, '2024-07-08', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(279, '', '', 20, 2, 9, 101, 1, 1, 25, 6, NULL, NULL, 5, '2024-07-08', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(280, '', '', 20, 2, 9, 101, 1, 1, 25, 2, NULL, NULL, 4, '2024-07-22', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(281, '', '', 20, 2, 9, 101, 1, 1, 25, 2, NULL, NULL, 4, '2024-07-22', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(282, '', '', 20, 2, 9, 101, 1, 1, 25, 2, NULL, NULL, 5, '2024-09-21', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(283, '', '', 20, 2, 9, 101, 9, 113, 25, 1, NULL, NULL, 4, '2024-08-13', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(284, '', '', 20, 2, 9, 101, 9, 113, 25, 1, NULL, NULL, 4, '2024-08-13', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(285, '', '', 20, 2, 9, 101, 14, 230, 25, 2, NULL, NULL, 4, '2024-07-08', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(286, '', '', 20, 2, 9, 101, 1, 1, 25, 2, NULL, NULL, 4, '2024-06-01', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(287, '', '', 20, 2, 9, 101, 1, 1, 25, 2, NULL, NULL, 4, '2024-06-11', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(288, '', '', 20, 1, 9, 101, 1, 1, 15, 7, NULL, NULL, 9, '2024-07-17', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(289, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 2, '2024-07-29', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(290, '', '', 20, 1, 9, 101, 1, 1, 39, 7, NULL, NULL, 2, '2024-10-29', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(291, '', '', 20, 1, 9, 101, 1, 1, 39, 2, NULL, NULL, 2, '2024-08-19', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(292, '', '', 20, 1, 9, 101, 1, 1, 39, 2, NULL, NULL, 2, '2024-08-19', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(293, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 6, '2024-07-10', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(294, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 2, '2024-08-14', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(295, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2024-07-08', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(296, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 6, '2024-10-19', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(297, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 6, '2024-06-01', 1, 1, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(298, '', '', 20, 1, 9, 101, 1, 1, 1, 1, NULL, NULL, 2, '2024-06-01', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(299, '', '', 20, 1, 9, 101, 1, 1, 1, 1, NULL, NULL, 2, '2024-06-07', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(300, '', '', 20, 1, 9, 101, 1, 1, 1, 1, NULL, NULL, 2, '2024-06-07', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(301, '', '', 20, 5, 9, 101, 1, 1, 20, 2, NULL, NULL, 4, '2024-06-01', 1, 0, '2024-11-08 20:28:08', '2024-11-08 20:28:08'),
(302, '', '', 20, 5, 9, 101, 17, 276, 20, 2, NULL, NULL, 4, '2024-07-11', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(303, '', '', 20, 5, 9, 101, 1, 1, 20, 2, NULL, NULL, 4, '2024-06-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(304, '', '', 20, 5, 9, 101, 17, 276, 20, 2, NULL, NULL, 4, '2024-07-22', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(305, '', '', 20, 5, 9, 101, 17, 276, 20, 2, NULL, NULL, 4, '2024-07-22', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(306, '', '', 20, 5, 9, 101, 1, 1, 40, 2, NULL, NULL, 3, '2024-06-01', 1, 1, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(307, '', '', 20, 5, 9, 101, 1, 1, 40, 2, NULL, NULL, 3, '2024-06-01', 1, 1, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(308, '', '', 20, 1, 9, 101, 1, 1, 20, 2, NULL, NULL, 7, '2024-06-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(309, '', '', 20, 1, 9, 101, 1, 1, 20, 1, NULL, NULL, 7, '2024-06-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(310, '', '', 20, 1, 9, 101, 1, 1, 20, 1, NULL, NULL, 4, '2024-06-24', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(311, '', '', 20, 1, 9, 101, 1, 1, 20, 1, NULL, NULL, 4, '2024-06-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(312, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 4, '2024-07-08', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(313, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 2, '2024-06-10', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(314, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 7, '2024-06-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(315, '', '', 20, 1, 9, 101, 1, 1, 13, 1, NULL, NULL, 7, '2024-06-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(316, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 2, '2024-06-13', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(317, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 2, '2024-06-13', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(318, '', '', 20, 1, 9, 101, 1, 1, 13, 1, NULL, NULL, 7, '2024-06-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(319, '', '', 20, 1, 9, 101, 1, 1, 13, 1, NULL, NULL, 7, '2024-06-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(320, '', '', 20, 1, 9, 101, 1, 1, 13, 1, NULL, NULL, 2, '2024-06-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(321, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 2, '2024-08-28', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(322, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 2, '2024-08-28', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(323, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 6, '2024-08-28', 1, 1, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(324, '', '', 20, 1, 9, 101, 1, 1, 13, 6, NULL, NULL, 2, '2024-06-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(325, '', '', 20, 1, 9, 101, 1, 1, 15, 7, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(326, '', '', 20, 1, 9, 101, 1, 1, 1, 7, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(327, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(328, '', '', 20, 1, 9, 101, 4, 42, 15, 7, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(329, '', '', 20, 1, 9, 101, 22, 324, 20, 1, NULL, NULL, 4, '2023-08-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(330, '', '', 20, 1, 9, 101, 1, 1, 15, 1, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(331, '', '', 20, 1, 9, 101, 1, 1, 1, 6, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(332, '', '', 20, 1, 9, 101, 1, 1, 1, 6, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(333, '', '', 20, 1, 9, 101, 1, 1, 15, 1, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(334, '', '', 20, 1, 9, 101, 1, 1, 15, 7, NULL, NULL, 4, '2023-10-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(335, '', '', 20, 1, 9, 101, 4, 42, 15, 1, NULL, NULL, 4, '2023-12-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(336, '', '', 20, 1, 9, 101, 2, 18, 20, 1, NULL, NULL, 4, '2023-11-27', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(337, '', '', 20, 1, 9, 101, 2, 18, 20, 1, NULL, NULL, 4, '2023-11-27', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(338, '', '', 20, 1, 9, 101, 17, 276, 1, 1, NULL, NULL, 4, '2023-11-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(339, '', '', 20, 1, 9, 101, 17, 276, 1, 2, NULL, NULL, 4, '2023-11-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(340, '', '', 20, 1, 9, 101, 16, 259, 1, 2, NULL, NULL, 4, '2023-11-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(341, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 4, '2023-11-27', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(342, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 4, '2023-11-27', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(343, '', '', 20, 2, 9, 101, 14, 230, 28, 2, NULL, NULL, 4, '2023-08-15', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(344, '', '', 20, 2, 9, 101, 1, 1, 28, 2, NULL, NULL, 4, '2023-07-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(345, '', '', 20, 1, 9, 101, 1, 1, 1, 1, NULL, NULL, 4, '2023-08-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(346, '', '', 20, 1, 9, 101, 1, 1, 28, 1, NULL, NULL, 4, '2023-08-22', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(347, '', '', 20, 1, 9, 101, 1, 1, 28, 1, NULL, NULL, 4, '2023-08-22', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(348, '', '', 20, 2, 9, 101, 1, 1, 28, 1, NULL, NULL, 4, '2023-08-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(349, '', '', 20, 2, 9, 101, 13, 197, 28, 1, NULL, NULL, 4, '2023-08-01', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(350, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2023-05-25', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(351, '', '', 20, 1, 9, 101, 1, 1, 1, 1, NULL, NULL, 4, '2023-06-12', 1, 0, '2024-11-08 20:29:09', '2024-11-08 20:29:09'),
(352, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2023-06-12', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(353, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 4, '2023-06-12', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(354, '', '', 20, 1, 9, 101, 5, 58, 13, 2, NULL, NULL, 4, '2023-06-12', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(355, '', '', 20, 1, 9, 101, 17, 276, 28, 2, NULL, NULL, 4, '2023-06-12', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(356, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 4, '2023-07-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(357, '', '', 20, 2, 9, 101, 14, 230, 28, 2, NULL, NULL, 4, '2023-07-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(358, '', '', 20, 1, 9, 101, 17, 276, 20, 2, NULL, NULL, 4, '2023-06-12', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(359, '', '', 20, 1, 9, 101, 17, 276, 20, 2, NULL, NULL, 4, '2023-10-25', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(360, '', '', 20, 1, 9, 101, 17, 276, 20, 2, NULL, NULL, 4, '2023-10-25', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(361, '', '', 20, 1, 9, 101, 22, 324, 20, 2, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(362, '', '', 20, 1, 9, 101, 4, 42, 15, 2, NULL, NULL, 4, '2023-07-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(363, '', '', 20, 1, 9, 101, 4, 42, 15, 2, NULL, NULL, 4, '2023-07-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(364, '', '', 20, 1, 9, 101, 4, 42, 15, 2, NULL, NULL, 4, '2023-07-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(365, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2023-06-12', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(366, '', '', 20, 1, 9, 101, 22, 324, 20, 2, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(367, '', '', 20, 1, 9, 101, 22, 324, 20, 2, NULL, NULL, 4, '2023-03-22', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(368, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 4, '2023-07-04', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(369, '', '', 70, 1, 8, 101, 1, 1, 30, 2, NULL, NULL, 4, '2022-12-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(370, '', '', 70, 1, 8, 101, 22, 324, 30, 2, NULL, NULL, 4, '2022-12-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(371, '', '', 7, 1, 1, 101, 1, 1, 4, 2, NULL, NULL, 4, '2022-11-14', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(372, '', '', 67, 1, 4, 101, 1, 1, 34, 1, NULL, NULL, 4, '2022-12-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(373, '', '', 70, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(374, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(375, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(376, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(377, '', '', 35, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2022-11-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(378, '', '', 67, 1, 9, 101, 19, 295, 28, 2, NULL, NULL, 4, '2022-12-02', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(379, '', '', 70, 1, 5, 101, 22, 324, 29, 2, NULL, NULL, 4, '2022-12-02', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(380, '', '', 47, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2022-10-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(381, '', '', 5, 2, 1, 101, 9, 113, 32, 2, NULL, NULL, 4, '2022-12-19', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(382, '', '', 5, 1, 9, 101, 1, 1, 28, 2, NULL, NULL, 4, '2022-12-20', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(383, '', '', 35, 1, 1, 101, 1, 1, 37, 2, NULL, NULL, 4, '2022-12-22', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(384, '', '', 70, 2, 5, 101, 14, 230, 29, 2, NULL, NULL, 4, '2023-01-02', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(385, '', '', 60, 2, 5, 101, 13, 197, 32, 2, NULL, NULL, 4, '2022-06-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(386, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-01-02', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(387, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 4, '2023-05-20', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(388, '', '', 20, 1, 9, 101, 13, 197, 25, 2, NULL, NULL, 4, '2023-06-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(389, '', '', 60, 6, 5, 101, 16, 259, 33, 2, NULL, NULL, 4, '2023-07-14', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(390, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 4, '2023-12-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(391, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 4, '2023-11-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(392, '', '', 20, 2, 9, 101, 14, 230, 28, 2, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(393, '', '', 20, 1, 9, 101, 5, 58, 13, 6, NULL, NULL, 4, '2023-06-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(394, '', '', 20, 1, 9, 101, 17, 276, 20, 2, NULL, NULL, 4, '2023-06-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(395, '', '', 20, 1, 9, 101, 1, 1, 15, 6, NULL, NULL, 4, '2023-06-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(396, '', '', 20, 1, 9, 101, 22, 324, 20, 1, NULL, NULL, 4, '2023-06-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(397, '', '', 20, 1, 9, 101, 1, 1, 15, 2, NULL, NULL, 4, '2023-06-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(398, '', '', 20, 1, 9, 101, 13, 197, 25, 1, NULL, NULL, 4, '2023-06-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(399, '', '', 68, 2, 4, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-07-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(400, '', '', 5, 1, 1, 101, 1, 1, 35, 2, NULL, NULL, 4, '2023-08-01', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(401, '', '', 67, 3, 5, 101, 17, 276, 33, 2, NULL, NULL, 4, '2023-06-10', 1, 0, '2024-11-08 20:30:07', '2024-11-08 20:30:07'),
(402, '', '', 67, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-06-10', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(403, '', '', 35, 2, 5, 101, 13, 197, 32, 1, NULL, NULL, 4, '2023-04-21', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(404, '', '', 60, 1, 5, 101, 1, 1, 29, 2, NULL, NULL, 4, '2023-01-16', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11');
INSERT INTO `vacantes` (`id`, `codigo`, `nombre`, `puestos_id`, `costos1_id`, `costos2_id`, `costos3_id`, `departamentos_id`, `municipios_id`, `jefes_id`, `tipoVacante_id`, `empleados_id_1`, `empleados_id_2`, `reclutadores_id`, `fecha`, `cantidad`, `vigente`, `created_at`, `updated_at`) VALUES
(405, '', '', 23, 3, 5, 101, 19, 295, 33, 2, NULL, NULL, 4, '2023-01-18', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(406, '', '', 70, 2, 5, 101, 13, 197, 32, 1, NULL, NULL, 4, '2023-04-21', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(407, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-03-13', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(408, '', '', 70, 3, 5, 101, 21, 317, 33, 2, NULL, NULL, 4, '2023-01-18', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(409, '', '', 41, 1, 1, 101, 1, 1, 31, 1, NULL, NULL, 4, '2023-02-25', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(410, '', '', 23, 1, 1, 101, 1, 1, 31, 1, NULL, NULL, 4, '2023-07-01', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(411, '', '', 5, 2, 1, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-07-14', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(412, '', '', 70, 2, 5, 101, 9, 113, 32, 1, NULL, NULL, 4, '2022-06-01', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(413, '', '', 70, 2, 5, 101, 9, 113, 32, 1, NULL, NULL, 4, '2022-06-01', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(414, '', '', 60, 2, 5, 101, 14, 230, 32, 1, NULL, NULL, 4, '2023-03-07', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(415, '', '', 60, 2, 5, 101, 14, 230, 32, 1, NULL, NULL, 4, '2023-03-07', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(416, '', '', 70, 2, 5, 101, 14, 230, 32, 1, NULL, NULL, 4, '2023-03-07', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(417, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-03-31', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(418, '', '', 67, 2, 5, 101, 13, 197, 32, 1, NULL, NULL, 4, '2023-01-01', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(419, '', '', 60, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-01-31', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(420, '', '', 23, 1, 4, 101, 1, 1, 34, 3, NULL, NULL, 4, '2023-01-31', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(421, '', '', 23, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-02-07', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(422, '', '', 35, 1, 1, 101, 1, 1, 36, 2, NULL, NULL, 4, '2023-02-14', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(423, '', '', 35, 1, 9, 101, 1, 1, 28, 2, NULL, NULL, 4, '2023-03-03', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(424, '', '', 35, 1, 1, 101, 1, 1, 37, 2, NULL, NULL, 4, '2023-04-05', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(425, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-03-31', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(426, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-07-31', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(427, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-07-31', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(428, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-07-31', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(429, '', '', 20, 1, 9, 101, 17, 276, 20, 2, NULL, NULL, 4, '2023-10-25', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(430, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-07-31', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(431, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-07-31', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(432, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-07-31', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(433, '', '', 70, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(434, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(435, '', '', 70, 2, 5, 101, 9, 113, 16, 2, NULL, NULL, 4, '2024-01-01', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(436, '', '', 20, 1, 9, 101, 1, 1, 13, 2, NULL, NULL, 2, '2024-08-19', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(437, '', '', 20, 1, 9, 101, 1, 1, 39, 1, NULL, NULL, 9, '2024-08-30', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(438, '', '', 20, 1, 9, 101, 1, 1, 39, 1, NULL, NULL, 2, '2024-08-30', 1, 1, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(439, '', '', 20, 2, 9, 101, 1, 1, 25, 2, NULL, NULL, 5, '2024-10-30', 1, 1, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(440, '', '', 20, 2, 9, 101, 1, 1, 25, 2, NULL, NULL, 5, '2024-10-30', 1, 1, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(441, '', '', 20, 1, 9, 101, 1, 1, 25, 2, NULL, NULL, 5, '2024-10-10', 1, 1, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(442, '', '', 20, 1, 9, 101, 8, 105, 25, 1, NULL, NULL, 5, '2024-08-30', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(443, '', '', 20, 1, 9, 101, 8, 105, 25, 1, NULL, NULL, 4, '2024-08-30', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(444, '', '', 20, 1, 9, 101, 1, 1, 40, 1, NULL, NULL, 3, '2024-08-30', 1, 1, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(445, '', '', 20, 1, 9, 101, 1, 1, 40, 1, NULL, NULL, 3, '2024-08-30', 1, 1, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(446, '', '', 20, 1, 9, 101, 1, 1, 40, 1, NULL, NULL, 3, '2024-08-30', 1, 1, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(447, '', '', 20, 1, 9, 101, 1, 1, 40, 1, NULL, NULL, 3, '2024-08-30', 1, 1, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(448, '', '', 20, 1, 9, 101, 1, 1, 40, 1, NULL, NULL, 3, '2024-10-26', 1, 1, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(449, '', '', 20, 1, 9, 101, 14, 230, 25, 2, NULL, NULL, 4, '2024-09-12', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(450, '', '', 20, 1, 9, 101, 1, 1, 39, 1, NULL, NULL, 2, '2024-08-30', 1, 0, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(451, '', '', 20, 1, 9, 101, 1, 1, 39, 1, NULL, NULL, 2, '2024-08-30', 1, 1, '2024-11-08 20:31:11', '2024-11-08 20:31:11'),
(452, '', '', 20, 1, 9, 101, 1, 1, 39, 1, NULL, NULL, 2, '2024-08-30', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(453, '', '', 20, 1, 9, 101, 1, 1, 1, 1, NULL, NULL, 6, '2024-08-30', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(454, '', '', 20, 1, 9, 101, 1, 1, 1, 1, NULL, NULL, 6, '2024-08-30', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(455, '', '', 20, 1, 9, 101, 1, 1, 13, 1, NULL, NULL, 6, '2024-09-11', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(456, '', '', 20, 1, 9, 101, 1, 1, 13, 1, NULL, NULL, 6, '2024-09-11', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(457, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 6, '2024-09-21', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(458, '', '', 20, 1, 9, 101, 1, 1, 1, 1, NULL, NULL, 6, '2024-09-11', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(459, '', '', 20, 1, 9, 101, 1, 1, 1, 2, NULL, NULL, 6, '2024-10-19', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(460, '', '', 20, 1, 9, 101, 1, 1, 40, 1, NULL, NULL, 3, '2024-08-30', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(461, '', '', 20, 1, 9, 101, 1, 1, 1, 1, NULL, NULL, 6, '2024-08-30', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(462, '', '', 20, 1, 9, 101, 1, 1, 1, 1, NULL, NULL, 6, '2024-08-30', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(463, '', '', 70, 2, 5, 101, 14, 230, 16, 2, NULL, NULL, 3, '2024-01-01', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(464, '', '', 70, 2, 5, 101, 9, 113, 16, 2, NULL, NULL, 3, '2024-06-20', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(465, '', '', 70, 2, 5, 101, 9, 113, 24, 2, NULL, NULL, 3, '2024-07-18', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(466, '', '', 70, 2, 5, 101, 12, 167, 24, 2, NULL, NULL, 4, '2024-06-10', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(467, '', '', 70, 2, 5, 101, 9, 113, 16, 1, NULL, NULL, 4, '2024-06-01', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(468, '', '', 60, 2, 5, 101, 9, 113, 16, 2, NULL, NULL, 4, '2023-06-20', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(469, '', '', 60, 2, 5, 101, 9, 113, 16, 2, NULL, NULL, 4, '2023-06-20', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(470, '', '', 60, 2, 5, 101, 9, 113, 24, 2, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(471, '', '', 60, 2, 5, 101, 9, 113, 16, 1, NULL, NULL, 4, '2024-07-18', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(472, '', '', 60, 2, 5, 101, 9, 113, 16, 1, NULL, NULL, 4, '2024-07-18', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(473, '', '', 60, 2, 5, 101, 9, 113, 16, 2, NULL, NULL, 4, '2024-07-09', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(474, '', '', 60, 2, 5, 101, 9, 113, 16, 2, NULL, NULL, 4, '2024-07-09', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(475, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(476, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-12-01', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(477, '', '', 60, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-12-01', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(478, '', '', 70, 2, 5, 101, 9, 113, 24, 2, NULL, NULL, 4, '2024-09-19', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(479, '', '', 60, 2, 5, 101, 9, 113, 16, 2, NULL, NULL, 4, '2024-09-04', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(480, '', '', 70, 2, 5, 101, 9, 113, 16, 2, NULL, NULL, 3, '2024-10-15', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(481, '', '', 60, 2, 5, 101, 9, 113, 16, 2, NULL, NULL, 3, '2024-10-16', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(482, '', '', 23, 2, 4, 101, 9, 113, 32, 2, NULL, NULL, 3, '2024-09-04', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(483, '', '', 23, 1, 9, 101, 1, 1, 28, 2, NULL, NULL, 2, '2024-08-19', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(484, '', '', 60, 2, 5, 101, 13, 197, 5, 2, NULL, NULL, 4, '2024-06-28', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(485, '', '', 23, 2, 5, 101, 9, 113, 16, 2, NULL, NULL, 4, '2024-06-28', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(486, '', '', 70, 2, 5, 101, 9, 113, 16, 2, NULL, NULL, 4, '2024-09-01', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(487, '', '', 60, 2, 5, 101, 13, 197, 5, 1, NULL, NULL, 3, '2024-09-06', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(488, '', '', 35, 2, 5, 101, 13, 197, 5, 2, NULL, NULL, 3, '2024-09-25', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(489, '', '', 70, 2, 5, 101, 13, 197, 5, 1, NULL, NULL, 3, '2024-09-06', 1, 1, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(490, '', '', 35, 2, 5, 101, 9, 113, 24, 2, NULL, NULL, 4, '2024-05-01', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(491, '', '', 47, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-07-31', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(492, '', '', 70, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-08-01', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(493, '', '', 70, 2, 5, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-08-01', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(494, '', '', 68, 1, 1, 101, 1, 1, 35, 2, NULL, NULL, 4, '2023-10-01', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(495, '', '', 47, 3, 5, 101, 19, 295, 33, 1, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(496, '', '', 47, 1, 4, 101, 1, 1, 34, 1, NULL, NULL, 4, '2023-10-01', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(497, '', '', 23, 1, 4, 101, 1, 1, 34, 1, NULL, NULL, 4, '2023-09-15', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(498, '', '', 23, 1, 4, 101, 9, 113, 32, 2, NULL, NULL, 4, '2023-09-15', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(499, '', '', 23, 1, 4, 101, 1, 1, 34, 1, NULL, NULL, 4, '2023-09-15', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(500, '', '', 23, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-09-15', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(501, '', '', 23, 1, 4, 101, 1, 1, 27, 2, NULL, NULL, 2, '2024-05-20', 1, 0, '2024-11-08 20:32:18', '2024-11-08 20:32:18'),
(502, '', '', 35, 1, 8, 101, 1, 1, 30, 1, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(503, '', '', 23, 1, 1, 101, 1, 1, 4, 2, NULL, NULL, 4, '2023-07-14', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(504, '', '', 9, 1, 1, 101, 1, 1, 35, 2, NULL, NULL, 4, '2023-06-14', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(505, '', '', 5, 1, 8, 101, 1, 1, 37, 2, NULL, NULL, 4, '2023-05-08', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(506, '', '', 23, 1, 1, 101, 1, 1, 31, 2, NULL, NULL, 4, '2023-10-15', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(507, '', '', 23, 1, 4, 101, 1, 1, 27, 2, NULL, NULL, 2, '2024-06-25', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(508, '', '', 23, 1, 4, 101, 1, 1, 27, 2, NULL, NULL, 2, '2024-06-24', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(509, '', '', 23, 1, 4, 101, 1, 1, 27, 2, NULL, NULL, 2, '2024-07-05', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(510, '', '', 60, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 2, '2024-08-21', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(511, '', '', 60, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 2, '2024-10-15', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(512, '', '', 23, 2, 4, 101, 9, 113, 32, 2, NULL, NULL, 3, '2024-09-04', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(513, '', '', 60, 2, 4, 101, 9, 113, 32, 2, NULL, NULL, 4, '2024-09-12', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(514, '', '', 60, 2, 4, 101, 9, 113, 32, 2, NULL, NULL, 3, '2024-09-19', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(515, '', '', 60, 2, 4, 101, 9, 113, 32, 2, NULL, NULL, 3, '2024-11-06', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(516, '', '', 23, 2, 1, 101, 9, 113, 32, 2, NULL, NULL, 3, '2024-09-10', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(517, '', '', 21, 1, 9, 101, 1, 1, 9, 2, NULL, NULL, 3, '2024-10-10', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(518, '', '', 23, 1, 1, 101, 1, 1, 31, 6, NULL, NULL, 5, '2024-11-05', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(519, '', '', 23, 1, 4, 101, 1, 1, 27, 2, NULL, NULL, 2, '2024-07-19', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(520, '', '', 23, 1, 4, 101, 1, 1, 27, 2, NULL, NULL, 2, '2024-07-19', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(521, '', '', 23, 1, 4, 101, 1, 1, 27, 2, NULL, NULL, 2, '2024-05-31', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(522, '', '', 60, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 2, '2024-03-01', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(523, '', '', 68, 1, 4, 101, 1, 1, 11, 2, NULL, NULL, 2, '2024-04-01', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(524, '', '', 23, 1, 4, 101, 1, 1, 21, 2, NULL, NULL, 2, '2024-07-10', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(525, '', '', 21, 1, 9, 101, 1, 1, 9, 2, NULL, NULL, 4, '2024-05-15', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(526, '', '', 47, 1, 1, 101, 1, 1, 31, 2, NULL, NULL, 4, '2023-11-17', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(527, '', '', 23, 1, 1, 101, 1, 1, 35, 2, NULL, NULL, 4, '2023-12-01', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(528, '', '', 47, 3, 5, 101, 19, 295, 33, 2, NULL, NULL, 4, '2023-12-04', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(529, '', '', 47, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-04-10', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(530, '', '', 47, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-06-10', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(531, '', '', 23, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-06-01', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(532, '', '', 23, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-06-30', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(533, '', '', 23, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-07-20', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(534, '', '', 23, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-08-01', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(535, '', '', 23, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-09-01', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(536, '', '', 60, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-06-10', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(537, '', '', 23, 1, 4, 101, 1, 1, 34, 2, NULL, NULL, 4, '2023-04-10', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(538, '', '', 23, 1, 4, 101, 1, 1, 27, 2, NULL, NULL, 2, '2024-08-07', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(539, '', '', 35, 1, 8, 101, 16, 259, 30, 2, NULL, NULL, 1, '2024-03-01', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(540, '', '', 23, 1, 1, 101, 1, 1, 31, 6, NULL, NULL, 1, '2024-06-05', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(541, '', '', 67, 1, 9, 101, 1, 1, 37, 1, NULL, NULL, 8, '2024-09-30', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(542, '', '', 35, 1, 8, 101, 1, 1, 30, 1, NULL, NULL, 1, '2024-09-30', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(543, '', '', 67, 1, 1, 101, 1, 1, 36, 1, NULL, NULL, 1, '2024-07-01', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(544, '', '', 67, 1, 1, 101, 1, 1, 36, 1, NULL, NULL, 1, '2024-07-01', 1, 0, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(545, '', '', 35, 1, 8, 101, 1, 1, 30, 2, NULL, NULL, 1, '2024-11-06', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(546, '', '', 75, 1, 1, 101, 1, 1, 36, 2, NULL, NULL, 1, '2024-10-23', 1, 1, '2024-11-08 20:33:23', '2024-11-08 20:33:23'),
(547, 'PREVENTA', 'UN PREVENTA', 1, 1, 1, 1, 16, 52, 1, 1, NULL, NULL, 1, '2024-11-11', 1, 0, '2024-11-11 22:23:12', '2024-11-11 22:23:12'),
(548, '54', 'AUXILIAR CONTABLE', 7, 1, 1, 101, 1, 1, 4, 6, NULL, NULL, 5, '2024-11-11', 1, 0, '2024-11-11 22:32:12', '2024-11-11 22:32:12'),
(549, '50', 'PILOTO', 59, 2, 5, 128, 9, 113, 10, 1, NULL, NULL, 5, '2024-11-11', 2, 0, '2024-11-11 22:34:48', '2024-11-11 22:34:48'),
(550, '2', 'ASISTENTE DE RECURSOS HUMANOS', 14, 1, 1, 102, 1, 1, 37, 3, NULL, NULL, 1, '2024-11-11', 2, 0, '2024-11-11 22:41:53', '2024-11-11 22:41:53'),
(551, 'JC01', 'ENCARGADO DE SOPORTE', 9, 1, 1, 101, 1, 1, 35, 2, NULL, NULL, 3, '2024-11-11', 10, 1, '2024-11-11 22:46:30', '2024-11-11 22:46:30'),
(552, 'V001', 'AUXILIAR CONTABLE', 12, 1, 1, 1, 16, 52, 1, 1, NULL, NULL, 1, '2024-11-12', 1, 1, '2024-11-12 03:22:26', '2024-11-12 03:22:26'),
(553, NULL, NULL, 1, 1, 1, 1, 16, 52, 1, 1, NULL, NULL, 1, '2024-11-13', 1, 1, '2024-11-13 22:05:48', '2024-11-13 22:05:48'),
(554, NULL, NULL, 2, 2, 4, 10, 3, 126, 2, 1, NULL, NULL, 7, '2024-11-13', 1, 1, '2024-11-13 22:09:19', '2024-11-13 22:09:19'),
(555, NULL, NULL, 1, 1, 1, 1, 3, 118, 4, 1, NULL, NULL, 3, '2024-11-13', 1, 1, '2024-11-13 22:15:40', '2024-11-13 22:15:40'),
(556, NULL, NULL, 1, 1, 1, 1, 16, 52, 1, 1, NULL, NULL, 1, '2024-11-13', 1, 1, '2024-11-13 22:24:16', '2024-11-13 22:24:16'),
(557, NULL, NULL, 1, 1, 1, 1, 16, 52, 1, 1, NULL, NULL, 1, '2024-11-13', 1, 1, '2024-11-13 22:27:14', '2024-11-13 22:27:14'),
(558, NULL, NULL, 1, 1, 1, 1, 16, 52, 1, 1, NULL, NULL, 1, '2024-11-13', 1, 1, '2024-11-13 22:28:35', '2024-11-13 22:28:35'),
(559, NULL, NULL, 1, 1, 1, 1, 16, 52, 1, 1, NULL, NULL, 1, '2024-11-13', 1, 1, '2024-11-13 22:31:04', '2024-11-13 22:31:04'),
(560, NULL, NULL, 7, 1, 1, 8, 16, 52, 1, 1, NULL, NULL, 1, '2024-11-13', 1, 0, '2024-11-13 22:34:50', '2024-11-13 22:34:50'),
(561, NULL, NULL, 2, 3, 4, 14, 22, 125, 1, 1, NULL, NULL, 1, '2024-11-13', 1, 1, '2024-11-13 22:37:36', '2024-11-13 22:37:36'),
(562, NULL, NULL, 19, 3, 4, 9, 1, 14, 9, 4, NULL, NULL, 6, '2024-11-14', 1, 1, '2024-11-14 18:52:52', '2024-11-14 18:52:52');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ascendencias`
--
ALTER TABLE `ascendencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bonos`
--
ALTER TABLE `bonos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bonos_empleados` (`empleados_id`),
  ADD KEY `fk_bonos_periodos` (`periodos_id`);

--
-- Indices de la tabla `comisiones`
--
ALTER TABLE `comisiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comisiones_empleados` (`empleados_id`),
  ADD KEY `fk_comisiones_periodos` (`periodos_id`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contactos_empleados` (`empleados_id`),
  ADD KEY `fk_contactos_tipoContacto` (`tipoContacto_id`),
  ADD KEY `fk_contactos_departamento` (`departamento_id`),
  ADD KEY `fk_contactos_municipio` (`municipio_id`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contratos_tipoContrato` (`tipoContrato_id`),
  ADD KEY `fk_contratos_duracionContrato` (`duracionContrato_id`),
  ADD KEY `fk_contratos_jornadas` (`jornadas_id`),
  ADD KEY `fk_contratos_empresas` (`empresas_id`);

--
-- Indices de la tabla `costos1`
--
ALTER TABLE `costos1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `costos2`
--
ALTER TABLE `costos2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `costos3`
--
ALTER TABLE `costos3`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `costos4`
--
ALTER TABLE `costos4`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuentasbancos`
--
ALTER TABLE `cuentasbancos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cuentasbancos_bancos` (`bancos_id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `descansos`
--
ALTER TABLE `descansos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_descansos_empleados` (`empleados_id`),
  ADD KEY `fk_descansos_tipodescanso` (`tipoDescanso_id`);

--
-- Indices de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_descuentos_empleados` (`empleados_id`),
  ADD KEY `fk_descuentos_periodos` (`periodos_id`),
  ADD KEY `fk_descuentos_tipo` (`tipoDescuento_id`);

--
-- Indices de la tabla `discapacidades`
--
ALTER TABLE `discapacidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `duracioncontratos`
--
ALTER TABLE `duracioncontratos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_empleados_secuencias` (`secuencias_id`),
  ADD KEY `fk_empleados_estadosEmpleado` (`estadosEmpleado_id`),
  ADD KEY `fk_empleados_estadosNomina` (`estadosNomina_id`),
  ADD KEY `fk_empleados_jefes` (`jefes_id`),
  ADD KEY `fk_empleados_puestos` (`puestos_id`),
  ADD KEY `fk_empleados_costos1` (`costos1_id`),
  ADD KEY `fk_empleados_costos2` (`costos2_id`),
  ADD KEY `fk_empleados_costos3` (`costos3_id`),
  ADD KEY `fk_empleados_costos4` (`costos4_id`),
  ADD KEY `fk_empleados_regiones` (`regiones_id`),
  ADD KEY `fk_empleados_establecimientos` (`establecimientos_id`),
  ADD KEY `fk_empleados_nacionalidades` (`nacionalidades_id`),
  ADD KEY `fk_empleados_ocupaciones` (`ocupaciones_id`),
  ADD KEY `fk_empleados_idiomas` (`idiomas_id`),
  ADD KEY `fk_empleados_generos` (`generos_id`),
  ADD KEY `fk_empleados_contratos` (`contratos_id`),
  ADD KEY `fk_empleados_discapacidades` (`discapacidades_id`),
  ADD KEY `fk_empleados_estadoCivil` (`estadoCivil_id`),
  ADD KEY `fk_empleados_ascendencias` (`ascendencias_id`),
  ADD KEY `fk_empleados_estudios` (`estudios_id`),
  ADD KEY `fk_empleados_bancos` (`bancos_id`),
  ADD KEY `fk_empleados_tipoPago` (`tipoPago_id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_empresas_nacionalidades` (`nacionalidades_id`),
  ADD KEY `fk_empresas_estadoCivil` (`estadoCivil_id`),
  ADD KEY `fk_empresas_estudios` (`estudios_id`),
  ADD KEY `fk_empresas_tipoIdentificacion` (`tipoIdentificacion_id`);

--
-- Indices de la tabla `establecimientos`
--
ALTER TABLE `establecimientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadocivil`
--
ALTER TABLE `estadocivil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadosempleado`
--
ALTER TABLE `estadosempleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadosestudio`
--
ALTER TABLE `estadosestudio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadosnomina`
--
ALTER TABLE `estadosnomina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudios`
--
ALTER TABLE `estudios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_evaluaciones_tipoEvaluacion` (`tipoEvaluacion_id`);

--
-- Indices de la tabla `experiencias`
--
ALTER TABLE `experiencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_experiencias_tipoExperiencia` (`tipoExperiencia_id`);

--
-- Indices de la tabla `familiares`
--
ALTER TABLE `familiares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_familiares_empleados` (`empleados_id`),
  ADD KEY `fk_familiares_tipoFamiliar` (`tipoFamiliar_id`);

--
-- Indices de la tabla `fuentecontratacion`
--
ALTER TABLE `fuentecontratacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horasextras`
--
ALTER TABLE `horasextras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_horasextras_empleados` (`empleados_id`),
  ADD KEY `fk_horasextras_periodos` (`periodos_id`);

--
-- Indices de la tabla `identificaciones`
--
ALTER TABLE `identificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_identificaciones_empleados` (`empleados_id`),
  ADD KEY `fk_identificaciones_tipoIdentificacion` (`tipoIdentificacion_id`);

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `incrementos`
--
ALTER TABLE `incrementos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_incrementos_empleados` (`empledos_id`);

--
-- Indices de la tabla `indemnizaciones`
--
ALTER TABLE `indemnizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_indemnizaciones_empleados` (`empleados_id`);

--
-- Indices de la tabla `jefes`
--
ALTER TABLE `jefes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jornalizaciones`
--
ALTER TABLE `jornalizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jornalizaciones_costos1` (`costos1_id`),
  ADD KEY `fk_jornalizaciones_costos2` (`costos2_id`),
  ADD KEY `fk_jornalizaciones_costos3` (`costos3_id`),
  ADD KEY `fk_jornalizaciones_costos4` (`costos4_id`);

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `motivoretiro`
--
ALTER TABLE `motivoretiro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_departamento` (`departamentos_id`);

--
-- Indices de la tabla `nacionalidades`
--
ALTER TABLE `nacionalidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nominas`
--
ALTER TABLE `nominas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nominas_empleados` (`empleados_id`),
  ADD KEY `fk_nominas_descuentos` (`descuentos_id`),
  ADD KEY `fk_nominas_sueldos` (`sueldos_id`),
  ADD KEY `fk_nominas_periodos` (`periodos_id`);

--
-- Indices de la tabla `ocupaciones`
--
ALTER TABLE `ocupaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_propiedades_empleados` (`empleados_id`),
  ADD KEY `fk_propiedades_tipos_propiedades` (`tipoPropiedad_id`);

--
-- Indices de la tabla `provisiones`
--
ALTER TABLE `provisiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_provisiones_empleados` (`empleados_id`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reclutadores`
--
ALTER TABLE `reclutadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `referencias`
--
ALTER TABLE `referencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_referencias_empleados` (`empleados_id`),
  ADD KEY `fk_referencias_tipoReferencia` (`tipoReferencia_id`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `secuencias`
--
ALTER TABLE `secuencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sueldos`
--
ALTER TABLE `sueldos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipocontacto`
--
ALTER TABLE `tipocontacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipocontrato`
--
ALTER TABLE `tipocontrato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipodescanso`
--
ALTER TABLE `tipodescanso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipodescuento`
--
ALTER TABLE `tipodescuento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoevaluacion`
--
ALTER TABLE `tipoevaluacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoexperiencia`
--
ALTER TABLE `tipoexperiencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipofamiliar`
--
ALTER TABLE `tipofamiliar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoidentificacion`
--
ALTER TABLE `tipoidentificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipopropiedad`
--
ALTER TABLE `tipopropiedad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tiporeclutamiento`
--
ALTER TABLE `tiporeclutamiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tiporeferencia`
--
ALTER TABLE `tiporeferencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipovacante`
--
ALTER TABLE `tipovacante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vacantes`
--
ALTER TABLE `vacantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vacantes_puestos` (`puestos_id`),
  ADD KEY `fk_vacantes_costos1` (`costos1_id`),
  ADD KEY `fk_vacantes_costos2` (`costos2_id`),
  ADD KEY `fk_vacantes_costos3` (`costos3_id`),
  ADD KEY `fk_vacantes_departamentos` (`departamentos_id`),
  ADD KEY `fk_vacantes_municipios` (`municipios_id`),
  ADD KEY `fk_vacantes_jefes` (`jefes_id`),
  ADD KEY `fk_vacantes_tipoVacante` (`tipoVacante_id`),
  ADD KEY `fk_vacantes_empleados_1` (`empleados_id_1`),
  ADD KEY `fk_vacantes_empleados_2` (`empleados_id_2`),
  ADD KEY `fk_vacantes_reclutadores` (`reclutadores_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ascendencias`
--
ALTER TABLE `ascendencias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `bonos`
--
ALTER TABLE `bonos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comisiones`
--
ALTER TABLE `comisiones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `costos1`
--
ALTER TABLE `costos1`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `costos2`
--
ALTER TABLE `costos2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `costos3`
--
ALTER TABLE `costos3`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT de la tabla `costos4`
--
ALTER TABLE `costos4`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cuentasbancos`
--
ALTER TABLE `cuentasbancos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `descansos`
--
ALTER TABLE `descansos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `discapacidades`
--
ALTER TABLE `discapacidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `duracioncontratos`
--
ALTER TABLE `duracioncontratos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `establecimientos`
--
ALTER TABLE `establecimientos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estadocivil`
--
ALTER TABLE `estadocivil`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estadosempleado`
--
ALTER TABLE `estadosempleado`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estadosestudio`
--
ALTER TABLE `estadosestudio`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadosnomina`
--
ALTER TABLE `estadosnomina`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `estudios`
--
ALTER TABLE `estudios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `experiencias`
--
ALTER TABLE `experiencias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `familiares`
--
ALTER TABLE `familiares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fuentecontratacion`
--
ALTER TABLE `fuentecontratacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `horasextras`
--
ALTER TABLE `horasextras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `identificaciones`
--
ALTER TABLE `identificaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `incrementos`
--
ALTER TABLE `incrementos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `indemnizaciones`
--
ALTER TABLE `indemnizaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jefes`
--
ALTER TABLE `jefes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `jornalizaciones`
--
ALTER TABLE `jornalizaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `monedas`
--
ALTER TABLE `monedas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `motivoretiro`
--
ALTER TABLE `motivoretiro`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

--
-- AUTO_INCREMENT de la tabla `nacionalidades`
--
ALTER TABLE `nacionalidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT de la tabla `nominas`
--
ALTER TABLE `nominas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ocupaciones`
--
ALTER TABLE `ocupaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provisiones`
--
ALTER TABLE `provisiones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `reclutadores`
--
ALTER TABLE `reclutadores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `referencias`
--
ALTER TABLE `referencias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `secuencias`
--
ALTER TABLE `secuencias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sueldos`
--
ALTER TABLE `sueldos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipocontacto`
--
ALTER TABLE `tipocontacto`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipocontrato`
--
ALTER TABLE `tipocontrato`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipodescanso`
--
ALTER TABLE `tipodescanso`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipodescuento`
--
ALTER TABLE `tipodescuento`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `tipoevaluacion`
--
ALTER TABLE `tipoevaluacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoexperiencia`
--
ALTER TABLE `tipoexperiencia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipofamiliar`
--
ALTER TABLE `tipofamiliar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoidentificacion`
--
ALTER TABLE `tipoidentificacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipopropiedad`
--
ALTER TABLE `tipopropiedad`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiporeclutamiento`
--
ALTER TABLE `tiporeclutamiento`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiporeferencia`
--
ALTER TABLE `tiporeferencia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipovacante`
--
ALTER TABLE `tipovacante`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vacantes`
--
ALTER TABLE `vacantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=563;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bonos`
--
ALTER TABLE `bonos`
  ADD CONSTRAINT `fk_bonos_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_bonos_periodos` FOREIGN KEY (`periodos_id`) REFERENCES `periodos` (`id`);

--
-- Filtros para la tabla `comisiones`
--
ALTER TABLE `comisiones`
  ADD CONSTRAINT `fk_comisiones_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_comisiones_periodos` FOREIGN KEY (`periodos_id`) REFERENCES `periodos` (`id`);

--
-- Filtros para la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD CONSTRAINT `fk_contactos_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  ADD CONSTRAINT `fk_contactos_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_contactos_municipio` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`),
  ADD CONSTRAINT `fk_contactos_tipoContacto` FOREIGN KEY (`tipoContacto_id`) REFERENCES `tipocontacto` (`id`);

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `fk_contratos_duracionContrato` FOREIGN KEY (`duracionContrato_id`) REFERENCES `duracioncontratos` (`id`),
  ADD CONSTRAINT `fk_contratos_empresas` FOREIGN KEY (`empresas_id`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `fk_contratos_jornadas` FOREIGN KEY (`jornadas_id`) REFERENCES `jornadas` (`id`),
  ADD CONSTRAINT `fk_contratos_tipoContrato` FOREIGN KEY (`tipoContrato_id`) REFERENCES `tipocontrato` (`id`);

--
-- Filtros para la tabla `cuentasbancos`
--
ALTER TABLE `cuentasbancos`
  ADD CONSTRAINT `fk_cuentasbancos_bancos` FOREIGN KEY (`bancos_id`) REFERENCES `bancos` (`id`);

--
-- Filtros para la tabla `descansos`
--
ALTER TABLE `descansos`
  ADD CONSTRAINT `fk_descansos_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_descansos_tipodescanso` FOREIGN KEY (`tipoDescanso_id`) REFERENCES `tipodescanso` (`id`);

--
-- Filtros para la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD CONSTRAINT `fk_descuentos_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_descuentos_periodos` FOREIGN KEY (`periodos_id`) REFERENCES `periodos` (`id`),
  ADD CONSTRAINT `fk_descuentos_tipo` FOREIGN KEY (`tipoDescuento_id`) REFERENCES `tipodescuento` (`id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_empleados_ascendencias` FOREIGN KEY (`ascendencias_id`) REFERENCES `ascendencias` (`id`),
  ADD CONSTRAINT `fk_empleados_bancos` FOREIGN KEY (`bancos_id`) REFERENCES `bancos` (`id`),
  ADD CONSTRAINT `fk_empleados_contratos` FOREIGN KEY (`contratos_id`) REFERENCES `contratos` (`id`),
  ADD CONSTRAINT `fk_empleados_costos1` FOREIGN KEY (`costos1_id`) REFERENCES `costos1` (`id`),
  ADD CONSTRAINT `fk_empleados_costos2` FOREIGN KEY (`costos2_id`) REFERENCES `costos2` (`id`),
  ADD CONSTRAINT `fk_empleados_costos3` FOREIGN KEY (`costos3_id`) REFERENCES `costos3` (`id`),
  ADD CONSTRAINT `fk_empleados_costos4` FOREIGN KEY (`costos4_id`) REFERENCES `costos4` (`id`),
  ADD CONSTRAINT `fk_empleados_discapacidades` FOREIGN KEY (`discapacidades_id`) REFERENCES `discapacidades` (`id`),
  ADD CONSTRAINT `fk_empleados_establecimientos` FOREIGN KEY (`establecimientos_id`) REFERENCES `establecimientos` (`id`),
  ADD CONSTRAINT `fk_empleados_estadoCivil` FOREIGN KEY (`estadoCivil_id`) REFERENCES `estadocivil` (`id`),
  ADD CONSTRAINT `fk_empleados_estadosEmpleado` FOREIGN KEY (`estadosEmpleado_id`) REFERENCES `estadosempleado` (`id`),
  ADD CONSTRAINT `fk_empleados_estadosNomina` FOREIGN KEY (`estadosNomina_id`) REFERENCES `estadosnomina` (`id`),
  ADD CONSTRAINT `fk_empleados_estudios` FOREIGN KEY (`estudios_id`) REFERENCES `estudios` (`id`),
  ADD CONSTRAINT `fk_empleados_generos` FOREIGN KEY (`generos_id`) REFERENCES `generos` (`id`),
  ADD CONSTRAINT `fk_empleados_idiomas` FOREIGN KEY (`idiomas_id`) REFERENCES `idiomas` (`id`),
  ADD CONSTRAINT `fk_empleados_jefes` FOREIGN KEY (`jefes_id`) REFERENCES `jefes` (`id`),
  ADD CONSTRAINT `fk_empleados_nacionalidades` FOREIGN KEY (`nacionalidades_id`) REFERENCES `nacionalidades` (`id`),
  ADD CONSTRAINT `fk_empleados_ocupaciones` FOREIGN KEY (`ocupaciones_id`) REFERENCES `ocupaciones` (`id`),
  ADD CONSTRAINT `fk_empleados_puestos` FOREIGN KEY (`puestos_id`) REFERENCES `puestos` (`id`),
  ADD CONSTRAINT `fk_empleados_regiones` FOREIGN KEY (`regiones_id`) REFERENCES `regiones` (`id`),
  ADD CONSTRAINT `fk_empleados_secuencias` FOREIGN KEY (`secuencias_id`) REFERENCES `secuencias` (`id`),
  ADD CONSTRAINT `fk_empleados_tipoPago` FOREIGN KEY (`tipoPago_id`) REFERENCES `tipopago` (`id`);

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `fk_empresas_estadoCivil` FOREIGN KEY (`estadoCivil_id`) REFERENCES `estadocivil` (`id`),
  ADD CONSTRAINT `fk_empresas_estudios` FOREIGN KEY (`estudios_id`) REFERENCES `estudios` (`id`),
  ADD CONSTRAINT `fk_empresas_nacionalidades` FOREIGN KEY (`nacionalidades_id`) REFERENCES `nacionalidades` (`id`),
  ADD CONSTRAINT `fk_empresas_tipoIdentificacion` FOREIGN KEY (`tipoIdentificacion_id`) REFERENCES `tipoidentificacion` (`id`);

--
-- Filtros para la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD CONSTRAINT `fk_evaluaciones_tipoEvaluacion` FOREIGN KEY (`tipoEvaluacion_id`) REFERENCES `tipoevaluacion` (`id`);

--
-- Filtros para la tabla `experiencias`
--
ALTER TABLE `experiencias`
  ADD CONSTRAINT `fk_experiencias_tipoExperiencia` FOREIGN KEY (`tipoExperiencia_id`) REFERENCES `tipoexperiencia` (`id`);

--
-- Filtros para la tabla `familiares`
--
ALTER TABLE `familiares`
  ADD CONSTRAINT `fk_familiares_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_familiares_tipoFamiliar` FOREIGN KEY (`tipoFamiliar_id`) REFERENCES `tipofamiliar` (`id`);

--
-- Filtros para la tabla `horasextras`
--
ALTER TABLE `horasextras`
  ADD CONSTRAINT `fk_horasextras_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_horasextras_periodos` FOREIGN KEY (`periodos_id`) REFERENCES `periodos` (`id`);

--
-- Filtros para la tabla `identificaciones`
--
ALTER TABLE `identificaciones`
  ADD CONSTRAINT `fk_identificaciones_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_identificaciones_tipoIdentificacion` FOREIGN KEY (`tipoIdentificacion_id`) REFERENCES `tipoidentificacion` (`id`);

--
-- Filtros para la tabla `incrementos`
--
ALTER TABLE `incrementos`
  ADD CONSTRAINT `fk_incrementos_empleados` FOREIGN KEY (`empledos_id`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `indemnizaciones`
--
ALTER TABLE `indemnizaciones`
  ADD CONSTRAINT `fk_indemnizaciones_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `jornalizaciones`
--
ALTER TABLE `jornalizaciones`
  ADD CONSTRAINT `fk_jornalizaciones_costos1` FOREIGN KEY (`costos1_id`) REFERENCES `costos1` (`id`),
  ADD CONSTRAINT `fk_jornalizaciones_costos2` FOREIGN KEY (`costos2_id`) REFERENCES `costos2` (`id`),
  ADD CONSTRAINT `fk_jornalizaciones_costos3` FOREIGN KEY (`costos3_id`) REFERENCES `costos3` (`id`),
  ADD CONSTRAINT `fk_jornalizaciones_costos4` FOREIGN KEY (`costos4_id`) REFERENCES `costos4` (`id`);

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `fk_departamento` FOREIGN KEY (`departamentos_id`) REFERENCES `departamentos` (`id`);

--
-- Filtros para la tabla `nominas`
--
ALTER TABLE `nominas`
  ADD CONSTRAINT `fk_nominas_descuentos` FOREIGN KEY (`descuentos_id`) REFERENCES `descuentos` (`id`),
  ADD CONSTRAINT `fk_nominas_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_nominas_periodos` FOREIGN KEY (`periodos_id`) REFERENCES `periodos` (`id`),
  ADD CONSTRAINT `fk_nominas_sueldos` FOREIGN KEY (`sueldos_id`) REFERENCES `sueldos` (`id`);

--
-- Filtros para la tabla `propiedades`
--
ALTER TABLE `propiedades`
  ADD CONSTRAINT `fk_propiedades_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_propiedades_tipos_propiedades` FOREIGN KEY (`tipoPropiedad_id`) REFERENCES `tipopropiedad` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `provisiones`
--
ALTER TABLE `provisiones`
  ADD CONSTRAINT `fk_provisiones_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `referencias`
--
ALTER TABLE `referencias`
  ADD CONSTRAINT `fk_referencias_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_referencias_tipoReferencia` FOREIGN KEY (`tipoReferencia_id`) REFERENCES `tiporeferencia` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `vacantes`
--
ALTER TABLE `vacantes`
  ADD CONSTRAINT `fk_vacantes_costos1` FOREIGN KEY (`costos1_id`) REFERENCES `costos1` (`id`),
  ADD CONSTRAINT `fk_vacantes_costos2` FOREIGN KEY (`costos2_id`) REFERENCES `costos2` (`id`),
  ADD CONSTRAINT `fk_vacantes_costos3` FOREIGN KEY (`costos3_id`) REFERENCES `costos3` (`id`),
  ADD CONSTRAINT `fk_vacantes_departamentos` FOREIGN KEY (`departamentos_id`) REFERENCES `departamentos` (`id`),
  ADD CONSTRAINT `fk_vacantes_empleados_1` FOREIGN KEY (`empleados_id_1`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_vacantes_empleados_2` FOREIGN KEY (`empleados_id_2`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_vacantes_jefes` FOREIGN KEY (`jefes_id`) REFERENCES `jefes` (`id`),
  ADD CONSTRAINT `fk_vacantes_municipios` FOREIGN KEY (`municipios_id`) REFERENCES `municipios` (`id`),
  ADD CONSTRAINT `fk_vacantes_puestos` FOREIGN KEY (`puestos_id`) REFERENCES `puestos` (`id`),
  ADD CONSTRAINT `fk_vacantes_reclutadores` FOREIGN KEY (`reclutadores_id`) REFERENCES `reclutadores` (`id`),
  ADD CONSTRAINT `fk_vacantes_tipoVacante` FOREIGN KEY (`tipoVacante_id`) REFERENCES `tipovacante` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
