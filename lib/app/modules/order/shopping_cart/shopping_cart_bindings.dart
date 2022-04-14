import 'package:get/get.dart';
import 'package:vakinha_burger/app/repositories/order/order_repository.dart';
import 'package:vakinha_burger/app/repositories/order/order_repository_impl.dart';
import './shopping_cart_controller.dart';

class ShoppingCartBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(
        () => OrderRepositoryImpl(restClient: Get.find()));
    Get.put(ShoppingCartController(
        shoppingCartService: Get.find(),
        authservice: Get.find(),
        orderRepository: Get.find()));
  }
}
