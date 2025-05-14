import 'package:assignment/modules/expert_profile/binding.dart';
import 'package:assignment/modules/expert_profile/view.dart';
import 'package:get/get.dart';

import '../modules/home_screen/binding.dart';
import '../modules/home_screen/view.dart';
import 'routing.dart';

class AppPages {
  static const initial = AppRoutes.homeScreen;

  static getPageWithTransition({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
    List<Bindings>? bindings,
    List<GetMiddleware>? middlewares,
    transition = Transition.rightToLeft,
    duration = 600,
  }) =>
      GetPage(
        name: name,
        page: page,
        binding: binding,
        bindings: bindings ?? [],
        transition: transition,
        middlewares: middlewares ?? [],
        transitionDuration: Duration(milliseconds: duration),
      );

  static final List<GetPage> pages = [
    getPageWithTransition(
      name: AppRoutes.homeScreen,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    getPageWithTransition(
      name: AppRoutes.expertProfile,
      page: () => const ExpertProfilePage(),
      binding: ExpertProfileBinding(),
    ),
  ];
}
