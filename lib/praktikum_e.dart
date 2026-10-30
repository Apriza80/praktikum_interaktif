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
      title: 'Praktikum E',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const PraktikumE(),
    );
  }
}

class PraktikumE extends StatefulWidget {
  const PraktikumE({super.key});

  @override
  State<PraktikumE> createState() => _PraktikumEState();
}

class _PraktikumEState extends State<PraktikumE> {
  // Controller & FormKey sesuai petunjuk modul
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text(
          '4.5 Praktikum E - Form Login',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Card Pembungkus Form Login
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
                          Icons.lock_person,
                          size: 64,
                          color: Colors.indigo,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Selamat Datang',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'Silakan masukan akun Anda',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),

                        // TextFormField Email
                        TextFormField(
                          controller: emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'nama@domain.com',
                            prefixIcon: const Icon(Icons.email_outlined, color: Colors.indigo),
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
                          validator: (v) =>
                          v == null || v.isEmpty ? 'Wajib diisi' : null,
                        ),
                        const SizedBox(height: 16),

                        // TextFormField Password
                        TextFormField(
                          controller: passCtrl,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Masukkan password',
                            prefixIcon: const Icon(Icons.lock_outline, color: Colors.indigo),
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
                          validator: (v) =>
                          v == null || v.length < 6 ? 'Min. 6 karakter' : null,
                        ),
                        const SizedBox(height: 24),

                        // Tombol Masuk / Login
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Row(
                                    children: [
                                      Icon(Icons.check_circle, color: Colors.white),
                                      SizedBox(width: 8),
                                      Text('Login berhasil!'),
                                    ],
                                  ),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.login),
                          label: const Text(
                            'Masuk',
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
      ),
    );
  }
}