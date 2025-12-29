import 'package:flutter/material.dart';

class EditProfilPage2 extends StatelessWidget {
  const EditProfilPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFECB3), Color(0xFFFFC107)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ===== APP BAR CUSTOM =====
              Container(
                color: const Color(0xFF009688),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                width: double.infinity,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Edit Profil",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ===== FOTO PROFIL =====
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_outline,
                  size: 70,
                  color: Colors.redAccent,
                ),
              ),

              const SizedBox(height: 30),

              // ===== FORM =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Nama"),
                    const SizedBox(height: 5),
                    _buildTextField(hint: "Suryani"),

                    const SizedBox(height: 15),
                    const Text("Email"),
                    const SizedBox(height: 5),
                    _buildTextField(hint: "Suryanimil@gmail.com"),

                    const SizedBox(height: 15),
                    const Text("Bio"),
                    const SizedBox(height: 5),
                    _buildTextField(hint: "Pengusaha"),

                    const SizedBox(height: 15),
                    const Text("No Handphone"),
                    const SizedBox(height: 5),
                    _buildTextField(hint: "081344897661"),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ===== TOMBOL SIMPAN =====
              SizedBox(
                width: 90,
                height: 28,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    "simpan",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== FIELD PUTIH =====
  static Widget _buildTextField({String? hint}) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black54, fontSize: 13),
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
