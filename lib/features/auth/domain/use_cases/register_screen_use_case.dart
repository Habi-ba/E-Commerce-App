import 'package:e_commerce_app/core/network/api_result.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';
import 'package:e_commerce_app/features/auth/domain/repository/auth_repository.dart';

class RegisterScreenUseCase {
  final AuthRepository _authRepository;
  RegisterScreenUseCase({required this._authRepository});
  Future<ApiResult<void>> call(RegisterRequest registerRequest) {
    return _authRepository.register(registerRequest);
  }
}
