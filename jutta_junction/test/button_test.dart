import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jutta_junction/pages/login_page.dart';

void main() {
  testWidgets('Button test', (WidgetTester tester) async {
    // Build the button widget
    Widget button = MaterialApp(
      home: Scaffold(
        body: ElevatedButton(
          onPressed: () {
            print('Login');
          },
          child: Text('Login'),
        ),
      ),
    );

    // Add the button to the tester
    await tester.pumpWidget(button);

    // Verify that the button is displayed
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Tap the button
    await tester.tap(find.byType(ElevatedButton));

    // Verify that the button was tapped
    expect(find.text('Login'), findsOneWidget);
  });
}
