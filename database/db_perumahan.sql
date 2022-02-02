-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 02, 2022 at 02:11 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perumahan`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_calon_pemilik`
--

CREATE TABLE `tb_calon_pemilik` (
  `id` int(11) NOT NULL,
  `konsumen_id` int(11) NOT NULL,
  `jumlah_dp` int(11) NOT NULL,
  `bukti_transfer` varchar(255) NOT NULL,
  `rumah_id` int(11) NOT NULL,
  `status_pengajuan` enum('1','2','3','4','5','6','7') NOT NULL,
  `tanggal_pengajuan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tanggal_update_bukti_transfer` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_direktur`
--

CREATE TABLE `tb_direktur` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_foto_tipe_rumah`
--

CREATE TABLE `tb_foto_tipe_rumah` (
  `id` int(11) NOT NULL,
  `tipe_rumah_id` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_foto_tipe_rumah`
--

INSERT INTO `tb_foto_tipe_rumah` (`id`, `tipe_rumah_id`, `foto`) VALUES
(1, 1, 'rumah1.jpg'),
(2, 1, 'rumah2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_konsumen`
--

CREATE TABLE `tb_konsumen` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_konsumen`
--

INSERT INTO `tb_konsumen` (`id`, `user_id`, `nama_lengkap`, `alamat`, `no_hp`, `email`) VALUES
(1, 1, 'User Konsumen 1', 'Pekanbaru', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_marketing_perumahan`
--

CREATE TABLE `tb_marketing_perumahan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `perumahan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_perumahan`
--

CREATE TABLE `tb_master_perumahan` (
  `id` int(11) NOT NULL,
  `nama_perumahan` varchar(100) NOT NULL,
  `luas_tanah` double NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_perumahan`
--

INSERT INTO `tb_master_perumahan` (`id`, `nama_perumahan`, `luas_tanah`, `alamat`, `keterangan`) VALUES
(1, 'Griya Insan Utama', 216, 'Jalan pepaya ujung Perumahan Btn mutiara', 'Dekat dengan pusat pembelanjaan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pegawai`
--

INSERT INTO `tb_pegawai` (`id`, `user_id`, `nama_lengkap`, `email`, `alamat`, `no_hp`) VALUES
(1, 1, 'User Pegawai 1', 'userpegawai1', 'Pekanbaru', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tipe_perumahan`
--

CREATE TABLE `tb_tipe_perumahan` (
  `id` int(11) NOT NULL,
  `nama_tipe` varchar(50) NOT NULL,
  `ukuran` varchar(20) NOT NULL,
  `pondasi` varchar(50) NOT NULL,
  `dinding` varchar(50) NOT NULL,
  `lantai` varchar(50) NOT NULL,
  `plafon` varchar(50) NOT NULL,
  `pintu_depan` varchar(50) NOT NULL,
  `dinding_km` varchar(50) NOT NULL,
  `kusen` varchar(50) NOT NULL,
  `r_atap` varchar(50) NOT NULL,
  `p_atap` varchar(50) NOT NULL,
  `sanitasi` varchar(50) NOT NULL,
  `listrik` varchar(50) NOT NULL,
  `air` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `jumlah_unit` varchar(50) NOT NULL,
  `perumahan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tipe_perumahan`
--

INSERT INTO `tb_tipe_perumahan` (`id`, `nama_tipe`, `ukuran`, `pondasi`, `dinding`, `lantai`, `plafon`, `pintu_depan`, `dinding_km`, `kusen`, `r_atap`, `p_atap`, `sanitasi`, `listrik`, `air`, `harga`, `jumlah_unit`, `perumahan_id`) VALUES
(1, 'Tipe 36', '250', 'Beton', 'Plafon', 'Keramik', 'Batu + Dinding', 'Kayu Jati', 'Kayu Meranti', 'Besi Padat', 'Genteng', 'Genteng + Besi', 'PAM', 'PLN 3000 KWH', 'PAM', '35000000', '50', 1),
(2, 'Tipe  21/24', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(3, 'Tipe 45', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(4, 'Tipe  60', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(5, 'Tipe 70', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(6, 'Tipe 90', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(7, 'Tipe 120', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` enum('direktur','pegawai','konsumen') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`, `last_login`, `role`) VALUES
(1, 'user', '$2y$10$PKw1F3kLRdPiCX0q0G8lweuwWtCu4qpLoMRyCvNacYjfomm1DZv7K', '2022-02-02 07:58:57', 'konsumen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_calon_pemilik`
--
ALTER TABLE `tb_calon_pemilik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_direktur`
--
ALTER TABLE `tb_direktur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_foto_tipe_rumah`
--
ALTER TABLE `tb_foto_tipe_rumah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_konsumen`
--
ALTER TABLE `tb_konsumen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_marketing_perumahan`
--
ALTER TABLE `tb_marketing_perumahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_master_perumahan`
--
ALTER TABLE `tb_master_perumahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_tipe_perumahan`
--
ALTER TABLE `tb_tipe_perumahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_calon_pemilik`
--
ALTER TABLE `tb_calon_pemilik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_direktur`
--
ALTER TABLE `tb_direktur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_foto_tipe_rumah`
--
ALTER TABLE `tb_foto_tipe_rumah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_konsumen`
--
ALTER TABLE `tb_konsumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_marketing_perumahan`
--
ALTER TABLE `tb_marketing_perumahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_master_perumahan`
--
ALTER TABLE `tb_master_perumahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_tipe_perumahan`
--
ALTER TABLE `tb_tipe_perumahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
