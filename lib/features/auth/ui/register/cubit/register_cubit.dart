import 'dart:math';

import 'package:e_commerce_app/core/utils/resource.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';
import 'package:e_commerce_app/features/auth/domain/use_cases/register_screen_use_case.dart';
import 'package:e_commerce_app/features/auth/ui/register/cubit/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterScreenUseCase _registerScreenUseCase;
  RegisterCubit({required this._registerScreenUseCase}):super(RegisterStates.initial());
  void register( String email, String password,String rePassword,String phone,String name)async
  {
    //todo:loading
    emit(RegisterStates(registerState: Resource.loading()));
    //todo: login => useCase
    RegisterRequest registerRequest =RegisterRequest(
      name:name ,
        password: password,
        email: email,
      rePassword: rePassword,
      phone: phone
    );
    //var result= _loginScreenUseCase.call(loginRequest);
    var result=await _registerScreenUseCase(registerRequest);
    //todo:success
    if(result.isSuccess)
    {
      emit(RegisterStates(registerState: Resource.success(data: null)));
    }
    //todo:Error
    else{
      emit(RegisterStates(registerState: Resource.error(errorMessage: result.getError.error)));
    }

  }


}
