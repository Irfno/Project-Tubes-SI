-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 12:03 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_gudang_beras`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_beras`
--

CREATE TABLE `data_beras` (
  `kode_beras` int(10) NOT NULL,
  `nama_beras` varchar(20) NOT NULL,
  `jenis_beras` varchar(20) NOT NULL,
  `harga_beras` int(20) NOT NULL,
  `stock_beras` int(255) NOT NULL,
  `id_kategori_beras` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_gudang_beras`
--

CREATE TABLE `data_gudang_beras` (
  `id_gudang_beras` int(10) NOT NULL,
  `nama_gudang_beras` varchar(20) NOT NULL,
  `alamat_gudang_beras` varchar(50) NOT NULL,
  `kapasitas_gudang` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_jadwal_pengiriman`
--

CREATE TABLE `data_jadwal_pengiriman` (
  `id_jadwal` int(10) NOT NULL,
  `hari_pengiriman` varchar(20) NOT NULL,
  `jam_pengiriman` time(6) NOT NULL,
  `id_pengiriman` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_kategori_beras`
--

CREATE TABLE `data_kategori_beras` (
  `id_kategori_beras` int(10) NOT NULL,
  `nama_kategori_beras` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_outlet_cabang`
--

CREATE TABLE `data_outlet_cabang` (
  `id_outlet` int(10) NOT NULL,
  `nama_outlet` varchar(30) NOT NULL,
  `alamat_outlet` varchar(50) NOT NULL,
  `id_gudang_beras` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_pegawai`
--

CREATE TABLE `data_pegawai` (
  `id_pegawai` int(10) NOT NULL,
  `nama_pegawai` varchar(20) NOT NULL,
  `alamat_pegawai` varchar(50) NOT NULL,
  `nomor_telepon` int(20) NOT NULL,
  `gaji_pegawai` varchar(50) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `id_supir` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_pengguna`
--

CREATE TABLE `data_pengguna` (
  `id_pengguna` int(10) NOT NULL,
  `nama_pengguna` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `id_pegawai` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_pengiriman`
--

CREATE TABLE `data_pengiriman` (
  `id_pengiriman` int(10) NOT NULL,
  `tanggal_pengiriman` date NOT NULL,
  `id_gudang_beras` int(10) NOT NULL,
  `id_outlet` int(10) NOT NULL,
  `no_polisi` int(10) NOT NULL,
  `id_supir` int(10) NOT NULL,
  `id_rute` int(10) NOT NULL,
  `kode_beras` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_rute`
--

CREATE TABLE `data_rute` (
  `id_rute` int(10) NOT NULL,
  `nama_rute` varchar(20) NOT NULL,
  `jarak_rute` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_stock_beras`
--

CREATE TABLE `data_stock_beras` (
  `id_stock` int(20) NOT NULL,
  `jumlah_stock` int(20) NOT NULL,
  `id_gudang_beras` int(20) NOT NULL,
  `kode_beras` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_supir`
--

CREATE TABLE `data_supir` (
  `id_supir` int(10) NOT NULL,
  `nama_supir` varchar(20) NOT NULL,
  `no_telepon` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_truck`
--

CREATE TABLE `data_truck` (
  `no_polisi` int(10) NOT NULL,
  `merk_truk` varchar(20) NOT NULL,
  `kapasitas_muatan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_beras`
--
ALTER TABLE `data_beras`
  ADD PRIMARY KEY (`kode_beras`),
  ADD KEY `id_kategori_beras` (`id_kategori_beras`);

--
-- Indexes for table `data_gudang_beras`
--
ALTER TABLE `data_gudang_beras`
  ADD PRIMARY KEY (`id_gudang_beras`);

--
-- Indexes for table `data_jadwal_pengiriman`
--
ALTER TABLE `data_jadwal_pengiriman`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_pengiriman` (`id_pengiriman`);

--
-- Indexes for table `data_kategori_beras`
--
ALTER TABLE `data_kategori_beras`
  ADD PRIMARY KEY (`id_kategori_beras`);

--
-- Indexes for table `data_outlet_cabang`
--
ALTER TABLE `data_outlet_cabang`
  ADD PRIMARY KEY (`id_outlet`),
  ADD KEY `data_outlet_cabang_ibfk_1` (`id_gudang_beras`);

--
-- Indexes for table `data_pegawai`
--
ALTER TABLE `data_pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_supir` (`id_supir`);

--
-- Indexes for table `data_pengguna`
--
ALTER TABLE `data_pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `data_pengiriman`
--
ALTER TABLE `data_pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`),
  ADD KEY `id_gudang_beras` (`id_gudang_beras`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `no_polisi` (`no_polisi`),
  ADD KEY `id_supir` (`id_supir`),
  ADD KEY `data_pengirima_ibfk_5` (`id_rute`),
  ADD KEY `data_pengiriman_ibfk_5` (`kode_beras`);

--
-- Indexes for table `data_rute`
--
ALTER TABLE `data_rute`
  ADD PRIMARY KEY (`id_rute`);

--
-- Indexes for table `data_stock_beras`
--
ALTER TABLE `data_stock_beras`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `id_gudang_beras` (`id_gudang_beras`),
  ADD KEY `kode_beras` (`kode_beras`);

--
-- Indexes for table `data_supir`
--
ALTER TABLE `data_supir`
  ADD PRIMARY KEY (`id_supir`);

--
-- Indexes for table `data_truck`
--
ALTER TABLE `data_truck`
  ADD PRIMARY KEY (`no_polisi`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_beras`
--
ALTER TABLE `data_beras`
  ADD CONSTRAINT `data_beras_ibfk_1` FOREIGN KEY (`id_kategori_beras`) REFERENCES `data_kategori_beras` (`id_kategori_beras`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_jadwal_pengiriman`
--
ALTER TABLE `data_jadwal_pengiriman`
  ADD CONSTRAINT `data_jadwal_pengiriman_ibfk_1` FOREIGN KEY (`id_pengiriman`) REFERENCES `data_pengiriman` (`id_pengiriman`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_outlet_cabang`
--
ALTER TABLE `data_outlet_cabang`
  ADD CONSTRAINT `data_outlet_cabang_ibfk_1` FOREIGN KEY (`id_gudang_beras`) REFERENCES `data_gudang_beras` (`id_gudang_beras`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_pegawai`
--
ALTER TABLE `data_pegawai`
  ADD CONSTRAINT `data_pegawai_ibfk_1` FOREIGN KEY (`id_supir`) REFERENCES `data_supir` (`id_supir`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_pengguna`
--
ALTER TABLE `data_pengguna`
  ADD CONSTRAINT `data_pengguna_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `data_pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_pengiriman`
--
ALTER TABLE `data_pengiriman`
  ADD CONSTRAINT `data_pengirima_ibfk_5` FOREIGN KEY (`id_rute`) REFERENCES `data_rute` (`id_rute`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_pengiriman_ibfk_1` FOREIGN KEY (`id_gudang_beras`) REFERENCES `data_gudang_beras` (`id_gudang_beras`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_pengiriman_ibfk_2` FOREIGN KEY (`id_outlet`) REFERENCES `data_outlet_cabang` (`id_outlet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_pengiriman_ibfk_3` FOREIGN KEY (`no_polisi`) REFERENCES `data_truck` (`no_polisi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_pengiriman_ibfk_4` FOREIGN KEY (`id_supir`) REFERENCES `data_supir` (`id_supir`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_pengiriman_ibfk_5` FOREIGN KEY (`kode_beras`) REFERENCES `data_beras` (`kode_beras`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_stock_beras`
--
ALTER TABLE `data_stock_beras`
  ADD CONSTRAINT `data_stock_beras_ibfk_2` FOREIGN KEY (`id_gudang_beras`) REFERENCES `data_gudang_beras` (`id_gudang_beras`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_stock_beras_ibfk_3` FOREIGN KEY (`kode_beras`) REFERENCES `data_beras` (`kode_beras`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
