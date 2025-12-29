import 'package:flutter/material.dart';

class PerawatanPemupukanPage extends StatefulWidget {
  const PerawatanPemupukanPage({super.key});

  @override
  State<PerawatanPemupukanPage> createState() => _PerawatanPemupukanPageState();
}

class _PerawatanPemupukanPageState extends State<PerawatanPemupukanPage> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _biayaController = TextEditingController();
  final TextEditingController _lainnyaController = TextEditingController();

  String? _jenisPupuk;

  Future<void> _pilihTanggal(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _tanggalController.text =
            "${picked.day}-${picked.month}-${picked.year}";
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
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE082), Color(0xFFFFC107)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Perawatan Pemupukan",
                style: TextStyle(
                  color: Color(0xFF33691E),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Selanjutnya selesai",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 20),

              // 📅 Tanggal Perawatan
              const Text("Tanggal Perawatan",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextField(
                controller: _tanggalController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Pilih Tanggal Perawatan",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _pilihTanggal(context),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // 🌾 Jenis Pupuk
              const Text("Jenis Pupuk",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _jenisPupuk,
                    hint: const Text("Pilih Jenis Pupuk"),
                    items: const [
                      DropdownMenuItem(
                          value: "Organik", child: Text("Organik")),
                      DropdownMenuItem(
                          value: "NPK", child: Text("NPK")),
                      DropdownMenuItem(
                          value: "Urea", child: Text("Urea")),
                      DropdownMenuItem(
                          value: "Kompos", child: Text("Kompos")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _jenisPupuk = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // ⚖️ Jumlah Kg
              const Text("Jumlah Kg",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextField(
                controller: _jumlahController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Total Berat Pupuk (Kg)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // 💰 Total Biaya Perawatan
              const Text("Total Biaya Perawatan",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextField(
                controller: _biayaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixText: "Rp ",
                  hintText: "Total Biaya Perawatan",
                  helperText:
                      "Total biaya perawatan termasuk upah & material.",
                  helperStyle: const TextStyle(fontSize: 12, color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // 💵 Total Biaya Lainnya
              const Text("Total Biaya Lainnya",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextField(
                controller: _lainnyaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixText: "Rp ",
                  hintText: "Total Biaya Lainnya",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              // 🔘 Tombol Aksi
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.shade100,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Kembali"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi saat tombol diklik
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Data berhasil dikirim!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Kirim"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
