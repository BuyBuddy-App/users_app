import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientCircleBorder extends StatelessWidget {
  final double size; // total diameter
  final double borderWidth;
  final List<Color>? gradientColors;
  final Color backgroundColor;
  final Widget? child;

  const GradientCircleBorder({
    Key? key,
    this.size = 100,
    this.borderWidth = 1,
    required this.gradientColors,
    this.backgroundColor = Colors.black,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: gradientColors ?? AppColors.gradColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Container(
          width: size - borderWidth * 2,
          height: size - borderWidth * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
