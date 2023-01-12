import 'package:todo_app/app/shared/routers/navigation_routers.dart';

class TasksRoutes {
  static NavigationRouters tasks = NavigationRouters(
    'Tasks',
    '/tasks/',
    '/tasks/',
  );

  static NavigationRouters searchTask = NavigationRouters(
    'Search task',
    '/searchTask/',
    '/tasks/searchTask/',
  );
}
