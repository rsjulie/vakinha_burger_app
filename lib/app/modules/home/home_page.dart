import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_appbar.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (value) {},
      //   currentIndex: 0,
      //   items: [],
      // ),
      body: Container(),
    );
  }
}
