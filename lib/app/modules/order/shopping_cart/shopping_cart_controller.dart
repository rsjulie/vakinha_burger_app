import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/services/auth_service.dart';
import 'package:vakinha_burger/app/core/services/shopping_cart_service.dart';
import 'package:vakinha_burger/app/models/shopping_cart_model.dart';

class ShoppingCartController extends GetxController {
  final AuthService _authService;
  final ShoppingCartService _shoppingCartService;

  final _address = ''.obs;
  final _cpf = ''.obs;

  ShoppingCartController(
      {required AuthService authservice,
      required ShoppingCartService shoppingCartService})
      : _authService = authservice,
        _shoppingCartService = shoppingCartService;

  List<ShoppingCartModel> get products => _shoppingCartService.products;
  double get totalValue => _shoppingCartService.totalValue;

  set address(String address) => _address.value = address;
  set cpf(String cpf) => _cpf.value = cpf;

  void addQuantityInProduct(ShoppingCartModel shoppingCartModel) {
    _shoppingCartService.addAndRemoveProductInShoppingCart(
        shoppingCartModel.product,
        quantity: shoppingCartModel.quantity + 1);
  }

  void subtractQuantityInProduct(ShoppingCartModel shoppingCartModel) {
    _shoppingCartService.addAndRemoveProductInShoppingCart(
        shoppingCartModel.product,
        quantity: shoppingCartModel.quantity - 1);
  }

  void clear() => _shoppingCartService.clear();
}
