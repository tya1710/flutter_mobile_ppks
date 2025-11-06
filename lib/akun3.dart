import 'package:flutter/material.dart';
import 'editprofil3.dart';
import 'login_page.dart';

class AccountPage3 extends StatelessWidget {
  const AccountPage3({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Keluar dari akun Anda?"),
          content: const Text("Semua draf yang anda simpan akan tetap tersedia di perangkat ini."),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Kembali")),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
              child: const Text("Keluar", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF009688),
        title: const Text("Akun Saya", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFE082), Color(0xFFFFC107)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/images/Me.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const Text("YantoGZ",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const Text("superrgz@gmail.com"),
                  const Text("Petani Muda 🌾"),
                  const Text("Telp: 085270689236"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const EditProfilPage3()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text("Edit Profil"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _buildMenu(Icons.add_circle_outline, "Tambahkan Panen"),
            _buildMenu(Icons.history, "Riwayat Aktivitas"),
            _buildMenu(Icons.lock_outline, "Kata Sandi"),
            _buildMenu(Icons.logout, "Keluar", onTap: () => _showLogoutDialog(context)),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildMenu(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.green[900]),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF009688),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
        BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Data'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
      ],
    );
  }
}
