import 'package:flutter/material.dart';
import 'akun1.dart'; // pastikan akun1.dart ada di folder yang sama

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardContent(),
    const Placeholder(),
    const AccountPage1(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      // Navigasi dengan animasi slide ke halaman akun
      Navigator.push(context, _createRoute(const AccountPage1()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // Animasi transisi halus ke kanan
  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // mulai dari kanan
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF009688),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER ATAS
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  color: Color(0xFF009688),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // === Klik Halo User buka halaman akun dengan animasi ===
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const AccountPage1(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;
                              final tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                AssetImage('assets/images/@jimmyyjp.jpg'),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Halo, User",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.notifications_none, color: Colors.white),
                  ],
                ),
              ),

              // ISI DASHBOARD
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ==== KARTU INFORMASI ====
                    Row(
                      children: [
                        Expanded(
                          child: _infoCard(
                            "CPO International",
                            "Rp.",
                            "Tanggal",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _infoCard(
                            "Harga TBS Disbun Riau",
                            "Rp.",
                            "Tanggal",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // ==== CATAT KEGIATAN KEBUN ====
                    _sectionTitle("Catat Kegiatan Kebun"),
                    _gradientBox(
                      children: [
                        _menuItem(Icons.nature, "Kebun Saya"),
                        _menuItem(Icons.agriculture, "Panen"),
                        _menuItem(Icons.grass, "Rawat"),
                        _menuItem(Icons.camera_alt, "Dokumentasi"),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // ==== TINGKATKAN PRODUKTIVITAS ====
                    _sectionTitle("Tingkatkan Produktivitas"),
                    _gradientBox(
                      children: [
                        _menuItem(Icons.local_florist, "Pengawal Sawit"),
                        _menuItem(Icons.engineering, "Sewa Agronomis"),
                        _menuItem(Icons.security, "Pengawal Sawitina"),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // ==== LAPORAN KEBUN ====
                    _sectionTitle("Laporan Kebun:"),
                    _reportCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =====================================================
  // ============  WIDGET PEMBANTU  ======================
  // =====================================================

  static Widget _infoCard(String title, String price, String date) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 6),
          Text(price, style: const TextStyle(color: Colors.red, fontSize: 13)),
          const SizedBox(height: 6),
          Text(date, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget _gradientBox({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFE59D), Color(0xFFFFB347)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: children,
      ),
    );
  }

  static Widget _menuItem(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.orange, size: 35),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _reportCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pendapatan Bersih",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          _textRow("Total Pendapatan", "Rp."),
          _textRow("Total Pengeluaran", "Rp."),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text("Lihat Detail"),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _textRow(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left, style: const TextStyle(fontSize: 14)),
        Text(right, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
