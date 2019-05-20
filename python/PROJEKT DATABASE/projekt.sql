-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 20 Maj 2019, 14:46
-- Wersja serwera: 10.1.36-MariaDB
-- Wersja PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `projekt`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `IDusers` int(3) NOT NULL,
  `login` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(25) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `surname` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `city` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `pesel` varchar(11) COLLATE utf8_polish_ci NOT NULL,
  `post_code` varchar(306) COLLATE utf8_polish_ci NOT NULL,
  `street` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `house` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `image` text COLLATE utf8_polish_ci,
  `email` varchar(100) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`IDusers`, `login`, `password`, `name`, `surname`, `city`, `pesel`, `post_code`, `street`, `house`, `image`, `email`) VALUES
(1, 'Admin', 'admin', 'admin', 'admin', 'Poznań', '12345678900', '78-550', 'poznan', '11', 'C:/Users/Hp/Documents/GitHub/cdv/Programowanie strukturalne/PROJEKT DATABASE/img/admin.jpg', 'example@mydomain.pl'),
(2, 'User', 'user', 'Username', 'Usersurname', 'Usercity', '12345678900', '09-123', 'Akfj', 'a1', 'C:/Users/Hp/Desktop/Uczelnia/Programowanie strukturalne/GiT/Programowanie strukturalne/PROJEKT DATABASE/img/user.png', ''),
(4, 'adam', '12345678', 'asd', 'asdASDAS', 'ASdasdASD', '09876543211', '', 'ASdasd', '1A', '', ''),
(5, 'Adamek', '123456789', 'Asdasdasd', 'Asdasdasd', 'Asdasdasdasd', '12345678900', '', 'Adasdasd', '1A', '', '');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`IDusers`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `IDusers` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
