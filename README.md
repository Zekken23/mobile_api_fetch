# Laundry Logistics (Tugas Modul 3 Pemrograman Mobile)

Ini adalah proyek aplikasi Flutter yang dikembangkan untuk memenuhi tugas Modul 3 - Pemrograman Mobile. Proyek ini awalnya berfokus pada perbandingan *API Call* & *Async Handling* (`http` vs `dio` dan `async-await` vs `callback-chaining`).

Seiring pengembangan, proyek ini diubah menjadi aplikasi mini "Laundry Logistics" yang fungsional, menggunakan tema gradient modern, navigasi `go_router`, dan state management `GetX`.

![Tangkapan Layar Dashboard](SCREENSHOT_DASHBOARD.png)
*(Disarankan: Ganti `SCREENSHOT_DASHBOARD.png` dengan tangkapan layar aplikasi Anda)*

---

## 🚀 Fitur Utama

* **Dashboard Utama:** Halaman *landing* yang menampilkan statistik pesanan (Selesai & Diproses).
* **Peta OpenStreetMap:** Integrasi `flutter_map` untuk menampilkan lokasi pesanan (dummy) di dashboard.
* **Tambah Pesanan Baru:** Halaman form (`/new-order`) untuk membuat pesanan baru, lengkap dengan validasi form (Nama, Alamat, No. Telp).
* **Pilihan Pembayaran:** Opsi pembayaran menggunakan QRIS atau Transfer Bank via `RadioListTile`.
* **Counter Interaktif:** Statistik "Diproses" di dashboard akan bertambah secara otomatis setiap ada pesanan baru yang berhasil dibuat.
* **Navigasi Modular:** Menggunakan `GoRouter` untuk navigasi antar halaman (Dashboard, Modul 3, Pesanan Baru).
* **UI Modern:** Tampilan aplikasi menggunakan `AppBar` dan tombol dengan *gradient* biru-teal.

---

## 🔬 Eksperimen Modul 3

Halaman asli untuk tugas Modul 3 tetap dipertahankan dan dapat diakses dari dashboard (atau melalui rute `/modul3`). Halaman ini mendemonstrasikan:

1.  **Eksperimen 1: Performa HTTP Library**
    * Membandingkan `http` vs `dio` untuk skenario *parallel request* (mengambil data pelanggan (mock) dan data lokasi (REST Countries API) secara bersamaan).
    * `dio` juga dikonfigurasi dengan `LoggingInterceptor` untuk *logging* request & response yang rapi di konsol.

2.  **Eksperimen 2: Async Handling**
    * Membandingkan `async-await` vs `callback-chaining` untuk skenario *chained request* (mencari rute pengiriman dari Jerman ke negara tetangga terdekat).
    * Menunjukkan bagaimana `async-await` menghasilkan kode yang jauh lebih bersih dan mudah dibaca daripada *callback hell*.

---

## 🛠️ Teknologi yang Digunakan

* **Framework:** Flutter
* **State Management:** `GetX`
* **Routing:** `GoRouter`
* **HTTP Clients:** `http` & `dio`
* **Maps API:** `flutter_map` (OpenStreetMap)
* **Utilities:** `logger` (untuk Dio Interceptor)

---

## penyusun
* **Nama:** [Muhammad Yusron AL Ghoni Rizqullah, Angga Surya Triputra]
* **NIM:** [202310370311333, 202310370311333]
