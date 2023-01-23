import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/components/todo_button/todo_button_component.dart';
import 'package:todo_app/app/modules/components/todo_calendary/todo_calendary.dart';
import 'package:todo_app/app/modules/components/todo_flush_bar/todo_flush_bar.dart';
import 'package:todo_app/app/modules/components/todo_text_area/todo_text_area.dart';
import 'package:todo_app/app/modules/components/todo_text_form_field/todo_text_form_field.dart';
import 'package:todo_app/app/modules/components/todo_title_page/todo_title_page.dart';
import 'package:todo_app/app/modules/tasks/pages/task/models/tasks_model.dart';
import 'package:todo_app/app/modules/tasks/pages/task/task_controller.dart';
import 'package:todo_app/app/shared/utils/enum/todo_enum.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({
    Key? key,
    this.taskModel,
    this.isVisualization,
  }) : super(key: key);

  final TaskModel? taskModel;
  final bool? isVisualization;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var controller = Modular.get<TaskController>();

  @override
  initState() {
    if (widget.taskModel?.id?.isNotEmpty ?? false) {
      controller.initTaskModel(widget.taskModel, widget.isVisualization);
    } else {
      controller.isToEdit = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Observer(builder: (context) {
        return Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  if (controller.isToEdit) ...{
                    TodoTitlePage(
                      firstLabel: "",
                      secondLabel: "Task",
                      icon: LineAwesomeIcons.trash,
                      actionIcon: () => controller.deleteTask,
                      status: (!controller.isVisualization &&
                              widget.taskModel == null)
                          ? TodoTitlePageStatus.disabled
                          : TodoTitlePageStatus.fillRoundedDanger,
                      iconSize: 25,
                    ),
                  } else ...{
                    TodoTitlePage(
                      firstLabel: "",
                      secondLabel: "Task",
                      icon: LineAwesomeIcons.pen,
                      actionIcon: () => {
                        controller.isToEdit = !controller.isToEdit,
                        controller.isVisualization = false
                      },
                      status: widget.taskModel == null
                          ? TodoTitlePageStatus.disabled
                          : TodoTitlePageStatus.fillRounded,
                      iconSize: 25,
                    ),
                  },
                  const SizedBox(
                    height: 20,
                  ),
                  TodoTextFormField(
                    label: "Título",
                    enabled: !controller.isVisualization,
                    hintText: "ex: João",
                    rulesOnChange: controller.titleRulesOnChange,
                    // ignore: deprecated_member_use_from_same_package
                    controller: controller.titleController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.maxFinite,
                    child: Text(
                      "Descrição",
                      style: Modular.get<ITodoTheme>().labelTodoTextFormField,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  TodoTextArea(
                    enable: !controller.isVisualization,
                    maxLines: 3,
                    hintText: "Escreva uma descrição aqui...",
                    controller: controller.descriptionController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.maxFinite,
                    child: Text(
                      "Data para finalizar",
                      style: Modular.get<ITodoTheme>().labelTodoTextFormField,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  TodoCalendary(
                    disable: controller.isVisualization,
                    isMinBoard: true,
                    timerNow: controller.timerNowFormmated,
                    initialSelectedTime: controller.dateInitModel,
                    selectDate: controller.isVisualization
                        ? (selectedDate) {}
                        : (selectedDate) =>
                            controller.setDateEnd(selectedDate!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            bottomBody(),
          ],
        );
      }),
    ));
  }

  Widget bottomBody() {
    return Column(
      children: controller.isToEdit || widget.taskModel == null
          ? [
              TodoButton(
                label: "Salvar",
                onTap: () async {
                  if (widget.taskModel == null) {
                    await controller.saveTask();
                    await controller.saveTaskObservable?.whenComplete(
                      () => controller.saveTaskObservable?.value?.fold(
                        (l) => TodoFlushBar(
                            color: FlushBarColor.ERROR, message: l.message),
                        (r) => Modular.to.pop(),
                      ),
                    );
                  } else {
                    controller.updateTask(controller.taskModel.id ?? "");
                    controller.saveTaskObservable?.whenComplete(
                      () => controller.saveTaskObservable?.value?.fold(
                        (l) => TodoFlushBar(
                            color: FlushBarColor.ERROR, message: l.message),
                        (r) => Modular.to.pop(),
                      ),
                    );
                  }
                },
                state: (controller.saveTaskObservable?.status ==
                        FutureStatus.pending)
                    ? TodoButtonState.loadingFilledDark
                    : TodoButtonState.standardFilledDark,
              ),
              TodoButton(
                label: "Cancelar",
                onTap: () {
                  Modular.to.pop();
                },
                state: TodoButtonState.standardOutlined,
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ]
          : [
              TodoButton(
                label: "Finalizar tarefa",
                onTap: () async {
                  await controller.completedTask(controller.taskModel);
                  await controller.saveTaskObservable?.whenComplete(
                    () => controller.saveTaskObservable?.value?.fold(
                      (l) => TodoFlushBar(
                          color: FlushBarColor.ERROR, message: l.message),
                      (r) => Modular.to.pop(),
                    ),
                  );
                },
                state: (controller.saveTaskObservable?.status ==
                        FutureStatus.pending)
                    ? TodoButtonState.loadingFilledSucess
                    : TodoButtonState.fillSucess,
              ),
              TodoButton(
                label: "Voltar",
                onTap: () {
                  Modular.to.pop();
                },
                state: TodoButtonState.standardOutlined,
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ],
    );
  }
}
