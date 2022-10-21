import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_button.dart';
import 'package:validatorless/validatorless.dart';
import './shopping_cart_controller.dart';

class ShoppingCartPage extends GetView<ShoppingCartController> {
  final formKey = GlobalKey<FormState>();

  ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constraints.minHeight,
                minWidth: constraints.minWidth),
            child: IntrinsicHeight(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Row(
                        children: [
                          Text(
                            'Carrinho',
                            style: context.textTheme.headline5?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColorDark),
                          ),
                          IconButton(
                            onPressed: controller.clear,
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      return Column(
                        children: controller.products
                            .map((p) => Container(
                                  margin: const EdgeInsets.all(10),
                                  child: PlusMinusBox(
                                      label: p.product.name,
                                      calculateTotal: true,
                                      quantity: p.quantity,
                                      elevated: true,
                                      backgroundColor: Colors.white,
                                      price: p.product.price,
                                      plusCallback: () {
                                        controller.addQuantityInProduct(p);
                                      },
                                      minusCallback: () {
                                        controller.subtractQuantityInProduct(p);
                                      }),
                                ))
                            .toList(),
                      );
                    }),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total do pedido:',
                            style: context.textTheme.bodyText1?.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Obx(() {
                            return Text(
                              'R\$ ${controller.totalValue.toStringAsFixed(2)}',
                              style: context.textTheme.headline6?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 25),
                    const _AddressField(),
                    const Divider(),
                    const _CpfField(),
                    const Divider(),
                    const Spacer(),
                    Center(
                      child: SizedBox(
                        width: context.widthTransformer(reducedBy: 10),
                        child: VakinhaButton(
                          label: 'FINALIZAR',
                          onPressed: () {
                            final formValid =
                                formKey.currentState?.validate() ?? false;
                            if (formValid) {
                              controller.createOrder();
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}

class _AddressField extends GetView<ShoppingCartController> {
  const _AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
            child: Text('Endereço de entrega',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18)),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.address = value;
            },
            validator: Validatorless.required('Endereço Obrigatório.'),
            decoration: const InputDecoration(hintText: 'Digite o endereço'),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _CpfField extends GetView<ShoppingCartController> {
  const _CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 32,
          child: Text('CPF',
              overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18)),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            controller.cpf = value;
          },
          validator: Validatorless.multiple([
            Validatorless.required('CPF Obrigatório.'),
            Validatorless.cpf('CPF inválido'),
          ]),
          decoration: const InputDecoration(hintText: 'Digite o CPF'),
        ),
        const SizedBox(height: 10),
      ]),
    );
  }
}
