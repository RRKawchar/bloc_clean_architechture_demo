import 'dart:io';

import 'package:bloc_clean_architecture/config/color/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidgets extends StatelessWidget {
  final double size;
  const LoadingWidgets({super.key, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Platform.isAndroid
          ? const CircularProgressIndicator(
              color: AppColors.loadingColor,
            )
          : const CupertinoActivityIndicator(
              color: AppColors.loadingColor,
            ),
    );
  }
}
