-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-12-2021 a las 05:41:02
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_final`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `destination` varchar(64) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reservations`
--

INSERT INTO `reservations` (`id`, `destination`, `check_in`, `check_out`, `user`) VALUES
(2, 'Panamá', '2022-03-02', '2022-04-01', 3),
(7, 'Bocas del Toro', '2023-03-02', '2023-04-03', 5),
(8, 'Panamá', '2022-02-02', '2022-03-02', 6),
(11, 'Colón', '2022-01-01', '2022-02-01', 3),
(13, 'Bocas del Toro', '2022-01-02', '2022-02-02', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('7S-30gQ7BNGqdGHMJ-JAuNqbr2Cdx_fZ', 1639729934, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":3}}'),
('D-TMcJI2HLSujhG6--z6Uf8fm9enCo85', 1639762235, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}'),
('ZZIaGI5RNrUU82K8r77JkFaTKyBnGlyX', 1639801343, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'Evert', 'evert@gmail.com', '$2a$10$SsWjWa5KqcnT8rAwnE7PwuMVGNGatlFELK0zXmZxPiNI2oOq9PdqK'),
(2, 'Steffanny', 'stef@gmail.com', '$2a$10$7NyRoYbiygr40EwTcCo2E.ft2n./XmphgN5Tw/lm96EodaGoYZKN2'),
(3, 'Jesús', 'jesus@email.com', '$2a$10$wI1OHd60kmv9aM/R.E5Gqe/paH.T10M3cv1CN2oF.6z7yMGp6KJYO'),
(4, 'Pernia', 'pernia@gmail.com', '$2a$10$FjAshkfAqPc7j/qkB81CE.IIqDxTimJTFwFYhAJSwCFf6WDRZcwce'),
(5, 'Sevillo', 'sevillo@gmail.com', '$2a$10$lZJ3Ch44PQvdEBSBM2Mr8Of7eeOe/dnxR.VoCtD2rB8I63VYCEe4u'),
(6, 'EvertNix', 'email@email.com', '$2a$10$DhtYqPycbkQ4iy0Xu2ZyJ.wMsKNbE7VgOakINcmBiKSj2jqses6QG'),
(7, 'Emiro', 'emiro@gmail.com', '$2a$10$4At3gPL0deTPeMSZPMWw6ek9KR.7iEyKqYYUOVQhjLa/joaeI3QMW');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
