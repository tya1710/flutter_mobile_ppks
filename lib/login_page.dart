import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'popup.dart';
import 'popup_nomor.dart';
import 'signup_page.dart';
import 'dashboard.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // ✅ Google Sign-In tanpa clientId (Android baca dari google-services.json)
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // ✅ Fungsi login Google (final, ready to use)
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Memulai login dengan Google...')),
      );

      // 1. Munculkan dialog pilih akun
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login dibatalkan')),
        );
        return;
      }

      // 2. Ambil token autentikasi
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // 3. Buat credential Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 4. Login ke Firebase
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login berhasil: ${user?.email ?? "-"}'),
        ),
      );

      // 5. Kalau sukses → masuk ke Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardPage()),
      );
    } catch (e) {
      debugPrint("Google login error: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Google gagal: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFE082),
                Color(0xFFFFB300),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),

                  // LOGO + TITLE
                  Column(
                    children: [
                      Image.asset('assets/images/logo.png', height: 100),
                      const SizedBox(height: 10),
                      const Text(
                        "KAWAL KEBUN",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // ✅ TOMBOL LOGIN GOOGLE
                  ElevatedButton.icon(
                    icon: Image.asset('assets/images/google.jpg', height: 20),
                    label: const Text(
                      "Masuk dengan Google",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      await signInWithGoogle(context);
                    },
                  ),

                  const SizedBox(height: 12),

                  // NOMOR HP BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PopupNomor(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFCC80),
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Masuk dengan nomor hp",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // EMAIL FIELD
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Email atau username",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // SUBMIT BUTTON (langsung ke Dashboard tanpa auth)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Selesai",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
