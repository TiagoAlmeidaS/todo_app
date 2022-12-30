import 'package:todo_app/app/shared/routers/navigation_routers.dart';

class ProfileRouters {
  static NavigationRouters signin = NavigationRouters(
    "Signin",
    "/signin",
    "/profile/signin",
  );
  static NavigationRouters signup = NavigationRouters(
    "Signup",
    "/signup",
    "/profile/signup",
  );
}
