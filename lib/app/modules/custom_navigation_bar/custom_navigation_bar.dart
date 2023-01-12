import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:todo_app/app/modules/notes_feed/notes_feed_page.dart';
import 'package:todo_app/app/modules/notes_feed/routers/notes_feed_routers.dart';
import 'package:todo_app/app/modules/tasks/routers/tasks_routers.dart';
import 'package:todo_app/app/modules/tasks/tasks_page.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {

  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent
        ),
        child: PersistentTabView(
          context,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Modular.get<ITodoTheme>().shadesOfDark[500]!.withOpacity(0.16),
                offset: const Offset(0, 2),
                blurRadius: 2,
              ),
            ],
            colorBehindNavBar: Colors.transparent
          ),
          controller: _controller,
          confineInSafeArea: true,
          screens: const [
            NotesFeedPage(),
            TasksPage(),
            // ProfilePage(),
          ],
          items: _navBarsItems(),
          navBarStyle: NavBarStyle.style9,
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(LineAwesomeIcons.sticky_note),
        title: (NotesFeedRouters.notesFeed.pageTitle),
        activeColorPrimary: Modular.get<ITodoTheme>().primaryColorMain,
        inactiveColorPrimary: Modular.get<ITodoTheme>().secondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(LineAwesomeIcons.check_circle),
        title: (TasksRoutes.tasks.pageTitle),
        activeColorPrimary: Modular.get<ITodoTheme>().primaryColorMain,
        inactiveColorPrimary: Modular.get<ITodoTheme>().secondaryColor,
      ),
    ];
  }
}
