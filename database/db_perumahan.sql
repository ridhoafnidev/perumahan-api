-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2022 at 01:50 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

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
  `tipe_perumahan_id` int(11) DEFAULT NULL,
  `jumlah_dp` int(11) NOT NULL,
  `bukti_transfer` varchar(255) NOT NULL,
  `rumah_id` int(11) NOT NULL,
  `status_pengajuan_id` int(11) DEFAULT NULL,
  `tanggal_pengajuan` timestamp NOT NULL DEFAULT current_timestamp(),
  `tanggal_update_bukti_transfer` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_calon_pemilik`
--

INSERT INTO `tb_calon_pemilik` (`id`, `konsumen_id`, `tipe_perumahan_id`, `jumlah_dp`, `bukti_transfer`, `rumah_id`, `status_pengajuan_id`, `tanggal_pengajuan`, `tanggal_update_bukti_transfer`) VALUES
(1, 1, 1, 10000000, 'img.png', 1, 4, '2022-02-02 15:20:34', NULL),
(3, 1, 8, 10000000, 'img.png', 1, 5, '2022-02-06 03:05:30', NULL),
(8, 4, 1, 1000000000, '1644591211_IMG_20220211_215329046.jpg', 1, 1, '2022-02-11 14:53:31', NULL);

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

--
-- Dumping data for table `tb_direktur`
--

INSERT INTO `tb_direktur` (`id`, `user_id`, `nama_lengkap`, `alamat`, `email`, `no_hp`) VALUES
(1, 16, 'direktur', 'Jl. direktur 1', 'direktur@gmail.com', '0892301092');

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
(2, 1, 'rumah2.jpg'),
(3, 8, 'rumah1.jpg'),
(4, 8, 'rumah2.jpg'),
(5, 9, 'rumah1.jpg'),
(6, 9, 'rumah2.jpg'),
(7, 10, 'rumah1.jpg'),
(8, 10, 'rumah2.jpg'),
(9, 11, 'rumah1.jpg'),
(10, 11, 'rumah2.jpg'),
(11, 12, 'rumah1.jpg'),
(12, 12, 'rumah2.jpg');

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
(1, 1, 'Abdul Hafiz Ramadan', 'Pekanbaru', '082201001012', 'abdul@gmail.com'),
(4, 12, 'Konsumen', 'Jl. Konsumen 1', '0892301092', 'konsumen@gmail.com'),
(5, 13, 'Karyawan', 'Jl. Karyawan 1', '0892301092', 'karyawan@gmail.com'),
(6, 17, 'konsumen 1', 'Simpang Kanan', '0822264848454', 'konsumen1@gmail.com');

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
  `tipe_perumahan_id` int(11) DEFAULT NULL,
  `nama_perumahan` varchar(100) NOT NULL,
  `luas_tanah` double NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_perumahan`
--

INSERT INTO `tb_master_perumahan` (`id`, `tipe_perumahan_id`, `nama_perumahan`, `luas_tanah`, `alamat`, `keterangan`) VALUES
(1, 1, 'Griya Insan Utama', 216, 'Jalan pepaya ujung Perumahan Btn mutiara', 'Dekat dengan pusat pembelanjaan'),
(2, 1, 'Mas Insan Center', 300, 'Jalan bangao dekat masjid agung jaya', 'Dekat dengan unri'),
(3, 8, 'Gas Insan Center', 243, 'Jalan bangao dekat masjid agung jaya', 'Dekat dengan unri'),
(4, 9, 'Griya Insan Utama 9', 400, 'Jalan pepaya ujung Perumahan Btn mutiara', 'Dekat dengan pusat pembelanjaan'),
(5, 10, 'Griya Insan Utama 10', 400, 'Jalan pepaya ujung Perumahan Btn mutiara', 'Dekat dengan pusat pembelanjaan'),
(6, 11, 'Griya Insan Utama 11', 400, 'Jalan pepaya ujung Perumahan Btn mutiara', 'Dekat dengan pusat pembelanjaan'),
(7, 12, 'Griya Insan Utama 12', 400, 'Jalan pepaya ujung Perumahan Btn mutiara', 'Dekat dengan pusat pembelanjaan');

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
(1, 1, 'User Pegawai 1', 'userpegawai1', 'Pekanbaru', ''),
(2, 15, 'pegawai', 'pegawai@gmail.com', 'Jl. Pegawai 1', '0892301092');

-- --------------------------------------------------------

--
-- Table structure for table `tb_status_pengajuan`
--

CREATE TABLE `tb_status_pengajuan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_status_pengajuan`
--

INSERT INTO `tb_status_pengajuan` (`id`, `nama`) VALUES
(1, 'Pengajuan diproses'),
(2, 'Pengajuan diterima'),
(3, 'Pembayaran DP diterima'),
(4, 'Checking Bank'),
(5, 'Pengajuan di tolak bank(konfirmasi pengembalian DP)'),
(6, 'Pengajuan akad konsumen ke pihak bank'),
(7, 'Pengajuan selesai');

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
(8, 'Tipe 37', '250', 'Beton', 'Plafon', 'Keramik', 'Batu + Dinding', 'Kayu Jati', 'Kayu Meranti', 'Besi Padat', 'Genteng', 'Genteng + Besi', 'PAM', 'PLN 3000 KWH', 'PAM', '350000000', '50', 1),
(9, 'Tipe 38', '250', 'Beton', 'Plafon', 'Keramik', 'Batu + Dinding', 'Kayu Jati', 'Kayu Meranti', 'Besi Padat', 'Genteng', 'Genteng + Besi', 'PAM', 'PLN 3000 KWH', 'PAM', '350000000', '50', 1),
(10, 'Tipe 39', '250', 'Beton', 'Plafon', 'Keramik', 'Batu + Dinding', 'Kayu Jati', 'Kayu Meranti', 'Besi Padat', 'Genteng', 'Genteng + Besi', 'PAM', 'PLN 3000 KWH', 'PAM', '350000000', '50', 1),
(11, 'Tipe 40', '250', 'Beton', 'Plafon', 'Keramik', 'Batu + Dinding', 'Kayu Jati', 'Kayu Meranti', 'Besi Padat', 'Genteng', 'Genteng + Besi', 'PAM', 'PLN 3000 KWH', 'PAM', '350000000', '50', 1),
(12, 'Tipe 41', '250', 'Beton', 'Plafon', 'Keramik', 'Batu + Dinding', 'Kayu Jati', 'Kayu Meranti', 'Besi Padat', 'Genteng', 'Genteng + Besi', 'PAM', 'PLN 3000 KWH', 'PAM', '350000000', '50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime NOT NULL DEFAULT current_timestamp(),
  `role` enum('direktur','pegawai','konsumen') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`, `last_login`, `role`) VALUES
(1, 'user', '$2y$10$PKw1F3kLRdPiCX0q0G8lweuwWtCu4qpLoMRyCvNacYjfomm1DZv7K', '2022-02-02 07:58:57', 'konsumen'),
(2, 'abdulhafizramadan', '$2y$10$NYOCqXK8hbMe45dPgj0.vOJEC.19sz2UbfVdDxwTnFUomSTM7fRd.', '2022-02-02 14:09:02', 'direktur'),
(3, 'abdulhafizramadan1', '$2y$10$voAeZGZvB91iclRl7zBgI.vt.fAlEL0/BNNeeuXLMLliZFTOBkMlG', '2022-02-02 14:10:27', 'direktur'),
(4, 'abdulhafizramadan2', '$2y$10$ydtVwsreEyx/ixbWfyBVFOI6lJ6MIv7k9jdXdf0kq0qwHGek8PNWi', '2022-02-02 14:11:03', 'direktur'),
(5, 'abdulhafizramadan3', '$2y$10$GvdLx2QwDWYOBd/lY3jvNuXJbTaBbjqwevWdvRtF3cmHzhbTyRG96', '2022-02-02 14:11:17', 'direktur'),
(6, 'abdulhafizramadan4', '$2y$10$rNCsGx7XtD3tAp/ViNeWPO7bPyZzPDAM4aVTB4g6IyFxyZaWYjLP.', '2022-02-02 14:12:24', 'direktur'),
(7, 'abdulhafizramadan5', '$2y$10$lSxb7Ntd.WSg26gt2oA0I..Wu/sZULoul/lYKViZHgcYXjz8WpmS2', '2022-02-02 14:13:34', 'direktur'),
(8, 'abdulhafizramadan6', '$2y$10$TZcxlDM.A1Y.DeN6UurxbOKC1D61vkOU5BsRvkXO3nRL94Y1XybhO', '2022-02-02 14:14:30', 'direktur'),
(9, 'abdulhafizramadan7', '$2y$10$SM3Rh5bfZjNO6PiddAfeg./9LU1Gv2HmuFIuOWYtNIaTqWWSIBiUO', '2022-02-02 14:19:12', 'direktur'),
(10, 'abdulhafizramadan8', '$2y$10$ggYG.NYPJ6bdOC05aaMuGuSvXVpNYtBCK2n5b4pMcUEmtpMZB20yO', '2022-02-02 14:20:36', 'direktur'),
(12, 'konsumen', '$2y$10$KVHD5vC53pBhYGcBJGeaZ.TqVOVnqjIsk0MjnXLrBSOmDQ17bU87y', '2022-02-09 06:27:23', 'konsumen'),
(15, 'pegawai', '$2y$10$7APJLNTLxPKHo6LvnOYdX.EhMcKEa0IMKHhE3RBZTDhJOfczajCR6', '2022-02-09 15:21:27', 'pegawai'),
(16, 'direktur', '$2y$10$cf3QWU6MTbQi724x2sKLduMS1XbbhlL059Q5WBZI9eVL0CLd51B9C', '2022-02-10 01:31:11', 'direktur'),
(17, 'konsumen1', '$2y$10$TFrlXKsGIHkd3POAsAC8teHCmtP/ZtJM9mPODM0QY5TOhhUN0zLXy', '2022-02-13 04:00:59', 'konsumen');

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
-- Indexes for table `tb_status_pengajuan`
--
ALTER TABLE `tb_status_pengajuan`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_direktur`
--
ALTER TABLE `tb_direktur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_foto_tipe_rumah`
--
ALTER TABLE `tb_foto_tipe_rumah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_konsumen`
--
ALTER TABLE `tb_konsumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_marketing_perumahan`
--
ALTER TABLE `tb_marketing_perumahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_master_perumahan`
--
ALTER TABLE `tb_master_perumahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_status_pengajuan`
--
ALTER TABLE `tb_status_pengajuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_tipe_perumahan`
--
ALTER TABLE `tb_tipe_perumahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
