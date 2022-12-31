import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_app/app/modules/components/todo_card_note/todo_card_note.dart';
import 'package:todo_app/app/modules/components/todo_circle_button/todo_circle_button.dart';
import 'package:todo_app/app/modules/components/todo_title_page/todo_title_page.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class MyNotesPage extends StatefulWidget {
  const MyNotesPage({Key? key}) : super(key: key);

  @override
  State<MyNotesPage> createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: TodoTitlePage(
                  margin: EdgeInsets.zero,
                  firstLabel: "Note",
                  secondLabel: "Feed",
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "History Note",
                    style: Modular.get<ITodoTheme>().headerLabel,
                  ),
                  TodoCircleButton(
                    icon: LineAwesomeIcons.search,
                    margin: EdgeInsets.zero,
                    onTap: () => {},
                  )
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              const TodoCardNote(
                titleCard: "Exemplo 1",
                descriptionCard: "Testando dois parâmetros aqui.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
