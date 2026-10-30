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
      title: 'Praktikum C',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const PraktikumC(),
    );
  }
}

class PraktikumC extends StatefulWidget {
  const PraktikumC({super.key});

  @override
  State<PraktikumC> createState() => _PraktikumCState();
}

class _PraktikumCState extends State<PraktikumC> {
  // Variabel bool sesuai petunjuk modul
  bool setuju = false;
  bool notif = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text(
          '4.3 Praktikum C - Checkbox & Switch',
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
            // Card Pembungkus Komponen Input
            Card(
              elevation: 4,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                child: Column(
                  children: [
                    // CheckboxListTile
                    CheckboxListTile(
                      activeColor: Colors.indigo,
                      secondary: const Icon(Icons.assignment_turned_in, color: Colors.indigo),
                      title: const Text(
                        'Setuju syarat & ketentuan',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        setuju ? 'Status: Disetujui' : 'Status: Belum Disetujui',
                        style: TextStyle(
                          color: setuju ? Colors.green : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      value: setuju,
                      onChanged: (v) => setState(() => setuju = v!),
                    ),

                    const Divider(indent: 16, endIndent: 16),

                    // SwitchListTile
                    SwitchListTile(
                      activeColor: Colors.indigo,
                      secondary: Icon(
                        notif ? Icons.notifications_active : Icons.notifications_off,
                        color: notif ? Colors.indigo : Colors.grey,
                      ),
                      title: const Text(
                        'Aktifkan notifikasi',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        notif ? 'Notifikasi aktif' : 'Notifikasi dinonaktifkan',
                        style: TextStyle(
                          color: notif ? Colors.indigo : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      value: notif,
                      onChanged: (v) => setState(() => notif = v),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Card Ringkasan Status Nilai
            Card(
              color: Colors.indigo.shade50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.indigo.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.tune, color: Colors.indigo),
                        SizedBox(width: 8),
                        Text(
                          'Ringkasan Status Input:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('• Syarat & Ketentuan : $setuju'),
                    const SizedBox(height: 4),
                    Text('• Status Notifikasi    : $notif'),
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