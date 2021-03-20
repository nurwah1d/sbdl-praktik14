/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.17-MariaDB : Database - swalayan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`swalayan` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `swalayan`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `id_barang` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `id_supplier` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_barang`),
  KEY `id_supplier` (`id_supplier`),
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `barang` */

insert  into `barang`(`id_barang`,`nama_barang`,`harga`,`stok`,`id_supplier`) values 
(1,'Indomie',2500,12,1),
(2,'Gulamu',12000,7,1),
(3,'Papasodent',8000,5,1),
(4,'Lifebo Sabun',20000,14,1),
(5,'Snackys',6000,21,2),
(6,'Citos',7000,7,2),
(7,'Nabata Wafers',5500,18,2),
(8,'Susu Danko 1000G',60000,20,1);

/*Table structure for table `detail_transaksi` */

DROP TABLE IF EXISTS `detail_transaksi`;

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nomor_transaksi` int(11) unsigned DEFAULT NULL,
  `id_barang` int(11) unsigned DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detail_transaksi`),
  KEY `nomor_transaksi` (`nomor_transaksi`),
  KEY `id_barang` (`id_barang`),
  CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`nomor_transaksi`) REFERENCES `transaksi` (`nomor_transaksi`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `detail_transaksi` */

/*Table structure for table `divisi` */

DROP TABLE IF EXISTS `divisi`;

CREATE TABLE `divisi` (
  `id_divisi` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_divisi` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_divisi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `divisi` */

insert  into `divisi`(`id_divisi`,`nama_divisi`) values 
(1,'Pemasaran'),
(2,'Gudang');

/*Table structure for table `jabatan` */

DROP TABLE IF EXISTS `jabatan`;

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(128) DEFAULT NULL,
  `id_divisi` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_jabatan`),
  KEY `id_divisi` (`id_divisi`),
  CONSTRAINT `jabatan_ibfk_1` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id_divisi`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `jabatan` */

insert  into `jabatan`(`id_jabatan`,`nama_jabatan`,`id_divisi`) values 
(1,'Manajer',1),
(2,'Kasir',1),
(3,'Kepala Gudang',2),
(4,'Staff Gudang',2);

/*Table structure for table `log_barang` */

DROP TABLE IF EXISTS `log_barang`;

CREATE TABLE `log_barang` (
  `id_log_barang` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL,
  `id_barang` int(11) unsigned DEFAULT NULL,
  `id_pegawai` int(11) unsigned DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_log_barang`),
  KEY `id_barang` (`id_barang`),
  KEY `id_pegawai` (`id_pegawai`),
  KEY `id_status` (`status`),
  CONSTRAINT `log_barang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `log_barang_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `log_barang` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id_member` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nik` varchar(16) DEFAULT NULL,
  `nama` varchar(128) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telepon` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id_member`),
  UNIQUE KEY `NIK` (`nik`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `member` */

insert  into `member`(`id_member`,`nik`,`nama`,`alamat`,`telepon`) values 
(1,'2212341202010001','Budianto','Trini, Mlati, Sleman','08221234'),
(2,'1156785111990002','Andi','Kranggahan, Gamping','08771234'),
(3,'2234789012345678','Sri Wahyuningsih','Pulesari, Sleman','08994321'),
(4,'3356789012134567','Diffa','Desa Biru, Gamping','08226789'),
(5,'4478901234567890','Dodi','Kranggahan, Gamping','02175678'),
(6,'5590123456789012','Salma Maulida','Cebongan, Sleman','02756789');

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(128) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `id_jabatan` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`),
  KEY `pegawai_ibfk_1` (`id_jabatan`),
  CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pegawai` */

insert  into `pegawai`(`id_pegawai`,`nama`,`alamat`,`id_jabatan`) values 
(1,'Fakhri','Sleman',1),
(2,'Ajeng','Trini, Sleman',2),
(3,'Rahmah','Trini, Sleman',2),
(4,'Budianto','Kota Yogayakarta',3),
(5,'Rusdianto','Kasihan, Bantul',4);

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id_supplier` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telepon` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `supplier` */

insert  into `supplier`(`id_supplier`,`nama_supplier`,`alamat`,`telepon`) values 
(1,'Indojaya',NULL,NULL),
(2,'Carefull',NULL,NULL);

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `nomor_transaksi` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL,
  `id_member` int(11) unsigned DEFAULT NULL,
  `id_pegawai` int(11) unsigned DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`nomor_transaksi`),
  KEY `id_member` (`id_member`),
  KEY `id_pegawai` (`id_pegawai`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `transaksi` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
