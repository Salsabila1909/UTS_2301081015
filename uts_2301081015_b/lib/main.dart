import 'package:flutter/material.dart';
import 'peminjaman.dart'; // Import the Peminjaman class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peminjaman',
      initialRoute: '/',
      routes: {
        '/': (context) => PeminjamanForm(),
        '/output': (context) => OutputScreen(),
      },
    );
  }
}

class PeminjamanForm extends StatefulWidget {
  @override
  _PeminjamanFormState createState() => _PeminjamanFormState();
}

class _PeminjamanFormState extends State<PeminjamanForm> {
  final _formKey = GlobalKey<FormState>();
  final kodeController = TextEditingController();
  final namaController = TextEditingController();
  final kodePeminjamanController = TextEditingController();
  final tanggalController = TextEditingController();
  final kodeNasabahController = TextEditingController();
  final namaNasabahController = TextEditingController();
  final jumlahPinjamanController = TextEditingController();
  final lamaPinjamanController = TextEditingController();

  @override
  void dispose() {
    kodeController.dispose();
    namaController.dispose();
    kodePeminjamanController.dispose();
    tanggalController.dispose();
    kodeNasabahController.dispose();
    namaNasabahController.dispose();
    jumlahPinjamanController.dispose();
    lamaPinjamanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Peminjaman PT.Salsabila')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Form Peminjaman'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Hasil Peminjaman'),
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Peminjaman peminjaman = Peminjaman(
                    kode: kodeController.text,
                    nama: namaController.text,
                    kodePeminjaman: kodePeminjamanController.text,
                    tanggal: DateTime.parse(tanggalController.text),
                    kodeNasabah: kodeNasabahController.text,
                    namaNasabah: namaNasabahController.text,
                    jumlahPinjaman: double.parse(jumlahPinjamanController.text),
                    lamaPinjaman: int.parse(lamaPinjamanController.text),
                    bunga: 0.12,
                  );
                  Navigator.pushNamed(context, '/output',
                      arguments: peminjaman);
                }
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: kodeController,
                decoration: InputDecoration(labelText: 'Kode'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Kode';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Nama';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: kodePeminjamanController,
                decoration: InputDecoration(labelText: 'Kode Peminjaman'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Kode Peminjaman';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: tanggalController,
                decoration: InputDecoration(labelText: 'Tanggal (YYYY-MM-DD)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Tanggal';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: kodeNasabahController,
                decoration: InputDecoration(labelText: 'Kode Nasabah'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Kode Nasabah';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: namaNasabahController,
                decoration: InputDecoration(labelText: 'Nama Nasabah'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Nama Nasabah';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: jumlahPinjamanController,
                decoration: InputDecoration(labelText: 'Jumlah Pinjaman'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Jumlah Pinjaman';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lamaPinjamanController,
                decoration: InputDecoration(labelText: 'Lama Pinjaman (bulan)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Lama Pinjaman';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Peminjaman peminjaman = Peminjaman(
                      kode: kodeController.text,
                      nama: namaController.text,
                      kodePeminjaman: kodePeminjamanController.text,
                      tanggal: DateTime.parse(tanggalController.text),
                      kodeNasabah: kodeNasabahController.text,
                      namaNasabah: namaNasabahController.text,
                      jumlahPinjaman:
                          double.parse(jumlahPinjamanController.text),
                      lamaPinjaman: int.parse(lamaPinjamanController.text),
                      bunga: 0.12,
                    );
                    Navigator.pushNamed(context, '/output',
                        arguments: peminjaman);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OutputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Peminjaman peminjaman =
        ModalRoute.of(context)!.settings.arguments as Peminjaman;

    return Scaffold(
      appBar: AppBar(title: Text('Hasil Peminjaman')),
      body: Center(
        // Mengatur tampilan agar berada di tengah secara horizontal
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Menaruh widget di tengah secara vertikal
            crossAxisAlignment: CrossAxisAlignment
                .center, // Mengatur konten di tengah secara horizontal
            children: [
              Text('Kode: ${peminjaman.kode}'),
              Text('Nama: ${peminjaman.nama}'),
              Text('Kode Peminjaman: ${peminjaman.kodePeminjaman}'),
              Text('Tanggal: ${peminjaman.tanggal}'),
              Text('Kode Nasabah: ${peminjaman.kodeNasabah}'),
              Text('Nama Nasabah: ${peminjaman.namaNasabah}'),
              Text('Jumlah Pinjaman: ${peminjaman.jumlahPinjaman}'),
              Text('Lama Pinjaman: ${peminjaman.lamaPinjaman} bulan'),
              Text('Bunga: ${peminjaman.bunga * 100}%'),
              Text('Angsuran Pokok: ${peminjaman.angsuranPokok}'),
              Text('Bunga per Bulan: ${peminjaman.bungaPerBulan}'),
              Text('Angsuran per Bulan: ${peminjaman.angsuranPerBulan}'),
              Text('Total Hutang: ${peminjaman.totalHutang}'),
            ],
          ),
        ),
      ),
    );
  }
}
