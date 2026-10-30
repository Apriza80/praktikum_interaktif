# Praktikum Pemrograman Mobile - Widget Interaktif & Form

Proyek ini dibuat untuk memenuhi Tugas Praktikum Pemrograman Mobile (INF23531) Pertemuan 5[cite: 7, 12]. Proyek ini berisi implementasi widget interaktif Flutter seperti TextField, Jenis Button, Checkbox, Switch, serta Form & Validasi[cite: 1, 7, 11, 12].

## 👤 Informasi Mahasiswa
* **Nama:** Apriza Wahyu Setiawan
* **Mata Kuliah:** Pemrograman Mobile (INF23531)[cite: 7, 12]
* **Pertemuan:** 5 - Widget Interaktif & Form[cite: 7, 12]

---

## 📚 Isi Praktikum & Fitur Utama

1. **4.1 Praktikum A — TextField & Menampilkan Input**[cite: 1]
   * Mengambil input nama dan kota menggunakan `TextEditingController`[cite: 1].
   * Menambahkan `prefixIcon` dan efek `obscureText` untuk password[cite: 1].
   * Menampilkan hasil sapaan gabungan nama dan kota saat tombol ditekan[cite: 1].

2. **4.2 Praktikum B — Jenis Button & Event**[cite: 7]
   * Menggunakan berbagai jenis tombol: `ElevatedButton`, `TextButton`, `OutlinedButton`, dan `IconButton`[cite: 7].
   * Mengimplementasikan kondisi *disabled button* (`onPressed: null`)[cite: 7].
   * Menggunakan event `onLongPress` serta `GestureDetector` pada custom container[cite: 7].

3. **4.3 Praktikum C — Input Pilihan (Checkbox & Switch)**[cite: 11]
   * Menggunakan `CheckboxListTile` untuk persetujuan syarat & ketentuan[cite: 11].
   * Menggunakan `SwitchListTile` untuk pengaturan notifikasi[cite: 11].
   * Mengelola *state* perubahan nilai boolean secara dinamis[cite: 11].

4. **4.4 Praktikum D — Form & Validasi**[cite: 12]
   * Menggunakan `GlobalKey<FormState>` untuk mengontrol validasi[cite: 12].
   * Menerapkan validasi input `TextFormField` (email wajib diisi dan harus memiliki karakter `@`)[cite: 12].

5. **4.5 Praktikum E — Form Login + SnackBar**[cite: 13]
   * Menggabungkan validasi email dan password (minimal 6 karakter)[cite: 13].
   * Menampilkan umpan balik visual menggunakan `SnackBar` saat login berhasil[cite: 13].

6. **Tugas Mandiri — Form Biodata Fungsional**[cite: 14]
   * Form input lengkap berisi Nama, Email, dan No. HP[cite: 14].
   * Validasi ketat: semua wajib diisi, email mengandung `@`, dan No. HP minimal 10 digit[cite: 14].
   * Checkbox persetujuan syarat & ketentuan[cite: 14].
   * Menampilkan ringkasan seluruh data biodata via `SnackBar` mengambang saat data berhasil disimpan[cite: 14].

---

## 🚀 Cara Menjalankan Proyek

1. **Clone Repository:**
   ```bash
   git clone [https://github.com/Apriza80/praktikum_interaktif.git](https://github.com/Apriza80/praktikum_interaktif.git)
