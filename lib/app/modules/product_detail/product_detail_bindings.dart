import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/product_detail/product_detail_controller.dart';

class ProductDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailController());
  }
}
