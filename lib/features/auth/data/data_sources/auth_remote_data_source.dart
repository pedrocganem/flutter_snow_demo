import 'package:flutter_demo/core/adapters/remote_client.dart';
import 'package:flutter_demo/core/constants/api_routes.dart';
import 'package:flutter_demo/core/generics/resource.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// [Responsabilidade]: Pegar dados.
/// depende de [RemoteClient]

abstract class AuthRemoteDataSource {
  Future<Resource<Map<String, dynamic>, String>> login(
      String email, String password);
  Future<Resource<Map<String, dynamic>, String>> register(
      String email, String password, String passwordConfirmation);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final _remoteClient = Modular.get<RemoteClient>();

  @override
  Future<Resource<Map<String, dynamic>, String>> login(
      String email, String password) async {
    final resource = await _remoteClient.post(
      ApiRoutes.loginApiRoute,
      body: {
        'email': email,
        'password': password,
      },
    );
    if (resource.hasError) {
      return Resource.failed(error: "Error on data source");
    }

    return Resource.success(data: resource.data);
  }

  @override
  Future<Resource<Map<String, dynamic>, String>> register(
      String email, String password, String passwordConfirmation) async {
    final resource = await _remoteClient.post(
      ApiRoutes.loginApiRoute,
      body: {
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation
      },
    );
    
    if (resource.hasError) {
      return Resource.failed(error: "Error on data source");
    }

    return Resource.success(data: resource.data);
  }
}
