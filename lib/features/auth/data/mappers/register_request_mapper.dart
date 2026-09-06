import 'package:e_commerce_app/features/auth/data/models/request/register/register_request_dto.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';

extension RegisterRequestMapper on RegisterRequest {
  //عشان نحول من entity ل Dto
  RegisterRequestDto toRegisterRequestDto() {
    return RegisterRequestDto(
      email: email,
      password: password,
      name: name,
      phone: phone,
      rePassword: rePassword,
    );
  }
}
