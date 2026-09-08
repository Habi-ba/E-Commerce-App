import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/flutter_toast.dart';
import 'package:e_commerce_app/features/auth/ui/register/cubit/register_cubit.dart';
import 'package:e_commerce_app/features/auth/ui/register/cubit/register_states.dart';
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

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  var rePasswordController = TextEditingController();

  var passwordController = TextEditingController();
  var isConfirmPasswordVisible = false;

  var isPasswordVisible = false;
  var formKey = GlobalKey<FormState>();

  var cubit = getIt<RegisterCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterStates>(
      bloc: cubit,

      listener: (BuildContext context, state) {
        if (state.registerState.isSuccess) {
          ToastUtils.showToastMessage(
            message: 'Signed Successfully',
            backgroundColor: AppColors.greenColor,
            textColor: AppColors.whiteColor,
          );
        } else if (state.registerState.isError) {
          ToastUtils.showToastMessage(
            message: state.registerState.errorMessage ?? '',
            backgroundColor: AppColors.redColor,
            textColor: AppColors.whiteColor,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 31.h,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              AppImages.logoImage,
                              height: 71.h,
                              width: 237.w,
                            ),
                          ),

                          SizedBox(height: 25.h),
                          Text('Full Name', style: AppTextStyles.medium18White),

                          TextFieldWidget(
                            controller: nameController,
                            validator: (text) {
                              return AppValidators.validateFullName(text);
                            },
                            hintDisplayedTxt: 'enter your full name',
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Phone Number',
                            style: AppTextStyles.medium18White,
                          ),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            controller: phoneController,
                            validator: (text) {
                              return AppValidators.validatePhoneNumber(text);
                            },
                            hintDisplayedTxt: 'enter your mobile no.',
                          ),

                          SizedBox(height: 10),
                          Text(
                            'E-mail address',
                            style: AppTextStyles.medium18White,
                          ),
                          TextFieldWidget(
                            controller: emailController,
                            validator: (text) {
                              return AppValidators.validateEmail(text);
                            },
                            hintDisplayedTxt: 'enter your email address',
                          ),
                          SizedBox(height: 10),
                          Text('Password', style: AppTextStyles.medium18White),

                          TextFieldWidget(
                            controller: passwordController,
                            validator: (text) {
                              return AppValidators.validatePassword(text);
                            },
                            hintDisplayedTxt: 'enter your password',

                            obscure: !isPasswordVisible,
                            sufIcon: IconButton(
                              icon: isPasswordVisible
                                  ? Icon(
                                      MdiIcons.eyeOutline,
                                      color: Theme.of(context).iconTheme.color,
                                    )
                                  : Icon(
                                      MdiIcons.eyeOffOutline,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'RePassword',
                            style: AppTextStyles.medium18White,
                          ),

                          TextFieldWidget(
                            controller: rePasswordController,
                            validator: (text) {
                              return AppValidators.validateConfirmPassword(
                                text,
                                passwordController.text,
                              );
                            },
                            hintDisplayedTxt: 're Password',

                            obscure: !isConfirmPasswordVisible,
                            sufIcon: IconButton(
                              icon: isConfirmPasswordVisible
                                  ? Icon(
                                      MdiIcons.eyeOutline,
                                      color: Theme.of(context).iconTheme.color,
                                    )
                                  : Icon(
                                      MdiIcons.eyeOffOutline,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                              onPressed: () {
                                setState(() {
                                  isConfirmPasswordVisible =
                                      !isConfirmPasswordVisible;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Center(
                            child: BlocBuilder<RegisterCubit, RegisterStates>(
                              bloc: cubit,
                              builder:
                                  (BuildContext context, RegisterStates state) {
                                    if (!state.registerState.isLoading) {
                                      return ElevatedButtonWidget(
                                        onTab: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            cubit.register(
                                              emailController.text,
                                              passwordController.text,
                                              rePasswordController.text,
                                              phoneController.text,
                                              nameController.text,
                                            );
                                          }
                                        },
                                        buttonText: 'Sign Up',
                                      );
                                    } else {
                                      return MainLoadingWidget();
                                    }
                                  },
                            ),
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
