import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:exp10/main.dart'; // Adjust this based on your file path

void main() {
  testWidgets('shows loading indicator while fetching data', (tester) async {
    // Build the widget
    await tester.pumpWidget(MyApp());

    // Assert: Check if CircularProgressIndicator is shown (loading state)
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
