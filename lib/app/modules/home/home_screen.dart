import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assigment2/app/controllers/location_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil controller yang sudah di-inject oleh Binding
    final LocationController locC = Get.find<LocationController>();

    // Data bioskop (dummy)
    final List<String> cinemas = [
      "XI CINEMA",
      "PONDOK KELAPA 21",
      "CGV",
      "CINEPOLIS",
      "CP MALL",
      "HERMES",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C54), // Warna navy gelap
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Logika untuk kembali
          },
        ),
        title: const Text("THEATER"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header Lokasi
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Color(0xFF2C2C54)),
                const SizedBox(width: 8),
                // Obx akan otomatis update UI saat locC.currentCity berubah
                Obx(() => locC.isLoading.value
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        locC.currentCity.value.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      )),
              ],
            ),
          ),
          // Daftar Bioskop
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cinemas.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      cinemas[index],
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    children: [
                      // Isi dropdown (misal: jadwal film)
                      ListTile(
                        title: Text("Jadwal Film 1", style: TextStyle(color: Colors.grey[700])),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text("Jadwal Film 2", style: TextStyle(color: Colors.grey[700])),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}