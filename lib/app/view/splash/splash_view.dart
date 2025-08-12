import 'package:e_commerce_chennai/app/controller/splash/splash_controller.dart';
import 'package:e_commerce_chennai/shared/widgets/app_lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    return Scaffold(
      body: Center(child: AppLottie(assetName: "loader (1)")),
    );
  }
}
