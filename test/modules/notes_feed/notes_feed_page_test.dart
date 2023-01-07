import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:todo_app/app/modules/notes_feed/notes_feed_module.dart';
import 'package:todo_app/app/modules/notes_feed/notes_feed_page.dart';
import 'package:todo_app/app_module.dart';

import '../../shared/services/http_client/http_client_test.mocks.dart';

void main(){
  MockHttpClient httpClient;

  setUp(() => {
    httpClient = MockHttpClient(),
    initModules([
      AppModule(),
      NotesFeedModule(),
    ])
  });

  
  testWidgets('should be get the components of page NotesFeed', (widgetTester) async {

    //find all widgets do you need
    final titleComponent = find.byKey(const ValueKey('titleComponent'));

    //execute the actual test
    await widgetTester.pumpWidget(MaterialApp(
    home: NotesFeedPage(),
    ),);

    await widgetTester.pump();

    expect(titleComponent, findsOneWidget);
  });

}