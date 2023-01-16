import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/app/modules/components/todo_button/todo_button_component.dart';
import 'package:todo_app/app/modules/components/todo_text_form_field/todo_text_form_field.dart';
import 'package:todo_app/app/modules/profile/pages/welcome/welcome_controller.dart';
import 'package:todo_app/app/modules/profile/routers/profile_routers.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

import '../../../../shared/utils/assets/assets_utils.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var controller = Modular.get<WelcomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(logoSvg),
              Column(
                children: [
                  Text(
                    "Olá, seja bem vindo!",
                    style: Modular.get<ITodoTheme>().headerProfile,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Como podemos lhe chamar?",
                    style: Modular.get<ITodoTheme>().descriptionProfile,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TodoTextFormField(
                    hintText: "Ex: João",
                    helperFixInfoMessage: controller.helperHint,
                    rulesOnChange: controller.nameRulesOnChange,
                    rulesOnLeave: controller.nameRulesOnLeave,
                    withShadow: true,
                    enabled: true,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Agora vamos seguir com o cadastro?",
                    style: Modular.get<ITodoTheme>().descriptionProfile,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Text(
                    "Não se preocupa... é rapidinho!",
                    style: Modular.get<ITodoTheme>().helperProfile,
                    textAlign: TextAlign.start,
                  ),
                  TodoButton(
                    label: "Continuar",
                    onTap: () {
                      controller.saveName();
                      Modular.to.pushNamed(ProfileRouters.signup.fullRoute);
                    },
                    state: (controller.isValidButton ?? false)
                        ? TodoButtonState.standardOutlined
                        : TodoButtonState.disabled,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
