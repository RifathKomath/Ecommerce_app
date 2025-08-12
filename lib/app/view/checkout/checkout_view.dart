import 'package:e_commerce_chennai/app/view/checkout/widgets/confirmation_dailog.dart';
import 'package:e_commerce_chennai/core/extensions/margin_extension.dart';
import 'package:e_commerce_chennai/shared/widgets/app_bar.dart';
import 'package:e_commerce_chennai/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/style/app_text_style.dart';
import '../../../shared/utils/screen_utils.dart';
import '../../../shared/widgets/app_button.dart';

class CheckoutView extends StatelessWidget {
  final double totalAmount;
  const CheckoutView({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController streetAddress = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController zipController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: CustomAppBar(title: "Checkout", autoLeading: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.h.hBox,
            headerTextContainer(title: "Shipping Address"),
            10.h.hBox,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 7.h,
                  children: [
                    AppTextField(
                      controller: nameController,
                      textInputType: TextInputType.text,
                      labelText: "",
                      label: "Full Name",
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Please fill the field";
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      controller: streetAddress,
                      textInputType: TextInputType.streetAddress,
                      labelText: "",
                      label: "Street Address",
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Please fill the field";
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: AppTextField(
                            controller: cityController,
                            textInputType: TextInputType.text,
                            labelText: "",
                            label: "City",
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return "Please fill the field";
                              }
                              return null;
                            },
                          ),
                        ),
                        10.w.wBox,
                        Expanded(
                          flex: 1,
                          child: AppTextField(
                            controller: zipController,
                            textInputType: TextInputType.number,
                            labelText: "",
                            label: "Zip",
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return "Please fill the field";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            10.h.hBox,
            headerTextContainer(title: "Payment Options"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/google-pay-logo-transparent-free-png.webp",
                  height: 150.h,
                ),
                Image.asset(
                  "assets/images/cash-on-delivery-icon-12.jpg",
                  height: 150.h,
                ),
              ],
            ).paddingSymmetricHorizontal(15),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AppButton(
          label: "Place Order",
          onTap: () {
            if (formKey.currentState!.validate()) {
              showDialog(
                context: context,
                builder: (context) => ConfirmationDailog(
                  totalAmount:totalAmount,
                  address: streetAddress.text,
                  city: cityController.text,
                  zip: zipController.text,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget headerTextContainer({
  required String title,
  String? svgName,
  VoidCallback? onTap,
}) {
  return Container(
    width: double.infinity,
    color: Color.fromARGB(255, 214, 188, 242),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        title,
        style: AppTextStyles.textStyle_700_16.copyWith(fontSize: 18),
      ),
    ).paddingSymmetricHorizontal(10),
  );
}
