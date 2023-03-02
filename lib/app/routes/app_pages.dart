import 'package:get/get.dart';
import 'package:scheduleflutter/app/modules/login/bindings/login_binding.dart';
import 'package:scheduleflutter/app/modules/login/views/login_view.dart';
import 'package:scheduleflutter/app/modules/root/views/root_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: '/',
      page: () => RootView(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          name: _Paths.login,
          page: () => const LoginView(),
          bindings: [LoginBinding()],
          preventDuplicates: true,
        ),
      ],
    ),
  ];
}
