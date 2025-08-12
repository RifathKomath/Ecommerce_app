import 'package:e_commerce_chennai/core/extensions/margin_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/style/app_text_style.dart';
import '../../core/style/colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isErrorButton;
  final bool isFilled;
  final bool? isFilledLightBlue;
  final bool? isLoaderBtn;
  final double height;
  final IconData? icon;
  final bool isPrefixIconEnabled;
  final Color? bgColor;
  final Color? textColor;

  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isErrorButton = false,
    this.isFilled = false,
    this.isFilledLightBlue = false,
    this.icon,
    this.isPrefixIconEnabled = false,
    this.height = 50,
    this.bgColor,
    this.textColor,
    this.isLoaderBtn = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveButtonColor = isErrorButton
        ? red
        : (bgColor ?? buttonColor.colors.first);

    final Color finalTextColor =
        textColor ?? (isFilled
            ? primaryColor
            : isFilledLightBlue == true
                ? darkBlue
                : (isErrorButton ? darkRed : Colors.white));

    final BoxDecoration decoration = isFilled
        ? BoxDecoration(
            color: whiteClr,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: primaryColor),
          )
        : isFilledLightBlue == true
            ? BoxDecoration(
                color: lightBlueBackground,
                borderRadius: BorderRadius.circular(12.r),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: isErrorButton
                    ? null
                    : (bgColor == null ? buttonColor : null),
                color: isErrorButton ? red : (bgColor != null ? bgColor : null),
              );

    return GestureDetector(
      onTap: (isLoaderBtn ?? false) ? null : onTap,
      child: Container(
        height: height,
        alignment: Alignment.center,
        decoration: decoration,
        child: (isLoaderBtn ?? false)
            ? const CupertinoActivityIndicator(color: Colors.white)
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isPrefixIconEnabled && icon != null)
                    Icon(icon, color: finalTextColor, size: 20),
                  if (isPrefixIconEnabled && icon != null) 8.wBox,
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 34.0.w, vertical: 12.w),
                    child: Text(
                      label,
                      style: AppTextStyles.textStyle_500_16.copyWith(
                        color: finalTextColor,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
