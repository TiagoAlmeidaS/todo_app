import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class TodoButtonMenuProfile extends StatelessWidget {
  const TodoButtonMenuProfile({
    Key? key,
    this.onTap,
    this.padding,
    this.margin,
    required this.iconData,
    required this.nameButton,
  }) : super(key: key);

  final Function()? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final IconData iconData;
  final String nameButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin ??
            const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 30,
              color: Modular.get<ITodoTheme>().shadesOfDark[500],
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              nameButton,
              style: Modular.get<ITodoTheme>().todoButtonMenuProfile,
            )
          ],
        ),
      ),
    );
  }
}
