import 'package:get/get.dart';
import 'package:demo3bismillah/app/modules/new_order/new_order_controller.dart';

class NewOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewOrderController());
  }
}