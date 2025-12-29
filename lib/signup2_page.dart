import 'package:flutter/material.dart';

class Signup2Page extends StatefulWidget {
  const Signup2Page({super.key});

  @override
  State<Signup2Page> createState() => _Signup2PageState();
}

class _Signup2PageState extends State<Signup2Page> {
  final TextEditingController _namaController = TextEditingController();

  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD54F),
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Langkah 1 dari 2',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Selesaikan membuat akun',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),

              // Logo Kawal Kebun
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'KAWAL KEBUN',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              const Text('Nama'),
              const SizedBox(height: 4),
              TextField(
                controller: _namaController,
                decoration: InputDecoration(
                  hintText: 'Nama ini akan muncul di profil kamu',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.black54),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text('Tanggal & Tahun Lahir'),
              const SizedBox(height: 4),
              const Text(
                'Nama ini akan muncul di profil kamu',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      hint: const Text('Hari'),
                      value: selectedDay,
                      onChanged: (value) {
                        setState(() {
                          selectedDay = value;
                        });
                      },
                      items: List.generate(
                        31,
                        (index) => DropdownMenuItem(
                          value: '${index + 1}',
                          child: Text('${index + 1}'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      hint: const Text('Bulan'),
                      value: selectedMonth,
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value;
                        });
                      },
                      items: [
                        'Januari',
                        'Februari',
                        'Maret',
                        'April',
                        'Mei',
                        'Juni',
                        'Juli',
                        'Agustus',
                        'September',
                        'Oktober',
                        'November',
                        'Desember',
                      ]
                          .map((month) => DropdownMenuItem(
                                value: month,
                                child: Text(month),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(width: 8),


                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      hint: const Text('Tahun'),
                      value: selectedYear,
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value;
                        });
                      },
                      items: List.generate(
                        60,
                        (index) {
                          int year = 2025 - index;
                          return DropdownMenuItem(
                            value: '$year',
                            child: Text('$year'),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text('Gender'),
              const SizedBox(height: 4),
              const Text(
                'Silahkan Pilih Gender Yang Sesuai',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Perempuan'),
                      value: 'Perempuan',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Laki-Laki'),
                      value: 'Laki-Laki',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade400,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                  ),
                  onPressed: () {
                  },
                  child: const Text('Selanjutnya'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
