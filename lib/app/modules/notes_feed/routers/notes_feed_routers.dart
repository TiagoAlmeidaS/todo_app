import 'package:todo_app/app/shared/routers/navigation_routers.dart';

class NotesFeedRouters {

  static NavigationRouters notesFeed = NavigationRouters(
    "NotesFeed",
    "/notes_feed/",
    "/notes_feed/",
  );

  static NavigationRouters note = NavigationRouters(
    "MyNotes",
    "/note/",
    "/notes_feed/note",
  );

}