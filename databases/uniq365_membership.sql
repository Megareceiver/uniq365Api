-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 05 Jan 2018 pada 18.18
-- Versi server: 5.5.42
-- Versi PHP: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uniq365_membership`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bill`
--

CREATE TABLE `bill` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `expired_at` int(11) DEFAULT NULL,
  `is_paid` tinyint(4) DEFAULT '0',
  `paid_at` int(11) DEFAULT NULL,
  `remarks` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bill`
--

INSERT INTO `bill` (`id`, `user_id`, `plan_id`, `cost`, `date`, `expired_at`, `is_paid`, `paid_at`, `remarks`) VALUES
(1, 29, 3, '100000.00', 1512119789, 1514711789, 1, 1512119807, 'Bill of Plan PROFESSIONAL PLAN'),
(2, 30, 6, '0.00', 1512725588, 1515317588, 0, NULL, 'Bill of Plan STARTER'),
(3, 32, 3, '100000.00', 1512726020, 1515318020, 0, NULL, 'Bill of Plan PROFESSIONAL PLAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `city`
--

CREATE TABLE `city` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `city_name` varchar(96) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `city`
--

INSERT INTO `city` (`id`, `country_id`, `city_name`) VALUES
(1, 11, 'Jakarta'),
(3, 11, 'Bandung'),
(4, 13, 'Test City 1'),
(5, 13, 'Test City 2'),
(6, 14, 'City 1'),
(7, 14, 'City 2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_categories`
--

CREATE TABLE `content_categories` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `content_categories`
--

INSERT INTO `content_categories` (`ID`, `name`, `image`, `description`) VALUES
(1, 'Default', 'default.png', '<p>The default category</p>\n'),
(2, 'Kategori 2', 'decebc721a69f97571d991ccc497fc84.jpeg', '<p>asdadasd</p>\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_pages`
--

CREATE TABLE `content_pages` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `summary` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `image` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `categoryid` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  `last_updated_userid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `seo_title` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `seo_description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `loggedin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `content_pages`
--

INSERT INTO `content_pages` (`ID`, `title`, `summary`, `content`, `userid`, `timestamp`, `comments`, `image`, `categoryid`, `last_updated`, `last_updated_userid`, `type`, `seo_title`, `seo_description`, `loggedin`) VALUES
(1, 'Test', 'Test', '<p>dfsdfsdfsdfsdf</p>\r\n', 1, 1508999327, 1, 'page_default.png', 1, 1508999327, 1, 0, '', '', 1),
(2, 'Test 2', 'Test 2', '<p>sdfsfsfsfsdf</p>\r\n', 1, 1508999467, 1, '1d201e8c6a93f6ceb4a4005731838148.jpg', 1, 1508999467, 1, 0, '', '', 1),
(3, 'Test Konten Kategori', 'Test Konten Kategori', '<p>sdfj osidjf oisjdof jsodj fsodj fosdjf osidjf osdij fo</p>\r\n', 1, 1509003044, 1, '0c74d0cc14cfa42b9ae2be423c9fe10b.png', 2, 1509003044, 1, 1, '', '', 1),
(4, 'tes3', 'tes3', '<p>sdfsefsef</p>\r\n', 1, 1509421214, 1, 'page_default.png', 1, 1509421214, 1, 0, '', '', 1),
(5, 'sefsf', 'sef4', '<p>efsef</p>\r\n', 1, 1509421232, 1, 'page_default.png', 1, 1509421232, 1, 0, '', '', 1),
(6, 'as', 'asdasd', '<p>awdawd</p>\r\n', 1, 1509634742, 1, '5bd0846827bc31d58543e4d9c2b32c43.jpeg', 1, 1509634742, 1, 0, '', '', 1),
(7, 'asdasd', 'adsasd', '<p>awda</p>\r\n', 1, 1509635074, 1, 'eac43827e8bc27ab744d4db17851c0c8.jpg', 1, 1509635074, 1, 0, '', '', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_page_comments`
--

CREATE TABLE `content_page_comments` (
  `ID` int(11) NOT NULL,
  `pageid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `content_page_comments`
--

INSERT INTO `content_page_comments` (`ID`, `pageid`, `userid`, `comment`, `timestamp`) VALUES
(1, 1, 2, '<p>xczxczxc</p>\r\n', 1509000101);

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_page_groups`
--

CREATE TABLE `content_page_groups` (
  `ID` int(11) NOT NULL,
  `pageid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `content_page_groups`
--

INSERT INTO `content_page_groups` (`ID`, `pageid`, `groupid`) VALUES
(1, 1, 1),
(2, 2, 1),
(4, 3, 1),
(5, 4, 1),
(6, 5, 1),
(7, 6, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_page_plans`
--

CREATE TABLE `content_page_plans` (
  `ID` int(11) NOT NULL,
  `pageid` int(11) NOT NULL,
  `planid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `content_page_plans`
--

INSERT INTO `content_page_plans` (`ID`, `pageid`, `planid`) VALUES
(1, 1, 2),
(2, 2, 2),
(4, 3, 3),
(5, 4, 3),
(6, 5, 2),
(7, 6, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_page_roles`
--

CREATE TABLE `content_page_roles` (
  `ID` int(11) NOT NULL,
  `pageid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `content_page_roles`
--

INSERT INTO `content_page_roles` (`ID`, `pageid`, `roleid`) VALUES
(1, 1, 5),
(2, 2, 5),
(4, 3, 5),
(5, 4, 5),
(6, 5, 5),
(7, 6, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `countries`
--

INSERT INTO `countries` (`id`, `currency_id`, `name`, `created_at`, `created_by`, `changed_at`, `changed_by`) VALUES
(11, 1, 'Indonesia', '2017-11-02 18:37:54', 1, '2017-11-02 18:48:18', 1),
(13, 8, 'Malaysia', '2017-11-02 18:38:20', 1, '2017-11-02 18:48:02', 1),
(14, 4, 'Singapore', '2017-11-02 18:47:55', 1, '2017-11-02 18:48:00', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `country_distributor`
--

CREATE TABLE `country_distributor` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(96) DEFAULT NULL,
  `country_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `country_distributor`
--

INSERT INTO `country_distributor` (`id`, `name`, `country_id`) VALUES
(1, 'Distributor Name 1', 11),
(3, 'Distributor Name 2', 11),
(4, 'Distributor Name 4', 13),
(6, 'Distributor Name', 11),
(7, 'W Company', 13),
(8, 'X Distro', 11),
(9, 'Y Distro', 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `symbol` varchar(8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `created_at`, `created_by`, `changed_at`, `changed_by`) VALUES
(1, 'Rupiah', 'Rp', NULL, NULL, '2017-11-07 06:37:39', 1),
(4, 'Singapore Dollar', '$', NULL, NULL, '2017-11-15 04:34:53', 5),
(8, 'Malaysian Ringgit', 'MYR', '2017-11-02 03:55:00', 1, '2017-11-15 04:35:13', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `partner_id` int(10) NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(96) DEFAULT NULL,
  `address` varchar(96) DEFAULT NULL,
  `registrasion_number` varchar(96) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `fax` varchar(10) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `partner_id`, `country_id`, `name`, `address`, `registrasion_number`, `phone`, `fax`, `active`) VALUES
(4, 0, 13, 'Custommer example 2', 'dhdhdfhdfh', 'dhdhdhdgfdg', 'dfgdfg', 'fgdfgdfg', 1),
(5, 0, 13, 'CWS LLP', 'Avenue One \r\nDamansara Utama\r\n47200 Selangor', '50102-K', '03-2122 2122', '03-2122 21', 1),
(6, 4, 11, 'Customer', '', '', '', '', 0),
(7, 4, 11, 'Xtramax', '', '', '', '', 0),
(9, 10, 11, 'Meriz Team', '', '', '', '', 1),
(10, 7, 11, 'PT Pertamina', '', '', '', '', 1),
(11, 10, 13, 'ViVo', 'KL', '', '', '', 1),
(12, 10, 13, 'customer T', 'address 1\r\naddress 2', '123456k', '03987654', '03987632', 1),
(13, 4, 11, 'yama swastika', 'bandung', '123456', '081240740000', 'muresaaa@g', 0),
(14, 4, 11, 'reza saddat', 'bandung', '123456', '081240740000', 'muresaaa@g', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `custom_fields`
--

CREATE TABLE `custom_fields` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `options` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `required` int(11) NOT NULL,
  `profile` int(11) NOT NULL,
  `edit` int(11) NOT NULL,
  `help_text` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `register` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_templates`
--

CREATE TABLE `email_templates` (
  `ID` int(11) NOT NULL,
  `title` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `email_templates`
--

INSERT INTO `email_templates` (`ID`, `title`, `message`) VALUES
(1, 'Forgot Your Password', 'Dear [NAME],\r\n<br /><br />\r\nSomeone (hopefully you) requested a password reset at [SITE_URL].\r\n<br /><br />\r\nTo reset your password, please follow the following link: [EMAIL_LINK]\r\n<br /><br />\r\nIf you did not reset your password, please kindly ignore  this email.\r\n<br /><br />\r\nYours, <br />\r\n[SITE_NAME]'),
(2, 'Email Activation', 'Dear [NAME],\r\n<br /><br />\r\nSomeone (hopefully you) has registered an account on [SITE_NAME] using this email address.\r\n<br /><br />\r\nPlease activate the account by following this link: [EMAIL_LINK]\r\n<br /><br />\r\nIf you did not register an account, please kindly ignore  this email.\r\n<br /><br />\r\nYours, <br />\r\n[SITE_NAME]');

-- --------------------------------------------------------

--
-- Struktur dari tabel `home_stats`
--

CREATE TABLE `home_stats` (
  `ID` int(11) NOT NULL,
  `google_members` int(11) NOT NULL DEFAULT '0',
  `facebook_members` int(11) NOT NULL DEFAULT '0',
  `twitter_members` int(11) NOT NULL DEFAULT '0',
  `total_members` int(11) NOT NULL DEFAULT '0',
  `new_members` int(11) NOT NULL DEFAULT '0',
  `active_today` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `home_stats`
--

INSERT INTO `home_stats` (`ID`, `google_members`, `facebook_members`, `twitter_members`, `total_members`, `new_members`, `active_today`, `timestamp`) VALUES
(1, 0, 0, 0, 29, 1, 2, 1515039332);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ipn_log`
--

CREATE TABLE `ipn_log` (
  `ID` int(11) NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `IP` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ip_block`
--

CREATE TABLE `ip_block` (
  `ID` int(11) NOT NULL,
  `IP` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `reason` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `ID` int(11) NOT NULL,
  `IP` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `login_attempts`
--

INSERT INTO `login_attempts` (`ID`, `IP`, `username`, `count`, `timestamp`) VALUES
(1, '118.137.0.125', 'merizz.works@gmail.com', 1, 1509977922),
(2, '118.137.0.125', 'meriz.works@gmail.com', 1, 1509977931),
(3, '139.192.106.18', 'meriz.works@gmail.com', 1, 1510048501),
(4, '139.192.106.18', 'u0857367_member', 1, 1510114952),
(5, '139.192.106.18', 'cm-id', 1, 1510538854),
(6, '139.192.106.18', 'admin@uniq365.com', 4, 1510538862),
(7, '118.189.170.79', 'customer@uniq365.com', 1, 1510547327),
(8, '118.189.170.79', 'partner@uniq365.com', 1, 1510548492),
(9, '14.192.212.2', 'admin@uniq365.com', 5, 1510569465),
(10, '139.192.106.18', 'admin@uniq365.com', 1, 1510655109),
(11, '118.189.170.79', 'admin@uniq365.com', 1, 1510713319),
(12, '139.192.106.18', 'admin@uniq365.com', 1, 1510720944),
(13, '60.54.60.103', 'admin@uniq365.com', 1, 1510726607),
(14, '139.192.106.18', 'customer@uniq365.com', 4, 1510727793),
(15, '139.192.106.18', 'admin@uniq365.com', 1, 1510728012),
(16, '60.51.75.20', 'wdist', 1, 1510730651),
(17, '118.137.0.125', 'admin@uniq365.com', 1, 1510796038),
(18, '139.192.106.18', 'W Company', 1, 1510890181),
(19, '139.192.106.18', 'customer', 1, 1510890285),
(20, '139.192.106.18', 'cws@mail.comq', 2, 1510890309),
(21, '118.137.0.125', 'admin@uniq365.com', 1, 1511191550),
(22, '118.189.170.79', 'admin@uniq365.com', 1, 1511747065),
(23, '118.137.0.125', 'dtech@gmail.com', 1, 1512120315),
(24, '118.137.0.125', 'dtech', 1, 1512120320),
(25, '118.189.170.79', 'partner3@gmail.com', 1, 1512122104),
(26, '202.77.124.52', 'admin@uniq365.com', 1, 1512257843),
(27, '202.77.124.52', 'countrydist0@gmail.com', 2, 1512257929),
(28, '202.77.124.52', 'dtech@gmail.com', 1, 1512257961),
(29, '202.77.124.52', ' xdistro@gmail.com', 1, 1512257983),
(30, '202.77.124.52', ' partner3@gmail.com', 1, 1512257997),
(31, '139.192.106.18', 'customer@uniq365.com', 1, 1512469505),
(32, '14.192.208.242', 'partner3@gmail.com', 1, 1512725238),
(33, '14.192.208.242', 'testmail@email.com', 1, 1512726007);

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(96) NOT NULL,
  `short_Description` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `modules`
--

INSERT INTO `modules` (`id`, `name`, `short_Description`, `description`, `active`) VALUES
(13, 'Test Modules Name 2', 'Test Short', 'Test Description 2', 1),
(14, 'sgsgsfgsf', 'sfgsgsgssfsfsd', 'ddgdfgdf', 0),
(15, 'Starter', 'U365 Starter', 'Uniq Starter', 1),
(16, 'Stardard', 'U365 Standard', 'Uniq Standard', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `partners`
--

CREATE TABLE `partners` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(96) NOT NULL,
  `picture` varchar(96) DEFAULT NULL,
  `remarks` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `commision` decimal(10,2) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `partners`
--

INSERT INTO `partners` (`id`, `country_id`, `name`, `picture`, `remarks`, `created_at`, `created_by`, `changed_at`, `changed_by`, `valid_from`, `valid_to`, `domain`, `commision`, `active`) VALUES
(1, 14, 'Song', '', '', NULL, NULL, '2017-11-14 02:47:31', 1, '0000-00-00', '2017-11-30', '', '0.00', 0),
(3, 11, 'CV Singa Besar', NULL, '', '2017-11-02 21:21:42', 1, '2017-12-01 09:53:35', 16, '0000-00-00', '2017-11-30', '', '0.00', 1),
(4, 13, 'IDSolutions', '520ec78f8ba206bf4af35a3552a836ed.jpg', 'Test', '2017-11-02 21:22:02', 1, '2017-11-15 03:54:24', 5, '2017-11-08', '2018-01-03', 'afadfadfadf', '1.00', 0),
(6, 11, 'PT Gudang Garam', '', 'Remark test', '2017-11-09 04:33:18', 1, '2017-12-01 09:51:39', 16, '0000-00-00', '2017-01-13', '', '1.00', 0),
(7, 11, 'PT Aris INternational', '', 'remark', '2017-11-09 04:34:26', 1, '2017-11-23 06:30:11', 16, '2017-01-01', '2017-01-02', 'Test Domain update lagi', '35.00', 1),
(10, 13, 'Cloud2Go', '', '-', '2017-11-15 07:30:40', 12, '2017-11-28 05:40:59', 1, '0000-00-00', '2018-10-31', '', '0.20', 1),
(11, 11, 'PT Sudomo Sukses', '', '', '2017-11-23 04:19:58', 5, '2017-12-01 09:52:45', 16, '0000-00-00', '2017-12-31', '', '0.25', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset`
--

CREATE TABLE `password_reset` (
  `ID` int(11) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `IP` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `txn_id` int(11) NOT NULL,
  `PaymentMethod` varchar(50) NOT NULL,
  `PayerStatus` varchar(50) NOT NULL,
  `PayerMail` int(100) NOT NULL,
  `Total` decimal(19,2) NOT NULL,
  `SubTotal` decimal(19,2) NOT NULL,
  `Tax` decimal(19,2) NOT NULL,
  `Payment_state` varchar(50) NOT NULL,
  `CreateTime` varchar(50) NOT NULL,
  `UpdateTime` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_confirmation`
--

CREATE TABLE `payment_confirmation` (
  `id` int(10) UNSIGNED NOT NULL,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `remarks` text,
  `attachment` text,
  `date` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_logs`
--

CREATE TABLE `payment_logs` (
  `ID` int(11) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `email` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `processor` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_plans`
--

CREATE TABLE `payment_plans` (
  `ID` int(11) NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hexcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fontcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `days` int(11) NOT NULL DEFAULT '0',
  `sales` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) DEFAULT '1',
  `userquota` int(11) NOT NULL,
  `addcost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `payment_plans`
--

INSERT INTO `payment_plans` (`ID`, `country_id`, `name`, `hexcolor`, `fontcolor`, `cost`, `days`, `sales`, `description`, `icon`, `active`, `userquota`, `addcost`) VALUES
(3, 11, 'PROFESSIONAL PLAN', '55CD7B', 'FFFFFF', '100000.00', 30, 6, 'Get all the benefits of basic at a cheaper price and gain content for longer.', 'glyphicon glyphicon-piggy-bank', 1, 1, '50000.00'),
(6, 11, 'STARTER', '36EBFF', 'FFFFFF', '0.00', 0, 0, 'FREE STARTER PLAN', 'glyphicon glyphicon-piggy-bank', 1, 1, '0.00'),
(8, 11, 'PREMIER PLAN', 'FFFFFF', 'FFFFFF', '300000.00', 30, 0, 'PREMIER PLAN', 'glyphicon glyphicon-piggy-bank', 1, 1, '0.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_plan_modules`
--

CREATE TABLE `payment_plan_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `module_id` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `payment_plan_modules`
--

INSERT INTO `payment_plan_modules` (`id`, `plan_id`, `module_id`, `active`) VALUES
(1, 3, 1, 0),
(2, 3, 2, 0),
(3, 3, 3, 0),
(4, 3, 4, 0),
(5, 3, 5, 0),
(6, 3, 6, 0),
(7, 3, 7, 0),
(8, 3, 8, 0),
(9, 3, 9, 0),
(10, 3, 10, 0),
(11, 3, 11, 0),
(12, 3, 12, 0),
(13, 3, 13, 0),
(14, 3, 14, 0),
(15, 3, 15, 0),
(16, 3, 16, 0),
(17, 3, 17, 0),
(18, 3, 18, 0),
(19, 3, 19, 0),
(20, 3, 20, 0),
(21, 3, 21, 0),
(22, 3, 22, 0),
(23, 3, 23, 0),
(24, 3, 24, 0),
(25, 3, 25, 0),
(26, 3, 26, 0),
(27, 3, 27, 0),
(28, 3, 28, 0),
(29, 3, 29, 0),
(30, 3, 30, 0),
(31, 3, 31, 0),
(32, 3, 32, 0),
(33, 3, 33, 0),
(34, 3, 34, 0),
(35, 3, 35, 0),
(36, 3, 36, 0),
(37, 3, 37, 0),
(38, 3, 38, 0),
(39, 3, 39, 0),
(40, 3, 40, 0),
(41, 3, 41, 0),
(42, 3, 42, 0),
(43, 3, 43, 0),
(44, 3, 44, 0),
(45, 3, 45, 0),
(46, 3, 46, 0),
(47, 3, 47, 0),
(48, 3, 48, 0),
(49, 3, 49, 0),
(50, 3, 50, 0),
(51, 3, 51, 0),
(52, 3, 52, 0),
(53, 3, 53, 0),
(54, 3, 54, 0),
(55, 3, 55, 0),
(56, 3, 56, 0),
(57, 3, 57, 0),
(58, 3, 58, 0),
(59, 3, 59, 0),
(60, 3, 60, 0),
(61, 3, 61, 0),
(62, 3, 62, 0),
(63, 3, 63, 0),
(64, 3, 64, 0),
(65, 3, 65, 0),
(66, 3, 66, 0),
(67, 3, 67, 0),
(68, 3, 68, 0),
(69, 3, 69, 0),
(70, 3, 70, 0),
(71, 3, 71, 0),
(72, 3, 72, 0),
(73, 3, 73, 0),
(74, 3, 74, 0),
(75, 3, 75, 0),
(76, 3, 76, 0),
(77, 3, 77, 0),
(78, 3, 78, 0),
(79, 3, 79, 0),
(80, 3, 80, 0),
(81, 3, 81, 0),
(82, 3, 82, 0),
(83, 3, 83, 0),
(84, 3, 84, 0),
(85, 3, 85, 0),
(86, 3, 86, 0),
(87, 3, 87, 0),
(88, 3, 88, 0),
(89, 3, 89, 0),
(90, 3, 90, 0),
(91, 3, 91, 0),
(92, 3, 92, 0),
(93, 3, 93, 0),
(94, 3, 94, 0),
(95, 3, 95, 0),
(96, 3, 96, 0),
(97, 3, 97, 0),
(98, 3, 98, 0),
(99, 3, 99, 0),
(100, 3, 100, 0),
(101, 3, 101, 0),
(102, 3, 102, 0),
(103, 3, 103, 0),
(104, 3, 104, 0),
(105, 3, 105, 0),
(106, 3, 106, 0),
(107, 3, 107, 0),
(108, 3, 108, 0),
(109, 3, 109, 0),
(110, 3, 110, 0),
(111, 3, 111, 0),
(112, 3, 112, 0),
(113, 3, 113, 0),
(114, 3, 114, 0),
(115, 3, 115, 0),
(116, 3, 116, 0),
(117, 3, 117, 0),
(118, 3, 118, 0),
(119, 3, 119, 0),
(120, 3, 120, 0),
(121, 3, 121, 0),
(122, 3, 122, 0),
(123, 3, 123, 0),
(124, 3, 124, 0),
(125, 3, 125, 0),
(126, 3, 126, 0),
(127, 3, 127, 0),
(128, 3, 128, 0),
(129, 3, 129, 0),
(130, 3, 130, 0),
(131, 3, 131, 0),
(132, 3, 132, 0),
(133, 3, 133, 0),
(134, 3, 134, 0),
(135, 3, 135, 0),
(136, 3, 136, 0),
(137, 3, 137, 0),
(138, 3, 138, 0),
(139, 3, 139, 0),
(140, 3, 140, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reset_log`
--

CREATE TABLE `reset_log` (
  `ID` int(11) NOT NULL,
  `IP` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `site_layouts`
--

CREATE TABLE `site_layouts` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layout_path` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `site_layouts`
--

INSERT INTO `site_layouts` (`ID`, `name`, `layout_path`) VALUES
(1, 'Basic', 'layout/layout.php'),
(2, 'Titan', 'layout/titan_layout.php');

-- --------------------------------------------------------

--
-- Struktur dari tabel `site_menus`
--

CREATE TABLE `site_menus` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dropdown` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `site_menus`
--

INSERT INTO `site_menus` (`ID`, `name`, `dropdown`, `icon`) VALUES
(1, '111', 1, '111');

-- --------------------------------------------------------

--
-- Struktur dari tabel `site_menu_links`
--

CREATE TABLE `site_menu_links` (
  `ID` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `site_menu_links`
--

INSERT INTO `site_menu_links` (`ID`, `menuid`, `url`, `name`) VALUES
(1, 1, '111', '111');

-- --------------------------------------------------------

--
-- Struktur dari tabel `site_settings`
--

CREATE TABLE `site_settings` (
  `ID` int(11) NOT NULL,
  `site_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `site_desc` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `upload_path` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `upload_path_relative` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `site_email` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `site_logo` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'logo.png',
  `register` int(11) NOT NULL,
  `disable_captcha` int(11) NOT NULL,
  `date_format` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `avatar_upload` int(11) NOT NULL DEFAULT '1',
  `file_types` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `twitter_consumer_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `twitter_consumer_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `disable_social_login` int(11) NOT NULL,
  `facebook_app_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_app_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `google_client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `google_client_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `paypal_email` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `paypal_currency` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `payment_enabled` int(11) NOT NULL,
  `payment_symbol` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '$',
  `global_premium` int(11) NOT NULL,
  `install` int(11) NOT NULL DEFAULT '1',
  `login_protect` int(11) NOT NULL,
  `activate_account` int(11) NOT NULL,
  `default_user_role` int(11) NOT NULL,
  `secure_login` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `menu_highlight` int(11) NOT NULL,
  `stripe_secret_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_publish_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `google_recaptcha` int(11) NOT NULL,
  `google_recaptcha_secret` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `google_recaptcha_key` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `layout` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `logo_option` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `site_settings`
--

INSERT INTO `site_settings` (`ID`, `site_name`, `site_desc`, `upload_path`, `upload_path_relative`, `site_email`, `site_logo`, `register`, `disable_captcha`, `date_format`, `avatar_upload`, `file_types`, `twitter_consumer_key`, `twitter_consumer_secret`, `disable_social_login`, `facebook_app_id`, `facebook_app_secret`, `google_client_id`, `google_client_secret`, `file_size`, `paypal_email`, `paypal_currency`, `payment_enabled`, `payment_symbol`, `global_premium`, `install`, `login_protect`, `activate_account`, `default_user_role`, `secure_login`, `comments`, `menu_highlight`, `stripe_secret_key`, `stripe_publish_key`, `google_recaptcha`, `google_recaptcha_secret`, `google_recaptcha_key`, `layout`, `logo_option`) VALUES
(1, 'Uniq365', 'Welcome to Uniq365', '/home/u0857367/public_html/uniqmembership/admin/uploads', 'uploads', 'test@test.com', '2f27c1d0398cb445a224f4d7e89dbc35.png', 0, 1, 'd/m/Y', 1, 'gif|png|jpg|jpeg', '', '', 0, '', '', '', '', 1028, '', 'USD', 1, '$', 0, 0, 1, 0, 5, 1, 1, 0, '', '', 0, '', '', 'layout/layout.php', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `rate` float UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `taxes`
--

INSERT INTO `taxes` (`id`, `country_id`, `name`, `code`, `rate`, `created_at`, `created_by`, `changed_at`, `changed_by`) VALUES
(1, 11, 'Tax A', 'TX01', 10, '2017-11-06 21:34:30', 1, '2017-11-06 21:40:51', 1),
(2, 13, 'Tax B', 'TX02', 6, '2017-11-06 21:37:28', 1, '2017-11-15 05:39:58', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `IP` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `avatar` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.png',
  `joined` int(11) NOT NULL DEFAULT '0',
  `joined_date` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `online_timestamp` int(11) NOT NULL DEFAULT '0',
  `oauth_provider` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `oauth_id` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `oauth_token` varchar(1500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `oauth_secret` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email_notification` int(11) NOT NULL DEFAULT '1',
  `aboutme` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `points` decimal(10,2) NOT NULL DEFAULT '0.00',
  `premium_time` int(11) NOT NULL DEFAULT '0',
  `user_role` int(11) NOT NULL DEFAULT '0',
  `premium_planid` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  `activate_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_added` int(11) DEFAULT '0',
  `plan_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`ID`, `email`, `password`, `token`, `IP`, `username`, `first_name`, `last_name`, `avatar`, `joined`, `joined_date`, `online_timestamp`, `oauth_provider`, `oauth_id`, `oauth_token`, `oauth_secret`, `email_notification`, `aboutme`, `points`, `premium_time`, `user_role`, `premium_planid`, `active`, `activate_code`, `user_added`, `plan_active`) VALUES
(1, 'meriz.works@gmail.com', '$2a$12$wcamsfkreZ6NOrw0IpbHfeQwPVa0mb3lLYPxQSTKVdCMhvU5B9N6O', '07b71b97aa2f323be76ca26cc643c8f4', '127.0.0.1', 'meriz', 'Admin', 'User', 'default.png', 1508998860, '10-2017', 1515063715, '', '', '', '', 1, '', '0.00', 0, 1, 0, 1, '', 0, 0),
(2, 'dermaluzofficial@gmail.com', '$2a$12$1qa9loY5AAE9pMKh9GBSneN9x1mPS.av6R07YvStQnpH0bsuXrFgy', '445461ca3b397f0e5a4c118d63154815', '127.0.0.1', 'dermaluz', 'dermaluz', 'official', 'default.png', 1508999216, '10-2017', 1509425168, '', '', '', '', 1, '', '3994.00', 1514183799, 5, 2, 1, '', 0, 0),
(5, 'admin@uniq365.com', '$2a$12$hN5hsPHhLUekb.OhAr43c.VlGKN6ta.gPKUI8L14X7NO4tsFYisEa', '4962495e647556c11a1ed4dde26f1d70', '118.137.0.125', 'admin', 'admin', '365', 'default.png', 1510538821, '11-2017', 1512257872, '', '', '', '', 1, '', '0.00', 0, 1, 0, 1, '', 0, 0),
(7, 'partnertest@gmail.com', '$2a$12$0WrWb5LyG0eyRgNrD2T3luCPNpR2ZYO9x7IJUOvae9nvBrGo3imlS', '73480cb07750765e401076255412e4cd', '118.137.0.125', 'partnertest', 'partnertest', '', 'default.png', 1510538931, '11-2017', 1515063750, '', '', '', '', 1, '', '0.00', 0, 11, 0, 1, '', 0, 0),
(8, 'song@gmail.com', '$2a$12$2xxrvhId6KG25JasaYbMMubmKqweshd59LHIaztJl7tPpLRHJc8qG', '', '139.192.106.18', 'song', 'song', '', 'default.png', 1510717340, '11-2017', 0, '', '', '', '', 1, '', '0.00', 0, 10, 0, 1, '', 0, 0),
(9, 'distributor@gmail.com', '$2a$12$NlurOzbf/p5YWQGz1kWObeXtmwaC2WIDCSEbuHZIG0EkG4bXZFYLC', 'c76de18e0ae145a7b7bb95bd0a6398d8', '139.192.106.18', 'distributor', 'distributor', '', 'default.png', 1510721137, '11-2017', 1512116072, '', '', '', '', 1, '', '0.00', 0, 9, 0, 1, '', 0, 0),
(10, 'partnertest@gmail.com', '$2a$12$TTNWtKAADtDufHGxhGghGOvDkGI0.iyoS/LfieK7p5vt6LshYyB8W', 'd6dc4dd63d70092890be2aff478190a2', '139.192.106.18', 'partnertest', 'partnertest', '', 'default.png', 1510721212, '11-2017', 1510721359, '', '', '', '', 1, '', '0.00', 0, 10, 0, 1, '', 0, 0),
(11, 'customer1@gmail.com', '$2a$12$5D87jaU5w0zKRbUie/F10OFKrchIgCTLCd2qwmi/0lFwaFeA9JUhe', 'e434293cd25bdf430d9c2aa59d4ec405', '139.192.106.18', 'customer1', 'customer1', '', 'default.png', 1510721256, '11-2017', 1511747832, '', '', '', '', 1, '', '0.00', 0, 11, 0, 1, '', 0, 0),
(12, 'jess@a2000.net', '$2a$12$JJOgUHJ8VuA4YUg8WKNHn.RyJGSpdRvixbrmh1J/BzMu9YqzNBOiK', '8432d3ac34179215b0fa5a0c59034bb8', '60.54.60.103', 'Jess', 'Jess', 'Wong', 'default.png', 1510724622, '11-2017', 1510733893, '', '', '', '', 1, '', '0.00', 0, 9, 0, 1, '', 0, 0),
(13, 'distributor4@gmail.com', '$2a$12$M6z/M..XDDEMpVVpe2txVu2/ABR.bouqN0W0gA23BQviSZa84fz3W', 'a0ab9678da089de3398ea7a3d9dd88e4', '139.192.106.18', 'distributor4', 'distributor4', '', 'default.png', 1510726725, '11-2017', 1510796156, '', '', '', '', 1, '', '0.00', 0, 9, 0, 1, '', 0, 0),
(14, 'admin2@uniq365.com', '$2a$12$MDtPiU1qAdKTRsT.iq/icuOR41GJIw8zvwScq9FYLpGuJ5VvG7iLi', 'e24ac0d908c557f3b604a839ae180191', '139.192.106.18', 'admin2', 'Admin2', '', 'default.png', 1510728042, '11-2017', 1511177272, '', '', '', '', 1, '', '0.00', 0, 1, 0, 1, '', 0, 0),
(15, 'distributor2@gmail.com', '$2a$12$9Xirk/Sf8sPkB/k04ENi6uOdJ7j6zGaHaUptPM5zaa2K0B4LreRA2', '', '139.192.106.18', 'distributor2', 'distributor2', '', 'default.png', 1510728077, '11-2017', 0, '', '', '', '', 1, '', '0.00', 0, 9, 0, 1, '', 0, 0),
(16, 'xdistro@gmail.com', '$2a$12$ioNF1Eab0eVmbfib54RLX.2BhMFx9uERUv8WOVRmUlA.9t7FN8Ohi', 'c1311f1ef492658a7b2f1b6177822281', '139.192.106.18', 'xdistro', 'xdistro', '', 'default.png', 1510728773, '11-2017', 1512725176, '', '', '', '', 1, '', '0.00', 0, 9, 0, 1, '', 0, 0),
(17, 'ydistro@gmail.com', '$2a$12$ea6BzCEtiWupfWcW87JYx.4VjB7yZKIKfUQn1c179PbKGi4oLnUGa', '', '139.192.106.18', 'ydistro', 'ydistro', '', 'default.png', 1510729561, '11-2017', 0, '', '', '', '', 1, '', '0.00', 0, 9, 0, 1, '', 0, 0),
(18, 'cloud2go@mail.com', '$2a$12$WyySACFwJAEsxpPPMMsKmuR0jOpGJzxuGWJu3IHJbFkhr/FrS7ZQW', 'f5d35347e9661b5b572101757a25dd2c', '60.51.75.20', 'cloud2go', 'Hayden', 'Lee', 'default.png', 1510731222, '11-2017', 1512726115, '', '', '', '', 1, '', '0.00', 0, 10, 0, 1, '', 0, 0),
(19, 'distributorindo@gmail.com', '$2a$12$khxBTdK.ojcHH18pGmAR7.kRoDwKYugM8BgusdJHoRthOI2B1euZ.', '0a58d7fe879e04d2a1294f77e3aa5328', '139.192.106.18', 'distributorindo', 'distributorindo', 'distributorindo', 'default.png', 1510733291, '11-2017', 1510911527, '', '', '', '', 1, '', '0.00', 0, 9, 0, 1, '', 0, 0),
(20, 'cws@mail.comq', '$2a$12$KrLfRtsdg.J7k21Emd72ROhcAguPoyhNAC6icKaWqUtFt44N9hZKS', 'cd69bb1151249ab25d51f62f60f219a3', '60.51.75.20', 'cws', 'Judy', 'Chan', 'default.png', 1510734510, '11-2017', 1510735423, '', '', '', '', 1, '', '0.00', 0, 11, 0, 1, '', 0, 0),
(21, 'customer@uniq365.com', '$2a$12$yHf2dyC99RZumBT8u9ez9utMdVDIt4Tc392ScgfS4ynxkoZ1pzJcq', '656a4bb40020cc12cc845cf9ebc73a5d', '139.192.106.18', 'customer', 'customer', '', 'default.png', 1510890415, '11-2017', 1515061439, '', '', '', '', 1, '', '0.00', 0, 11, 0, 1, '', 0, 0),
(22, 'membercustomer@gmail.com', '$2a$12$EjS7Ve9iAkpomoNciMK3OuYGxGQASL.pe3cyeE0cSeQzYS8e8LKwa', '', '118.137.0.125', 'membercustomer', 'Membercustomer', '1', 'default.png', 1511191502, '11-2017', 0, '', '', '', '', 1, '', '0.00', 0, 5, 0, 1, '', 0, 0),
(23, 'membercustomer2@gmail.com', '$2a$12$r1KNxANWj6uq0Ux8rPgfcer14oC6A1D4dT8xpQ6YdvIY4O.b1jZJe', '', '118.137.0.125', 'membercustomer2', 'Membercustomer', '2', 'default.png', 1511191538, '11-2017', 0, '', '', '', '', 1, '', '0.00', 0, 5, 0, 1, '', 0, 0),
(24, 'membercustomer3@gmail.com', '$2a$12$7vQcArqYj/7LSeSP4bhVBevYic289EQaT8abreBbHBzz8Ijz8K6eS', '', '118.137.0.125', 'membercustomer3', 'Membercustomer3', '33', 'default.png', 1511191619, '11-2017', 0, '', '', '', '', 1, '', '0.00', 0, 5, 0, 1, '', 0, 0),
(25, 'xtramax@gmail.com', '$2a$12$Ohoptc7sO3BpQeAM6G61.eQ8.5eOz4.2pUZWsA4M.uLKoHRjuJRGG', 'ec0961dc5a007467dd36802f0278b891', '139.192.106.18', 'xtramax', 'xtramax', '', 'default.png', 1511407387, '11-2017', 1511420236, '', '', '', '', 1, '', '310.00', 1526959792, 11, 3, 1, '', 2, 0),
(26, 'xtramax1@gmail.com', '$2a$12$HKhcOrMcIfWmGxaqa/PpouZ8OK5yQKdFtA6XsGyXkQqpIgaIyJBge', '', '139.192.106.18', 'xtramax1', 'xtramax1', '', 'default.png', 1511407831, '11-2017', 0, '', '', '', '', 1, '', '0.00', 0, 5, 0, 1, '', 0, 0),
(27, 'partner3@gmail.com', '$2a$12$M65W0.D19Dutsl40tfvK7euGBmYbI6smVrsbk/Ct3ksICXL5iP2Yu', '15eff617de967c4ecca19bf7a7f8efcc', '139.192.106.18', 'partner3', 'Partner3', '', 'default.png', 1511410825, '11-2017', 1512725246, '', '', '', '', 1, '', '0.00', 0, 10, 0, 1, '', 0, 0),
(29, 'meriz.team@gmail.com', '$2a$12$TEkuVDTDdb.YaO1m7doAL.29KP6GSy9gA8Bn7RJLHKU8tp/OdUsES', '54a05b2de3519accc8a593661509037d', '118.137.0.125', 'merizteam', 'meriz', 'Tech', 'default.png', 1512119766, '12-2017', 1512120309, '', '', '', '', 1, '', '0.00', 1514711807, 11, 3, 1, '', 0, 1),
(30, 'vivo@mail.com', '$2a$12$umRmGPMv1p9/mRHeReEO5eK5W58REObCS11tL47x4tlR8.FHMSDh6', '9b1827a492df40a882270ef312d2c9fe', '14.192.208.242', 'Vivo', 'Vivo', 'V', 'default.png', 1512725541, '12-2017', 1512725556, '', '', '', '', 1, '', '0.00', 0, 11, 6, 1, '', 0, 0),
(31, 'serassi@mail.com', '$2a$12$dC3PS1meKxCF50DSG0OS7e479s8L.lgSIjeH8.OuoUbVC1Ue3dIGC', '', '14.192.208.242', 'serassi', 'serassi', 'Lee', 'default.png', 1512725925, '12-2017', 0, '', '', '', '', 1, '', '0.00', 0, 11, 0, 1, '', 0, 0),
(32, 'testmail@email.com', '$2a$12$qbNsDz6ky4Q9VO0rOybbluMwzkAJ1m5rAs9IpBkZn4osEtATPIJxq', '1b3acc38329c1f14e9fce6c353ac31b7', '14.192.208.242', 'testmail', 'first', 'last', 'default.png', 1512725998, '12-2017', 1512726015, '', '', '', '', 0, '', '0.00', 0, 11, 0, 1, '', 0, 0),
(34, 'muresaaa@gmail.com', '$2a$12$T52ide8l7dnXRvsH/aSh3.Ox1zuhjJcdEJUYY.8szyOilweqjUpQC', '0ffac7082193376f7babb7c30028f32b', '139.192.106.18', 'muresa', 'reza', 'saddat', 'default.png', 1515061693, '1-2018', 1515063307, '', '', '', '', 1, '', '0.00', 0, 11, 0, 1, '', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_as`
--

CREATE TABLE `users_as` (
  `id` int(11) NOT NULL,
  `country_distributor_id` int(10) UNSIGNED DEFAULT NULL,
  `partner_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users_as`
--

INSERT INTO `users_as` (`id`, `country_distributor_id`, `partner_id`, `customer_id`) VALUES
(9, 6, NULL, NULL),
(12, 7, NULL, NULL),
(13, 4, NULL, NULL),
(15, 3, NULL, NULL),
(16, 8, NULL, NULL),
(17, 9, NULL, NULL),
(18, NULL, 10, NULL),
(19, 1, NULL, NULL),
(20, NULL, NULL, 5),
(21, NULL, NULL, 6),
(25, NULL, NULL, 7),
(27, NULL, 11, NULL),
(29, NULL, NULL, 9),
(30, NULL, NULL, 11),
(32, NULL, NULL, 12),
(33, NULL, NULL, 13),
(34, NULL, NULL, 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_company`
--

CREATE TABLE `users_company` (
  `id` int(11) NOT NULL,
  `customer_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users_company`
--

INSERT INTO `users_company` (`id`, `customer_id`) VALUES
(22, 6),
(23, 6),
(24, 6),
(26, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_custom_fields`
--

CREATE TABLE `user_custom_fields` (
  `ID` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_events`
--

CREATE TABLE `user_events` (
  `ID` int(11) NOT NULL,
  `IP` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_groups`
--

CREATE TABLE `user_groups` (
  `ID` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `user_groups`
--

INSERT INTO `user_groups` (`ID`, `name`, `default`) VALUES
(1, 'Default Group', 1),
(2, 'Tes Group', 0),
(3, 'Tes Group 2', 0),
(4, 'Tes Group 3', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_group_users`
--

CREATE TABLE `user_group_users` (
  `ID` int(11) NOT NULL,
  `groupid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `user_group_users`
--

INSERT INTO `user_group_users` (`ID`, `groupid`, `userid`) VALUES
(1, 1, 2),
(2, 1, 28),
(3, 1, 29),
(4, 1, 32),
(5, 1, 33),
(6, 1, 34);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_roles`
--

CREATE TABLE `user_roles` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `admin` int(11) NOT NULL DEFAULT '0',
  `admin_settings` int(11) NOT NULL DEFAULT '0',
  `admin_members` int(11) NOT NULL DEFAULT '0',
  `admin_payment` int(11) NOT NULL DEFAULT '0',
  `banned` int(11) NOT NULL DEFAULT '0',
  `content_worker` int(11) NOT NULL DEFAULT '0',
  `content_manager` int(11) NOT NULL DEFAULT '0',
  `country_distributor` tinyint(4) NOT NULL DEFAULT '0',
  `partner` tinyint(4) NOT NULL DEFAULT '0',
  `customer` tinyint(4) NOT NULL DEFAULT '0',
  `member` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `user_roles`
--

INSERT INTO `user_roles` (`ID`, `name`, `admin`, `admin_settings`, `admin_members`, `admin_payment`, `banned`, `content_worker`, `content_manager`, `country_distributor`, `partner`, `customer`, `member`) VALUES
(1, 'Admin', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Member Manager', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Admin Settings', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'Admin Payments', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(5, 'Member', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6, 'Banned', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(7, 'Content Manager', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(8, 'Content Worker', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
(9, 'Country Distributor', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(10, 'Partner', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(11, 'Customer', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `content_categories`
--
ALTER TABLE `content_categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `content_pages`
--
ALTER TABLE `content_pages`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `content_page_comments`
--
ALTER TABLE `content_page_comments`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `content_page_groups`
--
ALTER TABLE `content_page_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `content_page_plans`
--
ALTER TABLE `content_page_plans`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `content_page_roles`
--
ALTER TABLE `content_page_roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `country_distributor`
--
ALTER TABLE `country_distributor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `home_stats`
--
ALTER TABLE `home_stats`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `ipn_log`
--
ALTER TABLE `ipn_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `ip_block`
--
ALTER TABLE `ip_block`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `payment_confirmation`
--
ALTER TABLE `payment_confirmation`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `payment_plans`
--
ALTER TABLE `payment_plans`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `payment_plan_modules`
--
ALTER TABLE `payment_plan_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reset_log`
--
ALTER TABLE `reset_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `site_layouts`
--
ALTER TABLE `site_layouts`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `site_menus`
--
ALTER TABLE `site_menus`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `site_menu_links`
--
ALTER TABLE `site_menu_links`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `users_as`
--
ALTER TABLE `users_as`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `country_distributor_id_UNIQUE` (`country_distributor_id`),
  ADD UNIQUE KEY `partner_id_UNIQUE` (`partner_id`),
  ADD UNIQUE KEY `customer_id_UNIQUE` (`customer_id`);

--
-- Indeks untuk tabel `users_company`
--
ALTER TABLE `users_company`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_custom_fields`
--
ALTER TABLE `user_custom_fields`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `user_events`
--
ALTER TABLE `user_events`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `user_group_users`
--
ALTER TABLE `user_group_users`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `city`
--
ALTER TABLE `city`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `content_categories`
--
ALTER TABLE `content_categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `content_pages`
--
ALTER TABLE `content_pages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `content_page_comments`
--
ALTER TABLE `content_page_comments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `content_page_groups`
--
ALTER TABLE `content_page_groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `content_page_plans`
--
ALTER TABLE `content_page_plans`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `content_page_roles`
--
ALTER TABLE `content_page_roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `country_distributor`
--
ALTER TABLE `country_distributor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `home_stats`
--
ALTER TABLE `home_stats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ipn_log`
--
ALTER TABLE `ipn_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ip_block`
--
ALTER TABLE `ip_block`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payment_plans`
--
ALTER TABLE `payment_plans`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `payment_plan_modules`
--
ALTER TABLE `payment_plan_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT untuk tabel `reset_log`
--
ALTER TABLE `reset_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `site_layouts`
--
ALTER TABLE `site_layouts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `site_menus`
--
ALTER TABLE `site_menus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `site_menu_links`
--
ALTER TABLE `site_menu_links`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `user_custom_fields`
--
ALTER TABLE `user_custom_fields`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_events`
--
ALTER TABLE `user_events`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user_group_users`
--
ALTER TABLE `user_group_users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
