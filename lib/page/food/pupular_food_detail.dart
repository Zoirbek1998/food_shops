import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:food_shop/controllers/popular_product_controller.dart';
import 'package:food_shop/utils/app_colors.dart';
import 'package:food_shop/utils/app_constants.dart';
import 'package:food_shop/utils/dimensions.dart';
import 'package:food_shop/widgets/app_column.dart';
import 'package:food_shop/widgets/app_icon.dart';
import 'package:food_shop/widgets/big_text.dart';
import 'package:food_shop/widgets/exandable_text.dart';
import 'package:food_shop/widgets/icon_and_text.dart';
import 'package:food_shop/widgets/smaill_text.dart';
import 'package:get/get.dart';

class PupularFoodDetaile extends StatelessWidget {
  int pageId;
  PupularFoodDetaile({
    super.key,
    required this.pageId,
  });

  @override
  Widget build(BuildContext context) {
    //  int id = widget.pageIds
    var products =
        Get.find<PopularProductController>().popularProductList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // header image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.IMAGE_URI + products.img!),
                ),
              ),
            ),
          ),

          // app bar
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
          ),

          // description
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: products.name!,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(text: 'Intrduce'),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExandableTextWidget(text: products.description!
                          // "Mavjud Lore Ipsum oyatlarning ko'p tafovutlar bor, lekin ko'p ba'zi shaklida o'zgartirish uchradi, sanchiladi hazil tomonidan, hatto bir oz ehtimol qarash emas yoki randomize so'zlar. Agar siz Lore Ipsum parchasidan foydalanmoqchi bo'lsangiz, matn o'rtasida sharmandali narsa yashirilmaganiga ishonch hosil qilishingiz kerak. Internetda barcha Lore Ipsum generatorlar zarur oldindan belgilangan qismlar takrorlash moyil, bu internetda birinchi haqiqiy generator qilish. Bu orqali bir lug'at foydalanadi 200 lotin so'zlar, model hukm tuzilmalari bir hovuch bilan birga, o'rtacha ko'rinadi Lore Ipsum ishlab chiqarish uchun. Yaratilgan Lore Ipsum shuning uchun har doim takrorlash, AOK qilingan hazil yoki xarakterli bo'lmagan so'zlardan va hokazolardan xoli.",
                          ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // Exandable Text
        ],
      ),
      bottomNavigationBar: Container(
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
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
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
                text: "\$${products.price!} | Add to cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
