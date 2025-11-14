import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'riwayat.dart'; // ✅ pastikan file riwayat.dart sudah ada
import 'akun1.dart'; // ✅ tambahkan ini agar bisa navigasi ke halaman akun

class SertifPengawalPage extends StatelessWidget {
  const SertifPengawalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCC66),
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text(
          'Sertifikat Pengawal Sawit',
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
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    'Sertifikat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TambahSertifPage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add_circle_outline, color: Colors.black),
                        SizedBox(width: 8),
                        Text(
                          'Tambahkan sertifikat anda',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Anda Belum Mempunyai Sertifikat webinar Pengawal Sawit',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),

      // ✅ Perubahan di sini
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // index 1 = bagian tengah (chart)
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context); // kembali ke halaman sebelumnya
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RiwayatPage()),
            );
          } else if (index == 2) {
            // ✅ Navigasi ke halaman akun
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountPage1()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

// 🟢 Halaman Tambah Sertifikat (upload file)
class TambahSertifPage extends StatefulWidget {
  const TambahSertifPage({super.key});

  @override
  State<TambahSertifPage> createState() => _TambahSertifPageState();
}

class _TambahSertifPageState extends State<TambahSertifPage> {
  String? _fileName;

  void _uploadFile() {
    final uploadInput = html.FileUploadInputElement();
    uploadInput.accept = '.pdf,.jpg,.jpeg,.png';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files!.first;
      setState(() {
        _fileName = file.name;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File "${file.name}" berhasil dipilih!'),
          backgroundColor: Colors.green[700],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCC66),
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text(
          'Tambah Sertifikat',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Halaman Tambah Sertifikat',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _uploadFile,
              icon: const Icon(Icons.upload_file, color: Colors.white),
              label: const Text(
                "Upload File Sertifikat",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            if (_fileName != null) ...[
              const SizedBox(height: 20),
              Text(
                "📄 File terpilih: $_fileName",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
