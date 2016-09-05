-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Сен 05 2016 г., 19:02
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `testmodx`
--

-- --------------------------------------------------------

--
-- Структура таблицы `modx_active_users`
--

CREATE TABLE IF NOT EXISTS `modx_active_users` (
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `id` int(10) DEFAULT NULL,
  `action` varchar(10) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about active users.';

--
-- Дамп данных таблицы `modx_active_users`
--

INSERT INTO `modx_active_users` (`internalKey`, `username`, `lasthit`, `id`, `action`, `ip`) VALUES
(1, 'adminko', 1472933392, NULL, '76', '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_categories`
--

CREATE TABLE IF NOT EXISTS `modx_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc' AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `modx_categories`
--

INSERT INTO `modx_categories` (`id`, `category`) VALUES
(1, 'Demo Content'),
(2, 'Js'),
(3, 'Login'),
(4, 'Manager and Admin'),
(5, 'Search'),
(6, 'Navigation'),
(7, 'Content'),
(8, 'Forms'),
(9, 'Общий дизайн сайта'),
(10, 'Новости');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_documentgroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_documentgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_document_groups`
--

CREATE TABLE IF NOT EXISTS `modx_document_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `document` (`document`),
  KEY `document_group` (`document_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_event_log`
--

CREATE TABLE IF NOT EXISTS `modx_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_event_log`
--

INSERT INTO `modx_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(1, 0, 1472674544, 3, 1, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php)');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_keyword_xref`
--

CREATE TABLE IF NOT EXISTS `modx_keyword_xref` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cross reference bewteen keywords and content';

-- --------------------------------------------------------

--
-- Структура таблицы `modx_manager_log`
--

CREATE TABLE IF NOT EXISTS `modx_manager_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.' AUTO_INCREMENT=1346 ;

--
-- Дамп данных таблицы `modx_manager_log`
--

INSERT INTO `modx_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`) VALUES
(1, 1472644838, 1, 'adminko', 58, '-', 'MODX', 'Logged in'),
(2, 1472644842, 1, 'adminko', 17, '-', '-', 'Editing settings'),
(3, 1472645001, 1, 'adminko', 30, '-', '-', 'Saving settings'),
(4, 1472647109, 1, 'adminko', 75, '-', '-', 'User/ role management'),
(5, 1472647112, 1, 'adminko', 12, '1', 'adminko', 'Editing user'),
(6, 1472647123, 1, 'adminko', 17, '-', '-', 'Editing settings'),
(7, 1472647143, 1, 'adminko', 76, '-', '-', 'Element management'),
(8, 1472647187, 1, 'adminko', 16, '4', 'MODxHost', 'Editing template'),
(9, 1472647192, 1, 'adminko', 21, '4', 'MODxHost', 'Deleting template'),
(10, 1472647192, 1, 'adminko', 76, '-', '-', 'Element management'),
(11, 1472647195, 1, 'adminko', 16, '3', 'Minimal Template', 'Editing template'),
(12, 1472647303, 1, 'adminko', 20, '3', 'Главная страница', 'Saving template'),
(13, 1472647303, 1, 'adminko', 76, '-', '-', 'Element management'),
(14, 1472647448, 1, 'adminko', 76, '-', '-', 'Element management'),
(15, 1472647451, 1, 'adminko', 16, '3', 'Главная страница', 'Editing template'),
(16, 1472647459, 1, 'adminko', 20, '3', 'Главная страница', 'Saving template'),
(17, 1472647459, 1, 'adminko', 76, '-', '-', 'Element management'),
(18, 1472647495, 1, 'adminko', 76, '-', '-', 'Element management'),
(19, 1472647498, 1, 'adminko', 16, '3', 'Главная страница', 'Editing template'),
(20, 1472647859, 1, 'adminko', 20, '3', 'Главная страница', 'Saving template'),
(21, 1472647859, 1, 'adminko', 76, '-', '-', 'Element management'),
(22, 1472648941, 1, 'adminko', 76, '-', '-', 'Element management'),
(23, 1472648954, 1, 'adminko', 16, '3', 'Главная страница', 'Editing template'),
(24, 1472648991, 1, 'adminko', 76, '-', '-', 'Element management'),
(25, 1472649029, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(26, 1472649156, 1, 'adminko', 79, '-', 'HEAD', 'Saving Chunk (HTML Snippet)'),
(27, 1472649156, 1, 'adminko', 76, '-', '-', 'Element management'),
(28, 1472649166, 1, 'adminko', 76, '-', '-', 'Element management'),
(29, 1472649169, 1, 'adminko', 16, '3', 'Главная страница', 'Editing template'),
(30, 1472649178, 1, 'adminko', 20, '3', 'Главная страница', 'Saving template'),
(31, 1472649178, 1, 'adminko', 76, '-', '-', 'Element management'),
(32, 1472649217, 1, 'adminko', 16, '3', 'Главная страница', 'Editing template'),
(33, 1472649266, 1, 'adminko', 20, '3', 'Главная страница', 'Saving template'),
(34, 1472649266, 1, 'adminko', 76, '-', '-', 'Element management'),
(35, 1472649270, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(36, 1472649303, 1, 'adminko', 79, '-', 'HEADER', 'Saving Chunk (HTML Snippet)'),
(37, 1472649303, 1, 'adminko', 76, '-', '-', 'Element management'),
(38, 1472649331, 1, 'adminko', 16, '3', 'Главная страница', 'Editing template'),
(39, 1472649391, 1, 'adminko', 20, '3', 'Главная страница', 'Saving template'),
(40, 1472649391, 1, 'adminko', 76, '-', '-', 'Element management'),
(41, 1472649405, 1, 'adminko', 16, '3', 'Главная страница', 'Editing template'),
(42, 1472649422, 1, 'adminko', 20, '3', 'Главная страница', 'Saving template'),
(43, 1472649422, 1, 'adminko', 76, '-', '-', 'Element management'),
(44, 1472649425, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(45, 1472649450, 1, 'adminko', 79, '-', 'GALLERY', 'Saving Chunk (HTML Snippet)'),
(46, 1472649450, 1, 'adminko', 76, '-', '-', 'Element management'),
(47, 1472649466, 1, 'adminko', 16, '3', 'Главная страница', 'Editing template'),
(48, 1472649476, 1, 'adminko', 20, '3', 'Главная страница', 'Saving template'),
(49, 1472649476, 1, 'adminko', 76, '-', '-', 'Element management'),
(50, 1472649480, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(51, 1472649513, 1, 'adminko', 79, '-', 'MAIN-CONTENT', 'Saving Chunk (HTML Snippet)'),
(52, 1472649513, 1, 'adminko', 76, '-', '-', 'Element management'),
(53, 1472649522, 1, 'adminko', 16, '3', 'Главная страница', 'Editing template'),
(54, 1472649555, 1, 'adminko', 20, '3', 'Главная страница', 'Saving template'),
(55, 1472649555, 1, 'adminko', 76, '-', '-', 'Element management'),
(56, 1472649558, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(57, 1472649590, 1, 'adminko', 79, '-', 'FOOTER', 'Saving Chunk (HTML Snippet)'),
(58, 1472649590, 1, 'adminko', 76, '-', '-', 'Element management'),
(59, 1472649645, 1, 'adminko', 78, '2', 'WebLoginSideBar', 'Editing Chunk (HTML Snippet)'),
(60, 1472649649, 1, 'adminko', 80, '2', 'WebLoginSideBar', 'Deleting Chunk (HTML Snippet)'),
(61, 1472649649, 1, 'adminko', 76, '-', '-', 'Element management'),
(62, 1472649652, 1, 'adminko', 78, '1', 'mm_rules', 'Editing Chunk (HTML Snippet)'),
(63, 1472649655, 1, 'adminko', 80, '1', 'mm_rules', 'Deleting Chunk (HTML Snippet)'),
(64, 1472649655, 1, 'adminko', 76, '-', '-', 'Element management'),
(65, 1472649675, 1, 'adminko', 16, '3', 'Главная страница', 'Editing template'),
(66, 1472649816, 1, 'adminko', 20, '3', 'Главная страница', 'Saving template'),
(67, 1472649816, 1, 'adminko', 76, '-', '-', 'Element management'),
(68, 1472649821, 1, 'adminko', 78, '7', 'FOOTER', 'Editing Chunk (HTML Snippet)'),
(69, 1472649828, 1, 'adminko', 79, '7', 'FOOTER', 'Saving Chunk (HTML Snippet)'),
(70, 1472649828, 1, 'adminko', 76, '-', '-', 'Element management'),
(71, 1472650910, 1, 'adminko', 27, '1', 'MODX CMS Install Success', 'Editing resource'),
(72, 1472651034, 1, 'adminko', 5, '1', 'Главная страница', 'Saving resource'),
(73, 1472651036, 1, 'adminko', 3, '1', 'Главная страница', 'Viewing data for resource'),
(74, 1472651056, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(75, 1472651462, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(76, 1472651492, 1, 'adminko', 5, '-', 'Контактная информация', 'Saving resource'),
(77, 1472651494, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(78, 1472651504, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(79, 1472651508, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(80, 1472651512, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(81, 1472651517, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(82, 1472651535, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(83, 1472651564, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(84, 1472651573, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(85, 1472651588, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(86, 1472651590, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(87, 1472651605, 1, 'adminko', 5, '-', 'О нас', 'Saving resource'),
(88, 1472651607, 1, 'adminko', 3, '3', 'О нас', 'Viewing data for resource'),
(89, 1472651610, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(90, 1472651614, 1, 'adminko', 5, '-', 'Новости', 'Saving resource'),
(91, 1472651616, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(92, 1472651621, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(93, 1472651626, 1, 'adminko', 5, '-', 'Услуги', 'Saving resource'),
(94, 1472651628, 1, 'adminko', 3, '5', 'Услуги', 'Viewing data for resource'),
(95, 1472651724, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(96, 1472651728, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(97, 1472651732, 1, 'adminko', 5, '-', 'йцу', 'Saving resource'),
(98, 1472651734, 1, 'adminko', 3, '6', 'йцу', 'Viewing data for resource'),
(99, 1472651735, 1, 'adminko', 27, '6', 'йцу', 'Editing resource'),
(100, 1472651739, 1, 'adminko', 6, '6', 'йцу', 'Deleting resource'),
(101, 1472651740, 1, 'adminko', 3, '6', 'йцу', 'Viewing data for resource'),
(102, 1472651743, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(103, 1472651757, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(104, 1472651760, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(105, 1472651762, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(106, 1472651768, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(107, 1472651775, 1, 'adminko', 5, '-', 'Контактная информация', 'Saving resource'),
(108, 1472651776, 1, 'adminko', 3, '7', 'Контактная информация', 'Viewing data for resource'),
(109, 1472651779, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(110, 1472651783, 1, 'adminko', 51, '2', 'Контактная информация', 'Moving resource'),
(111, 1472651788, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(112, 1472651790, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(113, 1472651793, 1, 'adminko', 27, '7', 'Контактная информация', 'Editing resource'),
(114, 1472651796, 1, 'adminko', 6, '7', 'Контактная информация', 'Deleting resource'),
(115, 1472651797, 1, 'adminko', 3, '1', 'Главная страница', 'Viewing data for resource'),
(116, 1472651798, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(117, 1472651800, 1, 'adminko', 51, '2', 'Контактная информация', 'Moving resource'),
(118, 1472651808, 1, 'adminko', 52, '2', 'Контактная информация', 'Moved resource'),
(119, 1472651812, 1, 'adminko', 51, '3', 'О нас', 'Moving resource'),
(120, 1472651814, 1, 'adminko', 52, '3', 'О нас', 'Moved resource'),
(121, 1472651819, 1, 'adminko', 51, '4', 'Новости', 'Moving resource'),
(122, 1472651821, 1, 'adminko', 52, '4', 'Новости', 'Moved resource'),
(123, 1472651830, 1, 'adminko', 51, '4', 'Новости', 'Moving resource'),
(124, 1472651832, 1, 'adminko', 52, '4', 'Новости', 'Moved resource'),
(125, 1472651835, 1, 'adminko', 27, '5', 'Услуги', 'Editing resource'),
(126, 1472651837, 1, 'adminko', 51, '5', 'Услуги', 'Moving resource'),
(127, 1472651840, 1, 'adminko', 52, '5', 'Услуги', 'Moved resource'),
(128, 1472651949, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(129, 1472651959, 1, 'adminko', 5, '1', 'Главная страница', 'Saving resource'),
(130, 1472651961, 1, 'adminko', 3, '1', 'Главная страница', 'Viewing data for resource'),
(131, 1472651993, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(132, 1472652034, 1, 'adminko', 76, '-', '-', 'Element management'),
(133, 1472652849, 1, 'adminko', 78, '4', 'HEADER', 'Editing Chunk (HTML Snippet)'),
(134, 1472652934, 1, 'adminko', 79, '4', 'HEADER', 'Saving Chunk (HTML Snippet)'),
(135, 1472652934, 1, 'adminko', 76, '-', '-', 'Element management'),
(136, 1472652958, 1, 'adminko', 17, '-', '-', 'Editing settings'),
(137, 1472652971, 1, 'adminko', 76, '-', '-', 'Element management'),
(138, 1472652975, 1, 'adminko', 78, '3', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(139, 1472652990, 1, 'adminko', 79, '3', 'HEAD', 'Saving Chunk (HTML Snippet)'),
(140, 1472652990, 1, 'adminko', 76, '-', '-', 'Element management'),
(141, 1472654730, 1, 'adminko', 51, '2', 'Контактная информация', 'Moving resource'),
(142, 1472654738, 1, 'adminko', 52, '2', 'Контактная информация', 'Moved resource'),
(143, 1472654743, 1, 'adminko', 51, '3', 'О нас', 'Moving resource'),
(144, 1472654747, 1, 'adminko', 52, '3', 'О нас', 'Moved resource'),
(145, 1472654748, 1, 'adminko', 27, '3', 'О нас', 'Editing resource'),
(146, 1472654751, 1, 'adminko', 51, '4', 'Новости', 'Moving resource'),
(147, 1472654758, 1, 'adminko', 52, '4', 'Новости', 'Moved resource'),
(148, 1472654762, 1, 'adminko', 51, '4', 'Новости', 'Moving resource'),
(149, 1472654764, 1, 'adminko', 52, '4', 'Новости', 'Moved resource'),
(150, 1472654768, 1, 'adminko', 51, '5', 'Услуги', 'Moving resource'),
(151, 1472654771, 1, 'adminko', 52, '5', 'Услуги', 'Moved resource'),
(152, 1472654795, 1, 'adminko', 76, '-', '-', 'Element management'),
(153, 1472654799, 1, 'adminko', 78, '4', 'HEADER', 'Editing Chunk (HTML Snippet)'),
(154, 1472654805, 1, 'adminko', 79, '4', 'HEADER', 'Saving Chunk (HTML Snippet)'),
(155, 1472654805, 1, 'adminko', 76, '-', '-', 'Element management'),
(156, 1472654873, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(157, 1472654887, 1, 'adminko', 5, '1', 'Главная страница', 'Saving resource'),
(158, 1472654889, 1, 'adminko', 3, '1', 'Главная страница', 'Viewing data for resource'),
(159, 1472655077, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(160, 1472655081, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(161, 1472655093, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(162, 1472655095, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(163, 1472655100, 1, 'adminko', 27, '3', 'О нас', 'Editing resource'),
(164, 1472655103, 1, 'adminko', 5, '3', 'О нас', 'Saving resource'),
(165, 1472655105, 1, 'adminko', 27, '5', 'Услуги', 'Editing resource'),
(166, 1472655109, 1, 'adminko', 5, '5', 'Услуги', 'Saving resource'),
(167, 1472655111, 1, 'adminko', 3, '5', 'Услуги', 'Viewing data for resource'),
(168, 1472655113, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(169, 1472655116, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(170, 1472655118, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(171, 1472655142, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(172, 1472655147, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(173, 1472655149, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(174, 1472655285, 1, 'adminko', 76, '-', '-', 'Element management'),
(175, 1472655291, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(176, 1472655326, 1, 'adminko', 79, '-', 'MAIN-MENU', 'Saving Chunk (HTML Snippet)'),
(177, 1472655326, 1, 'adminko', 76, '-', '-', 'Element management'),
(178, 1472655328, 1, 'adminko', 76, '-', '-', 'Element management'),
(179, 1472655333, 1, 'adminko', 16, '3', 'Главная страница', 'Editing template'),
(180, 1472655339, 1, 'adminko', 76, '-', '-', 'Element management'),
(181, 1472655343, 1, 'adminko', 78, '7', 'FOOTER', 'Editing Chunk (HTML Snippet)'),
(182, 1472655363, 1, 'adminko', 76, '-', '-', 'Element management'),
(183, 1472655365, 1, 'adminko', 78, '4', 'HEADER', 'Editing Chunk (HTML Snippet)'),
(184, 1472655395, 1, 'adminko', 79, '4', 'HEADER', 'Saving Chunk (HTML Snippet)'),
(185, 1472655395, 1, 'adminko', 76, '-', '-', 'Element management'),
(186, 1472655402, 1, 'adminko', 78, '8', 'MAIN-MENU', 'Editing Chunk (HTML Snippet)'),
(187, 1472655407, 1, 'adminko', 79, '8', 'MAIN-MENU', 'Saving Chunk (HTML Snippet)'),
(188, 1472655407, 1, 'adminko', 76, '-', '-', 'Element management'),
(189, 1472671869, 1, 'adminko', 76, '-', '-', 'Element management'),
(190, 1472671873, 1, 'adminko', 19, '-', 'Новый шаблон', 'Creating a new template'),
(191, 1472671913, 1, 'adminko', 20, '-', '2колонки', 'Saving template'),
(192, 1472671913, 1, 'adminko', 76, '-', '-', 'Element management'),
(193, 1472671916, 1, 'adminko', 27, '3', 'О нас', 'Editing resource'),
(194, 1472671924, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(195, 1472671926, 1, 'adminko', 27, '3', 'О нас', 'Editing resource'),
(196, 1472671931, 1, 'adminko', 76, '-', '-', 'Element management'),
(197, 1472671935, 1, 'adminko', 16, '5', '2колонки', 'Editing template'),
(198, 1472671982, 1, 'adminko', 76, '-', '-', 'Element management'),
(199, 1472671989, 1, 'adminko', 19, '-', 'Новый шаблон', 'Creating a new template'),
(200, 1472672030, 1, 'adminko', 20, '-', 'Во всю ширину', 'Saving template'),
(201, 1472672030, 1, 'adminko', 76, '-', '-', 'Element management'),
(202, 1472672032, 1, 'adminko', 16, '5', '2колонки', 'Editing template'),
(203, 1472672035, 1, 'adminko', 20, '5', '2колонки', 'Saving template'),
(204, 1472672036, 1, 'adminko', 76, '-', '-', 'Element management'),
(205, 1472672038, 1, 'adminko', 27, '3', 'О нас', 'Editing resource'),
(206, 1472672043, 1, 'adminko', 27, '3', 'О нас', 'Editing resource'),
(207, 1472672069, 1, 'adminko', 5, '3', 'О нас', 'Saving resource'),
(208, 1472672070, 1, 'adminko', 27, '5', 'Услуги', 'Editing resource'),
(209, 1472672073, 1, 'adminko', 27, '5', 'Услуги', 'Editing resource'),
(210, 1472672076, 1, 'adminko', 5, '5', 'Услуги', 'Saving resource'),
(211, 1472672078, 1, 'adminko', 3, '5', 'Услуги', 'Viewing data for resource'),
(212, 1472672079, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(213, 1472672082, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(214, 1472672085, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(215, 1472672086, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(216, 1472672088, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(217, 1472672103, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(218, 1472672106, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(219, 1472672108, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(220, 1472672158, 1, 'adminko', 76, '-', '-', 'Element management'),
(221, 1472672174, 1, 'adminko', 16, '5', '2колонки', 'Editing template'),
(222, 1472672259, 1, 'adminko', 20, '5', '2колонки', 'Saving template'),
(223, 1472672259, 1, 'adminko', 76, '-', '-', 'Element management'),
(224, 1472672286, 1, 'adminko', 78, '3', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(225, 1472672298, 1, 'adminko', 79, '3', 'HEAD', 'Saving Chunk (HTML Snippet)'),
(226, 1472672298, 1, 'adminko', 76, '-', '-', 'Element management'),
(227, 1472672473, 1, 'adminko', 76, '-', '-', 'Element management'),
(228, 1472672477, 1, 'adminko', 78, '3', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(229, 1472672490, 1, 'adminko', 79, '3', 'HEAD', 'Saving Chunk (HTML Snippet)'),
(230, 1472672490, 1, 'adminko', 76, '-', '-', 'Element management'),
(231, 1472672680, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(232, 1472672712, 1, 'adminko', 79, '-', 'BREADCRUMB', 'Saving Chunk (HTML Snippet)'),
(233, 1472672712, 1, 'adminko', 76, '-', '-', 'Element management'),
(234, 1472672717, 1, 'adminko', 78, '9', 'BREADCRUMB', 'Editing Chunk (HTML Snippet)'),
(235, 1472672720, 1, 'adminko', 76, '-', '-', 'Element management'),
(236, 1472672731, 1, 'adminko', 16, '5', '2колонки', 'Editing template'),
(237, 1472672762, 1, 'adminko', 20, '5', '2колонки', 'Saving template'),
(238, 1472672762, 1, 'adminko', 76, '-', '-', 'Element management'),
(239, 1472672766, 1, 'adminko', 78, '9', 'BREADCRUMB', 'Editing Chunk (HTML Snippet)'),
(240, 1472672770, 1, 'adminko', 79, '9', 'BREADCRUMB', 'Saving Chunk (HTML Snippet)'),
(241, 1472672771, 1, 'adminko', 76, '-', '-', 'Element management'),
(242, 1472672783, 1, 'adminko', 78, '9', 'BREADCRUMB', 'Editing Chunk (HTML Snippet)'),
(243, 1472672803, 1, 'adminko', 79, '9', 'BREADCRUMB', 'Saving Chunk (HTML Snippet)'),
(244, 1472672803, 1, 'adminko', 76, '-', '-', 'Element management'),
(245, 1472672808, 1, 'adminko', 16, '5', '2колонки', 'Editing template'),
(246, 1472672925, 1, 'adminko', 20, '5', '2колонки', 'Saving template'),
(247, 1472672925, 1, 'adminko', 76, '-', '-', 'Element management'),
(248, 1472672928, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(249, 1472672951, 1, 'adminko', 79, '-', 'RIGHT-COL', 'Saving Chunk (HTML Snippet)'),
(250, 1472672951, 1, 'adminko', 76, '-', '-', 'Element management'),
(251, 1472673523, 1, 'adminko', 27, '5', 'Услуги', 'Editing resource'),
(252, 1472673535, 1, 'adminko', 5, '5', 'Услуги', 'Saving resource'),
(253, 1472673536, 1, 'adminko', 3, '5', 'Услуги', 'Viewing data for resource'),
(254, 1472673569, 1, 'adminko', 76, '-', '-', 'Element management'),
(255, 1472673575, 1, 'adminko', 16, '5', '2колонки', 'Editing template'),
(256, 1472673620, 1, 'adminko', 20, '5', '2колонки', 'Saving template'),
(257, 1472673620, 1, 'adminko', 76, '-', '-', 'Element management'),
(258, 1472673623, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(259, 1472673647, 1, 'adminko', 79, '-', 'CONTENT', 'Saving Chunk (HTML Snippet)'),
(260, 1472673647, 1, 'adminko', 76, '-', '-', 'Element management'),
(261, 1472673681, 1, 'adminko', 78, '9', 'BREADCRUMB', 'Editing Chunk (HTML Snippet)'),
(262, 1472673694, 1, 'adminko', 79, '9', 'BREADCRUMB', 'Saving Chunk (HTML Snippet)'),
(263, 1472673694, 1, 'adminko', 76, '-', '-', 'Element management'),
(264, 1472673696, 1, 'adminko', 78, '11', 'CONTENT', 'Editing Chunk (HTML Snippet)'),
(265, 1472673701, 1, 'adminko', 79, '11', 'CONTENT', 'Saving Chunk (HTML Snippet)'),
(266, 1472673701, 1, 'adminko', 76, '-', '-', 'Element management'),
(267, 1472673704, 1, 'adminko', 78, '7', 'FOOTER', 'Editing Chunk (HTML Snippet)'),
(268, 1472673709, 1, 'adminko', 79, '7', 'FOOTER', 'Saving Chunk (HTML Snippet)'),
(269, 1472673709, 1, 'adminko', 76, '-', '-', 'Element management'),
(270, 1472673710, 1, 'adminko', 78, '5', 'GALLERY', 'Editing Chunk (HTML Snippet)'),
(271, 1472673715, 1, 'adminko', 79, '5', 'GALLERY', 'Saving Chunk (HTML Snippet)'),
(272, 1472673715, 1, 'adminko', 76, '-', '-', 'Element management'),
(273, 1472673717, 1, 'adminko', 78, '3', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(274, 1472673720, 1, 'adminko', 79, '3', 'HEAD', 'Saving Chunk (HTML Snippet)'),
(275, 1472673721, 1, 'adminko', 76, '-', '-', 'Element management'),
(276, 1472673723, 1, 'adminko', 78, '4', 'HEADER', 'Editing Chunk (HTML Snippet)'),
(277, 1472673727, 1, 'adminko', 79, '4', 'HEADER', 'Saving Chunk (HTML Snippet)'),
(278, 1472673727, 1, 'adminko', 76, '-', '-', 'Element management'),
(279, 1472673729, 1, 'adminko', 78, '6', 'MAIN-CONTENT', 'Editing Chunk (HTML Snippet)'),
(280, 1472673733, 1, 'adminko', 79, '6', 'MAIN-CONTENT', 'Saving Chunk (HTML Snippet)'),
(281, 1472673734, 1, 'adminko', 76, '-', '-', 'Element management'),
(282, 1472673735, 1, 'adminko', 78, '10', 'RIGHT-COL', 'Editing Chunk (HTML Snippet)'),
(283, 1472673740, 1, 'adminko', 79, '10', 'RIGHT-COL', 'Saving Chunk (HTML Snippet)'),
(284, 1472673740, 1, 'adminko', 76, '-', '-', 'Element management'),
(285, 1472673742, 1, 'adminko', 78, '8', 'MAIN-MENU', 'Editing Chunk (HTML Snippet)'),
(286, 1472673745, 1, 'adminko', 79, '8', 'MAIN-MENU', 'Saving Chunk (HTML Snippet)'),
(287, 1472673746, 1, 'adminko', 76, '-', '-', 'Element management'),
(288, 1472673844, 1, 'adminko', 78, '11', 'CONTENT', 'Editing Chunk (HTML Snippet)'),
(289, 1472673894, 1, 'adminko', 79, '11', 'CONTENT', 'Saving Chunk (HTML Snippet)'),
(290, 1472673894, 1, 'adminko', 76, '-', '-', 'Element management'),
(291, 1472674150, 1, 'adminko', 78, '10', 'RIGHT-COL', 'Editing Chunk (HTML Snippet)'),
(292, 1472674161, 1, 'adminko', 76, '-', '-', 'Element management'),
(293, 1472674165, 1, 'adminko', 78, '3', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(294, 1472674172, 1, 'adminko', 76, '-', '-', 'Element management'),
(295, 1472674174, 1, 'adminko', 78, '10', 'RIGHT-COL', 'Editing Chunk (HTML Snippet)'),
(296, 1472674193, 1, 'adminko', 79, '10', 'RIGHT-COL', 'Saving Chunk (HTML Snippet)'),
(297, 1472674193, 1, 'adminko', 76, '-', '-', 'Element management'),
(298, 1472674346, 1, 'adminko', 16, '6', 'Во всю ширину', 'Editing template'),
(299, 1472674357, 1, 'adminko', 20, '6', 'Во всю ширину', 'Saving template'),
(300, 1472674357, 1, 'adminko', 76, '-', '-', 'Element management'),
(301, 1472674543, 1, 'adminko', 58, '-', 'MODX', 'Logged in'),
(302, 1472674588, 1, 'adminko', 76, '-', '-', 'Element management'),
(303, 1472674629, 1, 'adminko', 17, '-', '-', 'Editing settings'),
(304, 1472674732, 1, 'adminko', 30, '-', '-', 'Saving settings'),
(305, 1472674747, 1, 'adminko', 17, '-', '-', 'Editing settings'),
(306, 1472674776, 1, 'adminko', 30, '-', '-', 'Saving settings'),
(307, 1472674781, 1, 'adminko', 17, '-', '-', 'Editing settings'),
(308, 1472674875, 1, 'adminko', 30, '-', '-', 'Saving settings'),
(309, 1472674884, 1, 'adminko', 27, '3', 'О нас', 'Editing resource'),
(310, 1472675022, 1, 'adminko', 106, '-', '-', 'Viewing Modules'),
(311, 1472675025, 1, 'adminko', 27, '3', 'О нас', 'Editing resource'),
(312, 1472675066, 1, 'adminko', 5, '3', 'О нас', 'Saving resource'),
(313, 1472675067, 1, 'adminko', 3, '3', 'О нас', 'Viewing data for resource'),
(314, 1472675074, 1, 'adminko', 27, '3', 'О нас', 'Editing resource'),
(315, 1472675089, 1, 'adminko', 61, '3', 'О нас', 'Publishing a resource'),
(316, 1472675091, 1, 'adminko', 3, '3', 'О нас', 'Viewing data for resource'),
(317, 1472676018, 1, 'adminko', 17, '-', '-', 'Editing settings'),
(318, 1472677263, 1, 'adminko', 30, '-', '-', 'Saving settings'),
(319, 1472677323, 1, 'adminko', 76, '-', '-', 'Element management'),
(320, 1472677326, 1, 'adminko', 16, '6', 'Во всю ширину', 'Editing template'),
(321, 1472725122, 1, 'adminko', 76, '-', '-', 'Element management'),
(322, 1472725127, 1, 'adminko', 78, '3', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(323, 1472725356, 1, 'adminko', 79, '3', 'HEAD', 'Saving Chunk (HTML Snippet)'),
(324, 1472725356, 1, 'adminko', 76, '-', '-', 'Element management'),
(325, 1472725468, 1, 'adminko', 78, '11', 'CONTENT', 'Editing Chunk (HTML Snippet)'),
(326, 1472725477, 1, 'adminko', 79, '11', 'CONTENT', 'Saving Chunk (HTML Snippet)'),
(327, 1472725477, 1, 'adminko', 76, '-', '-', 'Element management'),
(328, 1472726912, 1, 'adminko', 16, '6', 'Во всю ширину', 'Editing template'),
(329, 1472726965, 1, 'adminko', 20, '6', 'Во всю ширину', 'Saving template'),
(330, 1472726965, 1, 'adminko', 76, '-', '-', 'Element management'),
(331, 1472746583, 1, 'adminko', 17, '-', '-', 'Editing settings'),
(332, 1472747167, 1, 'adminko', 30, '-', '-', 'Saving settings'),
(333, 1472747681, 1, 'adminko', 76, '-', '-', 'Element management'),
(334, 1472747686, 1, 'adminko', 78, '9', 'BREADCRUMB', 'Editing Chunk (HTML Snippet)'),
(335, 1472747694, 1, 'adminko', 79, '9', 'BREADCRUMB', 'Saving Chunk (HTML Snippet)'),
(336, 1472747694, 1, 'adminko', 76, '-', '-', 'Element management'),
(337, 1472748512, 1, 'adminko', 78, '9', 'BREADCRUMB', 'Editing Chunk (HTML Snippet)'),
(338, 1472748533, 1, 'adminko', 76, '-', '-', 'Element management'),
(339, 1472750519, 1, 'adminko', 78, '9', 'BREADCRUMB', 'Editing Chunk (HTML Snippet)'),
(340, 1472750535, 1, 'adminko', 79, '9', 'BREADCRUMB', 'Saving Chunk (HTML Snippet)'),
(341, 1472750535, 1, 'adminko', 76, '-', '-', 'Element management'),
(342, 1472775241, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(343, 1472775380, 1, 'adminko', 5, '-', 'Первая новость', 'Saving resource'),
(344, 1472775382, 1, 'adminko', 3, '8', 'Первая новость', 'Viewing data for resource'),
(345, 1472775386, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(346, 1472775431, 1, 'adminko', 5, '-', 'Вторая новость', 'Saving resource'),
(347, 1472775433, 1, 'adminko', 3, '9', 'Вторая новость', 'Viewing data for resource'),
(348, 1472775437, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(349, 1472775446, 1, 'adminko', 5, '-', 'Третья новости', 'Saving resource'),
(350, 1472775448, 1, 'adminko', 3, '10', 'Третья новости', 'Viewing data for resource'),
(351, 1472775450, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(352, 1472775462, 1, 'adminko', 5, '-', 'Четвертая новости', 'Saving resource'),
(353, 1472775463, 1, 'adminko', 3, '11', 'Четвертая новости', 'Viewing data for resource'),
(354, 1472775465, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(355, 1472775485, 1, 'adminko', 5, '-', 'Пятая новость', 'Saving resource'),
(356, 1472775487, 1, 'adminko', 3, '12', 'Пятая новость', 'Viewing data for resource'),
(357, 1472775494, 1, 'adminko', 27, '8', 'Первая новость', 'Editing resource'),
(358, 1472775498, 1, 'adminko', 27, '9', 'Вторая новость', 'Editing resource'),
(359, 1472775523, 1, 'adminko', 5, '9', 'Вторая новость', 'Saving resource'),
(360, 1472775525, 1, 'adminko', 3, '9', 'Вторая новость', 'Viewing data for resource'),
(361, 1472775526, 1, 'adminko', 27, '10', 'Третья новости', 'Editing resource'),
(362, 1472776492, 1, 'adminko', 5, '10', 'Третья новости', 'Saving resource'),
(363, 1472776495, 1, 'adminko', 3, '10', 'Третья новости', 'Viewing data for resource'),
(364, 1472776496, 1, 'adminko', 27, '11', 'Четвертая новости', 'Editing resource'),
(365, 1472776611, 1, 'adminko', 5, '11', 'Четвертая новость', 'Saving resource'),
(366, 1472776612, 1, 'adminko', 3, '11', 'Четвертая новость', 'Viewing data for resource'),
(367, 1472776614, 1, 'adminko', 27, '12', 'Пятая новость', 'Editing resource'),
(368, 1472776932, 1, 'adminko', 5, '12', 'Пятая новость', 'Saving resource'),
(369, 1472776933, 1, 'adminko', 3, '12', 'Пятая новость', 'Viewing data for resource'),
(370, 1472777057, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(371, 1472777071, 1, 'adminko', 76, '-', '-', 'Element management'),
(372, 1472777076, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(373, 1472777103, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(374, 1472777105, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(375, 1472777160, 1, 'adminko', 76, '-', '-', 'Element management'),
(376, 1472777178, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(377, 1472777192, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(378, 1472777194, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(379, 1472777203, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(380, 1472777259, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(381, 1472777311, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(382, 1472777313, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(383, 1472777429, 1, 'adminko', 27, '12', 'Пятая новость', 'Editing resource'),
(384, 1472777452, 1, 'adminko', 5, '12', 'Пятая новость', 'Saving resource'),
(385, 1472777453, 1, 'adminko', 27, '11', 'Четвертая новость', 'Editing resource'),
(386, 1472777458, 1, 'adminko', 5, '11', 'Четвертая новость', 'Saving resource'),
(387, 1472777460, 1, 'adminko', 3, '11', 'Четвертая новость', 'Viewing data for resource'),
(388, 1472777462, 1, 'adminko', 27, '11', 'Четвертая новость', 'Editing resource'),
(389, 1472777465, 1, 'adminko', 27, '12', 'Пятая новость', 'Editing resource'),
(390, 1472777467, 1, 'adminko', 27, '8', 'Первая новость', 'Editing resource'),
(391, 1472777470, 1, 'adminko', 27, '8', 'Первая новость', 'Editing resource'),
(392, 1472777470, 1, 'adminko', 27, '9', 'Вторая новость', 'Editing resource'),
(393, 1472777474, 1, 'adminko', 5, '9', 'Вторая новость', 'Saving resource'),
(394, 1472777476, 1, 'adminko', 3, '9', 'Вторая новость', 'Viewing data for resource'),
(395, 1472777476, 1, 'adminko', 27, '10', 'Третья новости', 'Editing resource'),
(396, 1472777483, 1, 'adminko', 5, '10', 'Третья новости', 'Saving resource'),
(397, 1472777485, 1, 'adminko', 3, '10', 'Третья новости', 'Viewing data for resource'),
(398, 1472777496, 1, 'adminko', 27, '12', 'Пятая новость', 'Editing resource'),
(399, 1472777501, 1, 'adminko', 27, '11', 'Четвертая новость', 'Editing resource'),
(400, 1472777517, 1, 'adminko', 27, '10', 'Третья новости', 'Editing resource'),
(401, 1472777520, 1, 'adminko', 27, '9', 'Вторая новость', 'Editing resource'),
(402, 1472777524, 1, 'adminko', 27, '8', 'Первая новость', 'Editing resource'),
(403, 1472777543, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(404, 1472777598, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(405, 1472777599, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(406, 1472779116, 1, 'adminko', 76, '-', '-', 'Element management'),
(407, 1472779119, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(408, 1472779185, 1, 'adminko', 79, '-', 'news-article', 'Saving Chunk (HTML Snippet)'),
(409, 1472779185, 1, 'adminko', 76, '-', '-', 'Element management'),
(410, 1472779188, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(411, 1472779199, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(412, 1472779200, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(413, 1472779232, 1, 'adminko', 76, '-', '-', 'Element management'),
(414, 1472779235, 1, 'adminko', 78, '12', 'news-article', 'Editing Chunk (HTML Snippet)'),
(415, 1472779241, 1, 'adminko', 79, '12', 'news-article', 'Saving Chunk (HTML Snippet)'),
(416, 1472779241, 1, 'adminko', 76, '-', '-', 'Element management'),
(417, 1472779280, 1, 'adminko', 78, '12', 'news-article', 'Editing Chunk (HTML Snippet)'),
(418, 1472779294, 1, 'adminko', 79, '12', 'news-article', 'Saving Chunk (HTML Snippet)'),
(419, 1472779294, 1, 'adminko', 76, '-', '-', 'Element management'),
(420, 1472779535, 1, 'adminko', 76, '-', '-', 'Element management'),
(421, 1472779540, 1, 'adminko', 78, '12', 'news-article', 'Editing Chunk (HTML Snippet)'),
(422, 1472779544, 1, 'adminko', 79, '12', 'news-article', 'Saving Chunk (HTML Snippet)'),
(423, 1472779544, 1, 'adminko', 76, '-', '-', 'Element management'),
(424, 1472779641, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(425, 1472779654, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(426, 1472779655, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(427, 1472779681, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(428, 1472779686, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(429, 1472779688, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(430, 1472779700, 1, 'adminko', 76, '-', '-', 'Element management'),
(431, 1472779703, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(432, 1472779725, 1, 'adminko', 79, '-', 'newsline', 'Saving Chunk (HTML Snippet)'),
(433, 1472779725, 1, 'adminko', 76, '-', '-', 'Element management'),
(434, 1472779727, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(435, 1472779743, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(436, 1472779745, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(437, 1472816723, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(438, 1472816738, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(439, 1472816740, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(440, 1472816837, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(441, 1472816843, 1, 'adminko', 76, '-', '-', 'Element management'),
(442, 1472816846, 1, 'adminko', 78, '13', 'newsline', 'Editing Chunk (HTML Snippet)'),
(443, 1472816851, 1, 'adminko', 79, '13', 'newsline', 'Saving Chunk (HTML Snippet)'),
(444, 1472816851, 1, 'adminko', 76, '-', '-', 'Element management'),
(445, 1472816902, 1, 'adminko', 78, '13', 'newsline', 'Editing Chunk (HTML Snippet)'),
(446, 1472816907, 1, 'adminko', 79, '13', 'newsline', 'Saving Chunk (HTML Snippet)'),
(447, 1472816907, 1, 'adminko', 76, '-', '-', 'Element management'),
(448, 1472817175, 1, 'adminko', 23, '-', 'Новый сниппет', 'Creating a new Snippet'),
(449, 1472817245, 1, 'adminko', 24, '-', 'dittoSplitPagination', 'Saving Snippet'),
(450, 1472817245, 1, 'adminko', 76, '-', '-', 'Element management'),
(451, 1472817248, 1, 'adminko', 78, '13', 'newsline', 'Editing Chunk (HTML Snippet)'),
(452, 1472817258, 1, 'adminko', 79, '13', 'newsline', 'Saving Chunk (HTML Snippet)'),
(453, 1472817258, 1, 'adminko', 76, '-', '-', 'Element management'),
(454, 1472817374, 1, 'adminko', 78, '13', 'newsline', 'Editing Chunk (HTML Snippet)'),
(455, 1472817388, 1, 'adminko', 79, '13', 'newsline', 'Saving Chunk (HTML Snippet)'),
(456, 1472817388, 1, 'adminko', 76, '-', '-', 'Element management'),
(457, 1472819957, 1, 'adminko', 112, '1', 'Doc Manager', 'Execute module'),
(458, 1472820022, 1, 'adminko', 112, '1', 'Doc Manager', 'Менеджер ресурсов: свойство ресурсов "Показывать / Не показывать в меню" изменено.'),
(459, 1472820022, 1, 'adminko', 112, '1', 'Doc Manager', 'Execute module'),
(460, 1472823107, 1, 'adminko', 76, '-', '-', 'Element management'),
(461, 1472823166, 1, 'adminko', 300, '-', 'Новый параметр (TV)', 'Create Template Variable'),
(462, 1472823315, 1, 'adminko', 302, '-', 'Изображение для страницы', 'Save Template Variable'),
(463, 1472823315, 1, 'adminko', 76, '-', '-', 'Element management'),
(464, 1472823326, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(465, 1472823740, 1, 'adminko', 76, '-', '-', 'Element management'),
(466, 1472823790, 1, 'adminko', 76, '-', '-', 'Element management'),
(467, 1472823805, 1, 'adminko', 101, '-', 'Новый плагин', 'Create new plugin'),
(468, 1472823819, 1, 'adminko', 76, '-', '-', 'Element management'),
(469, 1472823829, 1, 'adminko', 102, '5', 'Quick Manager+', 'Edit plugin'),
(470, 1472823871, 1, 'adminko', 103, '5', 'Quick Manager+', 'Saving plugin'),
(471, 1472823871, 1, 'adminko', 76, '-', '-', 'Element management'),
(472, 1472823876, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(473, 1472823880, 1, 'adminko', 27, '8', 'Первая новость', 'Editing resource'),
(474, 1472823902, 1, 'adminko', 5, '8', 'Первая новость', 'Saving resource'),
(475, 1472823904, 1, 'adminko', 3, '8', 'Первая новость', 'Viewing data for resource'),
(476, 1472824440, 1, 'adminko', 76, '-', '-', 'Element management'),
(477, 1472824622, 1, 'adminko', 76, '-', '-', 'Element management'),
(478, 1472824632, 1, 'adminko', 102, '5', 'Quick Manager+', 'Edit plugin'),
(479, 1472824637, 1, 'adminko', 103, '5', 'Quick Manager+', 'Saving plugin'),
(480, 1472824638, 1, 'adminko', 76, '-', '-', 'Element management'),
(481, 1472824647, 1, 'adminko', 78, '6', 'MAIN-CONTENT', 'Editing Chunk (HTML Snippet)'),
(482, 1472824685, 1, 'adminko', 76, '-', '-', 'Element management'),
(483, 1472824687, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(484, 1472824704, 1, 'adminko', 79, '-', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(485, 1472824704, 1, 'adminko', 76, '-', '-', 'Element management'),
(486, 1472824723, 1, 'adminko', 78, '14', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(487, 1472824818, 1, 'adminko', 79, '14', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(488, 1472824818, 1, 'adminko', 76, '-', '-', 'Element management'),
(489, 1472824820, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(490, 1472824838, 1, 'adminko', 79, '-', 'news-main-last', 'Saving Chunk (HTML Snippet)'),
(491, 1472824838, 1, 'adminko', 76, '-', '-', 'Element management'),
(492, 1472824856, 1, 'adminko', 78, '6', 'MAIN-CONTENT', 'Editing Chunk (HTML Snippet)'),
(493, 1472824879, 1, 'adminko', 79, '6', 'MAIN-CONTENT', 'Saving Chunk (HTML Snippet)'),
(494, 1472824879, 1, 'adminko', 76, '-', '-', 'Element management'),
(495, 1472824887, 1, 'adminko', 27, '9', 'Вторая новость', 'Editing resource'),
(496, 1472824900, 1, 'adminko', 5, '9', 'Вторая новость', 'Saving resource'),
(497, 1472824902, 1, 'adminko', 3, '9', 'Вторая новость', 'Viewing data for resource'),
(498, 1472824903, 1, 'adminko', 27, '8', 'Первая новость', 'Editing resource'),
(499, 1472824909, 1, 'adminko', 27, '10', 'Третья новости', 'Editing resource'),
(500, 1472824918, 1, 'adminko', 5, '10', 'Третья новости', 'Saving resource'),
(501, 1472824920, 1, 'adminko', 3, '10', 'Третья новости', 'Viewing data for resource'),
(502, 1472824922, 1, 'adminko', 27, '11', 'Четвертая новость', 'Editing resource'),
(503, 1472824932, 1, 'adminko', 5, '11', 'Четвертая новость', 'Saving resource'),
(504, 1472824934, 1, 'adminko', 3, '11', 'Четвертая новость', 'Viewing data for resource'),
(505, 1472824935, 1, 'adminko', 27, '12', 'Пятая новость', 'Editing resource'),
(506, 1472824944, 1, 'adminko', 5, '12', 'Пятая новость', 'Saving resource'),
(507, 1472824946, 1, 'adminko', 3, '12', 'Пятая новость', 'Viewing data for resource'),
(508, 1472824997, 1, 'adminko', 76, '-', '-', 'Element management'),
(509, 1472825000, 1, 'adminko', 78, '14', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(510, 1472825004, 1, 'adminko', 79, '14', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(511, 1472825004, 1, 'adminko', 76, '-', '-', 'Element management'),
(512, 1472825038, 1, 'adminko', 78, '14', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(513, 1472825042, 1, 'adminko', 79, '14', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(514, 1472825042, 1, 'adminko', 76, '-', '-', 'Element management'),
(515, 1472825056, 1, 'adminko', 78, '15', 'news-main-last', 'Editing Chunk (HTML Snippet)'),
(516, 1472825061, 1, 'adminko', 79, '15', 'news-main-last', 'Saving Chunk (HTML Snippet)'),
(517, 1472825061, 1, 'adminko', 76, '-', '-', 'Element management'),
(518, 1472825078, 1, 'adminko', 78, '14', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(519, 1472825080, 1, 'adminko', 76, '-', '-', 'Element management'),
(520, 1472825082, 1, 'adminko', 78, '13', 'newsline', 'Editing Chunk (HTML Snippet)'),
(521, 1472825088, 1, 'adminko', 79, '13', 'newsline', 'Saving Chunk (HTML Snippet)'),
(522, 1472825088, 1, 'adminko', 76, '-', '-', 'Element management'),
(523, 1472825108, 1, 'adminko', 78, '12', 'news-article', 'Editing Chunk (HTML Snippet)'),
(524, 1472825110, 1, 'adminko', 76, '-', '-', 'Element management'),
(525, 1472825198, 1, 'adminko', 78, '6', 'MAIN-CONTENT', 'Editing Chunk (HTML Snippet)'),
(526, 1472825203, 1, 'adminko', 79, '6', 'MAIN-CONTENT', 'Saving Chunk (HTML Snippet)'),
(527, 1472825203, 1, 'adminko', 76, '-', '-', 'Element management'),
(528, 1472825211, 1, 'adminko', 78, '14', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(529, 1472825227, 1, 'adminko', 79, '14', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(530, 1472825227, 1, 'adminko', 76, '-', '-', 'Element management'),
(531, 1472825258, 1, 'adminko', 78, '13', 'newsline', 'Editing Chunk (HTML Snippet)'),
(532, 1472825278, 1, 'adminko', 79, '13', 'newsline', 'Saving Chunk (HTML Snippet)'),
(533, 1472825278, 1, 'adminko', 76, '-', '-', 'Element management'),
(534, 1472825286, 1, 'adminko', 78, '15', 'news-main-last', 'Editing Chunk (HTML Snippet)'),
(535, 1472825292, 1, 'adminko', 79, '15', 'news-main-last', 'Saving Chunk (HTML Snippet)'),
(536, 1472825292, 1, 'adminko', 76, '-', '-', 'Element management'),
(537, 1472825300, 1, 'adminko', 78, '13', 'newsline', 'Editing Chunk (HTML Snippet)'),
(538, 1472825313, 1, 'adminko', 79, '13', 'news-main', 'Saving Chunk (HTML Snippet)'),
(539, 1472825313, 1, 'adminko', 76, '-', '-', 'Element management'),
(540, 1472825368, 1, 'adminko', 78, '14', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(541, 1472825373, 1, 'adminko', 79, '14', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(542, 1472825373, 1, 'adminko', 76, '-', '-', 'Element management'),
(543, 1472825394, 1, 'adminko', 78, '13', 'news-main', 'Editing Chunk (HTML Snippet)'),
(544, 1472825400, 1, 'adminko', 79, '13', 'news-main', 'Saving Chunk (HTML Snippet)'),
(545, 1472825400, 1, 'adminko', 76, '-', '-', 'Element management'),
(546, 1472825408, 1, 'adminko', 78, '15', 'news-main-last', 'Editing Chunk (HTML Snippet)'),
(547, 1472825420, 1, 'adminko', 79, '15', 'news-main-last', 'Saving Chunk (HTML Snippet)'),
(548, 1472825420, 1, 'adminko', 76, '-', '-', 'Element management'),
(549, 1472825471, 1, 'adminko', 78, '6', 'MAIN-CONTENT', 'Editing Chunk (HTML Snippet)'),
(550, 1472825475, 1, 'adminko', 79, '6', 'MAIN-CONTENT', 'Saving Chunk (HTML Snippet)'),
(551, 1472825475, 1, 'adminko', 76, '-', '-', 'Element management'),
(552, 1472825840, 1, 'adminko', 102, '5', 'Quick Manager+', 'Edit plugin'),
(553, 1472825845, 1, 'adminko', 103, '5', 'Quick Manager+', 'Saving plugin'),
(554, 1472825845, 1, 'adminko', 76, '-', '-', 'Element management'),
(555, 1472825854, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(556, 1472825866, 1, 'adminko', 76, '-', '-', 'Element management'),
(557, 1472825938, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(558, 1472825949, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(559, 1472825951, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(560, 1472825973, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(561, 1472825989, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(562, 1472825991, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(563, 1472826020, 1, 'adminko', 76, '-', '-', 'Element management'),
(564, 1472826023, 1, 'adminko', 78, '14', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(565, 1472826045, 1, 'adminko', 76, '-', '-', 'Element management'),
(566, 1472826048, 1, 'adminko', 78, '14', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(567, 1472826054, 1, 'adminko', 76, '-', '-', 'Element management'),
(568, 1472826056, 1, 'adminko', 78, '13', 'news-main', 'Editing Chunk (HTML Snippet)'),
(569, 1472826063, 1, 'adminko', 79, '13', 'news-main', 'Saving Chunk (HTML Snippet)'),
(570, 1472826063, 1, 'adminko', 76, '-', '-', 'Element management'),
(571, 1472826072, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(572, 1472826085, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(573, 1472826086, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(574, 1472826108, 1, 'adminko', 76, '-', '-', 'Element management'),
(575, 1472826112, 1, 'adminko', 78, '15', 'news-main-last', 'Editing Chunk (HTML Snippet)'),
(576, 1472826115, 1, 'adminko', 79, '15', 'news-main-last', 'Saving Chunk (HTML Snippet)'),
(577, 1472826115, 1, 'adminko', 76, '-', '-', 'Element management'),
(578, 1472826140, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(579, 1472826149, 1, 'adminko', 76, '-', '-', 'Element management'),
(580, 1472826153, 1, 'adminko', 78, '13', 'news-main', 'Editing Chunk (HTML Snippet)'),
(581, 1472826156, 1, 'adminko', 76, '-', '-', 'Element management'),
(582, 1472826159, 1, 'adminko', 78, '6', 'MAIN-CONTENT', 'Editing Chunk (HTML Snippet)'),
(583, 1472826169, 1, 'adminko', 79, '6', 'MAIN-CONTENT', 'Saving Chunk (HTML Snippet)'),
(584, 1472826169, 1, 'adminko', 76, '-', '-', 'Element management'),
(585, 1472826171, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(586, 1472826178, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(587, 1472826179, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(588, 1472826223, 1, 'adminko', 112, '1', 'Doc Manager', 'Execute module'),
(589, 1472826400, 1, 'adminko', 76, '-', '-', 'Element management'),
(590, 1472826403, 1, 'adminko', 78, '14', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(591, 1472826429, 1, 'adminko', 79, '14', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(592, 1472826429, 1, 'adminko', 76, '-', '-', 'Element management'),
(593, 1472826527, 1, 'adminko', 78, '13', 'news-main', 'Editing Chunk (HTML Snippet)'),
(594, 1472826543, 1, 'adminko', 79, '13', 'news-main', 'Saving Chunk (HTML Snippet)'),
(595, 1472826543, 1, 'adminko', 76, '-', '-', 'Element management'),
(596, 1472826627, 1, 'adminko', 78, '6', 'MAIN-CONTENT', 'Editing Chunk (HTML Snippet)'),
(597, 1472826648, 1, 'adminko', 76, '-', '-', 'Element management'),
(598, 1472826656, 1, 'adminko', 78, '13', 'news-main', 'Editing Chunk (HTML Snippet)'),
(599, 1472826665, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(600, 1472826671, 1, 'adminko', 27, '12', 'Пятая новость', 'Editing resource'),
(601, 1472826678, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(602, 1472826687, 1, 'adminko', 76, '-', '-', 'Element management'),
(603, 1472826699, 1, 'adminko', 78, '13', 'news-main', 'Editing Chunk (HTML Snippet)'),
(604, 1472826703, 1, 'adminko', 80, '13', 'news-main', 'Deleting Chunk (HTML Snippet)'),
(605, 1472826703, 1, 'adminko', 76, '-', '-', 'Element management'),
(606, 1472826705, 1, 'adminko', 78, '15', 'news-main-last', 'Editing Chunk (HTML Snippet)'),
(607, 1472826707, 1, 'adminko', 80, '15', 'news-main-last', 'Deleting Chunk (HTML Snippet)'),
(608, 1472826707, 1, 'adminko', 76, '-', '-', 'Element management'),
(609, 1472826709, 1, 'adminko', 78, '14', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(610, 1472826712, 1, 'adminko', 80, '14', 'newsline-main', 'Deleting Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`) VALUES
(611, 1472826712, 1, 'adminko', 76, '-', '-', 'Element management'),
(612, 1472826718, 1, 'adminko', 78, '12', 'news-article', 'Editing Chunk (HTML Snippet)'),
(613, 1472826726, 1, 'adminko', 79, '12', 'news-article', 'Saving Chunk (HTML Snippet)'),
(614, 1472826726, 1, 'adminko', 76, '-', '-', 'Element management'),
(615, 1472827762, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(616, 1472827800, 1, 'adminko', 79, '-', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(617, 1472827800, 1, 'adminko', 76, '-', '-', 'Element management'),
(618, 1472827807, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(619, 1472827831, 1, 'adminko', 79, '-', 'news-main', 'Saving Chunk (HTML Snippet)'),
(620, 1472827831, 1, 'adminko', 76, '-', '-', 'Element management'),
(621, 1472827834, 1, 'adminko', 78, '16', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(622, 1472827837, 1, 'adminko', 79, '16', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(623, 1472827838, 1, 'adminko', 76, '-', '-', 'Element management'),
(624, 1472827844, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(625, 1472827872, 1, 'adminko', 79, '-', 'news-main-last', 'Saving Chunk (HTML Snippet)'),
(626, 1472827872, 1, 'adminko', 76, '-', '-', 'Element management'),
(627, 1472827876, 1, 'adminko', 78, '18', 'news-main-last', 'Editing Chunk (HTML Snippet)'),
(628, 1472827883, 1, 'adminko', 79, '18', 'news-main-last', 'Saving Chunk (HTML Snippet)'),
(629, 1472827883, 1, 'adminko', 76, '-', '-', 'Element management'),
(630, 1472827885, 1, 'adminko', 78, '17', 'news-main', 'Editing Chunk (HTML Snippet)'),
(631, 1472827894, 1, 'adminko', 76, '-', '-', 'Element management'),
(632, 1472827896, 1, 'adminko', 78, '18', 'news-main-last', 'Editing Chunk (HTML Snippet)'),
(633, 1472827899, 1, 'adminko', 76, '-', '-', 'Element management'),
(634, 1472827900, 1, 'adminko', 78, '16', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(635, 1472827910, 1, 'adminko', 79, '16', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(636, 1472827910, 1, 'adminko', 76, '-', '-', 'Element management'),
(637, 1472828017, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(638, 1472828037, 1, 'adminko', 79, '-', 'newsline', 'Saving Chunk (HTML Snippet)'),
(639, 1472828037, 1, 'adminko', 76, '-', '-', 'Element management'),
(640, 1472828106, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(641, 1472828140, 1, 'adminko', 76, '-', '-', 'Element management'),
(642, 1472828144, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(643, 1472828155, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(644, 1472828155, 1, 'adminko', 76, '-', '-', 'Element management'),
(645, 1472828163, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(646, 1472828165, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(647, 1472828179, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(648, 1472828181, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(649, 1472828212, 1, 'adminko', 76, '-', '-', 'Element management'),
(650, 1472828217, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(651, 1472828238, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(652, 1472828238, 1, 'adminko', 76, '-', '-', 'Element management'),
(653, 1472828262, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(654, 1472828306, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(655, 1472828306, 1, 'adminko', 76, '-', '-', 'Element management'),
(656, 1472828318, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(657, 1472828334, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(658, 1472828334, 1, 'adminko', 76, '-', '-', 'Element management'),
(659, 1472828337, 1, 'adminko', 22, '19', 'dittoSplitPagination', 'Editing Snippet'),
(660, 1472828368, 1, 'adminko', 24, '19', 'dittoSplitPagination', 'Saving Snippet'),
(661, 1472828368, 1, 'adminko', 76, '-', '-', 'Element management'),
(662, 1472828444, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(663, 1472828463, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(664, 1472828463, 1, 'adminko', 76, '-', '-', 'Element management'),
(665, 1472828475, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(666, 1472828510, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(667, 1472828510, 1, 'adminko', 76, '-', '-', 'Element management'),
(668, 1472828512, 1, 'adminko', 78, '12', 'news-article', 'Editing Chunk (HTML Snippet)'),
(669, 1472828530, 1, 'adminko', 79, '12', 'news-article', 'Saving Chunk (HTML Snippet)'),
(670, 1472828530, 1, 'adminko', 76, '-', '-', 'Element management'),
(671, 1472828540, 1, 'adminko', 78, '12', 'news-article', 'Editing Chunk (HTML Snippet)'),
(672, 1472828547, 1, 'adminko', 79, '12', 'news-article', 'Saving Chunk (HTML Snippet)'),
(673, 1472828547, 1, 'adminko', 76, '-', '-', 'Element management'),
(674, 1472829488, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(675, 1472829495, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(676, 1472829495, 1, 'adminko', 76, '-', '-', 'Element management'),
(677, 1472829505, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(678, 1472829534, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(679, 1472829534, 1, 'adminko', 76, '-', '-', 'Element management'),
(680, 1472829546, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(681, 1472829564, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(682, 1472829564, 1, 'adminko', 76, '-', '-', 'Element management'),
(683, 1472829669, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(684, 1472829678, 1, 'adminko', 5, '4', 'Новости', 'Saving resource'),
(685, 1472829680, 1, 'adminko', 3, '4', 'Новости', 'Viewing data for resource'),
(686, 1472829682, 1, 'adminko', 76, '-', '-', 'Element management'),
(687, 1472829687, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(688, 1472829722, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(689, 1472829722, 1, 'adminko', 76, '-', '-', 'Element management'),
(690, 1472829731, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(691, 1472829753, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(692, 1472829754, 1, 'adminko', 76, '-', '-', 'Element management'),
(693, 1472829768, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(694, 1472829776, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(695, 1472829776, 1, 'adminko', 76, '-', '-', 'Element management'),
(696, 1472829865, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(697, 1472829876, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(698, 1472829876, 1, 'adminko', 76, '-', '-', 'Element management'),
(699, 1472829886, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(700, 1472829908, 1, 'adminko', 27, '12', 'Пятая новость', 'Editing resource'),
(701, 1472829914, 1, 'adminko', 5, '12', 'Пятая новость', 'Saving resource'),
(702, 1472829915, 1, 'adminko', 3, '12', 'Пятая новость', 'Viewing data for resource'),
(703, 1472829916, 1, 'adminko', 27, '11', 'Четвертая новость', 'Editing resource'),
(704, 1472829920, 1, 'adminko', 5, '11', 'Четвертая новость', 'Saving resource'),
(705, 1472829922, 1, 'adminko', 3, '11', 'Четвертая новость', 'Viewing data for resource'),
(706, 1472829922, 1, 'adminko', 27, '10', 'Третья новости', 'Editing resource'),
(707, 1472834023, 1, 'adminko', 5, '10', 'Третья новости', 'Saving resource'),
(708, 1472834025, 1, 'adminko', 3, '10', 'Третья новости', 'Viewing data for resource'),
(709, 1472834026, 1, 'adminko', 27, '10', 'Третья новости', 'Editing resource'),
(710, 1472834031, 1, 'adminko', 5, '10', 'Третья новости', 'Saving resource'),
(711, 1472834033, 1, 'adminko', 3, '10', 'Третья новости', 'Viewing data for resource'),
(712, 1472834034, 1, 'adminko', 27, '9', 'Вторая новость', 'Editing resource'),
(713, 1472834040, 1, 'adminko', 5, '9', 'Вторая новость', 'Saving resource'),
(714, 1472834041, 1, 'adminko', 3, '9', 'Вторая новость', 'Viewing data for resource'),
(715, 1472834042, 1, 'adminko', 27, '8', 'Первая новость', 'Editing resource'),
(716, 1472834047, 1, 'adminko', 5, '8', 'Первая новость', 'Saving resource'),
(717, 1472834049, 1, 'adminko', 3, '8', 'Первая новость', 'Viewing data for resource'),
(718, 1472834061, 1, 'adminko', 76, '-', '-', 'Element management'),
(719, 1472834068, 1, 'adminko', 64, '-', '-', 'Removing deleted content'),
(720, 1472834073, 1, 'adminko', 76, '-', '-', 'Element management'),
(721, 1472834076, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(722, 1472834096, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(723, 1472834096, 1, 'adminko', 76, '-', '-', 'Element management'),
(724, 1472834113, 1, 'adminko', 78, '9', 'BREADCRUMB', 'Editing Chunk (HTML Snippet)'),
(725, 1472834120, 1, 'adminko', 76, '-', '-', 'Element management'),
(726, 1472834125, 1, 'adminko', 78, '6', 'MAIN-CONTENT', 'Editing Chunk (HTML Snippet)'),
(727, 1472834128, 1, 'adminko', 76, '-', '-', 'Element management'),
(728, 1472834135, 1, 'adminko', 78, '17', 'news-main', 'Editing Chunk (HTML Snippet)'),
(729, 1472834138, 1, 'adminko', 76, '-', '-', 'Element management'),
(730, 1472834166, 1, 'adminko', 78, '17', 'news-main', 'Editing Chunk (HTML Snippet)'),
(731, 1472834169, 1, 'adminko', 76, '-', '-', 'Element management'),
(732, 1472834170, 1, 'adminko', 78, '12', 'news-article', 'Editing Chunk (HTML Snippet)'),
(733, 1472834173, 1, 'adminko', 76, '-', '-', 'Element management'),
(734, 1472834175, 1, 'adminko', 78, '18', 'news-main-last', 'Editing Chunk (HTML Snippet)'),
(735, 1472834177, 1, 'adminko', 76, '-', '-', 'Element management'),
(736, 1472834179, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(737, 1472834181, 1, 'adminko', 76, '-', '-', 'Element management'),
(738, 1472834183, 1, 'adminko', 78, '16', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(739, 1472834199, 1, 'adminko', 79, '16', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(740, 1472834199, 1, 'adminko', 76, '-', '-', 'Element management'),
(741, 1472834227, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(742, 1472834242, 1, 'adminko', 76, '-', '-', 'Element management'),
(743, 1472834245, 1, 'adminko', 78, '16', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(744, 1472834265, 1, 'adminko', 79, '16', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(745, 1472834265, 1, 'adminko', 76, '-', '-', 'Element management'),
(746, 1472834278, 1, 'adminko', 78, '16', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(747, 1472834283, 1, 'adminko', 79, '16', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(748, 1472834283, 1, 'adminko', 76, '-', '-', 'Element management'),
(749, 1472834314, 1, 'adminko', 78, '16', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(750, 1472834320, 1, 'adminko', 79, '16', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(751, 1472834320, 1, 'adminko', 76, '-', '-', 'Element management'),
(752, 1472834323, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(753, 1472834328, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(754, 1472834328, 1, 'adminko', 76, '-', '-', 'Element management'),
(755, 1472834341, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(756, 1472834345, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(757, 1472834345, 1, 'adminko', 76, '-', '-', 'Element management'),
(758, 1472834347, 1, 'adminko', 78, '16', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(759, 1472834351, 1, 'adminko', 79, '16', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(760, 1472834352, 1, 'adminko', 76, '-', '-', 'Element management'),
(761, 1472834354, 1, 'adminko', 78, '16', 'newsline-main', 'Editing Chunk (HTML Snippet)'),
(762, 1472834646, 1, 'adminko', 79, '16', 'newsline-main', 'Saving Chunk (HTML Snippet)'),
(763, 1472834646, 1, 'adminko', 76, '-', '-', 'Element management'),
(764, 1472834767, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(765, 1472834781, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(766, 1472834781, 1, 'adminko', 76, '-', '-', 'Element management'),
(767, 1472834827, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(768, 1472834841, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(769, 1472834842, 1, 'adminko', 76, '-', '-', 'Element management'),
(770, 1472835034, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(771, 1472835049, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(772, 1472835049, 1, 'adminko', 76, '-', '-', 'Element management'),
(773, 1472835056, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(774, 1472835061, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(775, 1472835061, 1, 'adminko', 76, '-', '-', 'Element management'),
(776, 1472835103, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(777, 1472835117, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(778, 1472835117, 1, 'adminko', 76, '-', '-', 'Element management'),
(779, 1472835137, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(780, 1472835173, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(781, 1472835173, 1, 'adminko', 76, '-', '-', 'Element management'),
(782, 1472835191, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(783, 1472835210, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(784, 1472835248, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(785, 1472835248, 1, 'adminko', 76, '-', '-', 'Element management'),
(786, 1472835262, 1, 'adminko', 17, '-', '-', 'Editing settings'),
(787, 1472835301, 1, 'adminko', 30, '-', '-', 'Saving settings'),
(788, 1472835323, 1, 'adminko', 17, '-', '-', 'Editing settings'),
(789, 1472835356, 1, 'adminko', 30, '-', '-', 'Saving settings'),
(790, 1472835387, 1, 'adminko', 76, '-', '-', 'Element management'),
(791, 1472835390, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(792, 1472835397, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(793, 1472835397, 1, 'adminko', 76, '-', '-', 'Element management'),
(794, 1472835411, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(795, 1472835439, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(796, 1472835439, 1, 'adminko', 76, '-', '-', 'Element management'),
(797, 1472835461, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(798, 1472835474, 1, 'adminko', 76, '-', '-', 'Element management'),
(799, 1472835479, 1, 'adminko', 22, '19', 'dittoSplitPagination', 'Editing Snippet'),
(800, 1472835598, 1, 'adminko', 24, '19', 'dittoSplitPagination', 'Saving Snippet'),
(801, 1472835598, 1, 'adminko', 76, '-', '-', 'Element management'),
(802, 1472835625, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(803, 1472835632, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(804, 1472835632, 1, 'adminko', 76, '-', '-', 'Element management'),
(805, 1472835641, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(806, 1472835649, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(807, 1472835649, 1, 'adminko', 76, '-', '-', 'Element management'),
(808, 1472835675, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(809, 1472835691, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(810, 1472835691, 1, 'adminko', 76, '-', '-', 'Element management'),
(811, 1472835697, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(812, 1472835705, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(813, 1472835705, 1, 'adminko', 76, '-', '-', 'Element management'),
(814, 1472835714, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(815, 1472835720, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(816, 1472835720, 1, 'adminko', 76, '-', '-', 'Element management'),
(817, 1472835866, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(818, 1472835883, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(819, 1472835883, 1, 'adminko', 76, '-', '-', 'Element management'),
(820, 1472835892, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(821, 1472835898, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(822, 1472835898, 1, 'adminko', 76, '-', '-', 'Element management'),
(823, 1472835963, 1, 'adminko', 78, '19', 'newsline', 'Editing Chunk (HTML Snippet)'),
(824, 1472835970, 1, 'adminko', 79, '19', 'newsline', 'Saving Chunk (HTML Snippet)'),
(825, 1472835970, 1, 'adminko', 76, '-', '-', 'Element management'),
(826, 1472850047, 1, 'adminko', 22, '5', 'eForm', 'Editing Snippet'),
(827, 1472850073, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(828, 1472850086, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(829, 1472850087, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(830, 1472850274, 1, 'adminko', 76, '-', '-', 'Element management'),
(831, 1472850278, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(832, 1472850296, 1, 'adminko', 79, '-', 'form-tpl', 'Saving Chunk (HTML Snippet)'),
(833, 1472850296, 1, 'adminko', 76, '-', '-', 'Element management'),
(834, 1472850870, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(835, 1472850898, 1, 'adminko', 79, '-', 'report-tpl', 'Saving Chunk (HTML Snippet)'),
(836, 1472850898, 1, 'adminko', 76, '-', '-', 'Element management'),
(837, 1472850921, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(838, 1472850934, 1, 'adminko', 79, '-', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(839, 1472850934, 1, 'adminko', 76, '-', '-', 'Element management'),
(840, 1472850946, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(841, 1472850958, 1, 'adminko', 79, '-', 'form', 'Saving Chunk (HTML Snippet)'),
(842, 1472850958, 1, 'adminko', 76, '-', '-', 'Element management'),
(843, 1472850974, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(844, 1472850986, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(845, 1472850987, 1, 'adminko', 76, '-', '-', 'Element management'),
(846, 1472850993, 1, 'adminko', 78, '21', 'report-tpl', 'Editing Chunk (HTML Snippet)'),
(847, 1472850997, 1, 'adminko', 79, '21', 'report-tpl', 'Saving Chunk (HTML Snippet)'),
(848, 1472850997, 1, 'adminko', 76, '-', '-', 'Element management'),
(849, 1472851003, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(850, 1472851005, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(851, 1472851006, 1, 'adminko', 76, '-', '-', 'Element management'),
(852, 1472851012, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(853, 1472851019, 1, 'adminko', 79, '20', 'form-tpl', 'Saving Chunk (HTML Snippet)'),
(854, 1472851019, 1, 'adminko', 76, '-', '-', 'Element management'),
(855, 1472851027, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(856, 1472851039, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(857, 1472851040, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(858, 1472851250, 1, 'adminko', 76, '-', '-', 'Element management'),
(859, 1472851256, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(860, 1472851278, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(861, 1472851278, 1, 'adminko', 76, '-', '-', 'Element management'),
(862, 1472851822, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(863, 1472851829, 1, 'adminko', 76, '-', '-', 'Element management'),
(864, 1472851837, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(865, 1472851930, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(866, 1472851930, 1, 'adminko', 76, '-', '-', 'Element management'),
(867, 1472851992, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(868, 1472852064, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(869, 1472852064, 1, 'adminko', 76, '-', '-', 'Element management'),
(870, 1472852072, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(871, 1472852129, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(872, 1472852161, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(873, 1472852163, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(874, 1472852173, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(875, 1472852208, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(876, 1472852210, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(877, 1472852238, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(878, 1472852255, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(879, 1472852257, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(880, 1472852260, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(881, 1472852262, 1, 'adminko', 76, '-', '-', 'Element management'),
(882, 1472852266, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(883, 1472852304, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(884, 1472852304, 1, 'adminko', 76, '-', '-', 'Element management'),
(885, 1472852330, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(886, 1472852392, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(887, 1472852392, 1, 'adminko', 76, '-', '-', 'Element management'),
(888, 1472853029, 1, 'adminko', 78, '3', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(889, 1472853037, 1, 'adminko', 79, '3', 'HEAD', 'Saving Chunk (HTML Snippet)'),
(890, 1472853037, 1, 'adminko', 76, '-', '-', 'Element management'),
(891, 1472853193, 1, 'adminko', 19, '-', 'Новый шаблон', 'Creating a new template'),
(892, 1472853213, 1, 'adminko', 20, '-', 'Форма связи', 'Saving template'),
(893, 1472853213, 1, 'adminko', 76, '-', '-', 'Element management'),
(894, 1472853223, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(895, 1472853275, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(896, 1472853309, 1, 'adminko', 76, '-', '-', 'Element management'),
(897, 1472853312, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(898, 1472853332, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(899, 1472853332, 1, 'adminko', 76, '-', '-', 'Element management'),
(900, 1472853335, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(901, 1472853340, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(902, 1472853422, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(903, 1472853424, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(904, 1472853488, 1, 'adminko', 27, '4', 'Новости', 'Editing resource'),
(905, 1472853491, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(906, 1472853494, 1, 'adminko', 76, '-', '-', 'Element management'),
(907, 1472853502, 1, 'adminko', 78, '3', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(908, 1472853515, 1, 'adminko', 79, '3', 'HEAD', 'Saving Chunk (HTML Snippet)'),
(909, 1472853515, 1, 'adminko', 76, '-', '-', 'Element management'),
(910, 1472853531, 1, 'adminko', 78, '3', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(911, 1472853570, 1, 'adminko', 79, '3', 'HEAD', 'Saving Chunk (HTML Snippet)'),
(912, 1472853570, 1, 'adminko', 76, '-', '-', 'Element management'),
(913, 1472853572, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(914, 1472853603, 1, 'adminko', 76, '-', '-', 'Element management'),
(915, 1472853606, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(916, 1472853686, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(917, 1472853687, 1, 'adminko', 76, '-', '-', 'Element management'),
(918, 1472853715, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(919, 1472853837, 1, 'adminko', 76, '-', '-', 'Element management'),
(920, 1472853848, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(921, 1472853898, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(922, 1472853900, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(923, 1472854144, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(924, 1472854167, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(925, 1472854169, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(926, 1472854180, 1, 'adminko', 76, '-', '-', 'Element management'),
(927, 1472854183, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(928, 1472854191, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(929, 1472854191, 1, 'adminko', 76, '-', '-', 'Element management'),
(930, 1472854232, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(931, 1472854239, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(932, 1472854239, 1, 'adminko', 76, '-', '-', 'Element management'),
(933, 1472854247, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(934, 1472854251, 1, 'adminko', 79, '20', 'form-tpl', 'Saving Chunk (HTML Snippet)'),
(935, 1472854251, 1, 'adminko', 76, '-', '-', 'Element management'),
(936, 1472854278, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(937, 1472854295, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(938, 1472854295, 1, 'adminko', 76, '-', '-', 'Element management'),
(939, 1472854309, 1, 'adminko', 78, '21', 'report-tpl', 'Editing Chunk (HTML Snippet)'),
(940, 1472854322, 1, 'adminko', 76, '-', '-', 'Element management'),
(941, 1472854324, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(942, 1472854363, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(943, 1472854363, 1, 'adminko', 76, '-', '-', 'Element management'),
(944, 1472854513, 1, 'adminko', 101, '-', 'Новый плагин', 'Create new plugin'),
(945, 1472854625, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(946, 1472854629, 1, 'adminko', 76, '-', '-', 'Element management'),
(947, 1472854636, 1, 'adminko', 16, '7', 'Форма связи', 'Editing template'),
(948, 1472854656, 1, 'adminko', 20, '7', 'Форма связи', 'Saving template'),
(949, 1472854656, 1, 'adminko', 76, '-', '-', 'Element management'),
(950, 1472854671, 1, 'adminko', 76, '-', '-', 'Element management'),
(951, 1472854716, 1, 'adminko', 16, '7', 'Форма связи', 'Editing template'),
(952, 1472854723, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(953, 1472854735, 1, 'adminko', 76, '-', '-', 'Element management'),
(954, 1472854737, 1, 'adminko', 16, '7', 'Форма связи', 'Editing template'),
(955, 1472854746, 1, 'adminko', 20, '7', 'Форма связи', 'Saving template'),
(956, 1472854746, 1, 'adminko', 76, '-', '-', 'Element management'),
(957, 1472854748, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(958, 1472854752, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(959, 1472854754, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(960, 1472854756, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(961, 1472854779, 1, 'adminko', 76, '-', '-', 'Element management'),
(962, 1472854783, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(963, 1472854793, 1, 'adminko', 79, '20', 'form-tpl', 'Saving Chunk (HTML Snippet)'),
(964, 1472854793, 1, 'adminko', 76, '-', '-', 'Element management'),
(965, 1472854798, 1, 'adminko', 78, '21', 'report-tpl', 'Editing Chunk (HTML Snippet)'),
(966, 1472854800, 1, 'adminko', 79, '21', 'report-tpl', 'Saving Chunk (HTML Snippet)'),
(967, 1472854800, 1, 'adminko', 76, '-', '-', 'Element management'),
(968, 1472854833, 1, 'adminko', 16, '7', 'Форма связи', 'Editing template'),
(969, 1472854885, 1, 'adminko', 20, '7', 'Форма связи', 'Saving template'),
(970, 1472854885, 1, 'adminko', 76, '-', '-', 'Element management'),
(971, 1472854907, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(972, 1472854947, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(973, 1472854947, 1, 'adminko', 76, '-', '-', 'Element management'),
(974, 1472854954, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(975, 1472854956, 1, 'adminko', 76, '-', '-', 'Element management'),
(976, 1472854958, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(977, 1472854996, 1, 'adminko', 79, '20', 'form-tpl', 'Saving Chunk (HTML Snippet)'),
(978, 1472854996, 1, 'adminko', 76, '-', '-', 'Element management'),
(979, 1472855018, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(980, 1472855262, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(981, 1472855264, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(982, 1472855265, 1, 'adminko', 76, '-', '-', 'Element management'),
(983, 1472855267, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(984, 1472855272, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(985, 1472855272, 1, 'adminko', 76, '-', '-', 'Element management'),
(986, 1472855283, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(987, 1472855291, 1, 'adminko', 76, '-', '-', 'Element management'),
(988, 1472855294, 1, 'adminko', 78, '21', 'report-tpl', 'Editing Chunk (HTML Snippet)'),
(989, 1472855296, 1, 'adminko', 79, '21', 'report-tpl', 'Saving Chunk (HTML Snippet)'),
(990, 1472855296, 1, 'adminko', 76, '-', '-', 'Element management'),
(991, 1472855303, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(992, 1472855309, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(993, 1472855309, 1, 'adminko', 76, '-', '-', 'Element management'),
(994, 1472855318, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(995, 1472855323, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(996, 1472855323, 1, 'adminko', 76, '-', '-', 'Element management'),
(997, 1472855332, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(998, 1472855336, 1, 'adminko', 79, '20', 'form-tpl', 'Saving Chunk (HTML Snippet)'),
(999, 1472855336, 1, 'adminko', 76, '-', '-', 'Element management'),
(1000, 1472855341, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1001, 1472855353, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1002, 1472855361, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1003, 1472855363, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1004, 1472855365, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1005, 1472855388, 1, 'adminko', 76, '-', '-', 'Element management'),
(1006, 1472855436, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1007, 1472855498, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1008, 1472855498, 1, 'adminko', 76, '-', '-', 'Element management'),
(1009, 1472855536, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1010, 1472855547, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1011, 1472855547, 1, 'adminko', 76, '-', '-', 'Element management'),
(1012, 1472855550, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1013, 1472856219, 1, 'adminko', 76, '-', '-', 'Element management'),
(1014, 1472856222, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1015, 1472856666, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1016, 1472856778, 1, 'adminko', 76, '-', '-', 'Element management'),
(1017, 1472856781, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1018, 1472856791, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1019, 1472856791, 1, 'adminko', 76, '-', '-', 'Element management'),
(1020, 1472856814, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1021, 1472856831, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1022, 1472856832, 1, 'adminko', 76, '-', '-', 'Element management'),
(1023, 1472856853, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1024, 1472856885, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1025, 1472856886, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1026, 1472857016, 1, 'adminko', 76, '-', '-', 'Element management'),
(1027, 1472857016, 1, 'adminko', 76, '-', '-', 'Element management'),
(1028, 1472857019, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1029, 1472857033, 1, 'adminko', 76, '-', '-', 'Element management'),
(1030, 1472857123, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1031, 1472857134, 1, 'adminko', 76, '-', '-', 'Element management'),
(1032, 1472857136, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1033, 1472857235, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(1034, 1472857235, 1, 'adminko', 76, '-', '-', 'Element management'),
(1035, 1472857281, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1036, 1472857285, 1, 'adminko', 76, '-', '-', 'Element management'),
(1037, 1472857288, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1038, 1472857290, 1, 'adminko', 76, '-', '-', 'Element management'),
(1039, 1472857292, 1, 'adminko', 78, '21', 'report-tpl', 'Editing Chunk (HTML Snippet)'),
(1040, 1472857306, 1, 'adminko', 76, '-', '-', 'Element management'),
(1041, 1472857309, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1042, 1472857361, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(1043, 1472857361, 1, 'adminko', 76, '-', '-', 'Element management'),
(1044, 1472893753, 1, 'adminko', 76, '-', '-', 'Element management'),
(1045, 1472909278, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1046, 1472909372, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1047, 1472909425, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1048, 1472909426, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1049, 1472909506, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1050, 1472909511, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1051, 1472909518, 1, 'adminko', 76, '-', '-', 'Element management'),
(1052, 1472909521, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1053, 1472909534, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(1054, 1472909534, 1, 'adminko', 76, '-', '-', 'Element management'),
(1055, 1472909703, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1056, 1472909724, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1057, 1472909724, 1, 'adminko', 76, '-', '-', 'Element management'),
(1058, 1472909726, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1059, 1472909760, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1060, 1472909762, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1061, 1472909764, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1062, 1472909774, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1063, 1472909775, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1064, 1472911025, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1065, 1472911042, 1, 'adminko', 76, '-', '-', 'Element management'),
(1066, 1472911045, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1067, 1472911063, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1068, 1472911063, 1, 'adminko', 76, '-', '-', 'Element management'),
(1069, 1472911075, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1070, 1472911087, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1071, 1472911087, 1, 'adminko', 76, '-', '-', 'Element management'),
(1072, 1472911302, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1073, 1472911307, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1074, 1472911307, 1, 'adminko', 76, '-', '-', 'Element management'),
(1075, 1472911366, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1076, 1472911373, 1, 'adminko', 76, '-', '-', 'Element management'),
(1077, 1472911384, 1, 'adminko', 78, '3', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(1078, 1472911516, 1, 'adminko', 79, '3', 'HEAD', 'Saving Chunk (HTML Snippet)'),
(1079, 1472911516, 1, 'adminko', 76, '-', '-', 'Element management'),
(1080, 1472911554, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1081, 1472911611, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1082, 1472911612, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1083, 1472911614, 1, 'adminko', 76, '-', '-', 'Element management'),
(1084, 1472911616, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1085, 1472911622, 1, 'adminko', 76, '-', '-', 'Element management'),
(1086, 1472911624, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1087, 1472911635, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(1088, 1472911635, 1, 'adminko', 76, '-', '-', 'Element management'),
(1089, 1472911657, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1090, 1472911663, 1, 'adminko', 79, '20', 'form-tpl', 'Saving Chunk (HTML Snippet)'),
(1091, 1472911663, 1, 'adminko', 76, '-', '-', 'Element management'),
(1092, 1472911670, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1093, 1472911676, 1, 'adminko', 79, '20', 'form-tpl', 'Saving Chunk (HTML Snippet)'),
(1094, 1472911676, 1, 'adminko', 76, '-', '-', 'Element management'),
(1095, 1472911678, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1096, 1472911689, 1, 'adminko', 79, '-', 'ShareFormTpl', 'Saving Chunk (HTML Snippet)'),
(1097, 1472911689, 1, 'adminko', 76, '-', '-', 'Element management'),
(1098, 1472911698, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1099, 1472911706, 1, 'adminko', 79, '-', 'ShareReportTpl', 'Saving Chunk (HTML Snippet)'),
(1100, 1472911706, 1, 'adminko', 76, '-', '-', 'Element management'),
(1101, 1472911712, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1102, 1472911725, 1, 'adminko', 79, '-', 'ShareThankyouTpl', 'Saving Chunk (HTML Snippet)'),
(1103, 1472911725, 1, 'adminko', 76, '-', '-', 'Element management'),
(1104, 1472911751, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1105, 1472911766, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1106, 1472911771, 1, 'adminko', 79, '-', 'FORM1', 'Saving Chunk (HTML Snippet)'),
(1107, 1472911771, 1, 'adminko', 76, '-', '-', 'Element management'),
(1108, 1472911774, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1109, 1472911781, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1110, 1472911783, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1111, 1472911953, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1112, 1472911961, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1113, 1472911962, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1114, 1472912033, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1115, 1472912241, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1116, 1472912243, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1117, 1472912244, 1, 'adminko', 76, '-', '-', 'Element management'),
(1118, 1472912247, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1119, 1472912256, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1120, 1472912256, 1, 'adminko', 76, '-', '-', 'Element management'),
(1121, 1472912471, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1122, 1472912477, 1, 'adminko', 76, '-', '-', 'Element management'),
(1123, 1472912481, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1124, 1472912485, 1, 'adminko', 76, '-', '-', 'Element management'),
(1125, 1472912488, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1126, 1472912489, 1, 'adminko', 76, '-', '-', 'Element management'),
(1127, 1472912493, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1128, 1472912508, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1129, 1472912508, 1, 'adminko', 76, '-', '-', 'Element management'),
(1130, 1472912528, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1131, 1472912532, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1132, 1472912532, 1, 'adminko', 76, '-', '-', 'Element management'),
(1133, 1472912559, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1134, 1472912570, 1, 'adminko', 76, '-', '-', 'Element management'),
(1135, 1472912573, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1136, 1472912616, 1, 'adminko', 79, '20', 'form-tpl', 'Saving Chunk (HTML Snippet)'),
(1137, 1472912616, 1, 'adminko', 76, '-', '-', 'Element management'),
(1138, 1472912728, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1139, 1472912737, 1, 'adminko', 76, '-', '-', 'Element management'),
(1140, 1472912740, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1141, 1472914776, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1142, 1472914776, 1, 'adminko', 76, '-', '-', 'Element management'),
(1143, 1472914781, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1144, 1472914803, 1, 'adminko', 76, '-', '-', 'Element management'),
(1145, 1472923480, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1146, 1472923484, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1147, 1472923484, 1, 'adminko', 76, '-', '-', 'Element management'),
(1148, 1472923487, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1149, 1472923502, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(1150, 1472923502, 1, 'adminko', 76, '-', '-', 'Element management'),
(1151, 1472923505, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1152, 1472923529, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1153, 1472923531, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1154, 1472923567, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1155, 1472923593, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1156, 1472923595, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1157, 1472923708, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1158, 1472923829, 1, 'adminko', 17, '-', '-', 'Editing settings'),
(1159, 1472923907, 1, 'adminko', 75, '-', '-', 'User/ role management'),
(1160, 1472923909, 1, 'adminko', 99, '-', '-', 'Manage Web Users'),
(1161, 1472923910, 1, 'adminko', 86, '-', '-', 'Role management'),
(1162, 1472923913, 1, 'adminko', 40, '-', '-', 'Editing Access Permissions'),
(1163, 1472923915, 1, 'adminko', 91, '-', '-', 'Editing Web Access Permissions'),
(1164, 1472923918, 1, 'adminko', 106, '-', '-', 'Viewing Modules'),
(1165, 1472923926, 1, 'adminko', 106, '-', '-', 'Viewing Modules'),
(1166, 1472923927, 1, 'adminko', 76, '-', '-', 'Element management'),
(1167, 1472923952, 1, 'adminko', 10, '-', '-', 'Viewing/ composing messages'),
(1168, 1472923966, 1, 'adminko', 9, '-', '-', 'Viewing help'),
(1169, 1472923978, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(1170, 1472928714, 1, 'adminko', 76, '-', '-', 'Element management'),
(1171, 1472928719, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1172, 1472928721, 1, 'adminko', 76, '-', '-', 'Element management'),
(1173, 1472928723, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1174, 1472928733, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1175, 1472928733, 1, 'adminko', 76, '-', '-', 'Element management'),
(1176, 1472928778, 1, 'adminko', 4, '-', 'Новый ресурс', 'Creating a resource'),
(1177, 1472928827, 1, 'adminko', 5, '-', 'Call back', 'Saving resource'),
(1178, 1472928829, 1, 'adminko', 3, '13', 'Call back', 'Viewing data for resource'),
(1179, 1472928830, 1, 'adminko', 27, '13', 'Call back', 'Editing resource'),
(1180, 1472928859, 1, 'adminko', 76, '-', '-', 'Element management'),
(1181, 1472928872, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1182, 1472928884, 1, 'adminko', 76, '-', '-', 'Element management'),
(1183, 1472928886, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1184, 1472928986, 1, 'adminko', 79, '-', 'callback-tnl', 'Saving Chunk (HTML Snippet)'),
(1185, 1472928986, 1, 'adminko', 76, '-', '-', 'Element management'),
(1186, 1472928991, 1, 'adminko', 78, '28', 'callback-tnl', 'Editing Chunk (HTML Snippet)'),
(1187, 1472929002, 1, 'adminko', 79, '28', 'callback-tpl', 'Saving Chunk (HTML Snippet)'),
(1188, 1472929002, 1, 'adminko', 76, '-', '-', 'Element management'),
(1189, 1472929019, 1, 'adminko', 78, '21', 'report-tpl', 'Editing Chunk (HTML Snippet)'),
(1190, 1472929088, 1, 'adminko', 76, '-', '-', 'Element management'),
(1191, 1472929094, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1192, 1472929096, 1, 'adminko', 76, '-', '-', 'Element management'),
(1193, 1472929097, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1194, 1472929107, 1, 'adminko', 76, '-', '-', 'Element management'),
(1195, 1472929112, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1196, 1472929122, 1, 'adminko', 76, '-', '-', 'Element management'),
(1197, 1472929125, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1198, 1472929217, 1, 'adminko', 79, '-', 'callback', 'Saving Chunk (HTML Snippet)'),
(1199, 1472929217, 1, 'adminko', 76, '-', '-', 'Element management'),
(1200, 1472929222, 1, 'adminko', 27, '13', 'Call back', 'Editing resource'),
(1201, 1472929244, 1, 'adminko', 5, '13', 'Call back', 'Saving resource'),
(1202, 1472929245, 1, 'adminko', 3, '13', 'Call back', 'Viewing data for resource'),
(1203, 1472929276, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1204, 1472929279, 1, 'adminko', 27, '13', 'Call back', 'Editing resource'),
(1205, 1472929284, 1, 'adminko', 27, '13', 'Call back', 'Editing resource'),
(1206, 1472929286, 1, 'adminko', 5, '13', 'Call back', 'Saving resource'),
(1207, 1472929288, 1, 'adminko', 3, '13', 'Call back', 'Viewing data for resource'),
(1208, 1472929309, 1, 'adminko', 76, '-', '-', 'Element management'),
(1209, 1472929317, 1, 'adminko', 78, '29', 'callback', 'Editing Chunk (HTML Snippet)'),
(1210, 1472929320, 1, 'adminko', 76, '-', '-', 'Element management'),
(1211, 1472929325, 1, 'adminko', 78, '21', 'report-tpl', 'Editing Chunk (HTML Snippet)'),
(1212, 1472929327, 1, 'adminko', 76, '-', '-', 'Element management'),
(1213, 1472929329, 1, 'adminko', 78, '28', 'callback-tpl', 'Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`) VALUES
(1214, 1472929344, 1, 'adminko', 79, '28', 'callback-tpl', 'Saving Chunk (HTML Snippet)'),
(1215, 1472929344, 1, 'adminko', 76, '-', '-', 'Element management'),
(1216, 1472929361, 1, 'adminko', 78, '28', 'callback-tpl', 'Editing Chunk (HTML Snippet)'),
(1217, 1472929376, 1, 'adminko', 79, '28', 'callback-tpl', 'Saving Chunk (HTML Snippet)'),
(1218, 1472929376, 1, 'adminko', 76, '-', '-', 'Element management'),
(1219, 1472929380, 1, 'adminko', 78, '29', 'callback', 'Editing Chunk (HTML Snippet)'),
(1220, 1472929483, 1, 'adminko', 76, '-', '-', 'Element management'),
(1221, 1472929487, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1222, 1472929560, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(1223, 1472929560, 1, 'adminko', 76, '-', '-', 'Element management'),
(1224, 1472929563, 1, 'adminko', 78, '21', 'report-tpl', 'Editing Chunk (HTML Snippet)'),
(1225, 1472929583, 1, 'adminko', 76, '-', '-', 'Element management'),
(1226, 1472929587, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1227, 1472929610, 1, 'adminko', 76, '-', '-', 'Element management'),
(1228, 1472929614, 1, 'adminko', 78, '28', 'callback-tpl', 'Editing Chunk (HTML Snippet)'),
(1229, 1472929762, 1, 'adminko', 79, '28', 'callback-tpl', 'Saving Chunk (HTML Snippet)'),
(1230, 1472929762, 1, 'adminko', 76, '-', '-', 'Element management'),
(1231, 1472929765, 1, 'adminko', 78, '21', 'report-tpl', 'Editing Chunk (HTML Snippet)'),
(1232, 1472929769, 1, 'adminko', 79, '21', 'report-tpl', 'Saving Chunk (HTML Snippet)'),
(1233, 1472929769, 1, 'adminko', 76, '-', '-', 'Element management'),
(1234, 1472929771, 1, 'adminko', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1235, 1472929890, 1, 'adminko', 79, '-', 'callback-report', 'Saving Chunk (HTML Snippet)'),
(1236, 1472929890, 1, 'adminko', 76, '-', '-', 'Element management'),
(1237, 1472929892, 1, 'adminko', 78, '29', 'callback', 'Editing Chunk (HTML Snippet)'),
(1238, 1472929906, 1, 'adminko', 79, '29', 'callback', 'Saving Chunk (HTML Snippet)'),
(1239, 1472929906, 1, 'adminko', 76, '-', '-', 'Element management'),
(1240, 1472929908, 1, 'adminko', 78, '28', 'callback-tpl', 'Editing Chunk (HTML Snippet)'),
(1241, 1472929920, 1, 'adminko', 76, '-', '-', 'Element management'),
(1242, 1472929923, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1243, 1472929929, 1, 'adminko', 76, '-', '-', 'Element management'),
(1244, 1472929931, 1, 'adminko', 78, '28', 'callback-tpl', 'Editing Chunk (HTML Snippet)'),
(1245, 1472929962, 1, 'adminko', 79, '28', 'callback-tpl', 'Saving Chunk (HTML Snippet)'),
(1246, 1472929962, 1, 'adminko', 76, '-', '-', 'Element management'),
(1247, 1472930018, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1248, 1472930027, 1, 'adminko', 76, '-', '-', 'Element management'),
(1249, 1472930030, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1250, 1472930049, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(1251, 1472930049, 1, 'adminko', 76, '-', '-', 'Element management'),
(1252, 1472930051, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1253, 1472930065, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(1254, 1472930065, 1, 'adminko', 76, '-', '-', 'Element management'),
(1255, 1472930094, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1256, 1472930099, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1257, 1472930101, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1258, 1472930140, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1259, 1472930153, 1, 'adminko', 76, '-', '-', 'Element management'),
(1260, 1472930157, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1261, 1472930166, 1, 'adminko', 76, '-', '-', 'Element management'),
(1262, 1472930171, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1263, 1472930176, 1, 'adminko', 76, '-', '-', 'Element management'),
(1264, 1472930183, 1, 'adminko', 78, '26', 'ShareThankyouTpl', 'Editing Chunk (HTML Snippet)'),
(1265, 1472930191, 1, 'adminko', 80, '26', 'ShareThankyouTpl', 'Deleting Chunk (HTML Snippet)'),
(1266, 1472930192, 1, 'adminko', 76, '-', '-', 'Element management'),
(1267, 1472930194, 1, 'adminko', 78, '25', 'ShareReportTpl', 'Editing Chunk (HTML Snippet)'),
(1268, 1472930198, 1, 'adminko', 80, '25', 'ShareReportTpl', 'Deleting Chunk (HTML Snippet)'),
(1269, 1472930198, 1, 'adminko', 76, '-', '-', 'Element management'),
(1270, 1472930200, 1, 'adminko', 78, '24', 'ShareFormTpl', 'Editing Chunk (HTML Snippet)'),
(1271, 1472930212, 1, 'adminko', 80, '24', 'ShareFormTpl', 'Deleting Chunk (HTML Snippet)'),
(1272, 1472930212, 1, 'adminko', 76, '-', '-', 'Element management'),
(1273, 1472930214, 1, 'adminko', 78, '30', 'callback-report', 'Editing Chunk (HTML Snippet)'),
(1274, 1472930225, 1, 'adminko', 76, '-', '-', 'Element management'),
(1275, 1472930228, 1, 'adminko', 78, '27', 'FORM1', 'Editing Chunk (HTML Snippet)'),
(1276, 1472930257, 1, 'adminko', 80, '27', 'FORM1', 'Deleting Chunk (HTML Snippet)'),
(1277, 1472930257, 1, 'adminko', 76, '-', '-', 'Element management'),
(1278, 1472930260, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1279, 1472930271, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(1280, 1472930271, 1, 'adminko', 76, '-', '-', 'Element management'),
(1281, 1472930300, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1282, 1472930318, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1283, 1472930319, 1, 'adminko', 76, '-', '-', 'Element management'),
(1284, 1472930338, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1285, 1472930340, 1, 'adminko', 76, '-', '-', 'Element management'),
(1286, 1472930342, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1287, 1472930346, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1288, 1472930346, 1, 'adminko', 76, '-', '-', 'Element management'),
(1289, 1472930349, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1290, 1472930540, 1, 'adminko', 76, '-', '-', 'Element management'),
(1291, 1472930543, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1292, 1472930560, 1, 'adminko', 79, '20', 'form-tpl', 'Saving Chunk (HTML Snippet)'),
(1293, 1472930560, 1, 'adminko', 76, '-', '-', 'Element management'),
(1294, 1472930564, 1, 'adminko', 78, '21', 'report-tpl', 'Editing Chunk (HTML Snippet)'),
(1295, 1472930574, 1, 'adminko', 79, '21', 'report-tpl', 'Saving Chunk (HTML Snippet)'),
(1296, 1472930574, 1, 'adminko', 76, '-', '-', 'Element management'),
(1297, 1472930578, 1, 'adminko', 78, '22', 'thank-tpl', 'Editing Chunk (HTML Snippet)'),
(1298, 1472930590, 1, 'adminko', 79, '22', 'thank-tpl', 'Saving Chunk (HTML Snippet)'),
(1299, 1472930590, 1, 'adminko', 76, '-', '-', 'Element management'),
(1300, 1472930593, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1301, 1472930603, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(1302, 1472930603, 1, 'adminko', 76, '-', '-', 'Element management'),
(1303, 1472930726, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1304, 1472930731, 1, 'adminko', 76, '-', '-', 'Element management'),
(1305, 1472930748, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1306, 1472930750, 1, 'adminko', 76, '-', '-', 'Element management'),
(1307, 1472930761, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1308, 1472930774, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1309, 1472930777, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1310, 1472930794, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1311, 1472930814, 1, 'adminko', 76, '-', '-', 'Element management'),
(1312, 1472930816, 1, 'adminko', 78, '23', 'form', 'Editing Chunk (HTML Snippet)'),
(1313, 1472930837, 1, 'adminko', 79, '23', 'form', 'Saving Chunk (HTML Snippet)'),
(1314, 1472930837, 1, 'adminko', 76, '-', '-', 'Element management'),
(1315, 1472930994, 1, 'adminko', 78, '20', 'form-tpl', 'Editing Chunk (HTML Snippet)'),
(1316, 1472930997, 1, 'adminko', 79, '20', 'form-tpl', 'Saving Chunk (HTML Snippet)'),
(1317, 1472930997, 1, 'adminko', 76, '-', '-', 'Element management'),
(1318, 1472931019, 1, 'adminko', 27, '2', 'Контактная информация', 'Editing resource'),
(1319, 1472931033, 1, 'adminko', 5, '2', 'Контактная информация', 'Saving resource'),
(1320, 1472931035, 1, 'adminko', 3, '2', 'Контактная информация', 'Viewing data for resource'),
(1321, 1472931917, 1, 'adminko', 27, '1', 'Главная страница', 'Editing resource'),
(1322, 1472931921, 1, 'adminko', 76, '-', '-', 'Element management'),
(1323, 1472932982, 1, 'adminko', 78, '28', 'callback-tpl', 'Editing Chunk (HTML Snippet)'),
(1324, 1472933061, 1, 'adminko', 79, '28', 'callback-tpl', 'Saving Chunk (HTML Snippet)'),
(1325, 1472933061, 1, 'adminko', 76, '-', '-', 'Element management'),
(1326, 1472933065, 1, 'adminko', 78, '29', 'callback', 'Editing Chunk (HTML Snippet)'),
(1327, 1472933074, 1, 'adminko', 79, '29', 'callback', 'Saving Chunk (HTML Snippet)'),
(1328, 1472933074, 1, 'adminko', 76, '-', '-', 'Element management'),
(1329, 1472933146, 1, 'adminko', 78, '28', 'callback-tpl', 'Editing Chunk (HTML Snippet)'),
(1330, 1472933230, 1, 'adminko', 79, '28', 'callback-tpl', 'Saving Chunk (HTML Snippet)'),
(1331, 1472933230, 1, 'adminko', 76, '-', '-', 'Element management'),
(1332, 1472933247, 1, 'adminko', 78, '28', 'callback-tpl', 'Editing Chunk (HTML Snippet)'),
(1333, 1472933254, 1, 'adminko', 79, '28', 'callback-tpl', 'Saving Chunk (HTML Snippet)'),
(1334, 1472933254, 1, 'adminko', 76, '-', '-', 'Element management'),
(1335, 1472933259, 1, 'adminko', 78, '28', 'callback-tpl', 'Editing Chunk (HTML Snippet)'),
(1336, 1472933268, 1, 'adminko', 79, '28', 'callback-tpl', 'Saving Chunk (HTML Snippet)'),
(1337, 1472933268, 1, 'adminko', 76, '-', '-', 'Element management'),
(1338, 1472933315, 1, 'adminko', 78, '29', 'callback', 'Editing Chunk (HTML Snippet)'),
(1339, 1472933324, 1, 'adminko', 79, '29', 'callback', 'Saving Chunk (HTML Snippet)'),
(1340, 1472933324, 1, 'adminko', 76, '-', '-', 'Element management'),
(1341, 1472933375, 1, 'adminko', 78, '29', 'callback', 'Editing Chunk (HTML Snippet)'),
(1342, 1472933377, 1, 'adminko', 76, '-', '-', 'Element management'),
(1343, 1472933378, 1, 'adminko', 78, '28', 'callback-tpl', 'Editing Chunk (HTML Snippet)'),
(1344, 1472933391, 1, 'adminko', 79, '28', 'callback-tpl', 'Saving Chunk (HTML Snippet)'),
(1345, 1472933392, 1, 'adminko', 76, '-', '-', 'Element management');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_manager_users`
--

CREATE TABLE IF NOT EXISTS `modx_manager_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains login information for backend users.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_manager_users`
--

INSERT INTO `modx_manager_users` (`id`, `username`, `password`) VALUES
(1, 'adminko', 'uncrypt>4ad231bc51776f6a8acded64de13ce7e816b09aa');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_membergroup_access`
--

CREATE TABLE IF NOT EXISTS `modx_membergroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_membergroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_membergroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_member_groups`
--

CREATE TABLE IF NOT EXISTS `modx_member_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_content`
--

CREATE TABLE IF NOT EXISTS `modx_site_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `haskeywords` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to keywords',
  `hasmetatags` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to meta tags',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `aliasidx` (`alias`),
  KEY `typeidx` (`type`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.' AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `modx_site_content`
--

INSERT INTO `modx_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `haskeywords`, `hasmetatags`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'Главная страница', 'Расширенный заголовок для главной страницы', 'Описание для тега Description', 'main', '', 1, 0, 0, 0, 1, 'Описание страницы', '<h3>Главная</h3>', 1, 3, 0, 1, 1, 1, 1130304721, 1, 1472654887, 0, 0, 0, 1130304721, 1, 'Главная', 0, 0, 0, 0, 0, 0, 0, 1),
(2, 'document', 'text/html', 'Контактная информация', '', '', '', '', 1, 0, 0, 0, 0, '', '{{form}}{{thank-tpl}}', 1, 6, 3, 1, 1, 1, 1472651492, 1, 1472931033, 0, 0, 0, 1472651492, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
(3, 'document', 'text/html', 'О нас', '', '', 'about', '', 1, 0, 0, 0, 0, '', '', 1, 5, 1, 1, 1, 1, 1472651605, 1, 1472675089, 0, 0, 0, 1472675089, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
(4, 'document', 'text/html', 'Новости', '', '', 'news', '', 1, 0, 0, 0, 1, '', '{{newsline}}', 1, 5, 4, 1, 0, 1, 1472651614, 1, 1472829678, 0, 0, 0, 1472651614, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
(5, 'document', 'text/html', 'Услуги', '', '', '', '', 1, 0, 0, 0, 0, '', '<p>123</p>', 1, 5, 2, 1, 1, 1, 1472651626, 1, 1472673535, 0, 0, 0, 1472651626, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
(8, 'document', 'text/html', 'Первая новость', 'Расширенный заголовок с первой новостью', 'Описание страницы с  первой новостью', 'news-1', '', 1, 0, 0, 4, 0, 'краткое описание', '<p>Полный текст новости.</p>', 1, 5, 0, 1, 0, 1, 1472775379, 1, 1472834047, 0, 0, 0, 1472775379, 1, '', 0, 0, 0, 0, 0, 0, 1, 1),
(9, 'document', 'text/html', 'Вторая новость', 'расширенный заголовок новости', 'описание второй новости', '', '', 1, 0, 0, 4, 0, 'краткое описание второй новости', '', 1, 5, 0, 1, 0, 1, 1472775431, 1, 1472834040, 0, 0, 0, 1472775431, 1, '', 0, 0, 0, 0, 0, 0, 1, 1),
(10, 'document', 'text/html', 'Третья новости', 'заголовок третьей новости новости', 'описание третьей новости', '', '', 1, 0, 0, 4, 0, 'краткое описание', '<p>Третья новость</p>', 1, 5, 0, 1, 0, 1, 1472775446, 1, 1472834031, 0, 0, 0, 1472775446, 1, '', 0, 0, 0, 0, 0, 0, 1, 1),
(11, 'document', 'text/html', 'Четвертая новость', 'Расширенный заголовок четвертой новости', 'описание четвертой новости', '', '', 1, 0, 0, 4, 0, 'краткое описание четвертой новости', '<p>Четвертая новость</p>', 1, 5, 0, 1, 0, 1, 1472775462, 1, 1472829920, 0, 0, 0, 1472775462, 1, '', 0, 0, 0, 0, 0, 0, 1, 1),
(12, 'document', 'text/html', 'Пятая новость', 'Расширенный заголовок пятой новости', 'Описание страницы пятой новости', '', '', 1, 0, 0, 4, 0, 'краткое описание пятой новости', '<p>Пятая новость</p>', 1, 5, 0, 1, 0, 1, 1472775485, 1, 1472829914, 0, 0, 0, 1472775485, 1, '', 0, 0, 0, 0, 0, 0, 1, 1),
(13, 'document', 'text/html', 'Call back', '', '', '', '', 1, 0, 0, 0, 0, '', '{{callback}} {{thank-tpl}}', 1, 6, 5, 1, 1, 1, 1472928827, 1, 1472929286, 0, 0, 0, 1472928827, 1, '', 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_content_metatags`
--

CREATE TABLE IF NOT EXISTS `modx_site_content_metatags` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `metatag_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `metatag_id` (`metatag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Reference table between meta tags and content';

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_htmlsnippets`
--

CREATE TABLE IF NOT EXISTS `modx_site_htmlsnippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.' AUTO_INCREMENT=31 ;

--
-- Дамп данных таблицы `modx_site_htmlsnippets`
--

INSERT INTO `modx_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `editor_name`, `category`, `cache_type`, `snippet`, `locked`) VALUES
(12, 'news-article', '', 2, 'none', 10, 0, '<div id="news">\r\n<h2><a href="[~[+id+]~]" title="[+pagetitle+]">[+pagetitle+]</a></h2>\r\n<div class="introtext"><span class="date">[+date+]</span> [+introtext+] </div>\r\n<div class="readmore" ><a href="[~[+id+]~]" title="Перейти к полному тексту новости">Читать дальше →</a></div>\r\n</div>', 0),
(10, 'RIGHT-COL', 'правая колонка', 2, 'none', 9, 0, '<div id="column">\r\n      <div class="subnav">\r\n        <h2>Secondary Navigation</h2>\r\n        <ul>\r\n          <li><a href="#">Open Source Templates</a></li>\r\n          <li><a href="#">Free CSS Templates</a>\r\n            <ul>\r\n              <li><a href="#">Free XHTML Templates</a></li>\r\n              <li><a href="#">Free Website Templates</a></li>\r\n            </ul>\r\n          </li>\r\n          <li><a href="#">Open Source Layouts</a>\r\n            <ul>\r\n              <li><a href="#">Open Source Software</a></li>\r\n              <li><a href="#">Open Source Webdesign</a>\r\n                <ul>\r\n                  <li><a href="#">Open Source Downloads</a></li>\r\n                  <li><a href="#">Open Source Website</a></li>\r\n                </ul>\r\n              </li>\r\n            </ul>\r\n          </li>\r\n          <li><a href="#">Open Source Themes</a></li>\r\n        </ul>\r\n      </div>\r\n      <div class="holder">\r\n        <h2 class="title"><img src="assets/templates/busplus/images/demo/60x60.gif" alt="" />Nullamlacus dui ipsum conseque loborttis</h2>\r\n        <p>Urnaultrices quis curabitur phasellentesque congue magnis vestibulum quismodo nulla et feugiat. Adipisciniapellentum leo ut consequam ris felit elit id nibh sociis malesuada.</p>\r\n        <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>\r\n      </div>\r\n      <div class="holder">\r\n        <div class="imgholder"><img src="assets/templates/busplus/images/demo/290x100.gif" alt="" /></div>\r\n        <p>Nullamlacus dui ipsum conseque loborttis non euisque morbi penas dapibulum orna.</p>\r\n        <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>\r\n      </div>\r\n      <div class="holder">\r\n        <h2>Lorem ipsum dolor</h2>\r\n        <p>Nuncsed sed conseque a at quismodo tris mauristibus sed habiturpiscinia sed.</p>\r\n        <ul>\r\n          <li><a href="#">Lorem ipsum dolor sit</a></li>\r\n          <li>Etiam vel sapien et</li>\r\n          <li><a href="#">Etiam vel sapien et</a></li>\r\n        </ul>\r\n        <p>Nuncsed sed conseque a at quismodo tris mauristibus sed habiturpiscinia sed. Condimentumsantincidunt dui mattis magna intesque purus orci augue lor nibh.</p>\r\n        <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>\r\n      </div>\r\n    </div>', 0),
(3, 'HEAD', 'служебные теги, подключение скриптов и стилей', 2, 'none', 9, 0, '<head profile="http://gmpg.org/xfn/11">\r\n<title>[*pagetitle*] | [(site_name)]</title>\r\n<base href="[(site_url)]" />\r\n<meta name="description" content="[*description*]"/>\r\n<meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" />\r\n<meta http-equiv="imagetoolbar" content="no" />\r\n	<link rel="stylesheet" href="assets/templates/busplus/styles/layout.css" type="text/css" />\r\n	<script type="text/javascript" src="assets/js/jquery.min.js"></script>\r\n<script type="text/javascript" src="assets/templates/busplus/scripts/jquery-1.4.1.min.js"></script>\r\n<script type="text/javascript" src="assets/templates/busplus/scripts/jquery.jcarousel.pack.js"></script>\r\n<script type="text/javascript" src="assets/templates/busplus/scripts/jquery.jcarousel.setup.js"></script>\r\n	<script type="text/javascript" src="assets/templates/busplus/scripts/custom.js"></script>\r\n</head>', 0),
(4, 'HEADER', 'шапка сайта', 2, 'none', 9, 0, '<div class="wrapper col1">\r\n  <div id="header">\r\n    <div id="logo">\r\n      <h1><a href="#">+Business</a></h1>\r\n      <p>Free Open Source CSS Website Template</p>\r\n    </div>\r\n    {{MAIN-MENU}}\r\n    <br class="clear" />\r\n  </div>\r\n</div>', 0),
(9, 'BREADCRUMB', 'Строка навигации "хлебные крошки"', 2, 'none', 9, 0, '<div class="wrapper col2">\r\n  <div id="breadcrumb">\r\n [[Breadcrumbs? &homeCrumbDescription=`Перейти на главную страницу` &linkDescField=`longtitle`]]\r\n  </div>\r\n</div>', 0),
(8, 'MAIN-MENU', 'главное меню с автогенерацией(снипет)', 2, 'none', 9, 0, '<div id="topnav">\r\n[!Wayfinder? &startId=`0`!]\r\n</div>', 0),
(5, 'GALLERY', 'Галлерея', 2, 'none', 9, 0, '<div class="wrapper col2">\r\n  <div id="featured_slide">\r\n    <div id="featured_content">\r\n      <ul>\r\n        <li><img src="assets/templates/busplus/images/demo/1.gif" alt="" />\r\n          <div class="floater">\r\n            <h2>About This Template !</h2>\r\n            <p>This is a W3C standards compliant Open Source free CSS template from <a href="http://www.os-templates.com/" title="Open Source Templates">OS Templates</a>. This template is distributed under a <a target="_blank" rel="nofollow" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-Share Alike 3.0 Unported License</a>, which allows you to use and modify the template for both personal and commercial use when you keep the provided credit links in the footer. For more free css templates visit <a href="http://www.os-templates.com/">Open Source Templates</a>.</p>\r\n            <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>\r\n          </div>\r\n        </li>\r\n        <li><img src="assets/templates/busplus/images/demo/2.gif" alt="" />\r\n          <div class="floater">\r\n            <h2>Cursus penati saccum ut curabitur nulla.</h2>\r\n            <p>Temperinte interdum sempus odio urna eget curabitur semper convallis nunc laoreet. Nullain convallis ris elis vest liberos nis diculis feugiat in rutrum. Suspendreristibulumfaucibulum lobortor quis tortortor ris sapien sce enim et volutpat sus. Urnaretiumorci orci fauctor leo justo nulla cras ridiculum&hellip;</p>\r\n            <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>\r\n          </div>\r\n        </li>\r\n        <li><img src="assets/templates/busplus/images/demo/3.gif" alt="" />\r\n          <div class="floater">\r\n            <h2>Cursus penati saccum ut curabitur nulla.</h2>\r\n            <p>Temperinte interdum sempus odio urna eget curabitur semper convallis nunc laoreet. Nullain convallis ris elis vest liberos nis diculis feugiat in rutrum. Suspendreristibulumfaucibulum lobortor quis tortortor ris sapien sce enim et volutpat sus. Urnaretiumorci orci fauctor leo justo nulla cras ridiculum&hellip;</p>\r\n            <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>\r\n          </div>\r\n        </li>\r\n      </ul>\r\n    </div>\r\n    <a href="javascript:void(0);" id="featured-item-prev"><img src="assets/templates/busplus/images/prev.png" alt="" /></a> <a href="javascript:void(0);" id="featured-item-next"><img src="assets/templates/busplus/images/next.png" alt="" /></a> </div>\r\n</div>', 0),
(6, 'MAIN-CONTENT', 'содержимое главное', 2, 'none', 9, 0, '<div class="wrapper col3">\r\n<div id="container">\r\n<div class="homepage">\r\n<ul>\r\n{{newsline-main}}\r\n</ul>\r\n<br class="clear" />\r\n</div>\r\n</div>\r\n</div>', 0),
(7, 'FOOTER', 'подвал\\футер\\нижняя область сайта', 2, 'none', 9, 0, '<div class="wrapper col4">\r\n  <div id="footer">\r\n    <div class="box1">\r\n      <h2>A Little Company Information !</h2>\r\n      <img class="imgl" src="assets/templates/busplus/images/demo/imgl.gif" alt="" />\r\n      <p>Morbitincidunt maurisque eros molest nunc anteget sed vel lacus mus semper. Anterdumnullam interdum eros dui urna consequam ac nisl nullam ligula vestassa. Condimentumfelis et amet tellent quisquet a leo lacus nec augue</p>\r\n      <p>Portortornec condimenterdum eget consectetuer condis.</p>\r\n    </div>\r\n    <div class="box contactdetails">\r\n      <h2>Our Contact Details !</h2>\r\n      <ul>\r\n        <li>Company Name</li>\r\n        <li>Street Name &amp; Number</li>\r\n        <li>Town</li>\r\n        <li>Postcode/Zip</li>\r\n        <li>Tel: xxxxx xxxxxxxxxx</li>\r\n        <li>Fax: xxxxx xxxxxxxxxx</li>\r\n        <li>Email: info@domain.com</li>\r\n        <li class="last">LinkedIn: <a href="#">Company Profile</a></li>\r\n      </ul>\r\n    </div>\r\n    <div class="box flickrbox">\r\n      <h2>Latest Flickr Images !</h2>\r\n      <div class="wrap">\r\n        <div class="fix"></div>\r\n        <div class="flickr_badge_image" id="flickr_badge_image1"><a href="#"><img src="assets/templates/busplus/images/demo/80x80.gif" alt="" /></a></div>\r\n        <div class="flickr_badge_image" id="flickr_badge_image2"><a href="#"><img src="assets/templates/busplus/images/demo/80x80.gif" alt="" /></a></div>\r\n        <div class="flickr_badge_image" id="flickr_badge_image3"><a href="#"><img src="assets/templates/busplus/images/demo/80x80.gif" alt="" /></a></div>\r\n        <div class="flickr_badge_image" id="flickr_badge_image4"><a href="#"><img src="assets/templates/busplus/images/demo/80x80.gif" alt="" /></a></div>\r\n        <div class="flickr_badge_image" id="flickr_badge_image5"><a href="#"><img src="assets/templates/busplus/images/demo/80x80.gif" alt="" /></a></div>\r\n        <div class="flickr_badge_image" id="flickr_badge_image6"><a href="#"><img src="assets/templates/busplus/images/demo/80x80.gif" alt="" /></a></div>\r\n        <div class="fix"></div>\r\n      </div>\r\n    </div>\r\n    <br class="clear" />\r\n  </div>\r\n</div>\r\n<!-- ####################################################################################################### -->\r\n<div class="wrapper col5">\r\n  <div id="copyright">\r\n    <p class="fl_left">Copyright &copy; 2010 - All Rights Reserved - <a href="#">Domain Name</a></p>\r\n    <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Open Source Templates">OS Templates</a></p>\r\n    <br class="clear" />\r\n  </div>\r\n</div>', 0),
(11, 'CONTENT', 'содержимое страниц', 2, 'none', 9, 0, '<div id="content">\r\n<h1>[*longtitle*]</h1>\r\n[*content*]\r\n</div>', 0),
(29, 'callback', 'Вызов сниппета перезвона', 2, 'none', 8, 0, '[!eForm? &formid=`contact-form` &tpl=`callback-tpl` &to=`callback@testmodx.ru` ` &report=`callback-report`  &vericode=`0` &subject=`Сообщение с моего сайта`!]\r\n\r\n\r\n', 0),
(16, 'newsline-main', 'Вызов Ditto на главной', 2, 'none', 10, 0, '[[Ditto?  &parents=`4` &tpl=`news-main` &display=`3` &tplLast=`news-main-last` &paginate=`1`  ]]', 0),
(17, 'news-main', 'Шаблон для вывода новости на главной', 2, 'none', 10, 0, '<li> \r\n	<h2>[+img-news+][+pagetitle+]</h2> \r\n	<p> [+introtext+]</p> \r\n	<p class="readmore"><a href="[~[+id+]~]" title="[+pagetitle+]">Читать дальше &raquo;</a></p> \r\n</li> \r\n\r\n', 0),
(18, 'news-main-last', 'Шаблон для последней новости на главной', 2, 'none', 10, 0, '<li class="last"> \r\n	<h2>[+img-news+][+pagetitle+]</h2> \r\n	<p> [+introtext+]</p> \r\n	<p class="readmore"><a href="[~[+id+]~]" title="[+pagetitle+]">Читать дальше &raquo;</a></p> \r\n</li> \r\n\r\n', 0),
(19, 'newsline', '', 2, 'none', 10, 0, '[[Ditto? &tpl=`news-article` &dateSource = `pub_date` &dateFormat=`%d.%m.%Y` &paginate=`1` &display=`10` ]]\r\n<div class="pagination">\r\nСтраницы: [[dittoSplitPagination]][+previous+][+splitPages+][+next+] \r\n</div>', 0),
(20, 'form-tpl', 'шаблон формы обратной связи ', 2, 'none', 8, 0, '<div id="respond">\r\n[+validationmessage+]\r\n<form method="post" action="[~[*id*]~]">\r\n<input type="hidden" name="formid" value="contact-form" />\r\n<p><label accesskey="n" for="name">Ваше имя</label><br/>\r\n<input type="text" name="name" size="40" maxlength="60" eform="Имя::1" /></p>\r\n<p><label accesskey="e" for="email">Электронный ящик</label><br/>\r\n<input type="text" name="email" size="40" maxlength="40" eform="Адрес электронной почты:email:1" /></p>\r\n<p><label accesskey="s" for="otdel">Тема сообщения</label><br/>\r\n<select name="otdel" >\r\n<option value="1">Запрос информации</option>\r\n<option value="2">Техническая поддержка</option>\r\n<option value="3">Предложение</option>\r\n</select></p>\r\n<p><label accesskey="c" for="comments">Текст сообщения</label><br/>\r\n<textarea cols="40" rows="10" name="comments" eform="Текст сообщения:html:1" ></textarea></p>\r\n<p>Введите этот код:<br />\r\n<img src="[+verimageurl+]" alt="Код проверки" border="1"/>\r\n<input type="text" class="vericodeform" name="vericode" />\r\n</p>\r\n<p><input type="submit" name="submit" id="submit"  value="Отправить"></p>\r\n</form>\r\n</div>\r\n', 0),
(21, 'report-tpl', 'шаблон отсылаемой на e-mail информации', 2, 'none', 8, 0, '<p>Это сообщение было отправлено посетителем по имени [+name+] с помощью формы обратной связи. </p>\r\n<table>\r\n<tr valign="top"><td><b>Имя:</b></td><td>[+name+]</td></tr>\r\n<tr valign="top"><td><b>Email:</b>:</td><td>[+email+]</td></tr>\r\n<tr valign="top"><td><b>Сообщение:</b></td><td>[+comments+]</td></tr>\r\n</table>\r\n<p>Вы можете использовать эту ссылку для ответа: <a href="mailto:[+email+]?subject=RE:[+subject+]">[+email+]</a></p>', 0),
(22, 'thank-tpl', 'шаблон информации, отображаемой после отправки', 2, 'none', 8, 0, '<div id="modal_form"><!-- Сaмo oкнo --> \r\n      <span id="modal_close">X</span> <!-- Кнoпкa зaкрыть --> \r\n      Спасибо за заявку, наш менеджер свяжется с вами в ближайшее время\r\n</div>\r\n<div id="overlay"></div><!-- Пoдлoжкa -->', 0),
(28, 'callback-tpl', '', 2, 'none', 8, 0, '<div id="respond">\r\n[+validationmessage+]\r\n<form method="post" action="[~[*id*]~]">\r\n<p><label accesskey="n" for="name">Ваше имя</label><br/>\r\n<input type="text" name="name" size="40" maxlength="60" eform="Имя::1" /></p>\r\n<input type="hidden" name="formid" value="contact-form" />\r\n<p><label accesskey="n" for="phone">Ваш номер телефона</label><br/>\r\n<input type="text" name="phone" size="40" maxlength="60" placeholder="38096999666888" eform="Номер телефона:phone:1" /></p>\r\n<p><input type="submit" name="submit" id="submit"  value="Отправить"></p>\r\n</form>\r\n</div>\r\n', 0),
(23, 'form', 'Вызов сниппета Eform', 2, 'none', 8, 0, '[!eForm? &formid=`contact-form` &tpl=`form-tpl`&to=`info@site.ru,support@site.ru,requests@site.ru` &mailselector=`otdel` &report=`report-tpl` &thankyou=`thank-tpl` &vericode=`1` &subject=`Сообщение с моего сайта`!]\r\n', 0),
(30, 'callback-report', '', 2, 'none', 0, 0, '<p>Это сообщение было отправлено посетителем по имени [+name+] с помощью формы перезвони нам. </p>\r\n<table>\r\n<tr valign="top"><td><b>Имя:</b></td><td>[+name+]</td></tr>\r\n<tr valign="top"><td><b>Номер телефона:</b>:</td><td>[+phone+]</td></tr>\r\n</table>\r\n', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_keywords`
--

CREATE TABLE IF NOT EXISTS `modx_site_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site keyword list' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_metatags`
--

CREATE TABLE IF NOT EXISTS `modx_site_metatags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '' COMMENT 'tag name',
  `tagvalue` varchar(255) NOT NULL DEFAULT '',
  `http_equiv` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 - use http_equiv tag style, 0 - use name',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site meta tags' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_modules`
--

CREATE TABLE IF NOT EXISTS `modx_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Modules' AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `modx_site_modules`
--

INSERT INTO `modx_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1, 'Doc Manager', '<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 4, 0, 0, '', 0, '', 0, 0, 'docman435243542tf542t5t', 1, '', 'include_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/docmanager.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_frontend.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_backend.class.php'');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[''theme''] = $dm->getTheme();\n$dm->ph[''ajax.endpoint''] = MODX_SITE_URL.''assets/modules/docmanager/tv.ajax.php'';\n$dm->ph[''datepicker.offset''] = $modx->config[''datepicker_offset''];\n$dm->ph[''datetime.format''] = $modx->config[''datetime_format''];\n\nif (isset($_POST[''tabAction''])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(''main.tpl'', $dm->ph);\n}'),
(2, 'Extras', '<strong>0.1.2</strong> first repository for MODX EVO', 0, 0, 4, 0, 0, '', 0, '', 0, 0, 'store435243542tf542t5t', 1, '', '//AUTHORS: Bumkaka & Dmi3yy \r\ninclude_once(''../assets/modules/store/core.php'');');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_module_access`
--

CREATE TABLE IF NOT EXISTS `modx_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_module_depobj`
--

CREATE TABLE IF NOT EXISTS `modx_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module Dependencies' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_plugins`
--

CREATE TABLE IF NOT EXISTS `modx_site_plugins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.' AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `modx_site_plugins`
--

INSERT INTO `modx_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`) VALUES
(1, 'CodeMirror', '<strong>1.3</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.6', 0, 4, 0, '$_CM_BASE = ''assets/plugins/codemirror/'';\r\n\r\n$_CM_URL = $modx->config[''site_url''] . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .''codemirror.plugin.php'');\r\n\r\n', 0, '&theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light; &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true', 0, ''),
(2, 'FileSource', '<strong>0.1</strong> Save snippet and plugins to file', 0, 4, 0, 'require MODX_BASE_PATH.''assets/plugins/filesource/plugin.filesource.php'';', 0, '', 0, ''),
(3, 'Forgot Manager Login', '<strong>1.1.6</strong> Resets your manager login when you forget your password via email confirmation', 0, 4, 0, 'require MODX_BASE_PATH.''assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php'';', 0, '', 0, ''),
(4, 'ManagerManager', '<strong>0.6.2</strong> Customize the MODX Manager to offer bespoke admin functions for end users.', 0, 4, 0, '// You can put your ManagerManager rules EITHER in a chunk OR in an external file - whichever suits your development style the best\n\n// To use an external file, put your rules in /assets/plugins/managermanager/mm_rules.inc.php \n// (you can rename default.mm_rules.inc.php and use it as an example)\n// The chunk SHOULD have php opening tags at the beginning and end\n\n// If you want to put your rules in a chunk (so you can edit them through the Manager),\n// create the chunk, and enter its name in the configuration tab.\n// The chunk should NOT have php tags at the beginning or end.\n\n// See also user-friendly module for editing ManagerManager configuration file ddMMEditor (http://code.divandesign.biz/modx/ddmmeditor).\n\n// ManagerManager requires jQuery 1.9.1, which is located in /assets/plugins/managermanager/js/ folder.\n\n// You don''t need to change anything else from here onwards\n//-------------------------------------------------------\n\n// Run the main code\ninclude($modx->config[''base_path''].''assets/plugins/managermanager/mm.inc.php'');', 0, '&remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules', 0, ''),
(5, 'Quick Manager+', '<strong>1.5.6</strong> Enables QuickManager+ front end content editing support', 0, 4, 0, '// In manager\r\nif (isset($_SESSION[''mgrValidated''])) {\r\n\r\n    $show = TRUE;\r\n\r\n    if ($disabled  != '''') {\r\n        $arr = array_filter(array_map(''intval'', explode('','', $disabled)));\r\n        if (in_array($modx->documentIdentifier, $arr)) {\r\n            $show = FALSE;\r\n        }\r\n    }\r\n\r\n    if ($show) {\r\n        // Replace [*#tv*] with QM+ edit TV button placeholders\r\n        if ($tvbuttons == ''true'') {\r\n            $e = $modx->Event;\r\n            if ($e->name == ''OnParseDocument'') {\r\n                 $output = &$modx->documentOutput;\r\n                 $output = preg_replace(''~\\[\\*#(.*?)\\*\\]~'', ''<!-- ''.$tvbclass.'' $1 -->[*$1*]'', $output);\r\n                 $modx->documentOutput = $output;\r\n             }\r\n         }\r\n        // In manager\r\n        if (isset($_SESSION[''mgrValidated''])) {\r\n            include_once($modx->config[''base_path''].''assets/plugins/qm/qm.inc.php'');\r\n            $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass);\r\n        }\r\n    }\r\n}', 0, '&jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv', 0, ' '),
(6, 'Search Highlight', '<strong>1.5</strong> Used with AjaxSearch to show search terms highlighted on page linked from search results', 0, 5, 0, '/*\n  ------------------------------------------------------------------------\n  Plugin: Search_Highlight v1.5\n  ------------------------------------------------------------------------\n  Changes:\n  18/03/10 - Remove possibility of XSS attempts being passed in the URL\n           - look-behind assertion improved\n  29/03/09 - Removed urldecode calls;\n           - Added check for magic quotes - if set, remove slashes\n           - Highlights terms searched for when target is a HTML entity\n  18/07/08 - advSearch parameter and pcre modifier added\n  10/02/08 - Strip_tags added to avoid sql injection and XSS. Use of $_REQUEST\n  01/03/07 - Added fies/updates from forum from users mikkelwe/identity\n  (better highlight replacement, additional div around term/removal message)\n  ------------------------------------------------------------------------\n  Description: When a user clicks on the link from the AjaxSearch results\n    the target page will have the terms highlighted.\n  ------------------------------------------------------------------------\n  Created By:  Susan Ottwell (sottwell@sottwell.com)\n               Kyle Jaebker (kjaebker@muddydogpaws.com)\n\n  Refactored by Coroico (www.evo.wangba.fr) and TS\n  ------------------------------------------------------------------------\n  Based off the the code by Susan Ottwell (www.sottwell.com)\n    http://forums.modx.com/thread/47775/plugin-highlight-search-terms\n  ------------------------------------------------------------------------\n  CSS:\n    The classes used for the highlighting are the same as the AjaxSearch\n  ------------------------------------------------------------------------\n  Notes:\n    To add a link to remove the highlighting and to show the searchterms\n    put the following on your page where you would like this to appear:\n\n      <!--search_terms-->\n\n    Example output for this:\n\n      Search Terms: the, template\n      Remove Highlighting\n\n    Set the following variables to change the text:\n\n      $termText - the text before the search terms\n      $removeText - the text for the remove link\n  ------------------------------------------------------------------------\n*/\nglobal $database_connection_charset;\n// Conversion code name between html page character encoding and Mysql character encoding\n// Some others conversions should be added if needed. Otherwise Page charset = Database charset\n$pageCharset = array(\n  ''utf8'' => ''UTF-8'',\n  ''latin1'' => ''ISO-8859-1'',\n  ''latin2'' => ''ISO-8859-2''\n);\n\nif (isset($_REQUEST[''searched'']) && isset($_REQUEST[''highlight''])) {\n\n  // Set these to customize the text for the highlighting key\n  // --------------------------------------------------------\n     $termText = ''<div class="searchTerms">Search Terms: '';\n     $removeText = ''Remove Highlighting'';\n  // --------------------------------------------------------\n\n  $highlightText = $termText;\n  $advsearch = ''oneword'';\n\n  $dbCharset = $database_connection_charset;\n  $pgCharset = array_key_exists($dbCharset,$pageCharset) ? $pageCharset[$dbCharset] : $dbCharset;\n\n  // magic quotes check\n  if (get_magic_quotes_gpc()){\n    $searched = strip_tags(stripslashes($_REQUEST[''searched'']));\n    $highlight = strip_tags(stripslashes($_REQUEST[''highlight'']));\n    if (isset($_REQUEST[''advsearch''])) $advsearch = strip_tags(stripslashes($_REQUEST[''advsearch'']));\n  }\n  else {\n    $searched = strip_tags($_REQUEST[''searched'']);\n    $highlight = strip_tags($_REQUEST[''highlight'']);\n    if (isset($_REQUEST[''advsearch''])) $advsearch = strip_tags($_REQUEST[''advsearch'']);\n  }\n\n  if ($advsearch != ''nowords'') {\n\n    $searchArray = array();\n    if ($advsearch == ''exactphrase'') $searchArray[0] = $searched;\n    else $searchArray = explode('' '', $searched);\n\n    $searchArray = array_unique($searchArray);\n    $nbterms = count($searchArray);\n    $searchTerms = array();\n    for($i=0;$i<$nbterms;$i++){\n      // Consider all possible combinations\n      $word_ents = array();\n      $word_ents[] = $searchArray[$i];\n      $word_ents[] = htmlentities($searchArray[$i], ENT_NOQUOTES, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_COMPAT, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_QUOTES, $pgCharset);\n      // Avoid duplication\n      $word_ents = array_unique($word_ents);\n      foreach($word_ents as $word) $searchTerms[]= array(''term'' => $word, ''class'' => $i+1);\n    }\n\n    $output = $modx->documentOutput; // get the parsed document\n    $body = explode("<body", $output); // break out the head\n\n    $highlightClass = explode('' '',$highlight); // break out the highlight classes\n    /* remove possibility of XSS attempts being passed in URL */\n    foreach ($highlightClass as $key => $value) {\n       $highlightClass[$key] = preg_match(''/[^A-Za-z0-9_-]/ms'', $value) == 1 ? '''' : $value;\n    }\n\n    $pcreModifier = ($pgCharset == ''UTF-8'') ? ''iu'' : ''i'';\n    $lookBehind = ''/(?<!&|&[\\w#]|&[\\w#]\\w|&[\\w#]\\w\\w|&[\\w#]\\w\\w\\w|&[\\w#]\\w\\w\\w\\w|&[\\w#]\\w\\w\\w\\w\\w)'';  // avoid a match with a html entity\n    $lookAhead = ''(?=[^>]*<)/''; // avoid a match with a html tag\n\n    $nbterms = count($searchTerms);\n    for($i=0;$i<$nbterms;$i++){\n      $word = $searchTerms[$i][''term''];\n      $class = $highlightClass[0].'' ''.$highlightClass[$searchTerms[$i][''class'']];\n\n      $highlightText .= ($i > 0) ? '', '' : '''';\n      $highlightText .= ''<span class="''.$class.''">''.$word.''</span>'';\n\n      $pattern = $lookBehind . preg_quote($word, ''/'') . $lookAhead . $pcreModifier;\n      $replacement = ''<span class="'' . $class . ''">${0}</span>'';\n      $body[1] = preg_replace($pattern, $replacement, $body[1]);\n    }\n\n    $output = implode("<body", $body);\n\n    $removeUrl = $modx->makeUrl($modx->documentIdentifier);\n    $highlightText .= ''<br /><a href="''.$removeUrl.''" class="ajaxSearch_removeHighlight">''.$removeText.''</a></div>'';\n\n    $output = str_replace(''<!--search_terms-->'',$highlightText,$output);\n    $modx->documentOutput = $output;\n  }\n}', 0, '', 1, ''),
(7, 'TinyMCE Rich Text Editor', '<strong>3.5.11</strong> Javascript WYSIWYG Editor', 0, 4, 0, 'require MODX_BASE_PATH.''assets/plugins/tinymce/plugin.tinymce.php'';\n', 0, '&customparams=Custom Parameters;textarea;valid_elements : "*[*]", &mce_formats=Block Formats;text;p,h1,h2,h3,h4,h5,h6,div,blockquote,code,pre &entity_encoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &mce_path_options=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &mce_resizing=Advanced Resizing;list;true,false;true &disabledButtons=Disabled Buttons;text; &link_list=Link List;list;enabled,disabled;enabled &webtheme=Web Theme;list;simple,editor,creative,custom;simple &webPlugins=Web Plugins;text;style,advimage,advlink,searchreplace,contextmenu,paste,fullscreen,xhtmlxtras,media &webButtons1=Web Buttons 1;text;undo,redo,selectall,|,pastetext,pasteword,|,search,replace,|,hr,charmap,|,image,link,unlink,anchor,media,|,cleanup,removeformat,|,fullscreen,code,help &webButtons2=Web Buttons 2;text;bold,italic,underline,strikethrough,sub,sup,|,|,blockquote,bullist,numlist,outdent,indent,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,|,styleprops &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;500', 0, ''),
(8, 'TransAlias', '<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides', 0, 4, 0, 'require MODX_BASE_PATH.''assets/plugins/transalias/plugin.transalias.php'';', 0, '&table_name=Trans table;list;common,russian,dutch,german,czech,utf8,utf8lowercase;utf8lowercase &char_restrict=Restrict alias to;list;lowercase alphanumeric,alphanumeric,legal characters;legal characters &remove_periods=Remove Periods;list;Yes,No;No &word_separator=Word Separator;list;dash,underscore,none;dash &override_tv=Override TV name;string;', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_plugin_events`
--

CREATE TABLE IF NOT EXISTS `modx_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links to system events';

--
-- Дамп данных таблицы `modx_site_plugin_events`
--

INSERT INTO `modx_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1, 23, 0),
(1, 29, 0),
(1, 35, 0),
(1, 41, 0),
(1, 47, 0),
(1, 73, 0),
(2, 34, 0),
(2, 35, 0),
(2, 36, 0),
(2, 40, 0),
(2, 41, 0),
(2, 42, 0),
(3, 80, 0),
(3, 81, 0),
(3, 93, 0),
(4, 28, 0),
(4, 29, 0),
(4, 30, 0),
(4, 31, 0),
(4, 35, 0),
(4, 53, 0),
(4, 205, 0),
(5, 31, 0),
(5, 28, 0),
(5, 13, 0),
(5, 3, 0),
(5, 92, 0),
(6, 3, 0),
(7, 85, 0),
(7, 87, 0),
(7, 88, 0),
(8, 100, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_snippets`
--

CREATE TABLE IF NOT EXISTS `modx_site_snippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.' AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `modx_site_snippets`
--

INSERT INTO `modx_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`) VALUES
(1, 'AjaxSearch', '<strong>1.10.1</strong> Ajax and non-Ajax search that supports results highlighting', 0, 5, 0, 'return require MODX_BASE_PATH.''assets/snippets/ajaxSearch/snippet.ajaxSearch.php'';', 0, '', ''),
(2, 'Breadcrumbs', '<strong>1.0.5</strong> Configurable breadcrumb page-trail navigation', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/breadcrumbs/snippet.breadcrumbs.php'';', 0, '', ''),
(3, 'Ditto', '<strong>2.1.1</strong> Summarizes and lists pages to create blogs, catalogs, PR archives, bio listings and more', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/ditto/snippet.ditto.php'';', 0, '', ''),
(4, 'DocLister', '<strong>2.1.30</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/DocLister/snippet.DocLister.php'';', 0, '', ''),
(5, 'eForm', '<strong>1.4.6</strong> Robust form parser/processor with validation, multiple sending options, chunk/page support for forms and reports, and file uploads', 0, 8, 0, 'return require MODX_BASE_PATH.''assets/snippets/eform/snippet.eform.php'';', 0, '', ''),
(6, 'FirstChildRedirect', '<strong>2.0</strong> Automatically redirects to the first child of a Container Resource', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/firstchildredirect/snippet.firstchildredirect.php'';', 0, '', ''),
(7, 'if', '<strong>1.2</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/if/snippet.if.php'';', 0, '', ''),
(8, 'Jot', '<strong>1.1.4</strong> User comments with moderation and email subscription', 0, 7, 0, '/*####\n#\n# Author: Armand "bS" Pondman (apondman@zerobarrier.nl)\n#\n# Latest Version: http://modx.com/extras/package/jot\n# Jot Demo Site: http://projects.zerobarrier.nl/modx/\n# Documentation: http://wiki.modxcms.com/index.php/Jot (wiki)\n#\n####*/\n\n$jotPath = $modx->config[''base_path''] . ''assets/snippets/jot/'';\ninclude_once($jotPath.''jot.class.inc.php'');\n\n$Jot = new CJot;\n$Jot->VersionCheck("1.1.4");\n$Jot->Set("path",$jotPath);\n$Jot->Set("action", $action);\n$Jot->Set("postdelay", $postdelay);\n$Jot->Set("docid", $docid);\n$Jot->Set("tagid", $tagid);\n$Jot->Set("subscribe", $subscribe);\n$Jot->Set("moderated", $moderated);\n$Jot->Set("captcha", $captcha);\n$Jot->Set("badwords", $badwords);\n$Jot->Set("bw", $bw);\n$Jot->Set("sortby", $sortby);\n$Jot->Set("numdir", $numdir);\n$Jot->Set("customfields", $customfields);\n$Jot->Set("guestname", $guestname);\n$Jot->Set("canpost", $canpost);\n$Jot->Set("canview", $canview);\n$Jot->Set("canedit", $canedit);\n$Jot->Set("canmoderate", $canmoderate);\n$Jot->Set("trusted", $trusted);\n$Jot->Set("pagination", $pagination);\n$Jot->Set("placeholders", $placeholders);\n$Jot->Set("subjectSubscribe", $subjectSubscribe);\n$Jot->Set("subjectModerate", $subjectModerate);\n$Jot->Set("subjectAuthor", $subjectAuthor);\n$Jot->Set("notify", $notify);\n$Jot->Set("notifyAuthor", $notifyAuthor);\n$Jot->Set("validate", $validate);\n$Jot->Set("title", $title);\n$Jot->Set("authorid", $authorid);\n$Jot->Set("css", $css);\n$Jot->Set("cssFile", $cssFile);\n$Jot->Set("cssRowAlt", $cssRowAlt);\n$Jot->Set("cssRowMe", $cssRowMe);\n$Jot->Set("cssRowAuthor", $cssRowAuthor);\n$Jot->Set("tplForm", $tplForm);\n$Jot->Set("tplComments", $tplComments);\n$Jot->Set("tplModerate", $tplModerate);\n$Jot->Set("tplNav", $tplNav);\n$Jot->Set("tplNotify", $tplNotify);\n$Jot->Set("tplNotifyModerator", $tplNotifyModerator);\n$Jot->Set("tplNotifyAuthor", $tplNotifyAuthor);\n$Jot->Set("tplSubscribe", $tplSubscribe);\n$Jot->Set("debug", $debug);\n$Jot->Set("output", $output);\nreturn $Jot->Run();', 0, '', ''),
(9, 'ListIndexer', '<strong>1.0.1</strong> A flexible way to show the most recent Resources and other Resource lists', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/listindexer/snippet.listindexer.php'';', 0, '', ''),
(10, 'MemberCheck', '<strong>1.1</strong> Show chunks based on a logged in Web User''s group membership', 0, 3, 0, 'return require MODX_BASE_PATH.''assets/snippets/membercheck/snippet.membercheck.php'';', 0, '', ''),
(11, 'Personalize', '<strong>2.1</strong> Personalize snippet', 0, 3, 0, 'return require MODX_BASE_PATH.''assets/snippets/personalize/snippet.personalize.php'';', 0, '', ''),
(12, 'phpthumb', '<strong>1.2</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/phpthumb/snippet.phpthumb.php'';\r\n', 0, '', ''),
(13, 'Reflect', '<strong>2.1.1</strong> Generates date-based archives using Ditto', 0, 7, 0, '/*\n * Author: \n *      Mark Kaplan for MODX CMF\n * \n * Note: \n *      If Reflect is not retrieving its own documents, make sure that the\n *          Ditto call feeding it has all of the fields in it that you plan on\n *       calling in your Reflect template. Furthermore, Reflect will ONLY\n *          show what is currently in the Ditto result set.\n *       Thus, if pagination is on it will ONLY show that page''s items.\n*/\n \n\n// ---------------------------------------------------\n//  Includes\n// ---------------------------------------------------\n\n$reflect_base = isset($reflect_base) ? $modx->config[''base_path''].$reflect_base : $modx->config[''base_path'']."assets/snippets/reflect/";\n/*\n    Param: ditto_base\n    \n    Purpose:\n    Location of Ditto files\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    [(base_path)]assets/snippets/ditto/\n*/\n\n$config = (isset($config)) ? $config : "default";\n/*\n    Param: config\n\n    Purpose:\n    Load a custom configuration\n\n    Options:\n    "default" - default blank config file\n    CONFIG_NAME - Other configs installed in the configs folder or in any folder within the MODX base path via @FILE\n\n    Default:\n    "default"\n    \n    Related:\n    - <extenders>\n*/\n\nrequire($reflect_base."configs/default.config.php");\nrequire($reflect_base."default.templates.php");\nif ($config != "default") {\n    require((substr($config, 0, 5) != "@FILE") ? $reflect_base."configs/$config.config.php" : $modx->config[''base_path''].trim(substr($config, 5)));\n}\n\n// ---------------------------------------------------\n//  Parameters\n// ---------------------------------------------------\n\n$id = isset($id) ? $id."_" : false;\n/*\n    Param: id\n\n    Purpose:\n    Unique ID for this Ditto instance for connection with other scripts (like Reflect) and unique URL parameters\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    "" - blank\n*/\n$getDocuments = isset($getDocuments) ? $getDocuments : 0;\n/*\n    Param: getDocuments\n\n    Purpose:\n    Force Reflect to get documents\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    0 - off\n*/\n$showItems = isset($showItems) ? $showItems : 1;\n/*\n    Param: showItems\n\n    Purpose:\n    Show individual items in the archive\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$groupByYears = isset($groupByYears)? $groupByYears : 1;\n/*\n    Param: groupByYears\n\n    Purpose:\n    Group the archive by years\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$targetID = isset($targetID) ? $targetID : $modx->documentObject[''id''];\n/*\n    Param: targetID\n\n    Purpose:\n    ID for archive links to point to\n\n    Options:\n    Any MODX document with a Ditto call setup with extenders=`dateFilter`\n    \n    Default:\n    Current MODX Document\n*/\n$dateSource = isset($dateSource) ? $dateSource : "createdon";\n/*\n    Param: dateSource\n\n    Purpose:\n    Date source to display for archive items\n\n    Options:\n    # - Any UNIX timestamp from MODX fields or TVs such as createdon, pub_date, or editedon\n    \n    Default:\n    "createdon"\n    \n    Related:\n    - <dateFormat>\n*/\n$dateFormat = isset($dateFormat) ? $dateFormat : "%d-%b-%y %H:%M";  \n/*\n    Param: dateFormat\n\n    Purpose:\n    Format the [+date+] placeholder in human readable form\n\n    Options:\n    Any PHP valid strftime option\n\n    Default:\n    "%d-%b-%y %H:%M"\n    \n    Related:\n    - <dateSource>\n*/\n$yearSortDir = isset($yearSortDir) ? $yearSortDir : "DESC";\n/*\n    Param: yearSortDir\n\n    Purpose:\n    Direction to sort documents\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    "DESC"\n    \n    Related:\n    - <monthSortDir>\n*/\n$monthSortDir = isset($monthSortDir) ? $monthSortDir : "ASC";\n/*\n    Param: monthSortDir\n\n    Purpose:\n    Direction to sort the months\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    "ASC"\n    \n    Related:\n    - <yearSortDir>\n*/\n$start = isset($start)? intval($start) : 0;\n/*\n    Param: start\n\n    Purpose:\n    Number of documents to skip in the results\n    \n    Options:\n    Any number\n\n    Default:\n    0\n*/  \n$phx = (isset($phx))? $phx : 1;\n/*\n    Param: phx\n\n    Purpose:\n    Use PHx formatting\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$emptymsg = isset($emptymsg)? $emptymsg : "The Ditto object is invalid. Please check it.";\n/*\n    Param: emptymsg\n\n    Purpose:\n    Message to return if error\n\n    Options:\n    Any string\n    \n    Default:\n    The Ditto object is invalid. Please check it.\n*/\n\n// ---------------------------------------------------\n//  Initialize Ditto\n// ---------------------------------------------------\n$placeholder = ($id != false && $getDocuments == 0) ? true : false;\nif ($placeholder === false) {\n    $rID = "reflect_".rand(1,1000);\n    $itemTemplate = isset($tplItem) ? $tplItem: "@CODE:".$defaultTemplates[''item''];\n    $dParams = array(\n        "id" => "$rID",\n        "save" => "3",  \n        "summarize" => "all",\n        "tpl" => $itemTemplate,\n    );\n    \n    $source = $dittoSnippetName;\n    $params = $dittoSnippetParameters;\n        // TODO: Remove after 3.0\n        \n    if (isset($params)) {\n        $givenParams = explode("|",$params);\n        foreach ($givenParams as $parameter) {\n            $p = explode(":",$parameter);\n            $dParams[$p[0]] = $p[1];\n        }\n    }\n    /*\n        Param: params\n\n        Purpose:\n        Pass parameters to the Ditto instance used to retreive the documents\n\n        Options:\n        Any valid ditto parameters in the format name:value \n        with multiple parameters separated by a pipe (|)\n        \n        Note:\n        This parameter is only needed for config, start, and phx as you can\n        now simply use the parameter as if Reflect was Ditto\n\n        Default:\n        [NULL]\n    */\n    \n    $reflectParameters = array(''reflect_base'',''config'',''id'',''getDocuments'',''showItems'',''groupByYears'',''targetID'',''yearSortDir'',''monthSortDir'',''start'',''phx'',''tplContainer'',''tplYear'',''tplMonth'',''tplMonthInner'',''tplItem'',''save'');\n    $params =& $modx->event->params;\n    if(is_array($params)) {\n        foreach ($params as $param=>$value) {\n            if (!in_array($param,$reflectParameters) && substr($param,-3) != ''tpl'') {\n                $dParams[$param] = $value;\n            }\n        }\n    }\n\n    $source = isset($source) ? $source : "Ditto";\n    /*\n        Param: source\n\n        Purpose:\n        Name of the Ditto snippet to use\n\n        Options:\n        Any valid snippet name\n\n        Default:\n        "Ditto"\n    */\n    $snippetOutput = $modx->runSnippet($source,$dParams);\n    $ditto = $modx->getPlaceholder($rID."_ditto_object");\n    $resource = $modx->getPlaceholder($rID."_ditto_resource");\n} else {\n    $ditto = $modx->getPlaceholder($id."ditto_object");\n    $resource = $modx->getPlaceholder($id."ditto_resource");\n}\nif (!is_object($ditto) || !isset($ditto) || !isset($resource)) {\n    return !empty($snippetOutput) ? $snippetOutput : $emptymsg;\n}\n\n// ---------------------------------------------------\n//  Templates\n// ---------------------------------------------------\n\n$templates[''tpl''] = isset($tplContainer) ? $ditto->template->fetch($tplContainer): $defaultTemplates[''tpl''];\n/*\n    Param: tplContainer\n\n    Purpose:\n    Container template for the archive\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''year''] = isset($tplYear) ? $ditto->template->fetch($tplYear): $defaultTemplates[''year''];\n/*\n    Param: tplYear\n\n    Purpose:\n    Template for the year item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''year_inner''] = isset($tplYearInner) ? $ditto->template->fetch($tplYearInner): $defaultTemplates[''year_inner''];\n/*\n    Param: tplYearInner\n\n    Purpose:\n    Template for the year item (the ul to hold the year template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''month''] = isset($tplMonth) ? $ditto->template->fetch($tplMonth): $defaultTemplates[''month''];\n/*\n    Param: tplMonth\n\n    Purpose:\n    Template for the month item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''month_inner''] = isset($tplMonthInner) ? $ditto->template->fetch($tplMonthInner): $defaultTemplates[''month_inner''];\n/*\n    Param: tplMonthInner\n\n    Purpose:\n    Template for the month item  (the ul to hold the month template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''item''] = isset($tplItem) ? $ditto->template->fetch($tplItem): $defaultTemplates[''item''];\n/*\n    Param: tplItem\n\n    Purpose:\n    Template for the individual item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n\n$ditto->addField("date","display","custom");\n    // force add the date field if receiving data from a Ditto instance\n\n// ---------------------------------------------------\n//  Reflect\n// ---------------------------------------------------\n\nif (function_exists("reflect") === FALSE) {\nfunction reflect($templatesDocumentID, $showItems, $groupByYears, $resource, $templatesDateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir) {\n    global $modx;\n    $cal = array();\n    $output = '''';\n    $ph = array(''year''=>'''',''month''=>'''',''item''=>'''',''out''=>'''');\n    $build = array();\n    $stop = count($resource);\n\n    // loop and fetch all the results\n    for ($i = $start; $i < $stop; $i++) {\n        $date = getdate($resource[$i][$templatesDateSource]);\n        $year = $date["year"];\n        $month = $date["mon"];\n        $cal[$year][$month][] = $resource[$i];\n    }\n    if ($yearSortDir == "DESC") {\n        krsort($cal);\n    } else {\n        ksort($cal);\n    }\n    foreach ($cal as $year=>$months) {\n        if ($monthSortDir == "ASC") {\n            ksort($months);\n        } else {\n            krsort($months);\n        }\n        $build[$year] = $months;\n    }\n    \n    foreach ($build as $year=>$months) {\n        $r_year = '''';\n        $r_month = '''';\n        $r_month_2 = '''';\n        $year_count = 0;\n        $items = array();\n        \n        foreach ($months as $mon=>$month) {\n            $month_text = strftime("%B", mktime(10, 10, 10, $mon, 10, $year));\n            $month_url = $ditto->buildURL("month=".$mon."&year=".$year."&day=false&start=0",$templatesDocumentID,$id);\n            $month_count = count($month);\n            $year_count += $month_count;\n            $r_month = $ditto->template->replace(array("year"=>$year,"month"=>$month_text,"url"=>$month_url,"count"=>$month_count),$templates[''month'']);\n            if ($showItems) {\n                foreach ($month as $item) {\n                    $items[$year][$mon][''items''][] = $ditto->render($item, $templates[''item''], false, $templatesDateSource, $dateFormat, array(),$phx);\n                }\n                $r_month_2 = $ditto->template->replace(array(''wrapper'' => implode('''',$items[$year][$mon][''items''])),$templates[''month_inner'']);\n                $items[$year][$mon] = $ditto->template->replace(array(''wrapper'' => $r_month_2),$r_month);\n            } else {\n                $items[$year][$mon] = $r_month;\n            }\n        }\n        if ($groupByYears) {\n            $year_url = $ditto->buildURL("year=".$year."&month=false&day=false&start=0",$templatesDocumentID,$id);\n            $r_year =  $ditto->template->replace(array("year"=>$year,"url"=>$year_url,"count"=>$year_count),$templates[''year'']);\n            $var = $ditto->template->replace(array(''wrapper''=>implode('''',$items[$year])),$templates[''year_inner'']);\n            $output .= $ditto->template->replace(array(''wrapper''=>$var),$r_year);\n        } else {\n            $output .= implode('''',$items[$year]);\n        }\n    }\n\n    $output = $ditto->template->replace(array(''wrapper''=>$output),$templates[''tpl'']);\n    $modx->setPlaceholder($id.''reset'',$ditto->buildURL(''year=false&month=false&day=false'',$templatesDocumentID,$id));\n\nreturn $output;\n    \n}\n}\n\nreturn reflect($targetID, $showItems, $groupByYears, $resource, $dateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir);\n', 0, '', ''),
(14, 'UltimateParent', '<strong>2.0</strong> Travels up the document tree from a specified document and returns its "ultimate" non-root parent', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/ultimateparent/snippet.ultimateparent.php'';', 0, '', ''),
(15, 'Wayfinder', '<strong>2.0.4</strong> Completely template-driven and highly flexible menu builder', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/wayfinder/snippet.wayfinder.php'';\n', 0, '', ''),
(16, 'WebChangePwd', '<strong>1.0.1</strong> Allows Web User to change their password from the front-end of the website', 0, 3, 0, '# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&tpl			- (Optional)\n#		Chunk name or document id to use as a template\n#				  \n#	Note: Templats design:\n#			section 1: change pwd template\n#			section 2: notification template \n#\n# Examples:\n#\n#	[[WebChangePwd? &tpl=`ChangePwd`]] \n\n# Set Snippet Paths \n$snipPath  = (($modx->isBackend())? "../":"");\n$snipPath .= "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->isBackend()) {\n	return ''''; # don''t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl		= isset($tpl)? $tpl:"";\n\n# System settings\n$isPostBack		= count($_POST) && isset($_POST[''cmdwebchngpwd'']);\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once $snipPath."weblogin/webchangepwd.inc.php";\n\n# Return\nreturn $output;\n\n\n\n', 0, '', ''),
(17, 'WebLogin', '<strong>1.1.1</strong> Allows webusers to login to protected pages in the website, supporting multiple user groups', 0, 3, 0, '# Created By Raymond Irving 2004\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&loginhomeid 	- (Optional)\n#		redirects the user to first authorized page in the list.\n#		If no id was specified then the login home page id or \n#		the current document id will be used\n#\n#	&logouthomeid 	- (Optional)\n#		document id to load when user logs out	\n#\n#	&pwdreqid 	- (Optional)\n#		document id to load after the user has submited\n#		a request for a new password\n#\n#	&pwdactid 	- (Optional)\n#		document id to load when the after the user has activated\n#		their new password\n#\n#	&logintext		- (Optional) \n#		Text to be displayed inside login button (for built-in form)\n#\n#	&logouttext 	- (Optional)\n#		Text to be displayed inside logout link (for built-in form)\n#	\n#	&tpl			- (Optional)\n#		Chunk name or document id to as a template\n#				  \n#	Note: Templats design:\n#			section 1: login template\n#			section 2: logout template \n#			section 3: password reminder template \n#\n#			See weblogin.tpl for more information\n#\n# Examples:\n#\n#	[[WebLogin? &loginhomeid=`8` &logouthomeid=`1`]] \n#\n#	[[WebLogin? &loginhomeid=`8,18,7,5` &tpl=`Login`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[''base_path''] . "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->isBackend()) {\n	return ''''; # don''t go any further when inside manager\n}\n\n# deprecated params - only for backward compatibility\nif(isset($loginid)) $loginhomeid=$loginid;\nif(isset($logoutid)) $logouthomeid = $logoutid;\nif(isset($template)) $tpl = $template;\n\n# Snippet customize settings\n$liHomeId	= isset($loginhomeid)? array_filter(array_map(''intval'', explode('','', $loginhomeid))):array($modx->config[''login_home''],$modx->documentIdentifier);\n$loHomeId	= isset($logouthomeid)? $logouthomeid:$modx->documentIdentifier;\n$pwdReqId	= isset($pwdreqid)? $pwdreqid:0;\n$pwdActId	= isset($pwdactid)? $pwdactid:0;\n$loginText	= isset($logintext)? $logintext:''Login'';\n$logoutText	= isset($logouttext)? $logouttext:''Logout'';\n$tpl		= isset($tpl)? $tpl:"";\n\n# System settings\n$webLoginMode = isset($_REQUEST[''webloginmode''])? $_REQUEST[''webloginmode'']: '''';\n$isLogOut		= $webLoginMode==''lo'' ? 1:0;\n$isPWDActivate	= $webLoginMode==''actp'' ? 1:0;\n$isPostBack		= count($_POST) && (isset($_POST[''cmdweblogin'']) || isset($_POST[''cmdweblogin_x'']));\n$txtPwdRem 		= isset($_REQUEST[''txtpwdrem''])? $_REQUEST[''txtpwdrem'']: 0;\n$isPWDReminder	= $isPostBack && $txtPwdRem==''1'' ? 1:0;\n\n$site_id = isset($site_id)? $site_id: '''';\n$cookieKey = substr(md5($site_id."Web-User"),0,15);\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once ($modx->config[''site_manager_path''] . "includes/crypt.class.inc.php");\n\nif ($isPWDActivate || $isPWDReminder || $isLogOut || $isPostBack) {\n	# include the logger class\n	include_once $modx->config[''site_manager_path''] . "includes/log.class.inc.php";\n	include_once $snipPath."weblogin/weblogin.processor.inc.php";\n}\n\ninclude_once $snipPath."weblogin/weblogin.inc.php";\n\n# Return\nreturn $output;\n', 0, '&loginhomeid=Login Home Id;string; &logouthomeid=Logout Home Id;string; &logintext=Login Button Text;string; &logouttext=Logout Button Text;string; &tpl=Template;string;', ''),
(18, 'WebSignup', '<strong>1.1.1</strong> Basic Web User account creation/signup system', 0, 3, 0, '# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Usage:     \n#    Allows a web user to signup for a new web account from the website\n#    This snippet provides a basic set of form fields for the signup form\n#    You can customize this snippet to create your own signup form\n#\n# Params:    \n#\n#    &tpl        - (Optional) Chunk name or document id to use as a template\n#	    		   If custom template AND captcha on AND using WebSignup and \n#                  WebLogin on the same page make sure you have a field named\n#                  cmdwebsignup. In the default template it is the submit button \n#                  One can use a hidden field.\n#    &groups     - Web users groups to be assigned to users\n#    &useCaptcha - (Optional) Determine to use (1) or not to use (0) captcha\n#                  on signup form - if not defined, will default to system\n#                  setting. GD is required for this feature. If GD is not \n#                  available, useCaptcha will automatically be set to false;\n#                  \n#    Note: Templats design:\n#        section 1: signup template\n#        section 2: notification template \n#\n# Examples:\n#\n#    [[WebSignup? &tpl=`SignupForm` &groups=`NewsReaders,WebUsers`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[''base_path''] . "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->isBackend()) {\n    return ''''; # don''t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl = isset($tpl)? $tpl:"";\n$useCaptcha = isset($useCaptcha)? $useCaptcha : $modx->config[''use_captcha''] ;\n// Override captcha if no GD\nif ($useCaptcha && !gd_info()) $useCaptcha = 0;\n\n# setup web groups\n$groups = isset($groups) ? array_filter(array_map(''trim'', explode('','', $groups))):array();\n\n# System settings\n$isPostBack        = count($_POST) && isset($_POST[''cmdwebsignup'']);\n\n$output = '''';\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once $snipPath."weblogin/websignup.inc.php";\n\n# Return\nreturn $output;', 0, '&tpl=Template;string;', ''),
(19, 'dittoSplitPagination', 'для разбиения страницы Ditto', 0, 0, 0, '\r\n// Snippet: splitPagination\r\n// Must be placed immediately following a Ditto call\r\n// Based on the function written by Aaron Hall, evilwalrus.org\r\nif (!function_exists("generatePagination")) {\r\nfunction generatePagination($curPage, $totResults, $resultsPerPage)\r\n{\r\n        $totPages = ceil($totResults / $resultsPerPage);\r\n        \r\n        $pagesBefore = $curPage - 1;\r\n        $pagesAfter = $totPages - $curPage;\r\n        \r\n        $tabArr = array();\r\n        \r\n        if($totPages > 15) {\r\n                \r\n                if($pagesBefore > 7) {\r\n                        $tabArr = array(1,2,0);\r\n                        \r\n                        if($pagesAfter > 7)\r\n                        {\r\n                                for($i=($curPage-(4)); $i<$curPage; $i++) { $tabArr[] = $i; }\r\n                        } else {\r\n                                for($i=($totPages-11); $i<$curPage; $i++) { $tabArr[] = $i; }\r\n                        }\r\n                } else {\r\n                        for($i=1; $i<$curPage; $i++) { $tabArr[] = $i; }\r\n                }\r\n                \r\n                $tabArr[] = $curPage;\r\n                \r\n                if($pagesAfter > 7) {\r\n                        if($pagesBefore > 7) {                          \r\n                                for($i=($curPage+1); $i<=$curPage+4; $i++) { $tabArr[] = $i; }\r\n                        } else {\r\n                                for($i=($curPage+1); $i<13; $i++) { $tabArr[] = $i; }\r\n                        }\r\n                        $tabArr[] = 0;\r\n                        $tabArr[] = $totPages-1;\r\n                        $tabArr[] = $totPages;\r\n                } else {\r\n                        for($i=($curPage+1); $i<=$totPages; $i++) { $tabArr[] = $i; }\r\n                }\r\n                \r\n        } else {\r\n                for($i=1;$i<=$totPages;$i++) { $tabArr[] = $i; }\r\n        }\r\n                        \r\n        return $tabArr;\r\n        \r\n}\r\n}\r\n$id = isset($id) ? $id.''_'' : '''';\r\n$total = isset($total) ? $total : $modx->getPlaceholder($id."total");\r\n$start = isset($start) ? $start : $modx->getPlaceholder($id."start");\r\n$display = isset($display) ? $display : $modx->getPlaceholder($id."perPage");\r\n$currentPage = isset($currentPage) ? $currentPage : $modx->getPlaceholder($id."current");\r\n$landing = isset($tagDocumentID) ? $tagDocumentID : $modx->documentObject[''id''];\r\nif ($total == 0 || $display==0) {\r\n        return false;\r\n}\r\n$page = ceil($start/$display);\r\n$return = isset($return) ? $return : 0;\r\n$paginationArray = generatePagination($page, $total, $display);\r\n$ph = "";\r\n$cInc = $_GET[$id.''start''];\r\nforeach($paginationArray as $page) {\r\n        $inc = ($page-1)*$display;\r\n        if($page == 0) {\r\n                $ph .= "..."; // print an elipse, representing pages that aren''t displayed\r\n        } else if ($inc==$cInc) {\r\n                $ph .= "<span class=\\"ditto_currentpage\\">$page</span>";                \r\n        } else {\r\n                $ph .= "<a class=\\"ditto_page\\" href=''".ditto::buildURL("start=".$inc,$landing,$id)."''>$page</a>";\r\n        }\r\n        \r\n\r\n}\r\n$modx->setPlaceholder($id."splitPages",$ph);\r\nif ($return) return $ph;\r\n', 0, '', ' ');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_templates`
--

CREATE TABLE IF NOT EXISTS `modx_site_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `selectable` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.' AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `modx_site_templates`
--

INSERT INTO `modx_site_templates` (`id`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `selectable`) VALUES
(3, 'Главная страница', 'шаблон для главной с jquery галереей', 0, 0, '', 0, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">\r\n{{HEAD}}\r\n<body id="top">\r\n	{{HEADER}}\r\n	{{GALLERY}}\r\n	{{MAIN-CONTENT}}\r\n	{{FOOTER}}\r\n\r\n\r\n</body>\r\n</html>\r\n', 0, 1),
(5, '2колонки', 'шаблон с навигацией справа', 0, 0, '', 0, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">\r\n{{HEAD}}\r\n<body id="top">\r\n{{HEADER}}\r\n<!-- ####################################################################################################### -->\r\n{{BREADCRUMB}}\r\n<!-- ####################################################################################################### -->\r\n<div class="wrapper col3">\r\n  <div id="container">\r\n  {{CONTENT}}\r\n    </div>\r\n   {{RIGHT-COL}}\r\n    <br class="clear" />\r\n  </div>\r\n</div>\r\n{{FOOTER}}\r\n</div>\r\n</body>\r\n</html>\r\n', 0, 1),
(6, 'Во всю ширину', 'шаблон во всю ширину', 0, 0, '', 0, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">\r\n{{HEAD}}\r\n<body id="top">\r\n{{HEADER}}\r\n{{BREADCRUMB}}\r\n<div class="wrapper col3">\r\n  <div id="container">\r\n<h1>[*longtitle*]</h1>\r\n[*content*]\r\n    <br class="clear" />\r\n  </div>\r\n</div>\r\n{{FOOTER}}\r\n</body>\r\n</html>', 0, 1),
(7, 'Форма связи', '', 0, 0, '', 0, '<!DOCTYPE HTML>\r\n<html lang="ru">\r\n<head>\r\n<title>Форма связи</title>\r\n<base href=''[(site_url)]''>\r\n<script src="assets/templates/theme/js/jquery.js"></script>\r\n<link type="text/css" rel="stylesheet" media="all" href="assets/templates/theme/css/form.css">\r\n</head>\r\n<body>\r\n<div class="wrap">\r\n<div class="sendform">\r\n<h3>Форма связи</h3>\r\n[!eForm? &formid=`modal_form` &tpl=`form-tpl` &to=`admin@mail.ru` &report=`report-tpl` &thankyou=`thank-tpl` &subject=`Сообщение`!]\r\n	<script>\r\n$(document).ready(function() {\r\n$("a.question_frame").form({\r\n''autoScale'' : true,\r\n''scrolling'' :''no'',\r\n''transitionIn'' : ''none'',\r\n''transitionOut'' : ''none'',\r\n''type'' : ''iframe'',\r\n''padding'' :0,\r\n''centerOnScroll'':true,\r\n''fitToView'': true,\r\n''autoDimensions'': true\r\n});\r\n});</script>\r\n</div>\r\n</div>\r\n</body>\r\n</html>', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvars`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Template Variables' AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `modx_site_tmplvars`
--

INSERT INTO `modx_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`) VALUES
(1, 'richtext', 'blogContent', 'blogContent', 'RTE for the new blog entries', 0, 1, 0, '', 0, 'RichText', '&w=383px&h=450px&edt=TinyMCE', ''),
(2, 'text', 'documentTags', 'Tags', 'Space delimited tags for the current document', 0, 1, 0, '', 0, '', '', ''),
(3, 'text', 'loginName', 'loginName', 'Conditional name for the Login menu item', 0, 1, 0, '', 0, '', '', '@EVAL if ($modx->getLoginUserID()) return ''Logout''; else return ''Login'';'),
(4, 'image', 'img-news', 'Изображение для страницы', 'Изображение для ресурса. Для новости должно быть 60px на 60px', 0, 0, 0, '', 0, 'image', '&align=none', '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvar_access`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvar_contentvalues`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `value_ft_idx` (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table' AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `modx_site_tmplvar_contentvalues`
--

INSERT INTO `modx_site_tmplvar_contentvalues` (`id`, `tmplvarid`, `contentid`, `value`) VALUES
(1, 4, 8, 'assets/images/news/1.jpg'),
(2, 4, 9, 'assets/images/news/2.jpg'),
(3, 4, 10, 'assets/images/news/3.jpg'),
(4, 4, 11, 'assets/images/news/4.jpg'),
(5, 4, 12, 'assets/images/news/5.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvar_templates`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Templates Link Table';

--
-- Дамп данных таблицы `modx_site_tmplvar_templates`
--

INSERT INTO `modx_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(4, 5, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_system_eventnames`
--

CREATE TABLE IF NOT EXISTS `modx_system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='System Event Names.' AUTO_INCREMENT=1036 ;

--
-- Дамп данных таблицы `modx_system_eventnames`
--

INSERT INTO `modx_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1, 'OnDocPublished', 5, ''),
(2, 'OnDocUnPublished', 5, ''),
(3, 'OnWebPagePrerender', 5, ''),
(4, 'OnWebLogin', 3, ''),
(5, 'OnBeforeWebLogout', 3, ''),
(6, 'OnWebLogout', 3, ''),
(7, 'OnWebSaveUser', 3, ''),
(8, 'OnWebDeleteUser', 3, ''),
(9, 'OnWebChangePassword', 3, ''),
(10, 'OnWebCreateGroup', 3, ''),
(11, 'OnManagerLogin', 2, ''),
(12, 'OnBeforeManagerLogout', 2, ''),
(13, 'OnManagerLogout', 2, ''),
(14, 'OnManagerSaveUser', 2, ''),
(15, 'OnManagerDeleteUser', 2, ''),
(16, 'OnManagerChangePassword', 2, ''),
(17, 'OnManagerCreateGroup', 2, ''),
(18, 'OnBeforeCacheUpdate', 4, ''),
(19, 'OnCacheUpdate', 4, ''),
(107, 'OnMakePageCacheKey', 4, ''),
(20, 'OnLoadWebPageCache', 4, ''),
(21, 'OnBeforeSaveWebPageCache', 4, ''),
(22, 'OnChunkFormPrerender', 1, 'Chunks'),
(23, 'OnChunkFormRender', 1, 'Chunks'),
(24, 'OnBeforeChunkFormSave', 1, 'Chunks'),
(25, 'OnChunkFormSave', 1, 'Chunks'),
(26, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
(27, 'OnChunkFormDelete', 1, 'Chunks'),
(28, 'OnDocFormPrerender', 1, 'Documents'),
(29, 'OnDocFormRender', 1, 'Documents'),
(30, 'OnBeforeDocFormSave', 1, 'Documents'),
(31, 'OnDocFormSave', 1, 'Documents'),
(32, 'OnBeforeDocFormDelete', 1, 'Documents'),
(33, 'OnDocFormDelete', 1, 'Documents'),
(1033, 'OnDocFormUnDelete', 1, 'Documents'),
(1034, 'onBeforeMoveDocument', 1, 'Documents'),
(1035, 'onAfterMoveDocument', 1, 'Documents'),
(34, 'OnPluginFormPrerender', 1, 'Plugins'),
(35, 'OnPluginFormRender', 1, 'Plugins'),
(36, 'OnBeforePluginFormSave', 1, 'Plugins'),
(37, 'OnPluginFormSave', 1, 'Plugins'),
(38, 'OnBeforePluginFormDelete', 1, 'Plugins'),
(39, 'OnPluginFormDelete', 1, 'Plugins'),
(40, 'OnSnipFormPrerender', 1, 'Snippets'),
(41, 'OnSnipFormRender', 1, 'Snippets'),
(42, 'OnBeforeSnipFormSave', 1, 'Snippets'),
(43, 'OnSnipFormSave', 1, 'Snippets'),
(44, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
(45, 'OnSnipFormDelete', 1, 'Snippets'),
(46, 'OnTempFormPrerender', 1, 'Templates'),
(47, 'OnTempFormRender', 1, 'Templates'),
(48, 'OnBeforeTempFormSave', 1, 'Templates'),
(49, 'OnTempFormSave', 1, 'Templates'),
(50, 'OnBeforeTempFormDelete', 1, 'Templates'),
(51, 'OnTempFormDelete', 1, 'Templates'),
(52, 'OnTVFormPrerender', 1, 'Template Variables'),
(53, 'OnTVFormRender', 1, 'Template Variables'),
(54, 'OnBeforeTVFormSave', 1, 'Template Variables'),
(55, 'OnTVFormSave', 1, 'Template Variables'),
(56, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
(57, 'OnTVFormDelete', 1, 'Template Variables'),
(58, 'OnUserFormPrerender', 1, 'Users'),
(59, 'OnUserFormRender', 1, 'Users'),
(60, 'OnBeforeUserFormSave', 1, 'Users'),
(61, 'OnUserFormSave', 1, 'Users'),
(62, 'OnBeforeUserFormDelete', 1, 'Users'),
(63, 'OnUserFormDelete', 1, 'Users'),
(64, 'OnWUsrFormPrerender', 1, 'Web Users'),
(65, 'OnWUsrFormRender', 1, 'Web Users'),
(66, 'OnBeforeWUsrFormSave', 1, 'Web Users'),
(67, 'OnWUsrFormSave', 1, 'Web Users'),
(68, 'OnBeforeWUsrFormDelete', 1, 'Web Users'),
(69, 'OnWUsrFormDelete', 1, 'Web Users'),
(70, 'OnSiteRefresh', 1, ''),
(71, 'OnFileManagerUpload', 1, ''),
(72, 'OnModFormPrerender', 1, 'Modules'),
(73, 'OnModFormRender', 1, 'Modules'),
(74, 'OnBeforeModFormDelete', 1, 'Modules'),
(75, 'OnModFormDelete', 1, 'Modules'),
(76, 'OnBeforeModFormSave', 1, 'Modules'),
(77, 'OnModFormSave', 1, 'Modules'),
(78, 'OnBeforeWebLogin', 3, ''),
(79, 'OnWebAuthentication', 3, ''),
(80, 'OnBeforeManagerLogin', 2, ''),
(81, 'OnManagerAuthentication', 2, ''),
(82, 'OnSiteSettingsRender', 1, 'System Settings'),
(83, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
(84, 'OnUserSettingsRender', 1, 'System Settings'),
(85, 'OnInterfaceSettingsRender', 1, 'System Settings'),
(86, 'OnMiscSettingsRender', 1, 'System Settings'),
(87, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
(88, 'OnRichTextEditorInit', 1, 'RichText Editor'),
(89, 'OnManagerPageInit', 2, ''),
(90, 'OnWebPageInit', 5, ''),
(101, 'OnLoadDocumentObject', 5, ''),
(104, 'OnBeforeLoadDocumentObject', 5, ''),
(105, 'OnAfterLoadDocumentObject', 5, ''),
(91, 'OnLoadWebDocument', 5, ''),
(92, 'OnParseDocument', 5, ''),
(106, 'OnParseProperties', 5, ''),
(93, 'OnManagerLoginFormRender', 2, ''),
(94, 'OnWebPageComplete', 5, ''),
(95, 'OnLogPageHit', 5, ''),
(96, 'OnBeforeManagerPageInit', 2, ''),
(97, 'OnBeforeEmptyTrash', 1, 'Documents'),
(98, 'OnEmptyTrash', 1, 'Documents'),
(99, 'OnManagerLoginFormPrerender', 2, ''),
(100, 'OnStripAlias', 1, 'Documents'),
(102, 'OnMakeDocUrl', 5, ''),
(103, 'OnBeforeLoadExtension', 5, ''),
(200, 'OnCreateDocGroup', 1, 'Documents'),
(201, 'OnManagerWelcomePrerender', 2, ''),
(202, 'OnManagerWelcomeHome', 2, ''),
(203, 'OnManagerWelcomeRender', 2, ''),
(204, 'OnBeforeDocDuplicate', 1, 'Documents'),
(205, 'OnDocDuplicate', 1, 'Documents'),
(206, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
(207, 'OnManagerPreFrameLoader', 2, ''),
(208, 'OnManagerFrameLoader', 2, ''),
(209, 'OnManagerTreeInit', 2, ''),
(210, 'OnManagerTreePrerender', 2, ''),
(211, 'OnManagerTreeRender', 2, ''),
(212, 'OnManagerNodePrerender', 2, ''),
(213, 'OnManagerNodeRender', 2, ''),
(214, 'OnManagerMenuPrerender', 2, ''),
(224, 'OnDocFormTemplateRender', 1, 'Documents'),
(999, 'OnPageUnauthorized', 1, ''),
(1000, 'OnPageNotFound', 1, ''),
(1001, 'OnFileBrowserUpload', 1, 'File Browser Events');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_system_settings`
--

CREATE TABLE IF NOT EXISTS `modx_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';

--
-- Дамп данных таблицы `modx_system_settings`
--

INSERT INTO `modx_system_settings` (`setting_name`, `setting_value`) VALUES
('manager_theme', 'MODxRE'),
('settings_version', '1.1'),
('show_meta', '1'),
('server_offset_time', '0'),
('server_protocol', 'http'),
('manager_language', 'russian-UTF8'),
('modx_charset', 'UTF-8'),
('site_name', 'My MODX Site'),
('site_start', '1'),
('error_page', '1'),
('unauthorized_page', '1'),
('site_status', '1'),
('site_unavailable_message', 'The site is currently unavailable'),
('track_visitors', '0'),
('top_howmany', '10'),
('auto_template_logic', 'parent'),
('default_template', '3'),
('old_template', '3'),
('publish_default', '1'),
('cache_default', '1'),
('search_default', '1'),
('friendly_urls', '0'),
('friendly_url_prefix', ''),
('friendly_url_suffix', '.html'),
('friendly_alias_urls', '1'),
('use_alias_path', '1'),
('use_udperms', '1'),
('udperms_allowroot', '0'),
('failed_login_attempts', '3'),
('blocked_minutes', '60'),
('use_captcha', '0'),
('captcha_words', 'MODX,Access,Better,BitCode,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Tattoo,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('emailsender', ''),
('email_method', 'mail'),
('smtp_auth', '0'),
('smtp_host', ''),
('smtp_port', '25'),
('smtp_username', ''),
('emailsubject', 'Your login details'),
('number_of_logs', '100'),
('number_of_messages', '30'),
('number_of_results', '20'),
('use_editor', '1'),
('use_browser', '1'),
('rb_base_dir', 'Z:/home/testmodx/www/assets/'),
('rb_base_url', 'assets/'),
('which_editor', 'TinyMCE'),
('fe_editor_lang', 'russian-UTF8'),
('fck_editor_toolbar', 'standard'),
('fck_editor_autolang', '0'),
('editor_css_path', ''),
('editor_css_selectors', ''),
('strip_image_paths', '1'),
('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff'),
('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('upload_flash', 'fla,flv,swf'),
('upload_files', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF'),
('upload_maxsize', '10485760'),
('new_file_permissions', '0644'),
('new_folder_permissions', '0755'),
('filemanager_path', '/'),
('theme_refresher', ''),
('manager_layout', '4'),
('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('auto_menuindex', '1'),
('session.cookie.lifetime', '604800'),
('mail_check_timeperiod', '60'),
('manager_direction', 'ltr'),
('tinymce_editor_theme', 'custom'),
('tinymce_custom_plugins', 'style, advimage, advlink, searchreplace, print, contextmenu, paste, fullscreen, nonbreaking, xhtmlxtras, visualchars, media, table'),
('tinymce_custom_buttons1', 'pastetext, pasteword, |, nonbreaking,charmap, |, image, link, unlink, anchor, media, |, cleanup, removeformat, |, fullscreen, print, code, formatselect'),
('tinymce_custom_buttons2', 'bold, italic, underline, strikethrough, sub, sup, |, bullist, numlist, outdent, indent, |, justifyleft, justifycenter, justifyright, justifyfull, |, styleprops, styleselect'),
('tree_show_protected', '0'),
('rss_url_news', 'http://feeds.feedburner.com/modx-announce'),
('rss_url_security', 'http://feeds.feedburner.com/modxsecurity'),
('validate_referer', '1'),
('datepicker_offset', '-10'),
('xhtml_urls', '1'),
('allow_duplicate_alias', '1'),
('automatic_alias', '1'),
('datetime_format', 'dd-mm-YYYY'),
('warning_visibility', '1'),
('remember_last_tab', '0'),
('enable_bindings', '1'),
('seostrict', '0'),
('cache_type', '1'),
('maxImageWidth', '1600'),
('maxImageHeight', '1200'),
('thumbWidth', '150'),
('thumbHeight', '150'),
('thumbsDir', '.thumbs'),
('jpegQuality', '90'),
('denyZipDownload', '0'),
('denyExtensionRename', '0'),
('showHiddenFiles', '0'),
('docid_incrmnt_method', '0'),
('make_folders', '0'),
('tree_page_click', '27'),
('clean_uploaded_filename', '1'),
('site_id', '57c6c6e0c5839'),
('site_unavailable_page', ''),
('reload_site_unavailable', ''),
('siteunavailable_message_default', 'В настоящее время сайт недоступен.'),
('aliaslistingfolder', '0'),
('check_files_onlogin', 'index.php\r\n.htaccess\r\nmanager/index.php\r\nmanager/includes/config.inc.php'),
('error_reporting', '1'),
('send_errormail', '0'),
('pwd_hash_algo', 'UNCRYPT'),
('reload_captcha_words', ''),
('captcha_words_default', 'MODX,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('smtp_secure', 'none'),
('reload_emailsubject', ''),
('emailsubject_default', 'Данные для авторизации'),
('reload_signupemail_message', ''),
('signupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_signup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_websignupemail_message', ''),
('websignupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_websignup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_system_email_webreminder_message', ''),
('webpwdreminder_message', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('system_email_webreminder_default', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('resource_tree_node_name', 'pagetitle'),
('mce_editor_skin', 'cirkuit'),
('mce_template_docs', ''),
('mce_template_chunks', ''),
('mce_entermode', 'p'),
('mce_element_format', 'xhtml'),
('mce_schema', 'html4'),
('tinymce_custom_buttons3', 'tablecontrols'),
('tinymce_custom_buttons4', ''),
('tinymce_css_selectors', 'left=justifyleft;right=justifyright'),
('rb_webuser', '0'),
('sys_files_checksum', 'a:3:{s:30:"Z:/home/testmodx/www/index.php";s:32:"657db3d7274dbb84c80d4aac08a75417";s:38:"Z:/home/testmodx/www/manager/index.php";s:32:"5db76a440c8e2388efe93e738025f5d6";s:52:"Z:/home/testmodx/www/manager/includes/config.inc.php";s:32:"01a395e5765f26cff3ed8efd463973f6";}');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_attributes`
--

CREATE TABLE IF NOT EXISTS `modx_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information about the backend users.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_user_attributes`
--

INSERT INTO `modx_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`) VALUES
(1, 1, 'Default admin account', 1, '', '', '', 0, 0, 0, 2, 1472644838, 1472674543, 0, '06ab63f5dd7e05aa6ed79837be136871', 0, 0, '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_messages`
--

CREATE TABLE IF NOT EXISTS `modx_user_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_roles`
--

CREATE TABLE IF NOT EXISTS `modx_user_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `manage_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'manage site meta tags and keywords',
  `edit_doc_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'edit document meta tags and keywords',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information describing the user roles.' AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `modx_user_roles`
--

INSERT INTO `modx_user_roles` (`id`, `name`, `description`, `frames`, `home`, `view_document`, `new_document`, `save_document`, `publish_document`, `delete_document`, `empty_trash`, `action_ok`, `logout`, `help`, `messages`, `new_user`, `edit_user`, `logs`, `edit_parser`, `save_parser`, `edit_template`, `settings`, `credits`, `new_template`, `save_template`, `delete_template`, `edit_snippet`, `new_snippet`, `save_snippet`, `delete_snippet`, `edit_chunk`, `new_chunk`, `save_chunk`, `delete_chunk`, `empty_cache`, `edit_document`, `change_password`, `error_dialog`, `about`, `file_manager`, `save_user`, `delete_user`, `save_password`, `edit_role`, `save_role`, `delete_role`, `new_role`, `access_permissions`, `bk_manager`, `new_plugin`, `edit_plugin`, `save_plugin`, `delete_plugin`, `new_module`, `edit_module`, `save_module`, `delete_module`, `exec_module`, `view_eventlog`, `delete_eventlog`, `manage_metatags`, `edit_doc_metatags`, `new_web_user`, `edit_web_user`, `save_web_user`, `delete_web_user`, `web_access_permissions`, `view_unpublished`, `import_static`, `export_static`, `remove_locks`) VALUES
(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1),
(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_settings`
--

CREATE TABLE IF NOT EXISTS `modx_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';

-- --------------------------------------------------------

--
-- Структура таблицы `modx_webgroup_access`
--

CREATE TABLE IF NOT EXISTS `modx_webgroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_webgroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_webgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_groups`
--

CREATE TABLE IF NOT EXISTS `modx_web_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_users`
--

CREATE TABLE IF NOT EXISTS `modx_web_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_user_attributes`
--

CREATE TABLE IF NOT EXISTS `modx_web_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information for web users.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_user_settings`
--

CREATE TABLE IF NOT EXISTS `modx_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`webuser`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `webuserid` (`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
