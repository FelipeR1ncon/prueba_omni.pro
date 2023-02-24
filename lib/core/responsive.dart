import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double mobileMaxWidth = 576;
  static const double tabletMaxWidth = 768;
  static const double desktopMaxWidth = 992;

  /// Devuelve la url indicando el tamanio segun el dispositivo actual
  static  String getThumbnailUrlByCurrentDevice(BuildContext context, String url) {
    double currentWith = MediaQuery.of(context).size.width;

    if (currentWith <= mobileMaxWidth) {
      return url.replaceFirst('150', '100');
    }

    if (currentWith <= tabletMaxWidth) {
      return url;
    }

    // desktopMaxWidth
    return url.replaceFirst('150', '200');
  }
}
