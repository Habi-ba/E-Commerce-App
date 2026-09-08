import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onPressed,
  });

  final String errorMessage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 20.h,
        children: [
          Text(errorMessage, style: Theme.of(context).textTheme.titleMedium),
          ElevatedButton(
            onPressed: onPressed,
            child: Text('Try Again', style: AppTextStyles.semiBold20Blue),
          ),
        ],
      ),
    );
  }
}
