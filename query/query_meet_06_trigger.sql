CREATE TABLE log_transaksi (
  tanggal DATETIME,
  id_kasir VARCHAR(6),
  keterangan VARCHAR(255)
);

-- TRIGGER log transaksi baru
DELIMITER $$
CREATE OR REPLACE TRIGGER tr_log_transaksi_baru
AFTER INSERT ON transaksi
FOR EACH ROW
    BEGIN
        INSERT INTO log_transaksi VALUES (NOW(), NEW.id_kasir, "Transaksi baru");
    END$$
END;

SELECT * FROM kasir;
SELECT * FROM log_transaksi;
INSERT INTO transaksi VALUES ("TR0017", NOW(), "PB0002", "K00001");

-- TRIGGER log buku baru
DELIMITER $$
CREATE OR REPLACE TRIGGER tr_log_buku_baru
AFTER INSERT ON buku
FOR EACH ROW
  BEGIN
    INSERT INTO log_buku VALUES (NOW(), NEW.judul, NEW.penulis, "Tambah buku baru");
  END;
$$

INSERT INTO buku VALUES ("B0015", "Database Lanjut", "Suyatno", "PN0001", 1, 2021, 80000, 5);

SELECT * FROM log_buku;

-- TRIGGER log hapus buku
DELIMITER $$
CREATE OR REPLACE TRIGGER tr_log_buku_dihapus
AFTER DELETE ON buku
FOR EACH ROW
  BEGIN
    INSERT INTO log_buku VALUES (NOW(), OLD.judul, OLD.penulis, "Data buku dihapus");
  END;
$$

DELETE FROM buku WHERE kode_buku = "B0015";

-- menghapus TRIGGER
DROP TRIGGER IF EXISTS tr_log_buku_baru;

