import 'package:flutter_demo/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_demo/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_demo/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_demo/features/auth/domain/use_cases/login_user_use_case.dart';
import 'package:flutter_demo/features/auth/view/login_controller.dart';
import 'package:flutter_demo/features/auth/view/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
// Navegação
// Injeção de Dependencia

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<AuthRemoteDataSource>((i) => AuthRemoteDataSourceImpl()),
        Bind<AuthRepository>((i) => AuthRepositoryImpl()),
        Bind<LoginUserUseCase>((i) => LoginUserUseCaseImpl()),
        Bind<LoginController>((i) => LoginController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: ((context, args) => const LoginPage())),
      ];
}
