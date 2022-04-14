import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger/app/models/order_pix_model.dart';

class FinishedPage extends StatelessWidget {
  final OrderPixModel _orderPix = Get.arguments;
  FinishedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset('assets/images/logo_rounded.png'),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      'Pedido realizado com sucesso, clique no botão abaixo para acesso ao QRCode do pix.',
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline6?.copyWith(
                          color: context.theme.primaryColorDark,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 30),
                  child: VakinhaButton(
                    label: 'Pix',
                    onPressed: () {
                      Get.toNamed('/order/pix', arguments: _orderPix);
                    },
                    color: context.theme.primaryColorDark,
                  ),
                ),
                Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: context.widthTransformer(reducedBy: 10),
                  child: VakinhaButton(
                    label: 'FECHAR',
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
