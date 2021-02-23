/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.17-MariaDB : Database - toko_buku
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`toko_buku` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `toko_buku`;

/*Table structure for table `buku` */

DROP TABLE IF EXISTS `buku`;

CREATE TABLE `buku` (
  `kode_buku` varchar(6) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `penulis` varchar(128) DEFAULT NULL,
  `id_penerbit` varchar(6) DEFAULT NULL,
  `id_kategori` varchar(6) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  `harga` int(11) unsigned DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_buku`),
  KEY `id_penerbit` (`id_penerbit`),
  KEY `id_kategori` (`id_kategori`),
  CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit` (`id_penerbit`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `buku` */

insert  into `buku`(`kode_buku`,`judul`,`penulis`,`id_penerbit`,`id_kategori`,`tahun`,`harga`,`stok`) values 
('B00001','Algoritma & Pemrograman Dengan C/C++','Suyatno','PN0001','1',2020,75000,21),
('B00002','Belajar Pemrograman Dengan Python','Adityo Hermawan','PN0001','1',2019,59000,13),
('B00003','Belajar Konsep Pemrograman Berorientasi Objek Dengan Java','Makruf Alianto','PN0002','1',2020,80000,17),
('B00004','Memulai Pemrograman Dengan Python','Sumito','PN0003','1',2018,70000,25),
('B00005','Python Untuk Big Data & Machine Learning','Abdul Khaidar','PN0003','1',2018,98000,17),
('B00006','Database MySQL Untuk Pemula','Rumini','PN0004','1',2020,40000,35),
('B00007','Algoritma Kecerdasan Buatan','Eka Pujianti','PN0005','1',2019,69000,10),
('B00008','The Secret Scroll Of Fighting: Naruto Character Official Data Book','Masashi Kishimoto','PN0001','4',2017,40000,7),
('B00009','Boruto - Naruto Next Generation Vol. 8','Masashi Kishimoto','PN0001','4',2021,40000,18),
('B00010','Rahasia Sulap Paman Dino','Iwok Abqari','PN0001','4',2019,37000,5),
('B00011','Antropologi Kesehatan Untuk Keperawatan','AWAN HARIANTO DKK','PN0006','3',2020,60000,4),
('B00012','Healthy Menu Untuk Penderita Penyakit Jantung','Khusnul Khotimah','PN0006','3',2018,51000,0),
('B00013','Arah langkah','Fiersa Besari','PN0001','4',2018,88000,11),
('B00014','Sains Terkini : Ddotty & Sleepground - Rekayasa Genetika','BYEON HYERYEONG/CHOI WOOBIN','PN0006','2',2020,95000,13);

/*Table structure for table `detail_transaksi` */

DROP TABLE IF EXISTS `detail_transaksi`;

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` varchar(6) NOT NULL,
  `nota` varchar(6) DEFAULT NULL,
  `kode_buku` varchar(6) DEFAULT NULL,
  `jumlah` int(11) unsigned DEFAULT NULL,
  `subtotal` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_detail_transaksi`),
  KEY `nota` (`nota`),
  KEY `kode_buku` (`kode_buku`),
  CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`nota`) REFERENCES `transaksi` (`nota`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `detail_transaksi` */

insert  into `detail_transaksi`(`id_detail_transaksi`,`nota`,`kode_buku`,`jumlah`,`subtotal`) values 
('DT0001','TR0001','B00002',2,118000),
('DT0002','TR0002','B00014',3,285000),
('DT0003','TR0003','B00002',2,118000),
('DT0004','TR0003','B00001',1,75000),
('DT0005','TR0004','B00006',3,120000),
('DT0006','TR0005','B00005',1,98000),
('DT0007','TR0006','B00008',3,120000),
('DT0008','TR0007','B00007',3,207000),
('DT0009','TR0008','B00010',1,37000),
('DT0010','TR0008','B00002',1,59000),
('DT0011','TR0008','B00003',1,80000),
('DT0012','TR0009','B00010',2,74000),
('DT0013','TR0010','B00014',3,285000),
('DT0014','TR0011','B00007',1,69000),
('DT0015','TR0011','B00014',2,190000),
('DT0016','TR0012','B00007',1,69000),
('DT0017','TR0012','B00014',3,285000),
('DT0018','TR0012','B00005',1,98000),
('DT0019','TR0012','B00011',1,60000),
('DT0020','TR0013','B00001',1,75000),
('DT0021','TR0013','B00002',1,59000),
('DT0022','TR0013','B00003',1,80000),
('DT0023','TR0013','B00006',1,40000),
('DT0024','TR0014','B00008',1,40000),
('DT0025','TR0014','B00011',1,60000),
('DT0026','TR0015','B00010',3,111000),
('DT0027','TR0016','B00004',1,70000);

/*Table structure for table `kasir` */

DROP TABLE IF EXISTS `kasir`;

CREATE TABLE `kasir` (
  `id_kasir` varchar(6) NOT NULL,
  `nama_kasir` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telepon` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id_kasir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `kasir` */

insert  into `kasir`(`id_kasir`,`nama_kasir`,`alamat`,`telepon`) values 
('K00001','Rinta Ratnaningsih','JL. Kenanga No. 12, Desa Biru, Godean, Sleman','+62 878-661-603'),
('K00002','Nadia Oktaviani','Gang Selasih 7, Gamping, Sleman','+62 824-5536-830'),
('K00003','Shela Marlina','Perum Cempaka No. 9, Cebongan','+62 882-2247-007');

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id_kategori` varchar(6) NOT NULL,
  `nama_kategori` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `kategori` */

insert  into `kategori`(`id_kategori`,`nama_kategori`) values 
('1','Pemrograman'),
('2','Sains'),
('3','Kesehatan'),
('4','Hiburan');

/*Table structure for table `pembeli` */

DROP TABLE IF EXISTS `pembeli`;

CREATE TABLE `pembeli` (
  `id_pembeli` varchar(6) NOT NULL,
  `nama_pembeli` varchar(128) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telepon` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id_pembeli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `pembeli` */

insert  into `pembeli`(`id_pembeli`,`nama_pembeli`,`alamat`,`telepon`) values 
('PB0001','Yuda Junianto','Kranggahan, Sleman','081928371928'),
('PB0002','Arya Surya','Trini, Sleman','082212345678'),
('PB0003','Yuda Pratama','Kranggahan, Sleman','08914321456'),
('PB0004','Andi Ratobing','Desa Klepu, Ngawi','+62 882-8224-648'),
('PB0005','Reni Suharni','Jl. Deandless KM. 12, Kulon Progo','+62 873-6592-910'),
('PB0006','Ekawati','Jl. Platina, Yogyakarta','+62 853-6628-872'),
('PB0007','Pandu Cahyo','JL. Gagak No. 10, Sleman','+62 884-5677-723'),
('PB0008','Aldi','Kranggahan II, Trihanggo, Sleman','+62 861-848-565'),
('PB0009','Brilli Noval','Gang Mawar Perum Indah, Cilacap','+62 812-6368-108');

/*Table structure for table `penerbit` */

DROP TABLE IF EXISTS `penerbit`;

CREATE TABLE `penerbit` (
  `id_penerbit` varchar(6) NOT NULL,
  `nama_penerbit` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telepon` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id_penerbit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `penerbit` */

insert  into `penerbit`(`id_penerbit`,`nama_penerbit`,`alamat`,`telepon`) values 
('PN0001','Gama Media','Jl. Magelang, Sleman','027-12345'),
('PN0002','Penerbit Anda','Jl. Kaliurang 12, Sleman','027-13579'),
('PN0003','Penerbit Informasi','Jl. Mawar No. 117, Jakarta Pusat','021-24681'),
('PN0004','Meditek Publishion','Jalan Kertosono, Surakarta','027987655'),
('PN0005','Media Informatika','Jl. Malaka II No. 11, Bandung','021-125634'),
('PN0006','Airlangga','Jalan Merdeka No. 17, Yogyakarta','021-120101');

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `nota` varchar(6) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `id_pembeli` varchar(6) DEFAULT NULL,
  `id_kasir` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`nota`),
  KEY `id_pembeli` (`id_pembeli`),
  KEY `transaksi_ibfk_2` (`id_kasir`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id_pembeli`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `transaksi` */

insert  into `transaksi`(`nota`,`tanggal`,`id_pembeli`,`id_kasir`) values 
('TR0001','2021-01-01 15:11:00','PB0001','K00001'),
('TR0002','2021-01-04 09:56:21','PB0002','K00001'),
('TR0003','2021-01-07 11:56:41','PB0003','K00002'),
('TR0004','2021-01-09 10:56:51','PB0004','K00002'),
('TR0005','2021-01-12 14:57:01','PB0005','K00003'),
('TR0006','2021-01-14 13:57:18','PB0006','K00003'),
('TR0007','2021-01-15 09:57:26','PB0007','K00003'),
('TR0008','2021-01-17 11:57:35','PB0008','K00002'),
('TR0009','2021-01-20 09:57:45','PB0009','K00002'),
('TR0010','2021-02-02 13:57:55','PB0003','K00003'),
('TR0011','2021-02-04 10:58:00','PB0006','K00001'),
('TR0012','2021-02-08 15:58:06','PB0004','K00003'),
('TR0013','2021-02-11 09:58:13','PB0008','K00002'),
('TR0014','2021-02-12 13:58:24','PB0004','K00002'),
('TR0015','2021-02-15 13:58:32','PB0006','K00003'),
('TR0016','2021-02-18 09:58:37','PB0003','K00002');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
