import 'package:e_commerce_chennai/app/view/product/product_view.dart';
import 'package:e_commerce_chennai/shared/utils/screen_utils.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    openProductScreen();
  }

  void openProductScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Screen.openAsNewPage(ProductView());
  }
}
