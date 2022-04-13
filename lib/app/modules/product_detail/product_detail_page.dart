import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_button.dart';
import './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width,
                    height: context.heightTransformer(
                      reducedBy: 60,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(controller.product.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.product.name,
                          style: context.textTheme.headline4!.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(controller.product.description),
                        const SizedBox(height: 10),
                        Obx(() {
                          return PlusMinusBox(
                            minusCallback: controller.removeProduct,
                            plusCallback: controller.addProduct,
                            quantity: controller.quantity,
                            price: controller.product.price,
                          );
                        }),
                        const Divider(),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            'Total',
                            style: VakinhaUI.textBold,
                          ),
                          trailing: Obx(() {
                            return Text(
                              controller.totalPrice.toStringAsFixed(2),
                              style: VakinhaUI.textBold,
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        Center(
                            child: VakinhaButton(
                          label: controller.alreadyAdded
                              ? 'ATUALIZAR'
                              : 'ADICIONAR',
                          onPressed: controller.addProductInShoppingCart,
                          width: context.widthTransformer(
                            reducedBy: 10,
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
