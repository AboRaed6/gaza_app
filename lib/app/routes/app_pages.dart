import 'package:get/get.dart';

import '../modules/add_place/bindings/add_place_binding.dart';
import '../modules/add_place/views/add_place_view.dart';
import '../modules/city/bindings/city_binding.dart';
import '../modules/city/views/city_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/place/bindings/place_binding.dart';
import '../modules/place/views/place_view.dart';
import '../modules/splach/bindings/splach_binding.dart';
import '../modules/splach/views/splach_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLACH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLACH,
      page: () => SplachView(),
      binding: SplachBinding(),
    ),
    GetPage(
      name: _Paths.CITY,
      page: () => CityView(),
      binding: CityBinding(),
    ),
    GetPage(
      name: _Paths.PLACE,
      page: () => PlaceView(),
      binding: PlaceBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PLACE,
      page: () => AddPlaceView(),
      binding: AddPlaceBinding(),
    ),
  ];
}
