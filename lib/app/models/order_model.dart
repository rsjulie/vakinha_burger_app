import 'package:vakinha_burger/app/models/shopping_cart_model.dart';

class OrderModel {
  int userId;
  String cpf;
  String address;
  List<ShoppingCartModel> items;

  OrderModel(
      {required this.userId,
      required this.cpf,
      required this.address,
      required this.items});
}
