-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 12, 2023 lúc 05:07 AM
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
(70, 13, 33, 82, '2023-06-12', '01:30:00', 46, '2023-06-12');

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
(1, 'Relaxxa', 'tải xuống.jpg', '0122313421', 'NewYork', '07:30:00', '20:00:00', 0, '', '', ''),
(2, 'Sunny Nail', 'images (1).jpg', '0213829333', 'Ninh Thuan province', '05:00:00', '22:00:00', 1, '', '', ''),
(3, 'Bing', 'images (4).jpg', '0213829333', '2 Võ Trường Toản, An Phú, Quận 2, Thành phố Hồ Chí Minh 70000, Việt Nam', '07:30:00', '22:00:00', 1, '', '', ''),
(7, 'ROYAL Beauty', 'images.jpg', '0213829333', '9912 VIRGINIA 194', '12:00:00', '23:30:00', 1, '', '', ''),
(11, 'Vymily Nail', 'images.jpg', '1231231234', '9912 VIRGINIA 194', '06:30:00', '22:30:00', 1, '12345', 'Monday', 'Friday'),
(13, 'Keri', 'z2998722377616_3d64290039d08938e9bd99ae8683cd53.jpg', '012344567', '231 3/2', '07:30:00', '22:00:00', 1, '', '', ''),
(14, 'T Nail and Spa', '35.jpg', '905-235-9008', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '10:00:00', '19:30:00', 1, '', 'Monday', 'Friday'),
(15, 'Top Nails and Spa', 'Top nails.jpg', '+1 916-936-4499', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '10:00:00', '19:00:00', 1, '', 'Monday', 'Friday');

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
(4, 'Manicure Service', 'gallery-4.jpg', '', 1),
(5, 'Cắt móng Keri', 'z2998722377616_3d64290039d08938e9bd99ae8683cd53.jpg', '', 1),
(8, 'Nails Care', '1.png', 'Nothing', 1),
(9, 'Manicure & Pedicure', '2.png', 'Nothing', 1),
(10, 'Wax Service', '3.jpg', 'Nothing', 1),
(11, 'Natural Dipping Powder', '4.jpg', 'Nothing', 1),
(12, 'Shellac Nails', '5.jpg', 'Nothing', 1),
(13, 'Kid Service (3-5 years)', '6.jpg', 'Nothing', 0),
(14, 'Kid Service (7-12 years)', '6.jpg', '', 1),
(15, 'Pedicure Service', '7.jpg', '', 1),
(16, 'Nail Enhancements', '8.jpg', '', 0),
(17, 'Permanent Makeup', '13.jpg', 'Nothing', 1),
(18, 'Eyelash Extension ', '14.jpg', 'Nothing', 0),
(19, 'Beauty and Healthy', '10.jpg', '', 0),
(20, 'Additional Services', '7.jpg', 'Nothing', 1),
(21, 'Childrens Service ', '15.jpg', 'Nothing', 1),
(22, 'Facial', '12.jpg', '', 0),
(23, 'Wax Service', '3.jpg', 'Nothing', 1);

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
(4, 'Cutting hair 2', 'images.jpg', 24, '01:00:00', 1, 3, 1),
(5, 'Mac Nail Spa', 'images (5).jpg', 22, '01:15:00', 1, 2, 1),
(6, 'Cutting hair', 'images (1).jpg', 0, '00:45:00', 2, 7, 1),
(7, 'Nail 2', 'tải xuống.jpg', 11, '00:45:00', 2, 7, 1),
(8, 'Cupping', 'images (4).jpg', 45, '01:30:00', 2, 7, 1),
(9, 'Make Hair', 'images (5).jpg', 13, '00:45:00', 1, 7, 1),
(10, 'Lotion', 'images.jpg', 22, '01:30:00', 2, 2, 1),
(11, 'Nail care', 'images (3).jpg', 12, '00:30:00', 4, 11, 1),
(12, 'Hair dying', 'tải xuống.jpg', 20, '01:00:00', 1, 11, 1),
(13, 'Cut the nail', 'images (6).jpg', 15, '00:30:00', 4, 3, 1),
(14, 'Hair extention', 'images (1).jpg', 30, '01:45:00', 2, 11, 1),
(15, 'Acrylic Full Set', '16.jpg', 45, '00:30:00', 8, 14, 1),
(16, 'Acrylic Refill', '8.jpg', 50, '01:00:00', 8, 14, 1),
(17, 'UV Gel Full Set', '10.jpg', 50, '00:30:00', 8, 14, 1),
(18, 'U.V Gel Refill', '17..jpg', 40, '01:15:00', 8, 14, 1),
(19, 'Solar Gel Full Set ', '16.jpg', 60, '00:15:00', 8, 14, 1),
(20, 'Solar Gel Refill', '18.jpg', 45, '01:45:00', 8, 14, 1),
(21, 'Pink & White Full', '1.png', 70, '00:30:00', 8, 14, 1),
(22, 'White & Pink Refill  ', '19.jpg', 60, '00:45:00', 8, 14, 1),
(23, 'Bio Gel Refill', '20.jpg', 60, '00:30:00', 8, 14, 1),
(24, 'Nails Take Off', '21.jpg', 15, '00:15:00', 8, 14, 1),
(25, 'Nails Repair', '11.jpg', 5, '00:15:00', 8, 14, 1),
(26, 'Manicure', '22.jpg', 20, '01:00:00', 9, 14, 1),
(27, 'Pedicure', '7.jpg', 30, '01:00:00', 9, 14, 1),
(28, 'Pedicure & Manicure', '22.jpg', 45, '02:00:00', 9, 14, 1),
(29, 'Hands Polish', '12.jpg', 10, '00:30:00', 9, 14, 1),
(30, 'Toes Polish', '44.jpg', 12, '00:30:00', 9, 14, 0),
(31, 'French Extra', '8.jpg', 5, '00:15:00', 9, 14, 1),
(32, 'Cut Down', '8.jpg', 10, '00:30:00', 9, 14, 0),
(33, 'Spa Manicure', '4.jpg', 40, '02:30:00', 9, 13, 1),
(34, 'Spa Pedicure', '45.jpg', 50, '03:45:00', 9, 14, 1),
(35, 'Spa Manicure and Spa Pedicure', '10.jpg', 85, '06:30:00', 9, 14, 0),
(36, 'Smoothing pedicure', '46.jpg', 35, '02:30:00', 15, 15, 1),
(37, 'Deluxe pedicure', '46.jpg', 45, '04:00:00', 15, 15, 1),
(38, 'Ultimare pedicure', 'Top nails.jpg', 55, '03:30:00', 15, 15, 0),
(39, 'Luxury pedicure', '46.jpg', 65, '04:30:00', 15, 15, 1),
(40, 'Signature Pedicure', '45.jpg', 70, '05:30:00', 15, 15, 0),
(41, 'Incredible benefit of jelly spa', '28.jpg', 80, '06:30:00', 15, 15, 1),
(42, 'Basic manicure', '11.jpg', 20, '02:30:00', 4, 15, 1),
(43, 'Signature manicure', '5.jpg', 35, '02:30:00', 4, 15, 1),
(44, 'Luxury manicure', 'Top nails.jpg', 45, '03:30:00', 4, 15, 1),
(45, 'Liquid Gel Full Set', '48.jpg', 55, '04:30:00', 16, 15, 1),
(46, 'Ombre Full Set', '16.jpg', 60, '05:30:00', 16, 15, 0),
(47, 'Gel Manicure', '4.jpg', 40, '03:15:00', 16, 15, 0),
(48, 'Full Set', '5.jpg', 50, '04:30:00', 16, 15, 1),
(49, 'Fill', '12.jpg', 40, '03:00:00', 16, 15, 0),
(50, 'Full Set Toe Nail', '5.jpg', 50, '04:30:00', 16, 15, 0),
(51, 'Dip Powder', '8.jpg', 45, '03:45:00', 16, 15, 1),
(52, 'Take Off Gel (With service)', '50.jpg', 5, '00:30:00', 16, 15, 1),
(53, 'Eyebriws Shading', '51.jpg', 450, '10:30:00', 17, 15, 1),
(54, 'Hair stroke', '13.jpg', 550, '11:00:00', 17, 15, 1),
(55, 'Lips color (Labios Color)', '8.jpg', 499, '11:30:00', 17, 15, 1),
(56, 'Eyeliners (Delineador De Ojos)', '13.jpg', 175, '01:15:00', 17, 15, 1),
(57, 'Top & Bottom', '3.jpg', 320, '02:30:00', 17, 15, 1),
(58, 'Individual Classic Set', '52.jpg', 110, '04:30:00', 18, 15, 0),
(59, 'Individual Classic Fill', '53.jpg', 70, '00:30:00', 22, 15, 1),
(60, 'Individual Hybrid Set', '51.jpg', 140, '01:45:00', 18, 15, 1),
(61, 'Individual Hybrid Fill', '52.jpg', 70, '01:30:00', 18, 15, 1),
(62, 'Individual Volume Dramatic Set', '51.jpg', 140, '00:45:00', 18, 15, 0),
(63, 'Individual Volume Dramatic Fill', '52.jpg', 70, '01:45:00', 18, 15, 0),
(64, 'Mega Volume Set', '53.jpg', 160, '01:15:00', 18, 15, 1),
(65, 'Mega Volume Fill', '52.jpg', 160, '00:45:00', 18, 15, 1),
(66, '3 Strands Full Set (No Refill)', '5.jpg', 50, '00:15:00', 18, 15, 1),
(67, 'Premium Eyelash Perm Lift', '53.jpg', 60, '00:45:00', 18, 15, 0),
(68, 'Premium Eyebrow Tint with Eyebrow Wax', '51.jpg', 60, '00:15:00', 18, 15, 1),
(69, 'Tint Eyebrows (Color En Cejas)', '54.jpg', 40, '00:15:00', 19, 15, 0),
(70, 'Eyebrows (Cejas)', '55.jpg', 13, '00:15:00', 19, 15, 1),
(71, 'Upper Lip (Labios)', '56.jpg', 7, '00:15:00', 19, 15, 0),
(72, 'Chin ', '55.jpg', 10, '00:15:00', 18, 15, 1),
(73, 'Eyebrows Tinting', '55.jpg', 15, '00:30:00', 23, 14, 1),
(74, 'Eyebrows ', '55.jpg', 10, '00:15:00', 23, 14, 1),
(75, 'test servive', '7.jpg', 50, '00:30:00', 19, 11, 1);

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
(19, 'Kathy', '58.jpg', '+1 916-936-4499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 15, 37, '2023-06-08'),
(20, 'Kathy', '58.jpg', '+1 916-936-4499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 15, '2023-06-08'),
(21, 'Kathy', '58.jpg', '+1 916-936-4499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-14', 'Female', 14, 16, '2023-06-08'),
(22, 'Kathy', '58.jpg', '+1 916-936-4499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 17, '2023-06-08'),
(24, 'Kathy', '58.jpg', '+1 916-936-4499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 18, '2023-06-08'),
(27, 'Kathy', '58.jpg', '+1 916-936-4499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 21, '2023-06-08'),
(28, 'Kathy', '58.jpg', '123456789+1 916-936-4499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 22, '2023-06-08'),
(29, 'Kathy', '58.jpg', '19169364499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 23, '2023-06-08'),
(30, 'Kathy', '58.jpg', '19169364499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 24, '2023-06-08'),
(31, 'Kathy', '58.jpg', '19169364499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 25, '2023-06-08'),
(32, 'Kathy', '58.jpg', '19169364499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 26, '2023-06-08'),
(33, 'Kathy', '58.jpg', '19169364499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 27, '2023-06-08'),
(34, 'Kathy', '58.jpg', '19169364499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 28, '2023-06-08'),
(35, 'Kathy', '58.jpg', '19169364499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 29, '2023-06-08'),
(36, 'Kim', 'nvien1.png', '+1 916-936-4499', 'kathy@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2001-07-22', 'Female', 14, 15, '2023-06-08'),
(37, 'Kim', 'nvien1.png', '+1 916-936-4499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1985-07-14', 'Female', 14, 16, '2023-06-08'),
(38, 'Kim', 'nvien1.png', '19169364499', 'kathy@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1985-10-14', 'Female', 14, 17, '2023-06-08'),
(39, 'Kim', 'nvien1.png', '19169364499', 'kathy@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '1985-07-14', 'Female', 14, 22, '2023-06-08'),
(40, 'Kim', 'nvien1.png', '19169364499', 'kim@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1985-07-14', 'Female', 14, 19, '2023-06-08'),
(41, 'Kim', 'nvien1.png', '19169364499', 'kim@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '1972-07-14', 'Male', 14, 18, '2023-06-08'),
(42, 'Kim', 'nvien1.png', '19169364499', 'kim@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 27, '2023-06-08'),
(43, 'Kim', 'nvien1.png', '19169364499', 'kim@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-14', 'Male', 14, 28, '2023-06-08'),
(44, 'Kim', 'nvien1.png', '19169364499', 'kim@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-14', 'Male', 14, 29, '2023-06-08'),
(46, 'Anna', '13.jpg', '19169364499', 'anna@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 15, '2023-06-08'),
(47, 'Anna', '13.jpg', '19169364499', 'anna@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-14', 'Male', 14, 16, '2023-06-08'),
(48, 'Anna', '13.jpg', '19169364499', 'anna@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-14', 'Female', 14, 17, '2023-06-08'),
(49, 'Anna', '13.jpg', '19169364499', 'anna@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-14', 'Male', 14, 18, '2023-06-08'),
(50, 'Anna', '13.jpg', '19169364499', 'anna@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Female', 14, 19, '2023-06-08'),
(51, 'Lily', '6.jpg', '19169364499', 'lily@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Male', 14, 15, '2023-06-08'),
(52, 'Lily', '6.jpg', '19169364499', 'lily@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Male', 14, 16, '2023-06-08'),
(53, 'Lily', '6.jpg', '19169364499', 'lily@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-26', 'Male', 14, 17, '2023-06-08'),
(54, 'Lily', '6.jpg', '19169364499', 'lily@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Male', 14, 18, '2023-06-08'),
(55, 'Lily', '6.jpg', '19169364499', 'lily@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '1972-07-22', 'Male', 14, 19, '2023-06-08'),
(56, 'Tiffany ', '58.jpg', '905-235-9008', 'tiffany@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '1985-07-14', 'Male', 15, 36, '2023-06-08'),
(57, 'Tiffany', '58.jpg', '9052359008', 'tiffany@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '1972-07-14', 'Male', 15, 37, '2023-06-08'),
(58, 'Tiffany', '58.jpg', '9052359008', 'tiffany@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '1985-07-14', 'Male', 15, 38, '2023-06-08'),
(59, 'Tiffany', '58.jpg', '9052359008', 'tiffany@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '1985-07-22', 'Male', 15, 39, '2023-06-08'),
(60, 'Tiffany', '58.jpg', '905-235-9008', 'tiffany@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '1985-07-22', 'Female', 15, 40, '2023-06-08'),
(61, 'Anh', 'nvien1.png', '9052359008', 'anh@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '2011-11-11', 'Male', 15, 36, '2023-06-08'),
(62, 'Anh', 'nvien1.png', '9052359008', 'anh@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2011-11-11', 'Male', 15, 37, '2023-06-08'),
(63, 'Anh', 'nvien1.png', '9052359008', 'anh@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2011-11-11', 'Male', 15, 38, '2023-06-08'),
(64, 'Anh', 'nvien1.png', '9052359008', 'anh@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2011-11-11', 'Male', 15, 39, '2023-06-08'),
(65, 'Anh', 'nvien1.png', '9052359008', 'anh@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2011-11-11', 'Male', 15, 40, '2023-06-08'),
(66, 'Anna', '13.jpg', '9052359008', 'anna@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2012-02-22', 'Female', 15, 36, '2023-06-08'),
(67, 'Anna', '13.jpg', '9052359008', 'anna@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2012-02-22', 'Male', 15, 37, '2023-06-08'),
(68, 'Anna', '13.jpg', '9052359008', 'anna@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2012-02-22', 'Male', 15, 38, '2023-06-08'),
(69, 'Anna', '13.jpg', '9052359008', 'anna@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2012-02-22', 'Male', 15, 39, '2023-06-08'),
(70, 'Anna', '13.jpg', '9052359008', 'anna@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2012-02-22', 'Male', 15, 40, '2023-06-08'),
(71, 'Bella', 'nvien2.jpg', '905-235-9008', 'bella@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2013-03-31', 'Male', 15, 36, '2023-06-08'),
(72, 'Bella', 'nvien2.jpg', '905-235-9008', 'bella@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2013-03-31', 'Male', 15, 37, '2023-06-08'),
(73, 'Bella', 'nvien2.jpg', '905-235-9008', 'bella@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2013-03-31', 'Male', 15, 38, '2023-06-08'),
(74, 'Bella', 'nvien2.jpg', '9052359008', 'bella@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2013-03-31', 'Male', 15, 39, '2023-06-08'),
(75, 'Bella', 'nvien2.jpg', '9052359008', 'bella@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '2013-03-31', 'Male', 15, 40, '2023-06-09'),
(76, 'Bella', 'nvien2.jpg', '9052359008', 'bella@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2013-03-31', 'Male', 15, 41, '2023-06-09'),
(77, 'Bella', 'nvien2.jpg', '9052359008', 'bella@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2013-03-31', 'Male', 15, 42, '2023-06-09'),
(78, 'Bella', 'nvien2.jpg', '9052359008', 'bella@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2013-03-13', 'Male', 15, 43, '2023-06-09'),
(79, 'Bella', 'nvien2.jpg', '9052359008', 'bella@gmail.com', '16655 Yonge St Unit 22, Newmarket, ON L3X 1V6, Canada', '2013-03-13', 'Male', 15, 45, '2023-06-09'),
(80, 'Bella', 'nvien2.jpg', '9052359008', 'bella@gmail.com', '13000 Folsom BLVD, Suite 1447 Folsom, CA 95630', '2013-03-31', 'Male', 11, 75, '2023-06-09'),
(82, 'Le LAM', 'bnb.png', '0359893447', 'levanlam3447@gmail.com', 'Ninh Thuan province', '2023-06-12', 'Male', 13, 33, '2023-06-12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `description` text NOT NULL,
  `ip_user` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `fullname`, `phone`, `email`, `description`, `ip_user`) VALUES
(2, 'test', '0123456789', 'admin@gmail.com', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam voluptatibus repellendus earum impedit nulla sequi quis blanditiis provident, a reprehenderit accusantium doloremque facilis sit quibusdam dolor incidunt, sed doloribus asperiores?', ''),
(3, 'New user ', '1234567890', 'admin@gmail.com', 'nulll', ''),
(4, 'Nguyen Van A', '123', 'Admin@gmail.com', 'đasad', ''),
(5, 'User 2', '1234567890', 'Admin@gmail.com', 'llore', ''),
(6, 'New Hero', '0123456789', 'hero0@gmail.com', '', ''),
(7, 'New test 3', '1234567890', 'admin@gmail.com', 'lorem', ''),
(8, 'test new option', '0359893447', 'levanlam3447@gmail.com', '', ''),
(9, 'Le LAM', '0359893447', 'levanlam3447@gmail.com', '', ''),
(10, 'Tesszny', '0123456789', 'admin@gmail.com', '', ''),
(11, 'Tesszny', '0123456789', 'admin@gmail.com', '', ''),
(12, 'asfsf', '01246436245', 'admin@gmail.com', '', ''),
(13, 'Admin', '051523532523', 'admin@gmail.com', '', ''),
(14, 'Le LAM', '035989344721', 'fasdasd@gmail.com', '', ''),
(15, 'tasssdf', '01234567892', 'admin1@gmail.com', '', ''),
(16, 'wrwerwe', '0142142144124', 'admin2@gmail.com', '', ''),
(17, 'tetet', '01234567892', 'admin@gmail.com', '', ''),
(18, 'sdfdsfs', '0398890625', 'voivoikeri@gmail.com', '', ''),
(19, 'Tetet', '01234567882', 'admin@gmail.com', '', ''),
(20, 'tetet', '0123456789', 'admin@gmail.com', '', ''),
(21, 'tetet', '0123456789', 'admin@gmail.com', '', ''),
(22, 'Nguyễn Ngọc Diệp', '0334906804', 'diepnguyen.220701@gmail.com', 'diep', ''),
(23, 'fghg@gmail.com', '09978657', '', '', ''),
(24, 'diep', '3493843', '', '', ''),
(25, 'lê quăng sú', '09284738757', '', '', ''),
(26, 'thfh', 'fdgfdg', '', '', ''),
(27, 'sông chi hô', '0334907805', '', '', ''),
(28, 'tetet', '0123456789', 'admin@gmail.com', '', ''),
(29, 'Tttb ', '0123456', '', '', ''),
(30, 'tetet', '0123456789', 'admin@gmail.com', '', ''),
(31, 'tetet', '0123456789', 'admin@gmail.com', '', ''),
(32, 'henry', '0999213213', '', '', ''),
(33, 'Nguyen Van B', '0123456', 'alicetruong1811@gmail.com', '', ''),
(34, 'test', '0931572491', '', '', ''),
(35, 'Hao pham', '0854320001', '', '', ''),
(36, 'Nguyen Diep', '0334906805', '', '', ''),
(37, 'Kitlin Vigo', '123-123-1234', '', '', ''),
(38, 'New User', '123-123-1234', '', '', ''),
(39, 'New User', '123-123-1234', '', '', ''),
(40, 'New User', '123-123-1234', '', '', ''),
(41, 'Nguyen Diep', '0258147369', '', '', ''),
(42, 'Hoang Phan', '0888800715', '123@fpt.com.vn', '123213213213', ''),
(43, 'Van Ty', '123-123-1234', '', '', '113.173.133.58'),
(46, 'Diep Ng', '123-456-7899', '', '', '113.173.133.58');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `nailtype`
--
ALTER TABLE `nailtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);

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
