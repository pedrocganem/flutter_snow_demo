import 'package:flutter_demo/core/generics/resource.dart';
import 'package:flutter_demo/features/auth/domain/use_cases/login_user_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final _loginUserUseCase = Modular.get<LoginUserUseCase>();
  @observable
  String email = "";

  @observable
  String password = "";

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  @action
  Future<Resource<void, String>> login() async {
    final resource = await _loginUserUseCase.call(email, password);
    if(resource.hasError) {
      return Resource.failed(error: "error on controller");
    }
    return Resource.success();
  }
}
