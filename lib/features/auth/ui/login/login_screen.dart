import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/flutter_toast.dart';
import 'package:e_commerce_app/features/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../widgets/elevated_button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var isPasswordVisible = false;
  var formKey = GlobalKey<FormState>();

  var cubit = getIt<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      bloc: cubit,

      listener: (BuildContext context, state) {
        if(state.loginState.isSuccess){
          ToastUtils.
          showToastMessage(
              message: 'Login Successfully',
              backgroundColor: AppColors.greenColor,
              textColor: AppColors.whiteColor);
        }else if(state.loginState.isError){
          ToastUtils.showToastMessage(
              message:state.loginState.errorMessage??'',
              backgroundColor: AppColors.redColor,
              textColor: AppColors.whiteColor);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 91.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // اللوجو
                          Center(
                            child: Image.asset(
                              AppImages.logoImage,
                              height: 71.h,
                              width: 237.w,
                            ),
                          ),
                          SizedBox(height: 86.h),

                          // العنوان والوصف
                          Text(
                            'Welcome Back To Route',
                            style: AppTextStyles.heading24White,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Please sign in with your mail',
                            style: AppTextStyles.subtitle16White,
                          ),
                          SizedBox(height: 24.h),

                          // User Name
                          Text('User Name', style: AppTextStyles.medium18White),
                          SizedBox(height: 8.h),
                          TextFieldWidget(
                            hintDisplayedTxt: 'enter your name',
                            controller: emailController,
                            validator: (txt) =>
                                AppValidators.validateEmail(txt),
                            prefIcon: Icon(
                              Icons.email_outlined,
                              color: AppColors.primaryDark,
                            ),
                          ),
                          SizedBox(height: 20.h),

                          // Password
                          Text('Password', style: AppTextStyles.medium18White),
                          SizedBox(height: 8.h),
                          TextFieldWidget(
                            controller: passwordController,
                            validator: (txt) {
                              return AppValidators.validatePassword(txt);
                            },
                            hintDisplayedTxt: 'enter your password',
                            prefIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: AppColors.primaryDark,
                            ),
                            obscure: !isPasswordVisible,
                            sufIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? MdiIcons.eyeOutline
                                    : MdiIcons.eyeOffOutline,
                                color: AppColors.primaryDark,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 8.h),

                          // Forget password
                          Row(
                            children: [
                              Spacer(),
                              Text(
                                'Forgot password',
                                style: AppTextStyles.regular14Navy.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32.h),

                          // Login button
                          Center(
                            child: BlocBuilder<LoginCubit,LoginStates>(
                              bloc: cubit,
                              builder: (BuildContext context, LoginStates state) {
                                if(!state.loginState.isLoading){
                                  return  ElevatedButtonWidget(
                                    onTab:() {
                                      if(formKey.currentState!.validate()){
                                        cubit.login(emailController.text,
                                            passwordController.text);
                                      }
                                    },
                                    buttonText: 'login',
                                  );
                                }
                                else{
                                  return MainLoadingWidget();
                                }
                              },

                            ),
                          ),
                          SizedBox(height: 24.h),

                          // Sign up row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\u2019t have an account?',
                                style: AppTextStyles.regular14Navy.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.registerScreen,
                                  );
                                },
                                child: Text(
                                  'Create Account',
                                  style: AppTextStyles.medium14Navy.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onLogin() async {
    // if (formKey.currentState!.validate() == true) {
    //   try {
    //     DialogUtils.showLoading(
    //       context: context,
    //       loadingText: LocaleKeys.loading.tr(),
    //     );
    //     final credential = await FirebaseUtils.loginWithEmail(
    //       email: emailController.text,
    //       password: passwordController.text,
    //     );
    //     var user = await FirebaseUtils.readFromFirstore(
    //       credential.user?.uid ?? '',
    //     );
    //     var userProvider = Provider.of<UserProvider>(context, listen: false);
    //     if (user == null) {
    //       return;
    //     }
    //     userProvider.updateUser(user);
    //
    //     DialogUtils.hideLoading(context: context);
    //     DialogUtils.showMessage(
    //       posActionName: LocaleKeys.ok.tr(),
    //       title: LocaleKeys.success.tr(),
    //       context: context,
    //       message: LocaleKeys.login_successfully.tr(),
    //       posAction: () {
    //         Navigator.of(context).pushNamed(AppRoutes.homeScreenRoute);
    //       },
    //     );
    //     print('id ${credential.user?.uid}');
    //   } on FirebaseAuthException catch (e) {
    //     DialogUtils.hideLoading(context: context);
    //     String message;
    //     switch (e.code) {
    //       case 'user-not-found':
    //         message = LocaleKeys.user_not_found.tr();
    //         break;
    //       case 'wrong-password':
    //         message = LocaleKeys.wrong_password.tr();
    //         break;
    //       case 'invalid-email':
    //         message = LocaleKeys.invalid_email.tr();
    //         break;
    //       case 'invalid-credential':
    //         message = LocaleKeys.invalid_credential.tr();
    //         break;
    //       default:
    //         message = e.message ?? LocaleKeys.something_went_wrong.tr();
    //     }
    //     DialogUtils.showMessage(
    //       posActionName: LocaleKeys.ok.tr(),
    //       title: LocaleKeys.error.tr(),
    //       context: context,
    //       message: message,
    //     );
    //   } catch (e) {
    //     DialogUtils.hideLoading(context: context);
    //     DialogUtils.showMessage(
    //       posActionName: LocaleKeys.ok.tr(),
    //       title: LocaleKeys.error.tr(),
    //       context: context,
    //       message: e.toString(),
    //     );
    //   }
    // }
  }

  void onLoginWithGoogle() async {
    //   try {
    //     DialogUtils.showLoading(
    //       context: context,
    //       loadingText: LocaleKeys.waiting.tr(),
    //     );
    //
    //     final credential = await FirebaseUtils.signInWithGoogle();
    //
    //     final user = credential.user;
    //
    //     if (user == null) {
    //       throw FirebaseAuthException(
    //         code: 'user-not-found',
    //         message: LocaleKeys.user_not_found.tr(),
    //       );
    //     }
    //
    //     MyUser myUser = MyUser(
    //       id: user.uid,
    //       name: user.displayName ?? '',
    //       email: user.email ?? '',
    //     );
    //
    //     var userProvider = Provider.of<UserProvider>(context, listen: false);
    //
    //     userProvider.updateUser(myUser);
    //
    //     DialogUtils.hideLoading(context: context);
    //
    //     DialogUtils.showMessage(
    //       posActionName: LocaleKeys.ok.tr(),
    //       title: LocaleKeys.success.tr(),
    //       context: context,
    //       message: LocaleKeys.login_successfully.tr(),
    //       posAction: () {
    //         Navigator.of(context).pushNamed(AppRoutes.homeScreenRoute);
    //       },
    //     );
    //   } on FirebaseAuthException catch (e) {
    //     DialogUtils.hideLoading(context: context);
    //
    //     DialogUtils.showMessage(
    //       posActionName: LocaleKeys.ok.tr(),
    //       title: LocaleKeys.error.tr(),
    //       context: context,
    //       message: e.message ?? LocaleKeys.something_went_wrong.tr(),
    //     );
    //   } catch (e) {
    //     DialogUtils.hideLoading(context: context);
    //
    //     DialogUtils.showMessage(
    //       posActionName: LocaleKeys.ok.tr(),
    //       title: LocaleKeys.error.tr(),
    //       context: context,
    //       message: e.toString(),
    //     );
    //   }
  }
}
