import 'package:buy_buddy_user_app/core/custom/custom_circle_grad.dart';
import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //testing circle grad
        child: GradientCircleBorder(gradientColors: AppColors.gradColors),
      ),
    );
  }
}
