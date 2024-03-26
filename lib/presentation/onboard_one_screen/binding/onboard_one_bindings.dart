import 'package:get/get.dart';

import '../controller/onboard_one_controller.dart';

class OnboardOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardOneController());
  }
}
