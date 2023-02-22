import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jutta_junction/pages/login_page.dart';

void main() {
  testWidgets('Icon test', (WidgetTester tester) async {
    // Build the icon widget
    Widget icon = MaterialApp(
      home: Scaffold(
        body: Icon(Icons.add),
      ),
    );

    // Add the icon to the tester
    await tester.pumpWidget(icon);

    // Verify that the icon is displayed
    expect(find.byType(Icon), findsOneWidget);
  });
}
