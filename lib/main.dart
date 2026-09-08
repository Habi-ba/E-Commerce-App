import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/my_bloc_observer.dart';
import 'package:e_commerce_app/features/auth/ui/login/login_screen.dart';
import 'package:e_commerce_app/features/auth/ui/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';

void main() {
  configureDependencies();
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.loginScreen,
          routes: {
            AppRoutes.loginScreen : (context) => LoginScreen(),
            AppRoutes.registerScreen:(context) => RegisterScreen()
          },

        );
      },
    );
  }


 
}
