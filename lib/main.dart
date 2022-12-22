import 'package:flutter/material.dart';
import 'package:food_shop/controllers/popular_product_controller.dart';
import 'package:food_shop/controllers/recommended_product_controller.dart';
import 'package:food_shop/helper/route_helper.dart';
import 'package:food_shop/page/food/pupular_food_detail.dart';
import 'package:food_shop/page/food/recommended_food_detaile.dart';
import 'package:food_shop/page/home/food_page_body.dart';
import 'package:food_shop/page/home/main_food_page.dart';
import 'package:get/get.dart';
import 'helper/dependensies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularroductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      title: 'Food Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeFoodPage(),
      // initialRoute: RouteHelper.initial,
      getPages: RouteHelper.route,
    );
  }
}
