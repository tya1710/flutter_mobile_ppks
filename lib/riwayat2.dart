import 'package:flutter/material.dart';

class Riwayat2Page extends StatefulWidget {
  const Riwayat2Page({super.key});

  @override
  State<Riwayat2Page> createState() => _Riwayat2PageState();
}

class _Riwayat2PageState extends State<Riwayat2Page> {
  String selectedJenis = "Semua Jenis";

  final List<String> jenisList = [
    "Semua Jenis",
    "Pencapaian Program",
    "Mesin Penghasil Sawit Poin",
    "Pembelian",
    "Transfer Sawit Point",
    "Pengembalian Sawit Point",
    "Aktivitas",
    "Undang Teman",
    "Mendaftarkan Pengguna",
    "Lainnya",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD36E),
      appBar: AppBar(
        title: const Text(
          "Riwayat",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter Atas
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Semua Jenis',
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Semua Tanggal',
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Menambahkan Data Bisnis",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Kebun"),
                Text("Rating", style: TextStyle(color: Colors.green)),
              ],
            ),
            const SizedBox(height: 5),
            const Text("date"),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFE59A),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Jenis",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  for (var item in jenisList)
                    RadioListTile<String>(
                      title: Text(item),
                      value: item,
                      groupValue: selectedJenis,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          selectedJenis = value!;
                        });
                      },
                    ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.pop(context, selectedJenis);
                      },
                      child: const Text("Terapkan"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
