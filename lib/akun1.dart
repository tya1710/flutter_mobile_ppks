import 'package:flutter/material.dart';
import 'editprofil1.dart';
import 'login_page.dart';
import 'katasandi1.dart';
import 'aktivitas.dart';
import 'tambahpanen.dart';

class AccountPage1 extends StatelessWidget {
  const AccountPage1({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Keluar dari akun Anda?"),
          content: const Text(
            "Semua draf yang anda simpan akan tetap tersedia di perangkat ini.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Kembali"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
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
        title: const Text(
          "Akun Saya",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PROFIL
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
                    backgroundImage: AssetImage('assets/images/@jimmyyjp.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Haryanto",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("haryantoayy@gmail.com"),
                  const Text("Petani Cabe 🌶️"),
                  const Text("Telp: 081234567890"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfilPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Edit Profil"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // MENU LIST
            _buildMenu(Icons.add_circle_outline, "Tambahkan Panen", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TambahPanenPage(),
                ),
              );
            }),
            _buildMenu(Icons.history, "Riwayat Aktivitas", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AktivitasPage(),
                ),
              );
            }),
            _buildMenu(Icons.lock_outline, "Kata Sandi", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const KataSandi1(),
                ),
              );
            }),
            _buildMenu(Icons.logout, "Keluar",
                onTap: () => _showLogoutDialog(context)),
          ],
        ),
      ),
    );
  }

  static Widget _buildMenu(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.green[900]),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
