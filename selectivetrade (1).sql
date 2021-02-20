-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2021 at 02:32 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `selectivetrade`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `Username` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Time` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `amount` float(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `month`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 30.00, '2021-02-18 01:39:08', '2021-02-18 10:06:57'),
(4, 4, 100.00, '2021-02-18 08:59:25', '2021-02-18 08:59:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(40, '2014_10_12_000000_create_users_table', 1),
(41, '2014_10_12_100000_create_password_resets_table', 1),
(42, '2019_08_19_000000_create_failed_jobs_table', 1),
(43, '2020_12_15_133452_add_status_to_users_table', 1),
(44, '2020_12_16_114740_create_roles_table', 1),
(45, '2020_12_16_114921_add_role_id_to_users_table', 1),
(46, '2021_01_05_103230_create_trades_table', 2),
(47, '2021_01_14_060246_create_subscriptions_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'user', '2020-12-16 07:15:09', '2020-12-16 07:15:09'),
(2, 'admin', '2020-12-16 07:15:29', '2020-12-16 07:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 24, 1, '2021-01-18 19:00:00', NULL),
(2, 49, 5, '2021-01-18 19:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--

CREATE TABLE `trades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `s_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `buy_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `qty` int(11) NOT NULL,
  `symbol` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `callput` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `strike_price` double(8,2) NOT NULL,
  `stock_price` double(8,2) NOT NULL,
  `stock_stoploss` double(8,2) NOT NULL,
  `stock_resistance` double(8,2) NOT NULL,
  `buy_price` double(8,2) NOT NULL,
  `sell_price` double(8,2) NOT NULL,
  `sell_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `net` double(8,2) NOT NULL,
  `profit` int(11) NOT NULL,
  `current_price` int(11) NOT NULL,
  `days_to_expire` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hold',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trades`
--

INSERT INTO `trades` (`id`, `s_no`, `buy_date`, `qty`, `symbol`, `expiration_date`, `callput`, `strike_price`, `stock_price`, `stock_stoploss`, `stock_resistance`, `buy_price`, `sell_price`, `sell_date`, `net`, `profit`, `current_price`, `days_to_expire`, `status`, `created_at`, `updated_at`) VALUES
(1, '#sdfsdfsdf', '2021-01-05 12:46:43', 5, '#sdfsafs dafsa f', '2021-01-05 12:46:43', 'PUT', 500.00, 400.00, 30.00, 20.00, 380.00, 500.00, '2020-1-1', 43.00, 20, 380, 30, 'hold', NULL, NULL),
(6, '1', '2021-01-05 12:46:43', 1, '1', '2021-01-05 12:46:43', 'PUT', 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, '2021-01-05 19:46:43', 1.00, 1, 1, 1, 'hold', '2021-02-10 11:40:49', '2021-02-10 11:40:49'),
(7, '2', '2021-01-05 12:46:43', 2, '2', '2021-01-05 12:46:43', 'PUT', 2.00, 2.00, 2.00, 2.00, 2.00, 2.00, '2021-01-05 19:46:43', 2.00, 2, 2, 2, 'hold', '2021-02-10 11:40:49', '2021-02-10 11:40:49'),
(8, '3', '2021-01-05 12:46:43', 3, '3', '2021-01-05 12:46:43', 'PUT', 3.00, 3.00, 3.00, 3.00, 3.00, 3.00, '2021-01-05 19:46:43', 3.00, 3, 3, 3, 'hold', '2021-02-10 11:40:49', '2021-02-10 11:40:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `telegram_id`, `twitter_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`, `role_id`, `ip`) VALUES
(24, 'hussain', NULL, 'admin@admin.com', '3429616625', NULL, NULL, NULL, '$2y$10$mSdiMB22tbZPTESW8/bPX.6EhLhfths9m7o9I152qpkxI5hdeGt1S', NULL, '2021-01-05 02:17:30', '2021-01-19 01:51:50', 1, 2, NULL),
(49, 'hussain', NULL, 'user@user.com', '3429616625', NULL, NULL, NULL, '$2y$10$OWG4U8xyHmZpb5WQUZJig.rkLw6OJlG3OUmXYmRfjukjwMioR/Y4e', NULL, '2021-01-05 02:17:30', '2021-01-19 01:51:50', 1, 1, NULL),
(50, 'Shakir', 'Abbas', 'Malikshakir35@gmail.com', '3087021312', NULL, NULL, NULL, '$2y$10$184DFmE7joYKT/Lvea/1l.AlMbOWhPoTwD4SbytILsniJV2lLIRX6', NULL, '2021-01-29 11:21:03', '2021-01-29 11:21:03', 0, 1, NULL),
(51, 'ahmad', 'ali', 'hussainalisdfgdfgdfg@gmail.com', '3429616625', NULL, NULL, NULL, '$2y$10$I61acZYguBm7YGQsnFb65.IsdHZ/8VzP6vlhf9VP/pEBaKjhCH6lS', NULL, '2021-01-29 11:21:03', '2021-01-29 11:21:03', 0, 1, NULL),
(52, 'Shakir', 'Abbas', 'shakirabbas210sacasdc@gmail.com', '03087021312', NULL, NULL, NULL, '$2y$10$JL2EK.79RViPKrn6Yq7xWOHvjiH.T/GQgwkSn8GkqnywbRmyUjVeC', NULL, '2021-01-29 11:25:06', '2021-01-29 11:25:06', 0, 1, NULL),
(53, 'Srinivasa', 'v', 'usa.srao@gmail.com', '4123529956', NULL, NULL, NULL, '$2y$10$KPrDPdGEy2jjK40/kaf.uOHBTZ9WZhnLQXUaDk0CcX8/cSP80LEYm', NULL, '2021-01-29 12:46:15', '2021-01-29 12:46:15', 0, 1, NULL),
(54, 'Shakir', 'abbas', 'shakirabbas210@gmail.com', '03087021312', NULL, NULL, NULL, '$2y$10$dt9idwajvA6dHIg2y/uWWOh7msUl92Aeht1RhvUUDQvfRag.KBfGS', NULL, '2021-01-30 12:26:36', '2021-01-30 12:26:36', 0, 1, NULL),
(55, 'Shashi', 'Singh', 'shashi.bhushan@gmail.com', '4087865200', NULL, NULL, NULL, '$2y$10$6R0pFeeQzl7eCdJAV9e9L.G9qJILiSY3g7.S0BhgJTdkD.hd4zV7q', NULL, '2021-01-30 16:46:48', '2021-01-30 16:46:48', 0, 1, NULL),
(56, 'adid', NULL, 'adibonchis@gmail.com', '+1-45674987984848', NULL, NULL, NULL, '$2y$10$z9eUQLSS1nCwVfkD21oeOuxH5gfMiTxFXAoncvMdvTwhf1tMrH5S2', NULL, '2021-02-09 10:26:53', '2021-02-10 11:35:37', 0, 1, NULL),
(58, 'john', NULL, 'johnran@gmail.com', '+49-809890898', NULL, NULL, NULL, '$2y$10$UZAv9x05EOzf3JJVhesSKuzk6HB5Ka8Hr2n8/Y0k4WqGoUj6hDhIW', NULL, '2021-02-10 11:39:43', '2021-02-10 11:39:43', 0, 1, NULL),
(63, 'qqq', NULL, 'qqq@gmail.com', '+1-234234', NULL, NULL, NULL, '$2y$10$FAb552uhp87d5c6oKPqc2exe59wkitHpuhlozls9KRF3FfdarPhbS', NULL, '2021-02-18 11:05:04', '2021-02-18 11:05:04', 0, 1, NULL),
(64, 'www', NULL, 'www@gmail.com', '+10-www', NULL, NULL, NULL, '$2y$10$j722q1rbMr63QFS7QZ3X4ec1NMqBZk.HCgDQ94zeeKS3I0uB2CqIK', NULL, '2021-02-18 11:06:42', '2021-02-18 11:06:42', 0, 1, NULL),
(65, 'rrr', NULL, 'rrr@gmail.com', '+1-2334242', NULL, NULL, NULL, '$2y$10$kjkCAVNdX6Tbe6qguQbvnOZB0H7iiWLX5VjiXa2goEdzWHBBhxphy', NULL, '2021-02-18 11:18:17', '2021-02-18 11:18:17', 0, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_unique` (`role`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_foreign` (`user_id`);

--
-- Indexes for table `trades`
--
ALTER TABLE `trades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trades`
--
ALTER TABLE `trades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
