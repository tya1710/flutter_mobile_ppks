import 'package:flutter/material.dart';
import 'tambahpanen.dart';
import 'data_catat_panen.dart'; // ← penting

class CatatPanenPage extends StatelessWidget {
  const CatatPanenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF3D5), // atas
              Color(0xFFFFC34A), // bawah
            ],
          ),
        ),
        child: Column(
          children: [
            // =================== APPBAR ===================
            PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: Container(
                height: 56,
                color: const Color(0xFF00994D),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Catat Panen",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ================= BOX ATAS =================
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Pantau Performa Kebun",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Mulai catat panen untuk optimalkan hasil kebun Anda.",
                            style: TextStyle(fontSize: 13, color: Colors.black54),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const DataCatatPanenPage(),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side:
                                    const BorderSide(color: Color(0xFF00994D)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Cek Laporan Kebun",
                                style: TextStyle(color: Color(0xFF00994D)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ================== JUDUL ===================
                    const Text(
                      "Priode Panen",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ================== CARD DATA ===================
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "date",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Berat", style: TextStyle(fontSize: 13)),
                              Text(
                                "Kg",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.black54),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Harga TBS/KG", style: TextStyle(fontSize: 13)),
                              Text(
                                "Rp.",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 140),
                  ],
                ),
              ),
            ),

            // ================= BUTTON BAWAH =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TambahPanenPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006622),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Catat Panen Baru",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
