import 'package:e_commerce_chennai/app/view/checkout/checkout_view.dart';
import 'package:e_commerce_chennai/core/extensions/margin_extension.dart';
import 'package:e_commerce_chennai/shared/widgets/app_bar.dart';
import 'package:e_commerce_chennai/shared/widgets/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/style/app_text_style.dart';
import '../../../core/style/colors.dart';
import '../../../shared/utils/screen_utils.dart';
import '../../../shared/widgets/app_button.dart';
import '../../controller/cart/cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: CustomAppBar(title: "Cart", autoLeading: true),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(child: Text("Cart is empty"));
        }

        double subtotal = cartController.cartItems.fold(
          0,
          (sum, item) => sum + (item.price ?? 0),
        );
        double tax = 30.00;
        double total = subtotal + tax;

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: cartController.cartItems.length,
                  separatorBuilder: (context, index) => 16.h.hBox,
                  itemBuilder: (context, index) {
                    final product = cartController.cartItems[index];
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 186, 191, 195),
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: Image.network(
                                product.image ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                            16.w.wBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title ?? "",
                                    style: AppTextStyles.textStyle_700_16,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    product.category ?? "",
                                    style: AppTextStyles.textStyle_500_16,
                                  ),
                                  Text(
                                    "₹ ${product.price}",
                                    style: AppTextStyles.textStyle_400_16
                                        .copyWith(color: greyText),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                cartController.removeFromCart(product);
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 214, 188, 242),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 6.h,
                    children: [
                      customRaw(
                        title: "Price :",
                        subTitle: "₹ ${subtotal.toStringAsFixed(2)}",
                      ),
                      customRaw(
                        title: "Tax :",
                        subTitle: "₹ ${tax.toStringAsFixed(2)}",
                      ),
                      customRaw(
                        title: "Total Amount",
                        subTitle: "₹ ${total.toStringAsFixed(2)}",
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AppButton(
          label: "Proceed to Checkout",
          onTap: () {
            if (cartController.cartItems.isEmpty) {
              showToast("Cart Empty, Add items to cart first", isError: true);
              return;
            }
          
            double subtotal = cartController.cartItems.fold(
              0,
              (sum, item) => sum + (item.price ?? 0),
            );
            double tax = 30.00;
            double total = subtotal + tax;
            Screen.open(CheckoutView(totalAmount: total));
          },
        ),
      ),
    );
  }
}

Widget customRaw({
  required String title,
  required String subTitle,
  Color color = Colors.black,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: AppTextStyles.textStyle_600_16),
      Text(
        subTitle,
        style: AppTextStyles.textStyle_600_16.copyWith(color: color),
      ),
    ],
  );
}
