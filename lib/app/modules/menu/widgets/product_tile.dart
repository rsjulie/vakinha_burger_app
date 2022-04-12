import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger/app/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/product_detail', arguments: product);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(children: [
          Container(
            width: 80,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(product.image))),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: VakinhaUI.textBold,
                  ),
                  Text('R\$ ${product.price.toStringAsFixed(2)}'),
                ]),
          ))
        ]),
      ),
    );
  }
}
