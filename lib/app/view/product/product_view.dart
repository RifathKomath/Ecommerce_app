import 'package:e_commerce_chennai/app/controller/product/product_controller.dart';
import 'package:e_commerce_chennai/app/view/cart/cart_view.dart';
import 'package:e_commerce_chennai/app/view/product_detail/product_detail_veiw.dart';
import 'package:e_commerce_chennai/core/extensions/margin_extension.dart';
import 'package:e_commerce_chennai/core/style/colors.dart';
import 'package:e_commerce_chennai/shared/utils/screen_utils.dart';
import 'package:e_commerce_chennai/shared/widgets/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/style/app_text_style.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../controller/cart/cart_controller.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());
    final CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Obx(
            () => Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.black),
                  onPressed: () {
                    Screen.open(CartView());
                  },
                ),
                Positioned(
                  child: Container(
                    height: 25.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        cartController.cartItems.length.toString(),
                        style: AppTextStyles.textStyle_700_12.copyWith(
                          color: whiteClr,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header text
            RichText(
              text: TextSpan(
                text: "Get Your ",
                style: AppTextStyles.textStyle_400_14.copyWith(
                  fontSize: 28,
                  color: primaryColor,
                ),
                children: [
                  TextSpan(
                    text: "Products\nFrom",
                    style: AppTextStyles.textStyle_600_16.copyWith(
                      fontSize: 28,
                      color: greyText,
                    ),
                  ),
                  TextSpan(
                    text: " our site",
                    style: AppTextStyles.textStyle_400_14.copyWith(
                      fontSize: 28,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            // grid view card
            25.h.hBox,
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(color: primaryColor),
                  );
                }
                if (controller.productList.isEmpty) {
                  return Center(child: Text("No products found"));
                }
                return ListView.separated(
                  itemCount: controller.productList.length,
                  separatorBuilder: (context, index) => 16.h.hBox,
                  itemBuilder: (context, index) {
                    final products = controller.productList[index];
                    return Container(
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
                          color: whiteClr,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Screen.open(
                                  ProductDetailVeiw(product: products),
                                );
                              },
                              child: Hero(
                                tag: 'animation-image${products.image}',
                                child: SizedBox(
                                  height: 50.h,
                                  width: 50.w,

                                  child: Image.network(
                                    products.image ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            16.w.wBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    products.title ?? "",
                                    style: AppTextStyles.textStyle_700_16,
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                Text(
                                  products.category ?? "",
                                  style: AppTextStyles.textStyle_500_16,
                                ),
                                Text(
                                  "₹ ${products.price}",
                                  style: AppTextStyles.textStyle_400_16
                                      .copyWith(color: greyText),
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                cartController.addToCart(products);
                                showToast("Item added to Cart", isError: false);
                              },
                              child: Container(
                                height: 35.h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: whiteClr,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 25,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
