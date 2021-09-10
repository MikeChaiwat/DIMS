-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2021 at 10:26 AM
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
-- Database: `wallock32_dims`
--

-- --------------------------------------------------------

--
-- Table structure for table `boxes`
--

CREATE TABLE `boxes` (
  `box_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `box_detail` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `b_status_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `boxes`
--

INSERT INTO `boxes` (`box_id`, `box_detail`, `b_status_id`) VALUES
('0001-0001-01-01', 'กล่องหมายเลข 1', 's_b_0000'),
('0002-0002-02-02', 'กล่องหมายเลข 2', 's_b_0000'),
('0003-0003-03-03', 'กล่องหมายเลข 3', 's_b_0000');

-- --------------------------------------------------------

--
-- Table structure for table `box_status`
--

CREATE TABLE `box_status` (
  `b_status_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `b_status_detail` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `box_status`
--

INSERT INTO `box_status` (`b_status_id`, `b_status_detail`) VALUES
('s_b_0000', 'ปกติ'),
('s_b_1111', 'ถูกยืม');

-- --------------------------------------------------------

--
-- Table structure for table `build_room`
--

CREATE TABLE `build_room` (
  `room_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `loc_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `room_detail` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `build_room`
--

INSERT INTO `build_room` (`room_id`, `loc_id`, `room_detail`) VALUES
('R0001', 'L0001', 'A1-32'),
('R0002', 'L0001', 'A1-31'),
('R0003', 'L0001', 'A1-34'),
('R0004', 'L0001', 'B3-21'),
('R0005', 'L0001', 'B4-01'),
('R0006', 'L0001', 'B4-01 (e-learning)'),
('R0007', 'L0001', 'B4-01 (RACK2 SERVER)'),
('R0008', 'L0001', 'B4-01 (RACK3 SERVER)'),
('R0009', 'L0001', 'B4-01 (RACK4 SERVER)'),
('R0010', 'L0001', 'B4-01 (Server Oracle)'),
('R0011', 'L0001', 'B4-01 (เครื่อง Server ภาค)'),
('R0012', 'L0001', 'B4-01B'),
('R0013', 'L0001', 'B4-01B (โต๊ะหน้าห้อง)'),
('R0014', 'L0001', 'B4-02'),
('R0015', 'L0001', 'B4-04'),
('R0016', 'L0001', 'B4-08'),
('R0017', 'L0001', 'B4-09'),
('R0018', 'L0001', 'B4-12'),
('R0019', 'L0001', 'B4-15'),
('R0020', 'L0001', 'B4-16 (โต๊ะหน้าห้อง)'),
('R0021', 'L0001', 'B4-16L'),
('R0022', 'L0001', 'B4-16M'),
('R0023', 'L0001', 'B4-17'),
('R0024', 'L0001', 'B4-18'),
('R0025', 'L0001', 'B4-22'),
('R0026', 'L0003', 'Shop A1-31'),
('R0027', 'L0003', 'Shop A1-34'),
('R0028', 'L0003', 'Shop ปฏิบัติการไฟฟ้า'),
('R0029', 'L0001', 'อ.จักรพันธ์'),
('R0030', 'L0001', 'อ.สมชัย');

-- --------------------------------------------------------

--
-- Table structure for table `checkstatus`
--

CREATE TABLE `checkstatus` (
  `checkstatus_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `checkstatus_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `checkstatus`
--

INSERT INTO `checkstatus` (`checkstatus_id`, `checkstatus_name`) VALUES
('0', 'ยังไม่ได้ตรวจสอบ'),
('1', 'ตรวจสอบแล้ว');

-- --------------------------------------------------------

--
-- Table structure for table `confirm_status`
--

CREATE TABLE `confirm_status` (
  `confirm_status_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `confirm_status_detail` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `confirm_status`
--

INSERT INTO `confirm_status` (`confirm_status_id`, `confirm_status_detail`) VALUES
('c0001', 'รอการยืนยัน...'),
('c0002', 'ยืนยันเรียบร้อย');

-- --------------------------------------------------------

--
-- Table structure for table `durable_borrowlist`
--

CREATE TABLE `durable_borrowlist` (
  `b_id` int(50) NOT NULL,
  `student_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `durable_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `loc_bor` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `borrow_date` date NOT NULL,
  `return_date` date NOT NULL,
  `confirm_status_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `durable_borrowlist`
--

INSERT INTO `durable_borrowlist` (`b_id`, `student_id`, `durable_id`, `loc_bor`, `borrow_date`, `return_date`, `confirm_status_id`) VALUES
(82, '5906021411024', '6150-006-01-16/00027', 'A134', '2019-05-27', '2019-05-28', 'c0002');

-- --------------------------------------------------------

--
-- Table structure for table `durable_picture`
--

CREATE TABLE `durable_picture` (
  `pic_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `durable_image` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `durable_picture`
--

INSERT INTO `durable_picture` (`pic_id`, `durable_image`) VALUES
('p0001', 'None.png'),
('p0002', 'digital_storage_oscilloscope.jpg'),
('p0003', 'AMMETER.jpg'),
('p0004', 'multimeter_DC_Power.jpg'),
('p0005', 'multimeter_generator.jfif'),
('p0006', 'DIGITAL MULTIMETER.jpeg'),
('p0007', 'volmeter.jpg'),
('p0008', 'Slide_regulator.jpg'),
('p0009', 'wattmetre.jpg'),
('p0010', 'rack19.jpg'),
('p0011', 'LCD17IBM.jpg'),
('p0012', 'server1.jpg'),
('p0013', 'server2.jpg'),
('p0014', 'exthdd.jpg'),
('p0015', 'elect_control_servo.jpg'),
('p0016', 'ชุดทดลองหม้อแปลงไฟฟ้า.png'),
('p0017', 'LUCKY.png'),
('p0018', 'table_elect.jpg'),
('p0019', 'toolcase.jpg'),
('p0020', 'server_access.jpg'),
('p0021', 'firewall.png'),
('p0022', 'switch.jpg'),
('p0023', 'copy_cd.jpg'),
('p0024', 'computer.jpg'),
('p0025', 'mable_control.jpg'),
('p0026', 'microcontroler.jpg'),
('p0027', 'Autopano.gif'),
('p0028', 'unity.png'),
('p0029', 'loadcenter.jpg'),
('p0030', 'chair.jpg'),
('p0031', 'projector.png'),
('p0032', 'motorSFJR.png'),
('p0033', 'motormagnet.jpg'),
('p0034', 'ups.jpg'),
('p0035', 'comptable.jpg'),
('p0036', 'laserprint.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `holding`
--

CREATE TABLE `holding` (
  `holding_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `holding_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `holding`
--

INSERT INTO `holding` (`holding_id`, `holding_name`) VALUES
('0000', 'ปกติ'),
('1111', 'ถูกยืม'),
('2222', 'ชำรุด');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `loc_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `build_detail` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`loc_id`, `build_detail`) VALUES
('L0001', 'FITM'),
('L0002', 'บริหาร'),
('L0003', 'Shop-ITI'),
('L0004', 'test build');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `product_detail` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `unit_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `types_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_detail`, `unit_id`, `types_id`) VALUES
('3670-001-01-12/00003', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาโปรแกรมประมวลผล', 'ชุดทดลองแขนกลหุ่นยนต์ไฟฟ้าแบบ 5 แกน ยี่ห้อ EUROTECH Model ROB 3', '1', '7'),
('5210-003-01-12/00022', 'DIGITIAL STORAGE OSCILLOSCOPE', 'รุ่น 701505-5-F-C2 YOKOGAWA', '1', '6'),
('5210-003-01-16/00006', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00007', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00008', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00009', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00010', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00011', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00012', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00013', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00014', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00015', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00016', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00017', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00018', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00019', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00020', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00021', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00022', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00023', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00024', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00025', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00026', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00027', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00028', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00029', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00030', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00031', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00032', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00033', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00034', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5210-003-01-16/00035', 'OSCILLOSCOPE', 'OSCILLOSCOPE ยี่ห้อ HAMEG รุ่น HM303-6', '1', '6'),
('5280-003-22-16/00031', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00032', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00033', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00034', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00035', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00036', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00037', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00038', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00039', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00040', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00041', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00042', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00043', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00044', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5280-003-22-16/00045', 'DIGITAL MULTIMETER', 'FUNCTION GENERATOR ยี่ห้อ GOODWILL รุ่น GFG-8020H', '1', '6'),
('5905-005-01-16/00001', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า', 'LOAD CENTER', '3', '6'),
('5975-001-01-12/00001', 'ชุดประลองสำหรับห้องมัลติมีเดี่ย', 'เครื่องสำเนาแผ่น CD (CD-2 DUPLICATOR 1:3)', '1', '7'),
('5999-006-08-16/00001', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า', 'Main Feeder', '1', '6'),
('6105-001-01-16/00001', 'มอเตอร์', 'SF-JR', '1', '6'),
('6105-001-01-16/00002', 'มอเตอร์', 'SF-JR', '1', '6'),
('6105-001-01-16/00003', 'มอเตอร์', 'SF-JR', '1', '6'),
('6105-001-01-16/00004', 'มอเตอร์', 'SF-JR', '1', '6'),
('6105-001-01-16/00005', 'มอเตอร์', 'SF-JR', '1', '6'),
('6105-001-01-16/00006', 'มอเตอร์', 'SF-JR', '1', '6'),
('6105-001-01-16/00007', 'มอเตอร์', 'SF-JR', '1', '6'),
('6105-001-01-16/00008', 'มอเตอร์', 'SF-JR', '1', '6'),
('6105-001-01-16/00009', 'มอเตอร์', 'DC MOTER PERMANENT MAGNET', '1', '6'),
('6105-001-01-16/00010', 'มอเตอร์', 'DC MOTER PERMANENT MAGNET', '1', '6'),
('6110-010-09-12/00001', 'ชุดประลองเครือข่าย (B4-15)', 'อุปกรณ์ตู้ RACK 19 นิ้ว สำหรับติดตั้ง Server', '3', '7'),
('6110-010-11-12/00001', 'ระบบสำรองไฟ (UPS)', 'ระบบสำรองไฟฟ้า ขนาด 15 KVA', '1', '1'),
('6150-006-01-16/00001', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00002', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00003', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00004', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00005', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00006', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00007', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00008', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00009', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00010', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00011', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00012', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00013', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00014', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00015', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00016', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00017', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00018', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00019', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00020', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00021', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00022', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00023', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00024', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00025', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00026', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'Power Supply', '1', '1'),
('6150-006-01-16/00027', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00028', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00029', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00030', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00031', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00032', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00033', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00034', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00035', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00036', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00037', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00038', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00039', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00040', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00041', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00042', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00043', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00044', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00045', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00046', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00047', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00048', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00049', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00050', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00051', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00052', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00053', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00054', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00055', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00056', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00057', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00058', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00059', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00060', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00061', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00062', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00063', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00064', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00065', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00066', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00067', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00068', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00069', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00070', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00071', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00072', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00073', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00074', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00075', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00076', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00077', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00078', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00079', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00080', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00081', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00082', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00083', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00084', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00085', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6150-006-01-16/00086', 'DIGITAL MULTIMETER', 'DC POWER SUPPY ยี่ห้อ เค.บี.เอ็ม รุ่น 3002', '1', '6'),
('6625-002-01-12/00001', 'ชุดไมโครคอนโทรลเลอร์ Processor PIC 16F84', 'ชุดอุปกรณ์เสริมการทดลอง รุ่น NX-84 \"I nex\"', '1', '6'),
('6625-002-02-12/00001', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ชุดทดลองหม้อแปลงไฟฟ้า ยี่ห้อ TECHNICOM ชนิด Single Phase และ Three Phase พร้อ', '1', '6'),
('6625-002-02-12/00002', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ชุดทดลองเครื่องมือวัดไฟฟ้า ยี่ห้อ TECHNICOM ชุดทดลองเป็นระบบติดตั้งอุปกรณ์บ', '1', '6'),
('6625-002-03-16/00001', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00002', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00003', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00004', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00005', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00006', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00007', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00008', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00009', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00010', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00011', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00012', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00013', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00014', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00015', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00016', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00017', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00018', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00019', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-03-16/00020', 'SLIDE REGULATOR', 'Slide regulator 1 phase', '1', '6'),
('6625-002-06-16/00001', 'ชุดทดลองเครื่องกลไฟฟ้า', 'ชุดทดลองเครื่องกลไฟฟ้า ประกอบด้วย ชุดควบคุมการทำงาน Servo Machine ใช้ขับเคลื่อนด', '1', '6'),
('6625-002-11-12/00001', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ชุดทดลองอิเล็คทรอนิกส์อุตสาหกรรม ยี่ห้อ TECHNICOM ประกอบด้วย แผงโมดูลแหล่', '1', '6'),
('6625-002-15-12/00001', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ชุดทดลองการควบคุมมอเตอร์ไฟฟ้า โดยใช้ Magnetic มีลักษณะเป็น Module แบบ Compact', '1', '6'),
('6625-002-18-12/00001', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'มี 3 ชุด ประกอบด้วย ชุดทดลองการทดสอบและป้องกันระบบไฟฟ้า เป็นผลิตภัณฑ์ของ TEC', '1', '6'),
('6625-002-19-12/00001', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ชุดทดลองไฟฟ้ากระแสตรง และกระแสสลับ', '1', '6'),
('6625-002-19-12/00002', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ชุดทดลองวงจรไฟฟฟ้าแสงสว่างและการหาข้อบกพร่อง ยี่ห้อ TECHNICOM', '1', '6'),
('6625-002-19-12/00003', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ชุดทดลองวงจรไฟฟ้า ใช้ทดลองวงจรไฟฟ้ากระแสตรงและกระแสสลับ ประกอบด้วยชุดแหล่งจ่ายไฟ', '1', '6'),
('6625-002-20-12/00001', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ชุดทดลองการแก้เพาเวอร์แฟคเตอร์ ยี่ห้อ TECHNICOM ลักษณชุดทดลองเป็น Module แบบ', '1', '6'),
('6625-002-21-12/00001', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ชุดทดลองงานติดตั้งไฟฟ้าและระบบเตือนภัย ยี่ห้อ TECHNICOM', '1', '6'),
('6625-002-22-12/00001', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ชุดทดลองเซนเซอร์และทรานสดิวเซอร์ ยี่ห้อ TECHNICOM', '1', '6'),
('6625-003-01-16/00001', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00002', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00003', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00004', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00005', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00006', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00007', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00008', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00009', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00010', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00011', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00012', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00013', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00014', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00015', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00016', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00017', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00018', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00019', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00020', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00021', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00022', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00023', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00024', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00025', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00026', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00027', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00028', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00029', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00030', 'ANALOG AMMETER', 'ANALOG AMMETER รุ่น CA 401', '1', '6'),
('6625-003-01-16/00031', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00032', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00033', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00034', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00035', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00036', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00037', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00038', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00039', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00040', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00041', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00042', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00043', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00044', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00045', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00046', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00047', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00048', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00049', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00050', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00051', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00052', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00053', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00054', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00055', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00056', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00057', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00058', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00059', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00060', 'ANALOG AMMETER', 'ANALOG VOLTMETER รุ่น CA 402', '1', '6'),
('6625-003-01-16/00061', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00062', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00063', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00064', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00065', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00066', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00067', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00068', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00069', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00070', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00071', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00072', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00073', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00074', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00075', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00076', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00077', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00078', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00079', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00080', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00081', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00082', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00083', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00084', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00085', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00086', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00087', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-003-01-16/00088', 'WATT METER', 'WATT METER 3 PHASE', '1', '6'),
('6625-006-02-12/00003', 'FUNCTION GENNERATOR', 'รุ่น FG 2002 \"Goldstar\"', '1', '6'),
('6625-006-02-12/00004', 'FUNCTION GENNERATOR', 'รุ่น FG 2002 \"Goldstar\"', '1', '6'),
('7110-002-03-12/00007', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ตู้เหล็กแบบ 4 ลิ้นชัก ยี่ห้อ LUCKY', '3', '1'),
('7110-002-03-12/00008', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ตู้เหล็กแบบ 4 ลิ้นชัก ยี่ห้อ LUCKY', '3', '1'),
('7110-003-02-12/00001', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'โต๊ะปฏิบัติการทดลอง ยี่ห้อ TECHNICOM ขนาด 1500x800x750 มม.', '3', '6'),
('7110-003-02-12/00002', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'โต๊ะปฏิบัติการทดลอง ยี่ห้อ TECHNICOM ขนาด 1500x800x750 มม.', '3', '6'),
('7110-003-02-12/00003', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'โต๊ะปฏิบัติการทดลอง ยี่ห้อ TECHNICOM ขนาด 1500x800x750 มม.', '3', '6'),
('7110-003-02-12/00004', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'โต๊ะปฏิบัติการทดลอง ยี่ห้อ TECHNICOM ขนาด 1500x800x750 มม.', '3', '6'),
('7110-003-02-12/00005', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'โต๊ะปฏิบัติการทดลอง ยี่ห้อ TECHNICOM ขนาด 1500x800x750 มม.', '3', '6'),
('7110-003-02-12/00006', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'โต๊ะปฏิบัติการทดลอง ยี่ห้อ TECHNICOM ขนาด 1500x800x750 มม.', '3', '6'),
('7110-003-02-12/00007', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'โต๊ะปฏิบัติการทดลอง ยี่ห้อ TECHNICOM ขนาด 1500x800x750 มม.', '3', '6'),
('7110-003-02-12/00008', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'โต๊ะปฏิบัติการทดลอง ยี่ห้อ TECHNICOM ขนาด 1500x800x750 มม.', '3', '6'),
('7110-003-02-12/00009', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'โต๊ะปฏิบัติการทดลอง ยี่ห้อ TECHNICOM ขนาด 1500x800x750 มม.', '3', '6'),
('7110-003-02-12/00010', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'โต๊ะปฏิบัติการทดลอง ยี่ห้อ TECHNICOM ขนาด 1500x800x750 มม.', '3', '6'),
('7110-007-02-12/00341', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00342', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00343', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00344', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00345', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00346', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00347', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00348', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00349', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00350', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00351', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00352', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00353', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00354', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00355', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00356', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00357', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00358', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00359', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00360', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00361', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00362', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00363', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00364', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00365', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00366', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00367', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00368', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00369', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00370', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00371', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00372', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00373', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00374', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00375', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00376', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00377', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00378', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00379', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00380', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00381', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00382', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00383', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00384', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00385', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00386', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00387', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00388', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00389', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00390', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00391', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00392', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00393', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00394', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00395', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00396', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00397', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00398', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00399', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00400', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00401', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00402', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00403', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00404', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00405', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00406', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00407', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00408', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00409', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00410', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00411', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00412', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00413', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00414', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00415', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00416', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00417', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00418', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00419', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00420', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00421', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00422', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00423', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00424', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00425', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00426', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00427', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00428', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00429', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00430', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00431', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00432', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-007-02-12/00433', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'โต๊ะวางเครื่องคอมพิวเตอร์ รูปตัว C ขาเหล็ก ขนาด 1,000x700x750 ม.ม.', '3', '1'),
('7110-017-01-16/00001', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00002', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00003', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00004', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00005', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00006', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00007', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00008', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00009', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00010', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00011', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00012', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00013', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00014', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00015', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00016', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00017', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00018', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00019', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00020', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00021', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00022', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-017-01-16/00023', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ขนาด 800x1400x750', '3', '6'),
('7110-020-01-16/00001', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00002', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00003', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00004', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00005', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00006', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00007', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00008', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00009', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00010', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00011', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00012', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00013', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00014', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00015', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00016', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00017', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00018', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00019', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00020', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00021', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00022', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00023', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00024', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00025', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00026', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00027', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00028', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00029', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00030', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00031', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00032', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00033', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00034', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00035', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00036', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00037', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00038', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00039', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00040', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00041', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00042', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00043', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00044', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00045', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1');
INSERT INTO `product` (`product_id`, `product_name`, `product_detail`, `unit_id`, `types_id`) VALUES
('7110-020-01-16/00046', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00047', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00048', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00049', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00050', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00051', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00052', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00053', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00054', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00055', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00056', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00057', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00058', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00059', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00060', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00061', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00062', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00063', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00064', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00065', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00066', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00067', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00068', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00069', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00070', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00071', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00072', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00073', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00074', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00075', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00076', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00077', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00078', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00079', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00080', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00081', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00082', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00083', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00084', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00085', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00086', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00087', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00088', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00089', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00090', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00091', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00092', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00093', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00094', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00095', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00096', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00097', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00098', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00099', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-020-01-16/00100', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'เก้าอี้กลมไม่มีพนักพิง สำหรับนักศึกษา', '3', '1'),
('7110-023-01-12/00066', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ตู้เหล็กแบบประตูบานทึบ 2 บาน ยี่ห้อ LUCKY', '3', '1'),
('7110-023-01-12/00067', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ตู้เหล็กแบบประตูบานทึบ 2 บาน ยี่ห้อ LUCKY', '3', '1'),
('7110-023-01-12/00068', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ตู้เหล็กแบบประตูบานทึบ 2 บาน ยี่ห้อ LUCKY', '3', '1'),
('7110-023-01-12/00069', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ตู้เหล็กแบบประตูบานทึบ 2 บาน ยี่ห้อ LUCKY', '3', '1'),
('7110-023-01-12/00070', 'ชุดทดลองและทดสอบห้องประลองไฟฟ้าอุตสาหกรรม', 'ตู้เหล็กแบบประตูบานทึบ 2 บาน ยี่ห้อ LUCKY', '3', '1'),
('7125-002-02-12/00043', 'เครื่องประลองคอมพิวเตอร์แม่ข่าย(server)สำหรับงานธุ', 'ตู้ RACK 19 นิ้ว', '3', '1'),
('7125-002-02-16/00001', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7125-002-02-16/00002', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7125-002-02-16/00003', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7125-002-02-16/00004', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7125-002-02-16/00005', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7125-002-02-16/00006', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7125-002-02-16/00007', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7125-002-02-16/00008', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7125-002-02-16/00009', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7125-002-02-16/00010', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7125-002-02-16/00011', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7125-002-02-16/00012', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7125-002-02-16/00013', 'โต๊ะปฏิบัติการไฟฟ้า (ครุภัณฑ์วิชาพื้นฐานทางด้านไฟฟ้า)', 'ตู้เก็บอุปกรณ์', '5', '1'),
('7440-001-04-12/00227', 'ชุดประลองสำหรับห้องมัลติมีเดี่ย', 'เดรื่องคอมพิวเตอร์สำหรับการตัดต่อวีดีโอ ยี่ห้อ AMPRO P4-2.53 GHz', '1', '7'),
('7440-001-04-12/00228', 'ชุดประลองสำหรับห้องมัลติมีเดี่ย', 'เดรื่องคอมพิวเตอร์สำหรับการตัดต่อวีดีโอ ยี่ห้อ AMPRO P4-2.53 GHz', '1', '7'),
('7440-001-04-12/00445', 'เครื่องประลองคอมพิวเตอร์แม่ข่าย(server)สำหรับงานธุ', 'อุปกรณ์แสดงผลและเก็บข้อมูล จอ LCD 17 นิ้ว IBM', '1', '7'),
('7440-001-04-12/00452', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00453', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00454', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00455', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00456', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00457', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00458', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00459', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00460', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00461', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00462', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00463', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00464', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00465', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00466', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00467', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00468', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00469', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00470', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00471', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00472', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00473', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00474', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00475', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00476', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00477', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00478', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00479', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00480', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00481', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00482', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00483', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00484', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-04-12/00485', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องคอมพิวเตอร์ ยี่ห้อ AMPRO', '1', '7'),
('7440-001-05-12/00166', 'ห้องประลองคอมพิวเตอร์ 1 ระบบ', 'คอมพิวเตอร์แม่ข่าย (SERVER) ยี่ห้อ Dell 1800', '1', '7'),
('7440-001-05-12/00167', 'ห้องประลองคอมพิวเตอร์ 1 ระบบ', 'คอมพิวเตอร์แม่ข่าย (SERVER) ยี่ห้อ Dell 1800', '1', '7'),
('7440-001-05-12/00168', 'เครื่องประลองคอมพิวเตอร์แม่ข่าย(server)สำหรับงานธุ', 'คอมพิวเตอร์แม่ข่าย (server) แบบที่ 1', '1', '7'),
('7440-001-05-12/00169', 'เครื่องประลองคอมพิวเตอร์แม่ข่าย(server)สำหรับงานธุ', 'คอมพิวเตอร์แม่ข่าย (server) แบบที่ 1', '1', '7'),
('7440-001-05-12/00170', 'เครื่องประลองคอมพิวเตอร์แม่ข่าย(server)สำหรับงานธุ', 'คอมพิวเตอร์แม่ข่าย (server) แบบที่ 2', '1', '7'),
('7440-001-05-12/00171', 'เครื่องประลองคอมพิวเตอร์แม่ข่าย(server)สำหรับงานธุ', 'อุปกรณ์จัดเก็บข้อมูลแบบภายนอก', '3', '7'),
('7440-001-05-12/00172', 'ชุดประลองเครือข่าย (B4-15)', 'อุปกรณ์ Server', '1', '7'),
('7440-001-05-12/00173', 'ชุดประลองเครือข่าย (B4-15)', 'อุปกรณ์ Server', '1', '7'),
('7440-002-02-12/00031', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องพิมพ์เลเซอร์ HP color 2600 N', '1', '6'),
('7440-002-02-12/00032', 'ห้องประลองคอมพิวเตอร์ (B4-16)', 'เครื่องพิมพ์เลเซอร์ ALL-IN-ONE รุ่น3052', '1', '6'),
('7440-008-01-12/00004', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00005', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00006', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00007', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00008', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00009', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00010', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00011', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00012', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00013', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00014', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00015', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00016', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00017', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00018', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00019', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00020', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00021', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00022', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00023', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดประลองการอินเตอร์เฟส 1 ชุด ประกอบด้วย ชุดทดลองการเชื่อมต่อคอมพิวเตอร์กับอุปกรณ์', '1', '7'),
('7440-008-01-12/00035', 'ชุดประลองเครือข่าย (B4-15)', 'อุปกรณ์ Firewall', '1', '7'),
('7440-008-01-12/00036', 'ชุดประลองเครือข่าย (B4-15)', 'อุปกรณ์ Firewall', '1', '7'),
('7440-008-01-12/00037', 'ชุดประลองเครือข่าย (B4-15)', 'อุปกรณ์ Firewall', '1', '7'),
('7440-008-01-12/00038', 'ชุดประลองเครือข่าย (B4-15)', 'อุปกรณ์ Firewall', '1', '7'),
('7440-008-01-12/00039', 'ชุดประลองเครือข่าย (B4-15)', 'อุปกรณ์ สวิสต์แบบที่ 1', '1', '7'),
('7440-008-01-12/00040', 'ชุดประลองเครือข่าย (B4-15)', 'อุปกรณ์ สวิสต์แบบที่ 2', '1', '7'),
('7440-009-07-12/00001', 'ซอร์ฟแวร์สร้างภาพเสมือนจริง', 'ซอฟต์แวร์สร้างภาพพาราโนมา', '5', '0'),
('7440-009-07-12/00002', 'ซอร์ฟแวร์สร้างภาพเสมือนจริง', 'ซอฟต์แวร์สร้างภาพพาราโนมา', '5', '0'),
('7440-009-07-12/00003', 'ซอร์ฟแวร์สร้างภาพเสมือนจริง', 'ซอฟต์แวร์สร้างภาพพาราโนมา', '5', '0'),
('7440-009-07-12/00004', 'ซอร์ฟแวร์สร้างภาพเสมือนจริง', 'ซอฟต์แวร์สร้างภาพพาราโนมา', '5', '0'),
('7440-009-07-12/00005', 'ซอร์ฟแวร์สร้างภาพเสมือนจริง', 'ซอฟต์แวร์สร้างภาพพาราโนมา', '5', '0'),
('7440-009-07-12/00006', 'ซอร์ฟแวร์สร้างภาพเสมือนจริง', 'ซอฟต์แวร์สร้างเกมส์ 3 มิติ', '5', '0'),
('7440-009-07-12/00007', 'ซอร์ฟแวร์สร้างภาพเสมือนจริง', 'ซอฟต์แวร์สร้างเกมส์ 3 มิติ', '5', '0'),
('7440-009-07-12/00008', 'ซอร์ฟแวร์สร้างภาพเสมือนจริง', 'ซอฟต์แวร์สร้างเกมส์ 3 มิติ', '5', '0'),
('7440-009-08-12/00001', 'ชุดโปรแกรมเมเบิลคอนโทรลเลอร์', 'รุ่น TDR-140.65 \"TOSHIBA\"', '1', '6'),
('7440-009-08-12/00002', 'ชุดโปรแกรมเมเบิลคอนโทรลเลอร์', 'รุ่น TDR-140.65 \"TOSHIBA\"', '1', '6'),
('7440-009-08-12/00003', 'ชุดโปรแกรมเมเบิลคอนโทรลเลอร์', 'รุ่น TDR-140.65 \"TOSHIBA\"', '1', '6'),
('7440-009-08-12/00004', 'ชุดโปรแกรมเมเบิลคอนโทรลเลอร์', 'รุ่น TDR-140.65 \"TOSHIBA\"', '1', '6'),
('7440-009-08-12/00005', 'ชุดโปรแกรมเมเบิลคอนโทรลเลอร์', 'รุ่น TDR-140.65 \"TOSHIBA\"', '1', '6'),
('7440-009-08-12/00006', 'ชุดโปรแกรมเมเบิลคอนโทรลเลอร์', 'รุ่น TDR-140.65 \"TOSHIBA\"', '1', '6'),
('7440-009-08-12/00007', 'ชุดโปรแกรมเมเบิลคอนโทรลเลอร์', 'รุ่น TDR-140.65 \"TOSHIBA\"', '1', '6'),
('7440-009-08-12/00008', 'ชุดโปรแกรมเมเบิลคอนโทรลเลอร์', 'รุ่น TDR-140.65 \"TOSHIBA\"', '1', '6'),
('7440-009-08-12/00009', 'ชุดโปรแกรมเมเบิลคอนโทรลเลอร์', 'รุ่น TDR-140.65 \"TOSHIBA\"', '1', '6'),
('7440-009-08-12/00010', 'ชุดโปรแกรมเมเบิลคอนโทรลเลอร์', 'รุ่น TDR-140.65 \"TOSHIBA\"', '1', '6'),
('7440-009-08-16/00001', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00002', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00003', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00004', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00005', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00006', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00007', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00008', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00009', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00010', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00011', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00012', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00013', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00014', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00015', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00016', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลคอนโทรลขั้นพื้นฐาน -Omron CPM2A', '1', '6'),
('7440-009-08-16/00017', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลขั้นสูง - Omron C200HS', '1', '6'),
('7440-009-08-16/00018', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลขั้นสูง - Omron C200HS', '1', '6'),
('7440-009-08-16/00019', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลขั้นสูง - Omron C200HS', '1', '6'),
('7440-009-08-16/00020', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลขั้นสูง - Omron C200HS', '1', '6'),
('7440-009-08-16/00021', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลขั้นสูง - Omron C200HS', '1', '6'),
('7440-009-08-16/00022', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลขั้นสูง - Omron C200HS', '1', '6'),
('7440-009-08-16/00023', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลขั้นสูง - Omron C200HS', '1', '6'),
('7440-009-08-16/00024', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลขั้นสูง - Omron C200HS', '1', '6'),
('7440-009-08-16/00025', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลขั้นสูง - Omron C200HS', '1', '6'),
('7440-009-08-16/00026', 'โปรเจคเตอร์พร้อมเครื่องสัญญาณ 3 มิติ', 'ชุดฝึกโปรแกรมเมเบิลขั้นสูง - Omron C200HS', '1', '6'),
('7440-012-01-12/00027', 'ชุดประลองเครือข่าย (B4-15)', 'อุปกรณ์แสดงผลและรับข้อมูล (จอLCD 15 นิ้ว)  IBM', '1', '7'),
('7440-017-02-12/00001', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดทดลองการควบคุมแบบโปรแกรมและระบบอัตโนมัติ (PLC) ยี่ห้อ Technicom มีซอฟแวร์', '1', '6'),
('7440-017-02-12/00002', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดทดลองการควบคุมแบบโปรแกรมและระบบอัตโนมัติ (PLC) ยี่ห้อ Technicom มีซอฟแวร์', '1', '6'),
('7440-017-02-12/00003', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดทดลองการควบคุมแบบโปรแกรมและระบบอัตโนมัติ (PLC) ยี่ห้อ Technicom มีซอฟแวร์', '1', '6'),
('7440-017-02-12/00004', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดทดลองการควบคุมแบบโปรแกรมและระบบอัตโนมัติ (PLC) ยี่ห้อ Technicom มีซอฟแวร์', '1', '6'),
('7440-017-02-12/00005', 'ระบบห้องประลองคอมพิวเตอร์สำหรับพัฒนาดปรแกรมประมวลผล', 'ชุดทดลองการควบคุมแบบโปรแกรมและระบบอัตโนมัติ (PLC) ยี่ห้อ Technicom มีซอฟแวร์', '1', '6'),
('7440-018-10-12/00001', 'ชุดประลองเครือข่าย (B4-15)', 'อุปกรณ์จัดเก็บข้อมูลแบบภายนอก', '1', '7');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `r_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `r_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`r_id`, `r_name`) VALUES
('R0001', 'A101'),
('R0002', 'A102'),
('R0003', 'A103'),
('R0004', 'A104'),
('R0005', 'A105'),
('R0006', 'A106'),
('R0007', 'A107'),
('R0008', 'A108'),
('R0009', 'A109'),
('R0010', 'A110');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(50) NOT NULL,
  `staff_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `passkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `staff_pic` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `staff_status_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LoginStatus` int(11) NOT NULL,
  `LastUpdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `username`, `passkey`, `email`, `staff_pic`, `staff_status_id`, `LoginStatus`, `LastUpdate`) VALUES
(0, '-', '-', '-', '-', '-', 'st001', 0, '0000-00-00 00:00:00'),
(1, 'Pusana', 'admin', 'admin1234', 'rootpir@gmail.com', 'avatar_pusana.jpg', 'st001', 1, '2021-06-21 11:03:40'),
(162, 'Pusana Chalermpan', 'pusana', '1234', '5906021411024@fitm.kmutnb.ac.th', 'img_avatar.png', 'st002', 0, '2019-05-27 10:40:12'),
(164, 'Niti Jaroendee', 'Niti', '1234', 'pirate.once@gmail.com', 'img_avatar.png', 'st001', 0, '0000-00-00 00:00:00'),
(165, 'yupin', 'yupin', 'pai2000', 'yupin.s@fitm.kmutnb.ac.th', 'img_avatar.png', 'st001', 0, '0000-00-00 00:00:00'),
(166, 'Noppagaw', 'nop', '1234', 'nopphagaw.t@fitm.kmutnb.ac.th', 'img_avatar.png', 'st001', 0, '0000-00-00 00:00:00'),
(170, 'ภูษณ เฉลิมพันธ์', 'pusanach', '1234', 'rootpir@gmail.com', 'img_staff_5cf0e0f48b123.jpg', 'st002', 0, '0000-00-00 00:00:00'),
(171, 'Chaiwat', 'mike', '1234', '6206021420044@fitm.kmutnb.ac.th', 'img_staff_60cafa9b7df1b.jpg', 'st002', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `staff_status`
--

CREATE TABLE `staff_status` (
  `staff_status_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `staff_status_detail` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff_status`
--

INSERT INTO `staff_status` (`staff_status_id`, `staff_status_detail`) VALUES
('st001', 'ผู้ดูแลระบบ'),
('st002', 'บุคลากร');

-- --------------------------------------------------------

--
-- Table structure for table `status_durable`
--

CREATE TABLE `status_durable` (
  `status_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status_detail` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `status_durable`
--

INSERT INTO `status_durable` (`status_id`, `status_detail`) VALUES
('s0001', 'รับโอน'),
('s0002', 'อยากจำหน่าย'),
('s0003', '-');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `student_Fname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `student_Lname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_card_number` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `passwords` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `student_pic` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_Fname`, `student_Lname`, `id_card_number`, `email`, `tel`, `username`, `passwords`, `student_pic`) VALUES
('5906021411024', 'ภูษณ', 'เฉลิมพันธ์', '1219900504492', '5906021411024@fitm.kmutnb.ac.th', '0830748092', '5906021411024', '123456789', 'img_5ce38a9be7205.jpg'),
('5906021420074', 'Niti', 'Jaroendee', '1750200051361', 'pirate.once@gmail.com', '0631966634', '5906021420074', '034757518', 'img_5ceb6015af931.jpg'),
('6206021420044', 'chaiwat', 'limsa', '1100702915847', 'test@fitm.kmutnb.ac.th', '0850864023', '6206021420044', '01bcb711706fd5ca849053f3043f196e', 'img_60c828ea12553.jpg'),
('6206021420045', 'chaiwat2', 'limsak', '3489720206749', 'test@gmail.com', '026458194', '6206021420045', '4a4cfcadcea0ce01c7ddae2b76842a61', 'img_60c8d38b2a49e.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `tools_id` int(50) NOT NULL,
  `tools_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tools_detail` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `box_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`tools_id`, `tools_name`, `tools_detail`, `box_id`) VALUES
(6, 'ไขควง', 'ไขควง ขนาด 6 นิ้ว', '0001-0001-01-01'),
(7, 'ประแจ', 'ประแจ ขนาด 6 นิ้ว', '0002-0002-02-02'),
(8, 'ไขควงปากแบน', 'ไขควงปากแบน ขนาด 6 นิ้ว', '0002-0002-02-02'),
(9, 'ประแจเลื่อน', 'ประแจเลื่อน ขนาด 8 นิ้ว', '0003-0003-03-03'),
(10, '5377', 'gffgg', '0001-0001-01-01'),
(11, 'test2', 'test2', '0002-0002-02-02'),
(12, 'test5', 'test5', '0003-0003-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `tools_borrowlist`
--

CREATE TABLE `tools_borrowlist` (
  `b_id` int(50) NOT NULL,
  `student_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `box_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `loc_bor` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `borrow_date` date NOT NULL,
  `return_date` date NOT NULL,
  `confirm_status_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_product`
--

CREATE TABLE `type_product` (
  `types_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type_detail` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_product`
--

INSERT INTO `type_product` (`types_id`, `type_detail`) VALUES
('0', '-'),
('1', 'ครุภัณฑ์สำนักงาน'),
('2', 'ครุภัณฑ์การศึกษา'),
('3', 'ครุภัณฑ์ยานพาหนะและขนส่ง'),
('4', 'ครุภัณฑ์การเกษตร'),
('5', 'ครุภัณฑ์ก่อสร้าง'),
('6', 'ครุภัณฑ์ไฟฟ้าและวิทยุ'),
('7', 'ครุภัณฑ์คอมพิวเตอร์');

-- --------------------------------------------------------

--
-- Table structure for table `t_durable`
--

CREATE TABLE `t_durable` (
  `durable_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `loc_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `room_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `holding_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pic_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `modify_date` date NOT NULL,
  `checkstatus_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `staff_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_durable`
--

INSERT INTO `t_durable` (`durable_id`, `product_id`, `loc_id`, `room_id`, `status_id`, `holding_id`, `pic_id`, `modify_date`, `checkstatus_id`, `staff_id`) VALUES
('3670-001-01-12/00003', '3670-001-01-12/00003', 'L0001', 'R0029', 's0001', '0000', 'p0001', '2019-05-27', '0', 0),
('5210-003-01-12/00022', '5210-003-01-12/00022', 'L0001', 'R0018', 's0003', '0000', 'p0002', '2019-05-28', '0', 0),
('5210-003-01-16/00006', '5210-003-01-16/00006', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00007', '5210-003-01-16/00007', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00008', '5210-003-01-16/00008', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00009', '5210-003-01-16/00009', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00010', '5210-003-01-16/00010', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00011', '5210-003-01-16/00011', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00012', '5210-003-01-16/00012', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00013', '5210-003-01-16/00013', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00014', '5210-003-01-16/00014', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00015', '5210-003-01-16/00015', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00016', '5210-003-01-16/00016', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00017', '5210-003-01-16/00017', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00018', '5210-003-01-16/00018', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00019', '5210-003-01-16/00019', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00020', '5210-003-01-16/00020', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00021', '5210-003-01-16/00021', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00022', '5210-003-01-16/00022', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00023', '5210-003-01-16/00023', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00024', '5210-003-01-16/00024', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00025', '5210-003-01-16/00025', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00026', '5210-003-01-16/00026', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00027', '5210-003-01-16/00027', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00028', '5210-003-01-16/00028', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00029', '5210-003-01-16/00029', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00030', '5210-003-01-16/00030', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00031', '5210-003-01-16/00031', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00032', '5210-003-01-16/00032', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00033', '5210-003-01-16/00033', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00034', '5210-003-01-16/00034', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00035', '5210-003-01-16/00035', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5280-003-22-16/00031', '5280-003-22-16/00031', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00032', '5280-003-22-16/00032', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00033', '5280-003-22-16/00033', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00034', '5280-003-22-16/00034', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00035', '5280-003-22-16/00035', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00036', '5280-003-22-16/00036', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00037', '5280-003-22-16/00037', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00038', '5280-003-22-16/00038', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00039', '5280-003-22-16/00039', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00040', '5280-003-22-16/00040', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00041', '5280-003-22-16/00041', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00042', '5280-003-22-16/00042', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00043', '5280-003-22-16/00043', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00044', '5280-003-22-16/00044', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00045', '5280-003-22-16/00045', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5905-005-01-16/00001', '5905-005-01-16/00001', 'L0003', 'R0026', 's0001', '0000', 'p0029', '0000-00-00', '0', 0),
('5975-001-01-12/00001', '5975-001-01-12/00001', 'L0001', 'R0001', 's0003', '0000', 'p0023', '0000-00-00', '0', 0),
('5999-006-08-16/00001', '5999-006-08-16/00001', 'L0003', 'R0026', 's0001', '0000', 'p0001', '0000-00-00', '0', 0),
('6105-001-01-16/00001', '6105-001-01-16/00001', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00002', '6105-001-01-16/00002', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00003', '6105-001-01-16/00003', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00004', '6105-001-01-16/00004', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00005', '6105-001-01-16/00005', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00006', '6105-001-01-16/00006', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00007', '6105-001-01-16/00007', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00008', '6105-001-01-16/00008', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00009', '6105-001-01-16/00009', 'L0001', 'R0026', 's0001', '0000', 'p0033', '0000-00-00', '0', 0),
('6105-001-01-16/00010', '6105-001-01-16/00010', 'L0001', 'R0026', 's0001', '0000', 'p0033', '0000-00-00', '0', 0),
('6110-010-09-12/00001', '6110-010-09-12/00001', 'L0001', 'R0008', 's0003', '0000', 'p0010', '0000-00-00', '0', 0),
('6110-010-11-12/00001', '6110-010-11-12/00001', 'L0001', 'R0012', 's0002', '0000', 'p0034', '0000-00-00', '0', 0),
('6150-006-01-16/00001', '6150-006-01-16/00001', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00002', '6150-006-01-16/00002', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00003', '6150-006-01-16/00003', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00004', '6150-006-01-16/00004', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00005', '6150-006-01-16/00005', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00006', '6150-006-01-16/00006', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00007', '6150-006-01-16/00007', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00008', '6150-006-01-16/00008', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00009', '6150-006-01-16/00009', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00010', '6150-006-01-16/00010', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00011', '6150-006-01-16/00011', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00012', '6150-006-01-16/00012', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00013', '6150-006-01-16/00013', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00014', '6150-006-01-16/00014', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00015', '6150-006-01-16/00015', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00016', '6150-006-01-16/00016', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00017', '6150-006-01-16/00017', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00018', '6150-006-01-16/00018', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00019', '6150-006-01-16/00019', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00020', '6150-006-01-16/00020', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00021', '6150-006-01-16/00021', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00022', '6150-006-01-16/00022', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00023', '6150-006-01-16/00023', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00024', '6150-006-01-16/00024', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00025', '6150-006-01-16/00025', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00026', '6150-006-01-16/00026', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00027', '6150-006-01-16/00027', 'L0003', 'R0027', 's0001', '1111', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00028', '6150-006-01-16/00028', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00029', '6150-006-01-16/00029', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00030', '6150-006-01-16/00030', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00031', '6150-006-01-16/00031', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00032', '6150-006-01-16/00032', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00033', '6150-006-01-16/00033', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00034', '6150-006-01-16/00034', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00035', '6150-006-01-16/00035', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00036', '6150-006-01-16/00036', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00037', '6150-006-01-16/00037', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00038', '6150-006-01-16/00038', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00039', '6150-006-01-16/00039', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00040', '6150-006-01-16/00040', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00041', '6150-006-01-16/00041', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00042', '6150-006-01-16/00042', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00043', '6150-006-01-16/00043', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00044', '6150-006-01-16/00044', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00045', '6150-006-01-16/00045', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00046', '6150-006-01-16/00046', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00047', '6150-006-01-16/00047', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00048', '6150-006-01-16/00048', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00049', '6150-006-01-16/00049', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00050', '6150-006-01-16/00050', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00051', '6150-006-01-16/00051', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00052', '6150-006-01-16/00052', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00053', '6150-006-01-16/00053', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00054', '6150-006-01-16/00054', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00055', '6150-006-01-16/00055', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00056', '6150-006-01-16/00056', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00057', '6150-006-01-16/00057', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00058', '6150-006-01-16/00058', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00059', '6150-006-01-16/00059', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00060', '6150-006-01-16/00060', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00061', '6150-006-01-16/00061', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00062', '6150-006-01-16/00062', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00063', '6150-006-01-16/00063', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00064', '6150-006-01-16/00064', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00065', '6150-006-01-16/00065', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00066', '6150-006-01-16/00066', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00067', '6150-006-01-16/00067', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00068', '6150-006-01-16/00068', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00069', '6150-006-01-16/00069', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00070', '6150-006-01-16/00070', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00071', '6150-006-01-16/00071', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00072', '6150-006-01-16/00072', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00073', '6150-006-01-16/00073', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00074', '6150-006-01-16/00074', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00075', '6150-006-01-16/00075', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00076', '6150-006-01-16/00076', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00077', '6150-006-01-16/00077', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00078', '6150-006-01-16/00078', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00079', '6150-006-01-16/00079', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00080', '6150-006-01-16/00080', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00081', '6150-006-01-16/00081', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00082', '6150-006-01-16/00082', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00083', '6150-006-01-16/00083', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00084', '6150-006-01-16/00084', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00085', '6150-006-01-16/00085', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00086', '6150-006-01-16/00086', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6625-002-01-12/00001', '6625-002-01-12/00001', 'L0001', 'R0023', 's0003', '0000', 'p0026', '0000-00-00', '0', 0),
('6625-002-02-12/00001', '6625-002-02-12/00001', 'L0001', 'R0024', 's0003', '0000', 'p0016', '0000-00-00', '0', 0),
('6625-002-02-12/00002', '6625-002-02-12/00002', 'L0001', 'R0024', 's0003', '0000', 'p0016', '0000-00-00', '0', 0),
('6625-002-03-16/00001', '6625-002-03-16/00001', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00002', '6625-002-03-16/00002', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00003', '6625-002-03-16/00003', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00004', '6625-002-03-16/00004', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00005', '6625-002-03-16/00005', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00006', '6625-002-03-16/00006', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00007', '6625-002-03-16/00007', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00008', '6625-002-03-16/00008', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00009', '6625-002-03-16/00009', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00010', '6625-002-03-16/00010', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00011', '6625-002-03-16/00011', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00012', '6625-002-03-16/00012', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00013', '6625-002-03-16/00013', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00014', '6625-002-03-16/00014', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00015', '6625-002-03-16/00015', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00016', '6625-002-03-16/00016', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00017', '6625-002-03-16/00017', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00018', '6625-002-03-16/00018', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00019', '6625-002-03-16/00019', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-03-16/00020', '6625-002-03-16/00020', 'L0001', 'R0026', 's0001', '0000', 'p0008', '0000-00-00', '0', 0),
('6625-002-06-16/00001', '6625-002-06-16/00001', 'L0003', 'R0026', 's0001', '0000', 'p0015', '0000-00-00', '0', 0),
('6625-002-11-12/00001', '6625-002-11-12/00001', 'L0001', 'R0024', 's0003', '0000', 'p0016', '0000-00-00', '0', 0),
('6625-002-15-12/00001', '6625-002-15-12/00001', 'L0001', 'R0024', 's0003', '0000', 'p0016', '0000-00-00', '0', 0),
('6625-002-18-12/00001', '6625-002-18-12/00001', 'L0001', 'R0024', 's0003', '0000', 'p0016', '0000-00-00', '0', 0),
('6625-002-19-12/00001', '6625-002-19-12/00001', 'L0001', 'R0024', 's0003', '0000', 'p0016', '0000-00-00', '0', 0),
('6625-002-19-12/00002', '6625-002-19-12/00002', 'L0001', 'R0024', 's0003', '0000', 'p0016', '0000-00-00', '0', 0),
('6625-002-19-12/00003', '6625-002-19-12/00003', 'L0001', 'R0024', 's0003', '0000', 'p0016', '0000-00-00', '0', 0),
('6625-002-20-12/00001', '6625-002-20-12/00001', 'L0001', 'R0024', 's0003', '0000', 'p0016', '0000-00-00', '0', 0),
('6625-002-21-12/00001', '6625-002-21-12/00001', 'L0001', 'R0024', 's0003', '0000', 'p0016', '0000-00-00', '0', 0),
('6625-002-22-12/00001', '6625-002-22-12/00001', 'L0001', 'R0024', 's0003', '0000', 'p0016', '0000-00-00', '0', 0),
('6625-003-01-16/00001', '6625-003-01-16/00001', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00002', '6625-003-01-16/00002', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00003', '6625-003-01-16/00003', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00004', '6625-003-01-16/00004', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00005', '6625-003-01-16/00005', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00006', '6625-003-01-16/00006', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00007', '6625-003-01-16/00007', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00008', '6625-003-01-16/00008', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00009', '6625-003-01-16/00009', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00010', '6625-003-01-16/00010', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00011', '6625-003-01-16/00011', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00012', '6625-003-01-16/00012', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00013', '6625-003-01-16/00013', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00014', '6625-003-01-16/00014', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00015', '6625-003-01-16/00015', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00016', '6625-003-01-16/00016', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00017', '6625-003-01-16/00017', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00018', '6625-003-01-16/00018', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00019', '6625-003-01-16/00019', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00020', '6625-003-01-16/00020', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00021', '6625-003-01-16/00021', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00022', '6625-003-01-16/00022', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00023', '6625-003-01-16/00023', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00024', '6625-003-01-16/00024', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00025', '6625-003-01-16/00025', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00026', '6625-003-01-16/00026', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00027', '6625-003-01-16/00027', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00028', '6625-003-01-16/00028', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00029', '6625-003-01-16/00029', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00030', '6625-003-01-16/00030', 'L0003', 'R0026', 's0001', '0000', 'p0003', '0000-00-00', '0', 0),
('6625-003-01-16/00031', '6625-003-01-16/00031', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00032', '6625-003-01-16/00032', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00033', '6625-003-01-16/00033', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00034', '6625-003-01-16/00034', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00035', '6625-003-01-16/00035', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00036', '6625-003-01-16/00036', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00037', '6625-003-01-16/00037', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00038', '6625-003-01-16/00038', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00039', '6625-003-01-16/00039', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00040', '6625-003-01-16/00040', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00041', '6625-003-01-16/00041', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00042', '6625-003-01-16/00042', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00043', '6625-003-01-16/00043', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00044', '6625-003-01-16/00044', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00045', '6625-003-01-16/00045', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00046', '6625-003-01-16/00046', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00047', '6625-003-01-16/00047', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00048', '6625-003-01-16/00048', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00049', '6625-003-01-16/00049', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00050', '6625-003-01-16/00050', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00051', '6625-003-01-16/00051', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00052', '6625-003-01-16/00052', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00053', '6625-003-01-16/00053', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00054', '6625-003-01-16/00054', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00055', '6625-003-01-16/00055', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00056', '6625-003-01-16/00056', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00057', '6625-003-01-16/00057', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00058', '6625-003-01-16/00058', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00059', '6625-003-01-16/00059', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00060', '6625-003-01-16/00060', 'L0003', 'R0026', 's0001', '0000', 'p0007', '0000-00-00', '0', 0),
('6625-003-01-16/00061', '6625-003-01-16/00061', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00062', '6625-003-01-16/00062', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00063', '6625-003-01-16/00063', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00064', '6625-003-01-16/00064', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00065', '6625-003-01-16/00065', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00066', '6625-003-01-16/00066', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00067', '6625-003-01-16/00067', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00068', '6625-003-01-16/00068', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00069', '6625-003-01-16/00069', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00070', '6625-003-01-16/00070', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00071', '6625-003-01-16/00071', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00072', '6625-003-01-16/00072', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00073', '6625-003-01-16/00073', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00074', '6625-003-01-16/00074', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00075', '6625-003-01-16/00075', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00076', '6625-003-01-16/00076', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00077', '6625-003-01-16/00077', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00078', '6625-003-01-16/00078', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00079', '6625-003-01-16/00079', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00080', '6625-003-01-16/00080', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00081', '6625-003-01-16/00081', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00082', '6625-003-01-16/00082', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00083', '6625-003-01-16/00083', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00084', '6625-003-01-16/00084', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00085', '6625-003-01-16/00085', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00086', '6625-003-01-16/00086', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00087', '6625-003-01-16/00087', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-003-01-16/00088', '6625-003-01-16/00088', 'L0003', 'R0026', 's0001', '0000', 'p0009', '0000-00-00', '0', 0),
('6625-006-02-12/00003', '6625-006-02-12/00003', 'L0001', 'R0024', 's0003', '0000', 'p0005', '0000-00-00', '0', 0),
('6625-006-02-12/00004', '6625-006-02-12/00004', 'L0001', 'R0024', 's0003', '0000', 'p0005', '0000-00-00', '0', 0),
('7110-002-03-12/00007', '7110-002-03-12/00007', 'L0001', 'R0024', 's0003', '0000', 'p0017', '0000-00-00', '0', 0),
('7110-002-03-12/00008', '7110-002-03-12/00008', 'L0001', 'R0024', 's0003', '0000', 'p0017', '0000-00-00', '0', 0),
('7110-003-02-12/00001', '7110-003-02-12/00001', 'L0001', 'R0024', 's0003', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-003-02-12/00002', '7110-003-02-12/00002', 'L0001', 'R0024', 's0003', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-003-02-12/00003', '7110-003-02-12/00003', 'L0001', 'R0024', 's0003', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-003-02-12/00004', '7110-003-02-12/00004', 'L0001', 'R0024', 's0003', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-003-02-12/00005', '7110-003-02-12/00005', 'L0001', 'R0024', 's0003', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-003-02-12/00006', '7110-003-02-12/00006', 'L0001', 'R0024', 's0003', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-003-02-12/00007', '7110-003-02-12/00007', 'L0001', 'R0024', 's0003', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-003-02-12/00008', '7110-003-02-12/00008', 'L0001', 'R0024', 's0003', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-003-02-12/00009', '7110-003-02-12/00009', 'L0001', 'R0024', 's0003', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-003-02-12/00010', '7110-003-02-12/00010', 'L0001', 'R0024', 's0003', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-007-02-12/00341', '7110-007-02-12/00341', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00342', '7110-007-02-12/00342', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00343', '7110-007-02-12/00343', 'L0001', 'R0005', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00344', '7110-007-02-12/00344', 'L0001', 'R0013', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00345', '7110-007-02-12/00345', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00346', '7110-007-02-12/00346', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00347', '7110-007-02-12/00347', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00348', '7110-007-02-12/00348', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00349', '7110-007-02-12/00349', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00350', '7110-007-02-12/00350', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00351', '7110-007-02-12/00351', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00352', '7110-007-02-12/00352', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00353', '7110-007-02-12/00353', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00354', '7110-007-02-12/00354', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00355', '7110-007-02-12/00355', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00356', '7110-007-02-12/00356', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00357', '7110-007-02-12/00357', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00358', '7110-007-02-12/00358', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00359', '7110-007-02-12/00359', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00360', '7110-007-02-12/00360', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00361', '7110-007-02-12/00361', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00362', '7110-007-02-12/00362', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00363', '7110-007-02-12/00363', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00364', '7110-007-02-12/00364', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00365', '7110-007-02-12/00365', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00366', '7110-007-02-12/00366', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00367', '7110-007-02-12/00367', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00368', '7110-007-02-12/00368', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00369', '7110-007-02-12/00369', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00370', '7110-007-02-12/00370', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00371', '7110-007-02-12/00371', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00372', '7110-007-02-12/00372', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00373', '7110-007-02-12/00373', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00374', '7110-007-02-12/00374', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00375', '7110-007-02-12/00375', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00376', '7110-007-02-12/00376', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00377', '7110-007-02-12/00377', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00378', '7110-007-02-12/00378', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00379', '7110-007-02-12/00379', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00380', '7110-007-02-12/00380', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00381', '7110-007-02-12/00381', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00382', '7110-007-02-12/00382', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00383', '7110-007-02-12/00383', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00384', '7110-007-02-12/00384', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00385', '7110-007-02-12/00385', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00386', '7110-007-02-12/00386', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00387', '7110-007-02-12/00387', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00388', '7110-007-02-12/00387', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00389', '7110-007-02-12/00389', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00390', '7110-007-02-12/00390', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00391', '7110-007-02-12/00391', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00392', '7110-007-02-12/00392', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00393', '7110-007-02-12/00393', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00394', '7110-007-02-12/00394', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00395', '7110-007-02-12/00395', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00396', '7110-007-02-12/00396', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00397', '7110-007-02-12/00397', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00398', '7110-007-02-12/00398', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00399', '7110-007-02-12/00399', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00400', '7110-007-02-12/00400', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00401', '7110-007-02-12/00401', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00402', '7110-007-02-12/00402', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00403', '7110-007-02-12/00403', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00404', '7110-007-02-12/00404', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00405', '7110-007-02-12/00405', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00406', '7110-007-02-12/00406', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00407', '7110-007-02-12/00407', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00408', '7110-007-02-12/00408', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00409', '7110-007-02-12/00409', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00410', '7110-007-02-12/00410', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00411', '7110-007-02-12/00411', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00412', '7110-007-02-12/00412', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00413', '7110-007-02-12/00413', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00414', '7110-007-02-12/00414', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00415', '7110-007-02-12/00415', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00416', '7110-007-02-12/00416', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00417', '7110-007-02-12/00417', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00418', '7110-007-02-12/00418', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00419', '7110-007-02-12/00419', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00420', '7110-007-02-12/00420', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00421', '7110-007-02-12/00421', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00422', '7110-007-02-12/00422', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00423', '7110-007-02-12/00423', 'L0001', 'R0016', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00424', '7110-007-02-12/00424', 'L0001', 'R0018', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00425', '7110-007-02-12/00425', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00426', '7110-007-02-12/00426', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00427', '7110-007-02-12/00427', 'L0001', 'R0017', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00428', '7110-007-02-12/00428', 'L0001', 'R0014', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00429', '7110-007-02-12/00429', 'L0001', 'R0015', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00430', '7110-007-02-12/00430', 'L0001', 'R0004', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00431', '7110-007-02-12/00431', 'L0001', 'R0015', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00432', '7110-007-02-12/00432', 'L0001', 'R0015', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-007-02-12/00433', '7110-007-02-12/00433', 'L0001', 'R0021', 's0003', '0000', 'p0035', '0000-00-00', '0', 0),
('7110-017-01-16/00001', '7110-017-01-16/00001', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00002', '7110-017-01-16/00002', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00003', '7110-017-01-16/00003', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00004', '7110-017-01-16/00004', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00005', '7110-017-01-16/00005', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00006', '7110-017-01-16/00006', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00007', '7110-017-01-16/00007', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00008', '7110-017-01-16/00008', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00009', '7110-017-01-16/00009', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00010', '7110-017-01-16/00010', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00011', '7110-017-01-16/00011', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00012', '7110-017-01-16/00012', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00013', '7110-017-01-16/00013', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00014', '7110-017-01-16/00014', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00015', '7110-017-01-16/00015', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00016', '7110-017-01-16/00016', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00017', '7110-017-01-16/00017', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00018', '7110-017-01-16/00018', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00019', '7110-017-01-16/00019', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00020', '7110-017-01-16/00020', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00021', '7110-017-01-16/00021', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00022', '7110-017-01-16/00022', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-017-01-16/00023', '7110-017-01-16/00023', 'L0001', 'R0003', 's0001', '0000', 'p0018', '0000-00-00', '0', 0),
('7110-020-01-16/00001', '7110-020-01-16/00001', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00002', '7110-020-01-16/00002', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00003', '7110-020-01-16/00003', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00004', '7110-020-01-16/00004', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00005', '7110-020-01-16/00005', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00006', '7110-020-01-16/00006', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00007', '7110-020-01-16/00007', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00008', '7110-020-01-16/00008', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00009', '7110-020-01-16/00009', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00010', '7110-020-01-16/00010', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00011', '7110-020-01-16/00011', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00012', '7110-020-01-16/00012', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00013', '7110-020-01-16/00013', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00014', '7110-020-01-16/00014', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00015', '7110-020-01-16/00015', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00016', '7110-020-01-16/00016', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00017', '7110-020-01-16/00017', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00018', '7110-020-01-16/00018', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00019', '7110-020-01-16/00019', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00020', '7110-020-01-16/00020', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00021', '7110-020-01-16/00021', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00022', '7110-020-01-16/00022', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00023', '7110-020-01-16/00023', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00024', '7110-020-01-16/00024', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00025', '7110-020-01-16/00025', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00026', '7110-020-01-16/00026', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00027', '7110-020-01-16/00027', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00028', '7110-020-01-16/00028', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00029', '7110-020-01-16/00029', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00030', '7110-020-01-16/00030', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00031', '7110-020-01-16/00031', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00032', '7110-020-01-16/00032', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00033', '7110-020-01-16/00033', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00034', '7110-020-01-16/00034', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00035', '7110-020-01-16/00035', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00036', '7110-020-01-16/00036', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00037', '7110-020-01-16/00037', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00038', '7110-020-01-16/00038', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0);
INSERT INTO `t_durable` (`durable_id`, `product_id`, `loc_id`, `room_id`, `status_id`, `holding_id`, `pic_id`, `modify_date`, `checkstatus_id`, `staff_id`) VALUES
('7110-020-01-16/00039', '7110-020-01-16/00039', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00040', '7110-020-01-16/00040', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00041', '7110-020-01-16/00041', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00042', '7110-020-01-16/00042', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00043', '7110-020-01-16/00043', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00044', '7110-020-01-16/00044', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00045', '7110-020-01-16/00045', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00046', '7110-020-01-16/00046', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00047', '7110-020-01-16/00047', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00048', '7110-020-01-16/00048', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00049', '7110-020-01-16/00049', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00050', '7110-020-01-16/00050', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00051', '7110-020-01-16/00051', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00052', '7110-020-01-16/00052', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00053', '7110-020-01-16/00053', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00054', '7110-020-01-16/00054', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00055', '7110-020-01-16/00055', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00056', '7110-020-01-16/00056', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00057', '7110-020-01-16/00057', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00058', '7110-020-01-16/00058', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00059', '7110-020-01-16/00059', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00060', '7110-020-01-16/00060', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00061', '7110-020-01-16/00061', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00062', '7110-020-01-16/00062', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00063', '7110-020-01-16/00063', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00064', '7110-020-01-16/00064', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00065', '7110-020-01-16/00065', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00066', '7110-020-01-16/00066', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00067', '7110-020-01-16/00067', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00068', '7110-020-01-16/00068', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00069', '7110-020-01-16/00069', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00070', '7110-020-01-16/00070', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00071', '7110-020-01-16/00071', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00072', '7110-020-01-16/00072', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00073', '7110-020-01-16/00073', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00074', '7110-020-01-16/00074', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00075', '7110-020-01-16/00075', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00076', '7110-020-01-16/00076', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00077', '7110-020-01-16/00077', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00078', '7110-020-01-16/00078', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00079', '7110-020-01-16/00079', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00080', '7110-020-01-16/00080', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00081', '7110-020-01-16/00081', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00082', '7110-020-01-16/00082', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00083', '7110-020-01-16/00083', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00084', '7110-020-01-16/00084', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00085', '7110-020-01-16/00085', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00086', '7110-020-01-16/00086', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00087', '7110-020-01-16/00087', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00088', '7110-020-01-16/00088', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00089', '7110-020-01-16/00089', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00090', '7110-020-01-16/00090', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00091', '7110-020-01-16/00091', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00092', '7110-020-01-16/00092', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00093', '7110-020-01-16/00093', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00094', '7110-020-01-16/00094', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00095', '7110-020-01-16/00095', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00096', '7110-020-01-16/00096', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00097', '7110-020-01-16/00097', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00098', '7110-020-01-16/00098', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00099', '7110-020-01-16/00099', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-020-01-16/00100', '7110-020-01-16/00100', 'L0003', 'R0028', 's0003', '0000', 'p0030', '0000-00-00', '0', 0),
('7110-023-01-12/00066', '7110-023-01-12/00066', 'L0001', 'R0024', 's0003', '0000', 'p0019', '0000-00-00', '0', 0),
('7110-023-01-12/00067', '7110-023-01-12/00067', 'L0001', 'R0024', 's0003', '0000', 'p0019', '0000-00-00', '0', 0),
('7110-023-01-12/00068', '7110-023-01-12/00068', 'L0001', 'R0024', 's0003', '0000', 'p0019', '0000-00-00', '0', 0),
('7110-023-01-12/00069', '7110-023-01-12/00069', 'L0001', 'R0024', 's0003', '0000', 'p0019', '0000-00-00', '0', 0),
('7110-023-01-12/00070', '7110-023-01-12/00070', 'L0001', 'R0024', 's0003', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-12/00043', '7125-002-02-12/00043', 'L0001', 'R0007', 's0003', '0000', 'p0010', '0000-00-00', '0', 0),
('7125-002-02-16/00001', '7125-002-02-16/00001', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-16/00002', '7125-002-02-16/00002', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-16/00003', '7125-002-02-16/00003', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-16/00004', '7125-002-02-16/00004', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-16/00005', '7125-002-02-16/00005', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-16/00006', '7125-002-02-16/00006', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-16/00007', '7125-002-02-16/00007', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-16/00008', '7125-002-02-16/00008', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-16/00009', '7125-002-02-16/00009', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-16/00010', '7125-002-02-16/00010', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-16/00011', '7125-002-02-16/00011', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-16/00012', '7125-002-02-16/00012', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7125-002-02-16/00013', '7125-002-02-16/00013', 'L0001', 'R0027', 's0001', '0000', 'p0019', '0000-00-00', '0', 0),
('7440-001-04-12/00227', '7440-001-04-12/00227', 'L0001', 'R0022', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00228', '7440-001-04-12/00228', 'L0001', 'R0022', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00445', '7440-001-04-12/00445', 'L0001', 'R0007', 's0003', '0000', 'p0011', '0000-00-00', '0', 0),
('7440-001-04-12/00452', '7440-001-04-12/00452', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00453', '7440-001-04-12/00453', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00454', '7440-001-04-12/00454', 'L0001', 'R0015', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00455', '7440-001-04-12/00455', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00456', '7440-001-04-12/00456', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00457', '7440-001-04-12/00457', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00458', '7440-001-04-12/00458', 'L0001', 'R0005', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00459', '7440-001-04-12/00459', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00460', '7440-001-04-12/00460', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00461', '7440-001-04-12/00461', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00462', '7440-001-04-12/00462', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00463', '7440-001-04-12/00463', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00464', '7440-001-04-12/00464', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00465', '7440-001-04-12/00465', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00466', '7440-001-04-12/00466', 'L0001', 'R0018', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00467', '7440-001-04-12/00467', 'L0001', 'R0005', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00468', '7440-001-04-12/00468', 'L0001', 'R0018', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00469', '7440-001-04-12/00469', 'L0001', 'R0018', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00470', '7440-001-04-12/00470', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00471', '7440-001-04-12/00471', 'L0001', 'R0005', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00472', '7440-001-04-12/00472', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00473', '7440-001-04-12/00473', 'L0001', 'R0015', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00474', '7440-001-04-12/00474', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00475', '7440-001-04-12/00475', 'L0001', 'R0015', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00476', '7440-001-04-12/00476', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00477', '7440-001-04-12/00477', 'L0001', 'R0018', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00478', '7440-001-04-12/00478', 'L0001', 'R0015', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00479', '7440-001-04-12/00479', 'L0001', 'R0011', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00480', '7440-001-04-12/00480', 'L0001', 'R0015', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00481', '7440-001-04-12/00481', 'L0001', 'R0014', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00482', '7440-001-04-12/00482', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00483', '7440-001-04-12/00483', 'L0001', 'R0021', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00484', '7440-001-04-12/00484', 'L0001', 'R0018', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-04-12/00485', '7440-001-04-12/00485', 'L0001', 'R0018', 's0003', '0000', 'p0024', '0000-00-00', '0', 0),
('7440-001-05-12/00166', '7440-001-05-12/00166', 'L0001', 'R0010', 's0003', '0000', 'p0012', '0000-00-00', '0', 0),
('7440-001-05-12/00167', '7440-001-05-12/00167', 'L0001', 'R0006', 's0003', '0000', 'p0012', '0000-00-00', '0', 0),
('7440-001-05-12/00168', '7440-001-05-12/00168', 'L0001', 'R0007', 's0003', '0000', 'p0012', '0000-00-00', '0', 0),
('7440-001-05-12/00169', '7440-001-05-12/00169', 'L0001', 'R0007', 's0003', '0000', 'p0012', '0000-00-00', '0', 0),
('7440-001-05-12/00170', '7440-001-05-12/00170', 'L0001', 'R0007', 's0003', '0000', 'p0013', '0000-00-00', '0', 0),
('7440-001-05-12/00171', '7440-001-05-12/00171', 'L0001', 'R0007', 's0003', '0000', 'p0014', '0000-00-00', '0', 0),
('7440-001-05-12/00172', '7440-001-05-12/00172', 'L0001', 'R0008', 's0003', '0000', 'p0020', '0000-00-00', '0', 0),
('7440-001-05-12/00173', '7440-001-05-12/00173', 'L0001', 'R0008', 's0003', '0000', 'p0020', '0000-00-00', '0', 0),
('7440-002-02-12/00031', '7440-002-02-12/00031', 'L0001', 'R0014', 's0003', '0000', 'p0036', '0000-00-00', '0', 0),
('7440-002-02-12/00032', '7440-002-02-12/00032', 'L0001', 'R0025', 's0003', '0000', 'p0036', '0000-00-00', '0', 0),
('7440-008-01-12/00004', '7440-008-01-12/00004', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00005', '7440-008-01-12/00005', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00006', '7440-008-01-12/00006', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00007', '7440-008-01-12/00007', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00008', '7440-008-01-12/00008', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00009', '7440-008-01-12/00009', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00010', '7440-008-01-12/00010', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00011', '7440-008-01-12/00011', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00012', '7440-008-01-12/00012', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00013', '7440-008-01-12/00013', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00014', '7440-008-01-12/00014', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00015', '7440-008-01-12/00015', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00016', '7440-008-01-12/00016', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00017', '7440-008-01-12/00017', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00018', '7440-008-01-12/00018', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00019', '7440-008-01-12/00019', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00020', '7440-008-01-12/00020', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00021', '7440-008-01-12/00021', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00022', '7440-008-01-12/00022', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00023', '7440-008-01-12/00023', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-008-01-12/00035', '7440-008-01-12/00035', 'L0001', 'R0019', 's0003', '0000', 'p0021', '0000-00-00', '0', 0),
('7440-008-01-12/00036', '7440-008-01-12/00036', 'L0001', 'R0019', 's0003', '0000', 'p0021', '0000-00-00', '0', 0),
('7440-008-01-12/00037', '7440-008-01-12/00037', 'L0001', 'R0019', 's0003', '0000', 'p0021', '0000-00-00', '0', 0),
('7440-008-01-12/00038', '7440-008-01-12/00038', 'L0001', 'R0019', 's0003', '0000', 'p0021', '0000-00-00', '0', 0),
('7440-008-01-12/00039', '7440-008-01-12/00039', 'L0001', 'R0019', 's0003', '0000', 'p0021', '0000-00-00', '0', 0),
('7440-008-01-12/00040', '7440-008-01-12/00040', 'L0001', 'R0008', 's0003', '0000', 'p0022', '0000-00-00', '0', 0),
('7440-009-07-12/00001', '7440-009-07-12/00001', 'L0001', 'R0020', 's0003', '0000', 'p0027', '0000-00-00', '0', 0),
('7440-009-07-12/00002', '7440-009-07-12/00002', 'L0001', 'R0020', 's0003', '0000', 'p0027', '0000-00-00', '0', 0),
('7440-009-07-12/00003', '7440-009-07-12/00003', 'L0001', 'R0020', 's0003', '0000', 'p0027', '0000-00-00', '0', 0),
('7440-009-07-12/00004', '7440-009-07-12/00004', 'L0001', 'R0020', 's0003', '0000', 'p0027', '0000-00-00', '0', 0),
('7440-009-07-12/00005', '7440-009-07-12/00005', 'L0001', 'R0020', 's0003', '0000', 'p0027', '0000-00-00', '0', 0),
('7440-009-07-12/00006', '7440-009-07-12/00006', 'L0001', 'R0020', 's0003', '0000', 'p0028', '0000-00-00', '0', 0),
('7440-009-07-12/00007', '7440-009-07-12/00007', 'L0001', 'R0020', 's0003', '0000', 'p0028', '0000-00-00', '0', 0),
('7440-009-07-12/00008', '7440-009-07-12/00008', 'L0001', 'R0020', 's0003', '0000', 'p0028', '0000-00-00', '0', 0),
('7440-009-08-12/00001', '7440-009-08-12/00001', 'L0001', 'R0023', 's0003', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-12/00002', '7440-009-08-12/00002', 'L0001', 'R0023', 's0003', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-12/00003', '7440-009-08-12/00003', 'L0001', 'R0023', 's0003', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-12/00004', '7440-009-08-12/00004', 'L0001', 'R0023', 's0003', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-12/00005', '7440-009-08-12/00005', 'L0001', 'R0023', 's0003', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-12/00006', '7440-009-08-12/00006', 'L0001', 'R0023', 's0003', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-12/00007', '7440-009-08-12/00007', 'L0001', 'R0023', 's0003', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-12/00008', '7440-009-08-12/00008', 'L0001', 'R0023', 's0003', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-12/00009', '7440-009-08-12/00009', 'L0001', 'R0023', 's0003', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-12/00010', '7440-009-08-12/00010', 'L0001', 'R0023', 's0003', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00001', '7440-009-08-16/00001', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00002', '7440-009-08-16/00002', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00003', '7440-009-08-16/00003', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00004', '7440-009-08-16/00004', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00005', '7440-009-08-16/00005', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00006', '7440-009-08-16/00006', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00007', '7440-009-08-16/00007', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00008', '7440-009-08-16/00008', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00009', '7440-009-08-16/00009', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00010', '7440-009-08-16/00010', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00011', '7440-009-08-16/00011', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00012', '7440-009-08-16/00012', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00013', '7440-009-08-16/00013', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00014', '7440-009-08-16/00014', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00015', '7440-009-08-16/00015', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00016', '7440-009-08-16/00016', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00017', '7440-009-08-16/00017', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00018', '7440-009-08-16/00018', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00019', '7440-009-08-16/00019', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00020', '7440-009-08-16/00020', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00021', '7440-009-08-16/00021', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00022', '7440-009-08-16/00022', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00023', '7440-009-08-16/00023', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00024', '7440-009-08-16/00024', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00025', '7440-009-08-16/00025', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-009-08-16/00026', '7440-009-08-16/00026', 'L0001', 'R0003', 's0001', '0000', 'p0025', '0000-00-00', '0', 0),
('7440-012-01-12/00027', '7440-012-01-12/00027', 'L0001', 'R0009', 's0003', '0000', 'p0011', '0000-00-00', '0', 0),
('7440-017-02-12/00001', '7440-017-02-12/00001', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-017-02-12/00002', '7440-017-02-12/00002', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-017-02-12/00003', '7440-017-02-12/00003', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-017-02-12/00004', '7440-017-02-12/00004', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-017-02-12/00005', '7440-017-02-12/00005', 'L0001', 'R0003', 's0003', '0000', 'p0001', '0000-00-00', '0', 0),
('7440-018-10-12/00001', '7440-018-10-12/00001', 'L0001', 'R0008', 's0003', '0000', 'p0014', '0000-00-00', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_durable_copy`
--

CREATE TABLE `t_durable_copy` (
  `durable_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `loc_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `room_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `holding_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pic_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `modify_date` date NOT NULL,
  `checkstatus_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `staff_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_durable_copy`
--

INSERT INTO `t_durable_copy` (`durable_id`, `product_id`, `loc_id`, `room_id`, `status_id`, `holding_id`, `pic_id`, `modify_date`, `checkstatus_id`, `staff_id`) VALUES
('3670-001-01-12/00003', '3670-001-01-12/00003', 'L0001', 'R0029', 's0001', '0000', 'p0001', '2019-05-27', '0', 0),
('5210-003-01-12/00022', '5210-003-01-12/00022', 'L0001', 'R0018', 's0003', '0000', 'p0002', '2019-05-28', '0', 0),
('5210-003-01-16/00006', '5210-003-01-16/00006', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00007', '5210-003-01-16/00007', 'L0003', 'R0027', 's0001', '1111', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00008', '5210-003-01-16/00008', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00009', '5210-003-01-16/00009', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00010', '5210-003-01-16/00010', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00011', '5210-003-01-16/00011', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00012', '5210-003-01-16/00012', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00013', '5210-003-01-16/00013', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00014', '5210-003-01-16/00014', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00015', '5210-003-01-16/00015', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00016', '5210-003-01-16/00016', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00017', '5210-003-01-16/00017', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00018', '5210-003-01-16/00018', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00019', '5210-003-01-16/00019', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00020', '5210-003-01-16/00020', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00021', '5210-003-01-16/00021', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00022', '5210-003-01-16/00022', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00023', '5210-003-01-16/00023', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00024', '5210-003-01-16/00024', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00025', '5210-003-01-16/00025', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00026', '5210-003-01-16/00026', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00027', '5210-003-01-16/00027', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00028', '5210-003-01-16/00028', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00029', '5210-003-01-16/00029', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00030', '5210-003-01-16/00030', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00031', '5210-003-01-16/00031', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00032', '5210-003-01-16/00032', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00033', '5210-003-01-16/00033', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00034', '5210-003-01-16/00034', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5210-003-01-16/00035', '5210-003-01-16/00035', 'L0003', 'R0027', 's0001', '0000', 'p0002', '0000-00-00', '0', 0),
('5280-003-22-16/00031', '5280-003-22-16/00031', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00032', '5280-003-22-16/00032', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00033', '5280-003-22-16/00033', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00034', '5280-003-22-16/00034', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00035', '5280-003-22-16/00035', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00036', '5280-003-22-16/00036', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00037', '5280-003-22-16/00037', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00038', '5280-003-22-16/00038', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00039', '5280-003-22-16/00039', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00040', '5280-003-22-16/00040', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00041', '5280-003-22-16/00041', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00042', '5280-003-22-16/00042', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00043', '5280-003-22-16/00043', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00044', '5280-003-22-16/00044', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5280-003-22-16/00045', '5280-003-22-16/00045', 'L0003', 'R0027', 's0001', '0000', 'p0005', '0000-00-00', '0', 0),
('5905-005-01-16/00001', '5905-005-01-16/00001', 'L0003', 'R0026', 's0001', '0000', 'p0029', '0000-00-00', '0', 0),
('5975-001-01-12/00001', '5975-001-01-12/00001', 'L0001', 'R0001', 's0003', '0000', 'p0023', '0000-00-00', '0', 0),
('5999-006-08-16/00001', '5999-006-08-16/00001', 'L0003', 'R0026', 's0001', '0000', 'p0001', '0000-00-00', '0', 0),
('6105-001-01-16/00001', '6105-001-01-16/00001', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00002', '6105-001-01-16/00002', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00003', '6105-001-01-16/00003', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00004', '6105-001-01-16/00004', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00005', '6105-001-01-16/00005', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00006', '6105-001-01-16/00006', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00007', '6105-001-01-16/00007', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00008', '6105-001-01-16/00008', 'L0001', 'R0026', 's0001', '0000', 'p0032', '0000-00-00', '0', 0),
('6105-001-01-16/00009', '6105-001-01-16/00009', 'L0001', 'R0026', 's0001', '0000', 'p0033', '0000-00-00', '0', 0),
('6105-001-01-16/00010', '6105-001-01-16/00010', 'L0001', 'R0026', 's0001', '0000', 'p0033', '0000-00-00', '0', 0),
('6110-010-09-12/00001', '6110-010-09-12/00001', 'L0001', 'R0008', 's0003', '0000', 'p0010', '0000-00-00', '0', 0),
('6110-010-11-12/00001', '6110-010-11-12/00001', 'L0001', 'R0012', 's0002', '0000', 'p0034', '0000-00-00', '0', 0),
('6150-006-01-16/00001', '6150-006-01-16/00001', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00002', '6150-006-01-16/00002', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00003', '6150-006-01-16/00003', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00004', '6150-006-01-16/00004', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00005', '6150-006-01-16/00005', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00006', '6150-006-01-16/00006', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00007', '6150-006-01-16/00007', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00008', '6150-006-01-16/00008', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00009', '6150-006-01-16/00009', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00010', '6150-006-01-16/00010', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00011', '6150-006-01-16/00011', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00012', '6150-006-01-16/00012', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00013', '6150-006-01-16/00013', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00014', '6150-006-01-16/00014', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00015', '6150-006-01-16/00015', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00016', '6150-006-01-16/00016', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00017', '6150-006-01-16/00017', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00018', '6150-006-01-16/00018', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00019', '6150-006-01-16/00019', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00020', '6150-006-01-16/00020', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00021', '6150-006-01-16/00021', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00022', '6150-006-01-16/00022', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00023', '6150-006-01-16/00023', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00024', '6150-006-01-16/00024', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00025', '6150-006-01-16/00025', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00026', '6150-006-01-16/00026', 'L0001', 'R0027', 's0001', '0000', 'p0031', '0000-00-00', '0', 0),
('6150-006-01-16/00027', '6150-006-01-16/00027', 'L0003', 'R0027', 's0001', '1111', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00028', '6150-006-01-16/00028', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00029', '6150-006-01-16/00029', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00030', '6150-006-01-16/00030', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00031', '6150-006-01-16/00031', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00032', '6150-006-01-16/00032', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00033', '6150-006-01-16/00033', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00034', '6150-006-01-16/00034', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00035', '6150-006-01-16/00035', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00036', '6150-006-01-16/00036', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00037', '6150-006-01-16/00037', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0),
('6150-006-01-16/00038', '6150-006-01-16/00038', 'L0003', 'R0027', 's0001', '0000', 'p0004', '0000-00-00', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `unit_detail` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `unit_detail`) VALUES
('1', 'เครื่อง'),
('2', 'อัน'),
('3', 'ตัว'),
('4', 'ชิ้น'),
('5', '-');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boxes`
--
ALTER TABLE `boxes`
  ADD PRIMARY KEY (`box_id`),
  ADD KEY `b_status_id` (`b_status_id`);

--
-- Indexes for table `box_status`
--
ALTER TABLE `box_status`
  ADD PRIMARY KEY (`b_status_id`);

--
-- Indexes for table `build_room`
--
ALTER TABLE `build_room`
  ADD PRIMARY KEY (`room_id`,`loc_id`),
  ADD KEY `loc_id` (`loc_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `checkstatus`
--
ALTER TABLE `checkstatus`
  ADD PRIMARY KEY (`checkstatus_id`);

--
-- Indexes for table `confirm_status`
--
ALTER TABLE `confirm_status`
  ADD PRIMARY KEY (`confirm_status_id`);

--
-- Indexes for table `durable_borrowlist`
--
ALTER TABLE `durable_borrowlist`
  ADD PRIMARY KEY (`b_id`),
  ADD UNIQUE KEY `durable_id_2` (`durable_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `confirm_status_id` (`confirm_status_id`),
  ADD KEY `durable_id` (`durable_id`);

--
-- Indexes for table `durable_picture`
--
ALTER TABLE `durable_picture`
  ADD PRIMARY KEY (`pic_id`);

--
-- Indexes for table `holding`
--
ALTER TABLE `holding`
  ADD PRIMARY KEY (`holding_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`loc_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `type_id` (`types_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `staff_status_id` (`staff_status_id`);

--
-- Indexes for table `staff_status`
--
ALTER TABLE `staff_status`
  ADD PRIMARY KEY (`staff_status_id`);

--
-- Indexes for table `status_durable`
--
ALTER TABLE `status_durable`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`tools_id`),
  ADD KEY `box_id` (`box_id`);

--
-- Indexes for table `tools_borrowlist`
--
ALTER TABLE `tools_borrowlist`
  ADD PRIMARY KEY (`b_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `confirm_status_id` (`confirm_status_id`),
  ADD KEY `box_id` (`box_id`) USING BTREE,
  ADD KEY `confirm_status_id_2` (`confirm_status_id`);

--
-- Indexes for table `type_product`
--
ALTER TABLE `type_product`
  ADD PRIMARY KEY (`types_id`);

--
-- Indexes for table `t_durable`
--
ALTER TABLE `t_durable`
  ADD PRIMARY KEY (`durable_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `holding_id` (`holding_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `loc_id` (`loc_id`),
  ADD KEY `pic_id` (`pic_id`) USING BTREE,
  ADD KEY `pic_id_2` (`pic_id`);

--
-- Indexes for table `t_durable_copy`
--
ALTER TABLE `t_durable_copy`
  ADD PRIMARY KEY (`durable_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `holding_id` (`holding_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `loc_id` (`loc_id`),
  ADD KEY `pic_id` (`pic_id`) USING BTREE,
  ADD KEY `pic_id_2` (`pic_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `durable_borrowlist`
--
ALTER TABLE `durable_borrowlist`
  MODIFY `b_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `tools_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tools_borrowlist`
--
ALTER TABLE `tools_borrowlist`
  MODIFY `b_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boxes`
--
ALTER TABLE `boxes`
  ADD CONSTRAINT `box_status` FOREIGN KEY (`b_status_id`) REFERENCES `box_status` (`b_status_id`);

--
-- Constraints for table `build_room`
--
ALTER TABLE `build_room`
  ADD CONSTRAINT `build_room_ibfk_1` FOREIGN KEY (`loc_id`) REFERENCES `locations` (`loc_id`);

--
-- Constraints for table `durable_borrowlist`
--
ALTER TABLE `durable_borrowlist`
  ADD CONSTRAINT `confirm_stat` FOREIGN KEY (`confirm_status_id`) REFERENCES `confirm_status` (`confirm_status_id`),
  ADD CONSTRAINT `durables_id` FOREIGN KEY (`durable_id`) REFERENCES `t_durable` (`durable_id`),
  ADD CONSTRAINT `students_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `type_id` FOREIGN KEY (`types_id`) REFERENCES `type_product` (`types_id`),
  ADD CONSTRAINT `unit_id` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_status_id` FOREIGN KEY (`staff_status_id`) REFERENCES `staff_status` (`staff_status_id`);

--
-- Constraints for table `tools`
--
ALTER TABLE `tools`
  ADD CONSTRAINT `box_id` FOREIGN KEY (`box_id`) REFERENCES `boxes` (`box_id`);

--
-- Constraints for table `tools_borrowlist`
--
ALTER TABLE `tools_borrowlist`
  ADD CONSTRAINT `t_box_id` FOREIGN KEY (`box_id`) REFERENCES `boxes` (`box_id`);

--
-- Constraints for table `t_durable`
--
ALTER TABLE `t_durable`
  ADD CONSTRAINT `holding_id` FOREIGN KEY (`holding_id`) REFERENCES `holding` (`holding_id`),
  ADD CONSTRAINT `loc_id` FOREIGN KEY (`loc_id`) REFERENCES `locations` (`loc_id`),
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `room_id` FOREIGN KEY (`room_id`) REFERENCES `build_room` (`room_id`),
  ADD CONSTRAINT `status_id` FOREIGN KEY (`status_id`) REFERENCES `status_durable` (`status_id`),
  ADD CONSTRAINT `t_pic_id` FOREIGN KEY (`pic_id`) REFERENCES `durable_picture` (`pic_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
