VIEW 
+ View merupakan sebuah objek di database yang merepresentasikan sub himpunan dari tabel yang ada di database.
+ View merupakan tabel virtual.Syntax: 1.Membuat VIEW: -> CREATE VIEW nama_view AS [query];

2.Menjalankan VIEW ->
SELECT * FROM nama_view;

3.Replace atau perbarui VIEW 
-> CREATE OR REPLACE VIEW nama_view AS [query];

4.Menghapus VIEW -> DROP VIEW nama_view;

-- > Implementasi
1.Menampilkan judul buku, nama penerbit, kategori, harga;
CREATE VIEW view_data_harga AS
SELECT
  buku.judul,
  penerbit.nama_penerbit,
  kategori.nama_kategori,
  buku.harga
FROM
  buku
  INNER JOIN penerbit ON penerbit.id_penerbit = buku.id_penerbit
  INNER JOIN kategori ON kategori.id_kategori = buku.id_kategori;

SELECT * FROM view_data_harga WHERE harga > 50000;

2.menampilkan kode buku, judul buku, stok buku;
CREATE OR REPLACE VIEW view_stok_kesehatan AS
SELECT
  buku.kode_buku,
  buku.judul,
  buku.stok
from
  buku
WHERE
  buku.id_kategori = 3;

SELECT * FROM view_stok_kesehatan;

3.Hapus VIEW view_stok_kesehatan;
DROP VIEW view_stok_kesehatan;