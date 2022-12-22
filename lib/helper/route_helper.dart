import 'dart:ffi';

import 'package:food_shop/page/food/pupular_food_detail.dart';
import 'package:food_shop/page/food/recommended_food_detaile.dart';
import 'package:food_shop/page/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => "$initial";
  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";
  static String getRecommendedFood(int pageId) =>
      "$recommendedFood?pageId=$pageId";

  static List<GetPage> route = [
    GetPage(name: "/", page: () => const HomeFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PupularFoodDetaile(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var recommendedId = Get.parameters["pageId"];
          return RecommendedFoodDetailes(
              recommendedId: int.parse(recommendedId!));
        },
        transition: Transition.fadeIn),
  ];
}
