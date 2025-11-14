import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

// Import halaman lain untuk navigasi
import 'dashboard.dart';
import 'riwayat.dart';
import 'akun1.dart';

class MateriPengawalPage extends StatefulWidget {
  const MateriPengawalPage({super.key});

  @override
  State<MateriPengawalPage> createState() => _MateriPengawalPageState();
}

class _MateriPengawalPageState extends State<MateriPengawalPage> {
  final List<Map<String, dynamic>> _materiList = [];

  // 🔹 Fungsi upload file
  void _uploadFile() {
    final uploadInput = html.FileUploadInputElement();
    uploadInput.accept = '.pdf,.doc,.docx,.jpg,.png,.jpeg';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files!.first;
      final reader = html.FileReader();

      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        setState(() {
          _materiList.add({
            "judul": file.name,
            "tanggal":
                "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
            "fileUrl": reader.result as String,
          });
        });
      });
    });
  }

  // ✅ Fungsi bagikan (fix agar tidak share base64)
  void _shareMateri(String judul, String tanggal, String fileUrl) {
    try {
      // Ambil bagian base64 (tanpa prefix data:image/...)
      final base64Str = fileUrl.split(',').last;

      // Decode base64 → bytes, lalu jadikan blob
      final byteCharacters = html.window.atob(base64Str);
      final byteNumbers = List<int>.generate(
          byteCharacters.length, (i) => byteCharacters.codeUnitAt(i));
      final blob = html.Blob([byteNumbers]);

      // Buat URL blob sementara
      final blobUrl = html.Url.createObjectUrlFromBlob(blob);

      // Buat pesan WhatsApp
      final message =
          "📚 Materi: $judul\n📅 Tanggal: $tanggal\nLihat file di sini: $blobUrl";

      // Encode untuk URL
      final encoded = Uri.encodeComponent(message);

      // Buka WhatsApp Web dengan pesan
      html.window.open("https://wa.me/?text=$encoded", "_blank");
    } catch (e) {
      print("Gagal membagikan materi: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Gagal membagikan materi"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // 🔹 Fungsi download
  void _downloadMateri(String fileUrl, String namaFile) {
    final anchor = html.AnchorElement(href: fileUrl)
      ..download = namaFile
      ..click();
  }

  // 🔹 Navigasi Bottom Bar
  void _onNavTap(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
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
          'Materi Pengawal Sawit',
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

      // 🔹 Isi Halaman
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _materiList.isEmpty
            ? const Center(
                child: Text(
                  "Belum ada materi.\nKlik tombol + untuk menambahkan.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: _materiList.length,
                itemBuilder: (context, index) {
                  final materi = _materiList[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔸 Gambar + Judul + Tanggal
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.image,
                                size: 40, color: Colors.black54),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  materi["judul"],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  materi["tanggal"],
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // 🔹 Tombol Bagikan & Unduh
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () => _shareMateri(
                                materi["judul"],
                                materi["tanggal"],
                                materi["fileUrl"],
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text("Bagikan Materi"),
                            ),
                            IconButton(
                              onPressed: () => _downloadMateri(
                                  materi["fileUrl"], materi["judul"]),
                              icon: const Icon(Icons.download,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),

      // 🔹 Tombol Tambah
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: _uploadFile,
        child: const Icon(Icons.add, color: Colors.white),
      ),

      // 🔹 Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: _onNavTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
