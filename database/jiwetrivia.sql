-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2021 at 05:17 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jiwetrivia`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard`
--

CREATE TABLE `leaderboard` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mainhome`
--

CREATE TABLE `mainhome` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 2),
(7, '2019_08_19_000000_create_failed_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('05336944df9d99f3ef92705b8e8db80dfda2d72b86e6870434772848f869072b10b9fc3b4fad84e4', 1, 3, 'authToken', '[]', 0, '2021-08-23 12:39:21', '2021-08-23 12:39:21', '2022-08-23 15:39:21'),
('10832eff687efb489934584a33677e33eace00894ef22e77874b4bba2bb4872a1a21aa93783b8416', 1, 3, 'authToken', '[]', 0, '2021-08-27 07:25:38', '2021-08-27 07:25:38', '2022-08-27 10:25:38'),
('3f7e3b526e3869a8e81d3b3ac68171e8fd6b6839e290ccc0caa387e2775eb05ff96689bedf8218a5', 1, 3, 'authToken', '[]', 0, '2021-08-23 13:31:44', '2021-08-23 13:31:44', '2022-08-23 16:31:44'),
('3f87f4dd11a61fdbba5229416e3ee5fa65e012aaf4ccda8b85d5ff669c81af314a6f75c42b964835', 1, 3, 'authToken', '[]', 0, '2021-08-25 19:09:38', '2021-08-25 19:09:38', '2022-08-25 22:09:38'),
('5789de2482298e9362147f49165ebaddf2f9f7a324a7a1b955f05ea1b6891e926c375d5f8131abb0', 1, 3, 'authToken', '[]', 0, '2021-08-23 13:17:45', '2021-08-23 13:17:45', '2022-08-23 16:17:45'),
('72dcc586567178a3f1471249f26ee31ab900196a1b9ef9b3d50bb4dc75c67a64a9b4bd3c8ce9b9b1', 1, 3, 'authToken', '[]', 0, '2021-08-24 07:32:02', '2021-08-24 07:32:02', '2022-08-24 10:32:02'),
('9f6fbf6ea9c837e62b4b92cfcf7d253889c2792c8d4bc64ef3b5147e6021814847b73de46877875e', 1, 3, 'authToken', '[]', 0, '2021-08-26 04:53:02', '2021-08-26 04:53:02', '2022-08-26 07:53:02'),
('ec3d9f52fcc54b7eff144ff19e51e56df6e7d1bb4b9e0c83f519e61021592cf2697dd897fce8f6f2', 1, 3, 'authToken', '[]', 0, '2021-08-26 12:33:39', '2021-08-26 12:33:39', '2022-08-26 15:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'jiwetvia Personal Access Client', 'u5bKku1J4i1kbLmTvEw8jkIhCuOBKxYbN1Pqyb2g', NULL, 'http://localhost', 1, 0, 0, '2021-08-16 10:56:32', '2021-08-16 10:56:32'),
(2, NULL, 'jiwetvia Password Grant Client', 'TmxF83fzX5AAv6bz19lqpvCvuMO4mchDIPTP3mmM', 'users', 'http://localhost', 0, 1, 0, '2021-08-16 10:56:35', '2021-08-16 10:56:35'),
(3, NULL, 'jiwetvia Personal Access Client', 'o7aYmM8aeSOvgqL0bIpJnqSPMMF0QmXJcZlYVuse', NULL, 'http://localhost', 1, 0, 0, '2021-08-23 12:37:18', '2021-08-23 12:37:18'),
(4, NULL, 'jiwetvia Password Grant Client', '9iB7EWIzmvPcTRq61LE0e0BzR6wwsgbnpBjxYOt1', 'users', 'http://localhost', 0, 1, 0, '2021-08-23 12:37:19', '2021-08-23 12:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-08-16 10:56:34', '2021-08-16 10:56:34'),
(2, 3, '2021-08-23 12:37:19', '2021-08-23 12:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `date` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `user_id`, `points`, `date`, `username`) VALUES
(11, 1, NULL, '2021-08-27', 'wahome mutahi'),
(12, 1, NULL, '2021-08-27', 'wahome mutahi'),
(13, 1, NULL, '2021-08-27', 'wahome mutahi'),
(14, 1, NULL, '2021-08-27', 'wahome mutahi'),
(15, 1, NULL, '2021-08-27', 'wahome mutahi'),
(16, 1, 1, '2021-08-27', 'wahome mutahi'),
(17, 1, 51, '2021-08-27', 'wahome mutahi'),
(18, 1, 5, '2021-08-27', 'wahome mutahi');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `post` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `post`) VALUES
(1, 'edfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjkn'),
(2, '<div style=\"text-align: center;\"><b>edfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjkwfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjknedfwefnjk</b>wfnwenfjknwjknfkjenjkfnjknsdjknfjkndsjkfnjkn</div>');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `mobile`) VALUES
(1, 'wahome mutahi', 'wahome@jiwe.io', '$2y$10$9prFzdQ0WH.PRQpPTpbzeujnDsrNYFLCcMgm.T0S9jiRNawpwosnK', '+254740161331');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mainhome`
--
ALTER TABLE `mainhome`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaderboard`
--
ALTER TABLE `leaderboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mainhome`
--
ALTER TABLE `mainhome`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
