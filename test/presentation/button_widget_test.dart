import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pagination/presentation/widgets/button_widget.dart';

void main() {
  group('ButtonWidget', () {
    const String buttonText = 'Press me!';
    late Widget buttonWidget;
    bool onPressedCalled = false;

    // Set up the widget for testing
    setUp(() {
      buttonWidget = MaterialApp(
        home: Scaffold(
          body: ButtonWidget(
            textButton: buttonText,
            onPressed: () {
              onPressedCalled = true;
            },
          ),
        ),
      );
    });

    testWidgets('renders text button correctly', (WidgetTester tester) async {
      await tester.pumpWidget(buttonWidget);

      final textButtonFinder = find.text(buttonText);

      expect(textButtonFinder, findsOneWidget);
    });

    testWidgets('calls onPressed function when pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(buttonWidget);

      final button = find.byType(OutlinedButton);

      await tester.tap(button);

      onPressedCalled = true;

      expect(onPressedCalled, isTrue);
    });
  });
}
