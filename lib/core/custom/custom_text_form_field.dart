import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final VoidCallback? onSuffixTap;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,

        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.buttonBackground,
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null
              ? GestureDetector(onTap: onSuffixTap, child: Icon(suffixIcon))
              : null,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 16,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.buttonBackground, // your theme color
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.focusBorder, width: 1),
          ),
        ),
      ),
    );
  }
}
