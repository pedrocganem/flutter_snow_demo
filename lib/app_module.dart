import 'package:flutter_demo/core/adapters/remote_client.dart';
import 'package:flutter_demo/features/auth/auth_module.dart';
import 'package:flutter_demo/features/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Navegação
// Injeção de Dependencia

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<RemoteClient>((i) => RemoteClientImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          "/",
          module: AuthModule(),
        ),
        ModuleRoute(
          "/home/",
          module: HomeModule(),
        ),
      ];
}
