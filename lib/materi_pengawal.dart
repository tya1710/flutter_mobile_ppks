import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';

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

  Future<void> _uploadFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );

    if (result == null) return;

    final file = result.files.single;

    setState(() {
      _materiList.add({
        "judul": file.name,
        "tanggal":
            "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
        "path": file.path,
      });
    });
  }

  Future<void> _shareMateri(String path, String judul) async {
    await Share.shareXFiles([XFile(path)], text: "Materi: $judul");
  }

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
          'Materi Pengawal Sawit (Mobile)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _materiList.length,
        itemBuilder: (context, index) {
          final materi = _materiList[index];

          return ListTile(
            title: Text(materi["judul"]),
            subtitle: Text(materi["tanggal"]),
            trailing: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () =>
                  _shareMateri(materi["path"], materi["judul"]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: _uploadFile,
        child: const Icon(Icons.add, color: Colors.white),
      ),
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
