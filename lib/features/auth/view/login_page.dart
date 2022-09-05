import 'package:flutter/material.dart';
import 'package:flutter_demo/features/auth/view/login_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                onChanged: _controller.setEmail,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Senha",
                ),
                onChanged: _controller.setPassword,
              ),
              ElevatedButton(
                onPressed: _controller.isFormValid
                    ? () async {
                        final resource = await _controller.login();
                        if (resource.hasError) {
                          // mostra um dialog
                        }
                        await Modular.to.pushNamed("/home/");
                      }
                    : null,
                child: const Text("Entrar"),
              )
            ],
          );
        },
      ),
    );
  }
}
