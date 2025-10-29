import 'package:get/get.dart';
import 'package:assigment2/app/controllers/location_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
  }
}