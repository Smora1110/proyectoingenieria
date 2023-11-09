-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2023 a las 13:59:10
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendabillar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Bebidas'),
(2, 'Alimento'),
(3, 'Licor'),
(4, 'Dulces'),
(5, 'Billar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `mesa` varchar(100) NOT NULL,
  `comentario` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `mesa`, `comentario`) VALUES
(1, 'Luis alejandro', 'mora ardila', ''),
(2, 'sebastian', 'mora', ''),
(3, 'sebas', '15', 'hola'),
(4, 'luis', '3', 'test'),
(5, 'Paula Viviescas', 'mesa1', 'Holi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `pedido_id`, `producto_id`, `precio`, `cantidad`, `estado`) VALUES
(1, 1, 12, 40.00, 1, 1),
(2, 1, 11, 17.00, 1, 1),
(3, 1, 10, 31.00, 1, 1),
(4, 1, 9, 36.00, 1, 1),
(5, 2, 12, 40.00, 7, 1),
(6, 2, 11, 17.00, 1, 1),
(7, 2, 6, 40.00, 1, 1),
(8, 3, 12, 40.00, 4, 1),
(9, 4, 11, 17.00, 1, 1),
(10, 5, 32, 2600.00, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(10) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `cliente_id`, `total`, `fecha`, `estado`) VALUES
(1, 1, 124.00, '2023-11-07', 1),
(2, 2, 337.00, '2023-11-07', 1),
(3, 3, 160.00, '2023-11-07', 1),
(4, 4, 17.00, '2023-11-07', 1),
(5, 5, 7800.00, '2023-11-09', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(80) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria_id` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `titulo`, `descripcion`, `foto`, `precio`, `categoria_id`, `fecha`, `estado`) VALUES
(15, 'Mesita billar', 'mesa de billar mini', 'mesita.webp', 150000.00, 5, '2023-11-09', 1),
(16, 'Guante', 'guante negro billar', 'guante.webp', 15000.00, 5, '2023-11-09', 1),
(17, 'Grissly', 'osos de goma grissly', 'grissly.webp', 5000.00, 4, '2023-11-09', 1),
(19, 'Tictac', 'Tictacs sabor naranja', 'tiictac.webp', 3000.00, 4, '2023-11-09', 1),
(21, 'Pringles', 'Papas pringles', 'pringles.webp', 8000.00, 2, '2023-11-09', 1),
(22, 'Margarita', 'Papas margarita', 'margarita.webp', 2000.00, 2, '2023-11-09', 1),
(23, 'Rizadas', 'Papas rizadas', 'rizadas.webp', 2500.00, 2, '2023-11-09', 1),
(25, 'Heineken', 'Cerveza Heineken', 'heineken.webp', 4400.00, 3, '2023-11-09', 1),
(26, 'Ron', 'Ron caldas', 'ron.webp', 60000.00, 3, '2023-11-09', 1),
(27, 'Smirnof', 'Vodka smirnof', 'smirnof.webp', 75000.00, 3, '2023-11-09', 1),
(28, 'Jaggermaister', 'Licor herbal', 'jagger.webp', 110000.00, 3, '2023-11-09', 1),
(29, 'Power', 'bebida hidratante', 'power.webp', 4000.00, 1, '2023-11-09', 1),
(30, 'Valle', 'Jugo del valle naranja', 'valle.webp', 3000.00, 1, '2023-11-09', 1),
(31, 'Hit', 'Jugo hit lulo', 'hit.webp', 3400.00, 1, '2023-11-09', 1),
(32, 'Cuatro', 'Gaseosa cuatro toronja', 'cuatro.webp', 2600.00, 1, '2023-11-09', 1),
(33, 'Combo billar', 'Taco billar con tiza y guantes', 'combo guanter taco tiza.webp', 210000.00, 5, '2023-11-09', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `clave` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `clave`, `estado`) VALUES
(1, 'admin', 'admin123', 1),
(2, 'mesa1', 'mesa1', 1),
(3, 'mesa2', 'mesa2', 1),
(4, 'mesa3', 'mesa3', 1),
(5, 'mesa4', 'mesa4', 1),
(6, 'mesa5', 'mesa5', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
