import 'package:flutter/material.dart';
import 'riwayat.dart'; // ✅ Tambahan untuk navigasi ke Riwayat
import 'akun1.dart'; // ✅ Tambahan untuk navigasi ke Akun

class LaporanDetailPage extends StatelessWidget {
  const LaporanDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC94A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00994D),
        title: const Text(
          'Laporan Detail',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // 🔹 NAVBAR DENGAN NAVIGASI
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 5,
        onTap: (index) {
          if (index == 1) {
            // ✅ Navigasi ke RiwayatPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RiwayatPage()),
            );
          } else if (index == 2) {
            // ✅ Navigasi ke AkunPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AccountPage1()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),

      // 🔹 BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Pendapatan Bersih
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  children: [
                    Text(
                      "Pendapatan Bersih Anda",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Rp.",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Divider(thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Pendapatan"),
                        Text("Rp."),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Pengeluaran"),
                        Text("Rp."),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // 🔹 Total Pendapatan
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pendapatan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Rp.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Berat TBS"),
                        Text("Kg"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rata rata harga TBS"),
                        Text("Rp"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // 🔹 Total Pengeluaran
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pengeluaran",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Rp.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Panen"),
                        Text("Rp"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Upah Panen"),
                        Text("Rp"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Upah Langsir"),
                        Text("Rp"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Biaya Langsir"),
                        Text("Rp"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
