import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/splash/splash_page.dart';

class SplashRouters {
  SplashRouters._();
  static final routers = <GetPage>[
    GetPage(name: '/', page: () => SplashPage())
  ];
}
