import 'package:e_commerce_app/core/utils/resource.dart';

class RegisterStates {
   late Resource<void>registerState;
   RegisterStates({required this.registerState});
   RegisterStates.initial(){
      registerState=Resource.initial();
   }
}