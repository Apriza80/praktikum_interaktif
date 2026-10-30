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
      title: 'Praktikum B',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const PraktikumB(),
    );
  }
}

class PraktikumB extends StatefulWidget {
  const PraktikumB({super.key});

  @override
  State<PraktikumB> createState() => _PraktikumBState();
}

class _PraktikumBState extends State<PraktikumB> {
  String lastAction = 'Belum ada tombol yang diklik';
  bool isLiked = false;

  void _updateStatus(String message) {
    setState(() {
      lastAction = message;
    });
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text(
          '4.2 Praktikum B - Jenis Button',
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
            // Status Banner untuk Menampilkan Log Klik
            Card(
              color: Colors.indigo.shade50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.indigo.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.indigo),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Status: $lastAction',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Card Pembungkus Seluruh Tombol Praktikum
            Card(
              elevation: 4,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Daftar Jenis Tombol',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // 1. ElevatedButton dengan icon & onLongPress (Eksplorasi 3)
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => _updateStatus('Simpan diklik!'),
                      onLongPress: () => _updateStatus('Simpan ditekan lama (Long Press)!'),
                      icon: const Icon(Icons.save),
                      label: const Text(
                        'Simpan (Tekan / Tahan Lama)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // 2. TextButton yang dibuat Disabled (Eksplorasi 1)
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: null, // Eksplorasi 1: onPressed null membuat tombol non-aktif
                      icon: const Icon(Icons.block),
                      label: const Text('Batal (Disabled)'),
                    ),
                    const SizedBox(height: 12),

                    // 3. OutlinedButton
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.indigo,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Colors.indigo, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => _updateStatus('Lainnya diklik!'),
                      icon: const Icon(Icons.more_horiz),
                      label: const Text('Lainnya'),
                    ),
                    const SizedBox(height: 16),

                    // 4. IconButton di dalam Row khusus
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Sukai: ', style: TextStyle(fontWeight: FontWeight.w500)),
                        Ink(
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFFEBEE),
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                              _updateStatus(isLiked ? 'Suka (Liked)' : 'Batal Suka');
                            },
                            icon: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 5. Custom Container dengan GestureDetector & Gradient (Eksplorasi 2)
                    GestureDetector(
                      onTap: () => _updateStatus('Custom Container diklik!'),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.deepPurple, Colors.indigoAccent],
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.4),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.touch_app, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Custom Container Clickable',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
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
          ],
        ),
      ),
    );
  }
}