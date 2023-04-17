-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Апр 17 2023 г., 11:13
-- Версия сервера: 8.0.32
-- Версия PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ComputerCompany`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Laptop`
--

CREATE TABLE `Laptop` (
  `code` int NOT NULL,
  `model` varchar(45) DEFAULT NULL,
  `speed` varchar(45) DEFAULT NULL,
  `ram` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `hd` varchar(45) DEFAULT NULL,
  `screen` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Laptop`
--

INSERT INTO `Laptop` (`code`, `model`, `speed`, `ram`, `price`, `hd`, `screen`) VALUES
(1, '1298', '350', '32', '700.0000', '4.0', '11'),
(2, '1321', '500', '64', '970.0000', '8.0', '12'),
(3, '1750', '750', '128', '1200.0000', '12.0', '14'),
(4, '1298', '600', '64', '1050.0000', '10.0', '15'),
(5, '1752', '750', '128', '1150.0000', '10.0', '14'),
(6, '1298', '450', '64', '950.0000', '10.0', '12');

-- --------------------------------------------------------

--
-- Структура таблицы `PC`
--

CREATE TABLE `PC` (
  `code` int NOT NULL,
  `model` varchar(45) DEFAULT NULL,
  `speed` varchar(45) DEFAULT NULL,
  `ram` varchar(45) DEFAULT NULL,
  `hd` varchar(45) DEFAULT NULL,
  `cd` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `PC`
--

INSERT INTO `PC` (`code`, `model`, `speed`, `ram`, `hd`, `cd`, `price`) VALUES
(1, '1232', '500', '64', '5.0', '12x', '600.0000'),
(2, '1121', '750', '128', '14.0', '40x', '850.0000'),
(3, '1233', '500', '64', '5.0', '12x', '600.0000'),
(4, '1121', '600', '128', '14.0', '40x', '850.0000'),
(5, '1121', '600', '128', '8.0', '40x', '850.0000'),
(6, '1233', '750', '128', '20.0', '50x', '950.0000'),
(7, '1232', '500', '32', '10.0', '12x', '400.0000'),
(8, '1232', '450', '64', '8.0', '24x', '350.0000'),
(9, '1232', '450', '32', '10.0', '24x', '350.0000'),
(10, '1260', '500', '32', '10.0', '12x', '350.0000'),
(11, '1233', '900', '128', '40.0', '40x', '980.0000'),
(12, '1233', '800', '128', '20.0', '50x', '970.0000');

-- --------------------------------------------------------

--
-- Структура таблицы `Printer`
--

CREATE TABLE `Printer` (
  `code` int NOT NULL,
  `model` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Printer`
--

INSERT INTO `Printer` (`code`, `model`, `color`, `type`, `price`) VALUES
(1, '1276', 'n', 'Laser', '400.0000'),
(2, '1433', 'y', 'Jet', '270.0000'),
(3, '1434', 'y', 'Jet', '290.0000'),
(4, '1401', 'n', 'Matrix', '150.0000'),
(5, '1408', 'n', 'Matrix', '270.0000'),
(6, '1288', 'n', 'Laser', '400.0000');

-- --------------------------------------------------------

--
-- Структура таблицы `Product`
--

CREATE TABLE `Product` (
  `model` varchar(45) NOT NULL,
  `maker` varchar(50) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Product`
--

INSERT INTO `Product` (`model`, `maker`, `type`) VALUES
('1121', 'B', 'PC'),
('1232', 'A', 'PC'),
('1233', 'A', 'PC'),
('1260', 'E', 'PC'),
('1276', 'A', 'Printer'),
('1288', 'D', 'Printer'),
('1298', 'A', 'Laptop'),
('1321', 'C', 'Laptop'),
('1401', 'A', 'Printer'),
('1408', 'A', 'Printer'),
('1433', 'D', 'Printer'),
('1434', 'E', 'Printer'),
('1750', 'B', 'Laptop'),
('1752', 'A', 'Laptop'),
('2112', 'E', 'PC'),
('2113', 'E', 'PC');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Laptop`
--
ALTER TABLE `Laptop`
  ADD PRIMARY KEY (`code`),
  ADD KEY `model_idx` (`model`);

--
-- Индексы таблицы `PC`
--
ALTER TABLE `PC`
  ADD PRIMARY KEY (`code`),
  ADD KEY `model_idx` (`model`);

--
-- Индексы таблицы `Printer`
--
ALTER TABLE `Printer`
  ADD PRIMARY KEY (`code`),
  ADD KEY `modelPrinter_idx` (`model`);

--
-- Индексы таблицы `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`model`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Laptop`
--
ALTER TABLE `Laptop`
  ADD CONSTRAINT `model` FOREIGN KEY (`model`) REFERENCES `Product` (`model`);

--
-- Ограничения внешнего ключа таблицы `PC`
--
ALTER TABLE `PC`
  ADD CONSTRAINT `modelPC` FOREIGN KEY (`model`) REFERENCES `Product` (`model`);

--
-- Ограничения внешнего ключа таблицы `Printer`
--
ALTER TABLE `Printer`
  ADD CONSTRAINT `modelPrinter` FOREIGN KEY (`model`) REFERENCES `Product` (`model`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
