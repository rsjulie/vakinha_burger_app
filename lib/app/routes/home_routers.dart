import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/auth/login/login_bindings.dart';
import 'package:vakinha_burger/app/modules/auth/login/login_page.dart';
import 'package:vakinha_burger/app/modules/auth/register/register_bindings.dart';
import 'package:vakinha_burger/app/modules/auth/register/register_page.dart';
import 'package:vakinha_burger/app/modules/home/home_bindings.dart';
import 'package:vakinha_burger/app/modules/home/home_page.dart';

class HomeRouters {
  HomeRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
