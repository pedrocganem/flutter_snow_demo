import 'package:flutter_demo/features/home/view/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Navegação
// Injeção de Dependencia

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(
            title: "Home Page",
          ),
        ),
      ];
}
