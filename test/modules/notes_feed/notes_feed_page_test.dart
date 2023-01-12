import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:todo_app/app/modules/notes_feed/notes_feed_module.dart';
import 'package:todo_app/app/modules/notes_feed/notes_feed_page.dart';
import 'package:todo_app/app_module.dart';


void main() {

  setUpAll(() => {
        initModules([
          AppModule(),
          NotesFeedModule(),
        ]),
      });

  testWidgets('should be get the components of page NotesFeed',
      (widgetTester) async {
    //find all widgets do you need
    final titleComponent = find.byType(Observer);

    //execute the actual test
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: NotesFeedPage(),
      ),
    );

    expect(titleComponent, findsOneWidget);
  });
}
