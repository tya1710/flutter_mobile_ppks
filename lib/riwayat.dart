import 'package:flutter/material.dart';
import 'riwayat2.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  String _selectedJenis = 'Semua Jenis';
  String _selectedTanggal = 'Semua Tanggal';
  String _selectedRentang = 'Semua Tanggal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE59A),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Riwayat',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔹 DROPDOWN: Semua Jenis
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: GestureDetector(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Riwayat2Page(),
                    ),
                  );
                  if (result != null && result is String) {
                    setState(() {
                      _selectedJenis = result;
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedJenis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 28,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 DROPDOWN: Semua Tanggal
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedTanggal,
                  isExpanded: true,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    size: 28,
                    color: Colors.grey,
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  dropdownColor: Colors.white,
                  items: <String>[
                    'Semua Tanggal',
                    'Hari Ini',
                    'Minggu Ini',
                    'Bulan Ini',
                  ].map(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedTanggal = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Menambahkan Data Bisnis",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Kebun", style: TextStyle(fontSize: 14)),
                Text(
                  "Rating",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),
            const Text("date", style: TextStyle(fontSize: 14)),
            const SizedBox(height: 30),

            // 🔹 Rentang Waktu
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pilih Rentang Waktu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),

                  for (var item in [
                    "Semua Tanggal",
                    "30 Hari Terakhir",
                    "90 Hari Terakhir",
                    "Pilih Rentang Waktu"
                  ])
                    RadioListTile<String>(
                      title: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      value: item,
                      groupValue: _selectedRentang,
                      onChanged: (value) {
                        setState(() {
                          _selectedRentang = value!;
                        });
                      },
                    ),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Berhasil diterapkan!',
                              style: TextStyle(fontSize: 14),
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: const Text(
                        "Terapkan",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
