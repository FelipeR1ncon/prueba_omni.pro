import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pagination/presentation/widgets/item_photo.dart';

void main() {
  setUp(() {
    HttpOverrides.global = null;
  });

  group('ItemPhotoWidget', () {
    testWidgets('should display title and thumbnail',
        (WidgetTester tester) async {
      // arrange
      const title = 'Photo Title';
      const thumbnailUrl = 'https://example.com/photo-thumbnail.jpg';

      // act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ItemPhotoWidget(
              title: title,
              thumbnailUrl: thumbnailUrl,
            ),
          ),
        ),
      );

      // assert
      expect(find.text(title), findsOneWidget);
      expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is Image &&
                widget.image is NetworkImage &&
                (widget.image as NetworkImage).url == thumbnailUrl,
          ),
          findsOneWidget);
    });

    testWidgets('should limit title to 4 lines', (WidgetTester tester) async {
      // arrange
      const title =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse porttitor, lorem ac euismod feugiat, dolor leo auctor massa, vel consectetur mauris quam a mauris.';
      const thumbnailUrl = 'https://example.com/photo-thumbnail.jpg';

      // act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ItemPhotoWidget(
              title: title,
              thumbnailUrl: thumbnailUrl,
            ),
          ),
        ),
      );

      // assert
      expect(find.text(title), findsOneWidget);
      final Text titleWidget = tester.widget(find.text(title));
      expect(titleWidget.maxLines, equals(4));
      expect(titleWidget.overflow, equals(TextOverflow.ellipsis));
    });
  });
}
