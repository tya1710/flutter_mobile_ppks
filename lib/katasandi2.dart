import 'package:flutter/material.dart';
import 'katasandi3.dart';

class KataSandi2 extends StatefulWidget {
  const KataSandi2({super.key});

  @override
  State<KataSandi2> createState() => _KataSandi2State();
}

class _KataSandi2State extends State<KataSandi2> {
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text(
          'Kata sandi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFCC80), Color(0xFFFFD54F)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Ketik kata sandi lama',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: oldPassController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '**********',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Ketik kata sandi baru',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: newPassController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '**********',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Konfirmasi kata sandi baru',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: confirmPassController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '**********',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[200],
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black54, width: 1),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    elevation: 0,
                  ),
                  onPressed: () {
                    final newPass = newPassController.text.trim();
                    final confirmPass = confirmPassController.text.trim();

                    if (newPass.isNotEmpty &&
                        confirmPass.isNotEmpty &&
                        newPass == confirmPass) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KataSandi3()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Kata sandi baru tidak cocok')),
                      );
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
