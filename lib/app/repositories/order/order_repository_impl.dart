import 'package:vakinha_burger/app/core/restClient/rest_client.dart';
import 'package:vakinha_burger/app/models/order_model.dart';
import 'package:vakinha_burger/app/models/order_pix_model.dart';
import 'package:vakinha_burger/app/repositories/order/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final RestClient _restClient;

  OrderRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  Future<OrderPixModel> createOrder(OrderModel order) async {
    final result = {
      'image':
          'https://www.canalautismo.com.br/wp-content/uploads/2018/05/qrcode-RevistaAutismo.png',
      'code': '1234',
      'totalValue': 0.0,
    };
    // final result = await _restClient.post('url', {
    //   'userId': order.userId,
    //   'cpf': order.cpf,
    //   'address': order.address,
    //   'items': order.items
    //       .map((shoppingCart) => {
    //             'quantity': shoppingCart.quantity,
    //             'productId': shoppingCart.product.id
    //           })
    //       .toList()
    // });

    // if (result.hasError) {
    //   log('Erro ao ralizar pedido ${result.statusCode}',
    //       error: result.statusText, stackTrace: StackTrace.current);
    //   throw RestClientException('Erro ao realizar pedido');
    // }

    // return OrderPixModel.fromMap(result.body);
    return OrderPixModel.fromMap(result);
  }
}
