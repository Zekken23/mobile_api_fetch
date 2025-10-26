import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo3bismillah/app/modules/laundry_home/laundry_home_controller.dart';

// Enum untuk pilihan pembayaran
enum PaymentMethod { qris, transfer }

class NewOrderController extends GetxController {
  // GlobalKey untuk validasi Form
  final formKey = GlobalKey<FormState>();

  // Controller untuk setiap text field
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController phoneController;

  // State untuk menyimpan pilihan pembayaran
  final paymentMethod = PaymentMethod.qris.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    // Selalu dispose controller untuk menghindari memory leak
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  // Fungsi untuk mengubah metode pembayaran
  void setPaymentMethod(PaymentMethod? value) {
    if (value != null) {
      paymentMethod.value = value;
    }
  }

  // Fungsi yang dipanggil saat tombol submit ditekan
  void submitOrder() {
    // Validasi form
    if (formKey.currentState!.validate()) {
    Get.find<LaundryHomeController>().incrementProcessingOrders();
      Get.snackbar(
        'Pesanan Berhasil',
        'Pesanan untuk ${nameController.text} sedang diproses.\n'
        'Pembayaran: ${paymentMethod.value.name.capitalizeFirst}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      
      // Kembali ke halaman sebelumnya
      Get.back();
    } else {
      // Jika tidak valid, tampilkan error
      Get.snackbar(
        'Gagal',
        'Harap isi semua data yang diperlukan.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}