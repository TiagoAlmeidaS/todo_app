import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/app/modules/components/todo_button/todo_button_component.dart';
import 'package:todo_app/app/modules/profile/pages/signup/signup_controller.dart';
import 'package:todo_app/app/modules/profile/routers/profile_routers.dart';
import 'package:todo_app/app/shared/utils/assets/assets_utils.dart';

import '../../../../shared/utils/theme/i_theme.dart';
import '../../../components/todo_text_form_field/todo_text_form_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var controller = Modular.get<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(logoSvg),
          const SizedBox(
            height: 20,
          ),
          TodoTextFormField(
            label: "E-mail: ",
            enabled: true,
            hintText: "example@gmail.com",
            rulesOnChange: controller.emailRulesOnChange,
          ),
          const SizedBox(
            height: 8,
          ),
          const TodoTextFormField(
            label: "Password: ",
            enabled: true,
            hintText: "123456",
          ),
          const TodoTextFormField(
            label: "Confirm the password: ",
            enabled: true,
            hintText: "123456",
          ),
          const SizedBox(
            height: 20,
          ),
          const TodoButton(label: "Register"),
          Text(
            "Register with google: ",
            style: Modular.get<ITodoTheme>().labelSignin,
            textAlign: TextAlign.center,
          ),
          const TodoButton(
              label: "Google", state: TodoButtonState.standardOutlined),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do you have an account? ",
                  style: Modular.get<ITodoTheme>().labelSignin,
                ),
                GestureDetector(
                  child: Text(
                    "Signin",
                    style: Modular.get<ITodoTheme>().labelLink,
                    textAlign: TextAlign.right,
                  ),
                  onTap: () {
                    Modular.to.pushReplacementNamed(
                      ProfileRouters.signin.fullRoute,
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
