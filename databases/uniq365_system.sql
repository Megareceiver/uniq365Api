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
-- Database: `uniq365_system`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules`
--

CREATE TABLE `modules` (
  `id` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sequence` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `changed_by` varchar(100) DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `modules`
--

INSERT INTO `modules` (`id`, `name`, `sequence`, `created_by`, `created_at`, `changed_by`, `changed_at`) VALUES
('m_home', 'HOME', 1, 'initial', '2017-11-15 14:50:23', NULL, NULL),
('m_sales', 'SALES', 2, 'initial', '2017-11-15 14:50:23', NULL, NULL),
('m_purchase', 'PURCHASE', 3, 'initial', '2017-11-15 14:53:01', NULL, NULL),
('m_inventory', 'INVENTORY', 4, 'initial', '2017-11-15 14:53:01', NULL, NULL),
('m_cash_and_gl', 'CASH and GL', 5, 'initial', '2017-11-15 14:54:21', NULL, NULL),
('m_accountant', 'ACCOUNTANT', 6, 'initial', '2017-11-15 14:54:21', NULL, NULL),
('m_setup', 'SETUP', 7, 'initial', '2017-11-15 14:54:47', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules_group`
--

CREATE TABLE `modules_group` (
  `id` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sequence` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `changed_by` varchar(100) DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `modules_group`
--

INSERT INTO `modules_group` (`id`, `name`, `sequence`, `created_by`, `created_at`, `changed_by`, `changed_at`) VALUES
('mg_operations', 'OPERATIONS', 1, 'initial', '2017-11-15 14:26:24', NULL, NULL),
('mg_inquiries', 'INQUIRIES', 2, 'initial', '2017-11-15 14:26:24', NULL, NULL),
('mg_reports', 'REPORTS', 3, 'initial', '2017-11-15 14:40:25', NULL, NULL),
('mg_doc_printing', 'DOC PRINTING', 4, 'initial', '2017-11-15 14:40:25', NULL, NULL),
('mg_housekeeping', 'HOUSEKEEPING', 5, 'initial', '2017-11-15 14:43:01', NULL, NULL),
('mg_m_accounting', 'MOBILE ACCOUNTANT', 6, 'initial', '2017-11-15 14:43:01', NULL, NULL),
('mg_company', 'COMPANY', 7, 'initial', '2017-11-15 14:47:00', NULL, NULL),
('mg_miscellanous', 'MISCELLANOUS', 8, 'initial', '2017-11-15 14:47:00', NULL, NULL),
('mg_maintenance', 'MAINTENANCE', 9, 'initial', '2017-11-15 14:48:06', NULL, NULL),
('mg_opening_bal', 'OPENING BALANCES', 10, 'initisl', '2017-11-15 14:48:06', NULL, NULL),
('mg_quick_keys', 'QUICK KEYS', 11, 'initial', '2017-11-15 18:21:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules_sub`
--

CREATE TABLE `modules_sub` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_modules` varchar(15) NOT NULL,
  `id_modules_group` varchar(15) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `changed_by` varchar(100) DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `modules_sub`
--

INSERT INTO `modules_sub` (`id`, `name`, `id_modules`, `id_modules_group`, `created_by`, `created_at`, `changed_by`, `changed_at`) VALUES
(1, 'Sales Quotation', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(2, 'Sales Order', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(3, 'Direct Delivery Order', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(4, 'Direct Invoice', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(5, 'Sales Invoice', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(6, 'Deliveries Against Sales Order', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(7, 'Invoice Against D/O', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(8, 'Copy Delivery', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(9, 'Copy Invoice', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(10, 'Create & Print Recurring Invoice', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(11, 'Customer Payments', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(12, 'Customer Credit Notes', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(13, 'Allocate Customer Payments', 'm_sales', 'mg_operations', 'initial', '2017-11-15 15:23:07', NULL, NULL),
(14, 'Customer Transactions', 'm_sales', 'mg_inquiries', 'initial', '2017-11-15 15:32:56', NULL, NULL),
(15, 'Customer Allocations', 'm_sales', 'mg_inquiries', 'initial', '2017-11-15 15:32:56', NULL, NULL),
(16, 'Check Transactions', 'm_sales', 'mg_inquiries', 'initial', '2017-11-15 15:32:56', NULL, NULL),
(17, 'Customer Ledger', 'm_sales', 'mg_reports', 'initial', '2017-11-15 15:33:20', NULL, NULL),
(18, 'Aged Customer Analysis', 'm_sales', 'mg_reports', 'initial', '2017-11-15 15:33:20', NULL, NULL),
(19, 'Customer Detail Listing', 'm_sales', 'mg_reports', 'initial', '2017-11-15 15:33:20', NULL, NULL),
(20, 'Sales Summary Report', 'm_sales', 'mg_reports', 'initial', '2017-11-15 15:33:20', NULL, NULL),
(21, 'Price List', 'm_sales', 'mg_reports', 'initial', '2017-11-15 15:33:20', NULL, NULL),
(22, 'Order Status Listing', 'm_sales', 'mg_reports', 'initial', '2017-11-15 15:33:20', NULL, NULL),
(23, 'Salesman Listing', 'm_sales', 'mg_reports', 'initial', '2017-11-15 15:33:20', NULL, NULL),
(24, 'Print Invoices', 'm_sales', 'mg_doc_printing', 'initial', '2017-11-15 15:41:54', NULL, NULL),
(25, 'Print Credit Notes', 'm_sales', 'mg_doc_printing', 'initial', '2017-11-15 15:41:54', NULL, NULL),
(26, 'Print Delivery Orders', 'm_sales', 'mg_doc_printing', 'initial', '2017-11-15 15:41:54', NULL, NULL),
(27, 'Print Statements', 'm_sales', 'mg_doc_printing', 'initial', '2017-11-15 15:41:54', NULL, NULL),
(28, 'Print Sales Orders', 'm_sales', 'mg_doc_printing', 'initial', '2017-11-15 15:41:54', NULL, NULL),
(29, 'Print Sales Quotations', 'm_sales', 'mg_doc_printing', 'initial', '2017-11-15 15:41:54', NULL, NULL),
(30, 'Print Receipts', 'm_sales', 'mg_doc_printing', 'initial', '2017-11-15 15:41:54', NULL, NULL),
(31, 'Customer Maintenance', 'm_sales', 'mg_housekeeping', 'initial', '2017-11-15 15:49:38', NULL, NULL),
(32, 'Customer Branches', 'm_sales', 'mg_housekeeping', 'initial', '2017-11-15 15:49:38', NULL, NULL),
(33, 'Sales Groups', 'm_sales', 'mg_housekeeping', 'initial', '2017-11-15 15:49:38', NULL, NULL),
(34, 'Sales Types', 'm_sales', 'mg_housekeeping', 'initial', '2017-11-15 15:49:38', NULL, NULL),
(35, 'Sales Person', 'm_sales', 'mg_housekeeping', 'initial', '2017-11-15 15:49:38', NULL, NULL),
(36, 'Sales Area', 'm_sales', 'mg_housekeeping', 'initial', '2017-11-15 15:49:38', NULL, NULL),
(37, 'Credit Status Setup', 'm_sales', 'mg_housekeeping', 'initial', '2017-11-15 15:49:38', NULL, NULL),
(38, 'Items (Service Only)', 'm_sales', 'mg_housekeeping', 'initial', '2017-11-15 15:49:38', NULL, NULL),
(39, 'Purchase Orders', 'm_purchase', 'mg_operations', 'initial', '2017-11-15 15:54:10', NULL, NULL),
(40, 'Direct GRN', 'm_purchase', 'mg_operations', 'initial', '2017-11-15 15:54:10', NULL, NULL),
(41, 'Direct Invoice', 'm_purchase', 'mg_operations', 'initial', '2017-11-15 15:54:10', NULL, NULL),
(42, 'Supplier Invoices', 'm_purchase', 'mg_operations', 'initial', '2017-11-15 15:54:10', NULL, NULL),
(43, 'Payment to Supplies', 'm_purchase', 'mg_operations', 'initial', '2017-11-15 15:54:10', NULL, NULL),
(44, 'Supplier Credit Notes', 'm_purchase', 'mg_operations', 'initial', '2017-11-15 15:54:10', NULL, NULL),
(45, 'Allocate Supplier Payments', 'm_purchase', 'mg_operations', 'initial', '2017-11-15 15:54:10', NULL, NULL),
(46, 'Supplier Transactions', 'm_purchase', 'mg_inquiries', 'initial', '2017-11-15 15:56:36', NULL, NULL),
(47, 'Supplier Allocations', 'm_purchase', 'mg_inquiries', 'initial', '2017-11-15 15:56:36', NULL, NULL),
(48, 'Check Transactions', 'm_purchase', 'mg_inquiries', 'initial', '2017-11-15 15:56:36', NULL, NULL),
(49, 'Supplier Ledger', 'm_purchase', 'mg_reports', 'initial', '2017-11-15 15:58:52', NULL, NULL),
(50, 'Aged Supplier Analysis', 'm_purchase', 'mg_reports', 'initial', '2017-11-15 15:58:52', NULL, NULL),
(51, 'Payment Report Report', 'm_purchase', 'mg_reports', 'initial', '2017-11-15 15:58:52', NULL, NULL),
(52, 'Outstanding GRN Report', 'm_purchase', 'mg_reports', 'initial', '2017-11-15 15:58:52', NULL, NULL),
(53, 'Supplier Detail Listing', 'm_purchase', 'mg_reports', 'initial', '2017-11-15 15:58:52', NULL, NULL),
(54, 'Print PO', 'm_purchase', 'mg_doc_printing', 'initial', '2017-11-15 16:00:23', NULL, NULL),
(55, 'Print remittance', 'm_purchase', 'mg_doc_printing', 'initial', '2017-11-15 16:00:23', NULL, NULL),
(56, 'Supplier Maintenance', 'm_purchase', 'mg_housekeeping', 'initial', '2017-11-15 16:01:37', NULL, NULL),
(57, 'Items (Service Only)', 'm_purchase', 'mg_housekeeping', 'initial', '2017-11-15 16:01:37', NULL, NULL),
(58, 'Inventory Location Transfers', 'm_inventory', 'mg_operations', 'initial', '2017-11-15 16:05:01', NULL, NULL),
(59, 'Inventory Adjustments', 'm_inventory', 'mg_operations', 'initial', '2017-11-15 16:05:01', NULL, NULL),
(60, 'Inventory Item Movement', 'm_inventory', 'mg_inquiries', 'initial', '2017-11-15 16:05:29', NULL, NULL),
(61, 'Inventory Item Status', 'm_inventory', 'mg_inquiries', 'initial', '2017-11-15 16:05:29', NULL, NULL),
(62, 'Inventory  Valuation Report', 'm_inventory', 'mg_reports', 'initial', '2017-11-15 16:13:15', NULL, NULL),
(63, 'Inventory Planning Report', 'm_inventory', 'mg_reports', 'initial', '2017-11-15 16:13:15', NULL, NULL),
(64, 'Stock Check Sheets', 'm_inventory', 'mg_reports', 'initial', '2017-11-15 16:13:15', NULL, NULL),
(65, 'Inventory Sales Report', 'm_inventory', 'mg_reports', 'initial', '2017-11-15 16:13:15', NULL, NULL),
(66, 'GNL Valuation Report', 'm_inventory', 'mg_reports', 'initial', '2017-11-15 16:13:15', NULL, NULL),
(67, 'Inventory Purchasing Report', 'm_inventory', 'mg_reports', 'initial', '2017-11-15 16:13:15', NULL, NULL),
(68, 'Inventory Movement Report', 'm_inventory', 'mg_reports', 'initial', '2017-11-15 16:13:15', NULL, NULL),
(69, 'Costed Inventory Report', 'm_inventory', 'mg_reports', 'initial', '2017-11-15 16:13:15', NULL, NULL),
(70, 'Item Sales Summary Report', 'm_inventory', 'mg_reports', 'initial', '2017-11-15 16:13:15', NULL, NULL),
(71, 'Items', 'm_inventory', 'mg_housekeeping', 'initial', '2017-11-15 16:16:05', NULL, NULL),
(72, 'Foreign Item Codes', 'm_inventory', 'mg_housekeeping', 'initial', '2017-11-15 16:16:05', NULL, NULL),
(73, 'Sales Kits', 'm_inventory', 'mg_housekeeping', 'initial', '2017-11-15 16:16:05', NULL, NULL),
(74, 'Item Categories', 'm_inventory', 'mg_housekeeping', 'initial', '2017-11-15 16:16:05', NULL, NULL),
(75, 'Inventory Locations', 'm_inventory', 'mg_housekeeping', 'initial', '2017-11-15 16:16:05', NULL, NULL),
(76, 'Inventory Movement Types', 'm_inventory', 'mg_housekeeping', 'initial', '2017-11-15 16:16:05', NULL, NULL),
(77, 'Units of Measure', 'm_inventory', 'mg_housekeeping', 'initial', '2017-11-15 16:16:05', NULL, NULL),
(78, 'Sales Pricing', 'm_inventory', 'mg_housekeeping', 'initial', '2017-11-15 16:16:05', NULL, NULL),
(79, 'Purchasing Pricing', 'm_inventory', 'mg_housekeeping', 'initial', '2017-11-15 16:16:05', NULL, NULL),
(80, 'Standard Costs', 'm_inventory', 'mg_housekeeping', 'initial', '2017-11-15 16:16:05', NULL, NULL),
(81, 'Payments', 'm_cash_and_gl', 'mg_operations', 'initial', '2017-11-15 16:20:21', NULL, NULL),
(82, 'Receipts', 'm_cash_and_gl', 'mg_operations', 'initial', '2017-11-15 16:20:21', NULL, NULL),
(83, 'Bank Account Transfers', 'm_cash_and_gl', 'mg_operations', 'initial', '2017-11-15 16:20:21', NULL, NULL),
(84, 'Journal Entry', 'm_cash_and_gl', 'mg_operations', 'initial', '2017-11-15 16:20:21', NULL, NULL),
(85, 'Reconcile Bank Account', 'm_cash_and_gl', 'mg_operations', 'initial', '2017-11-15 16:20:21', NULL, NULL),
(86, 'Budget Entry', 'm_cash_and_gl', 'mg_operations', 'initial', '2017-11-15 16:20:21', NULL, NULL),
(87, 'GST Form 3 / Form 5', 'm_cash_and_gl', 'mg_inquiries', 'initial', '2017-11-15 16:22:32', NULL, NULL),
(88, 'Journal', 'm_cash_and_gl', 'mg_inquiries', 'initial', '2017-11-15 16:22:32', NULL, NULL),
(89, 'GL', 'm_cash_and_gl', 'mg_inquiries', 'initial', '2017-11-15 16:22:32', NULL, NULL),
(90, 'Bank Account', 'm_cash_and_gl', 'mg_inquiries', 'initial', '2017-11-15 16:22:32', NULL, NULL),
(91, 'GST Tax', 'm_cash_and_gl', 'mg_inquiries', 'initial', '2017-11-15 16:22:32', NULL, NULL),
(92, 'Trial balance', 'm_cash_and_gl', 'mg_inquiries', 'initial', '2017-11-15 16:22:32', NULL, NULL),
(93, 'Balance Sheet Drilldown', 'm_cash_and_gl', 'mg_inquiries', 'initial', '2017-11-15 16:22:32', NULL, NULL),
(94, 'Profit & Loss Drilldown', 'm_cash_and_gl', 'mg_inquiries', 'initial', '2017-11-15 16:22:32', NULL, NULL),
(95, 'Bank Statement', 'm_cash_and_gl', 'mg_reports', 'initial', '2017-11-15 16:26:03', NULL, NULL),
(96, 'Chart of Accounts', 'm_cash_and_gl', 'mg_reports', 'initial', '2017-11-15 16:26:03', NULL, NULL),
(97, 'List of Journal Entries', 'm_cash_and_gl', 'mg_reports', 'initial', '2017-11-15 16:26:03', NULL, NULL),
(98, 'GL Account Transactions', 'm_cash_and_gl', 'mg_reports', 'initial', '2017-11-15 16:26:03', NULL, NULL),
(99, 'Annual Expense Breakdown', 'm_cash_and_gl', 'mg_reports', 'initial', '2017-11-15 16:26:03', NULL, NULL),
(100, 'Balance Sheet', 'm_cash_and_gl', 'mg_reports', 'initial', '2017-11-15 16:26:03', NULL, NULL),
(101, 'Profit & Loss Statement', 'm_cash_and_gl', 'mg_reports', 'initial', '2017-11-15 16:26:03', NULL, NULL),
(102, 'Trial Balance', 'm_cash_and_gl', 'mg_reports', 'initial', '2017-11-15 16:26:03', NULL, NULL),
(103, 'Tax Report', 'm_cash_and_gl', 'mg_reports', 'initial', '2017-11-15 16:26:03', NULL, NULL),
(104, 'Audit Trail', 'm_cash_and_gl', 'mg_reports', 'initial', '2017-11-15 16:26:03', NULL, NULL),
(105, 'GST Grouping Details', 'm_cash_and_gl', 'mg_reports', 'initial', '2017-11-15 16:26:03', NULL, NULL),
(106, 'Bank Accounts', 'm_cash_and_gl', 'mg_housekeeping', 'initial', '2017-11-15 17:17:48', NULL, NULL),
(107, 'Quick Entries', 'm_cash_and_gl', 'mg_housekeeping', 'initial', '2017-11-15 17:17:48', NULL, NULL),
(108, 'Account Tags', 'm_cash_and_gl', 'mg_housekeeping', 'initial', '2017-11-15 17:17:48', NULL, NULL),
(109, 'Currencies', 'm_cash_and_gl', 'mg_housekeeping', 'initial', '2017-11-15 17:17:48', NULL, NULL),
(110, 'Exchange Rates', 'm_cash_and_gl', 'mg_housekeeping', 'initial', '2017-11-15 17:17:48', NULL, NULL),
(111, 'GL Accounts', 'm_cash_and_gl', 'mg_housekeeping', 'initial', '2017-11-15 17:17:48', NULL, NULL),
(112, 'GL Account Classes', 'm_cash_and_gl', 'mg_housekeeping', 'initial', '2017-11-15 17:17:48', NULL, NULL),
(113, 'Revaluation of Currency Accounts', 'm_cash_and_gl', 'mg_housekeeping', 'initial', '2017-11-15 17:17:48', NULL, NULL),
(114, 'Process Journals', 'm_accountant', 'mg_operations', 'initial', '2017-11-15 17:20:13', NULL, NULL),
(115, 'Trial balance Export', 'm_accountant', 'mg_operations', 'initial', '2017-11-15 17:20:13', NULL, NULL),
(116, 'Management Reports', 'm_accountant', 'mg_operations', 'initial', '2017-11-15 17:20:13', NULL, NULL),
(117, 'Mobile Accountant', 'm_accountant', 'mg_m_accounting', 'initial', '2017-11-15 17:22:19', NULL, NULL),
(118, 'Import Data', 'm_setup', 'mg_company', 'initial', '2017-11-15 17:25:50', NULL, NULL),
(119, 'Company Setup', 'm_setup', 'mg_company', 'initial', '2017-11-15 17:25:50', NULL, NULL),
(120, 'User Account Setup', 'm_setup', 'mg_company', 'initial', '2017-11-15 17:25:50', NULL, NULL),
(121, 'Access Setup', 'm_setup', 'mg_company', 'initial', '2017-11-15 17:25:50', NULL, NULL),
(122, 'Display Setup', 'm_setup', 'mg_company', 'initial', '2017-11-15 17:25:50', NULL, NULL),
(123, 'Forms Setup', 'm_setup', 'mg_company', 'initial', '2017-11-15 17:25:50', NULL, NULL),
(124, 'Taxes', 'm_setup', 'mg_company', 'initial', '2017-11-15 17:25:50', NULL, NULL),
(125, 'System & GL Setup', 'm_setup', 'mg_company', 'initial', '2017-11-15 17:25:50', NULL, NULL),
(126, 'Fiscal Years', 'm_setup', 'mg_company', 'initial', '2017-11-15 17:25:50', NULL, NULL),
(127, 'Payment Terms', 'm_setup', 'mg_miscellanous', 'initial', '2017-11-15 17:27:48', NULL, NULL),
(128, 'Shipping Company', 'm_setup', 'mg_miscellanous', 'initial', '2017-11-15 17:27:48', NULL, NULL),
(129, 'Points of Sales', 'm_setup', 'mg_miscellanous', 'initial', '2017-11-15 17:27:48', NULL, NULL),
(130, 'Printers', 'm_setup', 'mg_miscellanous', 'initial', '2017-11-15 17:27:48', NULL, NULL),
(131, 'Contact Categories', 'm_setup', 'mg_miscellanous', 'initial', '2017-11-15 17:27:48', NULL, NULL),
(132, 'Void a Transaction', 'm_setup', 'mg_maintenance', 'initial', '2017-11-15 17:29:33', NULL, NULL),
(133, 'View  or Print Transaction', 'm_setup', 'mg_maintenance', 'initial', '2017-11-15 17:29:33', NULL, NULL),
(134, 'Attach Documents', 'm_setup', 'mg_maintenance', 'initial', '2017-11-15 17:29:33', NULL, NULL),
(135, 'Audit Trails', 'm_setup', 'mg_maintenance', 'initial', '2017-11-15 17:29:33', NULL, NULL),
(136, 'Bank Accounts', 'm_setup', 'mg_opening_bal', 'initial', '2017-11-15 17:31:12', NULL, NULL),
(137, 'System GL Balances', 'm_setup', 'mg_opening_bal', 'initial', '2017-11-15 17:31:12', NULL, NULL),
(138, 'Inventory', 'm_setup', 'mg_opening_bal', 'initial', '2017-11-15 17:31:12', NULL, NULL),
(139, 'Customers', 'm_setup', 'mg_opening_bal', 'initial', '2017-11-15 17:31:12', NULL, NULL),
(140, 'Suppliers', 'm_setup', 'mg_opening_bal', 'initial', '2017-11-15 17:31:12', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `modules_group`
--
ALTER TABLE `modules_group`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `modules_sub`
--
ALTER TABLE `modules_sub`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_modules` (`id_modules`),
  ADD KEY `id_modules_group` (`id_modules_group`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `modules_sub`
--
ALTER TABLE `modules_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
