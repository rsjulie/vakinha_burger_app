import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_rounded_button.dart';

class PlusMinusBox extends StatelessWidget {
  final bool elevated;
  final Color? backgroundColor;
  final String? label;
  final int quantity;
  final double price;
  final VoidCallback minusCallback;
  final VoidCallback plusCallback;
  final bool calculateTotal;

  const PlusMinusBox(
      {Key? key,
      required this.quantity,
      required this.price,
      required this.minusCallback,
      required this.plusCallback,
      this.elevated = false,
      this.backgroundColor,
      this.label,
      this.calculateTotal = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevated ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: label != null,
              child: Text(
                label ?? '',
                style: const TextStyle(
                    fontSize: 15, overflow: TextOverflow.ellipsis),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                VakinhaRoundedButton(
                  label: '-',
                  onPressed: minusCallback,
                ),
                Text('$quantity'),
                VakinhaRoundedButton(
                  label: '+',
                  onPressed: plusCallback,
                ),
              ],
            ),
            Visibility(visible: label == null, child: const Spacer()),
            Container(
              constraints: const BoxConstraints(minWidth: 70),
              child: Text(
                calculateTotal
                    ? 'R\$ ${(price * quantity).toStringAsFixed(2)}'
                    : 'R\$ ${price.toStringAsFixed(2)}',
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
      ),
    );
  }
}
