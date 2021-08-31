import 'package:get/get.dart';
import 'package:suprise/core/Bindings/cake_bindings.dart';
import 'package:suprise/core/Bindings/carousel_bindings.dart';
import 'package:suprise/core/Bindings/home_bindings.dart';
import 'package:suprise/core/Bindings/rate_screen_bindings.dart';
import 'package:suprise/core/Bindings/text_bindings.dart';
import 'package:suprise/ui/views/Cake%20View/cake_screen.dart';
import 'package:suprise/ui/views/Carousel%20View/carousel_view.dart';
import 'package:suprise/ui/views/Home%20View/home_view.dart';
import 'package:suprise/ui/views/Text%20View/text_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOMEVIEW;

  static final routes = [
    GetPage(
        name: Routes.HOMEVIEW,
        page: () => HomeView(),
        binding: HomeBinding(),
        children: []),
    GetPage(
        name: Routes.CAKEVIEW,
        page: () => CakeScreen(),
        children: [],
        binding: CakeBindings()),
    GetPage(
        name: Routes.RATEVIEW,
        page: () => CakeScreen(),
        children: [],
        binding: RateScreenBindings()),
    GetPage(
        name: Routes.TEXTVIEW,
        page: () => TextView(),
        children: [],
        binding: TextViewBindings()),
    GetPage(
        name: Routes.CAROUSELVIEW,
        page: () => CarouselView(),
        children: [],
        binding: CarouselBindings()),
  ];
}
