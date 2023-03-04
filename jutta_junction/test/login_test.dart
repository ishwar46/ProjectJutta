import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jutta_junction/pages/login_page.dart';

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

// void main() {
//   group('LoginScreen', () {
//     testWidgets('valid email and password should trigger login',
//         (WidgetTester tester) async {
//       // Setup
//       var loggedIn = false;
//       final loginScreen = LoginScreen();

//       // Pump the widget tree
//       await tester.pumpWidget(loginScreen);

//       // Fill in email and password text fields
//       await tester.enterText(
//           find.byType(TextFormField).at(0), 'test@example.com');
//       await tester.enterText(find.byType(TextFormField).at(1), 'password');

//       // Tap the login button
//       await tester.tap(find.widgetWithText(ElevatedButton, 'Log In'));
//       await tester.pumpAndSettle();

//       // Check if the login was triggered
//       expect(loggedIn, isTrue);
//     });

//     testWidgets('invalid email and password should not trigger login',
//         (WidgetTester tester) async {
//       // Setup
//       var loggedIn = false;
//       final loginScreen = LoginScreen();

//       // Pump the widget tree
//       await tester.pumpWidget(loginScreen);

//       // Fill in invalid email and password text fields
//       await tester.enterText(find.byType(TextFormField).at(0), 'invalidemail');
//       await tester.enterText(find.byType(TextFormField).at(1), 'short');

//       // Tap the login button
//       await tester.tap(find.widgetWithText(ElevatedButton, 'Log In'));
//       await tester.pumpAndSettle();

//       // Check if the login was not triggered
//       expect(loggedIn, isFalse);
//     });
//   });
// }
