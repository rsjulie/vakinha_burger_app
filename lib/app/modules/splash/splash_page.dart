import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xFF140E0E),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: context.heightTransformer(reducedBy: 82),
                ),
                Image.asset('assets/images/logo.png'),
                const SizedBox(height: 70),
                VakinhaButton(
                  label: 'ACESSAR',
                  onPressed: () {
                    Get.toNamed('/auth/login');
                  },
                  width: context.widthTransformer(reducedBy: 40),
                  height: 40,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
