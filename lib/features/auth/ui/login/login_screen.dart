import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/features/auth/ui/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  var cubit=getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
