import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_shop/controllers/recommended_product_controller.dart';
import 'package:food_shop/helper/route_helper.dart';
import 'package:food_shop/utils/app_colors.dart';
import 'package:food_shop/utils/app_constants.dart';
import 'package:food_shop/utils/dimensions.dart';
import 'package:food_shop/widgets/app_icon.dart';
import 'package:food_shop/widgets/big_text.dart';
import 'package:food_shop/widgets/exandable_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetailes extends StatelessWidget {
  int recommendedId;
  RecommendedFoodDetailes({super.key, required this.recommendedId});

  @override
  Widget build(BuildContext context) {
    var recommended = Get.find<RecommendedProductController>()
        .recommendedProductList[recommendedId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          //
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 90,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.toNamed(RouteHelper.getInitial()),
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.black,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_bag_outlined,
                  iconColor: Colors.black,
                ),
              ],
            ),
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                alignment: Alignment.center,
                child: BigText(
                  text: recommended.name!,
                  size: Dimensions.font26,
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    )),
              ),
            ),
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.IMAGE_URI + recommended.img!,
                // "assets/images/food.jpeg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: ExandableTextWidget(text: recommended.description!
                      // "Mavjud Lore Ipsum oyatlarning ko'p tafovutlar bor, lekin ko'p ba'zi shaklida o'zgartirish uchradi, sanchiladi hazil tomonidan, hatto bir oz ehtimol qarash emas yoki randomize so'zlar. Agar siz Lore Ipsum parchasidan foydalanmoqchi bo'lsangiz, matn o'rtasida sharmandali narsa yashirilmaganiga ishonch hosil qilishingiz kerak. Internetda barcha Lore Ipsum generatorlar zarur oldindan belgilangan qismlar takrorlash moyil, bu internetda birinchi haqiqiy generator qilish. Bu orqali bir lug'at foydalanadi 200 lotin so'zlar, model hukm tuzilmalari bir hovuch bilan birga, o'rtacha ko'rinadi Lore Ipsum ishlab chiqarish uchun. Yaratilgan Lore Ipsum shuning uchun har doim takrorlash, AOK qilingan hazil yoki xarakterli bo'lmagan so'zlardan va hokazolardan xoli.",
                      ),
                ),
                // Text(
                //   "Mavjud Lore Ipsum oyatlarning ko'p tafovutlar bor, lekin ko'p ba'zi shaklida o'zgartirish uchradi, sanchiladi hazil tomonidan, hatto bir oz ehtimol qarash emas yoki randomize so'zlar. Agar siz Lore Ipsum parchasidan foydalanmoqchi bo'lsangiz, matn o'rtasida sharmandali narsa yashirilmaganiga ishonch hosil qilishingiz kerak. Internetda barcha Lore Ipsum generatorlar zarur oldindan belgilangan qismlar takrorlash moyil, bu internetda birinchi haqiqiy generator qilish. Bu orqali bir lug'at foydalanadi 200 lotin so'zlar, model hukm tuzilmalari bir hovuch bilan birga, o'rtacha ko'rinadi Lore Ipsum ishlab chiqarish uchun. Yaratilgan Lore Ipsum shuning uchun har doim takrorlash, AOK qilingan hazil yoki xarakterli bo'lmagan so'zlardan va hokazolardan xoli.",
                //   style: TextStyle(fontSize: 50),
                // ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // add item
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                BigText(
                  text: "\$${recommended.price!}" + " X " + "0",
                  color: AppColors.mainBackColor,
                  size: Dimensions.font16,
                ),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add),
              ],
            ),
          ),

          // like

          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroudColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //product add and remuve
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                ),

                //product card shop
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: BigText(
                    text: "\$${recommended.price!} | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
