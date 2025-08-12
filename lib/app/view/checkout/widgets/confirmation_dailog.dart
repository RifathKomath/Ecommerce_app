import 'package:e_commerce_chennai/app/view/cart/cart_view.dart';
import 'package:e_commerce_chennai/app/view/product/product_view.dart';
import 'package:e_commerce_chennai/core/extensions/margin_extension.dart';
import 'package:e_commerce_chennai/core/style/app_text_style.dart';
import 'package:e_commerce_chennai/core/style/colors.dart';
import 'package:e_commerce_chennai/shared/utils/screen_utils.dart';
import 'package:e_commerce_chennai/shared/widgets/app_button.dart';
import 'package:e_commerce_chennai/shared/widgets/app_lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmationDailog extends StatelessWidget {
  final String address;
  final String city;
  final String zip;
  final double totalAmount;
  const ConfirmationDailog({
    super.key,
    required this.address,
    required this.city,
    required this.zip,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      backgroundColor: lightBlueBackground,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppLottie(assetName: "success"),
            Text("Order Successfully Placed",style: AppTextStyles.textStyle_700_16,),
            35.h.hBox,
            customRaw(title: "Address :", subTitle: "$address, $city, $zip"),
            15.h.hBox,
            customRaw(title: "Total Amount :", subTitle: "₹ $totalAmount"),
        
            35.h.hBox,
            AppButton(
              label: "Close",
              onTap: () {
                Screen.openAsNewPage(ProductView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
