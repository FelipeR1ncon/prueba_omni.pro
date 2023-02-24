import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pagination/core/responsive.dart';

/// Widget that paints each photo item with its title and thumbnail
class ItemPhotoWidget extends StatelessWidget {
  const ItemPhotoWidget(
      {Key? key, required this.title, required this.thumbnailUrl})
      : super(key: key);

  final String title;
  final String thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
              height: height * 0.12,
              width: height * 0.12,
              child: Image.network(
                ResponsiveUtils.getThumbnailUrlByCurrentDevice(
                    context, thumbnailUrl),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(width: width * 0.06),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        )),
        SizedBox(width: width * 0.06),
      ],
    );
  }
}
