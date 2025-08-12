import 'package:e_commerce_chennai/core/extensions/margin_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/style/app_text_style.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String labelText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final int? minLines;
  final int? max;
  final bool useHintInsteadOfLabel;

  const AppTextField({
    super.key,
    this.label,
    required this.controller,
    required this.textInputType,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.minLines,
    this.readOnly = false,
    required this.labelText,
    this.onChanged,
    this.maxLines,
    this.max,
    this.useHintInsteadOfLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) customTitle(label!),
        8.hBox,
        TextFormField(
          maxLength: maxLines,
          minLines: minLines,
          maxLines: max,
          readOnly: readOnly,
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            counterText: '',
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: useHintInsteadOfLabel ? labelText : null, 
            labelText: useHintInsteadOfLabel ? null : labelText,
            hintStyle: AppTextStyles.textStyle_500_14.copyWith(
              color: Colors.black,
            ),
            labelStyle: AppTextStyles.textStyle_500_14.copyWith(
              color: Colors.black12,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: const Color.fromARGB(255, 153, 154, 156), width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: const Color.fromARGB(255, 153, 154, 156), width: 1),
            ),
          ),
          keyboardType: textInputType,
          validator: validator,
        ),
      ],
    );
  }
}

Widget customTitle(final String label) {
  return Text(
    label,
    style: AppTextStyles.textStyle_500_14,
  );
}
