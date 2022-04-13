import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/restClient/rest_client.dart';
import 'package:vakinha_burger/app/core/services/shopping_cart_service.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
    Get.lazyPut(() => ShoppingCartService());
  }
}
