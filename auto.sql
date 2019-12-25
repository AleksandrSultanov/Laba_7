-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 25 2019 г., 09:18
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `auto1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `car`
--

CREATE TABLE `car` (
  `id_car` int(11) UNSIGNED NOT NULL,
  `mark` varchar(32) NOT NULL,
  `model` varchar(32) NOT NULL,
  `production_year` year(4) NOT NULL,
  `cost` bigint(32) NOT NULL,
  `mileage` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='object_car';

--
-- Дамп данных таблицы `car`
--

INSERT INTO `car` (`id_car`, `mark`, `model`, `production_year`, `cost`, `mileage`, `file_path`) VALUES
(77, 'vw', 'polo', 2000, 500000, 7, 'user_file/E7Ea6CRl_1U_(1).jpg'),
(78, 'vw', 'polo', 2018, 500000, 5, '0'),
(79, 'Lada', 'Priora', 2016, 300000, 27000, '0'),
(80, 'vw', 'polo', 0000, 500000, 2000, 'user_file/E7Ea6CRl_1U_(3).jpg'),
(81, 'vw1', 'polo', 2016, 3000000, 27000, '0'),
(82, 'vw', 'polo', 2001, 23535235, 0, '0'),
(83, 'vw', 'Model_3', 2018, 500000, 2000, 'user_file/E7Ea6CRl_1U_(2).jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `logging`
--

CREATE TABLE `logging` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `logging`
--

INSERT INTO `logging` (`id`, `id_user`, `file_path`) VALUES
(7, 21, 'log/log_21.txt'),
(8, 19, 'log/log_19.txt');

-- --------------------------------------------------------

--
-- Структура таблицы `relation_car_salon`
--

CREATE TABLE `relation_car_salon` (
  `id` int(11) NOT NULL,
  `id_salon` int(11) NOT NULL,
  `id_car` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `relation_car_salon`
--

INSERT INTO `relation_car_salon` (`id`, `id_salon`, `id_car`) VALUES
(48, 82, 78),
(49, 2, 79),
(50, 89, 80),
(51, 1, 81),
(52, 82, 82),
(53, 1, 83);

-- --------------------------------------------------------

--
-- Структура таблицы `relation_car_user`
--

CREATE TABLE `relation_car_user` (
  `id` int(11) NOT NULL,
  `id_car` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `relation_car_user`
--

INSERT INTO `relation_car_user` (`id`, `id_car`, `id_user`) VALUES
(1, 78, 19),
(2, 79, 21),
(3, 80, 21),
(4, 81, 21),
(5, 82, 21),
(6, 83, 19);

-- --------------------------------------------------------

--
-- Структура таблицы `salon`
--

CREATE TABLE `salon` (
  `id_salon` int(11) NOT NULL,
  `mark` varchar(32) NOT NULL,
  `number` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `salon`
--

INSERT INTO `salon` (`id_salon`, `mark`, `number`, `email`, `file_path`) VALUES
(1, 'Tesla', '+79044248099', 'email@gmail.como', '0'),
(2, 'Lada', '+79370815999', 'lada@ya.ru', 'user_file/creta.png'),
(3, 'VW', '+79370815122', 'alexul603@gmail.com', 'user_file/polo1.png'),
(82, 'vw', '+79370815122', 'alexul603@gmail.com', 'user_file/lada_(2).jpg'),
(89, 'vwa', '+79370815122', 'alexul603@gmail.com', 'user_file/t4.jfif');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `login` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id_user`, `login`, `password`) VALUES
(19, 'alexul603', '$2y$10$.z0BnKg0En772bNR5xPXn.TTo8gROXZiTZlH8urqkJ1HfhfXLOKvO'),
(20, 'alexul', '$2y$10$nXrgpgwe/PKYlObGc9rUyeRtmwSfn8YkE8AW6XHPSJBvnoTOjkK12'),
(21, 'alexul6031', '$2y$10$RWSznj6KiXVol2WYtwbx9eiV5WgdIM5/4nwLZdOK.47vhHH34AFsC');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id_car`),
  ADD UNIQUE KEY `id` (`id_car`);

--
-- Индексы таблицы `logging`
--
ALTER TABLE `logging`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `relation_car_salon`
--
ALTER TABLE `relation_car_salon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `relation_car_user`
--
ALTER TABLE `relation_car_user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `salon`
--
ALTER TABLE `salon`
  ADD PRIMARY KEY (`id_salon`),
  ADD UNIQUE KEY `id_salon` (`id_salon`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `car`
--
ALTER TABLE `car`
  MODIFY `id_car` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT для таблицы `logging`
--
ALTER TABLE `logging`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `relation_car_salon`
--
ALTER TABLE `relation_car_salon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT для таблицы `relation_car_user`
--
ALTER TABLE `relation_car_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `salon`
--
ALTER TABLE `salon`
  MODIFY `id_salon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
