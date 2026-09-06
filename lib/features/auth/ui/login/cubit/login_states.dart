import 'package:e_commerce_app/core/utils/resource.dart';

class LoginStates {
  late Resource<void> loginState;
  LoginStates({required this.loginState});

  LoginStates.initial()
  {
    loginState=Resource.initial();
  }
}