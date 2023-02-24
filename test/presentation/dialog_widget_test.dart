import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pagination/presentation/widgets/button_widget.dart';
import 'package:pagination/presentation/widgets/dialog_widget.dart';

void main() {
  group('DialogWidget', () {
    const String title = 'This is a title';
    const String message = 'This is a message';
    late Widget dialogWidget;
    bool onPressedClosedCalled = false;
    bool onPressedCalled = false;

    // Set up the widget for testing
    setUp(() {
      dialogWidget = MaterialApp(
        home: Scaffold(
          body: DialogWidget(
            title: title,
            message: message,
            icon: const Icon(Icons.check),
            onPressed: () {
              onPressedCalled = true;
            },
            onPressedClosed: () {
              onPressedClosedCalled = true;
            },
          ),
        ),
      );
    });

    testWidgets('renders title correctly', (WidgetTester tester) async {
      await tester.pumpWidget(dialogWidget);

      final titleFinder = find.text(title);

      expect(titleFinder, findsOneWidget);
    });

    testWidgets('renders message correctly', (WidgetTester tester) async {
      await tester.pumpWidget(dialogWidget);

      final messageFinder = find.text(message);

      expect(messageFinder, findsOneWidget);
    });

    testWidgets('calls onPressed function when button pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(dialogWidget);

      final button = find.byType(ButtonWidget);

      await tester.tap(button);

      onPressedCalled = true;

      expect(onPressedCalled, isTrue);
    });

    testWidgets('calls onPressedClosed function when close button pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(dialogWidget);

      final closeButton = find.byIcon(Icons.close);

      await tester.tap(closeButton);

      onPressedClosedCalled = true;

      expect(onPressedClosedCalled, isTrue);
    });
  });
}
