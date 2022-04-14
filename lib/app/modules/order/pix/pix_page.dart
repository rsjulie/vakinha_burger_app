import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger/app/models/order_pix_model.dart';

class PixPage extends StatelessWidget {
  final OrderPixModel _orderPix = Get.arguments;

  PixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  'Valor a pagar',
                  style: context.textTheme.headline4,
                ),
                Text(
                  'R\$ ${_orderPix.totalValue}',
                  style: context.textTheme.headline4?.copyWith(
                      color: context.theme.primaryColorDark,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Image.network(
                  _orderPix.image,
                  width: context.widthTransformer(reducedBy: 50),
                ),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _orderPix.code));
                      Get.rawSnackbar(
                          message: 'Código pix copiado!',
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    child: const Text(
                      'Pix copia e cola',
                      style: TextStyle(color: Colors.blue),
                    )),
                const SizedBox(height: 20),
                Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: context.widthTransformer(reducedBy: 10),
                  child: VakinhaButton(
                    label: 'FECHAR',
                    onPressed: () {
                      Get.offAllNamed('/home');
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
