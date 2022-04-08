import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/auth/login/login_page.dart';
import 'package:vakinha_burger/app/modules/auth/login/register/register_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(name: '/auth/login', page: () => const LoginPage()),
    GetPage(name: '/auth/registerr', page: () => const RegisterPage())
  ];
}
