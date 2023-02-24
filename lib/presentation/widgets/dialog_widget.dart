import 'package:flutter/material.dart';
import '/presentation/widgets/button_widget.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {Key? key,
      required this.title,
      required this.message,
      required this.icon,
      this.onPressed,
      this.onPressedClosed,
      this.textButton})
      : super(key: key);

  final String title;
  final String message;
  final Widget icon;
  final String? textButton;
  final Function()? onPressed;
  final Function()? onPressedClosed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: size.width * 0.89,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () => onPressedClosed?.call(),
                  icon: const Icon(
                    Icons.close,
                    size: 32,
                  )),
            ),
            icon,
            SizedBox(height: size.height * 0.02),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              message,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Visibility(
              visible: onPressed != null,
              child: SizedBox(
                  width: size.width * 0.60,
                  height: 48,
                  child: ButtonWidget(
                    onPressed: () => onPressed?.call(),
                    textButton: textButton ?? '',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
