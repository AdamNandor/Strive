-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Nov 01. 18:02
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `strive_database`
--
CREATE DATABASE IF NOT EXISTS `strive_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `strive_database`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `measurements_calculations`
--

CREATE TABLE `measurements_calculations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `height` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `bmi_value` decimal(4,2) NOT NULL,
  `basal_metabolic_rate` int(11) NOT NULL,
  `daily_calories` int(11) NOT NULL,
  `calorie_type` enum('maintenance','deficit','surplus') NOT NULL,
  `measurement_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `measurements_calculations`
--

INSERT INTO `measurements_calculations` (`id`, `user_id`, `weight`, `height`, `age`, `gender`, `bmi_value`, `basal_metabolic_rate`, `daily_calories`, `calorie_type`, `measurement_date`) VALUES
(1, 3, 85.50, 180, 28, 'male', 26.39, 1850, 2400, 'maintenance', '2026-02-01 09:00:00'),
(2, 3, 83.20, 180, 28, 'male', 25.68, 1820, 2100, 'deficit', '2026-02-15 09:00:00'),
(3, 4, 62.00, 165, 24, 'female', 22.77, 1420, 1900, 'surplus', '2026-02-02 10:00:00'),
(4, 6, 92.00, 175, 30, 'male', 30.04, 1950, 2200, 'deficit', '2026-02-03 11:00:00'),
(5, 7, 58.50, 170, 26, 'female', 20.24, 1380, 1800, 'maintenance', '2026-02-04 12:00:00'),
(6, 9, 70.00, 168, 29, 'female', 24.80, 1490, 1700, 'deficit', '2026-02-05 13:00:00'),
(7, 10, 78.00, 182, 35, 'male', 23.55, 1780, 2300, 'maintenance', '2026-02-06 14:00:00'),
(8, 11, 55.00, 160, 22, 'female', 21.48, 1350, 1600, 'deficit', '2026-02-07 08:00:00'),
(9, 12, 88.00, 185, 27, 'male', 25.71, 1900, 2500, 'surplus', '2026-02-08 09:00:00'),
(10, 13, 105.00, 190, 32, 'male', 29.09, 2100, 2400, 'deficit', '2026-02-09 10:00:00'),
(11, 14, 64.00, 172, 25, 'female', 21.62, 1440, 1900, 'surplus', '2026-02-10 11:00:00'),
(12, 15, 95.00, 178, 31, 'male', 29.98, 1980, 2300, 'deficit', '2026-02-11 12:00:00'),
(13, 17, 76.00, 180, 29, 'male', 23.46, 1750, 2200, 'maintenance', '2026-02-12 13:00:00'),
(14, 18, 59.00, 165, 23, 'female', 21.67, 1400, 1750, 'maintenance', '2026-02-13 14:00:00'),
(15, 19, 82.00, 177, 26, 'male', 26.18, 1840, 2100, 'deficit', '2026-02-14 15:00:00'),
(16, 20, 67.00, 171, 28, 'female', 22.91, 1460, 1900, 'surplus', '2026-02-15 08:30:00'),
(17, 3, 81.50, 180, 28, 'male', 25.15, 1800, 2100, 'deficit', '2026-03-01 09:00:00'),
(18, 4, 61.00, 165, 24, 'female', 22.40, 1410, 1850, 'maintenance', '2026-03-02 10:00:00'),
(19, 6, 89.50, 175, 30, 'male', 29.23, 1920, 2150, 'deficit', '2026-03-03 11:00:00'),
(20, 7, 57.50, 170, 26, 'female', 19.90, 1370, 1750, 'maintenance', '2026-03-04 12:00:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `trainers`
--

CREATE TABLE `trainers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `trainers`
--

INSERT INTO `trainers` (`id`, `user_id`, `specialization`, `bio`) VALUES
(1, 1, 'Erőemelés és Testépítés', 'Több mint 8 év tapasztalat a személyi edzésben.'),
(2, 2, 'Funkcionális edzés és Fogyás', 'A hatékony zsírégetésre és helyes mozgásra szakosodva.'),
(3, 8, 'CrossFit & Alakformálás', 'Segítek elérni a legmagasabb fizikai formádat biztonságosan.'),
(4, 16, 'Jóga & Rehabilitáció', 'Sérülések utáni felépülés és core-izomzat fejlesztése.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('member','trainer','admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `role`, `created_at`) VALUES
(1, 'Kovács Péter', 'peter.trainer@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'trainer', '2026-01-10 07:00:00'),
(2, 'Nagy Anna', 'anna.trainer@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'trainer', '2026-01-11 08:15:00'),
(3, 'Tóth Gábor', 'gabor.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-12 09:20:00'),
(4, 'Szabó Éva', 'eva.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-13 10:00:00'),
(5, 'Admin Felhasználó', 'admin@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'admin', '2025-12-31 23:00:00'),
(6, 'Horváth Bence', 'bence.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-14 11:00:00'),
(7, 'Varga Dóra', 'dora.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-15 12:30:00'),
(8, 'Molnár Tamás', 'tamas.trainer@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'trainer', '2026-01-16 13:00:00'),
(9, 'Németh Kinga', 'kinga.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-17 14:10:00'),
(10, 'Farkas Zoltán', 'zoltan.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-18 15:20:00'),
(11, 'Kiss Lili', 'lili.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-19 08:00:00'),
(12, 'Takács Milán', 'milan.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-20 09:00:00'),
(13, 'Puskás Ferenc', 'ferenc.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-21 10:11:00'),
(14, 'Juhász Eszter', 'eszter.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-22 11:22:00'),
(15, 'Lakatos Dominik', 'dominik.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-23 13:00:00'),
(16, 'Oláh Fruzsina', 'fruzsina.trainer@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'trainer', '2026-01-24 14:00:00'),
(17, 'Simon Balázs', 'balazs.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-25 08:30:00'),
(18, 'Rácz Vivien', 'vivien.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-26 09:30:00'),
(19, 'Kerekes Márk', 'mark.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-27 10:30:00'),
(20, 'Antal Boglárka', 'boglarka.member@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFXxY8.pYhZ8q9gJ8nK6/Y0e3YwJ.G1W', 'member', '2026-01-28 11:30:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `workout_plans`
--

CREATE TABLE `workout_plans` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `trainer_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `workout_plans`
--

INSERT INTO `workout_plans` (`id`, `title`, `description`, `trainer_id`, `member_id`, `creation_date`) VALUES
(1, 'Kezdő Teljes Test Edzés', 'Heti 3 napos A/B bontású alapgyakorlatos edzésterv.', 1, 3, '2026-02-01 09:00:00'),
(2, 'Zsírégető HIIT Kör', 'Intenzív köredzés 45 másodperces blokkokkal.', 2, 4, '2026-02-02 10:00:00'),
(3, 'Tömegnövelő Felsőtest', 'Mell, váll, tricepsz fókuszú intenzív program.', 1, 6, '2026-02-03 11:00:00'),
(4, 'Alakformáló Altest', 'Fenék és comb fókuszú gyakorlatok sorozata.', 8, 7, '2026-02-04 12:00:00'),
(5, 'Kihívás: 30 napos hasizom', 'Napi szintű core erősítő rutin.', 2, 9, '2026-02-05 13:00:00'),
(6, 'Funkcionális Erőfejlesztés', 'Saját testsúlyos és eszközös kombinált edzés.', 8, 10, '2026-02-06 14:00:00'),
(7, 'Kezdő Alváz & Felsőtest', 'Kíméletes indítás újrakezdőknek.', 16, 11, '2026-02-07 08:00:00'),
(8, 'Haladó Powerlifting', 'Nagy súlyos, alacsony ismétlésszámú program.', 1, 12, '2026-02-08 09:00:00'),
(9, 'Kardió & Állóképesség', 'Hosszútávú zsírégető pulzuszónás edzés.', 2, 13, '2026-02-09 10:00:00'),
(10, 'Reggeli Átmozgató Jóga', 'Nyújtás és hajlékonyságfejlesztés.', 16, 14, '2026-02-10 11:00:00'),
(11, 'Hát és Bicepsz Specializáció', 'Szélesebb hátizmok kialakítására.', 1, 15, '2026-02-11 12:00:00'),
(12, 'CrossFit Alapok', 'Dinamikus, összetett gyakorlatok.', 8, 17, '2026-02-12 13:00:00'),
(13, 'Scull & Core Stabilitás', 'Hátfájás elleni és tartásjavító program.', 16, 18, '2026-02-13 14:00:00'),
(14, 'Hipertrófia Alapozó', 'Izomnövelő osztott edzésterv.', 1, 19, '2026-02-14 15:00:00'),
(15, 'Formába Hozó Program', 'Vegyes kardió és erősítő napok.', 2, 20, '2026-02-15 08:30:00'),
(16, 'Kondi Fenntartó', 'Heti 2 alkalmas gyors teljes test edzés.', 8, 3, '2026-02-16 09:00:00'),
(17, 'Nyári Beach Body', 'Látványos formába hozó program.', 1, 4, '2026-02-17 10:00:00'),
(18, 'Mobilitás és Nyújtás', 'Pihenőnapos regeneráló rutin.', 16, 6, '2026-02-18 11:00:00'),
(19, 'Intenzív Zsírégetés 2.0', 'Haladó HIIT program.', 2, 7, '2026-02-19 12:00:00'),
(20, 'Erőnléti Alapozó', 'Sportolók kiegészítő edzésterve.', 8, 10, '2026-02-20 13:00:00');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `measurements_calculations`
--
ALTER TABLE `measurements_calculations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trainer_id` (`trainer_id`),
  ADD KEY `member_id` (`member_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `measurements_calculations`
--
ALTER TABLE `measurements_calculations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `workout_plans`
--
ALTER TABLE `workout_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `measurements_calculations`
--
ALTER TABLE `measurements_calculations`
  ADD CONSTRAINT `fk_measurements_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `trainers`
--
ALTER TABLE `trainers`
  ADD CONSTRAINT `fk_trainers_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD CONSTRAINT `fk_workouts_member` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_workouts_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
