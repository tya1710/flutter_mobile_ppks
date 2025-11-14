import 'package:flutter/material.dart';
import 'catatrawat.dart';

class PerawatanSanitasiPage extends StatefulWidget {
  const PerawatanSanitasiPage({super.key});

  @override
  State<PerawatanSanitasiPage> createState() => _PerawatanSanitasiPageState();
}

class _PerawatanSanitasiPageState extends State<PerawatanSanitasiPage> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();
  final TextEditingController _biayaController = TextEditingController();
  final TextEditingController _lainnyaController = TextEditingController();

  Future<void> _pilihTanggal(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _tanggalController.text = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Catat Rawat",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE082), Color(0xFFFFC107)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text("Perawatan Sanitasi",
                style: TextStyle(color: Color(0xFF33691E), fontSize: 16, fontWeight: FontWeight.bold)),
            const Text("Selanjutnya selesai", style: TextStyle(color: Colors.brown, fontSize: 13)),
            const SizedBox(height: 20),

            const Text("Tanggal Sanitasi", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: _tanggalController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Pilih Tanggal Sanitasi",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _pilihTanggal(context),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            const Text("Lokasi Area", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: _lokasiController,
              decoration: InputDecoration(
                hintText: "Masukkan lokasi area yang disanitasi",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            const Text("Total Biaya Sanitasi", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _biayaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: "Rp ",
                hintText: "Total Biaya Sanitasi",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            const Text("Total Biaya Lainnya", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _lainnyaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: "Rp ",
                hintText: "Total Biaya Lainnya",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.shade100, foregroundColor: Colors.black),
                    child: const Text("Kembali"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Data berhasil dikirim!"), backgroundColor: Colors.green),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, foregroundColor: Colors.white),
                    child: const Text("Kirim"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
