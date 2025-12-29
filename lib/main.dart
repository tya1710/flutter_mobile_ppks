import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Inisialisasi Firebase (penting untuk Google Sign-In + Auth)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ✅ Atur status bar & nav bar hanya untuk Android/iOS
  if (!kIsWeb) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TampilanAwal(), // ✅ Splash screen dulu
    );
  }
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

    // ✅ Setelah 3 detik, pindah ke LoginPage
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
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
            colors: [Color(0xFFFFD54F), Color(0xFFFFB300)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 250,
            ),
            const SizedBox(height: 8),
            const Text(
              'KAWAL\nKEBUN',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004D40),
                letterSpacing: 1.5,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
