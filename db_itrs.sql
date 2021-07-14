-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 14, 2021 at 04:42 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_itrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_perbaikan`
--

CREATE TABLE `jenis_perbaikan` (
  `kd_jp` varchar(10) NOT NULL,
  `kriteria` varchar(20) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_perbaikan`
--

INSERT INTO `jenis_perbaikan` (`kd_jp`, `kriteria`, `nilai`) VALUES
('hard', 'Hardware', 100),
('jar', 'Jaringan', 75),
('sim', 'SIMRS', 50),
('soft', 'Software', 25);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nip` varchar(12) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `no_hp` varchar(12) DEFAULT NULL,
  `kd_unit` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nip`, `nama`, `alamat`, `tgl_lahir`, `no_hp`, `kd_unit`) VALUES
('1111', 'contoh apotek', '0', '2021-07-22', '0', 'apt'),
('2222', 'contoh igd', '0', '2021-07-09', '0', 'igd'),
('3333', 'contoh casemix', '0', '2021-07-11', '0', 'case'),
('4444', 'contoh kantor', '0', '2021-07-04', '0', 'kntr'),
('5555', 'contoh logistik', '0', '2021-07-06', '0', 'log'),
('6666', 'contoh admisi', '0', '2021-07-07', '0', 'adm'),
('7777', 'contoh kasir', '0', '2021-07-06', '0', 'kas'),
('9999', 'Feryzal', '-', '1998-03-18', '0', 'kntr');

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_it`
--

CREATE TABLE `permintaan_it` (
  `id_permintaan_it` int(11) NOT NULL,
  `id_permintaan` int(11) DEFAULT NULL,
  `kd_jp` varchar(10) DEFAULT NULL,
  `waktu_permintaan` datetime DEFAULT NULL,
  `waktu_selesai` datetime DEFAULT NULL,
  `stts_lanjut` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permintaan_it`
--

INSERT INTO `permintaan_it` (`id_permintaan_it`, `id_permintaan`, `kd_jp`, `waktu_permintaan`, `waktu_selesai`, `stts_lanjut`) VALUES
(1, 1, 'sim', '2021-07-12 11:53:20', '2021-07-12 12:53:25', '1'),
(7, 5, 'sim', '2021-07-12 08:56:02', NULL, '1'),
(8, 6, 'jar', '2021-07-14 04:53:36', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_user`
--

CREATE TABLE `permintaan_user` (
  `id_permintaan` int(11) NOT NULL,
  `id_petugas` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `waktu_permintaan` datetime DEFAULT NULL,
  `stts_lanjut` enum('0','1','2') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permintaan_user`
--

INSERT INTO `permintaan_user` (`id_permintaan`, `id_petugas`, `keterangan`, `waktu_permintaan`, `stts_lanjut`) VALUES
(1, 3, 'SIMRS tidak bisa', '2021-07-12 11:52:39', '1'),
(5, 2, 'SIMRS macet tidak bisa digunakan sama sekali', '2021-07-12 08:56:02', '1'),
(6, 4, 'Internet tidak bisa dijalankan', '2021-07-14 04:53:36', '1');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nip` varchar(12) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `level` enum('user','admin') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nip`, `password`, `level`) VALUES
(1, '9999', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'admin'),
(2, '1111', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'user'),
(3, '2222', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'user'),
(4, '3333', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'user'),
(5, '4444', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'user'),
(6, '5555', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'user'),
(7, '6666', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'user'),
(8, '7777', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `resiko_komplain`
--

CREATE TABLE `resiko_komplain` (
  `kd_resiko` varchar(10) NOT NULL,
  `kriteria` varchar(20) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resiko_komplain`
--

INSERT INTO `resiko_komplain` (`kd_resiko`, `kriteria`, `nilai`) VALUES
('1', 'Ya', 100),
('2', 'Tidak', 50);

-- --------------------------------------------------------

--
-- Table structure for table `status_pc`
--

CREATE TABLE `status_pc` (
  `kd_status_pc` varchar(10) NOT NULL,
  `kriteria` varchar(20) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_pc`
--

INSERT INTO `status_pc` (`kd_status_pc`, `kriteria`, `nilai`) VALUES
('16', 'Nyala 16 Jam', 50),
('24', 'Nyala 24 Jam', 100),
('8', 'Nyala 8 Jam', 30);

-- --------------------------------------------------------

--
-- Table structure for table `status_pelayanan`
--

CREATE TABLE `status_pelayanan` (
  `kd_status_pel` varchar(10) NOT NULL,
  `kriteria` varchar(20) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_pelayanan`
--

INSERT INTO `status_pelayanan` (`kd_status_pel`, `kriteria`, `nilai`) VALUES
('man', 'Manajemen', 50),
('np', 'Non Pelayanan', 30),
('pel', 'Pelayanan', 100);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `kd_unit` varchar(10) NOT NULL,
  `nm_unit` varchar(20) DEFAULT NULL,
  `kd_status_pel` varchar(10) DEFAULT NULL,
  `kd_status_pc` varchar(10) DEFAULT NULL,
  `kd_resiko` varchar(10) DEFAULT NULL,
  `stts` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`kd_unit`, `nm_unit`, `kd_status_pel`, `kd_status_pc`, `kd_resiko`, `stts`) VALUES
('adm', 'Admisi', 'pel', '24', '1', '1'),
('apt', 'Apotek', 'pel', '24', '1', '1'),
('case', 'Casemix', 'man', '8', '2', '1'),
('igd', 'IGD', 'pel', '24', '1', '1'),
('kas', 'Kasir', 'pel', '16', '1', '1'),
('kntr', 'Kantor', 'np', '8', '2', '1'),
('log', 'Logistik', 'man', '16', '2', '1');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_akar_nilai`
-- (See below for the actual view)
--
CREATE TABLE `v_akar_nilai` (
`stts_pc` double
,`stts_pelayanan` double
,`jenis_perbaikan` double
,`resiko_komplain` double
,`waktu` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nilai_avg`
-- (See below for the actual view)
--
CREATE TABLE `v_nilai_avg` (
`status_pc` double
,`status_pelayanan` double
,`jenis_perbaikan` double
,`resiko_komplain` double
,`waktu` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nilai_matrix`
-- (See below for the actual view)
--
CREATE TABLE `v_nilai_matrix` (
`ip` int(11)
,`unit` varchar(20)
,`stts_pc` double
,`stts_pelayanan` double
,`jenis_perbaikan` double
,`resiko_komplain` double
,`waktu` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nilai_normal_permintaan`
-- (See below for the actual view)
--
CREATE TABLE `v_nilai_normal_permintaan` (
`ip` int(11)
,`unit` varchar(20)
,`status_pc` int(11)
,`status_pelayanan` int(11)
,`jenis_perbaikan` int(11)
,`resiko_komplain` int(11)
,`Waktu` int(3)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nilai_permintaan`
-- (See below for the actual view)
--
CREATE TABLE `v_nilai_permintaan` (
`ip` int(11)
,`unit` varchar(20)
,`status_pc` int(11)
,`status_pelayanan` int(11)
,`jenis_perbaikan` int(11)
,`resiko_komplain` int(11)
,`waktu` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nilai_yi`
-- (See below for the actual view)
--
CREATE TABLE `v_nilai_yi` (
`ip` int(11)
,`unit` varchar(20)
,`nilai_yi` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_normalisasi_terbobot`
-- (See below for the actual view)
--
CREATE TABLE `v_normalisasi_terbobot` (
`ip` int(11)
,`unit` varchar(20)
,`stts_pc` double
,`stts_pelayanan` double
,`jenis_perbaikan` double
,`resiko_komplain` double
,`waktu` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pangkat_nilai`
-- (See below for the actual view)
--
CREATE TABLE `v_pangkat_nilai` (
`ip` int(11)
,`unit` varchar(20)
,`status_pc` double
,`status_pelayanan` double
,`jenis_perbaikan` double
,`resiko_komplain` double
,`Waktu` int(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_perangkingan`
-- (See below for the actual view)
--
CREATE TABLE `v_perangkingan` (
`ip` int(11)
,`unit` varchar(20)
,`nilai_yi` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_sum_nilai_pangkat`
-- (See below for the actual view)
--
CREATE TABLE `v_sum_nilai_pangkat` (
`stts_pc` double
,`stts_pelayanan` double
,`jenis_perbaikan` double
,`resiko_komplain` double
,`waktu` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Structure for view `v_akar_nilai`
--
DROP TABLE IF EXISTS `v_akar_nilai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_akar_nilai`  AS SELECT sqrt(`v_sum_nilai_pangkat`.`stts_pc`) AS `stts_pc`, sqrt(`v_sum_nilai_pangkat`.`stts_pelayanan`) AS `stts_pelayanan`, sqrt(`v_sum_nilai_pangkat`.`jenis_perbaikan`) AS `jenis_perbaikan`, sqrt(`v_sum_nilai_pangkat`.`resiko_komplain`) AS `resiko_komplain`, sqrt(`v_sum_nilai_pangkat`.`waktu`) AS `waktu` FROM `v_sum_nilai_pangkat` ;

-- --------------------------------------------------------

--
-- Structure for view `v_nilai_avg`
--
DROP TABLE IF EXISTS `v_nilai_avg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_avg`  AS SELECT avg(`v_pangkat_nilai`.`status_pc`) AS `status_pc`, avg(`v_pangkat_nilai`.`status_pelayanan`) AS `status_pelayanan`, avg(`v_pangkat_nilai`.`jenis_perbaikan`) AS `jenis_perbaikan`, avg(`v_pangkat_nilai`.`resiko_komplain`) AS `resiko_komplain`, avg(`v_pangkat_nilai`.`Waktu`) AS `waktu` FROM `v_pangkat_nilai` ;

-- --------------------------------------------------------

--
-- Structure for view `v_nilai_matrix`
--
DROP TABLE IF EXISTS `v_nilai_matrix`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_matrix`  AS SELECT `v_nilai_normal_permintaan`.`ip` AS `ip`, `v_nilai_normal_permintaan`.`unit` AS `unit`, `v_nilai_normal_permintaan`.`status_pc`/ (select `v_akar_nilai`.`stts_pc` from `v_akar_nilai`) AS `stts_pc`, `v_nilai_normal_permintaan`.`status_pelayanan`/ (select `v_akar_nilai`.`stts_pelayanan` from `v_akar_nilai`) AS `stts_pelayanan`, `v_nilai_normal_permintaan`.`jenis_perbaikan`/ (select `v_akar_nilai`.`jenis_perbaikan` from `v_akar_nilai`) AS `jenis_perbaikan`, `v_nilai_normal_permintaan`.`resiko_komplain`/ (select `v_akar_nilai`.`resiko_komplain` from `v_akar_nilai`) AS `resiko_komplain`, `v_nilai_normal_permintaan`.`Waktu`/ (select `v_akar_nilai`.`waktu` from `v_akar_nilai`) AS `waktu` FROM `v_nilai_normal_permintaan` ;

-- --------------------------------------------------------

--
-- Structure for view `v_nilai_normal_permintaan`
--
DROP TABLE IF EXISTS `v_nilai_normal_permintaan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_normal_permintaan`  AS SELECT `permintaan_it`.`id_permintaan` AS `ip`, `unit`.`nm_unit` AS `unit`, `status_pc`.`nilai` AS `status_pc`, `status_pelayanan`.`nilai` AS `status_pelayanan`, `jenis_perbaikan`.`nilai` AS `jenis_perbaikan`, `resiko_komplain`.`nilai` AS `resiko_komplain`, CASE WHEN timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) > 1800 THEN 100 WHEN timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) < 1800 AND timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) > 900 THEN 75 WHEN timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) > 900 AND timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) < 1800 THEN 50 WHEN timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) < 900 THEN 25 END AS `Waktu` FROM ((((((((`permintaan_it` join `permintaan_user`) join `jenis_perbaikan`) join `petugas`) join `pegawai`) join `unit`) join `status_pc`) join `status_pelayanan`) join `resiko_komplain` on(`permintaan_user`.`id_permintaan` = `permintaan_it`.`id_permintaan` and `jenis_perbaikan`.`kd_jp` = `permintaan_it`.`kd_jp` and `petugas`.`id_petugas` = `permintaan_user`.`id_petugas` and `pegawai`.`nip` = `petugas`.`nip` and `unit`.`kd_unit` = `pegawai`.`kd_unit` and `status_pc`.`kd_status_pc` = `unit`.`kd_status_pc` and `status_pelayanan`.`kd_status_pel` = `unit`.`kd_status_pel` and `resiko_komplain`.`kd_resiko` = `unit`.`kd_resiko`)) WHERE `permintaan_it`.`stts_lanjut` = '1' ;

-- --------------------------------------------------------

--
-- Structure for view `v_nilai_permintaan`
--
DROP TABLE IF EXISTS `v_nilai_permintaan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_permintaan`  AS SELECT `permintaan_it`.`id_permintaan` AS `ip`, `unit`.`nm_unit` AS `unit`, `status_pc`.`nilai` AS `status_pc`, `status_pelayanan`.`nilai` AS `status_pelayanan`, `jenis_perbaikan`.`nilai` AS `jenis_perbaikan`, `resiko_komplain`.`nilai` AS `resiko_komplain`, timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) AS `waktu` FROM ((((((((`permintaan_it` join `permintaan_user`) join `jenis_perbaikan`) join `petugas`) join `pegawai`) join `unit`) join `status_pc`) join `status_pelayanan`) join `resiko_komplain` on(`permintaan_user`.`id_permintaan` = `permintaan_it`.`id_permintaan` and `jenis_perbaikan`.`kd_jp` = `permintaan_it`.`kd_jp` and `petugas`.`id_petugas` = `permintaan_user`.`id_petugas` and `pegawai`.`nip` = `petugas`.`nip` and `unit`.`kd_unit` = `pegawai`.`kd_unit` and `status_pc`.`kd_status_pc` = `unit`.`kd_status_pc` and `status_pelayanan`.`kd_status_pel` = `unit`.`kd_status_pel` and `resiko_komplain`.`kd_resiko` = `unit`.`kd_resiko`)) WHERE `permintaan_it`.`stts_lanjut` = '1' ;

-- --------------------------------------------------------

--
-- Structure for view `v_nilai_yi`
--
DROP TABLE IF EXISTS `v_nilai_yi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_yi`  AS SELECT `v_normalisasi_terbobot`.`ip` AS `ip`, `v_normalisasi_terbobot`.`unit` AS `unit`, `v_normalisasi_terbobot`.`stts_pc`+ `v_normalisasi_terbobot`.`stts_pelayanan` + `v_normalisasi_terbobot`.`jenis_perbaikan` + `v_normalisasi_terbobot`.`resiko_komplain` + `v_normalisasi_terbobot`.`waktu` AS `nilai_yi` FROM `v_normalisasi_terbobot` ;

-- --------------------------------------------------------

--
-- Structure for view `v_normalisasi_terbobot`
--
DROP TABLE IF EXISTS `v_normalisasi_terbobot`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_normalisasi_terbobot`  AS SELECT `v_nilai_matrix`.`ip` AS `ip`, `v_nilai_matrix`.`unit` AS `unit`, `v_nilai_matrix`.`stts_pc`* 0.35 AS `stts_pc`, `v_nilai_matrix`.`stts_pelayanan`* 0.1 AS `stts_pelayanan`, `v_nilai_matrix`.`jenis_perbaikan`* 0.2 AS `jenis_perbaikan`, `v_nilai_matrix`.`resiko_komplain`* 0.25 AS `resiko_komplain`, `v_nilai_matrix`.`waktu`* 0.01 AS `waktu` FROM `v_nilai_matrix` ;

-- --------------------------------------------------------

--
-- Structure for view `v_pangkat_nilai`
--
DROP TABLE IF EXISTS `v_pangkat_nilai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pangkat_nilai`  AS SELECT `permintaan_it`.`id_permintaan` AS `ip`, `unit`.`nm_unit` AS `unit`, pow(`status_pc`.`nilai`,2) AS `status_pc`, pow(`status_pelayanan`.`nilai`,2) AS `status_pelayanan`, pow(`jenis_perbaikan`.`nilai`,2) AS `jenis_perbaikan`, pow(`resiko_komplain`.`nilai`,2) AS `resiko_komplain`, CASE WHEN timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) > 1800 THEN 10000 WHEN timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) < 1800 AND timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) > 900 THEN 5625 WHEN timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) > 900 AND timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) < 1800 THEN 2500 WHEN timestampdiff(MINUTE,(select `permintaan_user`.`waktu_permintaan` from `permintaan_user` where `permintaan_user`.`id_permintaan` = `ip`),current_timestamp()) < 900 THEN 625 END AS `Waktu` FROM ((((((((`permintaan_it` join `permintaan_user`) join `jenis_perbaikan`) join `petugas`) join `pegawai`) join `unit`) join `status_pc`) join `status_pelayanan`) join `resiko_komplain` on(`permintaan_user`.`id_permintaan` = `permintaan_it`.`id_permintaan` and `jenis_perbaikan`.`kd_jp` = `permintaan_it`.`kd_jp` and `petugas`.`id_petugas` = `permintaan_user`.`id_petugas` and `pegawai`.`nip` = `petugas`.`nip` and `unit`.`kd_unit` = `pegawai`.`kd_unit` and `status_pc`.`kd_status_pc` = `unit`.`kd_status_pc` and `status_pelayanan`.`kd_status_pel` = `unit`.`kd_status_pel` and `resiko_komplain`.`kd_resiko` = `unit`.`kd_resiko`)) WHERE `permintaan_it`.`stts_lanjut` = '1' ;

-- --------------------------------------------------------

--
-- Structure for view `v_perangkingan`
--
DROP TABLE IF EXISTS `v_perangkingan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_perangkingan`  AS SELECT `v_nilai_yi`.`ip` AS `ip`, `v_nilai_yi`.`unit` AS `unit`, `v_nilai_yi`.`nilai_yi` AS `nilai_yi` FROM `v_nilai_yi` ORDER BY `v_nilai_yi`.`nilai_yi` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_sum_nilai_pangkat`
--
DROP TABLE IF EXISTS `v_sum_nilai_pangkat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sum_nilai_pangkat`  AS SELECT sum(`v_pangkat_nilai`.`status_pc`) AS `stts_pc`, sum(`v_pangkat_nilai`.`status_pelayanan`) AS `stts_pelayanan`, sum(`v_pangkat_nilai`.`jenis_perbaikan`) AS `jenis_perbaikan`, sum(`v_pangkat_nilai`.`resiko_komplain`) AS `resiko_komplain`, sum(`v_pangkat_nilai`.`Waktu`) AS `waktu` FROM `v_pangkat_nilai` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_perbaikan`
--
ALTER TABLE `jenis_perbaikan`
  ADD PRIMARY KEY (`kd_jp`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `fk_kd_unit` (`kd_unit`);

--
-- Indexes for table `permintaan_it`
--
ALTER TABLE `permintaan_it`
  ADD PRIMARY KEY (`id_permintaan_it`),
  ADD KEY `fk_permintaan_user` (`id_permintaan`),
  ADD KEY `fk_jenis_perbaikan` (`kd_jp`);

--
-- Indexes for table `permintaan_user`
--
ALTER TABLE `permintaan_user`
  ADD PRIMARY KEY (`id_permintaan`),
  ADD KEY `fk_petugas` (`id_petugas`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`),
  ADD KEY `fk_nip_petugas` (`nip`);

--
-- Indexes for table `resiko_komplain`
--
ALTER TABLE `resiko_komplain`
  ADD PRIMARY KEY (`kd_resiko`);

--
-- Indexes for table `status_pc`
--
ALTER TABLE `status_pc`
  ADD PRIMARY KEY (`kd_status_pc`);

--
-- Indexes for table `status_pelayanan`
--
ALTER TABLE `status_pelayanan`
  ADD PRIMARY KEY (`kd_status_pel`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`kd_unit`),
  ADD KEY `fk_status_pel` (`kd_status_pel`),
  ADD KEY `fk_status_pc` (`kd_status_pc`),
  ADD KEY `fk_status_resiko` (`kd_resiko`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permintaan_it`
--
ALTER TABLE `permintaan_it`
  MODIFY `id_permintaan_it` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permintaan_user`
--
ALTER TABLE `permintaan_user`
  MODIFY `id_permintaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `fk_kd_unit` FOREIGN KEY (`kd_unit`) REFERENCES `unit` (`kd_unit`);

--
-- Constraints for table `permintaan_it`
--
ALTER TABLE `permintaan_it`
  ADD CONSTRAINT `fk_jenis_perbaikan` FOREIGN KEY (`kd_jp`) REFERENCES `jenis_perbaikan` (`kd_jp`),
  ADD CONSTRAINT `fk_permintaan_user` FOREIGN KEY (`id_permintaan`) REFERENCES `permintaan_user` (`id_permintaan`);

--
-- Constraints for table `permintaan_user`
--
ALTER TABLE `permintaan_user`
  ADD CONSTRAINT `fk_petugas` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);

--
-- Constraints for table `petugas`
--
ALTER TABLE `petugas`
  ADD CONSTRAINT `fk_nip_petugas` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`);

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `fk_status_pc` FOREIGN KEY (`kd_status_pc`) REFERENCES `status_pc` (`kd_status_pc`),
  ADD CONSTRAINT `fk_status_pel` FOREIGN KEY (`kd_status_pel`) REFERENCES `status_pelayanan` (`kd_status_pel`),
  ADD CONSTRAINT `fk_status_resiko` FOREIGN KEY (`kd_resiko`) REFERENCES `resiko_komplain` (`kd_resiko`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
