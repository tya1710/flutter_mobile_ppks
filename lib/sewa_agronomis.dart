import 'package:flutter/material.dart';
import 'riwayat_pesanan.dart';
import 'dashboard.dart';
import 'akun1.dart';
import 'riwayat.dart'; // ✅ Tambahkan import ke halaman Riwayat

class SewaAgronomisPage extends StatelessWidget {
  const SewaAgronomisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD480),
      appBar: AppBar(
        title: const Text(
          "Sewa Agronomis",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      // ✅ NAVBAR — sama persis kayak foto kanan
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 1, // posisi tengah aktif
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 5,
        onTap: (index) {
          if (index == 0) {
            // 🔹 Navigasi ke Dashboard
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardPage()),
            );
          } else if (index == 1) {
            // 🔹 Navigasi ke Riwayat
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RiwayatPage()),
            );
          } else if (index == 2) {
            // 🔹 Navigasi ke Akun
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AccountPage1()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),

      // ✅ BODY (tidak diubah)
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RiwayatPesananPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: const ListTile(
                    title: Text(
                      "Riwayat Pemesanan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Daftar Pemesanan Pengawal Sawit Anda"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ),
              ),

              const Text(
                "Layanan Sewa Agronomis",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tanya Agronomis",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("note"),
                        Text("Rp."),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              const Text(
                "Keunggulan Premium Sewa Agronomis",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: Text("Tanya Agronomis")),
                      ),
                    ),
                    VerticalDivider(thickness: 1, color: Colors.black),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: Text("Kunjungan Agronomis")),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
