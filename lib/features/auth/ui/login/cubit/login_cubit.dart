import 'dart:math';

import 'package:e_commerce_app/core/utils/resource.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';
import 'package:e_commerce_app/features/auth/domain/use_cases/login_screen_use_case.dart';
import 'package:e_commerce_app/features/auth/ui/login/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  final LoginScreenUseCase _loginScreenUseCase;
  LoginCubit({required this._loginScreenUseCase}):super(LoginStates.initial());
 void login( String email, String password)async
 {
   //todo:loading
   emit(LoginStates(loginState: Resource.loading()));
   //todo: login => useCase
   LoginRequest loginRequest =LoginRequest(
     password: password,
     email: email
   );
   //var result= _loginScreenUseCase.call(loginRequest);
   var result=await _loginScreenUseCase( loginRequest);
   //todo:success
   if(result.isSuccess)
     {
       emit(LoginStates(loginState: Resource.success(data: null)));
     }
   //todo:Error
   else{
     emit(LoginStates(loginState: Resource.error(errorMessage: result.getError.error)));
   }

 }


}
//todo:view => viewModel
//todo:viewModel => object UseCase
//todo:UseCase => Repository
//todo:Repository => remote Ds
//todo:Repository => Connectivity

//todo: remote Ds => object ApiClient
//todo:ApiClient => object Dio
//todo:Dio  => BaseOptions, Interceptors, prettyDioLogger

