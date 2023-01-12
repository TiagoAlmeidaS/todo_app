import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class TodoShimmer extends StatelessWidget {
  const TodoShimmer({
    Key? key,
    this.child,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  final Widget? child;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      period: const Duration(seconds: 1),
      loop: 50,
      gradient: LinearGradient(
        colors: [
          Modular.get<ITodoTheme>().shadesOfLight[300]!,
          Modular.get<ITodoTheme>().shadesOfLight[500]!,
          Modular.get<ITodoTheme>().shadesOfLight[300]!,
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Modular.get<ITodoTheme>().shadesOfLight[500],
        ),
        child: child,
      ),
    );
  }
}
