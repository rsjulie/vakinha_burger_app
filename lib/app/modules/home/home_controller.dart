import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/services/auth_service.dart';
import 'package:vakinha_burger/app/modules/menu/menu_bindings.dart';
import 'package:vakinha_burger/app/modules/menu/menu_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;

  final _tabIndex = 0.obs;

  int get tabIndex => _tabIndex.value;
  final _tabs = ['/menu', '/order/shoppinng_cart', 'exit'];

  set tabIndex(int index) {
    if (_tabs[index] == 'exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRoouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
          settings: settings,
          page: () => const MenuPage(),
          binding: MenuBindings(),
          transition: Transition.fade);
    }
    if (settings.name == '/order/shopping_cart') {}
  }
}
