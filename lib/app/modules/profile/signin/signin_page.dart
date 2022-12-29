import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/components/todo_button/todo_button_component.dart';
import 'package:todo_app/app/modules/profile/signin/signin_controller.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  var controller = Modular.get<SigninController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: TodoButton(
            label: "Registrar-se",
            state: TodoButtonState.standardOutlined,
            onTap: () {
              controller.validatorSignin();
            },
          ),
        ),
      ],
    ));
  }
}
