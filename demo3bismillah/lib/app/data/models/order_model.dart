import 'package:demo3bismillah/app/data/models/country_model.dart';
import 'package:demo3bismillah/app/data/models/customer_model.dart';

// Model untuk "Pemesanan"
// Menggabungkan data pelanggan (mock) dan data lokasi (API)
class Order {
  final Customer customer;
  final Country location;

  Order({required this.customer, required this.location});
}