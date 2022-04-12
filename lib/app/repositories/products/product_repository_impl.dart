import 'package:vakinha_burger/app/core/restClient/rest_client.dart';
import 'package:vakinha_burger/app/models/product_model.dart';
import 'package:vakinha_burger/app/repositories/products/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient _restClient;

  ProductRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll() async {
    // final result = await _restClient.get('products');
    final result = [
      {
        "id": 1,
        "name": "X-tudo",
        "description": "Pão, carne, queijo e molhos.",
        "price": 22.5,
        "image":
            "https://conteudo.imguol.com.br/c/entretenimento/a0/2021/11/06/lanche-hamburguer-x-salada-1636227034415_v2_4x3.jpg"
      },
      {
        "id": 2,
        "name": "X-salada",
        "description": "Pão, carne, queijo e molhos.",
        "price": 19.90,
        "image":
            "https://looklanches.com.br/wp-content/uploads/2020/09/salada-1.jpg"
      },
      {
        "id": 3,
        "name": "X-burger",
        "description": "Pão, carne, queijo e molhos.",
        "price": 18.0,
        "image":
            "https://buzinaburgers.com/wp-content/uploads/2018/05/BUZINA_RESTAURANTE_PRATOS_DIA_01_20171102_0317_XBURGER2.jpg"
      },
      {
        "id": 4,
        "name": "X-bacon",
        "description": "Pão, carne, queijo e molhos.",
        "price": 20.0,
        "image": "https://burgerx.com.br/assets/img/galeria/burgers/x-bacon.jpg"
      }
    ];

    return result.map<ProductModel>((p) => ProductModel.fromMap(p)).toList();

    // if (result.hasError) {
    //   log('Erro ao buscar produtos, ${result.statusCode}',
    //       error: result.statusText, stackTrace: StackTrace.current);
    //   throw RestClientException('Erro ao buscar produtos');
    // }
    // return result.body
    //     .map<ProductModel>((p) => ProductModel.fromMap(p))
    //     .toList();
  }
}
