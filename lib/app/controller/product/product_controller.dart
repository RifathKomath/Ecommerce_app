import 'dart:convert';

import 'package:e_commerce_chennai/core/service/urls.dart';
import 'package:get/get.dart';

import '../../../core/service/api.dart';
import '../../model/product/product_response.dart';

class ProductController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getProductList();
  }

  RxBool isLoading = false.obs;

  RxList<ProductResponse> productList = <ProductResponse>[].obs;

  getProductList() async {
    try {
      isLoading.value = true;

      final response = await Api.call(endPoint: getProductUrl);
      if (response.success) {
        final List<dynamic> jsonList = response.response as List<dynamic>;
        final List<ProductResponse> data = jsonList
            .map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
            .toList();

        productList.value = data;
        print("Observable list length: ${productList.length}");
      }
    } catch (e) {
      print("Error in getting products: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
