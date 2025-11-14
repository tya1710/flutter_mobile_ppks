import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'akun1.dart';

class AktivitasPage extends StatefulWidget {
  const AktivitasPage({super.key});

  @override
  State<AktivitasPage> createState() => _AktivitasPageState();
}

class _AktivitasPageState extends State<AktivitasPage> {
  // 🔹 Data dummy bisa kamu ganti nanti dengan database / API
  List<Map<String, dynamic>> catatanPanen = [
    {
      "icon": Icons.local_florist,
      "text": "Catatan Panen - Kepada Siapa Anda Menjual",
    },
  ];

  List<Map<String, dynamic>> catatanPerawatan = [
    {"icon": Icons.water_drop, "text": "Penyiraman - Tanggal Penyiraman"},
    {"icon": Icons.eco, "text": "Pemupukan - Jenis Pemupukan"},
    {"icon": Icons.agriculture, "text": "Pembabatan - Biaya Pembabatan"},
  ];

  // 🔹 Fungsi edit data
  void _editItem(List<Map<String, dynamic>> list, int index) async {
    final TextEditingController controller =
        TextEditingController(text: list[index]['text']);

    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Aktivitas'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ubah deskripsi aktivitas',
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Batal'),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text('Simpan'),
              onPressed: () => Navigator.pop(context, controller.text),
            ),
          ],
        );
      },
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        list[index]['text'] = result;
      });
    }
  }

  // 🔹 Fungsi hapus data
  void _deleteItem(List<Map<String, dynamic>> list, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hapus Aktivitas'),
          content: const Text('Apakah kamu yakin ingin menghapus data ini?'),
          actions: [
            TextButton(
              child: const Text('Batal'),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Hapus'),
              onPressed: () {
                setState(() {
                  list.removeAt(index);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // 🔹 UI utama
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Riwayat Aktivitas',
            style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE0B2), Color(0xFFFFC107)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildActivityCard("Catatan Panen", catatanPanen),
            const SizedBox(height: 16),
            _buildActivityCard("Catatan Perawatan", catatanPerawatan),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF009688),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardPage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AccountPage1()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Data'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }

  // 🔹 Widget kartu
  Widget _buildActivityCard(String title, List<Map<String, dynamic>> list) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("“$title”",
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              children: List.generate(list.length, (index) {
                return _buildActivityItem(list, index);
              }),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Widget item aktivitas
  Widget _buildActivityItem(List<Map<String, dynamic>> list, int index) {
    final item = list[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(item['icon'], color: Colors.brown[700]),
          const SizedBox(width: 10),
          Expanded(child: Text(item['text'])),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blueGrey),
            onPressed: () => _editItem(list, index),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: () => _deleteItem(list, index),
          ),
        ],
      ),
    );
  }
}
