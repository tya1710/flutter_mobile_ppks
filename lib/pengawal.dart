import 'package:flutter/material.dart';
import 'sertif_pengawal.dart';
import 'materi_pengawal.dart';
import 'akun1.dart';
import 'riwayat.dart';

class PengawalPage extends StatefulWidget {
  const PengawalPage({super.key});

  @override
  State<PengawalPage> createState() => _PengawalPageState();
}

class _PengawalPageState extends State<PengawalPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pop(context);
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RiwayatPage()),
      );
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
      backgroundColor: const Color(0xFFFFCC66),
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text(
          'Pengawal Sawit',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SertifPengawalPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Sertifikat",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MateriPengawalPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Materi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // 🔹 NAVBAR SESUAI GAMBAR KANAN (PUTIH & DEFAULT)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white, // 🔹 Putih polos
        selectedItemColor: Colors.green, // 🔹 Ikon aktif hijau
        unselectedItemColor: Colors.grey, // 🔹 Ikon nonaktif abu
        showSelectedLabels: false, // 🔹 Tanpa label
        showUnselectedLabels: false, // 🔹 Tanpa label
        elevation: 5, // 🔹 Sedikit bayangan bawah
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart), // sesuai contoh kanan
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
