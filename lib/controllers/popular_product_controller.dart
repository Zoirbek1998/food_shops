import 'package:food_shop/data/repository/poopular_product_repo.dart';
import 'package:food_shop/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductsModel> _popularProductList = [];
  List<ProductsModel> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularroductList() async {
    Response response = await popularProductRepo.getPopularroductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products!);
      _isLoaded = true;
      update();
    } else {}
  }
}
