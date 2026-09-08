import 'package:flutter/material.dart';
import 'app_colors.dart';

/// كل الـ Text Styles مستخرجة من Figma (Route - E-Commerce App)
/// الخط المستخدم في كل الأنماط: Poppins
/// letterSpacing ثابتة في كل الأنماط: -0.17
class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Poppins';
  static const double _letterSpacing = -0.17;


  /// SemiBold 24 - عنوان رئيسي زي "Welcome Back To Route"
  static const TextStyle heading24White = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 24,
    letterSpacing: _letterSpacing,
    color: AppColors.whiteColor,
  );

  /// Light 16 - نص وصفي زي "Please sign in with your mail"
  static const TextStyle subtitle16White = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300, // Light
    fontSize: 16,
    letterSpacing: _letterSpacing,
    color: AppColors.whiteColor,
  );

  /// Medium 18 - على خلفية بيضاء (labels زي "User Name" / "Password")
  static const TextStyle medium18White = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500, // Medium
    fontSize: 18,
    letterSpacing: _letterSpacing,
    color: AppColors.whiteColor,
  );

  /// Regular 18 - نص عادي أبيض
  static const TextStyle regular18White = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 18,
    letterSpacing: _letterSpacing,
    color: AppColors.whiteColor,
  );

  /// Medium 20 - أبيض (عناوين متوسطة على البلوك الأزرق)
  static const TextStyle medium20White = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    letterSpacing: _letterSpacing,
    color: AppColors.whiteColor,
  );

  // ------- نص أزرق (Primary) -------

  /// SemiBold 20 - أزرق (زرار زي "Login")
  static const TextStyle semiBold20Blue = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    letterSpacing: _letterSpacing,
    color: AppColors.primaryColor,
  );

  // ------- أنماط كحلي (شاشة Home - المنتجات، الأقسام) -------

  /// Light 14 - كحلي باهت
  static const TextStyle light14NavyMuted = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 14,
    letterSpacing: _letterSpacing,
    color: AppColors.primaryDarkLight,
  );

  /// Regular 14 - كحلي (أسماء منتجات، نصوص أساسية صغيرة)
  static const TextStyle regular14Navy = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: _letterSpacing,
    color: AppColors.primaryDark,
  );

  /// Regular 14 - كحلي باهت (نصوص ثانوية زي "view all")
  static const TextStyle regular14NavyMuted = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: _letterSpacing,
    color: AppColors.primaryDarkLight,
  );

  /// Medium 18 - كحلي (عناوين أقسام زي "Categories")
  static const TextStyle medium18Navy = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    letterSpacing: _letterSpacing,
    color: AppColors.primaryDark,
  );

  /// Medium 18 - كحلي باهت
  static const TextStyle medium18NavyMuted = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    letterSpacing: _letterSpacing,
    color: AppColors.primaryDarkLight,
  );

  /// Medium 14 - كحلي (labels صغيرة زي أسعار أو تصنيفات)
  static const TextStyle medium14Navy = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: _letterSpacing,
    color: AppColors.primaryDark,
  );

  /// Medium 14 - كحلي باهت
  static const TextStyle medium14NavyMuted = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: _letterSpacing,
    color: AppColors.primaryDarkLight,
  );

  /// Regular 12 - كحلي (نصوص صغيرة جدًا زي تسميات تحت الأيقونات)
  static const TextStyle regular12Navy = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: _letterSpacing,
    color: AppColors.primaryDark,
  );
}