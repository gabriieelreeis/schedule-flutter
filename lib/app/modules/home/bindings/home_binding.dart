import 'package:get/get.dart';
import 'package:scheduleflutter/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<HomeController>(
        () => HomeController(),
      )
    ];
  }
}
