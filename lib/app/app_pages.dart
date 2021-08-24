import 'package:get/get.dart';
import 'package:suprise/core/Bindings/home_bindings.dart';
import 'package:suprise/ui/views/Home%20View/home_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        children: []),
  ];
}
