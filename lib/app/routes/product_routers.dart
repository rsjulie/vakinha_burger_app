import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/product_detail/product_detail_bindings.dart';
import 'package:vakinha_burger/app/modules/product_detail/product_detail_page.dart';

class ProductRouters {
  ProductRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/product_detail',
      page: () => const ProductDetailPage(),
      binding: ProductDetailBindings(),
    ),
  ];
}
