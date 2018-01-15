-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 15 Jan 2018 pada 06.04
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
-- Database: `uniq365_empty`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) UNSIGNED NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_no` int(11) NOT NULL DEFAULT '0',
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `unique_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `filename` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `filetype` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `audit_trail`
--

CREATE TABLE `audit_trail` (
  `id` int(11) NOT NULL,
  `type` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `trans_no` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fiscal_year` int(11) NOT NULL,
  `gl_date` date NOT NULL DEFAULT '0000-00-00',
  `gl_seq` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bad_debts`
--

CREATE TABLE `bad_debts` (
  `id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `type_no` int(16) NOT NULL,
  `tran_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `step` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `account_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_type` smallint(6) NOT NULL DEFAULT '0',
  `bank_account_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_account_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_address` tinytext COLLATE utf8_unicode_ci,
  `bank_curr_code` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_curr_act` tinyint(1) NOT NULL DEFAULT '0',
  `id` smallint(6) NOT NULL,
  `last_reconciled_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ending_reconcile_balance` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_trans`
--

CREATE TABLE `bank_trans` (
  `id` int(11) NOT NULL,
  `type` smallint(6) DEFAULT NULL,
  `trans_no` int(11) DEFAULT NULL,
  `bank_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_inclusive` tinyint(1) NOT NULL DEFAULT '0',
  `ref` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trans_date` date NOT NULL DEFAULT '0000-00-00',
  `amount` double DEFAULT NULL,
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `person_type_id` int(11) NOT NULL DEFAULT '0',
  `person_id` tinyblob,
  `reconciled` date DEFAULT NULL,
  `cheque` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imported_goods_invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_upload` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_trans_detail`
--

CREATE TABLE `bank_trans_detail` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `account_code` char(10) NOT NULL,
  `amount` double NOT NULL,
  `trans_no` int(11) NOT NULL,
  `currence` char(50) NOT NULL,
  `currence_rate` double NOT NULL,
  `tax` int(11) NOT NULL,
  `cheque` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bom`
--

CREATE TABLE `bom` (
  `id` int(11) NOT NULL,
  `parent` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `workcentre_added` int(11) NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `budget_trans`
--

CREATE TABLE `budget_trans` (
  `counter` int(11) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `type_no` bigint(16) NOT NULL DEFAULT '1',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `memo_` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `dimension_id` int(11) DEFAULT '0',
  `dimension2_id` int(11) DEFAULT '0',
  `person_type_id` int(11) DEFAULT NULL,
  `person_id` tinyblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `chart_class`
--

CREATE TABLE `chart_class` (
  `cid` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `class_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ctype` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `chart_class`
--

INSERT INTO `chart_class` (`cid`, `class_name`, `ctype`, `inactive`) VALUES
('1', 'Assets', 1, 0),
('2', 'Liabilities', 2, 0),
('3', 'Income', 4, 0),
('4', 'Costs', 6, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `chart_master`
--

CREATE TABLE `chart_master` (
  `account_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_code2` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `chart_master`
--

INSERT INTO `chart_master` (`account_code`, `account_code2`, `account_name`, `account_type`, `inactive`) VALUES
('1060', '', 'Bank', '1', 0),
('1065', '', 'Petty Cash', '1', 0),
('1200', '', 'Trade Debtors', '1', 0),
('1205', '', 'Allowance for doubtful accounts', '1', 0),
('1510', '', 'Inventory', '2', 0),
('1520', '', 'Stocks of Raw Materials', '2', 0),
('1530', '', 'Stocks of Work In Progress', '2', 0),
('1540', '', 'Stocks of Finsihed Goods', '2', 0),
('1550', '', 'Goods Received Clearing account', '2', 0),
('1820', '', 'Office Furniture &amp; Equipment', '3', 0),
('1825', '', 'Accum. Amort. -Furn. &amp; Equip.', '3', 0),
('1840', '', 'Vehicle', '3', 0),
('1845', '', 'Accum. Amort. -Vehicle', '3', 0),
('2100', '', 'Trade Creditor', '4', 0),
('2110', '', 'Accrued Income Tax - Federal', '4', 0),
('2120', '', 'Accrued Income Tax - State', '4', 0),
('2130', '', 'Accrued Franchise Tax', '4', 0),
('2140', '', 'Accrued Real &amp; Personal Prop Tax', '4', 0),
('2150', '', 'GST Output Tax', '4', 0),
('2160', '', 'Accrued Use Tax Payable', '4', 0),
('2210', '', 'Accrued Wages', '4', 0),
('2220', '', 'Accrued Comp Time', '4', 0),
('2230', '', 'Accrued Holiday Pay', '4', 0),
('2240', '', 'Accrued Vacation Pay', '4', 0),
('2310', '', 'Accr. Benefits - 401K', '4', 0),
('2320', '', 'Accr. Benefits - Stock Purchase', '4', 0),
('2330', '', 'Accr. Benefits - Med, Den', '4', 0),
('2340', '', 'Accr. Benefits - Payroll Taxes', '4', 0),
('2350', '', 'Accr. Benefits - Credit Union', '4', 0),
('2360', '', 'Accr. Benefits - Savings Bond', '4', 0),
('2370', '', 'Accr. Benefits - Garnish', '4', 0),
('2380', '', 'Accr. Benefits - Charity Cont.', '4', 0),
('2620', '', 'Bank Loans', '5', 0),
('2680', '', 'Loans from Shareholders', '5', 0),
('3350', '', 'Common Shares', '6', 0),
('3590', '', 'Retained Earnings - prior years', '7', 0),
('4010', '', 'Sales', '8', 0),
('4430', '', 'Shipping &amp; Handling', '9', 0),
('4440', '', 'Interest', '9', 0),
('4450', '', 'Foreign Exchange Gain', '9', 0),
('4500', '', 'Prompt Payment Discounts', '9', 0),
('4510', '', 'Discounts Given', '9', 0),
('5010', '', 'Cost of Goods Sold - Retail', '10', 0),
('5020', '', 'Material Usage Varaiance', '10', 0),
('5030', '', 'Consumable Materials', '10', 0),
('5040', '', 'Inventory Adjustment A/c', '10', 0),
('5050', '', 'Purchases of materials', '10', 0),
('5060', '', 'Discounts Received', '10', 0),
('5100', '', 'Postage &amp; Courier', '10', 0),
('5410', '', 'Wages &amp; Salaries', '11', 0),
('5420', '', 'Wages - Overtime', '11', 0),
('5430', '', 'Benefits - Comp Time', '11', 0),
('5440', '', 'Benefits - Payroll Taxes', '11', 0),
('5450', '', 'Benefits - Workers Comp', '11', 0),
('5460', '', 'Benefits - Pension', '11', 0),
('5470', '', 'Benefits - General Benefits', '11', 0),
('5510', '', 'Inc Tax Exp - Federal', '11', 0),
('5520', '', 'Inc Tax Exp - State', '11', 0),
('5530', '', 'Taxes - Real Estate', '11', 0),
('5540', '', 'Taxes - Personal Property', '11', 0),
('5550', '', 'Taxes - Franchise', '11', 0),
('5560', '', 'Taxes - Foreign Withholding', '11', 0),
('5610', '', 'Accounting &amp; Legal', '12', 0),
('5615', '', 'Advertising &amp; Promotions', '12', 0),
('5620', '', 'Bad Debts', '12', 0),
('5660', '', 'Amortization Expense', '12', 0),
('5685', '', 'Insurance', '12', 0),
('5690', '', 'Interest &amp; Bank Charges', '12', 0),
('5700', '', 'Office Supplies', '12', 0),
('5760', '', 'Rent', '12', 0),
('5765', '', 'Repair &amp; Maintenance', '12', 0),
('5780', '', 'Telephone', '12', 0),
('5785', '', 'Travel &amp; Entertainment', '12', 0),
('5790', '', 'Utilities', '12', 0),
('5795', '', 'Registrations', '12', 0),
('5800', '', 'Licenses', '12', 0),
('5810', '', 'Foreign Exchange Loss', '12', 0),
('9990', '', 'Year Profit/Loss', '12', 0),
('1300', '1300', 'GST Input Tax', '1', 0),
('5900', '5900', 'GST Expense (Not Claimable)', '12', 0),
('2152', '', 'GST Output Tax Zero Rated', '4', 0),
('1070', '', 'Public Bank Berhad', '1', 0),
('1071', '', 'Malayan Banking Berhad', '1', 0),
('4460', '', 'Divined Income', '9', 0),
('4011', '', 'Sales Commission', '8', 0),
('2154', '', 'Contra Account', '4', 0),
('1830', '', 'Computer &amp; Software', '3', 0),
('1835', '', 'Accum. Amort. - Computer &amp; Software', '3', 0),
('1201', '', 'Amount Loan To Director', '1', 0),
('4451', '', 'Rounding Difference', '9', 0),
('5710', '', 'Purchases', '12', 0),
('P1000', '', 'Petty Cash', '0', 0),
('1050', '', 'Bank USD', '1', 0),
('123456', '222', 'trial', '1', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `chart_types`
--

CREATE TABLE `chart_types` (
  `id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class_id` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `chart_types`
--

INSERT INTO `chart_types` (`id`, `name`, `class_id`, `parent`, `inactive`) VALUES
('1', 'Current Assets', '1', '', 0),
('2', 'Inventory Assets', '1', '', 0),
('3', 'Capital Assets', '1', '', 0),
('4', 'Current Liabilities', '2', '', 0),
('5', 'Long Term Liabilities', '2', '', 0),
('6', 'Share Capital', '2', '', 0),
('7', 'Retained Earnings', '2', '', 0),
('8', 'Sales Revenue', '3', '', 0),
('9', 'Other Revenue', '3', '', 0),
('10', 'Cost of Goods Sold', '4', '', 0),
('11', 'Payroll Expenses', '4', '', 0),
('12', 'General &amp; Administrative expenses', '4', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `type` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `date_` date DEFAULT '0000-00-00',
  `memo_` tinytext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `credit_status`
--

CREATE TABLE `credit_status` (
  `id` int(11) NOT NULL,
  `reason_description` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dissallow_invoices` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `credit_status`
--

INSERT INTO `credit_status` (`id`, `reason_description`, `dissallow_invoices`, `inactive`) VALUES
(1, 'Good History', 0, 0),
(3, 'No more work until payment received', 1, 0),
(4, 'In liquidation', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `crm_categories`
--

CREATE TABLE `crm_categories` (
  `id` int(11) NOT NULL COMMENT 'pure technical key',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'contact type e.g. customer',
  `action` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'detailed usage e.g. department',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'for category selector',
  `description` tinytext COLLATE utf8_unicode_ci NOT NULL COMMENT 'usage description',
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'nonzero for core system usage',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `crm_categories`
--

INSERT INTO `crm_categories` (`id`, `type`, `action`, `name`, `description`, `system`, `inactive`) VALUES
(1, 'cust_branch', 'general', 'General', 'General contact data for customer branch (overrides company setting)', 1, 0),
(2, 'cust_branch', 'invoice', 'Invoices', 'Invoice posting (overrides company setting)', 1, 0),
(3, 'cust_branch', 'order', 'Orders', 'Order confirmation (overrides company setting)', 1, 0),
(4, 'cust_branch', 'delivery', 'Deliveries', 'Delivery coordination (overrides company setting)', 1, 0),
(5, 'customer', 'general', 'General', 'General contact data for customer', 1, 0),
(6, 'customer', 'order', 'Orders', 'Order confirmation', 1, 0),
(7, 'customer', 'delivery', 'Deliveries', 'Delivery coordination', 1, 0),
(8, 'customer', 'invoice', 'Invoices', 'Invoice posting', 1, 0),
(9, 'supplier', 'general', 'General', 'General contact data for supplier', 1, 0),
(10, 'supplier', 'order', 'Orders', 'Order confirmation', 1, 0),
(11, 'supplier', 'delivery', 'Deliveries', 'Delivery coordination', 1, 0),
(12, 'supplier', 'invoice', 'Invoices', 'Invoice posting', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `crm_contacts`
--

CREATE TABLE `crm_contacts` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL DEFAULT '0' COMMENT 'foreign key to crm_contacts',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'foreign key to crm_categories',
  `action` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'foreign key to crm_categories',
  `entity_id` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entity id in related class table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `crm_persons`
--

CREATE TABLE `crm_persons` (
  `id` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `name2` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` tinytext COLLATE utf8_unicode_ci,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` char(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `currencies`
--

CREATE TABLE `currencies` (
  `currency` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_abrev` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_symbol` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hundreds_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `auto_update` tinyint(1) NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `currencies`
--

INSERT INTO `currencies` (`currency`, `curr_abrev`, `curr_symbol`, `country`, `hundreds_name`, `auto_update`, `inactive`) VALUES
('US Dollars', 'USD', 'US$', 'United States', 'Cents', 1, 0),
('Singapore Dollars', 'SGD', 'SG$', 'Singapore', 'Cents', 1, 0),
('Malaysian Ringgit', 'MYR', 'MYR', 'Malaysia', 'Sen', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cust_allocations`
--

CREATE TABLE `cust_allocations` (
  `id` int(11) NOT NULL,
  `amt` double UNSIGNED DEFAULT NULL,
  `date_alloc` date NOT NULL DEFAULT '0000-00-00',
  `trans_no_from` int(11) DEFAULT NULL,
  `trans_type_from` int(11) DEFAULT NULL,
  `trans_no_to` int(11) DEFAULT NULL,
  `trans_type_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cust_branch`
--

CREATE TABLE `cust_branch` (
  `branch_code` int(11) NOT NULL,
  `debtor_no` int(11) NOT NULL DEFAULT '0',
  `br_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `branch_ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `br_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `area` int(11) DEFAULT NULL,
  `salesman` int(11) NOT NULL DEFAULT '0',
  `contact_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default_location` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_group_id` int(11) DEFAULT NULL,
  `sales_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales_discount_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receivables_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_discount_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default_ship_via` int(11) NOT NULL DEFAULT '1',
  `disable_trans` tinyint(4) NOT NULL DEFAULT '0',
  `br_post_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `group_no` int(11) NOT NULL DEFAULT '0',
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dashboard_reminders`
--

CREATE TABLE `dashboard_reminders` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `next_date` date NOT NULL,
  `description` text,
  `frequency` varchar(20) NOT NULL,
  `param` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app` varchar(50) NOT NULL,
  `column_id` int(11) NOT NULL,
  `sort_no` int(11) NOT NULL,
  `collapsed` tinyint(4) NOT NULL,
  `widget` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `param` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `user_id`, `app`, `column_id`, `sort_no`, `collapsed`, `widget`, `description`, `param`) VALUES
(1, 14, 'orders', 4, 0, 1, 'customers', 'Sales', '{&quot;top&quot;:&quot;10&quot;,&quot;data_filter&quot;:&quot;&quot;,&quot;graph_type&quot;:&quot;Table&quot;}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_incorrect`
--

CREATE TABLE `data_incorrect` (
  `id` int(11) NOT NULL,
  `table` char(50) NOT NULL,
  `type` int(5) NOT NULL,
  `trans_no` int(11) NOT NULL,
  `data` text,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `debtors_master`
--

CREATE TABLE `debtors_master` (
  `debtor_no` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `debtor_ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address` tinytext COLLATE utf8_unicode_ci,
  `tax_id` varchar(55) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_code` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales_type` int(11) NOT NULL DEFAULT '1',
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `credit_status` int(11) NOT NULL DEFAULT '0',
  `payment_terms` int(11) DEFAULT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `pymt_discount` double NOT NULL DEFAULT '0',
  `credit_limit` float NOT NULL DEFAULT '1000',
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `customer_tax_id` int(11) DEFAULT NULL,
  `industry_code` int(11) DEFAULT NULL,
  `msic` char(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `debtor_trans`
--

CREATE TABLE `debtor_trans` (
  `trans_no` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `version` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `debtor_no` int(11) UNSIGNED DEFAULT NULL,
  `branch_code` int(11) NOT NULL DEFAULT '-1',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tpe` int(11) NOT NULL DEFAULT '0',
  `order_` int(11) NOT NULL DEFAULT '0',
  `ov_amount` double NOT NULL DEFAULT '0',
  `ov_gst` double NOT NULL DEFAULT '0',
  `ov_freight` double NOT NULL DEFAULT '0',
  `ov_freight_tax` double NOT NULL DEFAULT '0',
  `ov_discount` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `ship_via` int(11) DEFAULT NULL,
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `payment_terms` int(11) DEFAULT NULL,
  `cheque` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cust_ref2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_upload` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `debtor_trans_details`
--

CREATE TABLE `debtor_trans_details` (
  `id` int(11) NOT NULL,
  `debtor_trans_no` int(11) DEFAULT NULL,
  `debtor_trans_type` int(11) DEFAULT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gl_code` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` tinytext COLLATE utf8_unicode_ci,
  `unit_price` double NOT NULL DEFAULT '0',
  `unit_tax` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL DEFAULT '0',
  `standard_cost` double NOT NULL DEFAULT '0',
  `qty_done` double NOT NULL DEFAULT '0',
  `src_id` int(11) NOT NULL,
  `tax_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dimensions`
--

CREATE TABLE `dimensions` (
  `id` int(11) NOT NULL,
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_` tinyint(1) NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `documents_bookkeepers`
--

CREATE TABLE `documents_bookkeepers` (
  `id` int(11) NOT NULL,
  `tran_no` int(11) DEFAULT NULL,
  `tran_type` char(100) DEFAULT NULL,
  `tran_type_code` char(3) DEFAULT NULL,
  `party` varchar(200) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1',
  `ref` varchar(100) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `file` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `exchange_rates`
--

CREATE TABLE `exchange_rates` (
  `id` int(11) NOT NULL,
  `curr_code` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate_buy` double NOT NULL DEFAULT '0',
  `rate_sell` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_bank_accout`
--

CREATE TABLE `files_template_bank_accout` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_bank_deposit`
--

CREATE TABLE `files_template_bank_deposit` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_bank_payment`
--

CREATE TABLE `files_template_bank_payment` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_bank_reconcile`
--

CREATE TABLE `files_template_bank_reconcile` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_credit_note`
--

CREATE TABLE `files_template_credit_note` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_deliveries`
--

CREATE TABLE `files_template_deliveries` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_invoice`
--

CREATE TABLE `files_template_invoice` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_purchase_orders`
--

CREATE TABLE `files_template_purchase_orders` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_receipts`
--

CREATE TABLE `files_template_receipts` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_remittances`
--

CREATE TABLE `files_template_remittances` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_sales_order`
--

CREATE TABLE `files_template_sales_order` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `files_template_sales_order`
--

INSERT INTO `files_template_sales_order` (`id`, `template_path`, `template_screenshot`, `is_used`, `template_name`) VALUES
(1, '00324e668e75e2cc62c8f9a5f2c49959.docx', '00324e668e75e2cc62c8f9a5f2c49959.jpg', '1', 'Sales Order Template(Default)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_sales_quotation`
--

CREATE TABLE `files_template_sales_quotation` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files_template_statements`
--

CREATE TABLE `files_template_statements` (
  `id` int(11) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  `template_screenshot` varchar(255) NOT NULL,
  `is_used` char(1) NOT NULL,
  `template_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fiscal_year`
--

CREATE TABLE `fiscal_year` (
  `id` int(11) NOT NULL,
  `begin` date DEFAULT '0000-00-00',
  `end` date DEFAULT '0000-00-00',
  `closed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gl_trans`
--

CREATE TABLE `gl_trans` (
  `counter` int(11) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `type_no` bigint(16) NOT NULL DEFAULT '1',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `memo_` tinytext COLLATE utf8_unicode_ci,
  `amount` double NOT NULL DEFAULT '0',
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `person_type_id` int(11) DEFAULT NULL,
  `person_id` tinyblob,
  `gst` int(11) NOT NULL,
  `openning` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `grn_batch`
--

CREATE TABLE `grn_batch` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `purch_order_no` int(11) DEFAULT NULL,
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `loc_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `grn_items`
--

CREATE TABLE `grn_items` (
  `id` int(11) NOT NULL,
  `grn_batch_id` int(11) DEFAULT NULL,
  `po_detail_item` int(11) NOT NULL DEFAULT '0',
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `qty_recd` double NOT NULL DEFAULT '0',
  `quantity_inv` double NOT NULL DEFAULT '0',
  `tax_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `description`, `inactive`) VALUES
(1, 'Small', 0),
(2, 'Medium', 0),
(3, 'Large', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `import_process`
--

CREATE TABLE `import_process` (
  `id` int(11) NOT NULL,
  `module` char(100) NOT NULL,
  `total` int(10) NOT NULL,
  `complate` int(10) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_codes`
--

CREATE TABLE `item_codes` (
  `id` int(11) UNSIGNED NOT NULL,
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_id` smallint(6) UNSIGNED NOT NULL,
  `quantity` double NOT NULL DEFAULT '1',
  `is_foreign` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_tax_types`
--

CREATE TABLE `item_tax_types` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `exempt` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `item_tax_types`
--

INSERT INTO `item_tax_types` (`id`, `name`, `exempt`, `inactive`) VALUES
(1, 'Standard Rated', 0, 0),
(2, 'GST Zero Rated', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_tax_type_exemptions`
--

CREATE TABLE `item_tax_type_exemptions` (
  `item_tax_type_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_units`
--

CREATE TABLE `item_units` (
  `abbr` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `decimals` tinyint(2) NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `item_units`
--

INSERT INTO `item_units` (`abbr`, `name`, `decimals`, `inactive`) VALUES
('each', 'Each', 0, 0),
('set', 'Set', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_country`
--

CREATE TABLE `kv_country` (
  `id` int(11) UNSIGNED NOT NULL,
  `iso` varchar(50) DEFAULT NULL,
  `local_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kv_country`
--

INSERT INTO `kv_country` (`id`, `iso`, `local_name`) VALUES
(1, 'AD', 'Andorra'),
(2, 'AE', 'United Arab Emirates'),
(3, 'AF', 'Afghanistan'),
(4, 'AG', 'Antigua and Barbuda'),
(5, 'AI', 'Anguilla'),
(6, 'AL', 'Albania'),
(7, 'AM', 'Armenia\r\n'),
(8, 'AN', 'Netherlands Antilles\r\n'),
(9, 'AO', 'Angola\r\n'),
(10, 'AQ', 'Antarctica\r\n'),
(11, 'AR', 'Argentina\r\n'),
(12, 'AS', 'American Samoa\r\n'),
(13, 'AT', 'Austria\r\n'),
(14, 'AU', 'Australia\r\n'),
(15, 'AW', 'Aruba\r\n'),
(16, 'AX', 'Aland Islands'),
(17, 'AZ', 'Azerbaijan\r\n'),
(18, 'BA', 'Bosnia and Herzegovina\r\n'),
(19, 'BB', 'Barbados\r\n'),
(20, 'BD', 'Bangladesh\r\n'),
(21, 'BE', 'Belgium\r\n'),
(22, 'BF', 'Burkina Faso\r\n'),
(23, 'BG', 'Bulgaria\r\n'),
(24, 'BH', 'Bahrain\r\n'),
(25, 'BI', 'Burundi\r\n'),
(26, 'BJ', 'Benin\r\n'),
(27, 'BL', 'Saint Barthlemy'),
(28, 'BM', 'Bermuda\r\n'),
(29, 'BN', 'Brunei Darussalam\r\n'),
(30, 'BO', 'Bolivia\r\nBolivia, Plurinational state of'),
(31, 'BR', 'Brazil\r\n'),
(32, 'BS', 'Bahamas\r\n'),
(33, 'BT', 'Bhutan\r\n'),
(34, 'BV', 'Bouvet Island\r\n'),
(35, 'BW', 'Botswana\r\n'),
(36, 'BY', 'Belarus\r\n'),
(37, 'BZ', 'Belize\r\n'),
(38, 'CA', 'Canada\r\n'),
(39, 'CC', 'Cocos (Keeling) Islands\r\n'),
(40, 'CD', 'Congo, The Democratic Republic of the\r\n'),
(41, 'CF', 'Central African Republic\r\n'),
(42, 'CG', 'Congo\r\n'),
(43, 'CH', 'Switzerland\r\n'),
(45, 'CK', 'Cook Islands\r\n'),
(46, 'CL', 'Chile'),
(47, 'CM', 'Cameroon\r\n'),
(48, 'CN', 'China\r\n'),
(49, 'CO', 'Colombia\r\n'),
(50, 'CR', 'Costa Rica\r\n'),
(51, 'CU', 'Cuba\r\n'),
(52, 'CV', 'Cape Verde\r\n'),
(53, 'CX', 'Christmas Island\r\n'),
(54, 'CY', 'Cyprus\r\n'),
(55, 'CZ', 'Czech Republic\r\n'),
(56, 'DE', 'Germany\r\n'),
(57, 'DJ', 'Djibouti\r\n'),
(58, 'DK', 'Denmark\r\n'),
(59, 'DM', 'Dominica\r\n'),
(60, 'DO', 'Dominican Republic\r\n'),
(61, 'DZ', 'Algeria\r\n'),
(62, 'EC', 'Ecuador\r\n'),
(63, 'EE', 'Estonia\r\n'),
(64, 'EG', 'Egypt\r\n'),
(65, 'EH', 'Western Sahara\r\n'),
(66, 'ER', 'Eritrea\r\n'),
(67, 'ES', 'Spain\r\n'),
(68, 'ET', 'Ethiopia\r\n'),
(69, 'FI', 'Finland\r\n'),
(70, 'FJ', 'Fiji\r\n'),
(71, 'FK', 'Falkland Islands (Malvinas)\r\n'),
(72, 'FM', 'Micronesia, Federated States of\r\n'),
(73, 'FO', 'Faroe Islands\r\n'),
(74, 'FR', 'France\r\n'),
(75, 'GA', 'Gabon'),
(76, 'GB', 'United Kingdom'),
(77, 'GD', 'Grenada'),
(78, 'GE', 'Georgia'),
(79, 'GF', 'French Guiana'),
(80, 'GG', 'Guernsey'),
(81, 'GH', 'Ghana\r\n'),
(82, 'GI', 'Gibraltar\r\n'),
(83, 'GL', 'Greenland\r\n'),
(84, 'GM', 'Gambia\r\n'),
(85, 'GN', 'Guinea\r\n'),
(86, 'GP', 'Guadeloupe\r\n'),
(87, 'GQ', 'Equatorial Guinea\r\n'),
(88, 'GR', 'Greece\r\n'),
(89, 'GS', 'South Georgia and the South Sandwich Islands\r\n'),
(90, 'GT', 'Guatemala\r\n'),
(91, 'GU', 'Guam\r\n'),
(92, 'GW', 'Guinea-Bissau\r\n'),
(93, 'GY', 'Guyana\r\n'),
(94, 'HK', 'Hong Kong\r\n'),
(95, 'HM', 'Heard Island and McDonald Islands\r\n'),
(96, 'HN', 'Honduras\r\n'),
(97, 'HR', 'Croatia\r\n'),
(98, 'HT', 'Haiti\r\n'),
(99, 'HU', 'Hungary\r\n'),
(100, 'ID', 'Indonesia\r\n'),
(101, 'IE', 'Ireland\r\n'),
(102, 'IL', 'Israel\r\n'),
(103, 'IM', 'Isle of Man\r\n'),
(104, 'IN', 'India\r\n'),
(105, 'IO', 'British Indian Ocean Territory\r\n'),
(106, 'IQ', 'Iraq\r\n'),
(107, 'IR', 'Iran, Islamic Republic of\r\n'),
(108, 'IS', 'Iceland\r\n'),
(109, 'IT', 'Italy'),
(110, 'JE', 'Jersey\r\n'),
(111, 'JM', 'Jamaica\r\n'),
(112, 'JO', 'Jordan\r\n'),
(113, 'JP', 'Japan\r\n'),
(114, 'KE', 'Kenya\r\n'),
(115, 'KG', 'Kyrgyzstan\r\n'),
(116, 'KH', 'Cambodia\r\n'),
(117, 'KI', 'Kiribati\r\n'),
(118, 'KM', 'Comoros\r\n'),
(119, 'KN', 'Saint Kitts and Nevis\r\n'),
(120, 'KP', 'Korea, Democratic People&#39;s Republic of\r\n'),
(121, 'KR', 'Korea, Republic of\r\n'),
(122, 'KW', 'Kuwait\r\n'),
(123, 'KY', 'Cayman Islands\r\n'),
(124, 'KZ', 'Kazakhstan\r\n'),
(125, 'LA', 'Lao People&#39;s Democratic Republic\r\n'),
(126, 'LB', 'Lebanon\r\n'),
(127, 'LC', 'Saint Lucia\r\n'),
(128, 'LI', 'Liechtenstein\r\n'),
(129, 'LK', 'Sri Lanka\r\n'),
(130, 'LR', 'Liberia\r\n'),
(131, 'LS', 'Lesotho\r\n'),
(132, 'LT', 'Lithuania\r\n'),
(133, 'LU', 'Luxembourg\r\n'),
(134, 'LV', 'Latvia\r\n'),
(135, 'LY', 'Libyan Arab Jamahiriya\r\n'),
(136, 'MA', 'Morocco\r\n'),
(137, 'MC', 'Monaco\r\n'),
(138, 'MD', 'Moldova, Republic of\r\n'),
(139, 'ME', 'Montenegro\r\n'),
(140, 'MF', 'Saint Martin'),
(141, 'MG', 'Madagascar\r\n'),
(142, 'MH', 'Marshall Islands\r\n'),
(143, 'MK', 'Macedonia\r\n'),
(144, 'ML', 'Mali\r\n'),
(145, 'MM', 'Myanmar\r\n'),
(146, 'MN', 'Mongolia\r\n'),
(147, 'MO', 'Macao\r\n'),
(148, 'MP', 'Northern Mariana Islands\r\n'),
(149, 'MQ', 'Martinique\r\n'),
(150, 'MR', 'Mauritania\r\n'),
(151, 'MS', 'Montserrat\r\n'),
(152, 'MT', 'Malta\r\n'),
(153, 'MU', 'Mauritius\r\n'),
(154, 'MV', 'Maldives\r\n'),
(155, 'MW', 'Malawi\r\n'),
(156, 'MX', 'Mexico\r\n'),
(157, 'MY', 'Malaysia\r\n'),
(158, 'MZ', 'Mozambique\r\n'),
(159, 'NA', 'Namibia\r\n'),
(160, 'NC', 'New Caledonia\r\n'),
(161, 'NE', 'Niger\r\n'),
(162, 'NF', 'Norfolk Island\r\n'),
(163, 'NG', 'Nigeria\r\n'),
(164, 'NI', 'Nicaragua\r\n'),
(165, 'NL', 'Netherlands\r\n'),
(166, 'NO', 'Norway'),
(167, 'NP', 'Nepal\r\n'),
(168, 'NR', 'Nauru\r\n'),
(169, 'NU', 'Niue\r\n'),
(170, 'NZ', 'New Zealand\r\n'),
(171, 'OM', 'Oman\r\n'),
(172, 'PA', 'Panama\r\n'),
(173, 'PE', 'Peru\r\n'),
(174, 'PF', 'French Polynesia\r\n'),
(175, 'PG', 'Papua New Guinea\r\n'),
(176, 'PH', 'Philippines\r\n'),
(177, 'PK', 'Pakistan\r\n'),
(178, 'PL', 'Poland\r\n'),
(179, 'PM', 'Saint Pierre and Miquelon\r\n'),
(180, 'PN', 'Pitcairn\r\n'),
(181, 'PR', 'Puerto Rico\r\n'),
(182, 'PS', 'Palestinian Territory, Occupied'),
(183, 'PT', 'Portugal\r\n'),
(184, 'PW', 'Palau\r\n'),
(185, 'PY', 'Paraguay\r\n'),
(186, 'QA', 'Qatar\r\n'),
(188, 'RO', 'Romania\r\n'),
(189, 'RS', 'Serbia\r\n'),
(190, 'RU', 'Russian Federation\r\n'),
(191, 'RW', 'Rwanda\r\n'),
(192, 'SA', 'Saudi Arabia\r\n'),
(193, 'SB', 'Solomon Islands\r\n'),
(194, 'SC', 'Seychelles\r\n'),
(195, 'SD', 'Sudan\r\n'),
(196, 'SE', 'Sweden\r\n'),
(197, 'SG', 'Singapore\r\n'),
(198, 'SH', 'Saint Helena\r\n'),
(199, 'SI', 'Slovenia\r\n'),
(200, 'SJ', 'Svalbard and Jan Mayen\r\n'),
(201, 'SK', 'Slovakia\r\n'),
(202, 'SL', 'Sierra Leone\r\n'),
(203, 'SM', 'San Marino\r\n'),
(204, 'SN', 'Senegal\r\n'),
(205, 'SO', 'Somalia\r\n'),
(206, 'SR', 'Suriname\r\n'),
(207, 'ST', 'Sao Tome and Principe\r\n'),
(208, 'SV', 'El Salvador\r\n'),
(209, 'SY', 'Syrian Arab Republic\r\n'),
(210, 'SZ', 'Swaziland\r\n'),
(211, 'TC', 'Turks and Caicos Islands\r\n'),
(212, 'TD', 'Chad'),
(213, 'TF', 'French Southern Territories'),
(214, 'TG', 'Togo'),
(215, 'TH', 'Thailand'),
(216, 'TJ', 'Tajikistan'),
(217, 'TK', 'Tokelau'),
(218, 'TL', 'Timor-Leste'),
(219, 'TM', 'Turkmenistan\r\n'),
(220, 'TN', 'Tunisia\r\n'),
(221, 'TO', 'Tonga\r\n'),
(222, 'TR', 'Turkey'),
(223, 'TT', 'Trinidad and Tobago\r\n'),
(224, 'TV', 'Tuvalu\r\n'),
(225, 'TW', 'Taiwan\r\n'),
(226, 'TZ', 'Tanzania, United Republic of\r\n'),
(227, 'UA', 'Ukraine\r\n'),
(228, 'UG', 'Uganda\r\n'),
(229, 'UM', 'United States Minor Outlying Islands\r\n'),
(230, 'US', 'United States\r\n'),
(231, 'UY', 'Uruguay\r\n'),
(232, 'UZ', 'Uzbekistan\r\n'),
(233, 'VA', 'Holy See (Vatican City State)\r\n'),
(234, 'VC', 'Saint Vincent and the Grenadines\r\n'),
(235, 'VE', 'Venezuela, Bolivarian Republic of'),
(236, 'VG', 'Virgin Islands, British\r\n'),
(237, 'VI', 'Virgin Islands, U.S.\r\n'),
(238, 'VN', 'Viet Nam'),
(239, 'VU', 'Vanuatu\r\n'),
(240, 'WF', 'Wallis and Futuna\r\n'),
(241, 'WS', 'Samoa\r\n'),
(242, 'YE', 'Yemen\r\n'),
(243, 'YT', 'Mayotte\r\n'),
(244, 'ZA', 'South Africa\r\n'),
(245, 'ZM', 'Zambia\r\n'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_departments`
--

CREATE TABLE `kv_departments` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `description` varchar(60) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kv_departments`
--

INSERT INTO `kv_departments` (`id`, `description`, `inactive`) VALUES
(1, 'Production', 0),
(2, 'Sales and Marketing', 0),
(3, 'HRM', 0),
(4, 'Training centre', 0),
(5, 'Research &amp; Development1', 0),
(6, 'Production', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_empl_attendancee`
--

CREATE TABLE `kv_empl_attendancee` (
  `id` int(11) UNSIGNED NOT NULL,
  `month` int(2) DEFAULT NULL,
  `year` int(2) DEFAULT NULL,
  `dept_id` int(10) NOT NULL,
  `empl_id` varchar(30) DEFAULT NULL,
  `1` varchar(2) NOT NULL,
  `2` varchar(2) NOT NULL,
  `3` varchar(2) NOT NULL,
  `4` varchar(2) NOT NULL,
  `5` varchar(2) NOT NULL,
  `6` varchar(2) NOT NULL,
  `7` varchar(2) NOT NULL,
  `8` varchar(2) NOT NULL,
  `9` varchar(2) NOT NULL,
  `10` varchar(2) NOT NULL,
  `11` varchar(2) NOT NULL,
  `12` varchar(2) NOT NULL,
  `13` varchar(2) NOT NULL,
  `14` varchar(2) NOT NULL,
  `15` varchar(2) NOT NULL,
  `16` varchar(2) NOT NULL,
  `17` varchar(2) NOT NULL,
  `18` varchar(2) NOT NULL,
  `19` varchar(2) NOT NULL,
  `20` varchar(2) NOT NULL,
  `21` varchar(2) NOT NULL,
  `22` varchar(2) NOT NULL,
  `23` varchar(2) NOT NULL,
  `24` varchar(2) NOT NULL,
  `25` varchar(2) NOT NULL,
  `26` varchar(2) NOT NULL,
  `27` varchar(2) NOT NULL,
  `28` varchar(2) NOT NULL,
  `29` varchar(2) NOT NULL,
  `30` varchar(2) NOT NULL,
  `31` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_empl_cv`
--

CREATE TABLE `kv_empl_cv` (
  `id` int(10) NOT NULL,
  `empl_id` varchar(10) NOT NULL,
  `empl_firstname` varchar(60) NOT NULL,
  `cv_title` varchar(60) NOT NULL,
  `filename` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_empl_degree`
--

CREATE TABLE `kv_empl_degree` (
  `id` int(10) NOT NULL,
  `empl_id` varchar(10) NOT NULL,
  `degree` varchar(20) NOT NULL,
  `major` varchar(20) NOT NULL,
  `university` varchar(80) NOT NULL,
  `grade` varchar(20) NOT NULL,
  `year` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_empl_experience`
--

CREATE TABLE `kv_empl_experience` (
  `id` int(10) NOT NULL,
  `empl_id` varchar(10) NOT NULL,
  `organization` varchar(60) NOT NULL,
  `job_role` varchar(60) NOT NULL,
  `s_date` date NOT NULL,
  `e_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_empl_info`
--

CREATE TABLE `kv_empl_info` (
  `id` int(5) NOT NULL,
  `empl_id` varchar(10) NOT NULL,
  `empl_salutation` varchar(9) NOT NULL,
  `empl_firstname` varchar(120) NOT NULL,
  `empl_lastname` varchar(50) NOT NULL,
  `addr_line1` varchar(200) NOT NULL,
  `addr_line2` varchar(200) NOT NULL,
  `empl_city` varchar(60) NOT NULL,
  `empl_state` varchar(100) NOT NULL,
  `country` int(5) NOT NULL,
  `gender` int(2) NOT NULL,
  `date_of_birth` date NOT NULL,
  `age` int(3) NOT NULL,
  `marital_status` int(2) NOT NULL,
  `nationality` int(2) NOT NULL,
  `ethnic_origin` int(3) NOT NULL,
  `no_of_child` int(3) NOT NULL,
  `religion` int(2) NOT NULL,
  `weight` int(4) NOT NULL,
  `office_phone` varchar(15) NOT NULL,
  `home_phone` varchar(15) NOT NULL,
  `mobile_phone` varchar(15) NOT NULL,
  `email` varchar(120) NOT NULL,
  `skype_id` varchar(50) NOT NULL,
  `linkedin` varchar(50) NOT NULL,
  `status` int(2) NOT NULL,
  `empl_pic` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_empl_job`
--

CREATE TABLE `kv_empl_job` (
  `id` int(10) NOT NULL,
  `empl_id` varchar(10) NOT NULL,
  `grade` tinyint(2) NOT NULL,
  `department` tinyint(2) NOT NULL,
  `desig_group` tinyint(2) NOT NULL,
  `desig` varchar(40) NOT NULL,
  `joining` date NOT NULL,
  `empl_type` tinyint(2) NOT NULL,
  `working_branch` tinyint(2) NOT NULL,
  `mod_of_pay` int(2) NOT NULL,
  `bank_name` varchar(40) NOT NULL,
  `acc_no` varchar(30) NOT NULL,
  `basic` int(10) NOT NULL,
  `empl_hra` int(10) NOT NULL,
  `conveyance` int(10) NOT NULL,
  `medical_allowance` int(10) NOT NULL,
  `empl_da` int(10) NOT NULL,
  `edu_other` int(10) NOT NULL,
  `empl_pf` int(10) NOT NULL,
  `empl_esi` int(10) NOT NULL,
  `misc` int(10) NOT NULL,
  `prof_tax` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_empl_loan`
--

CREATE TABLE `kv_empl_loan` (
  `id` int(10) NOT NULL,
  `empl_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `loan_amount` decimal(15,2) NOT NULL,
  `loan_type_id` int(5) NOT NULL,
  `periods` int(5) NOT NULL,
  `monthly_pay` decimal(15,2) NOT NULL,
  `periods_paid` int(5) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_empl_option`
--

CREATE TABLE `kv_empl_option` (
  `id` int(20) NOT NULL,
  `option_name` varchar(150) NOT NULL,
  `option_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kv_empl_option`
--

INSERT INTO `kv_empl_option` (`id`, `option_name`, `option_value`) VALUES
(1, 'weekly_off', 'Sun'),
(2, 'empl_ref_type', '0'),
(3, 'salary_account', '5410'),
(4, 'paid_from_account', '1060'),
(5, 'expd_percentage_amt', '30'),
(6, 'weekly_off', 'Sun'),
(7, 'empl_ref_type', '0'),
(8, 'weekly_off', 'Sun'),
(9, 'empl_ref_type', '0'),
(10, 'next_empl_id', '1'),
(11, 'weekly_off', 'Sun'),
(12, 'empl_ref_type', '0'),
(13, 'weekly_off', 'Sun'),
(14, 'empl_ref_type', '0'),
(15, 'weekly_off', 'Sun'),
(16, 'empl_ref_type', '0'),
(17, 'weekly_off', 'Sun'),
(18, 'empl_ref_type', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_empl_salary`
--

CREATE TABLE `kv_empl_salary` (
  `id` int(20) NOT NULL,
  `empl_id` varchar(10) NOT NULL,
  `month` int(2) NOT NULL,
  `year` int(2) NOT NULL,
  `date` date NOT NULL,
  `gross` int(15) NOT NULL,
  `basic` int(10) NOT NULL,
  `empl_da` int(10) NOT NULL,
  `empl_hra` int(10) NOT NULL,
  `conveyance` int(10) NOT NULL,
  `medical_allowance` int(10) NOT NULL,
  `edu_other` int(10) NOT NULL,
  `lop_amount` int(10) NOT NULL,
  `empl_pf` int(10) NOT NULL,
  `loan` int(10) NOT NULL,
  `adv_sal` int(10) NOT NULL,
  `net_pay` int(10) NOT NULL,
  `prof_tax` int(10) NOT NULL,
  `empl_esi` int(10) NOT NULL,
  `misc` int(10) NOT NULL,
  `ot_other_allowance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_empl_training`
--

CREATE TABLE `kv_empl_training` (
  `id` int(5) NOT NULL,
  `empl_id` varchar(10) NOT NULL,
  `training_desc` varchar(60) NOT NULL,
  `course` varchar(50) NOT NULL,
  `cost` int(8) NOT NULL,
  `institute` varchar(60) NOT NULL,
  `s_date` date NOT NULL,
  `e_date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kv_loan_types`
--

CREATE TABLE `kv_loan_types` (
  `id` int(10) NOT NULL,
  `loan_name` varchar(200) NOT NULL,
  `interest_rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `locations`
--

CREATE TABLE `locations` (
  `loc_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `loc_stock`
--

CREATE TABLE `loc_stock` (
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reorder_level` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `table` char(100) NOT NULL,
  `table_id` char(20) NOT NULL,
  `action` int(1) NOT NULL DEFAULT '0',
  `data_old` text,
  `data_new` text,
  `uid` int(11) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `user_agent` char(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `movement_types`
--

CREATE TABLE `movement_types` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `movement_types`
--

INSERT INTO `movement_types` (`id`, `name`, `inactive`) VALUES
(1, 'Adjustment', 0),
(2, 'Write Off', 0),
(3, 'Transfer', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `msic_division`
--

CREATE TABLE `msic_division` (
  `id` int(5) NOT NULL,
  `section` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `msic_division`
--

INSERT INTO `msic_division` (`id`, `section`, `description`, `inactive`) VALUES
(1, 1, 'CROPS AND ANIMAL PRODUCTION, HUNTING', 1),
(2, 1, 'FORESTRY & LOGGING', 1),
(3, 1, 'FISHING AND AQUACULTURE', 1),
(4, 2, 'MINING OF COAL AND LIGNITE', 1),
(5, 2, 'EXTRACTION OF CRUDE, PETROLEUM AND NATURAL GAS', 1),
(6, 2, 'MINING OF METAL ORES', 1),
(7, 2, 'OTHER MINING AND QUARRYING', 1),
(8, 2, 'MINING SUPPORT SERVICE ACTIVITIES', 1),
(9, 3, 'MANUFACTURE OF FOOD PRODUCTS', 1),
(10, 3, 'MANUFACTURE OF BEVERAGES  .', 1),
(11, 3, 'MANUFACTURE OF TOBACCO PRODUCTS', 1),
(12, 3, 'MANUFACTURE OF TEXTILES', 1),
(13, 3, 'MANUFACTURE OF WEARING APPAREL', 1),
(14, 3, 'MANUFACTURE OF LEATHER AND RELATED PRODUCTS', 1),
(15, 3, 'MANUFACTURE OF WOOD AND OF PRODUCTS', 1),
(16, 3, 'MANUFACTURE OF PAPER AND PAPER PRODUCTS', 1),
(17, 3, 'PRINTING AND REPRODUCTION OF RECORDED MEDIA', 1),
(18, 3, 'MANUFACTURE OF COKE AND REFINED PETROLEUM PRODUCTS', 1),
(19, 3, 'MANUFACTURE OF CHEMICALS AND CHEMICAL PRODUCTS', 1),
(20, 3, 'MANUFACTURE OF BASIC PHARMACEUTICALS', 1),
(21, 3, 'MANUFACTURE OF RUBBER & PLASTIC PRODUCTS', 1),
(22, 3, 'MANUFACTURE OF OTHER NON-METALLIC MINERAL PRODUCTS', 1),
(23, 3, 'MANUFACTURE OF BASIC METALS', 1),
(24, 3, 'MANUFACTURE OF FABRICATED METAL PRODUCTS', 1),
(25, 3, 'MANUFACTURE OF COMPUTER, ELECTRONIC AND OPTICAL PRODUCTS', 1),
(26, 3, 'MANUFACTURE OF ELECTRICAL EQUIPMENT', 1),
(27, 3, 'MANUFACTURE OF MACHINERY AND EQUIPMENT N.E.0', 1),
(28, 3, 'MANUFACTURE OF MOTOR VEHICLES, TRAILERS AND SEMI-TRAILERS', 1),
(29, 3, 'MANUFACTURE OF OTHER TRANSPORT EQUIPMENT', 1),
(30, 3, 'MANUFACTURE OF FURNITURE', 1),
(31, 3, 'OTHER MANUFACTURING', 1),
(32, 3, 'REPAIR AND INSTALLATION OF MACHINERY AND EQUIPMENT', 1),
(33, 4, 'Electric power generation, transmission and distributio', 1),
(34, 4, 'Manufacture of gas; distribution of gaseous fuels through mains', 1),
(35, 4, 'Steam and air conditioning supply', 1),
(36, 5, 'WATER COLLECTION, TREATMENT & SUPPLY', 1),
(37, 5, 'WASTE COLLECTION, TREATMENT & DISPOSAL', 1),
(38, 6, 'Construction of building', 1),
(39, 6, 'CIVIL ENGINEERING', 1),
(40, 6, 'SPECIALIZED CONSTRUCTION ACTIVTIES', 1),
(41, 7, 'WHOLESALE, RETAIL TRADE, REPAIR OF MOTOR VEHICLES & CYCLES', 1),
(42, 7, 'WHOLESALE TRADE, EXCEPT OF MOTOR VEHICLES AND MOTORCYCLES', 1),
(43, 7, 'RETAIL TRADE, EXCEPT OF MOTOR VEHICLES AND MOTORCYCLES', 1),
(44, 8, 'LAND TRANSPORT AND TRANSPORT VIA PIPELINES', 1),
(45, 8, 'WATER TRANSPORT', 1),
(46, 8, 'AIR TRANSPORT', 1),
(47, 8, 'WAREHOUSING AND SUPPORT ACTIVITIES FOR TRANSPORTATIO', 1),
(48, 8, 'POSTAL AND COURIER-ACTIVITIES', 1),
(49, 9, 'ACCOMMODATIO', 1),
(50, 9, 'FOOD AND BEVERAGE SERVICE ACTIVITIES', 1),
(51, 10, 'INFORMATION AND COMMUNICATIO', 1),
(52, 10, 'MOTION PICTURE, VIDEO AND TELEVISION PROGRAMME PRODUCTION, SOUND RECORDING AND MUSIC PUBLISHING ACTIVITIES', 1),
(53, 10, 'PROGRAMMING AND BROADCASTING ACTIVITIES', 1),
(54, 10, 'COMPUTER PROGRAMMING, CONSULTANCY AND RELATED ACTIVITIES', 1),
(55, 10, 'INFORMATION SERVICE ACTIVITIES', 1),
(56, 11, 'FINANCIAL SERVICE ACTIVITIES', 1),
(57, 11, 'INSURANCE/TAKAFUL, REINSURANCE/RETAKAFUL AND PENSION FUNDING, EXCEPT COMPULSORY SOCIAL SECURITY', 1),
(58, 11, 'ACTIVITIES AUXILIARY TO FINANCIAL SERVICE AND INSURANCE/TAKAFUL ACTIVITIES', 1),
(59, 12, 'REAL ESTATE ACTIVTIES', 1),
(60, 13, 'PROFESSIONAL, SCIENTIFIC AND TECHNICAL ACTIVITIES', 1),
(61, 13, 'ACTIVITIES OF HEAD OFFICES, MANAGEMENT CONSULTANCY ACTIVITIES', 1),
(62, 13, 'ARCHITECTURAL AND ENGINEERING ACTIVITIES, TECHNICAL TESTING AND ANALYSIS', 1),
(63, 13, 'SCIENTIFIC RESEARCH AND DEVELOPMENT', 1),
(64, 13, 'ADVERTISING AND MARKET RESEARCH', 1),
(65, 13, 'OTHER PROFESSIONAL, SCIENTIFIC AND TECHNICAL ACTIVITIES', 1),
(66, 14, 'RENTAL & LEASING ACTIVITIES', 1),
(67, 14, 'EMPLOYMENT ACTIVITIES', 1),
(68, 14, 'TRAVEL AGENCY, TOUR OPERATOR, RESERVATION SERVICE AND RELATED ACTIVITIES', 1),
(69, 14, 'SECURITY AND INVESTIGATION ACTIVITIES', 1),
(70, 14, 'SERVICES TO BUILDING AND LANDSCAPE ACTIVITIES', 1),
(71, 14, 'OFFICE ADMINISTRATIVE, OFFICE SUPPORT AND OTHER BUSINESS SUPPORT ACTIVITIES', 1),
(72, 15, 'PUBLIC ADMINISTRATION AND DEFENCE, COMPULSORY SOCIAL ACTIVITIES', 1),
(73, 16, 'EDUCATIO', 1),
(74, 17, 'HUMAN HEALTH AND SOCIAL WORK ACTIVITIES', 1),
(75, 17, 'RESIDENTIAL CARE ACTIVITIES', 1),
(76, 18, 'CREATIVE, ARTS AND ENTERTAINMENT ACTIVITIES', 1),
(77, 18, 'LIBRARIES, ARCHIVES, MUSEUMS AND OTHER CULTURAL ACTIVITIES', 1),
(78, 18, 'SPORTS ACTIVITIES AND AMUSEMENT AND RECREATION ACTIVITIES', 1),
(79, 19, 'ACTIVITIES\'OF MEMBERSHIP ORGANIZATIONS', 1),
(80, 19, 'REPAIR OF COMPUTERS AND PERSONAL AND HOUSEHOLD GOODS', 1),
(81, 19, 'OTHER PERSONAL SERVICE ACTIVITIES', 1),
(82, 20, 'GOODS- AND SERVICES-PRODUCING ACTIVITIES OF HOUSEHOLDS FOR OWN USE', 1),
(83, 21, 'Activities of extraterritorial organizationd bodies', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `msic_item`
--

CREATE TABLE `msic_item` (
  `id` int(5) NOT NULL,
  `division` int(11) NOT NULL,
  `code` varchar(8) NOT NULL,
  `description` varchar(200) NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `msic_section`
--

CREATE TABLE `msic_section` (
  `id` int(5) NOT NULL,
  `section` char(1) NOT NULL,
  `description` varchar(150) NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `msic_section`
--

INSERT INTO `msic_section` (`id`, `section`, `description`, `inactive`) VALUES
(1, 'A', 'AGRICULTURE FORESTRY AND FISHING', 1),
(2, 'B', 'MINING & QUARRYING', 1),
(3, 'C', 'MANUFACTURING', 1),
(4, 'D', 'ELECTRICITY, GAS, STEAM & AIRCON SUPPLY', 1),
(5, 'E', 'WATER SUPPLY, SEWERAGE, WASTE MGT & REMEDIATIO', 1),
(6, 'F', 'CONSTRUCTIO', 1),
(7, 'G', 'WHOLESALE & RETAIL TRADE', 1),
(8, 'H', 'TRANSPORTATION & STORAGE', 1),
(9, 'I', 'ACCOMODATION & FOOD SERVICE ACTIVITIES', 1),
(10, 'J', 'INFORMATION AND COMMUNICATIO', 1),
(11, 'K', 'FINANCIAL AND INSURANCE /TAKAFUL ACTIVITIES ', 1),
(12, 'L', 'REAL ESTATE ACTIVTIES', 1),
(13, 'M', 'PROFESSIONAL, SCIENTIFIC AND TECHNICAL ACTIVITIES', 1),
(14, '', 'ADMINISTRATIVE & SUPPORT SERVICE ACTIVITIES', 1),
(15, 'O', 'PUBLIC ADMIN, DEFENCE, COMPULSORY SOCIAL ACTIVITIES', 1),
(16, 'P', 'EDUCATIO', 1),
(17, 'Q', 'HUMAN HEALTH AND SOCIAL WORK ACTIVITIES', 1),
(18, 'R', 'ARTS, ENTERTAINMENT & RECREATIO', 1),
(19, 'S', 'OTHER SERVICES ACTIVITIES', 1),
(20, 'T', 'ACTIVITIES OF HOUSEHOLDS AS EMPLOYERS; UNDIFFERENTIATED', 1),
(21, 'U', 'ACTIVITIES OF EXTRATERRESTRIAL ORGANIZATIONS', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `opening_cache`
--

CREATE TABLE `opening_cache` (
  `id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `opening_customer`
--

CREATE TABLE `opening_customer` (
  `id` int(11) NOT NULL,
  `customer_id` char(50) NOT NULL,
  `balance` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `opening_gl`
--

CREATE TABLE `opening_gl` (
  `id` int(11) NOT NULL,
  `pay_type` char(15) NOT NULL,
  `type` char(20) NOT NULL,
  `account` char(20) NOT NULL,
  `amount` double NOT NULL,
  `tran_date` date NOT NULL,
  `gl_tran_id` int(11) NOT NULL,
  `trans_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `opening_gl_system`
--

CREATE TABLE `opening_gl_system` (
  `id` int(11) NOT NULL,
  `account` int(10) NOT NULL,
  `amount` double NOT NULL,
  `tran_date` date NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `opening_product`
--

CREATE TABLE `opening_product` (
  `id` int(11) NOT NULL,
  `code` char(20) NOT NULL,
  `cost` int(20) NOT NULL,
  `qty` int(10) NOT NULL,
  `price` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gl_tran_id` int(11) NOT NULL DEFAULT '0',
  `trans_no` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `opening_sale`
--

CREATE TABLE `opening_sale` (
  `id` int(11) NOT NULL,
  `type` char(15) DEFAULT 'sale',
  `customer` int(11) DEFAULT NULL,
  `branch` int(11) DEFAULT NULL,
  `ref` varchar(40) DEFAULT NULL,
  `trans_no` int(11) DEFAULT NULL,
  `tran_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` double DEFAULT NULL,
  `payment` double DEFAULT NULL,
  `status` bit(1) DEFAULT b'0',
  `debit` double NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  `curr_rate` double NOT NULL DEFAULT '1',
  `currency` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `opening_sale_item`
--

CREATE TABLE `opening_sale_item` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `description` tinytext NOT NULL,
  `quantity` double NOT NULL,
  `discount_percent` int(2) DEFAULT NULL,
  `tax_type_id` int(11) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `currency` char(10) DEFAULT NULL,
  `credit` double NOT NULL DEFAULT '0',
  `debit` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_terms`
--

CREATE TABLE `payment_terms` (
  `terms_indicator` int(11) NOT NULL,
  `terms` char(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `days_before_due` smallint(6) NOT NULL DEFAULT '0',
  `day_in_following_month` smallint(6) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `payment_terms`
--

INSERT INTO `payment_terms` (`terms_indicator`, `terms`, `days_before_due`, `day_in_following_month`, `inactive`) VALUES
(1, 'Due 15th Of the Following Month', 0, 17, 0),
(2, 'Due By End Of The Following Month', 0, 30, 0),
(3, 'Payment due within 10 days', 10, 0, 0),
(4, 'Cash Only', 0, 0, 0),
(5, 'Term 30 Days', 30, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales_type_id` int(11) NOT NULL DEFAULT '0',
  `curr_abrev` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `printers`
--

CREATE TABLE `printers` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `queue` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `port` smallint(11) UNSIGNED NOT NULL,
  `timeout` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `printers`
--

INSERT INTO `printers` (`id`, `name`, `description`, `queue`, `host`, `port`, `timeout`) VALUES
(1, 'QL500', 'Label printer', 'QL500', 'server', 127, 20),
(2, 'Samsung', 'Main network printer', 'scx4521F', 'server', 515, 5),
(3, 'Local', 'Local print server at user IP', 'lp', '', 515, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `print_profiles`
--

CREATE TABLE `print_profiles` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `profile` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `report` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `printer` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `print_profiles`
--

INSERT INTO `print_profiles` (`id`, `profile`, `report`, `printer`) VALUES
(1, 'Out of office', '', 0),
(2, 'Sales Department', '', 0),
(3, 'Central', '', 2),
(4, 'Sales Department', '104', 2),
(5, 'Sales Department', '105', 2),
(6, 'Sales Department', '107', 2),
(7, 'Sales Department', '109', 2),
(8, 'Sales Department', '110', 2),
(9, 'Sales Department', '201', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `purch_data`
--

CREATE TABLE `purch_data` (
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `suppliers_uom` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `conversion_factor` double NOT NULL DEFAULT '1',
  `supplier_description` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purch_orders`
--

CREATE TABLE `purch_orders` (
  `order_no` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `comments` tinytext COLLATE utf8_unicode_ci,
  `ord_date` date NOT NULL DEFAULT '0000-00-00',
  `reference` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `requisition_no` tinytext COLLATE utf8_unicode_ci,
  `into_stock_location` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `total` double NOT NULL DEFAULT '0',
  `tax_included` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purch_order_details`
--

CREATE TABLE `purch_order_details` (
  `po_detail_item` int(11) NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT '0',
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `qty_invoiced` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `act_price` double NOT NULL DEFAULT '0',
  `std_cost_unit` double NOT NULL DEFAULT '0',
  `quantity_ordered` double NOT NULL DEFAULT '0',
  `quantity_received` double NOT NULL DEFAULT '0',
  `tax_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `quick_entries`
--

CREATE TABLE `quick_entries` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `base_amount` double NOT NULL DEFAULT '0',
  `base_desc` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bal_type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `quick_entries`
--

INSERT INTO `quick_entries` (`id`, `type`, `description`, `base_amount`, `base_desc`, `bal_type`) VALUES
(1, 1, 'Maintenance', 0, 'Amount', 0),
(2, 4, 'Phone', 0, 'Amount', 0),
(3, 2, 'Cash Sales', 0, 'Amount', 0),
(4, 4, 'Supplier Invoice', 0, 'Base Amount', 0),
(5, 1, 'Utility Expenses', 0, 'Base Amount', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `quick_entry_lines`
--

CREATE TABLE `quick_entry_lines` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `qid` smallint(6) UNSIGNED NOT NULL,
  `amount` double DEFAULT '0',
  `action` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `dest_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimension_id` smallint(6) UNSIGNED DEFAULT NULL,
  `dimension2_id` smallint(6) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `recurrent_invoices`
--

CREATE TABLE `recurrent_invoices` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `order_no` int(11) UNSIGNED NOT NULL,
  `debtor_no` int(11) UNSIGNED DEFAULT NULL,
  `group_no` smallint(6) UNSIGNED DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT '0',
  `monthly` int(11) NOT NULL DEFAULT '0',
  `begin` date NOT NULL DEFAULT '0000-00-00',
  `end` date NOT NULL DEFAULT '0000-00-00',
  `last_sent` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `refs`
--

CREATE TABLE `refs` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `refs`
--

INSERT INTO `refs` (`id`, `type`, `reference`) VALUES
(1, 0, 'JV 0001'),
(2, 0, 'JV 0002'),
(1, 1, 'IJ/PV/0001'),
(2, 1, 'J/PV/0002'),
(3, 1, 'J/PV/0003'),
(4, 1, 'J/PV/0004'),
(5, 1, 'J/PV/0005'),
(6, 1, 'J/PV/0006'),
(7, 1, 'J/PV/0007'),
(8, 1, 'J/PV/0008'),
(9, 1, 'J/PV/0009'),
(10, 1, 'J/PV/0010'),
(11, 1, 'J/PV/0011'),
(12, 1, 'J/PV/0012'),
(13, 1, 'J/PV/0013'),
(14, 1, 'J/PV/0014'),
(15, 1, 'J/PV/0015'),
(16, 1, 'J/PV/0016'),
(1, 2, 'OR 0001'),
(2, 2, 'OR 0002'),
(3, 2, 'OR 0003'),
(4, 2, 'OR 0004'),
(5, 2, 'OR 0005'),
(6, 2, 'OR 0006'),
(1, 4, 'FT 0001'),
(1, 10, 'IV 0001'),
(2, 10, 'IV 0002'),
(3, 10, 'IV 0003'),
(4, 10, 'IV 0004'),
(5, 10, 'IV 0005'),
(6, 10, 'IV 0006'),
(7, 10, 'IV 0007'),
(8, 10, 'IV 0008'),
(9, 10, 'IV 0009'),
(10, 10, 'IV 0010'),
(11, 10, 'IV 0011'),
(12, 10, 'IV 0012'),
(13, 10, 'IV 0013'),
(14, 10, 'IV 0014'),
(15, 10, 'IV 0015'),
(16, 10, 'IV 0016'),
(17, 10, 'IV 0017'),
(18, 10, 'IV 0018'),
(19, 10, 'IV 0019'),
(20, 10, 'IV 0020'),
(21, 10, 'IV 0021'),
(22, 10, 'IV 0022'),
(23, 10, 'IV 0023'),
(24, 10, 'IV 0024'),
(25, 10, 'IV 0025'),
(26, 10, 'IV 0026'),
(27, 10, 'IV 0027'),
(28, 10, 'IV 0028'),
(29, 10, 'IV 0029'),
(30, 10, 'IV 0030'),
(31, 10, 'IV 0031'),
(32, 10, 'IV 0032'),
(33, 10, 'IV 0033'),
(34, 10, 'IV 0034'),
(35, 10, 'IV 0035'),
(36, 10, 'IV 0036'),
(37, 10, 'IV 0037'),
(38, 10, 'IV 0038'),
(39, 10, 'IV 0039'),
(40, 10, 'IV 0040'),
(41, 10, 'IV 0041'),
(42, 10, 'IV 0042'),
(43, 10, 'IV 0043'),
(44, 10, 'IV 0044'),
(45, 10, 'IV 0045'),
(46, 10, 'IV 0046'),
(47, 10, 'IV 0047'),
(48, 10, 'IV 0048'),
(49, 10, 'IV 0049'),
(50, 10, 'IV 0050'),
(51, 10, 'IV 0051'),
(52, 10, 'IV 0052'),
(53, 10, 'IV 0053'),
(54, 10, 'IV 0054'),
(55, 10, 'IV 0055'),
(56, 10, 'IV 0056'),
(57, 10, 'IV 0057'),
(58, 10, 'IV 0058'),
(59, 10, 'IV 0059'),
(60, 10, 'IV 0060'),
(61, 10, 'IV 0064'),
(64, 10, 'IV 0064'),
(62, 10, 'IV 0065'),
(65, 10, 'IV 0065'),
(63, 10, 'IV 0066'),
(66, 10, 'IV 0066'),
(1, 11, 'CCN 0001'),
(2, 11, 'CCN 0002'),
(1, 12, 'COR 001'),
(2, 12, 'COR 002'),
(3, 12, 'COR 003'),
(4, 12, 'COR 004'),
(5, 12, 'COR 005'),
(6, 12, 'COR 006'),
(7, 12, 'COR 007'),
(8, 12, 'COR 008'),
(9, 12, 'COR 009'),
(10, 12, 'COR 010'),
(11, 12, 'COR 011'),
(12, 12, 'COR 012'),
(13, 12, 'COR 013'),
(14, 12, 'COR 014'),
(15, 12, 'COR 015'),
(16, 12, 'COR 016'),
(17, 12, 'COR 017'),
(18, 12, 'COR 018'),
(19, 12, 'COR 019'),
(20, 12, 'COR 020'),
(21, 12, 'COR 021'),
(22, 12, 'COR 022'),
(23, 12, 'COR 023'),
(24, 12, 'COR 024'),
(25, 12, 'COR 025'),
(26, 12, 'COR 026'),
(27, 12, 'COR 027'),
(28, 12, 'COR 028'),
(29, 12, 'COR 029'),
(30, 12, 'COR 030'),
(31, 12, 'COR 031'),
(32, 12, 'COR 032'),
(33, 12, 'COR 033'),
(34, 12, 'COR 034'),
(35, 12, 'COR 035'),
(36, 12, 'COR 036'),
(37, 12, 'COR 037'),
(38, 12, 'COR 038'),
(39, 12, 'COR 039'),
(40, 12, 'COR 040'),
(41, 12, 'COR 041'),
(42, 12, 'COR 042'),
(43, 12, 'COR 045'),
(44, 12, 'COR 046'),
(45, 12, 'COR 048'),
(46, 12, 'COR 049'),
(1, 13, 'auto'),
(2, 13, 'auto'),
(3, 13, 'auto'),
(4, 13, 'auto'),
(5, 13, 'auto'),
(6, 13, 'auto'),
(7, 13, 'auto'),
(8, 13, 'auto'),
(9, 13, 'auto'),
(10, 13, 'auto'),
(11, 13, 'auto'),
(12, 13, 'auto'),
(13, 13, 'auto'),
(14, 13, 'auto'),
(15, 13, 'auto'),
(16, 13, 'auto'),
(17, 13, 'auto'),
(18, 13, 'auto'),
(19, 13, 'auto'),
(20, 13, 'auto'),
(21, 13, 'auto'),
(22, 13, 'auto'),
(23, 13, 'auto'),
(26, 13, 'auto'),
(29, 13, 'auto'),
(30, 13, 'auto'),
(31, 13, 'auto'),
(32, 13, 'auto'),
(33, 13, 'auto'),
(34, 13, 'auto'),
(24, 13, 'auto1'),
(25, 13, 'auto2'),
(27, 13, 'auto3'),
(28, 13, 'auto4'),
(35, 13, 'auto5'),
(1, 17, 'ADJ 0001'),
(2, 17, 'ADJ 0002'),
(32, 18, 'auto'),
(33, 18, 'auto'),
(34, 18, 'auto'),
(35, 18, 'auto'),
(36, 18, 'auto'),
(37, 18, 'auto'),
(38, 18, 'auto'),
(39, 18, 'auto'),
(40, 18, 'auto'),
(41, 18, 'auto'),
(42, 18, 'auto'),
(43, 18, 'auto'),
(44, 18, 'auto'),
(45, 18, 'auto'),
(46, 18, 'auto'),
(47, 18, 'auto'),
(48, 18, 'auto'),
(49, 18, 'auto'),
(50, 18, 'auto'),
(51, 18, 'auto'),
(52, 18, 'auto'),
(53, 18, 'auto'),
(54, 18, 'auto'),
(55, 18, 'auto'),
(56, 18, 'auto'),
(59, 18, 'auto'),
(60, 18, 'auto'),
(62, 18, 'auto'),
(57, 18, 'auto1'),
(58, 18, 'auto2'),
(61, 18, 'auto3'),
(1, 20, 'PI 0001'),
(14, 20, 'PI 00018'),
(15, 20, 'PI 00019'),
(2, 20, 'PI 0002'),
(16, 20, 'PI 00020'),
(17, 20, 'PI 00021'),
(18, 20, 'PI 00022'),
(19, 20, 'PI 00023'),
(20, 20, 'PI 00024'),
(21, 20, 'PI 00025'),
(22, 20, 'PI 00026'),
(23, 20, 'PI 00027'),
(24, 20, 'PI 00028'),
(25, 20, 'PI 00029'),
(3, 20, 'PI 0003'),
(26, 20, 'PI 00030'),
(27, 20, 'PI 00031'),
(28, 20, 'PI 00032'),
(29, 20, 'PI 00033'),
(30, 20, 'PI 00034'),
(31, 20, 'PI 00035'),
(32, 20, 'PI 00036'),
(33, 20, 'PI 00037'),
(4, 20, 'PI 0004'),
(5, 20, 'PI 0005'),
(6, 20, 'PI 0006'),
(7, 20, 'PI 0007'),
(8, 20, 'PI 0008'),
(9, 20, 'PI 0009'),
(10, 20, 'PI 0010'),
(11, 20, 'PI 0011'),
(12, 20, 'PI 0012'),
(13, 20, 'PI 0013'),
(1, 21, 'SCN 0001'),
(2, 21, 'SCN 0002'),
(1, 22, 'IJ/PV/0001'),
(2, 22, 'IJ/PV/0002'),
(3, 22, 'IJ/PV/0003'),
(4, 22, 'IJ/PV/0004'),
(5, 22, 'IJ/PV/0005'),
(6, 22, 'IJ/PV/0006'),
(7, 22, 'IJ/PV/0007'),
(8, 22, 'IJ/PV/0008'),
(9, 22, 'IJ/PV/0009'),
(10, 22, 'IJ/PV/0010'),
(11, 22, 'IJ/PV/0011'),
(12, 22, 'IJ/PV/0012'),
(13, 22, 'IJ/PV/0013'),
(14, 22, 'IJ/PV/0014'),
(15, 22, 'IJ/PV/0015'),
(31, 25, 'auto'),
(32, 25, 'auto'),
(33, 25, 'auto'),
(34, 25, 'auto'),
(35, 25, 'auto'),
(36, 25, 'auto'),
(37, 25, 'auto'),
(38, 25, 'auto'),
(39, 25, 'auto'),
(40, 25, 'auto'),
(41, 25, 'auto'),
(42, 25, 'auto'),
(43, 25, 'auto'),
(44, 25, 'auto'),
(45, 25, 'auto'),
(46, 25, 'auto'),
(47, 25, 'auto'),
(48, 25, 'auto'),
(49, 25, 'auto'),
(50, 25, 'auto'),
(51, 25, 'auto'),
(52, 25, 'auto'),
(53, 25, 'auto'),
(54, 25, 'auto'),
(55, 25, 'auto'),
(56, 25, 'auto'),
(60, 25, 'auto'),
(57, 25, 'auto1'),
(58, 25, 'auto2'),
(59, 25, 'auto3'),
(1, 30, 'auto'),
(2, 30, 'auto'),
(3, 30, 'auto'),
(4, 30, 'auto'),
(5, 30, 'auto'),
(6, 30, 'auto'),
(7, 30, 'auto'),
(8, 30, 'auto'),
(9, 30, 'auto'),
(10, 30, 'auto'),
(11, 30, 'auto'),
(12, 30, 'auto'),
(13, 30, 'auto'),
(14, 30, 'auto'),
(15, 30, 'auto'),
(16, 30, 'auto'),
(17, 30, 'auto'),
(18, 30, 'auto'),
(19, 30, 'auto'),
(20, 30, 'auto'),
(21, 30, 'auto'),
(22, 30, 'auto'),
(23, 30, 'auto'),
(24, 30, 'auto'),
(25, 30, 'auto'),
(26, 30, 'auto'),
(28, 30, 'auto'),
(30, 30, 'auto'),
(31, 30, 'auto'),
(32, 30, 'auto'),
(33, 30, 'auto'),
(34, 30, 'auto'),
(35, 30, 'auto'),
(37, 30, 'auto'),
(27, 30, 'auto1'),
(29, 30, 'auto2'),
(36, 30, 'auto3'),
(1, 32, 'QO 0001'),
(2, 32, 'QO 0002'),
(3, 32, 'QO 0003'),
(4, 32, 'QO 0004'),
(5, 32, 'QO 0005'),
(6, 32, 'QO 0006'),
(7, 32, 'QO 0007'),
(8, 32, 'QO 0008'),
(9, 32, 'QO 0009'),
(10, 32, 'QO 0010'),
(11, 32, 'QO 0011'),
(12, 32, 'QO 0012');

-- --------------------------------------------------------

--
-- Struktur dari tabel `salesman`
--

CREATE TABLE `salesman` (
  `salesman_code` int(11) NOT NULL,
  `salesman_name` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman_phone` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman_fax` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `provision` double NOT NULL DEFAULT '0',
  `break_pt` double NOT NULL DEFAULT '0',
  `provision2` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales_orders`
--

CREATE TABLE `sales_orders` (
  `order_no` int(11) NOT NULL,
  `trans_type` smallint(6) NOT NULL DEFAULT '30',
  `version` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `debtor_no` int(11) NOT NULL DEFAULT '0',
  `branch_code` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_ref` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `comments` tinytext COLLATE utf8_unicode_ci,
  `ord_date` date NOT NULL DEFAULT '0000-00-00',
  `order_type` int(11) NOT NULL DEFAULT '0',
  `ship_via` int(11) NOT NULL DEFAULT '0',
  `delivery_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deliver_to` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `freight_cost` double NOT NULL DEFAULT '0',
  `from_stk_loc` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `payment_terms` int(11) DEFAULT NULL,
  `total` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales_order_details`
--

CREATE TABLE `sales_order_details` (
  `id` int(11) NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT '0',
  `trans_type` smallint(6) NOT NULL DEFAULT '30',
  `stk_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `qty_sent` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL DEFAULT '0',
  `tax_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales_pos`
--

CREATE TABLE `sales_pos` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `pos_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cash_sale` tinyint(1) NOT NULL,
  `credit_sale` tinyint(1) NOT NULL,
  `pos_location` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `pos_account` smallint(6) UNSIGNED NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales_types`
--

CREATE TABLE `sales_types` (
  `id` int(11) NOT NULL,
  `sales_type` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_included` int(1) NOT NULL DEFAULT '0',
  `factor` double NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `sales_types`
--

INSERT INTO `sales_types` (`id`, `sales_type`, `tax_included`, `factor`, `inactive`) VALUES
(1, 'Tax Included', 1, 1, 0),
(2, 'Tax Excluded', 0, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `security_roles`
--

CREATE TABLE `security_roles` (
  `id` int(11) NOT NULL,
  `role` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sections` text COLLATE utf8_unicode_ci,
  `areas` text COLLATE utf8_unicode_ci,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `security_roles`
--

INSERT INTO `security_roles` (`id`, `role`, `description`, `sections`, `areas`, `inactive`) VALUES
(2, 'System Administrator', 'System Administrator', '256;512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;10496;10752;11008;13056;13312;15616;15872;16128;91136', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;526;769;770;771;772;773;774;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8195;8196;8197;8449;8450;8451;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15873;15874;15875;15876;15877;15878;15879;15880;15883;15881;15882;16129;16130;16131;16132;91236;91237', 0),
(3, 'Salesman', 'Salesman', '768;3072;5632;8192;15872', '773;774;3073;3075;3081;5633;8194;15873', 0),
(4, 'Stock Manager', 'Stock Manager', '2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '2818;2822;3073;3076;3077;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5889;5890;5891;8193;8194;8450;8451;10753;11009;11010;11012;13313;13315;15882;16129;16130;16131;16132', 0),
(5, 'Production Manager', 'Production Manager', '512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;10496;10752;11008;13056;13312;15616;15872;16128', '257;258;259;260;521;522;523;524;525;526;771;772;773;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8195;8196;8197;8449;8450;8451;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15876;15877;15880;15882;16129;16130;16131;16132;91236;91237', 0),
(6, 'Purchase Officer', 'Purchase Officer', '512;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5377;5633;5635;5640;5640;5889;5890;5891;8193;8194;8196;8197;8449;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132', 0),
(8, 'AP Officer', 'AP Officer', '512;2816;3072;3328;5376;5632;5888;8192;8448;13312;15616', '257;258;259;260;521;523;524;769;770;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5635;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10755;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15876;15877;15880;15882;16129;16130;16131;16132', 0),
(9, 'Accountant', 'New Accountant', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128;91136', '257;258;259;260;515;516;517;518;521;522;523;524;525;771;772;773;774;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10754;10755;11009;11010;11012;13057;13313;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15629;15873;15874;15875;15876;15877;15878;15879;15880;15883;15881;15882;15884;16129;16130;16131;16132;91236;91237', 0),
(10, 'Sub Admin', 'Sub Admin', '512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;13056;13312;15616;15872;16128;91136', '257;258;259;260;513;517;518;519;520;521;522;523;524;525;526;769;771;772;773;774;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8195;8196;8197;8449;8450;8451;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15873;15874;15875;15876;15877;15878;15879;15880;15882;15884;16129;16130;16131;16132', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shippers`
--

CREATE TABLE `shippers` (
  `shipper_id` int(11) NOT NULL,
  `shipper_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `shippers`
--

INSERT INTO `shippers` (`shipper_id`, `shipper_name`, `phone`, `phone2`, `contact`, `address`, `inactive`) VALUES
(1, 'Default', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `source_reference`
--

CREATE TABLE `source_reference` (
  `id` int(11) NOT NULL,
  `trans_type` tinyint(5) DEFAULT NULL,
  `trans_no` tinyint(11) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sql_trail`
--

CREATE TABLE `sql_trail` (
  `id` int(11) UNSIGNED NOT NULL,
  `sql` text COLLATE utf8_unicode_ci NOT NULL,
  `result` tinyint(1) NOT NULL,
  `msg` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_category`
--

CREATE TABLE `stock_category` (
  `category_id` int(11) NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_tax_type` int(11) NOT NULL DEFAULT '1',
  `dflt_units` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'each',
  `dflt_mb_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'B',
  `dflt_sales_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_cogs_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_inventory_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_adjustment_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_assembly_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_dim1` int(11) DEFAULT NULL,
  `dflt_dim2` int(11) DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `dflt_no_sale` tinyint(1) NOT NULL DEFAULT '0',
  `msic` char(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `stock_category`
--

INSERT INTO `stock_category` (`category_id`, `description`, `dflt_tax_type`, `dflt_units`, `dflt_mb_flag`, `dflt_sales_act`, `dflt_cogs_act`, `dflt_inventory_act`, `dflt_adjustment_act`, `dflt_assembly_act`, `dflt_dim1`, `dflt_dim2`, `inactive`, `dflt_no_sale`, `msic`) VALUES
(46, 'Default', 1, 'each', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, NULL),
(50, 'Services', 1, 'each', 'D', '4010', '5010', '1510', '1510', '1530', 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_master`
--

CREATE TABLE `stock_master` (
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `long_description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `units` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'each',
  `mb_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'B',
  `sales_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cogs_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inventory_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `adjustment_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `assembly_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimension_id` int(11) DEFAULT NULL,
  `dimension2_id` int(11) DEFAULT NULL,
  `actual_cost` double NOT NULL DEFAULT '0',
  `last_cost` double NOT NULL DEFAULT '0',
  `material_cost` double NOT NULL DEFAULT '0',
  `labour_cost` double NOT NULL DEFAULT '0',
  `overhead_cost` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `no_sale` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `sales_gst_type` int(11) NOT NULL,
  `purchase_gst_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_moves`
--

CREATE TABLE `stock_moves` (
  `trans_id` int(11) NOT NULL,
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `person_id` int(11) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `reference` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT '1',
  `discount_percent` double NOT NULL DEFAULT '0',
  `standard_cost` double NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supp_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `supp_ref` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `supp_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `gst_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `supp_account_no` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_account` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_code` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_terms` int(11) DEFAULT NULL,
  `tax_included` tinyint(1) NOT NULL DEFAULT '0',
  `dimension_id` int(11) DEFAULT '0',
  `dimension2_id` int(11) DEFAULT '0',
  `tax_group_id` int(11) DEFAULT NULL,
  `credit_limit` double NOT NULL DEFAULT '0',
  `purchase_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payable_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_discount_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `supplier_tax_id` int(11) DEFAULT NULL,
  `industry_code` int(11) DEFAULT NULL,
  `valid_gst` tinyint(1) NOT NULL DEFAULT '1',
  `last_verifile` date DEFAULT NULL,
  `self_bill` tinyint(1) DEFAULT '0',
  `self_bill_approval_ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supp_allocations`
--

CREATE TABLE `supp_allocations` (
  `id` int(11) NOT NULL,
  `amt` double UNSIGNED DEFAULT NULL,
  `date_alloc` date NOT NULL DEFAULT '0000-00-00',
  `trans_no_from` int(11) DEFAULT NULL,
  `trans_type_from` int(11) DEFAULT NULL,
  `trans_no_to` int(11) DEFAULT NULL,
  `trans_type_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supp_invoice_items`
--

CREATE TABLE `supp_invoice_items` (
  `id` int(11) NOT NULL,
  `supp_trans_no` int(11) DEFAULT NULL,
  `supp_trans_type` int(11) DEFAULT NULL,
  `gl_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `grn_item_id` int(11) DEFAULT NULL,
  `po_detail_item_id` int(11) DEFAULT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `quantity` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `unit_tax` double NOT NULL DEFAULT '0',
  `memo_` tinytext COLLATE utf8_unicode_ci,
  `tax_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supp_trans`
--

CREATE TABLE `supp_trans` (
  `trans_no` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `supplier_id` int(11) UNSIGNED DEFAULT NULL,
  `reference` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `supp_reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `ov_amount` double NOT NULL DEFAULT '0',
  `ov_discount` double NOT NULL DEFAULT '0',
  `ov_gst` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `alloc` double NOT NULL DEFAULT '0',
  `tax_included` tinyint(1) NOT NULL DEFAULT '0',
  `fixed_access` tinyint(1) NOT NULL DEFAULT '0',
  `tpe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cheque` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imported_goods` tinyint(1) DEFAULT '0',
  `paid_tax` tinyint(1) DEFAULT '0',
  `permit` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_upload` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sys_expense_type`
--

CREATE TABLE `sys_expense_type` (
  `id` int(11) NOT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sys_prefs`
--

CREATE TABLE `sys_prefs` (
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` smallint(6) DEFAULT NULL,
  `value` tinytext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `sys_prefs`
--

INSERT INTO `sys_prefs` (`name`, `category`, `type`, `length`, `value`) VALUES
('baddeb_sale_reverse', NULL, '', NULL, NULL),
('baddeb_sale_tax_reverse', NULL, '', NULL, NULL),
('baddeb_purchase_reverse', NULL, '', NULL, NULL),
('baddeb_purchase_tax_reverse', NULL, '', NULL, NULL),
('baddeb_sale_tax', NULL, '', NULL, NULL),
('baddeb_purchase_tax', NULL, '', NULL, NULL),
('gst_start_date', NULL, '', NULL, NULL),
('gst_default_code', NULL, '', NULL, NULL),
('self_bill_approval_ref', NULL, '', NULL, NULL),
('self_bill_start_date', NULL, '', NULL, NULL),
('self_bill_end_date', NULL, '', NULL, NULL),
('maximum_claimable_currency', NULL, '', NULL, NULL),
('maximum_claimable_input_tax', NULL, '', NULL, NULL),
('rounding_difference_act', NULL, '', NULL, NULL),
('coy_name', 'setup.company', 'varchar', 60, NULL),
('gst_no', 'setup.company', 'varchar', 25, NULL),
('coy_no', 'setup.company', 'varchar', 25, NULL),
('tax_prd', 'setup.company', 'int', 11, NULL),
('tax_last', 'setup.company', 'int', 11, NULL),
('postal_address', 'setup.company', 'tinytext', 0, ''),
('custom_duty', NULL, '', NULL, NULL),
('phone', 'setup.company', 'varchar', 30, NULL),
('fax', 'setup.company', 'varchar', 30, NULL),
('email', 'setup.company', 'varchar', 100, NULL),
('coy_logo', 'setup.company', 'varchar', 100, NULL),
('domicile', 'setup.company', 'varchar', 55, NULL),
('curr_default', 'setup.company', 'char', 3, NULL),
('use_dimension', 'setup.company', 'tinyint', 1, NULL),
('f_year', 'setup.company', 'int', 11, '0'),
('no_item_list', 'setup.company', 'tinyint', 1, NULL),
('no_customer_list', 'setup.company', 'tinyint', 1, NULL),
('no_supplier_list', 'setup.company', 'tinyint', 1, NULL),
('base_sales', 'setup.company', 'int', 11, '0'),
('time_zone', 'setup.company', 'tinyint', 1, '0'),
('add_pct', 'setup.company', 'int', 5, '-1'),
('round_to', 'setup.company', 'int', 5, NULL),
('login_tout', 'setup.company', 'smallint', 6, NULL),
('past_due_days', 'glsetup.general', 'int', 11, NULL),
('profit_loss_year_act', 'glsetup.general', 'varchar', 15, NULL),
('retained_earnings_act', 'glsetup.general', 'varchar', 15, NULL),
('bank_charge_act', 'glsetup.general', 'varchar', 15, NULL),
('exchange_diff_act', 'glsetup.general', 'varchar', 15, NULL),
('default_credit_limit', 'glsetup.customer', 'int', 11, NULL),
('accumulate_shipping', 'glsetup.customer', 'tinyint', 1, '0'),
('legal_text', 'glsetup.customer', 'tinytext', 0, NULL),
('freight_act', 'glsetup.customer', 'varchar', 15, NULL),
('debtors_act', 'glsetup.sales', 'varchar', 15, NULL),
('default_sales_act', 'glsetup.sales', 'varchar', 15, NULL),
('default_sales_discount_act', 'glsetup.sales', 'varchar', 15, NULL),
('default_prompt_payment_act', 'glsetup.sales', 'varchar', 15, NULL),
('default_delivery_required', 'glsetup.sales', 'smallint', 6, NULL),
('default_dim_required', 'glsetup.dims', 'int', 11, NULL),
('pyt_discount_act', 'glsetup.purchase', 'varchar', 15, NULL),
('creditors_act', 'glsetup.purchase', 'varchar', 15, NULL),
('po_over_receive', 'glsetup.purchase', 'int', 11, NULL),
('po_over_charge', 'glsetup.purchase', 'int', 11, NULL),
('allow_negative_stock', 'glsetup.inventory', 'tinyint', 1, NULL),
('default_inventory_act', 'glsetup.items', 'varchar', 15, NULL),
('default_cogs_act', 'glsetup.items', 'varchar', 15, NULL),
('default_adj_act', 'glsetup.items', 'varchar', 15, NULL),
('default_inv_sales_act', 'glsetup.items', 'varchar', 15, NULL),
('default_assembly_act', 'glsetup.items', 'varchar', 15, NULL),
('default_workorder_required', 'glsetup.manuf', 'int', 11, NULL),
('version_id', 'system', 'varchar', 11, NULL),
('auto_curr_reval', 'setup.company', 'smallint', 6, '0'),
('grn_clearing_act', 'glsetup.purchase', 'varchar', 15, NULL),
('bcc_email', 'setup.company', 'varchar', 100, ''),
('coy_def_language', NULL, '', NULL, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sys_revenue_type`
--

CREATE TABLE `sys_revenue_type` (
  `id` int(11) NOT NULL,
  `title` varchar(25) NOT NULL,
  `class` varchar(50) DEFAULT NULL,
  `gl_account` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sys_revenue_type`
--

INSERT INTO `sys_revenue_type` (`id`, `title`, `class`, `gl_account`) VALUES
(1, 'Commission', 'A', '4011'),
(2, 'Rental ', 'Rental', '5760'),
(3, 'Shipping', 'Shipping', '4430'),
(4, 'Interest', 'Interest ', '4440');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sys_types`
--

CREATE TABLE `sys_types` (
  `type_id` smallint(6) NOT NULL DEFAULT '0',
  `type_no` int(11) NOT NULL DEFAULT '1',
  `next_reference` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `sys_types`
--

INSERT INTO `sys_types` (`type_id`, `type_no`, `next_reference`) VALUES
(0, 19, 'JV 0003'),
(1, 8, 'J/PV/0017'),
(2, 5, 'OR 0007'),
(4, 3, 'FT 0002'),
(10, 19, 'IV 0067'),
(11, 3, 'CCN 0003'),
(12, 6, 'COR 050'),
(13, 5, 'auto6'),
(16, 2, 'TR 0001'),
(17, 2, 'ADJ 0003'),
(18, 1, 'auto'),
(20, 8, 'PI 00038'),
(21, 1, 'SCN 0003'),
(22, 4, 'IJ/PV/0016'),
(25, 1, 'auto'),
(26, 1, '1'),
(28, 1, '1'),
(29, 1, '1'),
(30, 5, 'auto'),
(32, 0, 'QO 0013'),
(35, 1, '1'),
(40, 1, '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tag_associations`
--

CREATE TABLE `tag_associations` (
  `record_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tax_groups`
--

CREATE TABLE `tax_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tax_groups`
--

INSERT INTO `tax_groups` (`id`, `name`, `tax_shipping`, `inactive`) VALUES
(1, 'Standard Taxable Customers', 1, 0),
(2, 'Tax Exempt', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tax_group_items`
--

CREATE TABLE `tax_group_items` (
  `tax_group_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tax_types`
--

CREATE TABLE `tax_types` (
  `id` int(11) NOT NULL,
  `rate` double NOT NULL DEFAULT '0',
  `sales_gl_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `purchasing_gl_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `gst_03_type` tinyint(3) NOT NULL,
  `f3_box` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `use_for` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tax_types`
--

INSERT INTO `tax_types` (`id`, `rate`, `sales_gl_code`, `purchasing_gl_code`, `name`, `inactive`, `gst_03_type`, `f3_box`, `use_for`) VALUES
(12, 6, '2150', '1300', 'Purchase GST Standard 6% (TX)', 0, 1, '6a', 3),
(13, 6, '2150', '1300', 'Purchase - Goods And Services Tax (IM)', 0, 2, '6a', 3),
(14, 0, '2150', '1300', 'Purchase - Goods And Services Tax', 1, 0, '', 1),
(15, 6, '2150', '1300', 'Purchase - Goods And Services Tax (BL)', 0, 4, '', 3),
(16, 0, '2150', '1300', 'Purchase - Goods And Services Tax (NR)', 0, 5, '', 3),
(17, 0, '2150', '1300', 'Purchase - Goods And Services Tax (ZP)', 0, 6, '6a', 3),
(18, 0, '2150', '1300', 'Purchase - Goods And Services Tax (ZP)', 0, 6, '6a', 3),
(19, 0, '2150', '1300', 'Purchase - Goods And Services Tax (EP)', 0, 7, '', 3),
(20, 0, '2150', '1300', 'Purchase - Goods And Services Tax (OP)', 0, 8, '6a', 3),
(21, 6, '2150', '1300', 'Purchase - Goods And Services Tax (TX-E43)', 0, 9, '6a', 3),
(22, 6, '2150', '1300', 'Purchase - Goods And Services Tax (TX-N43)', 0, 10, '', 3),
(23, 7, '2150', '1300', 'Purchase - Goods And Services Tax', 1, 0, '', 1),
(24, 0, '2150', '1300', 'Purchase - Goods And Services Tax', 1, 0, '', 1),
(25, 7, '2150', '1300', 'Purchase - Goods And Services Tax', 1, 0, '', 1),
(26, 6, '2150', '1300', 'SR', 0, 14, '5a', 2),
(27, 0, '2150', '1300', 'Supply - Goods And Services Tax (ZRE)', 0, 104, '', 2),
(28, 0, '2150', '1300', 'Supply - Goods And Services Tax (ES43)', 0, 16, '', 2),
(29, 0, '2150', '1300', 'Supply - Goods And Services Tax (ESN43)', 0, 17, '', 2),
(30, 6, '2150', '1300', 'Supply - Goods And Services Tax (DS)', 0, 18, '', 2),
(31, 0, '2150', '1300', 'Supply - Goods And Services Tax (OS)', 0, 19, '', 2),
(32, 0, '2150', '1300', 'Supply - Goods And Services Tax (ES)', 0, 20, '', 2),
(33, 0, '2150', '1300', 'Supply - Goods And Services Tax', 1, 0, '', 1),
(34, 0, '2150', '1300', 'Supply - Goods And Services Tax', 1, 0, '', 1),
(35, 7, '2150', '1300', 'Supply - Services Tax', 1, 0, '', 1),
(37, 0, '2150', '1300', 'Supply - Goods And Services Tax', 1, 0, '', 1),
(38, 0, '2150', '1300', '', 0, 0, '', 1),
(39, 0, '2150', '1300', '', 0, 0, '', 1),
(40, 0, '2150', '1300', '', 0, 0, '', 1),
(41, 0, '2150', '1300', '', 0, 0, '', 1),
(42, 0, '2150', '1300', '', 0, 0, '', 1),
(43, 0, '2150', '1300', '', 0, 0, '', 1),
(44, 0, '2150', '1300', '', 0, 0, '', 1),
(45, 0, '2150', '1300', '', 0, 0, '', 1),
(46, 0, '2150', '1300', '', 0, 0, '', 1),
(47, 0, '2150', '1300', '', 0, 0, '', 1),
(48, 0, '2150', '1300', '', 0, 0, '', 1),
(49, 0, '2150', '1300', '', 0, 0, '', 1),
(50, 0, '2150', '1300', '', 0, 0, '', 1),
(51, 0, '2150', '1300', '', 0, 0, '', 1),
(52, 0, '2150', '1300', '', 0, 0, '', 1),
(53, 0, '2150', '1300', '', 0, 0, '', 1),
(54, 0, '2150', '1300', '', 0, 0, '', 1),
(55, 0, '2150', '1300', '', 0, 0, '', 1),
(56, 8, '2150', '1300', 'Test Tax', 1, 0, '', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbltaxcode`
--

CREATE TABLE `tbltaxcode` (
  `taxcodeid` int(11) NOT NULL,
  `taxcodeno` varchar(60) NOT NULL,
  `defaultrate` double DEFAULT NULL,
  `taxcodecategory` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbltaxcode`
--

INSERT INTO `tbltaxcode` (`taxcodeid`, `taxcodeno`, `defaultrate`, `taxcodecategory`) VALUES
(1, 'TX', 6, '0'),
(2, 'IM', 6, '0'),
(3, 'IS', 0, '0'),
(4, 'BL', 6, '0'),
(5, 'NR', 0, '0'),
(6, 'ZP', 0, '0'),
(7, 'EP', 0, '0'),
(8, 'OP', 0, '0'),
(9, 'TX-E43', 6, '0'),
(10, 'TX-N43', 6, '0'),
(11, 'TX-RE', 0, '0'),
(12, 'GP', 6, '0'),
(13, 'AP', 0, '0'),
(14, 'SR', 6, '1'),
(15, 'ZR', 6, '1'),
(16, 'ES43', 0, '1'),
(17, 'ESN43', 0, '1'),
(18, 'DS', 0, '1'),
(19, 'OS', 6, '1'),
(20, 'ES', 0, '1'),
(21, 'RS', 0, '1'),
(22, 'GS', 0, '1'),
(23, 'AS', 6, '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_tax_details`
--

CREATE TABLE `trans_tax_details` (
  `id` int(11) NOT NULL,
  `trans_type` smallint(6) DEFAULT NULL,
  `trans_no` int(11) DEFAULT NULL,
  `tran_date` date NOT NULL,
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  `ex_rate` double NOT NULL DEFAULT '1',
  `included_in_price` tinyint(1) NOT NULL DEFAULT '0',
  `net_amount` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `memo` tinytext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `useronline`
--

CREATE TABLE `useronline` (
  `id` int(11) NOT NULL,
  `timestamp` int(15) NOT NULL DEFAULT '0',
  `ip` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `useronline_limit`
--

CREATE TABLE `useronline_limit` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `login_active` int(1) NOT NULL,
  `timestamp` int(15) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `useronline_limit`
--

INSERT INTO `useronline_limit` (`id`, `username`, `login_active`, `timestamp`, `ip`) VALUES
(1, 'admin', 1, 1514531433, '127.0.0.1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `useronline_limit_log`
--

CREATE TABLE `useronline_limit_log` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `timelogin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `useronline_limit_log`
--

INSERT INTO `useronline_limit_log` (`id`, `username`, `ip`, `timelogin`) VALUES
(1, 'admin', '127.0.0.1', '2017-12-29 03:10:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` smallint(6) NOT NULL,
  `user_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_id` int(11) NOT NULL DEFAULT '1',
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_format` tinyint(1) NOT NULL DEFAULT '0',
  `date_sep` tinyint(1) NOT NULL DEFAULT '0',
  `tho_sep` tinyint(1) NOT NULL DEFAULT '0',
  `dec_sep` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `page_size` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A4',
  `prices_dec` smallint(6) NOT NULL DEFAULT '2',
  `qty_dec` smallint(6) NOT NULL DEFAULT '2',
  `rates_dec` smallint(6) NOT NULL DEFAULT '4',
  `percent_dec` smallint(6) NOT NULL DEFAULT '1',
  `show_gl` tinyint(1) NOT NULL DEFAULT '1',
  `show_codes` tinyint(1) NOT NULL DEFAULT '0',
  `show_hints` tinyint(1) NOT NULL DEFAULT '0',
  `last_visit_date` datetime DEFAULT NULL,
  `query_size` tinyint(1) UNSIGNED NOT NULL DEFAULT '10',
  `graphic_links` tinyint(1) DEFAULT '1',
  `pos` smallint(6) DEFAULT '1',
  `print_profile` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rep_popup` tinyint(1) DEFAULT '1',
  `sticky_doc_date` tinyint(1) DEFAULT '0',
  `startup_tab` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `amount_dec` tinyint(1) NOT NULL DEFAULT '0',
  `imei` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `user_id`, `password`, `real_name`, `role_id`, `phone`, `email`, `language`, `date_format`, `date_sep`, `tho_sep`, `dec_sep`, `theme`, `page_size`, `prices_dec`, `qty_dec`, `rates_dec`, `percent_dec`, `show_gl`, `show_codes`, `show_hints`, `last_visit_date`, `query_size`, `graphic_links`, `pos`, `print_profile`, `rep_popup`, `sticky_doc_date`, `startup_tab`, `inactive`, `amount_dec`, `imei`) VALUES
(10, 'admin', '4297f44b13955235245b2497399d7a93', 'Administrator', 2, '', '', 'C', 1, 2, 0, 0, 'uniq365', 'A4', 2, 2, 4, 2, 1, 1, 1, '2017-12-29 15:10:33', 50, 1, 1, '', 1, 1, 'orders', 0, 2, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `voided`
--

CREATE TABLE `voided` (
  `type` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `memo_` tinytext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `workcentres`
--

CREATE TABLE `workcentres` (
  `id` int(11) NOT NULL,
  `name` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `workorders`
--

CREATE TABLE `workorders` (
  `id` int(11) NOT NULL,
  `wo_ref` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loc_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `units_reqd` double NOT NULL DEFAULT '1',
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `required_by` date NOT NULL DEFAULT '0000-00-00',
  `released_date` date NOT NULL DEFAULT '0000-00-00',
  `units_issued` double NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `released` tinyint(1) NOT NULL DEFAULT '0',
  `additional_costs` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wo_issues`
--

CREATE TABLE `wo_issues` (
  `issue_no` int(11) NOT NULL,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `loc_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workcentre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wo_issue_items`
--

CREATE TABLE `wo_issue_items` (
  `id` int(11) NOT NULL,
  `stock_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `qty_issued` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wo_manufacture`
--

CREATE TABLE `wo_manufacture` (
  `id` int(11) NOT NULL,
  `reference` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wo_requirements`
--

CREATE TABLE `wo_requirements` (
  `id` int(11) NOT NULL,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `workcentre` int(11) NOT NULL DEFAULT '0',
  `units_req` double NOT NULL DEFAULT '1',
  `std_cost` double NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `units_issued` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_no` (`type_no`,`trans_no`);

--
-- Indeks untuk tabel `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Seq` (`fiscal_year`,`gl_date`,`gl_seq`),
  ADD KEY `Type_and_Number` (`type`,`trans_no`);

--
-- Indeks untuk tabel `bad_debts`
--
ALTER TABLE `bad_debts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_account_name` (`bank_account_name`),
  ADD KEY `bank_account_number` (`bank_account_number`),
  ADD KEY `account_code` (`account_code`);

--
-- Indeks untuk tabel `bank_trans`
--
ALTER TABLE `bank_trans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_act` (`bank_act`,`ref`),
  ADD KEY `type` (`type`,`trans_no`),
  ADD KEY `bank_act_2` (`bank_act`,`reconciled`),
  ADD KEY `bank_act_3` (`bank_act`,`trans_date`);

--
-- Indeks untuk tabel `bank_trans_detail`
--
ALTER TABLE `bank_trans_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `bom`
--
ALTER TABLE `bom`
  ADD PRIMARY KEY (`id`,`parent`,`component`,`workcentre_added`,`loc_code`),
  ADD KEY `component` (`component`),
  ADD KEY `id` (`id`),
  ADD KEY `loc_code` (`loc_code`),
  ADD KEY `parent` (`parent`,`loc_code`),
  ADD KEY `workcentre_added` (`workcentre_added`);

--
-- Indeks untuk tabel `budget_trans`
--
ALTER TABLE `budget_trans`
  ADD PRIMARY KEY (`counter`),
  ADD KEY `Type_and_Number` (`type`,`type_no`),
  ADD KEY `Account` (`account`,`tran_date`,`dimension_id`,`dimension2_id`);

--
-- Indeks untuk tabel `chart_class`
--
ALTER TABLE `chart_class`
  ADD PRIMARY KEY (`cid`);

--
-- Indeks untuk tabel `chart_master`
--
ALTER TABLE `chart_master`
  ADD PRIMARY KEY (`account_code`),
  ADD KEY `account_name` (`account_name`),
  ADD KEY `accounts_by_type` (`account_type`,`account_code`);

--
-- Indeks untuk tabel `chart_types`
--
ALTER TABLE `chart_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `class_id` (`class_id`);

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD KEY `type_and_id` (`type`,`id`);

--
-- Indeks untuk tabel `credit_status`
--
ALTER TABLE `credit_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reason_description` (`reason_description`);

--
-- Indeks untuk tabel `crm_categories`
--
ALTER TABLE `crm_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`,`action`),
  ADD UNIQUE KEY `type_2` (`type`,`name`);

--
-- Indeks untuk tabel `crm_contacts`
--
ALTER TABLE `crm_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`action`);

--
-- Indeks untuk tabel `crm_persons`
--
ALTER TABLE `crm_persons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref` (`ref`);

--
-- Indeks untuk tabel `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`curr_abrev`);

--
-- Indeks untuk tabel `cust_allocations`
--
ALTER TABLE `cust_allocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `From` (`trans_type_from`,`trans_no_from`),
  ADD KEY `To` (`trans_type_to`,`trans_no_to`);

--
-- Indeks untuk tabel `cust_branch`
--
ALTER TABLE `cust_branch`
  ADD PRIMARY KEY (`branch_code`,`debtor_no`),
  ADD KEY `branch_code` (`branch_code`),
  ADD KEY `branch_ref` (`branch_ref`),
  ADD KEY `group_no` (`group_no`);

--
-- Indeks untuk tabel `dashboard_reminders`
--
ALTER TABLE `dashboard_reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `data_incorrect`
--
ALTER TABLE `data_incorrect`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `debtors_master`
--
ALTER TABLE `debtors_master`
  ADD PRIMARY KEY (`debtor_no`),
  ADD UNIQUE KEY `debtor_ref` (`debtor_ref`),
  ADD KEY `name` (`name`);

--
-- Indeks untuk tabel `debtor_trans`
--
ALTER TABLE `debtor_trans`
  ADD PRIMARY KEY (`type`,`trans_no`),
  ADD KEY `debtor_no` (`debtor_no`,`branch_code`),
  ADD KEY `tran_date` (`tran_date`),
  ADD KEY `order_` (`order_`);

--
-- Indeks untuk tabel `debtor_trans_details`
--
ALTER TABLE `debtor_trans_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Transaction` (`debtor_trans_type`,`debtor_trans_no`),
  ADD KEY `src_id` (`src_id`);

--
-- Indeks untuk tabel `dimensions`
--
ALTER TABLE `dimensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference` (`reference`),
  ADD KEY `date_` (`date_`),
  ADD KEY `due_date` (`due_date`),
  ADD KEY `type_` (`type_`);

--
-- Indeks untuk tabel `documents_bookkeepers`
--
ALTER TABLE `documents_bookkeepers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `exchange_rates`
--
ALTER TABLE `exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `curr_code` (`curr_code`,`date_`);

--
-- Indeks untuk tabel `files_template_bank_accout`
--
ALTER TABLE `files_template_bank_accout`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files_template_bank_deposit`
--
ALTER TABLE `files_template_bank_deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files_template_bank_payment`
--
ALTER TABLE `files_template_bank_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files_template_bank_reconcile`
--
ALTER TABLE `files_template_bank_reconcile`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files_template_credit_note`
--
ALTER TABLE `files_template_credit_note`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files_template_deliveries`
--
ALTER TABLE `files_template_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files_template_invoice`
--
ALTER TABLE `files_template_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files_template_purchase_orders`
--
ALTER TABLE `files_template_purchase_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files_template_receipts`
--
ALTER TABLE `files_template_receipts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files_template_remittances`
--
ALTER TABLE `files_template_remittances`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files_template_sales_order`
--
ALTER TABLE `files_template_sales_order`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files_template_sales_quotation`
--
ALTER TABLE `files_template_sales_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `files_template_statements`
--
ALTER TABLE `files_template_statements`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `fiscal_year`
--
ALTER TABLE `fiscal_year`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `begin` (`begin`),
  ADD UNIQUE KEY `end` (`end`);

--
-- Indeks untuk tabel `gl_trans`
--
ALTER TABLE `gl_trans`
  ADD PRIMARY KEY (`counter`),
  ADD KEY `Type_and_Number` (`type`,`type_no`),
  ADD KEY `dimension_id` (`dimension_id`),
  ADD KEY `dimension2_id` (`dimension2_id`),
  ADD KEY `tran_date` (`tran_date`),
  ADD KEY `account_and_tran_date` (`account`,`tran_date`);

--
-- Indeks untuk tabel `grn_batch`
--
ALTER TABLE `grn_batch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_date` (`delivery_date`),
  ADD KEY `purch_order_no` (`purch_order_no`);

--
-- Indeks untuk tabel `grn_items`
--
ALTER TABLE `grn_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grn_batch_id` (`grn_batch_id`);

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indeks untuk tabel `import_process`
--
ALTER TABLE `import_process`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indeks untuk tabel `item_codes`
--
ALTER TABLE `item_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_id` (`stock_id`,`item_code`),
  ADD KEY `item_code` (`item_code`);

--
-- Indeks untuk tabel `item_tax_types`
--
ALTER TABLE `item_tax_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `item_tax_type_exemptions`
--
ALTER TABLE `item_tax_type_exemptions`
  ADD PRIMARY KEY (`item_tax_type_id`,`tax_type_id`);

--
-- Indeks untuk tabel `item_units`
--
ALTER TABLE `item_units`
  ADD PRIMARY KEY (`abbr`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `kv_country`
--
ALTER TABLE `kv_country`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kv_departments`
--
ALTER TABLE `kv_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kv_empl_attendancee`
--
ALTER TABLE `kv_empl_attendancee`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kv_empl_cv`
--
ALTER TABLE `kv_empl_cv`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kv_empl_degree`
--
ALTER TABLE `kv_empl_degree`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kv_empl_experience`
--
ALTER TABLE `kv_empl_experience`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kv_empl_info`
--
ALTER TABLE `kv_empl_info`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kv_empl_job`
--
ALTER TABLE `kv_empl_job`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kv_empl_loan`
--
ALTER TABLE `kv_empl_loan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kv_empl_option`
--
ALTER TABLE `kv_empl_option`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kv_empl_salary`
--
ALTER TABLE `kv_empl_salary`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kv_empl_training`
--
ALTER TABLE `kv_empl_training`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kv_loan_types`
--
ALTER TABLE `kv_loan_types`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`loc_code`);

--
-- Indeks untuk tabel `loc_stock`
--
ALTER TABLE `loc_stock`
  ADD PRIMARY KEY (`loc_code`,`stock_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indeks untuk tabel `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `movement_types`
--
ALTER TABLE `movement_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `msic_division`
--
ALTER TABLE `msic_division`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indeks untuk tabel `msic_item`
--
ALTER TABLE `msic_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indeks untuk tabel `msic_section`
--
ALTER TABLE `msic_section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indeks untuk tabel `opening_cache`
--
ALTER TABLE `opening_cache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `opening_customer`
--
ALTER TABLE `opening_customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balance` (`balance`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `opening_gl`
--
ALTER TABLE `opening_gl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `opening_gl_system`
--
ALTER TABLE `opening_gl_system`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `opening_product`
--
ALTER TABLE `opening_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `id_3` (`id`);

--
-- Indeks untuk tabel `opening_sale`
--
ALTER TABLE `opening_sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indeks untuk tabel `payment_terms`
--
ALTER TABLE `payment_terms`
  ADD PRIMARY KEY (`terms_indicator`),
  ADD UNIQUE KEY `terms` (`terms`);

--
-- Indeks untuk tabel `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `price` (`stock_id`,`sales_type_id`,`curr_abrev`);

--
-- Indeks untuk tabel `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `print_profiles`
--
ALTER TABLE `print_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profile` (`profile`,`report`);

--
-- Indeks untuk tabel `purch_data`
--
ALTER TABLE `purch_data`
  ADD PRIMARY KEY (`supplier_id`,`stock_id`);

--
-- Indeks untuk tabel `purch_orders`
--
ALTER TABLE `purch_orders`
  ADD PRIMARY KEY (`order_no`),
  ADD KEY `ord_date` (`ord_date`);

--
-- Indeks untuk tabel `purch_order_details`
--
ALTER TABLE `purch_order_details`
  ADD PRIMARY KEY (`po_detail_item`),
  ADD KEY `order` (`order_no`,`po_detail_item`);

--
-- Indeks untuk tabel `quick_entries`
--
ALTER TABLE `quick_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `description` (`description`);

--
-- Indeks untuk tabel `quick_entry_lines`
--
ALTER TABLE `quick_entry_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qid` (`qid`);

--
-- Indeks untuk tabel `recurrent_invoices`
--
ALTER TABLE `recurrent_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indeks untuk tabel `refs`
--
ALTER TABLE `refs`
  ADD PRIMARY KEY (`id`,`type`),
  ADD KEY `Type_and_Reference` (`type`,`reference`);

--
-- Indeks untuk tabel `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`salesman_code`),
  ADD UNIQUE KEY `salesman_name` (`salesman_name`);

--
-- Indeks untuk tabel `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD PRIMARY KEY (`trans_type`,`order_no`);

--
-- Indeks untuk tabel `sales_order_details`
--
ALTER TABLE `sales_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sorder` (`trans_type`,`order_no`);

--
-- Indeks untuk tabel `sales_pos`
--
ALTER TABLE `sales_pos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pos_name` (`pos_name`);

--
-- Indeks untuk tabel `sales_types`
--
ALTER TABLE `sales_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_type` (`sales_type`);

--
-- Indeks untuk tabel `security_roles`
--
ALTER TABLE `security_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role` (`role`);

--
-- Indeks untuk tabel `shippers`
--
ALTER TABLE `shippers`
  ADD PRIMARY KEY (`shipper_id`),
  ADD UNIQUE KEY `name` (`shipper_name`);

--
-- Indeks untuk tabel `source_reference`
--
ALTER TABLE `source_reference`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sql_trail`
--
ALTER TABLE `sql_trail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stock_category`
--
ALTER TABLE `stock_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indeks untuk tabel `stock_master`
--
ALTER TABLE `stock_master`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indeks untuk tabel `stock_moves`
--
ALTER TABLE `stock_moves`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `type` (`type`,`trans_no`),
  ADD KEY `Move` (`stock_id`,`loc_code`,`tran_date`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `supp_ref` (`supp_ref`);

--
-- Indeks untuk tabel `supp_allocations`
--
ALTER TABLE `supp_allocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `From` (`trans_type_from`,`trans_no_from`),
  ADD KEY `To` (`trans_type_to`,`trans_no_to`);

--
-- Indeks untuk tabel `supp_invoice_items`
--
ALTER TABLE `supp_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Transaction` (`supp_trans_type`,`supp_trans_no`,`stock_id`);

--
-- Indeks untuk tabel `supp_trans`
--
ALTER TABLE `supp_trans`
  ADD PRIMARY KEY (`type`,`trans_no`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `SupplierID_2` (`supplier_id`,`supp_reference`),
  ADD KEY `type` (`type`),
  ADD KEY `tran_date` (`tran_date`);

--
-- Indeks untuk tabel `sys_expense_type`
--
ALTER TABLE `sys_expense_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sys_prefs`
--
ALTER TABLE `sys_prefs`
  ADD PRIMARY KEY (`name`),
  ADD KEY `category` (`category`);

--
-- Indeks untuk tabel `sys_revenue_type`
--
ALTER TABLE `sys_revenue_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sys_types`
--
ALTER TABLE `sys_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`,`name`);

--
-- Indeks untuk tabel `tag_associations`
--
ALTER TABLE `tag_associations`
  ADD UNIQUE KEY `record_id` (`record_id`,`tag_id`);

--
-- Indeks untuk tabel `tax_groups`
--
ALTER TABLE `tax_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `tax_group_items`
--
ALTER TABLE `tax_group_items`
  ADD PRIMARY KEY (`tax_group_id`,`tax_type_id`);

--
-- Indeks untuk tabel `tax_types`
--
ALTER TABLE `tax_types`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbltaxcode`
--
ALTER TABLE `tbltaxcode`
  ADD PRIMARY KEY (`taxcodeid`);

--
-- Indeks untuk tabel `trans_tax_details`
--
ALTER TABLE `trans_tax_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Type_and_Number` (`trans_type`,`trans_no`),
  ADD KEY `tran_date` (`tran_date`);

--
-- Indeks untuk tabel `useronline`
--
ALTER TABLE `useronline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timestamp` (`timestamp`),
  ADD KEY `ip` (`ip`);

--
-- Indeks untuk tabel `useronline_limit`
--
ALTER TABLE `useronline_limit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `useronline_limit_log`
--
ALTER TABLE `useronline_limit_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `voided`
--
ALTER TABLE `voided`
  ADD UNIQUE KEY `id` (`type`,`id`);

--
-- Indeks untuk tabel `workcentres`
--
ALTER TABLE `workcentres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `workorders`
--
ALTER TABLE `workorders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wo_ref` (`wo_ref`);

--
-- Indeks untuk tabel `wo_issues`
--
ALTER TABLE `wo_issues`
  ADD PRIMARY KEY (`issue_no`),
  ADD KEY `workorder_id` (`workorder_id`);

--
-- Indeks untuk tabel `wo_issue_items`
--
ALTER TABLE `wo_issue_items`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `wo_manufacture`
--
ALTER TABLE `wo_manufacture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workorder_id` (`workorder_id`);

--
-- Indeks untuk tabel `wo_requirements`
--
ALTER TABLE `wo_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workorder_id` (`workorder_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bad_debts`
--
ALTER TABLE `bad_debts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bank_trans`
--
ALTER TABLE `bank_trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bank_trans_detail`
--
ALTER TABLE `bank_trans_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bom`
--
ALTER TABLE `bom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `budget_trans`
--
ALTER TABLE `budget_trans`
  MODIFY `counter` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `credit_status`
--
ALTER TABLE `credit_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `crm_categories`
--
ALTER TABLE `crm_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pure technical key', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `crm_contacts`
--
ALTER TABLE `crm_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `crm_persons`
--
ALTER TABLE `crm_persons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cust_allocations`
--
ALTER TABLE `cust_allocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cust_branch`
--
ALTER TABLE `cust_branch`
  MODIFY `branch_code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dashboard_reminders`
--
ALTER TABLE `dashboard_reminders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `data_incorrect`
--
ALTER TABLE `data_incorrect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `debtors_master`
--
ALTER TABLE `debtors_master`
  MODIFY `debtor_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `debtor_trans_details`
--
ALTER TABLE `debtor_trans_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dimensions`
--
ALTER TABLE `dimensions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `documents_bookkeepers`
--
ALTER TABLE `documents_bookkeepers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `exchange_rates`
--
ALTER TABLE `exchange_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files_template_bank_accout`
--
ALTER TABLE `files_template_bank_accout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files_template_bank_deposit`
--
ALTER TABLE `files_template_bank_deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files_template_bank_payment`
--
ALTER TABLE `files_template_bank_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files_template_bank_reconcile`
--
ALTER TABLE `files_template_bank_reconcile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files_template_credit_note`
--
ALTER TABLE `files_template_credit_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files_template_deliveries`
--
ALTER TABLE `files_template_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files_template_invoice`
--
ALTER TABLE `files_template_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files_template_purchase_orders`
--
ALTER TABLE `files_template_purchase_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files_template_receipts`
--
ALTER TABLE `files_template_receipts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files_template_remittances`
--
ALTER TABLE `files_template_remittances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files_template_sales_order`
--
ALTER TABLE `files_template_sales_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `files_template_sales_quotation`
--
ALTER TABLE `files_template_sales_quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files_template_statements`
--
ALTER TABLE `files_template_statements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fiscal_year`
--
ALTER TABLE `fiscal_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `gl_trans`
--
ALTER TABLE `gl_trans`
  MODIFY `counter` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `grn_batch`
--
ALTER TABLE `grn_batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `grn_items`
--
ALTER TABLE `grn_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `import_process`
--
ALTER TABLE `import_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `item_codes`
--
ALTER TABLE `item_codes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `item_tax_types`
--
ALTER TABLE `item_tax_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kv_country`
--
ALTER TABLE `kv_country`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT untuk tabel `kv_departments`
--
ALTER TABLE `kv_departments`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kv_empl_attendancee`
--
ALTER TABLE `kv_empl_attendancee`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kv_empl_cv`
--
ALTER TABLE `kv_empl_cv`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kv_empl_degree`
--
ALTER TABLE `kv_empl_degree`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kv_empl_experience`
--
ALTER TABLE `kv_empl_experience`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kv_empl_info`
--
ALTER TABLE `kv_empl_info`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kv_empl_job`
--
ALTER TABLE `kv_empl_job`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kv_empl_loan`
--
ALTER TABLE `kv_empl_loan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kv_empl_option`
--
ALTER TABLE `kv_empl_option`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `kv_empl_salary`
--
ALTER TABLE `kv_empl_salary`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kv_empl_training`
--
ALTER TABLE `kv_empl_training`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kv_loan_types`
--
ALTER TABLE `kv_loan_types`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `movement_types`
--
ALTER TABLE `movement_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `msic_division`
--
ALTER TABLE `msic_division`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT untuk tabel `msic_item`
--
ALTER TABLE `msic_item`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `msic_section`
--
ALTER TABLE `msic_section`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `opening_cache`
--
ALTER TABLE `opening_cache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `opening_customer`
--
ALTER TABLE `opening_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `opening_gl`
--
ALTER TABLE `opening_gl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `opening_gl_system`
--
ALTER TABLE `opening_gl_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `opening_product`
--
ALTER TABLE `opening_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `opening_sale`
--
ALTER TABLE `opening_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payment_terms`
--
ALTER TABLE `payment_terms`
  MODIFY `terms_indicator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `printers`
--
ALTER TABLE `printers`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `print_profiles`
--
ALTER TABLE `print_profiles`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `purch_orders`
--
ALTER TABLE `purch_orders`
  MODIFY `order_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purch_order_details`
--
ALTER TABLE `purch_order_details`
  MODIFY `po_detail_item` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `quick_entries`
--
ALTER TABLE `quick_entries`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `quick_entry_lines`
--
ALTER TABLE `quick_entry_lines`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `recurrent_invoices`
--
ALTER TABLE `recurrent_invoices`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `salesman`
--
ALTER TABLE `salesman`
  MODIFY `salesman_code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sales_order_details`
--
ALTER TABLE `sales_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sales_pos`
--
ALTER TABLE `sales_pos`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sales_types`
--
ALTER TABLE `sales_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `security_roles`
--
ALTER TABLE `security_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `shippers`
--
ALTER TABLE `shippers`
  MODIFY `shipper_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `source_reference`
--
ALTER TABLE `source_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sql_trail`
--
ALTER TABLE `sql_trail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stock_category`
--
ALTER TABLE `stock_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `stock_moves`
--
ALTER TABLE `stock_moves`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `supp_allocations`
--
ALTER TABLE `supp_allocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `supp_invoice_items`
--
ALTER TABLE `supp_invoice_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sys_expense_type`
--
ALTER TABLE `sys_expense_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sys_revenue_type`
--
ALTER TABLE `sys_revenue_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tax_groups`
--
ALTER TABLE `tax_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tax_types`
--
ALTER TABLE `tax_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `tbltaxcode`
--
ALTER TABLE `tbltaxcode`
  MODIFY `taxcodeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `trans_tax_details`
--
ALTER TABLE `trans_tax_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `useronline`
--
ALTER TABLE `useronline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `useronline_limit`
--
ALTER TABLE `useronline_limit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `useronline_limit_log`
--
ALTER TABLE `useronline_limit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `workcentres`
--
ALTER TABLE `workcentres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `workorders`
--
ALTER TABLE `workorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `wo_issues`
--
ALTER TABLE `wo_issues`
  MODIFY `issue_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `wo_issue_items`
--
ALTER TABLE `wo_issue_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `wo_manufacture`
--
ALTER TABLE `wo_manufacture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `wo_requirements`
--
ALTER TABLE `wo_requirements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
