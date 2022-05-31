-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Дек 04 2021 г., 00:15
-- Версия сервера: 8.0.20
-- Версия PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `proprietar`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `admin_user`
--

INSERT INTO `admin_user` (`id`, `name`, `login`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@email.com', '$2y$10$Gufv89xvk0CePY5Lxt6IyuNpFKOsqEZB9SjMKK6Q58rYpjPRALJ3u', 'Ww215sQrlzOnqmEPqNBp3rVK5Z42RRB4dlyi6Jo4tgLD7af4IGrInUgSp9BN', '2019-02-07 16:33:45', '2021-11-27 20:27:28'),
(3, 'root', 'root', 'root@email.com', '$2y$10$OKz/gI3JbvpOixPz65Ym1.WI5cKqHD1Ikq1JnWV8hdyiGbw2AQTM.', '', '2019-06-06 15:54:53', '2021-11-27 20:21:49');

-- --------------------------------------------------------

--
-- Структура таблицы `agents`
--

CREATE TABLE `agents` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `agents`
--

INSERT INTO `agents` (`id`, `name`, `email`, `phone`, `job`, `image`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Ivan Ivanov', 'ivan@email.com', '69010101', 'Agent', '61a7624618c9a-portrait-young-business-man-smiling-260nw-397664230.jpeg', NULL, '2021-11-28 11:48:51', '2021-12-01 09:53:42'),
(2, 'Alexandru Alexandrov', 'alex@gmail.com', '69220939', 'CEO', '61a7622ae0664-portrait-defaut.jpeg', NULL, '2021-11-28 11:49:49', '2021-12-01 09:53:14'),
(3, 'John Smith', 'test@email.com', '069022424', 'Agent', '61a7636535500-portrait-smiling-mature-businessman-office-260nw-1913209594.jpeg', NULL, '2021-11-30 12:13:56', '2021-12-01 09:58:29');

-- --------------------------------------------------------

--
-- Структура таблицы `blogs`
--

CREATE TABLE `blogs` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT '2',
  `alias` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int UNSIGNED DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_time` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `alias`, `position`, `active`, `image`, `date_time`, `created_at`, `updated_at`) VALUES
(1, 2, 'decis-sa-vinzi', 1, 1, '61a60893c3f3e-50745464.jpeg', '2021-12-03', '2021-11-30 09:18:43', '2021-11-30 09:18:43'),
(2, 2, 'decis-sa-cumperi', 1, 1, '61a60933a02e9-familyinfrontofhouse.jpeg', '2021-12-10', '2021-11-30 09:21:23', '2021-11-30 09:21:23'),
(3, 2, 'cauta-varianta-potrivita', 1, 1, '61a61838a577d-accountants-1.jpeg', '2021-11-01', '2021-11-30 10:24:36', '2021-11-30 10:25:28');

-- --------------------------------------------------------

--
-- Структура таблицы `blogs_translation`
--

CREATE TABLE `blogs_translation` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT NULL,
  `blog_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seo_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seo_title` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seo_keywords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `blogs_translation`
--

INSERT INTO `blogs_translation` (`id`, `lang_id`, `blog_id`, `name`, `slug`, `description`, `body`, `seo_text`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Decis sa vinzi?', 'decis-sa-vinzi', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, NULL, NULL, NULL, '2021-11-30 09:18:43', '2021-11-30 09:18:43'),
(2, 2, 1, 'Решили продать?', 'resili-prodat', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, NULL, NULL, NULL, '2021-11-30 09:18:43', '2021-11-30 09:18:43'),
(3, 3, 1, 'Decided to sell?', 'decided-to-sell', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, NULL, NULL, NULL, '2021-11-30 09:18:43', '2021-11-30 09:18:43'),
(4, 1, 2, 'Decis sa cumperi?', 'decis-sa-cumperi', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br />\r\n&nbsp;</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, NULL, NULL, NULL, '2021-11-30 09:21:23', '2021-11-30 09:21:23'),
(5, 2, 2, 'Решили купить?', 'resili-kupit', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br />\r\n&nbsp;</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, NULL, NULL, NULL, '2021-11-30 09:21:23', '2021-11-30 09:21:23'),
(6, 3, 2, 'Decided to buy?', 'decided-to-buy', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br />\r\n&nbsp;</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>lorem Ipsum</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, NULL, NULL, NULL, '2021-11-30 09:21:23', '2021-11-30 09:21:23'),
(7, 1, 3, 'Caută varianta potrivită', 'cauta-varianta-potrivita', 'Care este diferența dintre un termen de căutare și un cuvânt cheie? Un termen de căutare este un cuvânt sau un set de cuvinte pe care un utilizator îi introduce atunci când caută informații pe Google sau pe unul dintre site-urile noastre din rețeaua de căutare. Un cuvânt cheie este un termen sau un set de termeni pe care advertiserii Google Ads îl pot adăuga într-un anumit grup de anunțuri, astfel încât anunțurile dvs. să vizeze publicul potrivit.', '<h2>Avantaje</h2>\r\n\r\n<p>Raportul privind termenii de căutare vă oferă informații despre căutările care vă declanșează anunțurile și despre performanța acestora. &Icirc;n plus, el vă ajută să descoperiți idei noi de materiale publicitare și pentru pagina de destinație, &icirc;n funcție de ceea ce caută clienții.</p>\r\n\r\n<p>Care este diferența dintre un termen de căutare și un&nbsp;cuv&acirc;nt cheie? Un termen de căutare este un cuv&acirc;nt sau un set de cuvinte pe care un utilizator &icirc;i introduce atunci c&acirc;nd caută informații pe Google sau pe unul dintre site-urile noastre din rețeaua de căutare. Un cuv&acirc;nt cheie este un termen sau un set de termeni pe care advertiserii Google Ads &icirc;l pot adăuga &icirc;ntr-un anumit grup de anunțuri, astfel &icirc;nc&acirc;t anunțurile dvs. să vizeze publicul potrivit.</p>\r\n\r\n<h3>Exemplu</h3>\r\n\r\n<p>David dorește să cumpere online un buchet de Ziua &Icirc;ndrăgostiților. El introduce &bdquo;trandafiri roșii&rdquo; &icirc;n caseta de căutare de pe Google. &bdquo;Trandafiri roșii&rdquo; este termenul de căutare. Să presupunem că sunteți proprietarul unei florării online și gestionați un cont Google Ads. &Icirc;ntruc&acirc;t ați inclus termenul &bdquo;trandafiri&rdquo; drept cuv&acirc;nt cheie &icirc;n campania Google Ads, anunțul poate fi eligibil pentru afișare &icirc;n pagina cu rezultatele căutării lui David.</p>\r\n\r\n<h2><a id=\"stuff\" name=\"stuff\"></a>Cum funcționează</h2>\r\n\r\n<p>Raportul privind termenii de căutare este o listă de termeni de căutare folosiți de un număr semnificativ de utilizatori și care au determinat afișarea anunțului. &Icirc;n funcție de opțiunile de potrivire a cuvintelor cheie, termenii de căutare afișați pot fi diferiți de lista de cuvinte cheie.</p>\r\n\r\n<p>Coloana &bdquo;Tip de potrivire&rdquo; arată c&acirc;t de str&acirc;nsă este legătura dintre termenii de căutare care au determinat afișarea anunțurilor pe Google și cuvintele cheie din cont. Aflarea tipurilor de potrivire care funcționează cel mai bine cu anumite cuvinte cheie și căutări vă ajută să rafinați tipurile de potrivire pentru toate cuvintele cheie, astfel &icirc;nc&acirc;t doar căutările corecte să determine afișarea anunțului. Coloana &bdquo;Cuv&acirc;nt cheie&rdquo; vă arată care dintre cuvintele cheie au corespuns termenului de căutare al unui utilizator și au determinat afișarea anunțului. Această coloană nu se afișează &icirc;n mod prestabilit. Ca să aflați cum să modificați coloane, citiți articolul&nbsp;Consultați raportul privind termenii de căutare.</p>\r\n\r\n<h2>Cum se stabilește tipul de potrivire a termenului de căutare</h2>\r\n\r\n<p>Pentru a vă ajuta să &icirc;nțelegeți cum se stabilește tipul de potrivire a termenului de căutare, vom utiliza următorul exemplu:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><strong>Grup de anunțuri</strong></th>\r\n			<th><strong>Cuv&acirc;nt cheie</strong></th>\r\n		</tr>\r\n		<tr>\r\n			<td>Grupul de anunțuri A</td>\r\n			<td>Cuv&acirc;ntul cheie cu potrivire exactă&nbsp;<strong>[flori violet]</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Grupul de anunțuri B</td>\r\n			<td>Cuv&acirc;ntul cheie cu potrivire a expresiei&nbsp;<strong>&bdquo;flori violet&rdquo;</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Grupul de anunțuri C</td>\r\n			<td>Cuv&acirc;ntul cheie cu potrivire amplă&nbsp;<strong>flori violet</strong></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Referindu-ne la aceste grupuri de anunțuri și cuvinte cheie, vom folosi următorul tabel pentru a vă arăta ce legătură există &icirc;ntre diferiții termeni de căutare care au afișat anunțurile pe Google și cuvintele cheie. Rețineți că, atunci c&acirc;nd tipul de potrivire a termenului de căutare este o variantă apropiată, acest lucru va fi indicat &icirc;n coloana &bdquo;Tip de potrivire&rdquo;.&nbsp;Variantele apropiate&nbsp;pot include greșelile de scriere, formele de singular și plural, acronimele, rădăcinile lingvistice (cum ar fi cumpăra și cumpărare), abrevierile, literele cu accent și variante ale termenilor cuv&acirc;ntului cheie care au același &icirc;nțeles.</p>\r\n\r\n<p>Rețineți că este posibil ca un tip de potrivire a termenului de căutare listat &icirc;n raport să nu fie identic cu tipul de potrivire selectat pentru cuv&acirc;ntul cheie care a declanșat afișarea anunțurilor. Motivul este următorul: cuvintele cheie cu tipuri de potrivire mai ample pot corespunde termenilor de căutare &icirc;ntr-o măsură mai restrictivă. De exemplu, dacă o persoană a căutat&nbsp;<em>flori violet</em>, iar cuv&acirc;ntul cheie cu potrivire amplă&nbsp;<strong>flori violet</strong>&nbsp;a determinat afișarea anunțului, tipul de potrivire a termenilor de căutare va fi exactă, chiar dacă, &icirc;n grupul de anunțuri,&nbsp;<strong>flori violet</strong>&nbsp;are potrivire amplă.<br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<h2>Gestionarea cuvintelor cheie pe baza datelor privind termenii de căutare</h2>\r\n\r\n<p>Folosiți datele privind termenii de căutare pentru a aduce modificări cuvintelor cheie, astfel &icirc;nc&acirc;t să influențați pozitiv performanțele. Iată c&acirc;teva idei:</p>\r\n\r\n<ul>\r\n	<li>dacă un termen de căutare nu este suficient de relevant pentru produsele sau serviciile pe care le oferiți, adăugați-l drept&nbsp;cuv&acirc;nt cheie negativ. Prin adăugarea termenilor de căutare irelevanți drept cuvinte cheie negative, puteți &icirc;mpiedica afișarea anunțului pentru persoanele care caută ceva ce nu vindeți. De exemplu, dacă vindeți ochelari de vedere și constatați că termenul de căutare &bdquo;ochelari de soare&rdquo; determină afișarea anunțurilor dvs., este recomandat să adăugați &bdquo;soare&rdquo; drept cuv&acirc;nt cheie negativ;</li>\r\n	<li>modificați&nbsp;tipul de potrivire&nbsp;(de exemplu, amplă, expresie, exactă sau negativă) pentru cuvintele cheie existente. Coloana &bdquo;Tipul de potrivire&rdquo; vă poate ajuta să &icirc;nțelegeți modul &icirc;n care tipul de potrivire a cuvintelor cheie influențează performanța anunțurilor;</li>\r\n	<li>vă recomandăm să folosiți&nbsp;Licitarea inteligentă, care include o gamă largă de semnale din context pentru a seta sume licitate pentru fiecare licitație &icirc;n parte și a maximiza performanța.</li>\r\n</ul>\r\n\r\n<h3>Linkuri conexe</h3>\r\n\r\n<ul>\r\n	<li>Despre opțiunile de potrivire a cuvintelor cheie</li>\r\n	<li>Măsurați performanța cuvintelor cheie &icirc;n rețeaua de căutare</li>\r\n	<li>Creați, salvați și programați rapoarte din tabelele cu statistici</li>\r\n	<li>Idei de cuvinte cheie negative cu ajutorul raportului privind termenii de căutare</li>\r\n</ul>', NULL, NULL, NULL, NULL, '2021-11-30 10:24:36', '2021-11-30 11:44:18'),
(8, 2, 3, 'Найдите подходящий вариант', 'naidite-podxodyashhii-variant', 'В чём разница между поисковым запросом и ключевым словом? Поисковый запрос – это слово или комбинация слов, которые пользователь вводит в Google или на одном из сайтов поисковой сети. Ключевое слово – это слово или комбинация слов, которые рекламодатели могут добавить в группу объявлений, чтобы показывать рекламу определенной аудитории.', '<h1>Отчет о поисковых запросах</h1>\r\n\r\n<p>Отчет о поисковых запросах позволяет проанализировать эффективность объявлений, показанных по запросам в&nbsp;<a data-answer=\"90956\" data-stats-ve=\"40\" href=\"https://support.google.com/google-ads/answer/90956\">поисковой сети</a>. В статье рассказывается об этом отчете и о том, как им пользоваться.</p>\r\n\r\n<p>О том, как интерпретировать его данные, читайте в статье&nbsp;<a href=\"https://support.google.com/google-ads/answer/7531771\">Просмотр отчета &quot;Поисковые запросы&quot;.</a></p>\r\n\r\n<h2>Преимущества</h2>\r\n\r\n<p>Отчет о поисковых запросах содержит информацию о том, по каким запросам показываются ваши объявления и к каким результатам это приводит. Эти отчеты помогут вам найти новые идеи для креативов и целевых страниц с учетом того, чем интересуются пользователи.</p>\r\n\r\n<p>В чём разница между поисковым запросом и&nbsp;<a data-answer=\"6323\" data-stats-ve=\"40\" href=\"https://support.google.com/google-ads/answer/6323\">ключевым словом</a>? Поисковый запрос&nbsp;&ndash; это слово или комбинация слов, которые пользователь вводит в Google или на одном из сайтов поисковой сети. Ключевое слово&nbsp;&ndash; это слово или комбинация слов, которые рекламодатели могут добавить в группу объявлений, чтобы показывать рекламу определенной аудитории.</p>\r\n\r\n<h3>Пример</h3>\r\n\r\n<p>Денис ищет букет ко дню святого Валентина. Он вводит в окне поиска Google слова &quot;красные розы&quot;. Это и есть поисковый запрос. Допустим, вы владелец цветочного интернет-магазина и пользуетесь Google Рекламой. Так как в вашей кампании Google Рекламы есть ключевое слово &quot;розы&quot;, объявление может быть показано по запросу Дениса.</p>\r\n\r\n<h2><a id=\"stuff\" name=\"stuff\"></a>Как это работает</h2>\r\n\r\n<p>В отчете можно посмотреть, какие поисковые запросы, заданные большим количеством пользователей, приводили к показам ваших объявлений. Поисковые запросы могут не полностью совпадать с заданными ключевыми словами (это зависит от применяемых типов соответствия).</p>\r\n\r\n<p>Значения в столбце &quot;Тип соответствия&quot; указывают, насколько точно поисковые запросы, по которым были показаны ваши объявления в Google, соотносятся с ключевыми словами в вашем аккаунте. Учитывая эту информацию, вы сможете изменить типы соответствия для ключевых слов так, чтобы объявления показывались по запросам, которые лучше всего вам подходят. В столбце &quot;Ключевое слово&quot; можно увидеть, какие именно ключевые слова совпали с поисковым запросом и привели к показу объявления. По умолчанию этот столбец скрыт. О том, как работать со столбцами, рассказывается в статье&nbsp;<a href=\"https://support.google.com/google-ads/answer/7531771\">Просмотр отчета &quot;Поисковые запросы&quot;</a>.</p>\r\n\r\n<h2>Как определяется тип соответствия поискового запроса</h2>\r\n\r\n<p>Чтобы вам было понятнее, как определяется тип соответствия поискового запроса, рассмотрим пример ниже.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><strong>Группа объявлений</strong></th>\r\n			<th><strong>Ключевое слово</strong></th>\r\n		</tr>\r\n		<tr>\r\n			<td>Группа объявлений А</td>\r\n			<td>Ключевое слово с точным соответствием&nbsp;<strong>[фиолетовые цветы]</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Группа объявлений Б</td>\r\n			<td>Ключевое слово с фразовым соответствием&nbsp;<strong>&quot;фиолетовые цветы&quot;</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Группа объявлений В</td>\r\n			<td>Ключевое слово с широким соответствием&nbsp;<strong>фиолетовые цветы</strong></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Таблица ниже иллюстрирует, как различные поисковые запросы, по которым были показаны объявления в Google, соотносятся с вашими ключевыми словами. Обратите внимание, что если поисковый запрос пользователя является близким вариантом вашего ключевого слова, то это будет отражено в столбце &quot;Тип соответствия&quot;. К&nbsp;<a href=\"https://support.google.com/google-ads/answer/9342105\">близким вариантам</a>&nbsp;относятся ошибочные формы написания, формы единственного и множественного числа, сокращения, однокоренные слова (например, &quot;ванна&quot; и &quot;ванная&quot;), аббревиатуры, написание с надстрочными знаками, а также другие вариации ключевого слова, при которых смысл остается тем же.</p>\r\n\r\n<p>Важно также помнить, что тип соответствия поискового запроса, указанный в отчете, может отличаться от выбранного вами для ключевого слова. Дело в том, что ключевые слова с широким соответствием могут точно совпадать с поисковыми запросами. Например, если пользователь набрал запрос&nbsp;<em>фиолетовые цветы</em>&nbsp;и увидел ваше объявление, показанное по ключевому слову с широким соответствием&nbsp;<strong>фиолетовые цветы</strong>, то тип соответствия в данном случае будет точным, хотя в группе объявлений для ключевого слова&nbsp;<strong>фиолетовые цветы</strong>&nbsp;указан широкий тип соответствия.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><strong>Ключевое слово</strong></th>\r\n			<th><strong>Поисковый запрос клиента</strong></th>\r\n			<th><strong>Тип соответствия поискового запроса</strong></th>\r\n			<th><strong>Почему именно этот тип?</strong></th>\r\n		</tr>\r\n		<tr>\r\n			<td>[фиолетовые цветы]</td>\r\n			<td>фиолетовые цветы</td>\r\n			<td>Точное соответствие</td>\r\n			<td>Поисковый запрос совпадает с ключевым словом с точным соответствием из&nbsp;<strong>группы объявлений А</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>[фиолетовые цветы]</td>\r\n			<td>фиолетовые цвты</td>\r\n			<td>Точное соответствие (близкий вариант)</td>\r\n			<td>Поисковый запрос представляет собой близкий вариант (с таким же значением и намерением пользователя) ключевого слова с точным соответствием из&nbsp;<strong>группы объявлений А</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&quot;фиолетовые цветы&quot;</td>\r\n			<td>фиолетовые цветы</td>\r\n			<td>Точное соответствие</td>\r\n			<td>Поисковый запрос совпадает с ключевым словом с точным соответствием из&nbsp;<strong>группы объявлений Б</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&quot;фиолетовые цветы&quot;</td>\r\n			<td>бесплатно фиолетовые цветы</td>\r\n			<td>Фразовое соответствие</td>\r\n			<td>Поисковый запрос содержит ключевое слово с фразовым соответствием из&nbsp;<strong>группы объявлений&nbsp;Б</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&quot;фиолетовые цветы&quot;</td>\r\n			<td>бесплатно фиолетовые цвты</td>\r\n			<td>Фразовое соответствие (близкий вариант)</td>\r\n			<td>Поисковый запрос представляет собой близкий вариант (с таким же значением и намерением пользователя) ключевого слова с фразовым соответствием из&nbsp;<strong>группы объявлений Б</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>фиолетовые цветы</td>\r\n			<td>фиолетовые цветы</td>\r\n			<td>Точное соответствие</td>\r\n			<td>Поисковый запрос совпадает с ключевым словом с точным соответствием из&nbsp;<strong>группы объявлений В</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>фиолетовые цветы</td>\r\n			<td>бесплатно фиолетовые цветы</td>\r\n			<td>Фразовое соответствие</td>\r\n			<td>Поисковый запрос содержит ключевое слово с широким соответствием из&nbsp;<strong>группы объявлений В</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>фиолетовые цветы</td>\r\n			<td>розовые цветы</td>\r\n			<td>Широкое соответствие</td>\r\n			<td>Поисковый запрос является вариантом ключевого слова с широким соответствием из&nbsp;<strong>группы объявлений В</strong>.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<strong>Примечание.</strong>&nbsp;Ключевые слова не используются при таргетинге товарных и динамических поисковых объявлений. Поисковые запросы, сопоставленные с таргетингом этих объявлений, будут показываться в отчете без ключевых слов, но с типом соответствия &quot;Точное&quot;.\r\n\r\n<h2>Редактирование списка ключевых слов на основе данных о поисковых запросах</h2>\r\n\r\n<p>Информация о поисковых запросах поможет вам уточнить свой список ключевых слов и тем самым сделать его более эффективным. Вот несколько полезных советов:</p>\r\n\r\n<ul>\r\n	<li>Если запрос не подходит для рекламы ваших товаров или услуг, его можно&nbsp;<a href=\"https://support.google.com/google-ads/answer/7102466\">задать как минус-слово</a>, чтобы ваши объявления по ним не показывались. Например, если ваш интернет-магазин оптики продает корректирующие очки, а в отчете фигурируют &quot;очки для плавания&quot;, добавьте минус-слово &quot;для плавания&quot;.</li>\r\n	<li>Измените&nbsp;<a href=\"https://support.google.com/google-ads/answer/6324\">тип соответствия</a>&nbsp;(широкое, фразовое, точное или минус-слово) для существующих ключевых слов. Чтобы понять, как тип соответствия влияет на эффективность ваших объявлений, руководствуйтесь информацией в столбце &quot;Тип соответствия&quot;.</li>\r\n	<li>Рекомендуется использовать&nbsp;<a href=\"https://support.google.com/google-ads/answer/7065882\">интеллектуальное назначение ставок</a>, так как благодаря разнообразию контекстных сигналов ставки назначаются отдельно для каждого аукциона, что помогает добиться максимальной эффективности.</li>\r\n</ul>\r\n\r\n<h3>Статьи по теме</h3>\r\n\r\n<ul>\r\n	<li>Типы соответствия ключевых слов</li>\r\n	<li>Как оценивать эффективность ключевых слов в поисковой сети</li>\r\n	<li>Как создавать, сохранять и планировать отчеты из таблиц статистики</li>\r\n	<li>Минус-слова из отчета о поисковых запросах</li>\r\n</ul>', NULL, NULL, NULL, NULL, '2021-11-30 10:24:36', '2021-11-30 11:44:18');
INSERT INTO `blogs_translation` (`id`, `lang_id`, `blog_id`, `name`, `slug`, `description`, `body`, `seo_text`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(9, 3, 3, 'Find the best option', 'find-the-best-option', 'Consumer interest insights analyze the search terms where your ads have appeared in the past 56 days, grouping them into themes and subthemes to provide you with key performance metrics for each. We recommend using this feature where available to easily understand what your customers are interested in, and to capture more untapped demand.', '<h1>About the search terms report</h1>\r\n\r\n<p>Use the search terms report to know how your ads performed when triggered by actual searches within the&nbsp;<a data-answer=\"90956\" data-stats-ve=\"40\" href=\"https://support.google.com/google-ads/answer/90956\">Search Network</a>. This article describes the search terms report and how to use it.</p>\r\n\r\n<p>For instructions on how to view and understand the search terms report, read&nbsp;<a href=\"https://support.google.com/google-ads/answer/7531771\">View the search terms report</a>.</p>\r\n\r\n<h3>Differences between search terms and consumer interest insights</h3>\r\n\r\n<p>Consumer interest insights analyze the search terms where your ads have appeared in the past 56 days, grouping them into themes and subthemes to provide you with key performance metrics for each. We recommend using this feature where available to easily understand what your customers are interested in, and to capture more untapped demand.</p>\r\n\r\n<p>That said, you may notice some differences between the data shown on the consumer interest insights compared to the search terms report.</p>\r\n\r\n<ul>\r\n	<li><strong>Conversions</strong>: The way the conversions are processed differs between the consumer interest insights and the search terms report. You may notice slight differences between the 2 surfaces due to conversion lag.</li>\r\n	<li><strong>Search subthemes and queries</strong>: Some search terms that don&rsquo;t have enough query activity are omitted from the search terms report in order to keep with our standards on data privacy. Consumer interest insights account for these low volume queries by grouping them into their relevant subthemes where applicable, or aggregating them as &ldquo;other queries,&rdquo; without exposing the queries themselves.</li>\r\n</ul>\r\n\r\n<h2>Benefits</h2>\r\n\r\n<p>The search terms report provides insight into the searches that trigger your ads and how those searches are performing. This report also helps you discover new ideas for creative and landing page content to align with what your customers are looking for.</p>\r\n\r\n<p>What&#39;s the difference between a search term and a&nbsp;<a data-answer=\"6323\" data-stats-ve=\"40\" href=\"https://support.google.com/google-ads/answer/6323\">keyword</a>? A search term is a word or set of words a person enters when searching on Google or one of our Search Network sites. A keyword is a word or set of words that Google Ads advertisers can add to a given ad group so that your ads are targeting the right audience.</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<p>David is looking to buy a Valentine&rsquo;s Day bouquet online. He types &ldquo;red roses&rdquo; into the search box on Google. &ldquo;Red roses&rdquo; is the search term. Let&#39;s say you&#39;re the owner of an online flower business and manage a Google Ads account. Since you&#39;ve included the word &ldquo;roses&rdquo; as a keyword in your Google Ads campaign, your ad may be eligible to show on David&rsquo;s search results page.</p>\r\n\r\n<h2><a id=\"stuff\" name=\"stuff\"></a>How it works</h2>\r\n\r\n<p>The search terms report is a list of search terms that a significant number of people have used, and that resulted in your ad being shown. Depending on your keyword matching options, the search terms listed might be different from your keyword list.</p>\r\n\r\n<p>The &quot;Match type&quot; column tells you how closely the search terms that triggered your ads on Google are related to the actual keywords in your account. By seeing which match types are working well for which keywords and searches, you can refine match types for all your keywords so that only the right searches cause your ad to show. The &quot;Keyword&quot; column tells you which of your keywords matched someone&rsquo;s search term and triggered your ad. This column doesn&#39;t show by default. To learn how to modify columns, read&nbsp;<a href=\"https://support.google.com/google-ads/answer/7531771\">View the search terms report</a>.</p>\r\n\r\n<h2>How search term match type is determined</h2>\r\n\r\n<p>To help you understand how the search term match type is determined, we&#39;ll use the following example:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><strong>Ad group</strong></th>\r\n			<th><strong>Keyword</strong></th>\r\n		</tr>\r\n		<tr>\r\n			<td>Ad group A</td>\r\n			<td>Exact match keyword&nbsp;<strong>[purple flowers]</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ad group B</td>\r\n			<td>Phrase match keyword&nbsp;<strong>&quot;purple flowers&quot;</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ad group C</td>\r\n			<td>Broad match keyword&nbsp;<strong>purple flowers</strong></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Keeping these ad groups and keywords in mind, we&#39;ll use the following table to show you how different search terms that triggered your ads on Google are related to your keywords. Note that when the search term match type is a close variation it will be indicated in the &ldquo;Match type&rdquo; column.&nbsp;<a href=\"https://support.google.com/google-ads/answer/9342105\">Close variants</a>&nbsp;can include misspellings, singular and plural forms, acronyms, stem words (such as floor and flooring), abbreviations, accents, and variants of your keyword terms that have the same meaning.</p>\r\n\r\n<p>Keep in mind that a search term match type listed in your report might not be the same as the match type you&rsquo;ve selected for the keyword that triggered the ads. This is because keywords with broader match types can still match search terms in narrower ways. For example, if someone searched for&nbsp;<em>purple flowers</em>, and your broad match keyword&nbsp;<strong>purple flowers</strong>&nbsp;triggered your ad, the search terms match type would be an exact match, even though in your ad group,&nbsp;<strong>purple flowers</strong>&nbsp;is a broad match keyword.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><strong>Your keyword</strong></th>\r\n			<th><strong>Customer&#39;s search term</strong></th>\r\n			<th><strong>Search term match type</strong></th>\r\n			<th><strong>Reason for search term match type</strong></th>\r\n		</tr>\r\n		<tr>\r\n			<td>[purple flowers]</td>\r\n			<td>purple flowers</td>\r\n			<td>Exact match</td>\r\n			<td>The search term exactly matches your exact match keyword from&nbsp;<strong>ad group A</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>[purple flowers]</td>\r\n			<td>purple flowrs</td>\r\n			<td>Exact match (close variant)</td>\r\n			<td>The search term is a close variant (same meaning and intent) of your exact match keyword from&nbsp;<strong>ad group A</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&quot;purple flowers&quot;</td>\r\n			<td>purple flowers</td>\r\n			<td>Exact match</td>\r\n			<td>The search term exactly matches your phrase match keyword from&nbsp;<strong>ad group B</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&quot;purple flowers&quot;</td>\r\n			<td>free purple flowers</td>\r\n			<td>Phrase match</td>\r\n			<td>The search term contains your phrase match keyword from&nbsp;<strong>ad group B</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&quot;purple flowers&quot;</td>\r\n			<td>free purple flowrs</td>\r\n			<td>Phrase match (close variant)</td>\r\n			<td>The search term is a close variant (same meaning and intent) of your phrase match keyword from&nbsp;<strong>ad group B</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>purple flowers</td>\r\n			<td>purple flowers</td>\r\n			<td>Exact match</td>\r\n			<td>The search term exactly matches your broad match keyword from&nbsp;<strong>ad group C</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>purple flowers</td>\r\n			<td>free purple flowers</td>\r\n			<td>Phrase match</td>\r\n			<td>The search term contains your broad match keyword from&nbsp;<strong>ad group C</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>purple flowers</td>\r\n			<td>pink flowers</td>\r\n			<td>Broad match</td>\r\n			<td>The search term is a variation of your broad match keyword from&nbsp;<strong>ad group C</strong>.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<strong>Note:</strong>&nbsp;Dynamic Search Ads and Shopping targeting don&#39;t use keywords. In the search terms report, any terms matched to Dynamic Search Ads or Shopping targets won&#39;t return a keyword in the keywords field and they will return &quot;Exact&quot; in the match type field.\r\n\r\n<h2>Manage your keywords based on search terms data</h2>\r\n\r\n<p>Use your search terms data to make changes to your keywords that can have a positive impact on your performance. Here are some ideas:</p>\r\n\r\n<ul>\r\n	<li>If a search term isn&#39;t relevant enough to the products or services you offer,&nbsp;<a href=\"https://support.google.com/google-ads/answer/7102466\">add it as a negative keyword</a>. By adding irrelevant search terms as negative keywords, you can prevent your ad from showing to people who are looking for something you don&rsquo;t sell. For example, if you sell eyeglasses, and you noticed that the search term &ldquo;wine glasses&rdquo; is triggering your ads, you might want to add &ldquo;wine&rdquo; as a negative keyword.</li>\r\n	<li>Edit your&nbsp;<a href=\"https://support.google.com/google-ads/answer/6324\">match type</a>&nbsp;(namely, broad, phrase, exact, or negative) for existing keywords. The &quot;Match type&quot; column can help you understand how keyword match type is affecting your ad performance.</li>\r\n	<li>We recommend using&nbsp;<a href=\"https://support.google.com/google-ads/answer/7065882\">Smart Bidding</a>, which incorporates a wide range of contextual signals to set bids for each individual auction and help maximize your performance.</li>\r\n</ul>\r\n\r\n<h3>Related links</h3>\r\n\r\n<ul>\r\n	<li><a href=\"https://support.google.com/google-ads/answer/7478529\">About keyword matching options</a></li>\r\n	<li><a href=\"https://support.google.com/google-ads/answer/2453974\">Measure Search Network keyword performance</a></li>\r\n	<li><a href=\"https://support.google.com/google-ads/answer/2404176\">Create, save, and schedule reports from your statistics tables</a></li>\r\n	<li><a href=\"https://support.google.com/google-ads/answer/7102466\">Get negative keyword ideas using the search terms report</a></li>\r\n</ul>', NULL, NULL, NULL, NULL, '2021-11-30 10:24:36', '2021-11-30 11:44:18');

-- --------------------------------------------------------

--
-- Структура таблицы `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `alias` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` tinyint DEFAULT NULL,
  `on_home` tinyint DEFAULT NULL,
  `position` tinyint DEFAULT NULL,
  `succesion` tinyint DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `icon` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `parent_id`, `alias`, `level`, `on_home`, `position`, `succesion`, `active`, `icon`, `created_at`, `updated_at`) VALUES
(2, 0, 'blog', 1, NULL, 1, 1, 1, NULL, '2021-11-27 22:30:32', '2021-11-27 22:30:32');

-- --------------------------------------------------------

--
-- Структура таблицы `blog_categories_translation`
--

CREATE TABLE `blog_categories_translation` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT NULL,
  `blog_category_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `banner_desktop` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `banner_mobile` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seo_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seo_title` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seo_keywords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `blog_categories_translation`
--

INSERT INTO `blog_categories_translation` (`id`, `lang_id`, `blog_category_id`, `name`, `description`, `banner_desktop`, `banner_mobile`, `seo_text`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Vanzator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-27 22:23:32', '2021-11-27 22:23:32'),
(2, 2, 1, 'Vanzator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-27 22:23:32', '2021-11-27 22:23:32'),
(3, 3, 1, 'Vanzator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-27 22:23:32', '2021-11-27 22:23:32'),
(4, 1, 2, 'Blog', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-27 22:30:32', '2021-11-27 22:30:32'),
(5, 2, 2, 'Blog', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-27 22:30:32', '2021-11-27 22:30:32'),
(6, 3, 2, 'Blog', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-27 22:30:32', '2021-11-27 22:30:32');

-- --------------------------------------------------------

--
-- Структура таблицы `feed_back`
--

CREATE TABLE `feed_back` (
  `id` int UNSIGNED NOT NULL,
  `form` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_1` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `additional_2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `additional_3` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_order` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `feed_back`
--

INSERT INTO `feed_back` (`id`, `form`, `first_name`, `email`, `phone`, `company`, `image`, `subject`, `message`, `additional_1`, `additional_2`, `additional_3`, `status`, `pre_order`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Tudor', 'iovitatudor@gmail.com', '069017004', NULL, NULL, 'order call', NULL, 'http://127.0.0.1:8000/ro/catalog/apartamente/prigoreni-n74726785', NULL, 'Telegram', 'cloose', NULL, '2021-12-03 16:28:38', '2021-12-03 16:29:32'),
(2, NULL, 'Tudor', 'iovitatudor@gmail.com', '069017004', NULL, NULL, 'order call', NULL, 'http://127.0.0.1:8000/ro/catalog/apartamente/prigoreni-n74726785', NULL, 'Whatsapp', 'procesed', NULL, '2021-12-03 16:31:08', '2021-12-03 16:31:14'),
(3, NULL, 'Tudor', 'iovitatudor@gmail.com', '069017004', NULL, NULL, 'order call', NULL, 'http://127.0.0.1:8000/ro/catalog/apartamente/prigoreni-n74726785', 'test@email.com', 'Telegram', 'procesed', NULL, '2021-12-03 16:32:09', '2021-12-03 16:32:18'),
(4, NULL, 'Tudor', 'iovitatudor@gmail.com', '069017004', NULL, NULL, 'order call', NULL, 'http://127.0.0.1:8000/ru', NULL, NULL, 'new', NULL, '2021-12-03 22:09:37', '2021-12-03 22:09:37'),
(5, NULL, 'Tudor', 'iovitatudor@gmail.com', '069017004', NULL, NULL, 'order call', NULL, 'http://127.0.0.1:8000/ru', NULL, 'Whatsapp', 'new', NULL, '2021-12-03 22:10:30', '2021-12-03 22:10:30');

-- --------------------------------------------------------

--
-- Структура таблицы `langs`
--

CREATE TABLE `langs` (
  `id` int UNSIGNED NOT NULL,
  `lang` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `default` tinyint DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `langs`
--

INSERT INTO `langs` (`id`, `lang`, `default`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'ro', 1, 'Romana', 1, '2019-02-07 16:33:44', '2021-11-27 19:55:50'),
(2, 'ru', 0, 'Русский', 1, '2019-09-16 01:02:30', '2021-11-27 19:55:50'),
(3, 'en', 0, 'English', 1, '2019-11-08 12:05:32', '2020-02-03 14:29:13');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2038, '2019_05_17_114611_create_subproduct_parameters_table', 9),
(2005, '2019_01_31_151753_create_wishlist', 1),
(2006, '2019_01_31_151809_create_wishlist_sets', 1),
(2007, '2019_01_31_154034_create_orders', 1),
(2008, '2019_01_31_154053_create_order_products', 1),
(2009, '2019_01_31_154112_create_order_sets', 1),
(2010, '2019_01_31_154145_create_returns', 1),
(2011, '2019_01_31_154205_create_return_products', 1),
(2012, '2019_01_31_154221_create_return_sets', 1),
(2013, '2019_01_31_160535_create_location_countries', 1),
(2014, '2019_02_06_150338_create_general', 1),
(2015, '2019_02_06_150355_create_general_translation', 1),
(2016, '2019_02_06_155325_create_sets_gallery', 1),
(2017, '2019_02_06_155408_create_sets_products_images', 1),
(2018, '2019_02_06_161310_create_set_product', 1),
(2037, '2019_05_17_114547_create_subproducts_table', 9),
(1948, '2019_01_30_111023_create_admin_user', 1),
(1949, '2019_01_30_122004_create_langs', 1),
(1950, '2019_01_30_122353_create_autoalts', 1),
(1951, '2019_01_30_123225_create_product_categories', 1),
(1952, '2019_01_30_124224_create_autometas', 1),
(1953, '2019_01_30_125238_create_autometa_categories', 1),
(1954, '2019_01_30_130522_create_brands', 1),
(1955, '2019_01_30_130923_create_brands_translation', 1),
(1956, '2019_01_30_131628_create_product_categories_translation', 1),
(1957, '2019_01_30_133220_create_promotions', 1),
(1958, '2019_01_30_133314_create_promotions_translation', 1),
(1959, '2019_01_30_134016_create_collections', 1),
(1960, '2019_01_30_134037_create_collections_translation', 1),
(1961, '2019_01_30_134803_create_sets', 1),
(1962, '2019_01_30_134841_create_sets_translation', 1),
(1963, '2019_01_30_135718_create_products', 1),
(1964, '2019_01_30_143213_create_products_translation', 1),
(1965, '2019_01_30_143919_create_categories', 1),
(1966, '2019_01_30_143936_create_categories_translation', 1),
(2024, '2019_04_25_122518_create_tests_table', 3),
(1969, '2019_01_30_145334_create_front_users', 1),
(1970, '2019_01_30_145358_create_front_users_unlogged', 1),
(1971, '2019_01_30_145422_create_front_user_addresses', 1),
(1972, '2019_01_30_151522_create_carts', 1),
(1973, '2019_01_30_151541_create_cart_sets', 1),
(1974, '2019_01_30_151607_create_contacts', 1),
(1975, '2019_01_30_151714_create_contacts_translatilation', 1),
(1976, '2019_01_30_151806_create_feed_back', 1),
(1977, '2019_01_31_103046_create_galleries', 1),
(1978, '2019_01_31_103117_create_gallery_images', 1),
(1979, '2019_01_31_103139_create_gallery_images_translation', 1),
(1980, '2019_01_31_103214_create_modules', 1),
(1981, '2019_01_31_104353_create_pages', 1),
(1982, '2019_01_31_104418_create_pages_translation', 1),
(1983, '2019_01_31_104739_create_posts', 1),
(1984, '2019_01_31_104829_create_posts_translation', 1),
(1985, '2019_01_31_121027_create_promocode_types', 1),
(1986, '2019_01_31_121958_create_promocodes', 1),
(1987, '2019_01_31_122129_create_traductions', 1),
(1988, '2019_01_31_122149_create_traductions_translations', 1),
(1989, '2019_01_31_122210_create_userfields', 1),
(1990, '2019_01_31_132132_create_product_images', 1),
(1991, '2019_01_31_132155_create_product_images_translation', 1),
(1992, '2019_01_31_135432_create_similar_products', 1),
(2035, '2019_05_10_134947_create_parameters_products_values', 8),
(2034, '2019_05_10_132225_create_parameter_values_translation_table', 7),
(2030, '2019_05_10_132154_create_parameter_values_table', 4),
(2028, '2019_05_10_131355_create_parameters_translation_table', 4),
(2029, '2019_05_10_132101_create_parameter_categories_table', 4),
(2027, '2019_05_10_131210_create_parameters_table', 4),
(2020, '2019_03_15_085753_update_products_table', 2),
(2036, '2019_05_10_135047_create_parameters_products_values_translation', 8),
(2039, '2019_06_24_135837_create_translation_groups', 10),
(2040, '2019_06_24_140147_create_translations', 11),
(2041, '2019_06_24_140428_create_translation_lines', 12),
(2043, '2019_07_25_094344_create_blog_categories_table', 13),
(2044, '2019_07_25_094751_create_blog_categories_translation_table', 13),
(2045, '2019_07_25_112505_create_blogs_table', 14),
(2046, '2019_07_25_112544_create_blogs_translation_table', 14),
(2047, '2019_08_02_100842_create_countries_table', 15),
(2048, '2019_08_05_123545_create_currencies_table', 16),
(2049, '2019_08_05_123639_create_deliveries_table', 17),
(2050, '2019_08_05_123724_create_payments_table', 17),
(2051, '2019_08_05_134344_create_countries_translation_table', 18),
(2052, '2019_08_05_134431_create_currencies_translation_table', 18),
(2053, '2019_08_05_134505_create_deliveries_translation_table', 18),
(2054, '2019_08_05_134532_create_payments_translation_table', 18),
(2055, '2019_08_06_112847_create_country_deliveries_table', 19),
(2056, '2019_08_06_112923_create_country_payments_table', 19),
(2057, '2019_08_09_110858_create_product_prices_table', 20),
(2059, '2019_08_12_165606_create_set_prices_table', 21),
(2060, '2019_08_12_181022_create_subproduct_prices_table', 22),
(2061, '2019_08_16_075835_create_crm_orders_table', 23),
(2062, '2019_08_16_093452_create_crm_order_products_table', 24),
(2063, '2019_08_16_093513_create_crm_order_sets_table', 24),
(2064, '2019_08_19_080758_create_order_items_table', 25),
(2065, '2019_09_10_101550_create_product_collection_table', 26),
(2066, '2019_09_10_101625_create_product_brand_table', 26),
(2067, '2019_09_20_131148_create_prameters_groups_table', 27),
(2068, '2019_10_03_090453_create_product_materials_table', 28),
(2069, '2019_10_03_132021_create_parameter_groups_categories_table', 29),
(2070, '2016_06_01_000001_create_oauth_auth_codes_table', 30),
(2071, '2016_06_01_000002_create_oauth_access_tokens_table', 30),
(2072, '2016_06_01_000003_create_oauth_refresh_tokens_table', 30),
(2073, '2016_06_01_000004_create_oauth_clients_table', 30),
(2074, '2016_06_01_000005_create_oauth_personal_access_clients_table', 30),
(2075, '2020_03_16_121735_create_autometa_scripts', 30),
(2077, '2020_03_16_122334_create_autometa_scripts_translation', 31);

-- --------------------------------------------------------

--
-- Структура таблицы `modules`
--

CREATE TABLE `modules` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `src` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int UNSIGNED DEFAULT NULL,
  `table_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_dashboard` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `modules`
--

INSERT INTO `modules` (`id`, `parent_id`, `name`, `description`, `src`, `position`, `table_name`, `icon`, `on_dashboard`, `created_at`, `updated_at`) VALUES
(3, 0, 'Pages', 'Pages', 'pages', 7, 'pages', 'fa-file', 0, '2019-02-07 16:33:45', '2020-05-05 14:43:10'),
(5, 0, 'Categories', 'Categories', 'product-categories', 3, 'product_categories', 'fa-list-ul', 1, '2019-02-07 16:33:45', '2021-11-26 17:52:32'),
(6, 0, 'Catalog', 'Catalog', 'products', 1, 'products', 'fa-mobile', 1, '2019-02-07 16:33:45', '2021-11-26 18:45:12'),
(7, 0, 'Parameters', 'Parameters', 'parameters', 4, 'parameters', 'fa-filter', 1, '2019-02-07 16:33:45', '2021-11-28 11:22:38'),
(15, 0, 'Lead management', 'Lead management', 'feedback', 9, 'feed_back', 'fa-table', 1, '2019-02-07 16:33:45', '2021-11-28 11:23:18'),
(23, 0, 'Modules', 'Modules module', 'modules', 13, 'modules', 'fa-cogs', 0, '2019-02-07 16:33:45', '2021-11-27 17:09:33'),
(25, 0, 'Languages', 'Languages', 'settings/languages', 10, '-', 'fa-globe', 0, '2019-02-07 16:33:45', '2021-11-27 17:08:42'),
(29, 0, 'Users', 'Users', 'users', 12, 'users', 'fa-user', 0, '2019-06-06 14:45:48', '2020-05-05 14:43:10'),
(31, 0, 'Translations', 'Translations', 'translations', 9, 'pages', 'fa-comments', 0, '2019-06-20 08:34:47', '2020-05-05 14:43:10'),
(32, 0, 'Blog', 'Blog', 'blogs', 2, 'blog-categories', 'fa-edit', 0, '2019-07-26 14:36:05', '2021-11-27 22:31:56'),
(56, 0, 'Tags', 'Tags', 'tags', 6, 'tags', 'fa-tag', 0, '2021-11-27 17:06:04', '2021-11-27 17:08:06'),
(57, 0, 'Agents', 'Agents', 'agents', 5, 'agents', 'fa-users', 0, '2021-11-27 17:06:47', '2021-11-27 17:07:51'),
(58, 0, 'Testimonials', 'Testimonials', 'testimonials', 8, 'testimonials', 'fa-comment', 0, '2021-11-27 17:07:05', '2021-11-27 17:07:19');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `gallery_id` int UNSIGNED DEFAULT NULL,
  `alias` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_header` tinyint DEFAULT NULL,
  `on_drop_down` tinyint DEFAULT NULL,
  `on_footer` tinyint DEFAULT NULL,
  `position` int UNSIGNED DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `gallery_id`, `alias`, `image`, `on_header`, `on_drop_down`, `on_footer`, `position`, `active`, `created_at`, `updated_at`) VALUES
(1, NULL, 'home', NULL, 0, 0, 0, 1, 1, '2021-11-28 12:21:41', '2021-12-02 12:58:38'),
(2, NULL, 'blog', NULL, 1, 0, 1, 3, 1, '2021-11-28 12:23:09', '2021-12-02 12:58:38'),
(3, NULL, 'contacts', NULL, 1, 0, 1, 6, 1, '2021-11-28 12:25:57', '2021-12-02 12:58:38'),
(4, NULL, 'about', NULL, 1, 0, 1, 2, 1, '2021-11-28 12:26:38', '2021-12-02 12:58:38'),
(5, NULL, 'team', NULL, 0, 0, 1, 5, 1, '2021-11-29 11:57:58', '2021-12-02 12:58:38'),
(7, NULL, 'policies', NULL, 0, 0, 0, 7, 1, '2021-11-29 12:00:28', '2021-12-02 12:58:38'),
(8, NULL, 'policies', NULL, 0, 0, 0, 8, 1, '2021-11-29 12:00:59', '2021-12-02 12:58:38'),
(9, NULL, 'policies', NULL, 0, 0, 0, 9, 1, '2021-11-29 12:01:27', '2021-12-02 12:58:38'),
(10, NULL, 'testimonials', NULL, 0, 0, 1, 4, 1, '2021-12-02 12:58:28', '2021-12-02 12:58:38');

-- --------------------------------------------------------

--
-- Структура таблицы `pages_translation`
--

CREATE TABLE `pages_translation` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED DEFAULT NULL,
  `lang_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `meta_title` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `pages_translation`
--

INSERT INTO `pages_translation` (`id`, `page_id`, `lang_id`, `title`, `slug`, `description`, `body`, `meta_title`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Acasa', 'acasa', NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:21:41', '2021-11-28 12:21:41'),
(2, 1, 2, 'Главная', 'glavnaya', NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:21:41', '2021-11-28 12:21:41'),
(3, 1, 3, 'Home', 'home', NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:21:41', '2021-11-28 12:21:41'),
(4, 2, 1, 'Blog', 'blog', NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:23:09', '2021-11-29 12:04:31'),
(5, 2, 2, 'Блог', 'blog', NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:23:09', '2021-11-29 12:04:31'),
(6, 2, 3, 'Blog', 'blog', NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:23:09', '2021-11-29 12:04:31'),
(7, 3, 1, 'Contacte', 'contacte', NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:25:57', '2021-11-29 12:04:18'),
(8, 3, 2, 'Контакты', 'kontakty', NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:25:57', '2021-11-29 12:04:18'),
(9, 3, 3, 'Contacts', 'contacts', NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:25:57', '2021-11-29 12:04:18'),
(10, 4, 1, 'Despre Noi', 'despre', NULL, '<p>Manole Estate fost înființată în Chișinău ca o companie concentrată spre satisfacerea\r\n                            eficientă a clienților și deservirea lor la cea mai înaltă calitate în toate solicitările\r\n                            din imobiliare.</p>\r\n                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum\r\n                                dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n                            <ul>\r\n                                <li>Prezentarea, selectarea și promovarea ofertelor imobiliare pentru vânzări sau\r\n                                    chirii.\r\n                                </li>\r\n                                <li>Pregătirea documentelor pentru tranzacții la cadastru și fisc.</li>\r\n                                <li>Garantarea securității tranzacțiilor și confidențialitatea informației.</li>\r\n                                <li>Evaluarea costului și expertiza bunurilor imobiliare înainte de vânzare sau\r\n                                    chirie.\r\n                                </li>\r\n                                <li>Pregătirea integrată a actelor pentru notar.</li>\r\n                                <li>Suport legal al tranzacției.</li>\r\n                            </ul>\r\n                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, NULL, NULL, '2021-11-28 12:26:38', '2021-12-03 21:11:08'),
(11, 4, 2, 'О нас', 'o-nas', NULL, '<p>Manole Estate fost înființată în Chișinău ca o companie concentrată spre satisfacerea\r\n                            eficientă a clienților și deservirea lor la cea mai înaltă calitate în toate solicitările\r\n                            din imobiliare.</p>\r\n                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum\r\n                                dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n                            <ul>\r\n                                <li>Prezentarea, selectarea și promovarea ofertelor imobiliare pentru vânzări sau\r\n                                    chirii.\r\n                                </li>\r\n                                <li>Pregătirea documentelor pentru tranzacții la cadastru și fisc.</li>\r\n                                <li>Garantarea securității tranzacțiilor și confidențialitatea informației.</li>\r\n                                <li>Evaluarea costului și expertiza bunurilor imobiliare înainte de vânzare sau\r\n                                    chirie.\r\n                                </li>\r\n                                <li>Pregătirea integrată a actelor pentru notar.</li>\r\n                                <li>Suport legal al tranzacției.</li>\r\n                            </ul>\r\n                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, NULL, NULL, '2021-11-28 12:26:38', '2021-12-03 21:11:08'),
(12, 4, 3, 'About Us', 'about', NULL, '<p>Manole Estate fost înființată în Chișinău ca o companie concentrată spre satisfacerea\r\n                            eficientă a clienților și deservirea lor la cea mai înaltă calitate în toate solicitările\r\n                            din imobiliare.</p>\r\n                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum\r\n                                dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n                            <ul>\r\n                                <li>Prezentarea, selectarea și promovarea ofertelor imobiliare pentru vânzări sau\r\n                                    chirii.\r\n                                </li>\r\n                                <li>Pregătirea documentelor pentru tranzacții la cadastru și fisc.</li>\r\n                                <li>Garantarea securității tranzacțiilor și confidențialitatea informației.</li>\r\n                                <li>Evaluarea costului și expertiza bunurilor imobiliare înainte de vânzare sau\r\n                                    chirie.\r\n                                </li>\r\n                                <li>Pregătirea integrată a actelor pentru notar.</li>\r\n                                <li>Suport legal al tranzacției.</li>\r\n                            </ul>\r\n                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, NULL, NULL, '2021-11-28 12:26:38', '2021-12-03 21:11:08'),
(13, 5, 1, 'Agentii Nostrii', 'agenti', NULL, NULL, NULL, NULL, NULL, '2021-11-29 11:57:58', '2021-11-30 12:21:25'),
(14, 5, 2, 'Наши агенты', 'agenti', NULL, NULL, NULL, NULL, NULL, '2021-11-29 11:57:58', '2021-11-30 12:21:25'),
(15, 5, 3, 'Our agents', 'agents', NULL, NULL, NULL, NULL, NULL, '2021-11-29 11:57:58', '2021-11-30 12:21:25'),
(16, 6, 1, 'Cariera', 'cariera', NULL, NULL, NULL, NULL, NULL, '2021-11-29 11:59:32', '2021-11-29 11:59:32'),
(17, 6, 2, 'Вакансии', 'vakansii', NULL, NULL, NULL, NULL, NULL, '2021-11-29 11:59:32', '2021-11-29 11:59:32'),
(18, 6, 3, 'Careers', 'careers', NULL, NULL, NULL, NULL, NULL, '2021-11-29 11:59:32', '2021-11-29 11:59:32'),
(19, 7, 1, 'Termeni și condiții de utilizare', 'termeni-si-conditii-de-utilizare', NULL, '<h4>INTRODUCERE</h4>\r\n\r\n<p>Prezentele Conditii Generale definesc conditiile de utilizare a site-ului [NUME SITE] de catre potentialii vizitatori sau clienti. Acces&acirc;nd si navig&acirc;nd pe acest site, acceptati termenii de utilizare descrisi &icirc;n continuare.</p>\r\n\r\n<div>DREPTURILE ASUPRA CONTINUTULUI SITE-ULUI S.C. &hellip;&hellip;&hellip;&hellip;. (denumita &icirc;n continuare [NUME SOCIETATE]), nu va transfera titlul de proprietate asupra aplicatiilor software . [NUME SOCIETATE] detine drepturi complete si depline asupra titlului de proprietate si prin aceasta toate drepturile de autor si cele brevetate. Nu aveti dreptul sa redistribuiti, vindeti, decompilati, dezasamblati aplicatia software &icirc;ntr-o forma perceptibila de catre oameni. Toate informatiile, produsele sau aplicatiile continute &icirc;n acest site sunt proprietatea [NUME SOCIETATE], care &icirc;si rezerva dreptul de a modifica continutul si/sau structura site-ului &icirc;n orice moment si fara nici o informare prealabila. &Icirc;ntregul continut al site-ului [NUME SITE] este protejat prin legea drepturilor de autor, toate drepturile fiind rezervate. Toate drepturile referitoare la pagini, continutul si prezentarea site-ului sunt detinute de [NUME SOCIETATE]. Este interzisa copierea, modificarea, afisarea, distribuirea, transmiterea, publicarea, comercializarea, licentierea, crearea unor materiale derivate sau utilizarea continutului site-ului &icirc;n orice scop fara confirmarea scrisa din partea [NUME SOCIETATE]. &nbsp;Accesul si utilizarea paginii [NUME SITE] sunt gratuite si au scopul de a veni in ajutorul utilizatorilor pentru a gasi informatiile necesare &icirc;n cel mai usor si rapid mod posibil, conform cerintelor fiecaruia. &nbsp;Informatiile prezente pe [NUME SITE] sunt de interes general si sunt puse la dispozitia utilizatorilor &icirc;n mod gratuit. Prin termenul &bdquo;utilizator&rdquo; al acestei pagini se &icirc;ntelege orice persoana fizica sau juridica care va accesa pagina. Puteti copia si tipari continutul paginii [NUME SITE] pentru folosinta dumneavoastra personala, fara intentii comerciale. &Icirc;n orice alte situatii, continutul [NUME SITE] nu poate fi reprodus, modificat sau exploatat fara consimtam&acirc;ntul explicit al reprezentantilor [NUME SITE].<br />\r\n<br />\r\n&nbsp;</div>\r\n\r\n<h4>NEANGAJAREA RASPUNDERII</h4>\r\n\r\n<p>Continutul informatiilor se refera la descrierea &icirc;ntr-un anumit grad de detaliere a activitatilor, produselor si serviciilor [NUME SOCIETATE]. [NUME SOCIETATE] nu va acorda nici o garantie referitoare la:</p>\r\n\r\n<ul>\r\n	<li>evitarea utilizarii anevoioase sau &icirc;ntreruperii &icirc;n utilizare a site-ului;</li>\r\n	<li>neafectarea &icirc;n sens negativ a altor sisteme prin utilizarea site-ului;</li>\r\n	<li>inexistenta pe site-ul pus la dispozitie a virusilor sau alte componente care ar putea dauna utilizatorilor.</li>\r\n</ul>\r\nPentru orice nelamurire &icirc;n legatura cu exercitarea drepturilor dumneavoastra referitoare la utilizarea site-ului si la protectia utilizarii va rugam sa ne contactati prin intermediul sectiunii Contact din site.\r\n\r\n<h4><br />\r\n&nbsp;</h4>', NULL, NULL, NULL, '2021-11-29 12:00:28', '2021-11-30 11:53:34'),
(20, 7, 2, 'Правила и условия пользования', 'pravila-i-usloviya-polzovaniya', NULL, '<h4>ВСТУПЛЕНИЕ</h4>\r\nЭти Общие условия определяют условия использования сайта [НАЗВАНИЕ САЙТА] потенциальными посетителями или клиентами. Заходя на этот сайт и просматривая его, вы принимаете условия использования, описанные ниже. ПРАВА НА СОДЕРЖАНИЕ S.C. &hellip;&hellip;&hellip;&hellip;. (далее именуемое [НАЗВАНИЕ КОМПАНИИ]), не передает права собственности на программные приложения. [НАЗВАНИЕ КОМПАНИИ] обладает полными и полными правами на название и, следовательно, все авторские права и патенты. Вы не можете распространять, продавать, декомпилировать, дизассемблировать программное обеспечение в доступной для людей форме. Вся информация, продукты или приложения, содержащиеся на этом сайте, являются собственностью [НАЗВАНИЕ КОМПАНИИ], которая оставляет за собой право изменять содержание и / или структуру сайта в любое время и без предварительного уведомления. Все содержимое сайта [НАЗВАНИЕ САЙТА] защищено законом об авторском праве, все права защищены. Все права на страницы, содержание и представление сайта принадлежат [НАЗВАНИЕ КОМПАНИИ]. Запрещается копировать, изменять, отображать, распространять, передавать, публиковать, продавать, лицензировать, создавать производные работы или использовать содержимое сайта для любых целей без письменного подтверждения от [НАЗВАНИЕ КОМПАНИИ].<br />\r\n<br />\r\nДоступ к странице [НАЗВАНИЕ САЙТА] и ее использование являются бесплатными и предназначены для того, чтобы помочь пользователям найти нужную информацию самым простым и быстрым способом в соответствии с их требованиями. Информация о [НАЗВАНИЕ САЙТА] представляет общий интерес и предоставляется пользователям бесплатно. Термин &laquo;пользователь&raquo; этой страницы означает любое физическое или юридическое лицо, которое получит доступ к странице. Вы можете копировать и распечатывать содержимое страницы [НАЗВАНИЕ САЙТА] для личного использования без коммерческих целей. В любом другом случае содержание [НАЗВАНИЕ САЙТА] не может быть воспроизведено, изменено или использовано без явного согласия представителей [НАЗВАНИЕ САЙТА].', NULL, NULL, NULL, '2021-11-29 12:00:28', '2021-11-30 11:53:34'),
(21, 7, 3, 'Terms and conditions of use', 'terms-and-conditions-of-use', NULL, '<h4>INTRODUCTION</h4>\r\nThese General Conditions define the conditions of use of the site [SITE NAME] by potential visitors or customers. By accessing and browsing this site, you accept the terms of use described below. THE RIGHTS OVER THE CONTENT OF THE S.C. &hellip;&hellip;&hellip;&hellip;. (hereinafter referred to as [COMPANY NAME]), will not transfer title to the software applications. [COMPANY NAME] holds full and complete rights to the title and thus all copyrights and patents. You may not redistribute, sell, decompile, disassemble the software in a form perceptible to humans. All information, products or applications contained in this site are the property of [COMPANY NAME], which reserves the right to change the content and / or structure of the site at any time and without prior notice. The entire content of the site [SITE NAME] is protected by copyright law, all rights reserved.<br />\r\n<br />\r\nAll rights regarding the pages, content and presentation of the site are owned by [COMPANY NAME]. It is forbidden to copy, modify, display, distribute, transmit, publish, market, license, create derivative works or use the content of the site for any purpose without written confirmation from [COMPANY NAME]. Access to and use of the [SITE NAME] page is free and is intended to help users find the information they need in the easiest and fastest way possible, according to their requirements. The information on [SITE NAME] is of general interest and is made available to users free of charge. The term &quot;user&quot; of this page means any natural or legal person who will access the page. You may copy and print the content of the [SITE NAME] page for your personal use, without commercial intent. In any other case, the content of [SITE NAME] may not be reproduced, modified or exploited without the express consent of the representatives of [SITE NAME].', NULL, NULL, NULL, '2021-11-29 12:00:28', '2021-11-30 11:53:34'),
(22, 8, 1, 'Politica Cookies', 'politica-cookies', NULL, '<h3>Funcționalitate</h3>\r\n\r\n<p>Cookie-urile folosite pentru funcționalitate le dau utilizatorilor posibilitatea de a interacționa cu un serviciu sau un site pentru a accesa funcții esențiale ale serviciului respectiv. Printre aspectele considerate esențiale pentru un serviciu se numără preferințe, cum ar fi limba selectată de utilizator, optimizări ale produselor care ajută la &icirc;ntreținerea și &icirc;mbunătățirea unui serviciu și păstrarea informațiilor despre sesiunea unui utilizator, de exemplu, conținutul coșului de cumpărături.</p>\r\n\r\n<p>Unele cookie-uri sunt folosite pentru a reține preferințele utilizatorului. De exemplu, majoritatea utilizatorilor serviciilor Google au &icirc;n browser un cookie numit &bdquo;NID&rdquo;. Acest cookie conține un ID unic, folosit pentru a vă reține preferințele și alte informații, cum ar fi limba preferată, numărul de rezultate ale căutării care doriți să apară &icirc;n pagina cu rezultate (de exemplu, 10 sau 20) și dacă doriți ca filtrul Căutare sigură Google să fie activat. Fiecare cookie NID expiră la șase luni după ultima folosire de către utilizator. Cookie-ul numit &bdquo;VISITOR_INFO1_LIVE&rdquo; are un rol similar pentru YouTube și este folosit și pentru detectarea și remedierea problemelor legate de acest serviciu.</p>\r\n\r\n<p>YouTube folosește cookie-ul &bdquo;PREF&rdquo; pentru a stoca informații, cum ar fi configurația paginii preferată de utilizator și preferințele de redare, precum redarea automată, redarea conținutului &icirc;n mod aleatoriu și dimensiunea playerului. &Icirc;n YouTube Music, printre aceste preferințe se numără volumul, modul de repetare și redarea automată. Acest cookie expiră la opt luni după ultima folosire de către utilizator.</p>\r\n\r\n<p>Unele cookie-uri sunt folosite pentru a menține și a &icirc;mbunătăți experiența utilizatorului &icirc;n timpul unei anumite sesiuni de navigare. De exemplu, YouTube folosește &bdquo;YSC&rdquo; pentru a reține intrările de la utilizator și pentru a asocia acțiunile utilizatorului respectiv. Acest cookie este valabil c&acirc;t timp browserul utilizatorului răm&acirc;ne deschis. Și cookie-ul &bdquo;pm_sess&rdquo; contribuie la menținerea sesiunii din browser a utilizatorului și este valabil 30 de minute.</p>\r\n\r\n<p>Unele cookie-uri &icirc;mbunătățesc performanța serviciilor Google. De exemplu, &bdquo;CGIC&rdquo; &icirc;mbunătățește afișarea rezultatelor căutării prin completarea automată a termenilor de căutare pe baza intrării inițiale de la utilizator. Acest cookie este valabil șase luni.</p>\r\n\r\n<h3>Securitate</h3>\r\n\r\n<p>Cookie-urile sunt folosite pentru autentificarea securizată a utilizatorilor, pentru a preveni frauda și pentru a proteja utilizatorii &icirc;n timpul interacțiunii lor cu un serviciu.</p>\r\n\r\n<p>Unele cookie-uri sunt folosite pentru autentificarea utilizatorilor, &icirc;ntruc&acirc;t asigură faptul că numai proprietarul real al unui cont poate accesa contul respectiv. De exemplu, cookie-urile numite &bdquo;SID&rdquo; și &bdquo;HSID&rdquo; conțin &icirc;nregistrări semnate digital și criptate ale codului de Cont Google al unui utilizator și data și ora celei mai recente conectări. Combinația acestor cookie-uri ne permite să blocăm numeroase tipuri de atacuri, de exemplu, &icirc;ncercările de a fura conținutul formularelor trimise &icirc;n serviciile Google.</p>\r\n\r\n<p>Unele cookie-uri sunt folosite pentru a preveni spamul, frauda și abuzul. De exemplu, cookie-urile &bdquo;pm_sess&rdquo; și &bdquo;YSC&rdquo; se asigură că solicitările din cadrul unei sesiuni de navigare sunt trimise de utilizator, nu de alte site-uri. Ambele cookie-uri &icirc;mpiedică site-urile rău intenționate să &icirc;și asume identitatea unui utilizator și să acționeze &icirc;n numele său fără ca acesta să știe.</p>\r\n\r\n<h3>Analize</h3>\r\n\r\n<p>Cu ajutorul cookie-urilor folosite pentru date statistice, se colectează date care ajută serviciile să analizeze modul &icirc;n care utilizatorii interacționează cu un anumit serviciu. Pe baza acestor statistici, serviciile pot să optimizeze conținutul și să creeze funcții mai utile care &icirc;mbunătățesc experiența utilizatorului.</p>\r\n\r\n<p>Unele cookie-uri ajută site-urile să &icirc;nțeleagă cum interacționează vizitatorii cu proprietățile lor. De exemplu,&nbsp;<a b730ef=\"\" href=\"https://analytics.google.com/analytics/academy/?hl=ro\" target=\"_blank\">Google Analytics</a>, un produs Google care ajută proprietarii de site-uri și de aplicații să &icirc;nțeleagă cum interacționează utilizatorii cu un serviciu, folosește un set de cookie-uri pentru a colecta informații și pentru a raporta date statistice privind utilizarea site-ului, fără a trimite la Google date care identifică vizitatorii. Principalul cookie folosit de Google Analytics este cookie-ul &bdquo;_ga&rdquo;. Cu ajutorul acestui cookie, valabil doi ani, serviciile pot deosebi utilizatorii. Acesta este folosit de orice site care implementează Google Analytics, inclusiv serviciile Google.</p>\r\n\r\n<p>Servicile Google folosesc cookie-uri pentru date statistice ca acestea și altele, cum ar fi &bdquo;NID&rdquo; &icirc;n Căutarea Google și &bdquo;VISITOR_INFO1_LIVE&rdquo; pe YouTube.</p>\r\n\r\n<h3>Publicitate</h3>\r\n\r\n<p>Google folosește cookie-uri pentru publicitate, inclusiv difuzarea și redarea anunțurilor, personalizarea anunțurilor (&icirc;n funcție de setările dvs. pentru anunțuri de la&nbsp;<a b730ef=\"\" href=\"https://g.co/adsettings\" target=\"_blank\">g.co/adsettings</a>), limitarea numărului de afișări ale unui anunț pentru un utilizator, ignorarea anunțurilor pe care ați ales să nu le mai vedeți și măsurarea eficienței anunțurilor.</p>\r\n\r\n<ul>\r\n	<li>&bdquo;NID&rdquo; este folosit &icirc;n aceste scopuri pentru afișarea anunțurilor Google &icirc;n serviciile Google pentru utilizatorii care nu s-au conectat</li>\r\n	<li>IDE și ANID sunt folosite &icirc;n aceste scopuri pentru afișarea anunțurilor Google pe site-uri non-Google</li>\r\n</ul>\r\n\r\n<p>Alte servicii, cum ar fi YouTube, pot folosi aceste cookie-uri și cookie-uri precum &bdquo;VISITOR_INFO1_LIVE&rdquo; pentru a afișa anunțuri mai relevante.</p>\r\n\r\n<p>Dacă ați activat anunțurile personalizate, cookie-ul &bdquo;ANID&rdquo; este folosit pentru a reține această setare și este valabil 13 luni &icirc;n Spațiul Economic European (SEE), Elveția și Regatul Unit (UK) și 24 de luni &icirc;n restul lumii. Dacă ați dezactivat anunțurile personalizate, &bdquo;ANID&rdquo; este folosit pentru a reține această setare p&acirc;nă &icirc;n 2030. &bdquo;NID&rdquo; expiră la șase luni după ultima folosire de către utilizator. &bdquo;IDE&rdquo; este valabil 13 luni &icirc;n SEE, Elveția și UK și 24 de luni &icirc;n restul lumii.</p>\r\n\r\n<p>Unele cookie-uri folosite pentru publicitate sunt destinate utilizatorilor care se conectează pentru a utiliza serviciile Google. De exemplu, &bdquo;DSID&rdquo; se folosește pentru a identifica un utilizator conectat pe site-uri non-Google și pentru a reține dacă acel utilizator a consimțit la personalizarea anunțurilor. Acesta este valabil două săptăm&acirc;ni.</p>\r\n\r\n<p>Cu ajutorul platformei de publicitate Google, companiile pot să facă publicitate &icirc;n serviciile Google și pe site-urile non-Google aflate &icirc;n parteneriat cu Google.</p>\r\n\r\n<p>Unele cookie-uri ajută Google să difuzeze anunțuri pe site-uri terță parte și sunt setate pe domeniul site-ului pe care &icirc;l accesați. De exemplu, &bdquo;_gads&rdquo; face posibilă afișarea anunțurilor Google, inclusiv anunțuri personalizate, pe site-uri. Cookie-urile care &icirc;ncep cu &bdquo;_gac_&rdquo; provin de la Google Analytics și sunt folosite de advertiseri pentru a cuantifica performanța campaniilor lor publicitare și activitatea utilizatorilor. Cookie-ul &bdquo;_gads&rdquo; este valabil 13 luni și cookie-urile &bdquo;_gac_&rdquo; sunt valabile 90 de zile.</p>\r\n\r\n<p>Unele cookie-uri sunt folosite pentru a măsura performanța anunțurilor și a campaniilor și ratele de conversie pentru anunțurile Google de pe un site pe care &icirc;l accesați. De exemplu, cookie-urile care &icirc;ncep cu &bdquo;_gcl_&rdquo; provin de la Google Analytics și sunt folosite &icirc;n principal pentru a-i ajuta pe advertiseri să afle &icirc;n c&acirc;te cazuri utilizatorii care dau clic pe anunțurile lor realizează o acțiune pe site, de exemplu, fac o achiziție. Cookie-urile folosite pentru măsurarea ratelor de conversie nu sunt utilizate pentru personalizarea anunțurilor. Cookie-urile &bdquo;_gcl_&rdquo; sunt valabile 90 de zile.</p>\r\n\r\n<h3>Personalizare</h3>\r\n\r\n<p>Cookie-urile folosite pentru personalizare &icirc;mbunătățesc experiența utilizatorului, oferind conținut și funcții personalizate.</p>\r\n\r\n<p>&Icirc;n funcție de setările dvs. de la&nbsp;<a b730ef=\"\" href=\"https://g.co/privacytools\" target=\"_blank\">g.co/privacytools</a>, unele cookie-uri &icirc;mbunătățesc recomandările &icirc;n cadrul unui serviciu. De exemplu, &bdquo;VISITOR_INFO1_LIVE&rdquo; face posibile recomandările personalizate pe YouTube pe baza vizionărilor și a căutărilor anterioare. &bdquo;NID&rdquo; face posibile funcțiile de completare automată personalizate &icirc;n Căutare pe măsură ce utilizatorii introduc termeni de căutare. Aceste cookie-uri expiră la șase luni după ultima folosire de către utilizator.</p>', NULL, NULL, NULL, '2021-11-29 12:00:59', '2021-11-30 11:32:42'),
(23, 8, 2, 'Политика использования cookie', 'politika-ispolzovaniya-failov-cookie', NULL, '<h3>Функциональные возможности</h3>\r\n\r\n<p>Функциональные файлы cookie позволяют пользователям взаимодействовать с сервисом или сайтом и получать доступ к функциям, обеспечивающим его корректную работу. Это могут быть языковые настройки, оптимизация продукта для поддержки и улучшения работы сервиса или сохранение информации о сеансе пользователя, например о содержимом корзины покупок.</p>\r\n\r\n<p>Некоторые файлы cookie используются для сохранения настроек пользователя. Например, у большинства пользователей сервисов Google в браузере хранится файл cookie NID. В нем содержится уникальный идентификатор, который позволяет получать данные о настройках и предпочтениях пользователя, таких как язык, параметры Безопасного поиска Google и желаемое количество результатов на странице (например, 10 или 20). Срок действия всех файлов NID истекает через шесть месяцев после последнего использования. В сервисе YouTube для этих же целей используется файл cookie под названием VISITOR_INFO1_LIVE, который также помогает выявлять и устранять проблемы.</p>\r\n\r\n<p>В сервисе YouTube используется файл cookie PREF для хранения информации о предпочтительной конфигурации страницы и таких настройках, как автовоспроизведение, перемешивание контента и размер проигрывателя. Для YouTube Music сохраняются данные о параметрах громкости, режима повтора и автовоспроизведения. Срок действия этого файла cookie истекает через восемь месяцев после последнего использования.</p>\r\n\r\n<p>Некоторые файлы cookie нужны, чтобы обеспечивать и повышать удобство использования в пределах отдельно взятого сеанса работы в браузере. Например, в сервисе YouTube используется файл YSC для запоминания вводимых пользователем данных и связанных с ними действий. Этот файл cookie хранится, пока пользователь не закроет браузер. Файл cookie pm_sess также помогает обеспечивать сеанс работы в браузере и хранится в течение 30 минут.</p>\r\n\r\n<p>Некоторые файлы cookie улучшают работу сервисов Google. Например, файл CGIC позволяет ускорить выдачу результатов поиска, автоматически заполняя поисковые запросы на основе данных, которые начинает вводить пользователь. Этот файл cookie хранится шесть месяцев.</p>\r\n\r\n<h3>Безопасность</h3>\r\n\r\n<p>Файлы cookie, используемые для обеспечения безопасности, позволяют предотвращать мошенничество, выполнять аутентификацию пользователей и защищать их при работе с сервисом.</p>\r\n\r\n<p>Некоторые файлы cookie используются для аутентификации пользователей. Они помогают гарантировать, что только фактический владелец аккаунта может получить доступ к нему. Например, в файлах cookie SID и HSID хранятся подписанные цифровой подписью и зашифрованные сведения об идентификаторе аккаунта Google и времени последнего входа. Сочетание этих файлов cookie позволяет нам блокировать множество типов атак, целью которых может являться, например, кража информации, предоставляемой при заполнении форм в сервисах Google.</p>\r\n\r\n<p>Некоторые файлы cookie используются для предотвращения спама, мошенничества и других злоупотреблений. Например, файлы cookie pm_sess и YSC подтверждают, что запросы во время сеанса работы в браузере выполняются пользователем, а не другими сайтами. Эти файлы cookie не позволяют вредоносным сайтам выполнять действия от лица пользователя без его ведома.</p>\r\n\r\n<h3>Аналитика</h3>\r\n\r\n<p>Файлы cookie, используемые для аналитики, помогают собирать данные, по которым сервисы могут определять, как пользователи взаимодействуют с тем или иным сервисом. Эта статистика помогает владельцам сервисов улучшать контент, а также разрабатывать функции, повышающие удобство для пользователей.</p>\r\n\r\n<p>Некоторые файлы cookie позволяют владельцам сайтов анализировать действия посетителей. Например, с помощью&nbsp;<a b730ef=\"\" href=\"https://analytics.google.com/analytics/academy/?hl=ru\" target=\"_blank\">Google Аналитики</a>&nbsp;владелец сайта или приложения может узнать, как люди взаимодействуют с его сервисом. Аналитика использует ряд файлов cookie, чтобы собирать информацию и предоставлять статистику использования сайта, не передавая идентификационные данные отдельных посетителей в Google. Основной файл cookie Google Аналитики называется _ga. Он позволяет сервису различать пользователей и действует в течение двух лет. Этот файл cookie используется всеми сайтами, применяющими Аналитику, в том числе сервисами Google.</p>\r\n\r\n<p>Сервисы Google используют для аналитики подобные и другие файлы cookie, например NID в Google Поиске и VISITOR_INFO1_LIVE на YouTube.</p>\r\n\r\n<h3>Реклама</h3>\r\n\r\n<p>Google использует файлы cookie для рекламы, в том числе чтобы показывать и отрисовывать объявления, персонализировать их (в зависимости от настроек рекламных предпочтений на странице&nbsp;<a b730ef=\"\" href=\"https://g.co/adsettings\" target=\"_blank\">g.co/adsettings</a>), ограничивать количество показов одного объявления пользователю, скрывать объявления, которые пользователь предпочитает не видеть, и оценивать эффективность рекламы.</p>\r\n\r\n<ul>\r\n	<li>NID используется в этих целях при показе рекламы в сервисах Google тем пользователям, которые не вошли в аккаунт.</li>\r\n	<li>IDE и ANID используются в этих целях при показе рекламы на сайтах, не принадлежащих Google.</li>\r\n</ul>\r\n\r\n<p>Прочие сервисы Google, такие как YouTube, могут также использовать эти и другие файлы cookie, например VISITOR_INFO1_LIVE, чтобы показывать более релевантную рекламу.</p>\r\n\r\n<p>Если вы включили персонализацию рекламы, то для запоминания этого параметра используется файл ANID. В Европейской экономической зоне (ЕЭЗ), Швейцарии и Великобритании срок действия этого файла составляет 13 месяцев, а в остальном мире&nbsp;&ndash; 24 месяца. Если вы отключили персонализацию рекламы, информация об этом будет храниться в файле ANID до 2030 года. Срок действия файла NID истекает через шесть месяцев после последнего использования. Срок действия файла IDE составляет 13 месяцев в ЕЭЗ, Швейцарии и Великобритании и 24 месяца&nbsp;&ndash; в остальном мире.</p>\r\n\r\n<p>Некоторые файлы cookie, которые используются для рекламы, предназначены для работы с пользователями сервисов Google, которые вошли в аккаунт. Например, файл DSID используется, чтобы определить пользователей, которые вошли в аккаунт Google и посещают сторонние сайты. Кроме того, с помощью этого файла сохраняется информация о том, дают ли эти пользователи согласие на персонализацию рекламы. Срок действия файла DSID составляет две недели.</p>\r\n\r\n<p>Используя рекламную платформу Google, компании могут показывать свои объявления в сервисах Google и на сайтах партнеров Google.</p>\r\n\r\n<p>Некоторые файлы cookie используются для показа рекламы Google на сторонних сайтах&nbsp;&ndash; они посылаются в домен посещаемого пользователем сайта. Например, файлы cookie с префиксом _gads разрешают сайтам показывать объявления Google, в том числе персонализированные. Файлы cookie с префиксом _gac_ создаются в Google Аналитике и используются рекламодателями для измерения действий пользователей и эффективности рекламных кампаний. Срок действия файлов cookie с префиксом _gads составляет 13 месяцев, а с префиксом _gac_&nbsp;&ndash; 90 дней.</p>\r\n\r\n<p>Некоторые файлы cookie используются для измерения эффективности объявлений и кампаний, а также коэффициентов конверсий объявлений Google на посещаемых пользователем сайтах. Например, файлы cookie с префиксом _gcl_ создаются в Google Аналитике и используются преимущественно для отслеживания конверсий. Они сообщают рекламодателям о том, что пользователь нажал на объявление и перешел на целевую страницу. Файлы cookie, предназначенные для измерения коэффициентов конверсий, не используются для персонализации объявлений. Срок действия файлов cookie с префиксом _gcl_ составляет 90 дней.</p>\r\n\r\n<h3>Персонализация</h3>\r\n\r\n<p>Файлы cookie, предназначенные для персонализации, позволяют предоставлять пользователю подходящие ему функции и контент.</p>\r\n\r\n<p>В зависимости от ваших настроек на странице&nbsp;<a b730ef=\"\" href=\"https://g.co/privacytools\" target=\"_blank\">g.co/privacytools</a>&nbsp;некоторые файлы cookie могут участвовать в оптимизации рекомендаций. Например, с помощью файла VISITOR_INFO1_LIVE на YouTube показываются персонализированные рекомендации, созданные на основе информации о последних просмотрах и поисковых запросах пользователя. Другой файл, NID, позволяет персонализировать варианты автозаполнения, которые появляются в Поиске во время ввода пользователями поискового запроса. Срок действия этих файлов cookie истекает через шесть месяцев после последнего действия пользователя.</p>', NULL, NULL, NULL, '2021-11-29 12:00:59', '2021-11-30 11:32:42'),
(24, 8, 3, 'Cookies Policy', 'cookies-policy', NULL, '<h3>Functionality</h3>\r\n\r\n<p>Cookies used for functionality allow users to interact with a service or site to access features that are fundamental to that service. Things considered fundamental to the service include preferences like the user&rsquo;s choice of language, product optimizations that help maintain and improve a service, and maintaining information relating to a user&rsquo;s session, such as the content of a shopping cart.</p>\r\n\r\n<p>Some cookies are used to maintain a user&rsquo;s preferences. For example, most people who use Google services have a cookie called &lsquo;NID&rsquo; in their browsers. This cookie contains a unique ID used to remember your preferences and other information such as your preferred language, how many search results you prefer to have shown on a results page (for example, 10 or 20), and whether you want to have Google&rsquo;s SafeSearch filter turned on. Each NID cookie expires 6 months from a user&rsquo;s last use. A cookie called &lsquo;VISITOR_INFO1_LIVE&rsquo; serves a similar purpose for YouTube and is also used to detect and resolve problems with the service.</p>\r\n\r\n<p>YouTube uses the &lsquo;PREF&rsquo; cookie to store information such as a user&rsquo;s preferred page configuration and playback preferences like autoplay, shuffle content, and player size. For YouTube Music, these preferences include volume, repeat mode, and autoplay. This cookie expires 8 months from a user&rsquo;s last use.</p>\r\n\r\n<p>Some cookies are used to maintain and enhance a user&rsquo;s experience during a specific browsing session. For example &lsquo;YSC&rsquo; is used by YouTube to remember user input and associate a user&rsquo;s actions. This cookie lasts for as long as the user keeps their browser open. The cookie &lsquo;pm_sess&rsquo; also helps maintain a user&rsquo;s browser session and lasts for 30 minutes.</p>\r\n\r\n<p>Some cookies improve the performance of Google services. For example, &lsquo;CGIC&rsquo; improves the delivery of search results by autocompleting search queries based on a user&rsquo;s initial input. This cookie lasts for 6 months.</p>\r\n\r\n<h3>Security</h3>\r\n\r\n<p>Cookies used for security authenticate users, prevent fraud, and protect users as they interact with a service.</p>\r\n\r\n<p>Some cookies are used to authenticate users, helping ensure that only the actual owner of an account can access that account. For example, cookies called &lsquo;SID&rsquo; and &lsquo;HSID&rsquo; contain digitally signed and encrypted records of a user&rsquo;s Google Account ID and most recent sign-in time. The combination of these cookies allows us to block many types of attack, such as attempts to steal the content of forms submitted in Google services.</p>\r\n\r\n<p>Some cookies are used to prevent spam, fraud, and abuse. For example, the &lsquo;pm_sess&rsquo; and &lsquo;YSC&rsquo; cookies ensure that requests within a browsing session are made by the user and not by other sites. Both cookies prevent malicious sites acting without a user&rsquo;s knowledge and as if they were that user.</p>\r\n\r\n<h3>Analytics</h3>\r\n\r\n<p>Cookies used for analytics help collect data that allows services to understand how users interact with a particular service. These insights allow services both to improve content and to build better features that improve the user&rsquo;s experience.</p>\r\n\r\n<p>Some cookies help sites understand how their visitors engage with their properties. For example,&nbsp;<a b730ef=\"\" href=\"https://analytics.google.com/analytics/academy/?hl=en_US\" target=\"_blank\">Google Analytics</a>, a Google product that helps site and app owners understand how people engage with a service, uses a set of cookies to collect information and report site usage statistics without personally identifying individual visitors to Google. &lsquo;_ga&rsquo; is the main cookie used by Google Analytics. &lsquo;_ga&rsquo; enables a service to distinguish one user from another and lasts for 2 years. It&rsquo;s used by any site that implements Google Analytics, including Google services.</p>\r\n\r\n<p>Google services also use analytics cookies like these, as well as others like &lsquo;NID&rsquo; on Google Search and &lsquo;VISITOR_INFO1_LIVE&rsquo; on YouTube.</p>\r\n\r\n<h3>Advertising</h3>\r\n\r\n<p>Google uses cookies for advertising, including serving and rendering ads, personalizing ads (depending on your ad settings at&nbsp;<a b730ef=\"\" href=\"https://g.co/adsettings\" target=\"_blank\">g.co/adsettings</a>), limiting the number of times an ad is shown to a user, muting ads you have chosen to stop seeing, and measuring the effectiveness of ads.</p>\r\n\r\n<ul>\r\n	<li>&lsquo;NID&rsquo; is used for these purposes to show Google ads in Google services for signed-out users</li>\r\n	<li>&lsquo;IDE&rsquo; and &lsquo;ANID&rsquo; are used for these purposes to show Google ads on non-Google sites</li>\r\n</ul>\r\n\r\n<p>Other Google services like YouTube may also use these cookies and cookies like &lsquo;VISITOR_INFO1_LIVE&rsquo; to show more relevant ads.</p>\r\n\r\n<p>If you have personalized ads enabled, &lsquo;ANID&rsquo; is used to remember this setting and lasts for 13 months in the European Economic Area (EEA), Switzerland, and the United Kingdom (UK), and 24 months everywhere else. If you have disabled personalized ads, &lsquo;ANID&rsquo; is used to store that setting until 2030. &lsquo;NID&rsquo; expires 6 months from a user&rsquo;s last use. &lsquo;IDE&rsquo; lasts for 13 months in the EEA, Switzerland, and the UK and 24 months everywhere else.</p>\r\n\r\n<p>Some cookies used for advertising are for users who sign in to use Google services. For example, &lsquo;DSID&rsquo; is used to identify a signed-in user on non-Google sites and to remember whether the user has agreed to ad personalization. It lasts for 2 weeks.</p>\r\n\r\n<p>Through Google&rsquo;s advertising platform, businesses can advertise in Google services as well as on non-Google sites that partner with Google.</p>\r\n\r\n<p>Some cookies support Google showing ads on third-party sites, and are set in the domain of the website you visit. For example, &lsquo;_gads&rsquo; enables sites to show Google ads, including personalized ads. Cookies that start with &lsquo;_gac_&rsquo; come from Google Analytics and are used by advertisers to measure user activity and the performance of their ad campaigns. The &lsquo;_gads&rsquo; cookie lasts for 13 months and the &lsquo;_gac_&rsquo; cookies last for 90 days.</p>\r\n\r\n<p>Some cookies are used to measure ad and campaign performance and conversion rates for Google ads on a site you visit. For example, cookies that start with &lsquo;_gcl_&rsquo; come from Google Analytics and are primarily used to help advertisers determine how many times users who click on their ads end up taking an action on their site, such as making a purchase. Cookies used for measuring conversion rates aren&rsquo;t used to personalize ads. &lsquo;_gcl_&rsquo; cookies last for 90 days.</p>\r\n\r\n<h3>Personalization</h3>\r\n\r\n<p>Cookies used for personalization enhance the user&rsquo;s experience by providing personalized content and features.</p>\r\n\r\n<p>Depending on your settings at&nbsp;<a b730ef=\"\" href=\"https://g.co/privacytools\" target=\"_blank\">g.co/privacytools</a>, some cookies enable better recommendations within a service. For example, &lsquo;VISITOR_INFO1_LIVE&rsquo; enables personalized recommendations on YouTube based on past views and searches. And &lsquo;NID&rsquo; enables personalized autocomplete features in Search as users type search terms. These cookies expire 6 months after a user&rsquo;s last use.</p>', NULL, NULL, NULL, '2021-11-29 12:00:59', '2021-11-30 11:32:42'),
(25, 9, 1, 'Politica de Securitatea Datelor', 'politica-de-securitatea-datelor', NULL, '<h4>Dorim să &icirc;nțelegeți ce tipuri de informații colectam pe măsură ce folosiți serviciile noastre<br />\r\n&nbsp;</h4>\r\n\r\n<p>Colectăm informații pentru a oferi servicii mai bune tuturor utilizatorilor noștri: de la informații de bază, cum ar fi limba pe care o vorbiți, la lucruri mai complexe, de exemplu,&nbsp;care sunt anunțurile pe care le veți considera cele mai utile,&nbsp;persoanele care contează cel mai mult pentru dvs. &icirc;n mediul online&nbsp;sau ce videoclipuri YouTube v-ar plăcea. Informațiile pe care le colectează Google și cum sunt folosite acele informații depinde de modul &icirc;n care utilizați serviciile noastre și modul &icirc;n care gestionați opțiunile dvs. de confidențialitate.</p>\r\n\r\n<p>C&acirc;nd nu sunteți conectați la un Cont Google, stocăm informațiile pe care le colectăm folosind&nbsp;identificatori unici&nbsp;asociați cu browserul, aplicația sau&nbsp;dispozitivul&nbsp;pe care &icirc;l folosiți. Astfel, putem face lucruri precum menținerea preferințelor dvs. de limbă &icirc;n cadrul sesiunilor de navigare.</p>\r\n\r\n<p>C&acirc;nd sunteți conectați, colectăm și informațiile pe care le stocăm &icirc;n Contul dvs. Google și pe care le tratăm ca&nbsp;informații cu caracter personal.</p>', NULL, NULL, NULL, '2021-11-29 12:01:27', '2021-11-30 11:31:41'),
(26, 9, 2, 'Политика безопасности данных', 'politika-bezopasnosti-dannyx', NULL, '<h4>Информация, которую мы собираем при использовании Вами наших сервисов</h4>\r\n&nbsp;\r\n\r\n<p>Мы регистрируем информацию о приложениях, браузерах и&nbsp;устройствах, которые Вы используете для доступа к сервисам Google. Это обеспечивает работу таких функций, как автоматическое обновление приложений и затемнение экрана при малом заряде батареи.</p>\r\n\r\n<p>Помимо прочего, мы собираем&nbsp;уникальные идентификаторы, а также такие данные, как тип и настройки браузера и устройства, операционная система, мобильная сеть (включая название оператора и номер телефона) и номер версии приложения. Нами также регистрируется информация о взаимодействии Ваших приложений, браузеров и устройств с нашими сервисами, в том числе&nbsp;IP-адрес, отчеты о сбоях, сведения о действиях в системе, дата и время, когда Вы посетили наш ресурс, и URL, с которого Вы на него перешли (URL перехода).</p>\r\n\r\n<p>Эти данные мы получаем, когда продукт Google с Вашего устройства обращается к нашим серверам, например при установке приложения из Play Store или проверке на наличие обновлений.&nbsp;Устройства Android с приложениями Google Apps&nbsp;периодически связываются с серверами Google и передают данные о своем статусе и подключении к нашим сервисам. К таким данным относятся, в частности, тип устройства, название оператора мобильной связи, отчеты о сбоях и список установленных приложений.</p>', NULL, NULL, NULL, '2021-11-29 12:01:27', '2021-11-30 11:31:41'),
(27, 9, 3, 'Data Security Policy', 'data-security-policy', NULL, '<h4>We want you to understand the types of information we collect as you use our services<br />\r\n&nbsp;</h4>\r\n\r\n<p>We collect information to provide better services to all our users &mdash; from figuring out basic stuff like which language you speak, to more complex things like which&nbsp;ads you&rsquo;ll find most useful,&nbsp;the people who matter most to you online, or which YouTube videos you might like. The information Google collects, and how that information is used, depends on how you use our services and how you manage your privacy controls.</p>\r\n\r\n<p>When you&rsquo;re not signed in to a Google Account, we store the information we collect with&nbsp;unique identifiers&nbsp;tied to the browser, application, or&nbsp;device&nbsp;you&rsquo;re using. This helps us do things like maintain your language preferences across browsing sessions.</p>\r\n\r\n<p>When you&rsquo;re signed in, we also collect information that we store with your Google Account, which we treat as&nbsp;personal information.</p>', NULL, NULL, NULL, '2021-11-29 12:01:27', '2021-11-30 11:31:41'),
(28, 10, 1, 'Recenzii', 'recenzii', NULL, NULL, NULL, NULL, NULL, '2021-12-02 12:58:28', '2021-12-02 12:58:28'),
(29, 10, 2, 'Отзывы', 'otzyvy', NULL, NULL, NULL, NULL, NULL, '2021-12-02 12:58:28', '2021-12-02 12:58:28'),
(30, 10, 3, 'Testimonials', 'testimonials', NULL, NULL, NULL, NULL, NULL, '2021-12-02 12:58:28', '2021-12-02 12:58:28');

-- --------------------------------------------------------

--
-- Структура таблицы `parameters`
--

CREATE TABLE `parameters` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `in_filter` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `multilingual` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `multilingual_title` tinyint NOT NULL DEFAULT '0',
  `multilingual_unit` tinyint NOT NULL DEFAULT '0',
  `main` tinyint NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  `group_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `parameters`
--

INSERT INTO `parameters` (`id`, `type`, `key`, `in_filter`, `multilingual`, `multilingual_title`, `multilingual_unit`, `main`, `position`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 'checkbox', 'type_of_transaction', '1', '1', 1, 0, 0, 1, 0, '2021-11-28 11:27:23', '2021-11-28 11:27:23'),
(2, 'checkbox', 'rooms', '1', '1', 1, 0, 1, 1, 0, '2021-11-28 11:28:16', '2021-12-01 12:34:13'),
(3, 'checkbox', 'condition', '1', '1', 1, 0, 1, 1, 0, '2021-11-28 11:29:48', '2021-12-01 12:34:21'),
(4, 'checkbox', 'residential_fund', '1', '1', 1, 0, 1, 1, 0, '2021-11-28 11:31:04', '2021-12-01 12:34:29'),
(5, 'checkbox', 'sector', '1', '1', 1, 0, 0, 1, 0, '2021-11-28 11:32:05', '2021-11-28 11:32:05'),
(6, 'checkbox', 'property_type', '1', '1', 1, 0, 0, 1, 0, '2021-11-28 11:42:58', '2021-11-28 11:42:58'),
(7, 'checkbox', 'floor', '0', '1', 1, 0, 1, 1, 0, '2021-12-01 13:04:16', '2021-12-01 13:04:16'),
(8, 'checkbox', 'floors', '0', '1', 1, 0, 1, 1, 0, '2021-12-01 13:05:04', '2021-12-01 13:05:04'),
(9, 'checkbox', 'balcony', '0', '1', 1, 0, 1, 1, 0, '2021-12-01 13:06:07', '2021-12-01 13:06:07'),
(10, 'checkbox', 'bathrooms', '0', '1', 1, 0, 1, 1, 0, '2021-12-01 13:07:16', '2021-12-01 13:07:16'),
(11, 'checkbox', 'parking', '0', '1', 1, 0, 1, 1, 0, '2021-12-01 13:08:10', '2021-12-01 13:08:10');

-- --------------------------------------------------------

--
-- Структура таблицы `parameters_translation`
--

CREATE TABLE `parameters_translation` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT NULL,
  `parameter_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `parameters_translation`
--

INSERT INTO `parameters_translation` (`id`, `lang_id`, `parameter_id`, `name`, `unit`, `created_at`, `updated_at`) VALUES
(40, 1, 6, 'Destinație', NULL, '2021-11-28 11:44:55', '2021-11-28 11:44:55'),
(41, 2, 6, 'Назначение', NULL, '2021-11-28 11:44:55', '2021-11-28 11:44:55'),
(42, 3, 6, 'Property Type', NULL, '2021-11-28 11:44:55', '2021-11-28 11:44:55'),
(43, 1, 1, 'Tip tranzacție', NULL, '2021-11-28 11:45:07', '2021-11-28 11:45:07'),
(44, 2, 1, 'Тип сделки', NULL, '2021-11-28 11:45:07', '2021-11-28 11:45:07'),
(45, 3, 1, 'Type of transaction', NULL, '2021-11-28 11:45:07', '2021-11-28 11:45:07'),
(55, 1, 5, 'Sector', NULL, '2021-11-28 11:46:22', '2021-11-28 11:46:22'),
(56, 2, 5, 'Сектор', NULL, '2021-11-28 11:46:22', '2021-11-28 11:46:22'),
(57, 3, 5, 'Sector', NULL, '2021-11-28 11:46:22', '2021-11-28 11:46:22'),
(61, 1, 2, 'Camere', NULL, '2021-12-01 12:34:13', '2021-12-01 12:34:13'),
(62, 2, 2, 'Комнаты', NULL, '2021-12-01 12:34:13', '2021-12-01 12:34:13'),
(63, 3, 2, 'Rooms', NULL, '2021-12-01 12:34:13', '2021-12-01 12:34:13'),
(64, 1, 3, 'Starea', NULL, '2021-12-01 12:34:21', '2021-12-01 12:34:21'),
(65, 2, 3, 'Состояние', NULL, '2021-12-01 12:34:21', '2021-12-01 12:34:21'),
(66, 3, 3, 'Condition', NULL, '2021-12-01 12:34:21', '2021-12-01 12:34:21'),
(67, 1, 4, 'Bloc', NULL, '2021-12-01 12:34:29', '2021-12-01 12:34:29'),
(68, 2, 4, 'Жилой фонд', NULL, '2021-12-01 12:34:29', '2021-12-01 12:34:29'),
(69, 3, 4, 'Residential fund', NULL, '2021-12-01 12:34:29', '2021-12-01 12:34:29'),
(88, 1, 7, 'Etaj', NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(89, 2, 7, 'Этаж', NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(90, 3, 7, 'Floor', NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(97, 1, 9, 'Balcon', NULL, '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(98, 2, 9, 'Балкон', NULL, '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(99, 3, 9, 'Balcony', NULL, '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(100, 1, 10, 'Grup sanitar', NULL, '2021-12-01 13:13:12', '2021-12-01 13:13:12'),
(101, 2, 10, 'Санузел', NULL, '2021-12-01 13:13:12', '2021-12-01 13:13:12'),
(102, 3, 10, 'Bathrooms', NULL, '2021-12-01 13:13:12', '2021-12-01 13:13:12'),
(106, 1, 11, 'Parcare', NULL, '2021-12-01 13:15:57', '2021-12-01 13:15:57'),
(107, 2, 11, 'Парковка', NULL, '2021-12-01 13:15:57', '2021-12-01 13:15:57'),
(108, 3, 11, 'Parking', NULL, '2021-12-01 13:15:57', '2021-12-01 13:15:57'),
(109, 1, 8, 'Numărul de etaje', NULL, '2021-12-01 13:21:39', '2021-12-01 13:21:39'),
(110, 2, 8, 'Этажность', NULL, '2021-12-01 13:21:39', '2021-12-01 13:21:39'),
(111, 3, 8, 'Floors', NULL, '2021-12-01 13:21:39', '2021-12-01 13:21:39');

-- --------------------------------------------------------

--
-- Структура таблицы `parameters_values_products`
--

CREATE TABLE `parameters_values_products` (
  `id` int UNSIGNED NOT NULL,
  `parameter_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `parameter_value_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `parameters_values_products`
--

INSERT INTO `parameters_values_products` (`id`, `parameter_id`, `product_id`, `parameter_value_id`, `created_at`, `updated_at`) VALUES
(229, 5, 5, NULL, '2021-12-02 18:02:29', '2021-12-02 18:02:29'),
(230, 6, 5, NULL, '2021-12-02 18:02:29', '2021-12-02 18:02:29'),
(331, 1, 1, 1, '2021-12-03 18:25:27', '2021-12-03 18:25:27'),
(332, 2, 1, 3, '2021-12-03 18:25:27', '2021-12-03 18:25:27'),
(333, 3, 1, 8, '2021-12-03 18:25:27', '2021-12-03 18:25:27'),
(334, 4, 1, 10, '2021-12-03 18:25:27', '2021-12-03 18:25:27'),
(335, 5, 1, 13, '2021-12-03 18:25:27', '2021-12-03 18:25:27'),
(336, 7, 1, 27, '2021-12-03 18:25:27', '2021-12-03 18:25:27'),
(337, 8, 1, 48, '2021-12-03 18:25:27', '2021-12-03 18:25:27'),
(338, 9, 1, 57, '2021-12-03 18:25:27', '2021-12-03 18:25:27'),
(339, 10, 1, NULL, '2021-12-03 18:25:27', '2021-12-03 18:25:27'),
(340, 11, 1, 66, '2021-12-03 18:25:27', '2021-12-03 18:25:27'),
(341, 1, 2, 1, '2021-12-03 18:26:47', '2021-12-03 18:26:47'),
(342, 2, 2, 4, '2021-12-03 18:26:47', '2021-12-03 18:26:47'),
(343, 3, 2, 8, '2021-12-03 18:26:47', '2021-12-03 18:26:47'),
(344, 4, 2, 10, '2021-12-03 18:26:47', '2021-12-03 18:26:47'),
(345, 5, 2, 12, '2021-12-03 18:26:47', '2021-12-03 18:26:47'),
(346, 7, 2, NULL, '2021-12-03 18:26:47', '2021-12-03 18:26:47'),
(347, 8, 2, NULL, '2021-12-03 18:26:47', '2021-12-03 18:26:47'),
(348, 9, 2, NULL, '2021-12-03 18:26:47', '2021-12-03 18:26:47'),
(349, 10, 2, NULL, '2021-12-03 18:26:47', '2021-12-03 18:26:47'),
(350, 11, 2, NULL, '2021-12-03 18:26:47', '2021-12-03 18:26:47'),
(351, 1, 4, 2, '2021-12-03 18:27:56', '2021-12-03 18:27:56'),
(352, 2, 4, 5, '2021-12-03 18:27:56', '2021-12-03 18:27:56'),
(353, 3, 4, 9, '2021-12-03 18:27:56', '2021-12-03 18:27:56'),
(354, 4, 4, 11, '2021-12-03 18:27:56', '2021-12-03 18:27:56'),
(355, 5, 4, 16, '2021-12-03 18:27:56', '2021-12-03 18:27:56'),
(356, 7, 4, NULL, '2021-12-03 18:27:56', '2021-12-03 18:27:56'),
(357, 8, 4, NULL, '2021-12-03 18:27:56', '2021-12-03 18:27:56'),
(358, 9, 4, NULL, '2021-12-03 18:27:56', '2021-12-03 18:27:56'),
(359, 10, 4, NULL, '2021-12-03 18:27:56', '2021-12-03 18:27:56'),
(360, 11, 4, NULL, '2021-12-03 18:27:56', '2021-12-03 18:27:56'),
(361, 1, 3, 1, '2021-12-03 18:29:07', '2021-12-03 18:29:07'),
(362, 2, 3, 6, '2021-12-03 18:29:07', '2021-12-03 18:29:07'),
(363, 5, 3, 16, '2021-12-03 18:29:07', '2021-12-03 18:29:07'),
(364, 8, 3, NULL, '2021-12-03 18:29:07', '2021-12-03 18:29:07'),
(365, 10, 3, NULL, '2021-12-03 18:29:07', '2021-12-03 18:29:07'),
(366, 11, 3, NULL, '2021-12-03 18:29:07', '2021-12-03 18:29:07'),
(377, 1, 6, NULL, '2021-12-03 19:14:46', '2021-12-03 19:14:46'),
(378, 2, 6, NULL, '2021-12-03 19:14:46', '2021-12-03 19:14:46'),
(379, 3, 6, NULL, '2021-12-03 19:14:46', '2021-12-03 19:14:46'),
(380, 4, 6, NULL, '2021-12-03 19:14:46', '2021-12-03 19:14:46'),
(381, 5, 6, NULL, '2021-12-03 19:14:46', '2021-12-03 19:14:46'),
(382, 7, 6, NULL, '2021-12-03 19:14:46', '2021-12-03 19:14:46'),
(383, 8, 6, NULL, '2021-12-03 19:14:46', '2021-12-03 19:14:46'),
(384, 9, 6, NULL, '2021-12-03 19:14:46', '2021-12-03 19:14:46'),
(385, 10, 6, NULL, '2021-12-03 19:14:46', '2021-12-03 19:14:46'),
(386, 11, 6, NULL, '2021-12-03 19:14:46', '2021-12-03 19:14:46');

-- --------------------------------------------------------

--
-- Структура таблицы `parameters_values_products_translation`
--

CREATE TABLE `parameters_values_products_translation` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT NULL,
  `param_val_id` int UNSIGNED DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `parameter_categories`
--

CREATE TABLE `parameter_categories` (
  `id` int UNSIGNED NOT NULL,
  `parameter_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `parameter_categories`
--

INSERT INTO `parameter_categories` (`id`, `parameter_id`, `category_id`, `position`, `created_at`, `updated_at`) VALUES
(1, 6, 3, 1, '2021-11-28 11:44:55', '2021-11-28 11:44:55'),
(2, 1, 1, 1, '2021-11-28 11:45:07', '2021-11-28 11:45:07'),
(3, 1, 2, 1, '2021-11-28 11:45:07', '2021-11-28 11:45:07'),
(9, 5, 1, 1, '2021-11-28 11:46:22', '2021-11-28 11:46:22'),
(10, 5, 2, 1, '2021-11-28 11:46:22', '2021-11-28 11:46:22'),
(11, 5, 3, 1, '2021-11-28 11:46:22', '2021-11-28 11:46:22'),
(13, 2, 1, 1, '2021-12-01 12:34:13', '2021-12-01 12:34:13'),
(14, 2, 2, 1, '2021-12-01 12:34:13', '2021-12-01 12:34:13'),
(15, 3, 1, 1, '2021-12-01 12:34:21', '2021-12-01 12:34:21'),
(16, 4, 1, 1, '2021-12-01 12:34:29', '2021-12-01 12:34:29'),
(18, 7, 1, 1, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(21, 9, 1, 1, '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(22, 10, 1, 1, '2021-12-01 13:13:13', '2021-12-01 13:13:13'),
(23, 10, 2, 1, '2021-12-01 13:13:13', '2021-12-01 13:13:13'),
(26, 11, 1, 1, '2021-12-01 13:15:57', '2021-12-01 13:15:57'),
(27, 11, 2, 1, '2021-12-01 13:15:57', '2021-12-01 13:15:57'),
(28, 8, 1, 1, '2021-12-01 13:21:40', '2021-12-01 13:21:40'),
(29, 8, 2, 1, '2021-12-01 13:21:40', '2021-12-01 13:21:40');

-- --------------------------------------------------------

--
-- Структура таблицы `parameter_values`
--

CREATE TABLE `parameter_values` (
  `id` int UNSIGNED NOT NULL,
  `parameter_id` int UNSIGNED DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `parameter_values`
--

INSERT INTO `parameter_values` (`id`, `parameter_id`, `image`, `suffix`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, '2021-11-28 11:33:30', '2021-11-28 11:33:30'),
(2, 1, NULL, NULL, '2021-11-28 11:33:30', '2021-11-28 11:33:30'),
(3, 2, NULL, NULL, '2021-11-28 11:34:12', '2021-11-28 11:34:12'),
(4, 2, NULL, NULL, '2021-11-28 11:34:12', '2021-11-28 11:34:12'),
(5, 2, NULL, NULL, '2021-11-28 11:34:12', '2021-11-28 11:34:12'),
(6, 2, NULL, NULL, '2021-11-28 11:34:12', '2021-11-28 11:34:12'),
(7, 3, NULL, NULL, '2021-11-28 11:36:07', '2021-11-28 11:36:07'),
(8, 3, NULL, NULL, '2021-11-28 11:36:07', '2021-11-28 11:36:07'),
(9, 3, NULL, NULL, '2021-11-28 11:36:07', '2021-11-28 11:36:07'),
(10, 4, NULL, NULL, '2021-11-28 11:37:09', '2021-11-28 11:37:09'),
(11, 4, NULL, NULL, '2021-11-28 11:37:09', '2021-11-28 11:37:09'),
(12, 5, NULL, NULL, '2021-11-28 11:40:58', '2021-11-28 11:40:58'),
(13, 5, NULL, NULL, '2021-11-28 11:40:58', '2021-11-28 11:40:58'),
(14, 5, NULL, NULL, '2021-11-28 11:40:58', '2021-11-28 11:40:58'),
(15, 5, NULL, NULL, '2021-11-28 11:40:58', '2021-11-28 11:40:58'),
(16, 5, NULL, NULL, '2021-11-28 11:40:58', '2021-11-28 11:40:58'),
(17, 5, NULL, NULL, '2021-11-28 11:40:58', '2021-11-28 11:40:58'),
(18, 5, NULL, NULL, '2021-11-28 11:40:58', '2021-11-28 11:40:58'),
(19, 5, NULL, NULL, '2021-11-28 11:40:58', '2021-11-28 11:40:58'),
(20, 5, NULL, NULL, '2021-11-28 11:40:58', '2021-11-28 11:40:58'),
(21, 5, NULL, NULL, '2021-11-28 11:40:58', '2021-11-28 11:40:58'),
(22, 6, NULL, NULL, '2021-11-28 11:44:44', '2021-11-28 11:44:44'),
(23, 6, NULL, NULL, '2021-11-28 11:44:44', '2021-11-28 11:44:44'),
(24, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(25, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(26, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(27, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(28, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(29, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(30, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(31, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(32, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(33, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(34, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(35, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(36, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(37, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(38, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(39, 7, NULL, NULL, '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(40, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(41, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(42, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(43, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(44, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(45, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(46, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(47, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(48, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(49, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(50, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(51, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(52, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(53, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(54, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(55, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(56, 8, NULL, NULL, '2021-12-01 13:12:08', '2021-12-01 13:12:08'),
(57, 9, NULL, NULL, '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(58, 9, NULL, NULL, '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(59, 9, NULL, NULL, '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(60, 9, NULL, NULL, '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(61, 10, NULL, NULL, '2021-12-01 13:13:12', '2021-12-01 13:13:12'),
(62, 10, NULL, NULL, '2021-12-01 13:13:12', '2021-12-01 13:13:12'),
(63, 10, NULL, NULL, '2021-12-01 13:13:12', '2021-12-01 13:13:12'),
(64, 10, NULL, NULL, '2021-12-01 13:13:13', '2021-12-01 13:13:13'),
(65, 11, NULL, NULL, '2021-12-01 13:14:11', '2021-12-01 13:14:11'),
(66, 11, NULL, NULL, '2021-12-01 13:15:57', '2021-12-01 13:15:57');

-- --------------------------------------------------------

--
-- Структура таблицы `parameter_values_translation`
--

CREATE TABLE `parameter_values_translation` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT NULL,
  `parameter_value_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `parameter_values_translation`
--

INSERT INTO `parameter_values_translation` (`id`, `lang_id`, `parameter_value_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Vanzare', '2021-11-28 11:33:30', '2021-11-28 11:45:07'),
(2, 2, 1, 'Продажа', '2021-11-28 11:33:30', '2021-11-28 11:45:07'),
(3, 3, 1, 'Sale', '2021-11-28 11:33:30', '2021-11-28 11:45:07'),
(4, 1, 2, 'Chirie', '2021-11-28 11:33:30', '2021-11-28 11:45:07'),
(5, 2, 2, 'Аренда', '2021-11-28 11:33:30', '2021-11-28 11:45:07'),
(6, 3, 2, 'Rent', '2021-11-28 11:33:30', '2021-11-28 11:45:07'),
(7, 1, 3, '1', '2021-11-28 11:34:12', '2021-12-01 12:34:13'),
(8, 2, 3, '1', '2021-11-28 11:34:12', '2021-12-01 12:34:13'),
(9, 3, 3, '1', '2021-11-28 11:34:12', '2021-12-01 12:34:13'),
(10, 1, 4, '2', '2021-11-28 11:34:12', '2021-12-01 12:34:13'),
(11, 2, 4, '2', '2021-11-28 11:34:12', '2021-12-01 12:34:13'),
(12, 3, 4, '2', '2021-11-28 11:34:12', '2021-12-01 12:34:13'),
(13, 1, 5, '3', '2021-11-28 11:34:12', '2021-12-01 12:34:13'),
(14, 2, 5, '3', '2021-11-28 11:34:12', '2021-12-01 12:34:13'),
(15, 3, 5, '3', '2021-11-28 11:34:12', '2021-12-01 12:34:13'),
(16, 1, 6, '4+', '2021-11-28 11:34:12', '2021-12-01 12:34:13'),
(17, 2, 6, '4+', '2021-11-28 11:34:12', '2021-12-01 12:34:13'),
(18, 3, 6, '4+', '2021-11-28 11:34:12', '2021-12-01 12:34:13'),
(19, 1, 7, 'Varianta albă', '2021-11-28 11:36:07', '2021-12-01 12:34:21'),
(20, 2, 7, 'Белый вариант', '2021-11-28 11:36:07', '2021-12-01 12:34:21'),
(21, 3, 7, 'Without repair', '2021-11-28 11:36:07', '2021-12-01 12:34:21'),
(22, 1, 8, 'Euroreparație', '2021-11-28 11:36:07', '2021-12-01 12:34:21'),
(23, 2, 8, 'Евроремонт', '2021-11-28 11:36:07', '2021-12-01 12:34:21'),
(24, 3, 8, 'Brand new', '2021-11-28 11:36:07', '2021-12-01 12:34:21'),
(25, 1, 9, 'Stare locativă', '2021-11-28 11:36:07', '2021-12-01 12:34:21'),
(26, 2, 9, 'Жилой вариант', '2021-11-28 11:36:07', '2021-12-01 12:34:21'),
(27, 3, 9, 'Used', '2021-11-28 11:36:07', '2021-12-01 12:34:21'),
(28, 1, 10, 'Bloc nou', '2021-11-28 11:37:09', '2021-12-01 12:34:29'),
(29, 2, 10, 'Новострой', '2021-11-28 11:37:09', '2021-12-01 12:34:29'),
(30, 3, 10, 'New', '2021-11-28 11:37:09', '2021-12-01 12:34:29'),
(31, 1, 11, 'Bloc vechi', '2021-11-28 11:37:09', '2021-12-01 12:34:29'),
(32, 2, 11, 'Вторичное жилье', '2021-11-28 11:37:09', '2021-12-01 12:34:29'),
(33, 3, 11, 'Used', '2021-11-28 11:37:09', '2021-12-01 12:34:29'),
(34, 1, 12, 'Botanica', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(35, 2, 12, 'Ботаника', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(36, 3, 12, 'Botanica', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(37, 1, 13, 'Centru', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(38, 2, 13, 'Центр', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(39, 3, 13, 'City Center', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(40, 1, 14, 'Rascani', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(41, 2, 14, 'Рышкановка', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(42, 3, 14, 'Rascani', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(43, 1, 15, 'Telecentru', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(44, 2, 15, 'Телецентр', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(45, 3, 15, 'Telecentru', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(46, 1, 16, 'Buiucani', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(47, 2, 16, 'Буюканы', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(48, 3, 16, 'Buiucani', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(49, 1, 17, 'Posta Veche', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(50, 2, 17, 'Старая почта', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(51, 3, 17, 'Posta Veche', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(52, 1, 18, 'Ciocana', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(53, 2, 18, 'Чеканы', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(54, 3, 18, 'Ciocana', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(55, 1, 19, 'Sculeni', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(56, 2, 19, 'Скулень', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(57, 3, 19, 'Sculeni', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(58, 1, 20, 'Durlesti', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(59, 2, 20, 'Дурлешты', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(60, 3, 20, 'Durlesti', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(61, 1, 21, 'Malina Mica', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(62, 2, 21, 'Малая Малина', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(63, 3, 21, 'Malina Mica', '2021-11-28 11:40:58', '2021-11-28 11:46:22'),
(64, 1, 22, 'Agricole', '2021-11-28 11:44:44', '2021-11-28 11:44:55'),
(65, 2, 22, 'Под сельское хозяйство', '2021-11-28 11:44:44', '2021-11-28 11:44:55'),
(66, 3, 22, 'For agriculture', '2021-11-28 11:44:44', '2021-11-28 11:44:55'),
(67, 1, 23, 'Pentru construcții', '2021-11-28 11:44:44', '2021-11-28 11:44:55'),
(68, 2, 23, 'Под строительство', '2021-11-28 11:44:44', '2021-11-28 11:44:55'),
(69, 3, 23, 'For construction', '2021-11-28 11:44:44', '2021-11-28 11:44:55'),
(70, 1, 24, '1', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(71, 2, 24, '1', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(72, 3, 24, '1', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(73, 1, 25, '2', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(74, 2, 25, '2', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(75, 3, 25, '2', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(76, 1, 26, '3', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(77, 2, 26, '3', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(78, 3, 26, '3', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(79, 1, 27, '4', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(80, 2, 27, '4', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(81, 3, 27, '4', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(82, 1, 28, '5', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(83, 2, 28, '5', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(84, 3, 28, '5', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(85, 1, 29, '6', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(86, 2, 29, '6', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(87, 3, 29, '6', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(88, 1, 30, '7', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(89, 2, 30, '7', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(90, 3, 30, '7', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(91, 1, 31, '8', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(92, 2, 31, '8', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(93, 3, 31, '8', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(94, 1, 32, '9', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(95, 2, 32, '9', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(96, 3, 32, '9', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(97, 1, 33, '10', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(98, 2, 33, '10', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(99, 3, 33, '10', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(100, 1, 34, '11', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(101, 2, 34, '11', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(102, 3, 34, '11', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(103, 1, 35, '12', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(104, 2, 35, '12', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(105, 3, 35, '12', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(106, 1, 36, '13', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(107, 2, 36, '13', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(108, 3, 36, '13', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(109, 1, 37, '14', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(110, 2, 37, '14', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(111, 3, 37, '14', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(112, 1, 38, '15', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(113, 2, 38, '15', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(114, 3, 38, '15', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(115, 1, 39, '16', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(116, 2, 39, '16', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(117, 3, 39, '16', '2021-12-01 13:10:18', '2021-12-01 13:10:18'),
(118, 1, 40, '1', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(119, 2, 40, '1', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(120, 3, 40, '1', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(121, 1, 41, '2', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(122, 2, 41, '2', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(123, 3, 41, '2', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(124, 1, 42, '3', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(125, 2, 42, '3', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(126, 3, 42, '3', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(127, 1, 43, '4', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(128, 2, 43, '4', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(129, 3, 43, '4', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(130, 1, 44, '5', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(131, 2, 44, '5', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(132, 3, 44, '5', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(133, 1, 45, '6', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(134, 2, 45, '6', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(135, 3, 45, '6', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(136, 1, 46, '7', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(137, 2, 46, '7', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(138, 3, 46, '7', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(139, 1, 47, '8', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(140, 2, 47, '8', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(141, 3, 47, '8', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(142, 1, 48, '9', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(143, 2, 48, '9', '2021-12-01 13:12:08', '2021-12-01 13:21:39'),
(144, 3, 48, '9', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(145, 1, 49, '10', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(146, 2, 49, '10', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(147, 3, 49, '10', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(148, 1, 50, '11', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(149, 2, 50, '11', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(150, 3, 50, '11', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(151, 1, 51, '12', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(152, 2, 51, '12', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(153, 3, 51, '12', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(154, 1, 52, '13', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(155, 2, 52, '13', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(156, 3, 52, '13', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(157, 1, 53, '14', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(158, 2, 53, '14', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(159, 3, 53, '14', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(160, 1, 54, '14', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(161, 2, 54, '14', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(162, 3, 54, '14', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(163, 1, 55, '15', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(164, 2, 55, '15', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(165, 3, 55, '15', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(166, 1, 56, '16', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(167, 2, 56, '16', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(168, 3, 56, '16', '2021-12-01 13:12:08', '2021-12-01 13:21:40'),
(169, 1, 57, '1', '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(170, 2, 57, '1', '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(171, 3, 57, '1', '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(172, 1, 58, '2', '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(173, 2, 58, '2', '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(174, 3, 58, '2', '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(175, 1, 59, '3', '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(176, 2, 59, '3', '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(177, 3, 59, '3', '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(178, 1, 60, '4', '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(179, 2, 60, '4', '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(180, 3, 60, '4', '2021-12-01 13:12:46', '2021-12-01 13:12:46'),
(181, 1, 61, '1', '2021-12-01 13:13:12', '2021-12-01 13:13:12'),
(182, 2, 61, '1', '2021-12-01 13:13:12', '2021-12-01 13:13:12'),
(183, 3, 61, '1', '2021-12-01 13:13:12', '2021-12-01 13:13:12'),
(184, 1, 62, '2', '2021-12-01 13:13:12', '2021-12-01 13:13:12'),
(185, 2, 62, '2', '2021-12-01 13:13:12', '2021-12-01 13:13:12'),
(186, 3, 62, '2', '2021-12-01 13:13:12', '2021-12-01 13:13:12'),
(187, 1, 63, '3', '2021-12-01 13:13:13', '2021-12-01 13:13:13'),
(188, 2, 63, '3', '2021-12-01 13:13:13', '2021-12-01 13:13:13'),
(189, 3, 63, '3', '2021-12-01 13:13:13', '2021-12-01 13:13:13'),
(190, 1, 64, '4', '2021-12-01 13:13:13', '2021-12-01 13:13:13'),
(191, 2, 64, '4', '2021-12-01 13:13:13', '2021-12-01 13:13:13'),
(192, 3, 64, '4', '2021-12-01 13:13:13', '2021-12-01 13:13:13'),
(193, 1, 65, 'Închisă', '2021-12-01 13:14:11', '2021-12-01 13:15:57'),
(194, 2, 65, 'Закрытая', '2021-12-01 13:14:11', '2021-12-01 13:15:57'),
(195, 3, 65, 'Closed', '2021-12-01 13:14:11', '2021-12-01 13:15:57'),
(196, 1, 66, 'Deschisă', '2021-12-01 13:15:57', '2021-12-01 13:15:57'),
(197, 2, 66, 'Откытая', '2021-12-01 13:15:57', '2021-12-01 13:15:57'),
(198, 3, 66, 'Open', '2021-12-01 13:15:57', '2021-12-01 13:15:57');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `tag_id` int DEFAULT '0',
  `agent_id` int DEFAULT '0',
  `alias` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `surface` int DEFAULT NULL,
  `position` int UNSIGNED DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `recommended` tinyint NOT NULL DEFAULT '0',
  `iframe` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `category_id`, `tag_id`, `agent_id`, `alias`, `code`, `price`, `surface`, `position`, `active`, `recommended`, `iframe`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 'ciuflea', 'S75118791', '83500.00', 130, 1, 1, 1, NULL, '2021-11-28 12:03:10', '2021-12-03 18:29:52'),
(2, 1, 2, 3, 'prigoreni', 'N74726785', '75000.00', 90, 3, 1, 1, NULL, '2021-11-28 12:10:10', '2021-12-03 18:29:52'),
(3, 2, 2, 2, 'm-lataretu', 'E75082847', '360000.00', 300, 1, 1, 1, NULL, '2021-11-28 12:14:16', '2021-11-29 19:24:11'),
(4, 1, 3, 2, 'l-deleanu', 'I75096700', '300.00', 105, 4, 1, 1, NULL, '2021-11-29 18:03:10', '2021-12-03 18:29:52'),
(5, 3, 0, 0, 'test', 'vfdvdf', '1.00', 1, 1, 1, 1, NULL, '2021-12-02 17:55:56', '2021-12-02 18:02:29'),
(6, 1, 0, 0, 'lev-tolstoi', '493199', '50000.00', NULL, 2, 1, 1, '<iframe width=\"200\" height=\"350\" frameborder=\"0\" style=\"border:0\"        src=\"https://www.google.com/maps/embed/v1/place?q=mun%2C%20Chi%C8%99in%C4%83u%2C%20str.%20Bucure%C8%99ti%2041&key=AIzaSyAYKSJm9-nkocRyrbwFSuC68EErtJToSxE\"\r\n                allowfullscreen></iframe>', '2021-12-03 17:52:18', '2021-12-03 19:14:46');

-- --------------------------------------------------------

--
-- Структура таблицы `products_translation`
--

CREATE TABLE `products_translation` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` text COLLATE utf8_unicode_ci,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `atributes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `aditionall` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seo_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seo_title` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seo_keywords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `products_translation`
--

INSERT INTO `products_translation` (`id`, `lang_id`, `product_id`, `name`, `slug`, `subtitle`, `description`, `body`, `atributes`, `aditionall`, `seo_text`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Ciuflea', 'ciuflea-s75118791', 'Centru, Chișinău', 'Etajul 5 este compus dintr-un living de 70mp cu tavan inalt de 6 metri si deschidere catre o terasa de 30mp, bucatarie deschisa si complet echipata, dormitor/birou si o baie. La etajul 6 sunt cele 2 dormitoare matrimoniale cu bai proprii.', '<p>Situat langa Parcul Herastrau, in apropierea lacului si a restaurantelor, acest duplex spectaculos se afla la etajele 5 si 6 intr-un imobil 2S+P+6 finalizat in 2008, fiind luminat toata ziua datorita orientarii catre Sud.Are o suprafata de 300mp construiti (197mp utili si 30mp terasa).</p>\r\n\r\n<p>Etajul 5 este compus dintr-un living de 70mp cu tavan inalt de 6 metri si deschidere catre o terasa de 30mp, bucatarie deschisa si complet echipata, dormitor/birou si o baie. La etajul 6 sunt cele 2 dormitoare matrimoniale cu bai proprii.</p>\r\n\r\n<p>Cladirea este pazita 24/7, supravegheata video,cu un loc de parcare subteran si spatiu de depozitare.Datorita locatiei premium si a spatiului generos acest duplex este ideal pentru rezidenta unei familii numeroase.</p>\r\n\r\n<h4>Avantaje</h4>\r\n\r\n<ul>\r\n	<li>1 locuri de parare</li>\r\n	<li>Boxa la subsol</li>\r\n	<li>Lift</li>\r\n	<li>Bucatarie deschisa</li>\r\n	<li>Bacatarie utilata</li>\r\n	<li>Apometre</li>\r\n	<li>Contor căldură</li>\r\n	<li>Contor electric</li>\r\n	<li>Contor căldură</li>\r\n	<li>Aragaz</li>\r\n	<li>Frigider</li>\r\n	<li>Scară interioară</li>\r\n	<li>Centrală imobil</li>\r\n	<li>Nemobilat</li>\r\n	<li>Calorifere</li>\r\n	<li>Mobilat Complet</li>\r\n	<li>Bucătărie Mobilată</li>\r\n	<li>Parțial Mobilat</li>\r\n	<li>Mobilat Lux</li>\r\n	<li>Aer condiționat</li>\r\n</ul>', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:03:10', '2021-12-03 18:25:27'),
(2, 2, 1, 'Чуфля', 'cuflya-s75118791', 'Центр, Кишинев', 'Пятый этаж состоит из гостиной 70 кв.м с потолком 6 метров и выходом на террасу 30 кв.м, открытой и полностью оборудованной кухни, спальни / офиса и ванной комнаты. На 6-м этаже расположены 2 спальни с двуспальными кроватями и собственными ванными комнатами.', '<p>Этот впечатляющий дуплекс расположен недалеко от парка Херастрау, рядом с озером и ресторанами, на 5-м и 6-м этажах в здании 2S + Gf + 6, построенном в 2008 году и освещенном весь день из-за ориентации на юг. площадью 300 кв.м. (197 кв.м. полезная площадь и 30 кв.м. терраса).</p>\r\n\r\n<p>Пятый этаж состоит из гостиной 70 кв.м с потолком 6 метров и выходом на террасу 30 кв.м, открытой и полностью оборудованной кухни, спальни / офиса и ванной комнаты. На 6-м этаже расположены 2 спальни с двуспальными кроватями и собственными ванными комнатами.</p>\r\n\r\n<h4>Avantaje</h4>\r\n\r\n<ul>\r\n	<li>1 парковочное место</li>\r\n	<li>Boxa la subsol</li>\r\n	<li>Lift</li>\r\n	<li>Bucatarie deschisa</li>\r\n	<li>Bacatarie utilata</li>\r\n	<li>Apometre</li>\r\n	<li>Contor căldură</li>\r\n	<li>Contor electric</li>\r\n	<li>Contor căldură</li>\r\n	<li>Aragaz</li>\r\n	<li>Frigider</li>\r\n	<li>Scară interioară</li>\r\n	<li>Centrală imobil</li>\r\n	<li>Nemobilat</li>\r\n	<li>Calorifere</li>\r\n	<li>Mobilat Complet</li>\r\n	<li>Bucătărie Mobilată</li>\r\n	<li>Parțial Mobilat</li>\r\n	<li>Mobilat Lux</li>\r\n	<li>Aer condiționat</li>\r\n</ul>', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:03:10', '2021-12-03 18:25:27'),
(3, 3, 1, 'Ciuflea', 'ciuflea-s75118791', 'Center City, Chișinău', 'The 5th floor is composed of a living room of 70sqm with a ceiling of 6 meters high and opening to a terrace of 30sqm, open and fully equipped kitchen, bedroom / office and a bathroom. On the 6th floor are the 2 double bedrooms with private bathrooms.', '<p>Located near Herastrau Park, near the lake and restaurants, this spectacular duplex is located on the 5th and 6th floors in a 2S + Gf + 6 building completed in 2008, being lit all day due to the orientation to the South. It has an area of ​​300sqm built (197sqm usable and 30sqm terrace).</p>\r\n\r\n<p>The 5th floor is composed of a living room of 70sqm with a ceiling of 6 meters high and opening to a terrace of 30sqm, open and fully equipped kitchen, bedroom / office and a bathroom. On the 6th floor are the 2 double bedrooms with private bathrooms.</p>\r\n\r\n<p>The building is guarded 24/7, video-surveilled, with an underground parking space and storage space. Due to the premium location and the generous space, this duplex is ideal for the residence of a large family.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4>Avantaje</h4>\r\n\r\n<ul>\r\n	<li>1 locuri de parare</li>\r\n	<li>Boxa la subsol</li>\r\n	<li>Lift</li>\r\n	<li>Bucatarie deschisa</li>\r\n	<li>Bacatarie utilata</li>\r\n	<li>Apometre</li>\r\n	<li>Contor căldură</li>\r\n	<li>Contor electric</li>\r\n	<li>Contor căldură</li>\r\n	<li>Aragaz</li>\r\n	<li>Frigider</li>\r\n	<li>Scară interioară</li>\r\n	<li>Centrală imobil</li>\r\n	<li>Nemobilat</li>\r\n	<li>Calorifere</li>\r\n	<li>Mobilat Complet</li>\r\n	<li>Bucătărie Mobilată</li>\r\n	<li>Parțial Mobilat</li>\r\n	<li>Mobilat Lux</li>\r\n	<li>Aer condiționat</li>\r\n</ul>', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:03:10', '2021-12-03 18:25:27'),
(4, 1, 2, 'Prigoreni', 'prigoreni-n74726785', 'Botanica, Chișinău', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:10:10', '2021-12-03 18:26:47'),
(5, 2, 2, 'Пригорень', 'prigoren-n74726785', 'Ботаника, Кишинев', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:10:10', '2021-12-03 18:26:47'),
(6, 3, 2, 'Prigoreni', 'prigoreni-n74726785', 'Botanica, Chișinău', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:10:10', '2021-12-03 18:26:47'),
(7, 1, 3, 'M. Lataretu', 'm-lataretu-e75082847', 'Buiucani, Chisinau', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:14:16', '2021-12-03 18:29:07'),
(8, 2, 3, 'М. Лэтэрецу', 'm-leterecu-e75082847', 'Буюканы, Кишинев', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:14:16', '2021-12-03 18:29:07'),
(9, 3, 3, 'M. Lataretu', 'm-lataretu-e75082847', 'Buiucani, Chisinau', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-28 12:14:16', '2021-12-03 18:29:07'),
(10, 1, 4, 'L. DELEANU', 'l-deleanu-i75096700', 'Buiucani, Chișinău', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-29 18:03:10', '2021-12-03 18:27:56'),
(11, 2, 4, 'Л. ДЕЛЯНУ', 'l-delyanu-i75096700', 'Буюканы, Кишинев', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-29 18:03:10', '2021-12-03 18:27:56'),
(12, 3, 4, 'L. DELEANU', 'l-deleanu-i75096700', 'Buiucani, Chișinău', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-29 18:03:10', '2021-12-03 18:27:56'),
(13, 1, 5, 'test', 'test-vfdvdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-02 17:55:56', '2021-12-02 18:02:29'),
(14, 2, 5, 'test', 'test-vfdvdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-02 17:55:56', '2021-12-02 18:02:29'),
(15, 3, 5, 'test', 'test-vfdvdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-02 17:55:56', '2021-12-02 18:02:29'),
(16, 1, 6, 'Lev Tolstoi', 'lev-tolstoi-493199', 'Telecentru, Chisinau', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-03 17:52:18', '2021-12-03 19:14:46'),
(17, 2, 6, 'Лев Толстой', 'lev-tolstoi-493199', 'Телецентр, Кишинев', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-03 17:52:18', '2021-12-03 19:14:46'),
(18, 3, 6, 'Lev Tolstoi', 'lev-tolstoi-493199', 'Telecentru, Chisinau', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-03 17:52:18', '2021-12-03 19:14:46');

-- --------------------------------------------------------

--
-- Структура таблицы `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `alias` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_sale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_rent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` tinyint DEFAULT NULL,
  `on_home` tinyint DEFAULT NULL,
  `position` tinyint DEFAULT NULL,
  `succesion` int NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `product_categories`
--

INSERT INTO `product_categories` (`id`, `parent_id`, `alias`, `number`, `unit`, `link_sale`, `link_rent`, `level`, `on_home`, `position`, `succesion`, `active`, `icon`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, NULL, '&#13217;', 'parameters%5B1%5D%5B%5D=1', 'parameters%5B1%5D%5B%5D=2', 1, NULL, 2, 1, 1, '61a4ffe29b326-cat1.jpeg', '2021-11-28 11:24:19', '2021-12-02 16:05:05'),
(2, 0, NULL, NULL, '&#13217;', 'parameters%5B1%5D%5B%5D=1', 'parameters%5B1%5D%5B%5D=2', 1, NULL, 3, 1, 1, '61a4ffeeeccfd-owieapoe123013apodkpsoakd.jpeg', '2021-11-28 11:24:38', '2021-12-02 16:05:19'),
(3, 0, NULL, NULL, 'ar', 'parameters', NULL, 1, NULL, 4, 1, 1, '61a4fffa1d275-cat3.jpeg', '2021-11-28 11:25:40', '2021-12-02 18:02:51');

-- --------------------------------------------------------

--
-- Структура таблицы `product_categories_translation`
--

CREATE TABLE `product_categories_translation` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT NULL,
  `product_category_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seo_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seo_title` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seo_keywords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `product_categories_translation`
--

INSERT INTO `product_categories_translation` (`id`, `lang_id`, `product_category_id`, `name`, `slug`, `description`, `seo_text`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Apartamente', 'apartamente', NULL, NULL, NULL, NULL, NULL, '2021-11-28 11:24:19', '2021-12-02 16:05:05'),
(2, 2, 1, 'Квартиры', 'kvartiry', NULL, NULL, NULL, NULL, NULL, '2021-11-28 11:24:19', '2021-12-02 16:05:05'),
(3, 3, 1, 'Apartments', 'apartments', NULL, NULL, NULL, NULL, NULL, '2021-11-28 11:24:19', '2021-12-02 16:05:05'),
(4, 1, 2, 'Case', 'case', NULL, NULL, NULL, NULL, NULL, '2021-11-28 11:24:38', '2021-12-02 16:05:19'),
(5, 2, 2, 'Дома', 'doma', NULL, NULL, NULL, NULL, NULL, '2021-11-28 11:24:38', '2021-12-02 16:05:19'),
(6, 3, 2, 'Houses', 'houses', NULL, NULL, NULL, NULL, NULL, '2021-11-28 11:24:38', '2021-12-02 16:05:19'),
(7, 1, 3, 'Terenuri', 'terenuri', NULL, NULL, NULL, NULL, NULL, '2021-11-28 11:25:40', '2021-12-02 18:02:51'),
(8, 2, 3, 'Участки', 'zemelnye-ucastki', NULL, NULL, NULL, NULL, NULL, '2021-11-28 11:25:40', '2021-12-02 18:02:51'),
(9, 3, 3, 'Lands', 'lands', NULL, NULL, NULL, NULL, NULL, '2021-11-28 11:25:40', '2021-12-02 18:02:51');

-- --------------------------------------------------------

--
-- Структура таблицы `product_images`
--

CREATE TABLE `product_images` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `src` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `href` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `main` tinyint DEFAULT NULL,
  `first` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `src`, `href`, `main`, `first`, `type`, `deleted`, `created_at`, `updated_at`) VALUES
(60, 6, '61aa7cf847ab4d4db8a852c0a0d137e20f91ab930d294.jpeg', NULL, 1, '0', NULL, 0, '2021-12-03 18:24:24', '2021-12-03 18:24:28'),
(61, 6, '61aa7cf87a2f25817ab40c158e52996dc6e87c6e115db.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:24:24', '2021-12-03 18:24:28'),
(62, 6, '61aa7cf8a2b5557901bbc92838f7915f7ad4e21cdc301.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:24:24', '2021-12-03 18:24:28'),
(63, 6, '61aa7cf8c393b60e9e37deb71d29cd838606050246ac9.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:24:24', '2021-12-03 18:24:28'),
(64, 6, '61aa7cf8e1586715cffd1445de5c1de80b6002b94c8af.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:24:25', '2021-12-03 18:24:28'),
(65, 6, '61aa7cf90da3e58ed669ac82792056d3662450254b720.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:24:25', '2021-12-03 18:24:28'),
(66, 6, '61aa7cf93eac6152e67ed87e01cb9b5b4e3323c680e9a.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:24:25', '2021-12-03 18:24:28'),
(67, 1, '61aa7d37346d6202111190910561363331969.jpeg', NULL, 1, '0', NULL, 0, '2021-12-03 18:25:27', '2021-12-03 18:25:34'),
(68, 1, '61aa7d37650b120211119091231231562596.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:25:27', '2021-12-03 18:25:34'),
(69, 1, '61aa7d379cf5620211119091238908965177.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:25:27', '2021-12-03 18:25:34'),
(70, 1, '61aa7d37d763520211119091240738736497.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:25:28', '2021-12-03 18:25:34'),
(71, 1, '61aa7d38235d820211119091232519315285.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:25:28', '2021-12-03 18:25:34'),
(72, 2, '61aa7d8712a1d202110221819241691861354.jpeg', NULL, 1, '0', NULL, 0, '2021-12-03 18:26:47', '2021-12-03 18:26:51'),
(73, 2, '61aa7d8743116202110221819231637333006.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:26:47', '2021-12-03 18:26:51'),
(74, 2, '61aa7d8768c24202110221819235444947.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:26:47', '2021-12-03 18:26:51'),
(75, 2, '61aa7d878f10a202110221819232037061411.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:26:47', '2021-12-03 18:26:51'),
(76, 2, '61aa7d87cc2fc20211022181922212471592.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:26:48', '2021-12-03 18:26:51'),
(77, 2, '61aa7d8806cd520211022181922105388758.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:26:48', '2021-12-03 18:26:51'),
(78, 4, '61aa7dccc07baliviu-deleanu-04.jpeg', NULL, 1, '0', NULL, 0, '2021-12-03 18:27:57', '2021-12-03 18:28:02'),
(79, 4, '61aa7dcd173fdliviu-deleanu-10.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:27:57', '2021-12-03 18:28:02'),
(80, 4, '61aa7dcd57a83liviu-deleanu-05.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:27:57', '2021-12-03 18:28:02'),
(81, 4, '61aa7dcd916e6liviu-deleanu-06.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:27:57', '2021-12-03 18:28:02'),
(82, 4, '61aa7dcdc7353Deleanu_plan_etaj_2_scari.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:27:58', '2021-12-03 18:28:02'),
(83, 3, '61aa7e1393dfc202111161819291468434960.jpeg', NULL, 1, '0', NULL, 0, '2021-12-03 18:29:07', '2021-12-03 18:29:12'),
(84, 3, '61aa7e13cb54e20211116181930375423746.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:29:08', '2021-12-03 18:29:12'),
(85, 3, '61aa7e1406199202111161819291225551682.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:29:08', '2021-12-03 18:29:12'),
(86, 3, '61aa7e1437d9b202111161818381829619439.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:29:08', '2021-12-03 18:29:12'),
(87, 3, '61aa7e1464252202111161818361868055942.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:29:08', '2021-12-03 18:29:12'),
(88, 3, '61aa7e148c6dd202111161818351347523017.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:29:08', '2021-12-03 18:29:12'),
(89, 3, '61aa7e14b5c8d20211116181835727117759.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:29:08', '2021-12-03 18:29:12'),
(90, 3, '61aa7e14db1f7202111161818361865444953.jpeg', NULL, 0, '0', NULL, 0, '2021-12-03 18:29:09', '2021-12-03 18:29:12');

-- --------------------------------------------------------

--
-- Структура таблицы `product_images_translation`
--

CREATE TABLE `product_images_translation` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT NULL,
  `product_image_id` int UNSIGNED DEFAULT NULL,
  `alt` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `similar_products`
--

CREATE TABLE `similar_products` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `image`, `position`, `created_at`, `updated_at`) VALUES
(1, NULL, 0, '2021-11-28 11:51:43', '2021-11-28 11:51:43'),
(2, NULL, 0, '2021-11-28 11:52:43', '2021-11-28 11:52:43'),
(3, NULL, 0, '2021-11-29 12:09:01', '2021-11-29 12:09:01'),
(4, NULL, 0, '2021-11-29 12:11:02', '2021-11-29 12:11:02'),
(5, NULL, 0, '2021-11-29 12:11:57', '2021-11-29 12:11:57');

-- --------------------------------------------------------

--
-- Структура таблицы `tags_translation`
--

CREATE TABLE `tags_translation` (
  `id` int NOT NULL,
  `tag_id` int NOT NULL,
  `lang_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` text,
  `seo_description` text,
  `seo_text` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tags_translation`
--

INSERT INTO `tags_translation` (`id`, `tag_id`, `lang_id`, `name`, `slug`, `seo_title`, `seo_keywords`, `seo_description`, `seo_text`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Cumpara apartement cu 1 camera', 'cumpara-apartement-cu-1-camera', 'Cumpara apartement cu 1 camera', 'Cumpara apartement cu 1 camera', 'Cumpara apartement cu 1 camera', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n            proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet,\r\n            consectetur adipisicing elit, sed do eiusmod\r\n            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2021-11-28 11:51:43', '2021-12-03 21:45:12'),
(2, 1, 2, 'Купить однокомнатную квартиру', 'kupit-odnokomnatnuyu-kvartiru', 'Купить однокомнатную квартиру', 'Купить однокомнатную квартиру', 'Купить однокомнатную квартиру', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n            proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet,\r\n            consectetur adipisicing elit, sed do eiusmod\r\n            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2021-11-28 11:51:43', '2021-12-03 21:45:12'),
(3, 1, 3, 'Buy one-room apartment', 'buy-one-room-apartment', 'Buy one-room apartment', 'Buy one-room apartment', 'Buy one-room apartment', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n            proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet,\r\n            consectetur adipisicing elit, sed do eiusmod\r\n            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2021-11-28 11:51:43', '2021-12-03 21:45:12'),
(4, 2, 1, 'Cumpara apartement cu 2 camere', 'cumpara-apartement-cu-2-camere', 'Cumpara apartement cu 2 camere', 'Cumpara apartement cu 2 camere', 'Cumpara apartement cu 2 camere', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n            proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet,\r\n            consectetur adipisicing elit, sed do eiusmod\r\n            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2021-11-28 11:52:43', '2021-12-03 21:45:25'),
(5, 2, 2, 'Купить 2-комнатную квартиру', 'kupit-2-komnatnuyu-kvartiru', 'Купить 2-комнатную квартиру', 'Купить 2-комнатную квартиру', 'Купить 2-комнатную квартиру', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n            proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet,\r\n            consectetur adipisicing elit, sed do eiusmod\r\n            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2021-11-28 11:52:43', '2021-12-03 21:45:25'),
(6, 2, 3, 'Buy 2-room apartment', 'buy-2-room-apartment', 'Buy 2-room apartment', 'Buy 2-room apartment', 'Buy 2-room apartment', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n            proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet,\r\n            consectetur adipisicing elit, sed do eiusmod\r\n            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2021-11-28 11:52:43', '2021-12-03 21:45:25'),
(7, 3, 1, 'Cumpara apartement cu 3 camere', 'cumpara-apartement-cu-3-camere', NULL, NULL, NULL, NULL, '2021-11-29 12:09:01', '2021-11-29 12:09:01'),
(8, 3, 2, 'Купить 3-комнатную квартиру', 'kupit-3-komnatnuyu-kvartiru', NULL, NULL, NULL, NULL, '2021-11-29 12:09:01', '2021-11-29 12:09:01'),
(9, 3, 3, 'Buy 3-room apartment', 'buy-3-room-apartment', NULL, NULL, NULL, NULL, '2021-11-29 12:09:01', '2021-11-29 12:09:01'),
(10, 4, 1, 'Case cu 1 nivel', 'case-cu-1-nivel', NULL, NULL, NULL, NULL, '2021-11-29 12:11:02', '2021-11-29 12:11:02'),
(11, 4, 2, 'Одноэтажные  дома', 'odnoetaznye-doma', NULL, NULL, NULL, NULL, '2021-11-29 12:11:02', '2021-11-29 12:11:02'),
(12, 4, 3, '1-storey houses', '1-storey-houses', NULL, NULL, NULL, NULL, '2021-11-29 12:11:02', '2021-11-29 12:11:02'),
(13, 5, 1, 'Case cu 2 nivele', 'case-cu-2-nivele', NULL, NULL, NULL, NULL, '2021-11-29 12:11:57', '2021-11-29 12:11:57'),
(14, 5, 2, 'Двухэтажные  дома', 'dvuxetaznye-doma', NULL, NULL, NULL, NULL, '2021-11-29 12:11:57', '2021-11-29 12:11:57'),
(15, 5, 3, 'Houses with 2 floors', 'houses-with-2-floors', NULL, NULL, NULL, NULL, '2021-11-29 12:11:57', '2021-11-29 12:11:57');

-- --------------------------------------------------------

--
-- Структура таблицы `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `author` varchar(255) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `testimonials`
--

INSERT INTO `testimonials` (`id`, `title`, `body`, `author`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Client nr 120 ro', 'Suntem recunoscători pentru operativitate și profesionalismul de care ați dat dovată, pentru eficiența muncii și abordarea individuală în cazul sarcinilor emergente.', 'Ion Savin', 1, '2021-11-29 14:54:16', '2021-12-02 13:35:30'),
(2, 'Client nr 130 ro', 'Ați dat dovadă de competență și profesionalism în negocierea condițiilor contractuale aferente imobilului ulterior procurat. În speranța unei colaborări viitoare, Vă dorim multe realizări frumoase în domeniul imobiliar!', 'Andrei Munteanu', 2, '2021-11-29 14:55:26', '2021-12-02 13:35:30'),
(3, 'Client nr 121 ro', 'Echipa dvs a dat dovadă de mult profesionalism, promtitudine și o bună comunicare în scopul identificării clientului, fapt pentru care ne dorim și în continuare o frumoasă colaborare.', 'Elena Petrenco', 3, '2021-12-02 13:08:19', '2021-12-02 13:35:30'),
(4, 'Clinet nr 122 ru', 'Хотим выразить благодарность  за прекрасно, честно, прозрачно и очень душевно выполненную работу. Если вдруг нам понадобятся услуги риэлтора, то только к ним. Профессиональный подход гарантирует отсутствие переживаний в таком нелегком деле, как сделки с недвижимостью.', 'Ирина', 5, '2021-12-02 13:10:19', '2021-12-02 13:35:30'),
(5, 'Client nr 123 ru', 'Покупала дом, он полностью соответствует моему запросу. Сделка прошла максимально быстро, профессионально! Очень довольна.', 'Юлия Морозова', 4, '2021-12-02 13:11:56', '2021-12-02 13:35:30'),
(6, 'Client nr 124 ru', 'С благодарностью и удовольствием пишу отзыв. Безопасность, легкость, оперативность, четкость и согласованность действий - это то, что я получила в сотрудничестве, при покупке квартиры.', 'Марина Солдатова', 7, '2021-12-02 13:13:12', '2021-12-02 13:35:30'),
(7, 'Client nr 125 ro', 'Dupa o experienta initiala mai putina placuta cu companie imobiliara, insa acestia au revenit destul de rapid in ajutorul meu si mi-au oferit tot suportul pentru a reusi sa vand o proprietate. Salut acest gen de implicare.', 'Iulian Toma', 8, '2021-12-02 13:15:27', '2021-12-02 13:35:30'),
(8, 'Client nr 127 ro', 'Succes in activitate ! Mulțumesc pentru colaborarea de succes', 'Gheorghe Cazacu', 6, '2021-12-02 13:16:10', '2021-12-02 13:35:30');

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `translations`
--

INSERT INTO `translations` (`id`, `group_id`, `key`, `comment`, `created_at`, `updated_at`) VALUES
(1, 2, 'address', NULL, '2021-12-03 19:32:11', '2021-12-03 22:12:15'),
(2, 2, 'ourContacts', NULL, '2021-12-03 19:36:17', '2021-12-03 22:12:15'),
(3, 2, 'information', NULL, '2021-12-03 19:38:09', '2021-12-03 22:12:15'),
(4, 2, 'currents', NULL, '2021-12-03 19:40:14', '2021-12-03 22:12:15'),
(5, 2, 'offers', NULL, '2021-12-03 19:41:31', '2021-12-03 22:12:15'),
(6, 2, 'policies', NULL, '2021-12-03 19:44:35', '2021-12-03 22:12:15'),
(7, 2, 'copyright', NULL, '2021-12-03 19:45:36', '2021-12-03 22:12:15'),
(8, 2, 'byCompany', NULL, '2021-12-03 19:47:46', '2021-12-03 22:12:15'),
(9, 2, 'reservedRights', NULL, '2021-12-03 19:49:29', '2021-12-03 22:12:15'),
(10, 2, 'developedBy', NULL, '2021-12-03 19:50:47', '2021-12-03 22:12:15'),
(11, 2, 'callNow', NULL, '2021-12-03 19:51:32', '2021-12-03 22:12:15'),
(12, 2, 'orderCall', NULL, '2021-12-03 19:52:33', '2021-12-03 22:12:15'),
(13, 2, 'name', NULL, '2021-12-03 20:19:33', '2021-12-03 22:12:15'),
(14, 2, 'email', NULL, '2021-12-03 20:19:53', '2021-12-03 22:12:15'),
(15, 2, 'phone', NULL, '2021-12-03 20:20:11', '2021-12-03 22:12:15'),
(16, 2, 'methodOfCommunication', NULL, '2021-12-03 20:24:06', '2021-12-03 22:12:15'),
(17, 2, 'requestNow', NULL, '2021-12-03 20:25:39', '2021-12-03 22:12:15'),
(18, 4, 'thankYou', NULL, '2021-12-03 20:28:57', '2021-12-03 22:12:14'),
(19, 4, 'thanksFeedback', NULL, '2021-12-03 20:30:29', '2021-12-03 22:12:14'),
(20, 1, 'sale', NULL, '2021-12-03 20:32:06', '2021-12-03 21:59:30'),
(21, 1, 'rent', NULL, '2021-12-03 20:32:33', '2021-12-03 21:59:30'),
(22, 1, 'recommended', NULL, '2021-12-03 20:33:46', '2021-12-03 21:59:30'),
(23, 5, 'area', NULL, '2021-12-03 20:36:09', '2021-12-03 21:39:49'),
(24, 5, 'rooms', NULL, '2021-12-03 20:36:43', '2021-12-03 21:39:49'),
(25, 1, 'welcome', NULL, '2021-12-03 20:39:56', '2021-12-03 21:59:30'),
(26, 1, 'founderMessageTitle', NULL, '2021-12-03 20:42:39', '2021-12-03 21:59:30'),
(27, 1, 'founderMessagePart1', NULL, '2021-12-03 20:42:49', '2021-12-03 21:59:30'),
(28, 1, 'founderMessagePart2', NULL, '2021-12-03 20:42:55', '2021-12-03 21:59:30'),
(29, 1, 'founderName', NULL, '2021-12-03 20:43:09', '2021-12-03 21:59:30'),
(30, 1, 'founderPosition', NULL, '2021-12-03 20:43:17', '2021-12-03 21:59:30'),
(31, 1, 'reviews', NULL, '2021-12-03 20:48:36', '2021-12-03 21:59:30'),
(32, 1, 'viewMore', NULL, '2021-12-03 20:49:53', '2021-12-03 21:59:30'),
(33, 6, 'waitingForYou', NULL, '2021-12-03 20:51:47', '2021-12-03 22:07:12'),
(34, 6, 'monday', NULL, '2021-12-03 20:52:16', '2021-12-03 22:07:12'),
(35, 6, 'tuesday', NULL, '2021-12-03 20:52:23', '2021-12-03 22:07:12'),
(36, 6, 'wednesday', NULL, '2021-12-03 20:52:33', '2021-12-03 22:07:12'),
(37, 6, 'thursday', NULL, '2021-12-03 20:52:37', '2021-12-03 22:07:12'),
(38, 6, 'friday', NULL, '2021-12-03 20:52:43', '2021-12-03 22:07:12'),
(39, 6, 'saturday', NULL, '2021-12-03 20:52:49', '2021-12-03 22:07:12'),
(40, 6, 'sunday', NULL, '2021-12-03 20:52:55', '2021-12-03 22:07:12'),
(41, 6, 'views', NULL, '2021-12-03 20:53:02', '2021-12-03 22:07:12'),
(42, 6, 'allWeek', NULL, '2021-12-03 20:53:09', '2021-12-03 22:07:12'),
(43, 6, 'program1', NULL, '2021-12-03 20:53:17', '2021-12-03 22:07:12'),
(44, 6, 'program2', NULL, '2021-12-03 20:53:30', '2021-12-03 22:07:12'),
(45, 6, 'dayOff', NULL, '2021-12-03 20:53:33', '2021-12-03 22:07:12'),
(46, 1, 'blog', NULL, '2021-12-03 21:12:44', '2021-12-03 21:59:30'),
(47, 1, 'similarArticles', NULL, '2021-12-03 21:15:28', '2021-12-03 21:59:30'),
(48, 6, 'wouldLikeToHearYou', NULL, '2021-12-03 21:18:19', '2021-12-03 22:07:12'),
(49, 6, 'sendUsMessage', NULL, '2021-12-03 21:19:33', '2021-12-03 22:07:12'),
(50, 6, 'message', NULL, '2021-12-03 21:22:33', '2021-12-03 22:07:12'),
(51, 6, 'send', NULL, '2021-12-03 21:22:52', '2021-12-03 22:07:12'),
(52, 5, 'sort', NULL, '2021-12-03 21:24:24', '2021-12-03 21:39:49'),
(53, 5, 'filter', NULL, '2021-12-03 21:28:31', '2021-12-03 21:39:49'),
(54, 5, 'price', NULL, '2021-12-03 21:29:01', '2021-12-03 21:39:49'),
(55, 5, 'totalArea', NULL, '2021-12-03 21:29:37', '2021-12-03 21:39:49'),
(56, 5, 'from', NULL, '2021-12-03 21:29:50', '2021-12-03 21:39:49'),
(57, 5, 'to', NULL, '2021-12-03 21:30:36', '2021-12-03 21:39:49'),
(58, 5, 'search', NULL, '2021-12-03 21:32:00', '2021-12-03 21:39:49'),
(59, 5, 'code', NULL, '2021-12-03 21:36:12', '2021-12-03 21:39:49'),
(60, 5, 'description', NULL, '2021-12-03 21:37:00', '2021-12-03 21:39:49'),
(62, 5, 'similarOffers', NULL, '2021-12-03 21:39:27', '2021-12-03 21:39:49'),
(63, 1, 'offersFrom', NULL, '2021-12-03 21:41:27', '2021-12-03 21:59:30'),
(64, 1, 'ourAgents', NULL, '2021-12-03 21:43:24', '2021-12-03 21:59:30'),
(65, 4, 'leaveReview', NULL, '2021-12-03 21:47:42', '2021-12-03 22:12:14'),
(66, 1, 'search', NULL, '2021-12-03 21:50:23', '2021-12-03 21:59:30'),
(67, 4, 'nothingFound', NULL, '2021-12-03 21:52:15', '2021-12-03 22:12:15'),
(68, 1, 'home', NULL, '2021-12-03 21:54:34', '2021-12-03 21:59:30'),
(69, 4, 'moreInfo', NULL, '2021-12-03 22:02:28', '2021-12-03 22:12:15'),
(71, 6, 'or', NULL, '2021-12-03 22:05:59', '2021-12-03 22:07:12'),
(72, 4, 'successfullyMessage', NULL, '2021-12-03 22:11:05', '2021-12-03 22:12:15');

-- --------------------------------------------------------

--
-- Структура таблицы `translation_groups`
--

CREATE TABLE `translation_groups` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `translation_groups`
--

INSERT INTO `translation_groups` (`id`, `key`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'general', NULL, '2021-12-03 19:23:11', '2021-12-03 19:23:11'),
(2, 'header/footer', NULL, '2021-12-03 19:23:25', '2021-12-03 19:23:25'),
(3, 'home', NULL, '2021-12-03 19:54:12', '2021-12-03 19:54:12'),
(4, 'notifications', NULL, '2021-12-03 20:27:53', '2021-12-03 20:27:53'),
(5, 'parameters', NULL, '2021-12-03 20:34:35', '2021-12-03 20:34:35'),
(6, 'contacts', NULL, '2021-12-03 20:51:09', '2021-12-03 20:51:09');

-- --------------------------------------------------------

--
-- Структура таблицы `translation_lines`
--

CREATE TABLE `translation_lines` (
  `id` int UNSIGNED NOT NULL,
  `translation_id` int UNSIGNED DEFAULT NULL,
  `lang_id` int UNSIGNED DEFAULT NULL,
  `line` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `translation_lines`
--

INSERT INTO `translation_lines` (`id`, `translation_id`, `lang_id`, `line`, `created_at`, `updated_at`) VALUES
(1098, 61, 0, NULL, '2021-12-03 21:37:34', '2021-12-03 21:37:34'),
(1099, 61, 1, 'AVANTAJE', '2021-12-03 21:37:34', '2021-12-03 21:37:34'),
(1100, 61, 2, 'ПРЕИМУЩЕСТВА', '2021-12-03 21:37:34', '2021-12-03 21:37:34'),
(1101, 61, 3, 'BENEFITS', '2021-12-03 21:37:34', '2021-12-03 21:37:34'),
(1105, 23, 0, NULL, '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1106, 23, 1, 'suprafața', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1107, 23, 2, 'площадь', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1108, 23, 3, 'area', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1109, 24, 0, NULL, '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1110, 24, 1, 'nr odăi', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1111, 24, 2, 'комнаты', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1112, 24, 3, 'rooms', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1113, 52, 0, NULL, '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1114, 52, 1, 'Sorteaza dupa', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1115, 52, 2, 'Сортировать', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1116, 52, 3, 'Sort', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1117, 53, 0, NULL, '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1118, 53, 1, 'Filtru', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1119, 53, 2, 'Фильтр', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1120, 53, 3, 'Filter', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1121, 54, 0, NULL, '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1122, 54, 1, 'Preț', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1123, 54, 2, 'Цена', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1124, 54, 3, 'Price', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1125, 55, 0, NULL, '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1126, 55, 1, 'Suprafața totală', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1127, 55, 2, 'Общая площадь', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1128, 55, 3, 'Total area', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1129, 56, 0, NULL, '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1130, 56, 1, 'De la', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1131, 56, 2, 'От', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1132, 56, 3, 'From', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1133, 57, 0, NULL, '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1134, 57, 1, 'Până la', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1135, 57, 2, 'До', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1136, 57, 3, 'To', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1137, 58, 0, NULL, '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1138, 58, 1, 'Caută', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1139, 58, 2, 'Искать', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1140, 58, 3, 'Search', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1141, 59, 0, NULL, '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1142, 59, 1, 'Cod', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1143, 59, 2, 'Код', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1144, 59, 3, 'Code', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1145, 60, 0, NULL, '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1146, 60, 1, 'DESCRIERE', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1147, 60, 2, 'ОПИСАНИЕ', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1148, 60, 3, 'DESCRIPTION', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1149, 62, 0, NULL, '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1150, 62, 1, 'OFERTE SIMILARE', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1151, 62, 2, 'ПОДОБНЫЕ ПРЕДЛОЖЕНИЯ', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1152, 62, 3, 'SIMILAR OFFERS', '2021-12-03 21:39:49', '2021-12-03 21:39:49'),
(1187, 20, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1188, 20, 1, 'Vanzare', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1189, 20, 2, 'Продажа', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1190, 20, 3, 'Sale', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1191, 21, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1192, 21, 1, 'Chirie', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1193, 21, 2, 'Аренда', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1194, 21, 3, 'Rent', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1195, 22, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1196, 22, 1, 'PROPRIETATE RECOMANDATĂ', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1197, 22, 2, 'РЕКОМЕНДУЕМАЯ НЕДВИЖИМОСТЬ', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1198, 22, 3, 'RECOMMENDED PROPERTY', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1199, 25, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1200, 25, 1, 'Bun venit', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1201, 25, 2, 'Добро пожаловать', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1202, 25, 3, 'Welcome', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1203, 26, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1204, 26, 1, 'CALITATEA NU ESTE O ÎNTAMPLARE!', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1205, 26, 2, 'КАЧЕСТВО - НЕ СЛУЧАЙНОСТЬ!', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1206, 26, 3, 'QUALITY IS NOT RANDOM!', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1207, 27, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1208, 27, 1, 'Este rezultatul unor intenții mari, direcții clare și a unor acțiuni ferme. Reprezintă alegerea oportunității perfecte. Ne-am însuşit cu succes conceptul de calitate, clienţii confirmând aceasta în fiecare zi.', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1209, 27, 2, 'Это результат великих намерений, четких направлений и решительных действий. Это выбор из прекрасной возможности. Мы успешно освоили концепцию качества, и покупатели подтверждают это каждый день.', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1210, 27, 3, 'It is the result of great intentions, clear directions and firm actions. It is the choice of the perfect opportunity. We have successfully mastered the concept of quality, with customers confirming this every day.', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1211, 28, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1212, 28, 1, 'Specialiştii noştri, pregătiţi profesional, cu o experienţă de excepţie sunt capabili să ofere consultanţă de cel mai înalt nivel. Acum ne dorim să oferim din experienţa şi competenţa noastră clientilor pentru a crea, astfel, un sistem complex de management al calităţii.', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1213, 28, 2, 'Наши профессионально подготовленные специалисты с исключительным опытом могут дать совет на самом высоком уровне. Теперь мы хотим предложить нашим клиентам опыт и знания для создания сложной системы управления качеством.', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1214, 28, 3, 'Our professionally trained specialists with exceptional experience are able to provide the highest level of advice. We now want to offer our customers experience and expertise to create a complex quality management system.', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1215, 29, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1216, 29, 1, 'Igor Manole', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1217, 29, 2, 'Игорь Маноле', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1218, 29, 3, 'Igor Manole', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1219, 30, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1220, 30, 1, 'Fondatorul Manole Estate', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1221, 30, 2, 'Основатель Manole Estate', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1222, 30, 3, 'Founder of Manole Estate', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1223, 31, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1224, 31, 1, 'Recenzii', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1225, 31, 2, 'Отзывы', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1226, 31, 3, 'Reviews', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1227, 32, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1228, 32, 1, 'vezi mai multe', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1229, 32, 2, 'читать больше', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1230, 32, 3, 'view more', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1231, 46, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1232, 46, 1, 'Blog', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1233, 46, 2, 'Блог', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1234, 46, 3, 'Blog', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1235, 47, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1236, 47, 1, 'Articole asemanatoare', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1237, 47, 2, 'Похожие статьи', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1238, 47, 3, 'Similar Articles', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1239, 63, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1240, 63, 1, 'Oferte de la', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1241, 63, 2, 'Предложения от', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1242, 63, 3, 'Offers from', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1243, 64, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1244, 64, 1, 'Agenții noștri', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1245, 64, 2, 'Наши агенты', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1246, 64, 3, 'Our agents', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1247, 66, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1248, 66, 1, 'Căutare', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1249, 66, 2, 'Поиск', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1250, 66, 3, 'Search', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1251, 68, 0, NULL, '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1252, 68, 1, 'Acasă', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1253, 68, 2, 'Главная', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1254, 68, 3, 'Home', '2021-12-03 21:59:30', '2021-12-03 21:59:30'),
(1258, 70, 1, 'sau', '2021-12-03 22:05:33', '2021-12-03 22:05:33'),
(1259, 70, 2, 'или', '2021-12-03 22:05:33', '2021-12-03 22:05:33'),
(1260, 70, 3, 'or', '2021-12-03 22:05:33', '2021-12-03 22:05:33'),
(1328, 33, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1329, 33, 1, 'Va asteptam in oficiul nostru:', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1330, 33, 2, 'Ждем вас в нашем офисе:', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1331, 33, 3, 'We are waiting for you in our office:', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1332, 34, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1333, 34, 1, 'Luni', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1334, 34, 2, 'Понедельник', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1335, 34, 3, 'Monday', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1336, 35, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1337, 35, 1, 'Marti', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1338, 35, 2, 'Вторник', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1339, 35, 3, 'Tuesday', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1340, 36, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1341, 36, 1, 'Miercuri', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1342, 36, 2, 'среда', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1343, 36, 3, 'Wednesday', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1344, 37, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1345, 37, 1, 'Joi', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1346, 37, 2, 'четверг', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1347, 37, 3, 'Thursday', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1348, 38, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1349, 38, 1, 'Vineri', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1350, 38, 2, 'Пятница', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1351, 38, 3, 'Friday', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1352, 39, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1353, 39, 1, 'Sambata', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1354, 39, 2, 'Суббота', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1355, 39, 3, 'Saturday', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1356, 40, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1357, 40, 1, 'Duminica', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1358, 40, 2, 'Воскресенье', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1359, 40, 3, 'Sunday', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1360, 41, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1361, 41, 1, 'VIZIONARI', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1362, 41, 2, 'ПРОСМОТРЫ', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1363, 41, 3, 'VIEWS', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1364, 42, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1365, 42, 1, '7 ZILE PE SAPTAMANA', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1366, 42, 2, '7 ДНЕЙ В НЕДЕЛЮ', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1367, 42, 3, '7 DAYS A WEEK', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1368, 43, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1369, 43, 1, '9:00 - 18:00', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1370, 43, 2, '9:00 - 18:00', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1371, 43, 3, '9:00 - 18:00', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1372, 44, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1373, 44, 1, '10:00 - 14:00', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1374, 44, 2, '10:00 - 14:00', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1375, 44, 3, '10:00 - 14:00', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1376, 45, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1377, 45, 1, 'Zi de odihna', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1378, 45, 2, 'Выходной', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1379, 45, 3, 'Rest day\nDay off', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1380, 48, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1381, 48, 1, 'NE-AR PLACEA SA VA AUZIM!', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1382, 48, 2, 'МЫ ХОТЕЛИ БЫ ВАС УСЛЫШАТЬ!', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1383, 48, 3, 'WE WOULD LIKE TO HEAR YOU!', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1384, 49, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1385, 49, 1, 'Trimiteti-ne un mesaj si vom reveni cu un apel', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1386, 49, 2, 'Send us a message and we\'ll be back with a call', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1387, 49, 3, 'Send us a message and we\'ll be back with a call', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1388, 50, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1389, 50, 1, 'Mesaj', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1390, 50, 2, 'Сообщение', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1391, 50, 3, 'Message', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1392, 51, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1393, 51, 1, 'Trimite', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1394, 51, 2, 'Отправить', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1395, 51, 3, 'Send', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1396, 71, 0, NULL, '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1397, 71, 1, 'sau', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1398, 71, 2, 'или', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1399, 71, 3, 'or', '2021-12-03 22:07:12', '2021-12-03 22:07:12'),
(1403, 18, 0, NULL, '2021-12-03 22:12:14', '2021-12-03 22:12:14'),
(1404, 18, 1, 'Va multumim, in scurt timp managerii nostri va vor contacta.', '2021-12-03 22:12:14', '2021-12-03 22:12:14'),
(1405, 18, 2, 'Спасибо, в ближайшее время с вами свяжутся наши менеджеры.', '2021-12-03 22:12:14', '2021-12-03 22:12:14'),
(1406, 18, 3, 'Thank you, our managers will contact you shortly.', '2021-12-03 22:12:14', '2021-12-03 22:12:14'),
(1407, 19, 0, NULL, '2021-12-03 22:12:14', '2021-12-03 22:12:14'),
(1408, 19, 1, 'Va multumim pentru feedback!', '2021-12-03 22:12:14', '2021-12-03 22:12:14'),
(1409, 19, 2, 'Спасибо за отзыв!', '2021-12-03 22:12:14', '2021-12-03 22:12:14'),
(1410, 19, 3, 'Thanks for the feedback!', '2021-12-03 22:12:14', '2021-12-03 22:12:14'),
(1411, 65, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1412, 65, 1, 'Lăsați o recenzie', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1413, 65, 2, 'ОСТАВЬТЕ ОТЗЫВ', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1414, 65, 3, 'LEAVE US A FEED-BACK\nLEAVE A REVIEW', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1415, 67, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1416, 67, 1, 'Nu a fost gasit nimic.', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1417, 67, 2, 'Nu a fost gasit nimic.', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1418, 67, 3, 'Nothing was found.', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1419, 69, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1420, 69, 1, 'Pentru mai multe informații', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1421, 69, 2, 'Для дополнительной информации', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1422, 69, 3, 'For more information', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1423, 72, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1424, 72, 1, 'Expediat cu success!', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1425, 72, 2, 'Успешно отправлено!', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1426, 72, 3, 'Successfully shipped!', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1427, 1, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1428, 1, 1, 'mun. Chișinău, str. Columna 90', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1429, 1, 2, 'мун,.Кишинев, ул. Колумна 90', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1430, 1, 3, 'mun. Chisinau, str. Columna 90', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1431, 2, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1432, 2, 1, 'Contactele noastre', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1433, 2, 2, 'Наши контакты', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1434, 2, 3, 'Our contacts', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1435, 3, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1436, 3, 1, 'Informatii', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1437, 3, 2, 'Информация', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1438, 3, 3, 'Information', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1439, 4, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1440, 4, 1, 'Actuale', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1441, 4, 2, 'Актуальные', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1442, 4, 3, 'Current', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1443, 5, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1444, 5, 1, 'Oferte', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1445, 5, 2, 'Предложения', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1446, 5, 3, 'Our offers', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1447, 6, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1448, 6, 1, 'Politici Manole Estate', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1449, 6, 2, 'Политика Manole Estate', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1450, 6, 3, 'Policy of Manole Estate', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1451, 7, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1452, 7, 1, 'Copyright', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1453, 7, 2, 'Авторские права', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1454, 7, 3, 'Copyright', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1455, 8, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1456, 8, 1, 'de MANOLE ESTATE.', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1457, 8, 2, 'принадлежат MANOLE ESTATE.', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1458, 8, 3, 'by MANOLE ESTATE.', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1459, 9, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1460, 9, 1, 'Toate drepturi sunt rezervate.', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1461, 9, 2, 'Все права защищены.', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1462, 9, 3, 'All rights reserved.', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1463, 11, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1464, 11, 1, 'Sună acum', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1465, 11, 2, 'Позвони сейчас', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1466, 11, 3, 'Call now', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1467, 12, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1468, 12, 1, 'Comandă un apel', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1469, 12, 2, 'Закажи звонок', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1470, 12, 3, 'Order a call', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1471, 13, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1472, 13, 1, 'Nume', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1473, 13, 2, 'Имя', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1474, 13, 3, 'Name', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1475, 14, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1476, 14, 1, 'e-mail', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1477, 14, 2, 'e-mail', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1478, 14, 3, 'e-mail', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1479, 15, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1480, 15, 1, 'Telefon', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1481, 15, 2, 'Телефон', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1482, 15, 3, 'Phone', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1483, 16, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1484, 16, 1, 'Metoda preferată de comunicare', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1485, 16, 2, 'Предпочтительный способ связи', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1486, 16, 3, 'Preferred method of communication', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1487, 17, 0, NULL, '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1488, 17, 1, 'Solicita Acum', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1489, 17, 2, 'Заказать сейчас', '2021-12-03 22:12:15', '2021-12-03 22:12:15'),
(1490, 17, 3, 'Request Now', '2021-12-03 22:12:15', '2021-12-03 22:12:15');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_user_email_unique` (`email`);

--
-- Индексы таблицы `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `blogs_translation`
--
ALTER TABLE `blogs_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_translation_lang_id_foreign` (`lang_id`),
  ADD KEY `blogs_translation_blog_id_foreign` (`blog_id`);

--
-- Индексы таблицы `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `blog_categories_translation`
--
ALTER TABLE `blog_categories_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_categories_translation_lang_id_foreign` (`lang_id`),
  ADD KEY `blog_categories_translation_blog_category_id_foreign` (`blog_category_id`);

--
-- Индексы таблицы `feed_back`
--
ALTER TABLE `feed_back`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages_translation`
--
ALTER TABLE `pages_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_translation_page_id_foreign` (`page_id`),
  ADD KEY `pages_translation_lang_id_foreign` (`lang_id`);

--
-- Индексы таблицы `parameters`
--
ALTER TABLE `parameters`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `parameters_translation`
--
ALTER TABLE `parameters_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parameters_translation_lang_id_foreign` (`lang_id`),
  ADD KEY `parameters_translation_parameter_id_foreign` (`parameter_id`);

--
-- Индексы таблицы `parameters_values_products`
--
ALTER TABLE `parameters_values_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parameters_values_products_parameter_id_foreign` (`parameter_id`),
  ADD KEY `parameters_values_products_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `parameters_values_products_translation`
--
ALTER TABLE `parameters_values_products_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parameters_values_products_translation_lang_id_foreign` (`lang_id`),
  ADD KEY `parameters_values_products_translation_param_val_id_foreign` (`param_val_id`);

--
-- Индексы таблицы `parameter_categories`
--
ALTER TABLE `parameter_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parameter_categories_parameter_id_foreign` (`parameter_id`),
  ADD KEY `parameter_categories_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `parameter_values`
--
ALTER TABLE `parameter_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parameter_values_parameter_id_foreign` (`parameter_id`);

--
-- Индексы таблицы `parameter_values_translation`
--
ALTER TABLE `parameter_values_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parameter_values_translation_lang_id_foreign` (`lang_id`),
  ADD KEY `parameter_values_translation_parameter_value_id_foreign` (`parameter_value_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `products_translation`
--
ALTER TABLE `products_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_translation_lang_id_foreign` (`lang_id`),
  ADD KEY `products_translation_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_categories_translation`
--
ALTER TABLE `product_categories_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_translation_lang_id_foreign` (`lang_id`),
  ADD KEY `product_categories_translation_product_category_id_foreign` (`product_category_id`);

--
-- Индексы таблицы `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `product_images_translation`
--
ALTER TABLE `product_images_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_translation_lang_id_foreign` (`lang_id`),
  ADD KEY `product_images_translation_product_image_id_foreign` (`product_image_id`);

--
-- Индексы таблицы `similar_products`
--
ALTER TABLE `similar_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `similar_products_category_id_foreign` (`category_id`),
  ADD KEY `similar_products_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags_translation`
--
ALTER TABLE `tags_translation`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_group_id_foreign` (`group_id`);

--
-- Индексы таблицы `translation_groups`
--
ALTER TABLE `translation_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `translation_lines`
--
ALTER TABLE `translation_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lines_translation_id_foreign` (`translation_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `blogs_translation`
--
ALTER TABLE `blogs_translation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `blog_categories_translation`
--
ALTER TABLE `blog_categories_translation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `feed_back`
--
ALTER TABLE `feed_back`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `langs`
--
ALTER TABLE `langs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2078;

--
-- AUTO_INCREMENT для таблицы `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `pages_translation`
--
ALTER TABLE `pages_translation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `parameters`
--
ALTER TABLE `parameters`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `parameters_translation`
--
ALTER TABLE `parameters_translation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT для таблицы `parameters_values_products`
--
ALTER TABLE `parameters_values_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;

--
-- AUTO_INCREMENT для таблицы `parameters_values_products_translation`
--
ALTER TABLE `parameters_values_products_translation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `parameter_categories`
--
ALTER TABLE `parameter_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `parameter_values`
--
ALTER TABLE `parameter_values`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT для таблицы `parameter_values_translation`
--
ALTER TABLE `parameter_values_translation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `products_translation`
--
ALTER TABLE `products_translation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `product_categories_translation`
--
ALTER TABLE `product_categories_translation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT для таблицы `product_images_translation`
--
ALTER TABLE `product_images_translation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `similar_products`
--
ALTER TABLE `similar_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `tags_translation`
--
ALTER TABLE `tags_translation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT для таблицы `translation_groups`
--
ALTER TABLE `translation_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `translation_lines`
--
ALTER TABLE `translation_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1491;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
