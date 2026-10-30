# Praktikum Pemrograman Mobile - Widget Interaktif & Form

Proyek ini dibuat untuk memenuhi Tugas Praktikum Pemrograman Mobile (INF23531) Pertemuan 5. Proyek ini berisi implementasi widget interaktif Flutter seperti TextField, Jenis Button, Checkbox, Switch, serta Form & Validasi.

## 👤 Informasi Mahasiswa
* **Nama:** Apriza Wahyu Setiawan
* **Mata Kuliah:** Pemrograman Mobile (INF23531)
* **Pertemuan:** 5 - Widget Interaktif & Form
---

## 📚 Isi Praktikum & Fitur Utama

1. **4.1 Praktikum A — TextField & Menampilkan Input**
   * Mengambil input nama dan kota menggunakan `TextEditingController`
   * Menambahkan `prefixIcon` dan efek `obscureText` untuk password
   * Menampilkan hasil sapaan gabungan nama dan kota saat tombol ditekan

2. **4.2 Praktikum B — Jenis Button & Event**
   * Menggunakan berbagai jenis tombol: `ElevatedButton`, `TextButton`, `OutlinedButton`, dan `IconButton`.
   * Mengimplementasikan kondisi *disabled button* (`onPressed: null`).
   * Menggunakan event `onLongPress` serta `GestureDetector` pada custom container.

3. **4.3 Praktikum C — Input Pilihan (Checkbox & Switch)**
   * Menggunakan `CheckboxListTile` untuk persetujuan syarat & ketentuan.
   * Menggunakan `SwitchListTile` untuk pengaturan notifikasi.
   * Mengelola *state* perubahan nilai boolean secara dinamis.

4. **4.4 Praktikum D — Form & Validasi**
   * Menggunakan `GlobalKey<FormState>` untuk mengontrol validasi.
   * Menerapkan validasi input `TextFormField` (email wajib diisi dan harus memiliki karakter `@`).

5. **4.5 Praktikum E — Form Login + SnackBar**
   * Menggabungkan validasi email dan password (minimal 6 karakter).
   * Menampilkan umpan balik visual menggunakan `SnackBar` saat login berhasil.

6. **Tugas Mandiri — Form Biodata Fungsional**
   * Form input lengkap berisi Nama, Email, dan No. HP.
   * Validasi ketat: semua wajib diisi, email mengandung `@`, dan No. HP minimal 10 digit.
   * Checkbox persetujuan syarat & ketentuan.
   * Menampilkan ringkasan seluruh data biodata via `SnackBar` mengambang saat data berhasil disimpan.

---

## 🚀 Cara Menjalankan Proyek

1. **Clone Repository:**
   ```bash
   git clone [https://github.com/Apriza80/praktikum_interaktif.git](https://github.com/Apriza80/praktikum_interaktif.git)
