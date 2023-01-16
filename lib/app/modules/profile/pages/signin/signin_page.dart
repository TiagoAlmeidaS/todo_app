import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/components/todo_button/todo_button_component.dart';
import 'package:todo_app/app/modules/components/todo_flush_bar/todo_flush_bar.dart';
import 'package:todo_app/app/modules/components/todo_text_form_field/todo_text_form_field.dart';
import 'package:todo_app/app/modules/profile/pages/signin/signin_controller.dart';
import 'package:todo_app/app/modules/profile/routers/profile_routers.dart';
import 'package:todo_app/app/shared/utils/assets/assets_utils.dart';
import 'package:todo_app/app/shared/utils/enum/todo_enum.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

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
        SvgPicture.asset(logoSvg),
        const SizedBox(
          height: 10,
        ),
        TodoTextFormField(
          label: "E-mail: ",
          enabled: true,
          hintText: "example@gmail.com",
          rulesOnChange: controller.emailRulesOnChange,
          keyboardType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
        ),
        const SizedBox(
          height: 5,
        ),
        TodoTextFormField(
          label: "Password: ",
          enabled: true,
          hintText: "123456",
          rulesOnChange: controller.passwordRulesOnChange,
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: GestureDetector(
            child: Text(
              "Forget password?",
              style: Modular.get<ITodoTheme>().labelLink,
              textAlign: TextAlign.right,
            ),
            onTap: () {},
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Observer(
          builder: (context) {
            return TodoButton(
              label: "Login",
              state: controller.signOutputObservable?.status ==
                      FutureStatus.pending
                  ? TodoButtonState.loadingFilledDark
                  : controller.isValidButton
                      ? TodoButtonState.disabled
                      : TodoButtonState.standardFilledDark,
              onTap: () async {
                controller.login();
                await controller.signOutputObservable?.whenComplete(
                  () => controller.signOutputObservable?.value?.fold(
                    (l) => TodoFlushBar(
                        color: FlushBarColor.ERROR, message: l.message),
                    (r) => Modular.to.pushNamed("/custom_navigation_bar"),
                  ),
                );
              },
            );
          },
        ),
        Text(
          "Login with google:",
          style: Modular.get<ITodoTheme>().labelSignin,
        ),
        TodoButton(
          label: "Google",
          state: TodoButtonState.disabled,
          onTap: () {},
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login with google: ",
                style: Modular.get<ITodoTheme>().labelSignin,
              ),
              GestureDetector(
                child: Text(
                  "Register",
                  style: Modular.get<ITodoTheme>().labelLink,
                  textAlign: TextAlign.right,
                ),
                onTap: () {
                  Modular.to.pushReplacementNamed(
                    ProfileRouters.welcome.fullRoute,
                  );
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}
