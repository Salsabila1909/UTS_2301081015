class Peminjaman {
  String kode;
  String nama;
  String kodePeminjaman;
  DateTime tanggal;
  String kodeNasabah;
  String namaNasabah;
  double jumlahPinjaman;
  int lamaPinjaman;
  double bunga;
  double angsuranPokok;
  double bungaPerBulan;
  double angsuranPerBulan;
  double totalHutang;

  Peminjaman({
    required this.kode,
    required this.nama,
    required this.kodePeminjaman,
    required this.tanggal,
    required this.kodeNasabah,
    required this.namaNasabah,
    required this.jumlahPinjaman,
    required this.lamaPinjaman,
    required this.bunga,
  })  : angsuranPokok = jumlahPinjaman / lamaPinjaman,
        bungaPerBulan = (jumlahPinjaman * 0.12) / 12,
        angsuranPerBulan =
            (jumlahPinjaman * 0.12) / 12 + (jumlahPinjaman / lamaPinjaman),
        totalHutang = jumlahPinjaman + (jumlahPinjaman * 0.12);
}
