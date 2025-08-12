import 'package:e_commerce_chennai/app/model/product/product_response.dart';
import 'package:get/get.dart';

class CartController extends GetxController{  
    var cartItems = <ProductResponse>[].obs;

  void addToCart(ProductResponse product) {
    cartItems.add(product);
  }

  void removeFromCart(ProductResponse product) {
    cartItems.remove(product);
  }

  void clearCart() {
    cartItems.clear();
  }}