import 'package:get/get.dart';

class LoadingService extends GetxService {
  static LoadingService get to => Get.find<LoadingService>();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool val) => _isLoading.value = val;
}
