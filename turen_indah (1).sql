-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jun 2020 pada 04.28
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `turen_indah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_barang`
--

CREATE TABLE `ms_barang` (
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_kasir`
--

CREATE TABLE `ms_kasir` (
  `kode_kasir` varchar(10) NOT NULL,
  `nama_kasir` varchar(50) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_kasir`
--

INSERT INTO `ms_kasir` (`kode_kasir`, `nama_kasir`, `telepon`, `alamat`, `tgl_masuk`, `password`) VALUES
('ADM_001', 'Claire Laverine', '082278239482', 'Jl. Puspa no. 12 Talok Turen', '2020-06-15', '182e500f562c7b95a2ae0b4dd9f47bb2'),
('KSR_001', 'Shafira Sharapova', '082374823422', 'Jl. Plaosan 1 Malang', '2020-06-20', '2ec4b0bdf35a294f7b42496e0a19ceea');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_pelanggan`
--

CREATE TABLE `ms_pelanggan` (
  `kode_pelanggan` varchar(10) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_penjualan`
--

CREATE TABLE `tb_detail_penjualan` (
  `kode_penjualan` varchar(20) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `kode_penjualan` varchar(20) NOT NULL,
  `kode_kasir` varchar(10) NOT NULL,
  `kode_pelanggan` varchar(10) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `total` int(11) NOT NULL,
  `bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ms_barang`
--
ALTER TABLE `ms_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indeks untuk tabel `ms_kasir`
--
ALTER TABLE `ms_kasir`
  ADD PRIMARY KEY (`kode_kasir`);

--
-- Indeks untuk tabel `ms_pelanggan`
--
ALTER TABLE `ms_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indeks untuk tabel `tb_detail_penjualan`
--
ALTER TABLE `tb_detail_penjualan`
  ADD KEY `kode_penjualan` (`kode_penjualan`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`kode_penjualan`),
  ADD KEY `fk_kode_kasir` (`kode_kasir`),
  ADD KEY `fk_kode_pelanggan` (`kode_pelanggan`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_detail_penjualan`
--
ALTER TABLE `tb_detail_penjualan`
  ADD CONSTRAINT `tb_detail_penjualan_ibfk_1` FOREIGN KEY (`kode_penjualan`) REFERENCES `tb_penjualan` (`kode_penjualan`),
  ADD CONSTRAINT `tb_detail_penjualan_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `ms_barang` (`kode_barang`);

--
-- Ketidakleluasaan untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `fk_kode_kasir` FOREIGN KEY (`kode_kasir`) REFERENCES `ms_kasir` (`kode_kasir`),
  ADD CONSTRAINT `fk_kode_pelanggan` FOREIGN KEY (`kode_pelanggan`) REFERENCES `ms_pelanggan` (`kode_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
