import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TampilanAwal(),
  ));
}

class TampilanAwal extends StatefulWidget {
  const TampilanAwal({super.key});

  @override
  State<TampilanAwal> createState() => _TampilanAwalState();
}

class _TampilanAwalState extends State<TampilanAwal> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFD54F),
              Color(0xFFFFB300),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO
            Image.asset(
              'assets/images/logo (2).png',
              width: 250,
            ),
            const SizedBox(height: 8), // 🔥 jarak dikurangi (lebih dekat)
            // TEKS
            const Text(
              'KAWAL\nKEBUN',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004D40),
                letterSpacing: 1.5,
                height: 1.1, // 🔥 tinggi baris dipadatkan
              ),
            ),
          ],
        ),
      ),
    );
  }
}
