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
      title: 'Tugas Mandiri - Form Biodata',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const FormBiodataPage(),
    );
  }
}

class FormBiodataPage extends StatefulWidget {
  const FormBiodataPage({super.key});

  @override
  State<FormBiodataPage> createState() => _FormBiodataPageState();
}

class _FormBiodataPageState extends State<FormBiodataPage> {
  // GlobalKey untuk kontrol validasi Form
  final _formKey = GlobalKey<FormState>();

  // Controller input
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();

  // Status Checkbox
  bool _setujuSyarat = false;

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    super.dispose();
  }

  void _simpanBiodata() {
    // Validasi input form
    if (_formKey.currentState!.validate()) {
      // Validasi Checkbox
      if (!_setujuSyarat) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Anda harus menyetujui syarat & ketentuan terlebih dahulu!'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      // Tampilkan ringkasan data via SnackBar
      final ringkasanData =
          'Nama: ${_namaController.text} | Email: ${_emailController.text} | HP: ${_noHpController.text}';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Data Berhasil Disimpan!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(ringkasanData, style: const TextStyle(fontSize: 13)),
            ],
          ),
          backgroundColor: Colors.indigo,
          duration: const Duration(seconds: 4),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text(
          'Form Biodata',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
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
                      const Icon(
                        Icons.badge_outlined,
                        size: 60,
                        color: Colors.indigo,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Isi Data Diri Anda',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),

                      // 1. Input Nama
                      TextFormField(
                        controller: _namaController,
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          hintText: 'Masukkan nama lengkap',
                          prefixIcon: const Icon(Icons.person, color: Colors.indigo),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Nama wajib diisi'; // Validasi wajib diisi
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // 2. Input Email[cite: 14]
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'contoh@domain.com',
                          prefixIcon: const Icon(Icons.email, color: Colors.indigo),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email wajib diisi'; // Validasi wajib diisi[cite: 14]
                          }
                          if (!value.contains('@')) {
                            return 'Email harus mengandung "@"'; // Validasi @[cite: 14]
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // 3. Input No. HP[cite: 14]
                      TextFormField(
                        controller: _noHpController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'No. HP',
                          hintText: '081234567890',
                          prefixIcon: const Icon(Icons.phone, color: Colors.indigo),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'No. HP wajib diisi'; // Validasi wajib diisi[cite: 14]
                          }
                          if (value.length < 10) {
                            return 'No. HP minimal 10 digit'; // Validasi min 10 digit[cite: 14]
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      // 4. Checkbox Syarat & Ketentuan[cite: 14]
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        activeColor: Colors.indigo,
                        title: const Text(
                          'Saya menyetujui syarat & ketentuan',
                          style: TextStyle(fontSize: 14),
                        ),
                        value: _setujuSyarat,
                        onChanged: (value) {
                          setState(() {
                            _setujuSyarat = value ?? false;
                          });
                        },
                      ),
                      const SizedBox(height: 20),

                      // 5. Tombol Simpan[cite: 14]
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
                        onPressed: _simpanBiodata,
                        icon: const Icon(Icons.save),
                        label: const Text(
                          'Simpan',
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