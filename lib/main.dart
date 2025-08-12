import 'package:e_commerce_chennai/app/view/splash/splash_view.dart';
import 'package:e_commerce_chennai/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: false,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter E-commerce-chennai',
        theme: ThemeData(   
          scaffoldBackgroundColor: lightBlueBackground
        ),
        home: SplashView()
      ),
    );
  }
}

