import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // ✅ tambah ini
import 'popup_kode.dart';

class PopupNomor extends StatefulWidget {
  const PopupNomor({super.key});

  @override
  State<PopupNomor> createState() => _PopupNomorState();
}

class _PopupNomorState extends State<PopupNomor> {
  final TextEditingController _controller = TextEditingController();
  bool _isSending = false;

  Future<void> _sendOtp() async {
    final raw = _controller.text.trim();

    if (raw.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan nomor handphone dulu')),
      );
      return;
    }

    // Contoh: user isi 0812xxxx → jadi +62812xxxx
    String phoneNumber = raw;
    if (!phoneNumber.startsWith('+')) {
      if (phoneNumber.startsWith('0')) {
        phoneNumber = phoneNumber.substring(1);
      }
      phoneNumber = '+62$phoneNumber';
    }

    setState(() => _isSending = true);

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),

        // Kadang Android bisa auto-verify tanpa input kode
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Bisa langsung login di sini kalau mau,
          // tapi biar alur tetap lewat PopupKode, kita abaikan saja / opsional.
        },

        verificationFailed: (FirebaseAuthException e) {
          setState(() => _isSending = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verifikasi gagal: ${e.message}')),
          );
        },

        codeSent: (String verificationId, int? resendToken) {
          setState(() => _isSending = false);

          // 👉 Pindah ke halaman input kode OTP
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PopupKode(
                verificationId: verificationId,
                phoneNumber: phoneNumber,
              ),
            ),
          );
        },

        codeAutoRetrievalTimeout: (String verificationId) {
          // Kalau timeout, user tetap bisa masukin kode manual di PopupKode
        },
      );
    } catch (e) {
      setState(() => _isSending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi error: $e')),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE082), Color(0xFFFFB300)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', height: 80),
                const SizedBox(height: 10),
                const Text(
                  "KAWAL KEBUN",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 40),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Masukkan nomor handphone",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "08xxxxxxxxxx",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.phone),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _isSending ? null : _sendOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 45),
                  ),
                  child: _isSending
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text("Selanjutnya"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
