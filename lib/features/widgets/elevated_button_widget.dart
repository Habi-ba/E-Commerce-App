import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onTab;
  final String buttonText;

  const ElevatedButtonWidget({
    super.key,
    required this.onTab,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTab,

        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).cardColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 20.h),
          child: Text(
            buttonText,
            style: AppTextStyles.semiBold20Blue,
          ),
        ),
      ),
    );
  }
}
