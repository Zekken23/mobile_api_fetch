import 'package:get/get.dart';
import 'package:assigment2/app/controllers/location_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // 'lazyPut' akan membuat controller saat dibutuhkan
    Get.lazyPut<LocationController>(() => LocationController());
  }
}