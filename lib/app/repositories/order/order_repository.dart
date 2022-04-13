import 'package:vakinha_burger/app/models/order_model.dart';
import 'package:vakinha_burger/app/models/order_pix_model.dart';

abstract class OrderRepository {
  Future<OrderPixModel> createOrder(OrderModel order);
}
