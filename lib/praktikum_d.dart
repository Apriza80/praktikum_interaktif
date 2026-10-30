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
      title: 'Praktikum D',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const PraktikumD(),
    );
  }
}

class PraktikumD extends StatefulWidget {
  const PraktikumD({super.key});

  @override
  State<PraktikumD> createState() => _PraktikumDState();
}

class _PraktikumDState extends State<PraktikumD> {
  // GlobalKey untuk mengontrol status Form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text(
          '4.4 Praktikum D - Form & Validasi',
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
            // Card Pembungkus Form Input
            Card(
              elevation: 4,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Form Validasi Email',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),

                      // TextFormField Email dengan Validasi
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'contoh@email.com',
                          prefixIcon: const Icon(Icons.email, color: Colors.indigo),
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
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.redAccent, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email wajib diisi';
                          }
                          if (!value.contains('@')) {
                            return 'Format email salah';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Tombol Kirim
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 2,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('Form valid');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Form valid! Data berhasil dikirim.'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.send_rounded),
                        label: const Text(
                          'Kirim',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}