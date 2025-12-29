import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';

class PopupKode extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const PopupKode({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  State<PopupKode> createState() => _PopupKodeState();
}

class _PopupKodeState extends State<PopupKode> {
  final TextEditingController _kodeController = TextEditingController();
  bool _isVerifying = false;
  bool _isResending = false;

  late String _currentVerificationId;

  @override
  void initState() {
    super.initState();
    _currentVerificationId = widget.verificationId;
  }

  Future<void> _verifyCode() async {
    final code = _kodeController.text.trim();

    if (code.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kode OTP harus 6 digit')),
      );
      return;
    }

    setState(() => _isVerifying = true);

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _currentVerificationId,
        smsCode: code,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      if (!mounted) return;

      // ✅ OTP benar → masuk ke Dashboard
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const DashboardPage()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      setState(() => _isVerifying = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kode salah: ${e.message}')),
      );
    } catch (e) {
      setState(() => _isVerifying = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi error: $e')),
      );
    }
  }

  Future<void> _resendCode() async {
    setState(() => _isResending = true);

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {
          // Biar user tetap input manual, kita nggak auto-login di sini.
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() => _isResending = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Gagal kirim ulang kode: ${e.message}')),
          );
        },
        codeSent: (String newVerificationId, int? resendToken) {
          setState(() {
            _isResending = false;
            _currentVerificationId = newVerificationId;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Kode baru sudah dikirim')),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // timeout, tapi user tetap bisa pakai kode yang diterima
        },
      );
    } catch (e) {
      setState(() => _isResending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi error: $e')),
      );
    }
  }

  @override
  void dispose() {
    _kodeController.dispose();
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Masukkan Kode yang dikirim ke ${widget.phoneNumber}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _kodeController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    hintText: "6 Digit kode",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: _isResending ? null : _resendCode,
                  child: _isResending
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text("Dapatkan Kode Baru"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _isVerifying ? null : _verifyCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 45),
                  ),
                  child: _isVerifying
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
