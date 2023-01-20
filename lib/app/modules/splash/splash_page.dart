import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/app/modules/custom_navigation_bar/routers/custom_navigation_router.dart';
import 'package:todo_app/app/modules/profile/routers/profile_routers.dart';
import 'package:todo_app/app/modules/splash/splash_controller.dart';
import 'package:todo_app/app/shared/utils/assets/assets_utils.dart';

import '../../shared/utils/theme/i_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  var controller = Modular.get<SplashController>();

  bool showCircular = false;
  late AnimationController controllerAnimation;
  late Animation<Offset> offset;

  Future<void> initializer() async {
    log("Start Splash");
    await controller.startSplash();
  }

  @override
  void dispose() {
    super.dispose();
    log('[SPLASH] dispose');
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((Duration _) async {
      await initializer();
    });

    Future.delayed(
      const Duration(seconds: 4),
      () async {
        Modular.to.pushNamed(
          controller.authStore.isLogged
              ? CustomNavigationRouter.customNavigation.fullRoute
              : ProfileRouters.signin.fullRoute,
        );
      },
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
