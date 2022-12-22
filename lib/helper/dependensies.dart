import 'package:food_shop/controllers/popular_product_controller.dart';
import 'package:food_shop/controllers/recommended_product_controller.dart';
import 'package:food_shop/data/api/api_client.dart';
import 'package:food_shop/data/repository/poopular_product_repo.dart';
import 'package:food_shop/data/repository/recommended_products_rep.dart';
import 'package:food_shop/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
