import 'package:bloc_clean_architecture/config/color/app_colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  const RoundedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.height = 40,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
