Management User: Default: host = localhost / 127.0.0.1 :3306 user = root pass = akses: semua perintah dan fungsi di MySQL User = pembeli pass = database = toko_buku tabel = buku,
penerbit,
kategori hak akses =
SELECT
  user = admin pass = admin123 database = toko_buku tabel = * hak akses = ALL PRIVILEGES user = kasir pass = kasir321 database = toko_buku tabel & hak akses = [
   buku : SELECT, UPDATE
   kasir : SELECT, UPDATE
   transaksi : SELECT, INSERT, UPDATE, DELETE
   detail_transaksi : SELECT, INSERT, UPDATE, DELETE
] Perintah SQL 1.Buat user tanpa password: CREATE USER 'nama_user' @'host';
Dengan password: CREATE USER 'nama_user' @'host' IDENTIFIED BY 'password';
2.Hak akses: GRANT [hak_akses] ON nama_database.nama_tabel TO 'nama_user' @'host';
Semua hak akses: GRANT ALL PRIVILEGES ON nama_database.nama_tabel TO 'nama_user' @'host';
(selain DROP) 3.Hapus hak akses: REVOKE [hak_akses] ON nama_database.nama_tabel
FROM
  'nama_user' @'host';
4.Hapus user: DROP USER nama_user @host;