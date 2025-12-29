import 'package:flutter/material.dart';
import 'database/db_helper.dart';
import 'models/panen_model.dart';

class DataCatatPanenPage extends StatefulWidget {
  const DataCatatPanenPage({super.key});

  @override
  State<DataCatatPanenPage> createState() => _DataCatatPanenPageState();
}

class _DataCatatPanenPageState extends State<DataCatatPanenPage> {
  late Future<List<Panen>> _futurePanen;

  @override
  void initState() {
    super.initState();
    _futurePanen = DBHelper.instance.getAllPanen(); // 🔥 Ambil dari SQLite
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA430),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Laporan Kebun",
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFD29D),
              Color(0xFFFFC727),
            ],
          ),
        ),

        child: FutureBuilder<List<Panen>>(
          future: _futurePanen,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }

            final data = snapshot.data ?? [];

            if (data.isEmpty) {
              return const Center(
                child: Text(
                  "Belum Ada Laporan Kebun",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              );
            }

            // 🔥 Jika ada data → tampilkan list laporan
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                final pendapatan = (item.berat * item.harga) - item.upah;

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tanggal : ${item.tanggal}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),

                        const SizedBox(height: 6),
                        Text("Berat TBS : ${item.berat} Kg"),
                        Text("Harga TBS : Rp ${item.harga} /Kg"),
                        Text("Upah Panen : Rp ${item.upah}"),

                        const SizedBox(height: 6),
                        Text(
                          "Pendapatan Bersih : Rp $pendapatan",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
