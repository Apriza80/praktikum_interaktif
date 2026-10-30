import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum A',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const PraktikumA(),
    );
  }
}

class PraktikumA extends StatefulWidget {
  const PraktikumA({super.key});

  @override
  State<PraktikumA> createState() => _PraktikumAState();
}

class _PraktikumAState extends State<PraktikumA> {
  final namaCtrl = TextEditingController();
  final kotaCtrl = TextEditingController();

  String sapaan = '';
  bool _isObscure = true;

  @override
  void dispose() {
    namaCtrl.dispose();
    kotaCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA5B4FC), // Warna latar belakang lembut
      appBar: AppBar(
        title: const Text(
          ' Praktikum A ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Container Kartu Utama Input
            Card(
              elevation: 6,
              shadowColor: Colors.indigo.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Form Sapaan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // TextField Nama
                    TextField(
                      controller: namaCtrl,
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        hintText: 'Masukkan nama Anda',
                        prefixIcon: const Icon(Icons.person, color: Colors.indigo),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.indigo, width: 2),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // TextField Kota (Password Style dengan Toggle Eye)
                    TextField(
                      controller: kotaCtrl,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: 'Kota Asal',
                        hintText: 'Masukkan kota asal',
                        prefixIcon: const Icon(Icons.location_city, color: Colors.indigo),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.indigo, width: 2),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Tombol Sapa dengan Efek Gradient
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.indigo, Colors.blueAccent],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          if (namaCtrl.text.isEmpty || kotaCtrl.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Harap isi Nama dan Kota terlebih dahulu!'),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                            return;
                          }
                          setState(() {
                            sapaan = 'Halo, ${namaCtrl.text} dari ${kotaCtrl.text}!';
                          });
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.send_rounded, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Sapa Sekarang',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Banner Tampilan Hasil Sapaan
            if (sapaan.isNotEmpty)
              Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Colors.indigo, width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.indigoAccent,
                        child: Icon(Icons.waving_hand, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          sapaan,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}