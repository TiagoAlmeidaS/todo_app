import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/components/todo_button/todo_button_component.dart';
import 'package:todo_app/app/modules/components/todo_note_field/todo_note_field.dart';
import 'package:todo_app/app/modules/components/todo_text_area/todo_text_area.dart';
import 'package:todo_app/app/modules/notes_feed/pages/note/note_controller.dart';

import 'models/note_model.dart';

class NotePage extends StatefulWidget {
  const NotePage({
    Key? key,
    this.noteModel
  }) : super(key: key);

  final NoteModel? noteModel;

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {

  var controller = Modular.get<NoteController>();

  @override
  void initState() {
    controller.initValues(widget.noteModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child: Column(
          children: [
             TodoNoteField(
              hintText: "Título aqui...",
              controller: controller.titleController,
            ),
            const SizedBox(
              height: 10,
            ),
            TodoTextArea(
              hintText: "Escreva a descrição aqui...",
              maxLength: 1500,
              maxLines: 20,
              controller: controller.descriptionController,
            ),
            const TodoButton(
              label: "Salvar",
              state: TodoButtonState.standardFilledDark,
              margin: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
            ),
            TodoButton(
              label: "Cancelar",
              state: TodoButtonState.standardOutlined,
              margin: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              onTap: () => Modular.to.pop(),
            ),
          ],
        ),),
      ),
    );
  }
}
