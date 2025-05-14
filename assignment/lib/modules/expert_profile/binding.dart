import 'package:assignment/modules/expert_profile/controller.dart';
import 'package:get/get.dart';

class ExpertProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpertController());
  }
}
