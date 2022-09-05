import 'package:flutter_demo/core/generics/resource.dart';
import 'package:flutter_demo/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Resource<UserEntity, String>> login(String email, String password);
}
