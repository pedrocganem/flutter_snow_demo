import 'package:flutter_demo/core/generics/resource.dart';
import 'package:flutter_demo/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_demo/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_demo/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// [Responsabilidades]: Tratar dados
/// Dependencias: [DataSource]

class AuthRepositoryImpl implements AuthRepository {
  final _remoteDataSource = Modular.get<AuthRemoteDataSource>();

  @override
  Future<Resource<UserEntity, String>> login(
      String email, String password) async {
    final resource = await _remoteDataSource.login(email, password);
    if (resource.hasError || resource.data == null) {
      return Resource.failed(error: "error on repository");
    }
    final userEntity = UserEntity.fromMap(resource.data!);
    return Resource.success(data: userEntity);
  }
}
