-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 09, 2023 lúc 03:21 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `booking_nail`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
(1, 'Admin', 'admin@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date_duration` date NOT NULL,
  `time_duration` time NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `booking`
--

INSERT INTO `booking` (`id`, `company_id`, `service_id`, `staff_id`, `date_duration`, `time_duration`, `user_id`, `create_at`) VALUES
(1, 1, 1, 1, '2023-05-20', '10:20:00', 2, '2023-05-25'),
(2, 3, 4, 4, '2023-05-28', '11:30:00', 2, '2023-05-26'),
(3, 2, 2, 0, '2023-05-31', '23:00:00', 3, '2023-05-26'),
(5, 3, 4, 7, '2023-05-30', '23:00:00', 3, '2023-05-26'),
(6, 1, 1, 3, '2023-05-20', '17:00:00', 2, '2023-05-26'),
(7, 2, 5, 0, '2023-05-28', '08:45:00', 4, '2023-05-26'),
(8, 2, 2, 7, '2023-05-30', '01:30:00', 5, '2023-05-26'),
(9, 3, 4, 4, '2023-05-26', '00:45:00', 5, '2023-05-26'),
(10, 2, 5, 0, '2023-05-28', '00:15:00', 5, '2023-05-26'),
(11, 7, 6, 1, '2023-05-29', '11:45:00', 4, '2023-05-26'),
(12, 7, 6, 1, '0000-00-00', '21:00:00', 7, '2023-05-29'),
(13, 7, 6, 6, '0000-00-00', '21:00:00', 7, '2023-05-29'),
(14, 7, 6, 6, '0000-00-00', '21:00:00', 7, '2023-05-29'),
(15, 7, 6, 1, '0000-00-00', '21:00:00', 7, '2023-05-29'),
(16, 7, 6, 6, '0000-00-00', '21:00:00', 7, '2023-05-29'),
(17, 3, 4, 4, '0000-00-00', '10:30:00', 8, '2023-05-29'),
(18, 7, 6, 6, '2023-05-31', '16:30:00', 9, '2023-05-29'),
(19, 1, 1, 3, '2023-05-29', '14:30:00', 10, '2023-05-29'),
(20, 11, 12, 11, '2023-05-29', '14:30:00', 10, '2023-05-29'),
(21, 1, 1, 3, '2023-05-29', '14:30:00', 11, '2023-05-29'),
(22, 11, 12, 11, '2023-05-29', '14:30:00', 11, '2023-05-29'),
(23, 11, 12, 11, '0000-00-00', '00:00:00', 12, '2023-05-29'),
(24, 11, 12, 10, '0000-00-00', '00:00:00', 12, '2023-05-29'),
(25, 11, 11, 8, '2023-06-01', '13:00:00', 13, '2023-05-29'),
(26, 11, 12, 10, '2023-06-01', '13:00:00', 13, '2023-05-29'),
(27, 2, 5, 5, '0000-00-00', '00:00:00', 14, '2023-05-29'),
(28, 7, 6, 1, '0000-00-00', '00:00:00', 14, '2023-05-29'),
(29, 11, 12, 9, '2023-05-30', '13:30:00', 15, '2023-05-30'),
(30, 11, 12, 9, '0000-00-00', '00:00:00', 16, '2023-05-30'),
(31, 11, 12, 9, '2023-05-30', '13:30:00', 17, '2023-05-30'),
(32, 11, 12, 9, '2023-05-30', '11:30:00', 18, '2023-05-30'),
(33, 11, 12, 9, '2023-05-30', '11:30:00', 19, '2023-05-30'),
(34, 11, 12, 9, '2023-05-30', '11:30:00', 21, '2023-05-30'),
(35, 11, 12, 9, '0000-00-00', '00:00:00', 22, '2023-05-30'),
(36, 11, 12, 10, '2023-06-01', '13:00:00', 13, '2023-05-30'),
(37, 11, 12, 9, '0000-00-00', '11:30:00', 23, '2023-05-30'),
(38, 11, 12, 9, '2023-05-30', '14:30:00', 24, '2023-05-30'),
(39, 11, 12, 9, '2023-05-31', '06:30:00', 25, '2023-05-31'),
(40, 11, 12, 9, '2023-05-31', '00:00:00', 26, '2023-05-31'),
(41, 11, 12, 9, '2023-05-31', '07:30:00', 27, '2023-05-31'),
(42, 11, 12, 9, '2023-05-31', '07:30:00', 30, '2023-05-31'),
(43, 11, 12, 9, '2023-06-01', '07:30:00', 31, '2023-05-31'),
(44, 11, 11, 12, '2023-06-01', '07:30:00', 31, '2023-05-31'),
(45, 11, 11, 8, '2023-06-01', '07:30:00', 31, '2023-05-31'),
(46, 11, 12, 9, '2023-06-01', '07:30:00', 32, '2023-05-31'),
(47, 11, 11, 12, '2023-06-01', '07:30:00', 32, '2023-05-31'),
(48, 11, 11, 8, '2023-06-01', '07:30:00', 32, '2023-05-31'),
(49, 11, 12, 9, '2023-06-01', '07:30:00', 33, '2023-05-31'),
(50, 11, 11, 12, '2023-06-01', '07:30:00', 33, '2023-05-31'),
(51, 11, 11, 8, '2023-06-01', '07:30:00', 33, '2023-05-31'),
(52, 11, 12, 9, '2023-05-31', '00:00:00', 34, '2023-05-31'),
(53, 7, 6, 6, '2023-05-31', '13:30:00', 35, '2023-05-31'),
(54, 11, 12, 10, '2023-06-01', '14:30:00', 36, '2023-06-01'),
(55, 7, 9, 13, '2023-06-02', '13:30:00', 37, '2023-06-02'),
(56, 7, 9, 14, '2023-06-03', '14:15:00', 38, '2023-06-02'),
(57, 7, 9, 14, '2023-06-02', '15:00:00', 39, '2023-06-02'),
(58, 11, 12, 9, '0000-00-00', '00:00:00', 40, '2023-06-05'),
(59, 11, 12, 9, '2023-06-05', '07:30:00', 41, '2023-06-05'),
(60, 11, 12, 9, '2023-06-05', '19:30:00', 42, '2023-06-05'),
(61, 11, 12, 10, '2023-06-06', '07:30:00', 42, '2023-06-05'),
(62, 11, 11, 8, '2023-06-05', '14:00:00', 43, '2023-06-05'),
(63, 11, 12, 9, '2023-06-08', '14:30:00', 44, '2023-06-07'),
(64, 11, 12, 9, '2023-06-12', '11:30:00', 54, '2023-06-07'),
(65, 11, 12, 9, '2023-06-12', '11:30:00', 55, '2023-06-07'),
(66, 11, 12, 9, '2023-06-07', '14:30:00', 57, '2023-06-07'),
(67, 11, 12, 9, '2023-06-07', '14:30:00', 58, '2023-06-07'),
(68, 11, 11, 12, '2023-06-09', '15:30:00', 59, '2023-06-07'),
(69, 11, 12, 9, '2023-06-08', '06:30:00', 60, '2023-06-07'),
(70, 11, 11, 8, '2023-06-07', '15:00:00', 60, '2023-06-07'),
(71, 11, 11, 8, '2023-06-07', '18:30:00', 64, '2023-06-07'),
(72, 11, 11, 12, '2023-06-12', '11:00:00', 65, '2023-06-07'),
(73, 11, 11, 8, '2023-06-07', '16:00:00', 65, '2023-06-07'),
(75, 11, 12, 9, '2023-06-09', '13:30:00', 67, '2023-06-08'),
(76, 11, 12, 9, '2023-06-09', '14:30:00', 68, '2023-06-08'),
(77, 11, 12, 9, '2023-06-09', '19:30:00', 68, '2023-06-08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `company_name` text NOT NULL,
  `img_company` text NOT NULL,
  `hotline` text NOT NULL,
  `address` text NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `password` text NOT NULL,
  `day_start` text NOT NULL,
  `day_end` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `company`
--

INSERT INTO `company` (`id`, `company_name`, `img_company`, `hotline`, `address`, `time_start`, `time_end`, `status`, `password`, `day_start`, `day_end`) VALUES
(1, 'Relaxxa 3', 'tải xuống.jpg', '0122313421', 'NewYork', '07:30:00', '20:00:00', 0, '', '', ''),
(2, 'Sunny Nail', 'images (3).jpg', '0213829333', 'Ninh Thuan province', '05:00:00', '22:00:00', 1, '', '', ''),
(3, 'Bing', 'images.jpg', '0213829333', ' 9912 VIRGINIA 194', '07:30:00', '22:00:00', 1, '', '', ''),
(7, 'ROYAL Beauty', 'images (6).jpg', '0213829333', ' 9912 VIRGINIA 194', '12:00:00', '23:30:00', 1, '', '', ''),
(11, 'Vymily Nail', 'gallery-1.jpg', '021382999', ' 9912 VIRGINIA 194', '06:30:00', '22:30:00', 1, '123445', '', ''),
(12, 'new', 'images.jpg', '0213829333', ' 9912 VIRGINIA 194', '00:00:00', '01:00:00', 1, '', '', ''),
(15, 'Black Goku', 'images.jpg', '0213829333', ' 9912 VIRGINIA 194', '05:00:00', '22:30:00', 1, '', '', ''),
(16, 'Company 2', 'images (4).jpg', '0213829333', ' 9912 VIRGINIA 194', '00:00:00', '23:30:00', 1, '123456', '', ''),
(19, 'New com 2', 'images (5).jpg', '0213829334', ' 9912 VIRGINIA 194', '06:30:00', '16:00:00', 1, '12345', 'Friday', 'Saturday');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `header`
--

CREATE TABLE `header` (
  `id` int(11) NOT NULL,
  `company_name` text NOT NULL,
  `logo_company` text NOT NULL,
  `phone` text NOT NULL,
  `address` text NOT NULL,
  `time_start` text NOT NULL,
  `time_end` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `header`
--

INSERT INTO `header` (`id`, `company_name`, `logo_company`, `phone`, `address`, `time_start`, `time_end`) VALUES
(1, 'Nails By The Falls', 'images (3).jpg', '(703) 438-3901', '9912 Virginia 194', '08:00', '22:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nailtype`
--

CREATE TABLE `nailtype` (
  `id` int(11) NOT NULL,
  `type_name` text NOT NULL,
  `img_type` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nailtype`
--

INSERT INTO `nailtype` (`id`, `type_name`, `img_type`, `description`, `status`) VALUES
(1, 'Make hair', 'gallery-2.jpg', 'lorem sdssd', 0),
(2, 'Nail', 'gallery-3.jpg', 'null', 0),
(4, 'Manicure', 'gallery-4.jpg', '', 1),
(5, 'Hair Extension 2', 'images.jpg', '', 1),
(6, 'Hair Extension 2', 'images (4).jpg', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name_service` text NOT NULL,
  `img_service` text NOT NULL,
  `price` int(11) NOT NULL,
  `time_completion` time NOT NULL,
  `type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `services`
--

INSERT INTO `services` (`id`, `name_service`, `img_service`, `price`, `time_completion`, `type_id`, `company_id`, `status`) VALUES
(1, 'Hair extention', 'images (4).jpg', 20, '03:30:00', 1, 1, 1),
(2, 'Cutting hair', 'thumbnail-removebg-preview.png', 20, '01:00:00', 1, 2, 1),
(4, 'Cutting hair 2', 'images.jpg', 24, '01:00:00', 1, 3, 1),
(5, 'Mac Nail Spa', 'images (2).jpg', 22, '01:15:00', 1, 2, 1),
(6, 'Cutting hair', 'images (1).jpg', 0, '00:45:00', 2, 7, 1),
(7, 'Nail 2', 'tải xuống.jpg', 11, '00:45:00', 2, 7, 1),
(8, 'Cupping', 'images (4).jpg', 45, '01:30:00', 2, 7, 1),
(9, 'Make Hair', 'images (5).jpg', 13, '00:45:00', 1, 7, 1),
(10, 'Lotion', 'images.jpg', 22, '01:30:00', 2, 2, 1),
(11, 'Nail care', 'images (3).jpg', 12, '00:30:00', 4, 11, 0),
(12, 'Hair dying', 'tải xuống.jpg', 20, '01:00:00', 1, 11, 1),
(13, 'Cut the nail', 'images (6).jpg', 15, '00:30:00', 4, 3, 1),
(14, 'Hair extention', 'images (1).jpg', 30, '01:45:00', 2, 11, 1),
(15, 'Cutting hair 2', 'tải xuống.jpg', 20, '01:00:00', 1, 2, 1),
(16, 'Cutting hair', 'images.jpg', 23, '00:30:00', 1, 3, 1),
(17, 'Cutting hair', 'images (4).jpg', 55, '00:30:00', 4, 7, 1),
(18, 'Cutting hair', 'images (3).jpg', 11, '00:45:00', 6, 12, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `user_name` text NOT NULL,
  `avatar` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `birth` date NOT NULL,
  `gender` text NOT NULL,
  `company_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `create_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`id`, `user_name`, `avatar`, `phone`, `email`, `address`, `birth`, `gender`, `company_id`, `service_id`, `create_at`) VALUES
(1, 'Jimin', 'person_3.jpg', '0359893447', 'levanlam3447@gmail.com', '2 Võ Trường Toản, An Phú, Quận 2, Thành phố Hồ Chí Minh 70000, Việt Nam', '1991-10-08', 'Male', 7, 6, '2023-05-25'),
(3, 'RM', 'person_2.jpg', '0359893447', 'levanlam3447@gmail.com', '2 Võ Trường Toản, An Phú, Quận 2, Thành phố Hồ Chí Minh 70000, Việt Nam', '2023-05-25', 'Male', 1, 1, '2023-05-25'),
(4, 'Alesander', 'person_4.jpg', '0359893447', 'levanlam3447@gmail.com', '2 Võ Trường Toản, An Phú, Quận 2, Thành phố Hồ Chí Minh 70000, Việt Nam', '1984-04-04', 'Male', 3, 4, '2023-05-25'),
(5, 'Suga', 'person_3.jpg', '0359893447', 'levanlam3447@gmail.com', '2 Võ Trường Toản, An Phú, Quận 2, Thành phố Hồ Chí Minh 70000, Việt Nam', '1991-10-08', 'Male', 2, 5, '2023-05-25'),
(6, 'Jin', 'person_2.jpg', '0359893447', 'levanlam3447@gmail.com', '2 Võ Trường Toản, An Phú, Quận 2, Thành phố Hồ Chí Minh 70000, Việt Nam', '2023-05-25', 'Male', 7, 6, '2023-05-25'),
(7, 'Thomas', 'person_4.jpg', '0359893447', 'levanlam3447@gmail.com', 'Ninh Thuan province', '1984-04-04', 'Male', 3, 2, '2023-05-25'),
(8, 'V', 'person_4.jpg', '1234567890', 'admin@gmail.com', 'NewYork', '2000-02-29', 'Female', 11, 11, '2023-05-29'),
(9, 'ForLove', 'person_3.jpg', '1234567890', 'Admin@gmail.com', 'NewYork', '2023-05-09', 'Male', 11, 12, '2023-05-29'),
(10, 'Staff2', 'person_2.jpg', '1234567890', 'Admin@gmail.com', 'NewYork', '2023-05-09', 'Male', 11, 12, '2023-05-29'),
(11, 'Staff 3', 'person_1.jpg', '1234567890', 'Admin@gmail.com', 'NewYork', '2023-05-09', 'Male', 11, 12, '2023-05-29'),
(12, 'Staff 2', 'person_3.jpg', '1234567890', 'admin@gmail.com', 'NewYork', '2000-02-29', 'Female', 11, 11, '2023-05-29'),
(13, 'Staff 1', 'person_1.jpg', '1234567890', 'Admin@gmail.com', 'NewYork', '2023-05-29', 'Female', 7, 9, '2023-05-29'),
(14, 'Staff 2', 'person_2.jpg', '1234567890', 'Admin@gmail.com', 'NewYork', '2023-05-29', 'Female', 7, 9, '2023-05-29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `fullname`, `phone`, `email`, `description`) VALUES
(2, 'test', '0123456789', 'admin@gmail.com', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam voluptatibus repellendus earum impedit nulla sequi quis blanditiis provident, a reprehenderit accusantium doloremque facilis sit quibusdam dolor incidunt, sed doloribus asperiores?'),
(3, 'New user ', '1234567890', 'admin@gmail.com', 'nulll'),
(4, 'Nguyen Van A', '123', 'Admin@gmail.com', 'đasad'),
(5, 'User 2', '1234567890', 'Admin@gmail.com', 'llore'),
(6, 'New Hero', '0123456789', 'hero0@gmail.com', ''),
(7, 'New test 3', '1234567890', 'admin@gmail.com', 'lorem'),
(8, 'test new option', '0359893447', 'levanlam3447@gmail.com', ''),
(9, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(10, 'Tesszny', '0123456789', 'admin@gmail.com', ''),
(11, 'Tesszny', '0123456789', 'admin@gmail.com', ''),
(12, 'asfsf', '01246436245', 'admin@gmail.com', ''),
(13, 'Admin', '051523532523', 'admin@gmail.com', ''),
(14, 'Le LAM', '035989344721', 'fasdasd@gmail.com', ''),
(15, 'dsadsad', '0412421424', 'admin@gmail.com', ''),
(16, '323213', '0623535235', 'admin@gmail.com', ''),
(17, 'testset', '0854734672', 'admin@gmail.com', ''),
(18, 'teste', '021215215215', 'admin@gmail.com', ''),
(19, '32132', '06236235623', 'levanlam3447@gmail.com', ''),
(20, 'Tesszny', '05125215215', 'admin@gmail.com', ''),
(21, 'Tesszny', '051252152152', 'admin@gmail.com', ''),
(22, 'Tesszny', '051252152153', 'admin@gmail.com', ''),
(23, 'new', '0535745547325', 'admin@gmail.com', ''),
(24, 'new', '0854734624', 'admin@gmail.com', ''),
(25, 'tetest', '061543243', 'admin@gmail.com', ''),
(26, 'testtet', '0834523235', 'admin@gmail.com', ''),
(27, 'Me 2', '01213445783', 'admin@gmail.com', ''),
(28, 'Tesszny', '067346236', 'admin@gmail.com', ''),
(29, 'Tesszny', '0123456789', 'admin@gmail.com', ''),
(30, 'tetet', '0359893447', 'levanlam3447@gmail.com', ''),
(31, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(32, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(33, 'My name', '0359893447', 'levanlam3447@gmail.com', ''),
(34, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(35, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(36, 'tetet', '0123456789', 'admin@gmail.com', ''),
(37, 'tetet', '0123456789', 'admin@gmail.com', ''),
(38, 'tetet', '0123456789', 'admin@gmail.com', ''),
(39, 'tetet', '021215215215', 'admin@gmail.com', ''),
(40, 'tetet', '0123456789', 'admin@gmail.com', ''),
(41, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(42, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(43, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(44, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(45, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(46, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(47, 'Le LAM', '222222222', 'levanlam3447@gmail.com', ''),
(48, 'Le LAM', '222-222-2222', 'levanlam3447@gmail.com', ''),
(49, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(50, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(51, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(52, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(53, 'Le LAM', '123-223-6789', 'levanlam3447@gmail.com', ''),
(54, 'Le LAM', '123-223-6789', 'levanlam3447@gmail.com', ''),
(55, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(56, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(57, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(58, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(59, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', ''),
(60, 'Le LAM', '0123456789', 'levanlam3447@gmail.com', ''),
(61, 'Le LAM', '0123456347', 'levanlam3447@gmail.com', ''),
(62, 'Le LAM', '0123456347', 'levanlam3447@gmail.com', ''),
(63, 'Le LAM', '0123456347', 'levanlam3447@gmail.com', ''),
(64, 'Le LAM', '0123456337', 'levanlam3447@gmail.com', ''),
(65, 'new bi', '03598934472', 'admin@gmail.com', ''),
(66, 'Le LAM', '0123456555', 'levanlam3447@gmail.com', ''),
(67, 'Le LAM', '0123456555', 'levanlam3447@gmail.com', ''),
(68, 'fasfa fsafasf', '0123456555', 'levanlam3447@gmail.com', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nailtype`
--
ALTER TABLE `nailtype`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `nailtype`
--
ALTER TABLE `nailtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `nailtype` (`id`),
  ADD CONSTRAINT `services_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
