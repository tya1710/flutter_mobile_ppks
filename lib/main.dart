import 'package:flutter/material.dart';

void main() {
  runApp(const KawalKebunApp());
}

class KawalKebunApp extends StatelessWidget {
  const KawalKebunApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kawal Kebun',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _openPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => const PopupScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kawal Kebun - Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _openPopup(context),
          child: const Text('Buka Popup Login Google'),
        ),
      ),
    );
  }
}

class PopupScreen extends StatelessWidget {
  const PopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              // ==== LOGO & JUDUL ====
              // pastikan asset ada di folder assets dan terdaftar di pubspec.yaml
              Image.asset(
                'assets/images/logo (2).jpg',
                height: 80,
                errorBuilder: (c, o, s) => const SizedBox(height: 80),
              ),
              const SizedBox(height: 10),
              const Text(
                "KAWAL\nKEBUN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0E5D4E),
                  height: 1.1,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 30),

              // ==== KOTAK PUTIH ====
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE4BB70),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/logo (2).jpg',
                      height: 50,
                      errorBuilder: (c, o, s) => const SizedBox(height: 50),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "KAWAL\nKEBUN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0E5D4E),
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      "Pilih Akun Google Anda",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),

                    _buildAccountItem('assets/images/@jimmyyjp.jpg', 'Haryanto',
                        'Haryantoayy@gmail.com'),
                    const SizedBox(height: 12),
                    _buildAccountItem('assets/images/download (3).jpg', 'Suryani',
                        'Suryanimil@gmail.com'),
                    const SizedBox(height: 12),
                    _buildAccountItem('assets/images/Me.jpg', 'YantoGZ',
                        'superrgz@gmail.com'),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF21B66F),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 3,
                        ),
                        child: const Text(
                          "Kembali",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildAccountItem(String image, String name, String email) {
    return InkWell(
      onTap: () {
        // TODO: Aksi ketika akun dipilih
      },
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          CircleAvatar(radius: 22, backgroundImage: AssetImage(image)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
