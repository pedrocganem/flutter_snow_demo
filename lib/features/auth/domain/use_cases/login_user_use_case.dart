import 'package:flutter_demo/core/generics/resource.dart';
import 'package:flutter_demo/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_demo/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// [Responsabilidade]: Executar ações que o usuário pode fazer ou que o sistema faz com ele mesmo.
/// Depende de [AuthRepository] ou de outros usecases necessários.

abstract class LoginUserUseCase {
  Future<Resource<UserEntity, String>> call(String email, String password);
}

class LoginUserUseCaseImpl implements LoginUserUseCase {
  final AuthRepository _authRepository = Modular.get<AuthRepository>();

  @override
  Future<Resource<UserEntity, String>> call(
      String email, String password) async {
    final resource = await _authRepository.login(email, password);
    if (resource.hasError) {
      return Resource.failed(error: "error on loginUseCase");
    }
    return Resource.success(data: resource.data);
  }
}
