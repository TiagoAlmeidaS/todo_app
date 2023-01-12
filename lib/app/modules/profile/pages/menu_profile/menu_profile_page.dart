import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_app/app/modules/components/todo_button_menu_profile/todo_button_menu_profile.dart';
import 'package:todo_app/app/modules/components/todo_title_page/todo_title_page.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class MenuProfilePage extends StatefulWidget {
  const MenuProfilePage({Key? key}) : super(key: key);

  @override
  State<MenuProfilePage> createState() => _MenuProfilePageState();
}

class _MenuProfilePageState extends State<MenuProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TodoTitlePage(firstLabel: "Welcome", secondLabel: "",),
            const SizedBox(height: 36,),
            Center(child: Image.asset("assets/images/profile1.png", width: MediaQuery.of(context).size.width * 0.3),),
            const SizedBox(height: 15,),
            Text("e-mail:", style: Modular.get<ITodoTheme>().hintTextMenuProfile,),
            const SizedBox(height: 2,),
            Text("tiagotigore@hotmail.com", style: Modular.get<ITodoTheme>().labelTextMenuProfile,),
            const SizedBox(height: 60,),
            TodoButtonMenuProfile(nameButton: "Who i am?", iconData: LineAwesomeIcons.identification_card, onTap: () {},),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider(),),
            TodoButtonMenuProfile(nameButton: "Contact us", iconData: LineAwesomeIcons.phone, onTap: () {},),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider(),),
            TodoButtonMenuProfile(nameButton: "Logout", iconData: LineAwesomeIcons.alternate_sign_out, onTap: () {},),

          ],
        ),
      ),
    );
  }
}
