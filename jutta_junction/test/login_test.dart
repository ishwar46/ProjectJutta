import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jutta_junction/pages/login_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Text form field test', (WidgetTester tester) async {
    // Build the text form field widget
    Widget textFormField = MaterialApp(
      home: Scaffold(
        body: TextFormField(),
      ),
    );

    // Add the text form field to the tester
    await tester.pumpWidget(textFormField);

    // Verify that the text form field is displayed
    expect(find.byType(TextFormField), findsOneWidget);

    // Enter some text into the text form field
    await tester.enterText(find.byType(TextFormField), 'ishwar@gmail.com');

    // Verify that the text was entered correctly
    expect(find.text('ishwar@gmail.com'), findsOneWidget);
  });
}
