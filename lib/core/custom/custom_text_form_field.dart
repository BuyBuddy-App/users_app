import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final String? helperText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String Function(String?)? validator;
  final TextEditingController? controller;
  final VoidCallback? onSuffixTap;
  final AutovalidateMode? autovalidateMode;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.labelText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.onSuffixTap,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: helperText == null ? 56 : 76,
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        autovalidateMode: autovalidateMode,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.buttonBackground,
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          helperStyle: GoogleFonts.roboto(
            color: AppColors.onPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
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
