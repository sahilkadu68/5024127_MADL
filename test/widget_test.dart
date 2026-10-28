import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../Week01_setup/main.dart' as setup;
import '../Week02_hello_world/main.dart' as hello;
import '../Week03_common_widgets/main.dart' as widgets;
import '../Week04_form/main.dart' as form;
import '../Week05_layout/main.dart' as layout;
import '../Week06_icons_images_chart/main.dart' as media;
import '../Week07_navigation_gestures/main.dart' as navigation;
import '../Week08_file_handling/main.dart' as files;
import '../Week09_firebase_realtime_database/main.dart' as firebase;

void main() {
  testWidgets('Weeks 1 to 8 render', (tester) async {
    for (final start in [
      setup.main,
      hello.main,
      widgets.main,
      form.main,
      layout.main,
      media.main,
      navigation.main,
      files.main,
    ]) {
      start();
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    }
  });
  testWidgets('Form rejects empty fields and submits valid values', (
    tester,
  ) async {
    form.main();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Submit'));
    await tester.pump();
    expect(find.text('Required'), findsOneWidget);
    expect(find.text('Enter valid email'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).at(0), 'Student');
    await tester.enterText(
      find.byType(TextFormField).at(1),
      'student@example.com',
    );
    await tester.tap(find.text('Submit'));
    await tester.pump();
    expect(find.text('Submitted'), findsOneWidget);
  });
  testWidgets('Navigation opens second screen and handles tap', (tester) async {
    navigation.main();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Go to screen two'));
    await tester.pumpAndSettle();
    expect(find.text('Screen Two'), findsOneWidget);
    await tester.tap(find.text('Tap me'));
    await tester.pump();
    expect(find.text('Tapped!'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Screen One'), findsOneWidget);
  });
  testWidgets('Firebase clearly reports missing configuration', (tester) async {
    await firebase.main();
    await tester.pumpAndSettle();
    expect(
      find.textContaining('Firebase configuration missing'),
      findsOneWidget,
    );
  });
}
