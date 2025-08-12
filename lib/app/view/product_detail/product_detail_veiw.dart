import 'package:e_commerce_chennai/app/model/product/product_response.dart';
import 'package:e_commerce_chennai/core/extensions/margin_extension.dart';
import 'package:e_commerce_chennai/core/style/app_text_style.dart';
import 'package:e_commerce_chennai/shared/utils/screen_utils.dart';
import 'package:e_commerce_chennai/shared/widgets/app_bar.dart';
import 'package:e_commerce_chennai/shared/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/style/colors.dart';
import '../../../shared/widgets/app_toast.dart';
import '../../controller/cart/cart_controller.dart';

class ProductDetailVeiw extends StatelessWidget {
  final ProductResponse product;
  const ProductDetailVeiw({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 27, 185, 228),
                        Color(0xFF7A00FF),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Hero(
                      tag: 'animation-image${product.image}',
                      child: Image.network(
                        product.image ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              25.h.hBox,
              Text(
                product.title ?? "",
                style: AppTextStyles.textStyle_600_18.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                "₹ ${product.price.toString()}",
                style: AppTextStyles.textStyle_600_18.copyWith(color: greyText),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.green, size: 20),
                  SizedBox(width: 5),
                  Text(
                    '${product.rating?.rate} (${product.rating?.count} reviews)',
                    style: AppTextStyles.textStyle_400_14.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              20.h.hBox,
              Text(
                product.description ?? "",
                style: AppTextStyles.textStyle_400_16.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButton(
              label: "Back",
              onTap: () {
                Screen.close();
              },
              isFilled: true,
            ),
            AppButton(
              label: "Add to Cart",
              onTap: () {
                cartController.addToCart(product);
                showToast("Item added to Cart", isError: false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
