import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/app/modules/notes_feed/routers/notes_feed_routers.dart';
import 'package:todo_app/app/shared/utils/assets/assets_utils.dart';

import '../../shared/utils/theme/i_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  bool showCircular = false;
  late AnimationController controllerAnimation;
  late Animation<Offset> offset;

  @override
  void initState() {

    Future.delayed(
      const Duration(seconds: 4),
      () => Modular.to.pushNamed(
        NotesFeedRouters.myNotes.fullRoute,
      ),
    );

    controllerAnimation =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    offset = Tween(begin: Offset.zero, end: const Offset(0.0, 1.0))
        .animate(controllerAnimation);

    controllerAnimation.reverse();
    Timer(
      const Duration(seconds: 2),
          () => setState(
            () {
          showCircular = true;
          controllerAnimation.forward();
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      child: SlideTransition(
        position: offset,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(logoSvg),
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              height: showCircular ? 20 : 0,
            ),
            AnimatedOpacity(
              opacity: showCircular ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: CircularProgressIndicator(
                color: Modular.get<ITodoTheme>().primaryColorMain,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
