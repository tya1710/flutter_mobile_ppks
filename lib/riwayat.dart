import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'akun1.dart';
import 'riwayat2.dart'; // ✅ ditambahkan agar halaman Riwayat2 bisa diakses

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  String _selectedJenis = 'Semua Jenis';
  String _selectedTanggal = 'Semua Tanggal';
  String _selectedRentang = 'Semua Tanggal';

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    } else if (index == 1) {
      // Sudah di halaman Riwayat
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AccountPage1()),
      );
    }
  }

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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Dropdown Jenis (dengan navigasi ke Riwayat2)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: GestureDetector(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Riwayat2Page()),
                  );
                  if (result != null && result is String) {
                    setState(() {
                      _selectedJenis = result;
                    });
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_selectedJenis),
                      const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 🔹 Dropdown Tanggal
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
                value: _selectedTanggal,
                isExpanded: true,
                underline: const SizedBox(),
                items: ['Semua Tanggal', 'Hari Ini', 'Minggu Ini', 'Bulan Ini']
                    .map((String value) =>
                        DropdownMenuItem(value: value, child: Text(value)))
                    .toList(),
                onChanged: (value) => setState(() {
                  _selectedTanggal = value!;
                }),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Menambahkan Data Bisnis",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Kebun"),
                Text("Rating", style: TextStyle(color: Colors.green)),
              ],
            ),
            const SizedBox(height: 5),
            const Text("date"),
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
                  const Text("Pilih Rentang Waktu",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  for (var item in [
                    "Semua Tanggal",
                    "30 Hari Terakhir",
                    "90 Hari Terakhir",
                    "Pilih Rentang Waktu"
                  ])
                    RadioListTile<String>(
                      title: Text(item),
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
                        // ✅ tampilkan notifikasi snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Berhasil diterapkan!'),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          ),
                        );

                        // ✅ setelah 2 detik langsung ke Dashboard
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardPage()),
                          );
                        });
                      },
                      child: const Text("Terapkan"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      // 🔹 Navbar standar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF009688),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}
