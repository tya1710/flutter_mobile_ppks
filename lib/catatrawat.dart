import 'package:flutter/material.dart';
import 'perawatan_pemupukan.dart';
import 'perawatan_penunasan.dart';
import 'perawatan_pembabatan.dart';
import 'perawatan_penyemprotan.dart';
import 'perawatan_kastrasi.dart';
import 'perawatan_sanitasi.dart';

class CatatRawatPage extends StatelessWidget {
  const CatatRawatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> jenisPerawatan = [
      {
        "icon": Icons.local_florist,
        "color": Colors.brown,
        "label": "Pemupukan",
        "page": const PerawatanPemupukanPage(),
      },
      {
        "icon": Icons.cut,
        "color": Colors.green,
        "label": "Penunasan",
        "page": const PerawatanPenunasanPage(),
      },
      {
        "icon": Icons.sanitizer,
        "color": Colors.blue,
        "label": "Penyemprotan",
        "page": const PerawatanPenyemprotanPage(),
      },
      {
        "icon": Icons.grass,
        "color": Colors.orange,
        "label": "Pembabatan",
        "page": const PerawatanPembabatanPage(),
      },
      {
        "icon": Icons.coronavirus,
        "color": Colors.red,
        "label": "Kastrasi",
        "page": const PerawatanKastrasiPage(),
      },
      {
        "icon": Icons.cleaning_services,
        "color": Colors.teal,
        "label": "Sanitasi",
        "page": const PerawatanSanitasiPage(),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Catatan Rawat',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE082), Color(0xFFFFC107)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pilih Jenis Perawatan",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF33691E),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Selanjutnya isi data perawatan",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF8D6E63),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: jenisPerawatan.length,
                  itemBuilder: (context, index) {
                    final item = jenisPerawatan[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => item["page"],
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: item["color"].withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  item["icon"],
                                  color: item["color"],
                                  size: 28,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                item["label"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios, size: 16),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Batalkan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
