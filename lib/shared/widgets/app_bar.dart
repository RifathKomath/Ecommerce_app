import 'package:flutter/material.dart';
import 'package:e_commerce_chennai/core/style/colors.dart';
import 'package:e_commerce_chennai/core/style/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool? autoLeading;

  const CustomAppBar({Key? key, this.title, this.actions,this.autoLeading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: lightBlueBackground,
      forceMaterialTransparency: true,
      automaticallyImplyLeading: autoLeading ?? false,
      title: title != null
          ? Text(
              title!,
              style: AppTextStyles.textStyle_700_24,
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
