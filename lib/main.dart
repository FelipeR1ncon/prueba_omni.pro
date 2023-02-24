import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/presentation/list_photos_page.dart';
import 'core/injection_container.dart';

void main() {
  configureDependencies();
  runZonedGuarded(() {
    runApp(ProviderScope(
        child: MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                  elevation: 1,
                  backgroundColor: Colors.amber,
                  title: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Lista de fotos'),
                  ),
                ),
                body: const ListPhotosPage()))));
  }, (error, stack) {
    /// Report error with firebase crashlytics or sentry etc ....
  });
}
