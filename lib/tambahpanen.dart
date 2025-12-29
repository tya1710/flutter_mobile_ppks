import 'package:flutter/material.dart';
import 'catatrawat.dart';

// ⬇️ tambahan import untuk SQLite
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class TambahPanenPage extends StatefulWidget {
  const TambahPanenPage({super.key});

  @override
  State<TambahPanenPage> createState() => _TambahPanenPageState();
}

class _TambahPanenPageState extends State<TambahPanenPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _upahController = TextEditingController();

  // ⬇️ pegang instance database di sini
  Database? _database;

  Future<Database> get _db async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  // ⬇️ inisialisasi database & buat tabel kalau belum ada
  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, 'panen.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE panen (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tanggal TEXT,
            berat REAL,
            harga REAL,
            upah REAL
          )
        ''');
      },
    );
  }

  @override
  void dispose() {
    _tanggalController.dispose();
    _beratController.dispose();
    _hargaController.dispose();
    _upahController.dispose();
    super.dispose();
  }

  Future<void> _pilihTanggal() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _tanggalController.text =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  }

  // ⬇️ versi baru: simpan ke SQLite
  Future<void> _simpanData() async {
    if (_formKey.currentState!.validate()) {
      final db = await _db;

      // siapkan data yang mau disimpan
      final data = {
        'tanggal': _tanggalController.text,
        'berat': double.parse(_beratController.text),
        'harga': double.parse(_hargaController.text),
        'upah': double.parse(_upahController.text),
      };

      await db.insert('panen', data);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data panen berhasil disimpan ke database"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFECB3),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Tambahkan Panen"),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tambahkan Panen Anda",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Isi data panen dengan benar",
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
              const SizedBox(height: 20),

              // 📅 Tanggal Panen
              const Text("Tanggal Panen"),
              const SizedBox(height: 6),
              TextFormField(
                controller: _tanggalController,
                readOnly: true,
                onTap: _pilihTanggal,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? "Pilih tanggal panen" : null,
              ),
              const SizedBox(height: 16),

              // ⚖️ Berat Total
              const Text("Berat Total TBS (Kg)"),
              const SizedBox(height: 6),
              TextFormField(
                controller: _beratController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Masukkan total berat TBS",
                  filled: true,
                  fillColor: const Color(0xFFFFE082),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? "Masukkan berat TBS" : null,
              ),
              const SizedBox(height: 16),

              // 💰 Harga
              const Text("Harga TBS (Rp/Kg)"),
              const SizedBox(height: 6),
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Masukkan harga per Kg",
                  filled: true,
                  fillColor: const Color(0xFFFFD54F),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? "Masukkan harga" : null,
              ),
              const SizedBox(height: 16),

              // 👷 Upah Panen
              const Text("Upah Panen"),
              const SizedBox(height: 6),
              TextFormField(
                controller: _upahController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Masukkan total upah panen",
                  filled: true,
                  fillColor: const Color(0xFFFFC107),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? "Masukkan upah panen" : null,
              ),
              const SizedBox(height: 30),

              // 🟩 Tombol Simpan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _simpanData, // ⬅️ tetap sama, tapi sekarang nyimpan ke DB
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Simpan Panen",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🌱 Tombol Catat Rawat
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.local_florist, color: Colors.green),
                  label: const Text(
                    "Catat Rawat",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green, width: 2),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CatatRawatPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
